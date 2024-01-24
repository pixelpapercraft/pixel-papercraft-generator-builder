open Dom2

type t = {
  standardWidth: int,
  standardHeight: int,
  imageWithCanvas: Generator_ImageWithCanvas.t,
}

let make = (image, standardWidth, standardHeight): t => {
  let imageWithCanvas = Generator_ImageWithCanvas.makeFromImage(image)
  let texture = {
    standardWidth,
    standardHeight,
    imageWithCanvas,
  }
  texture
}

let makeFromUrl = (url, standardWidth, standardHeight) =>
  Generator_ImageFactory.makeFromUrl(url)->Promise.thenResolve(image =>
    make(image, standardWidth, standardHeight)
  )

type flip = [#None | #Horizontal | #Vertical]
type rotate = [#None | #Corner(float) | #Center(float)]
type blend = [#None | #MultiplyHex(string) | #MultiplyRGB(int, int, int)]

type drawNearestNeighborOptions = {rotate: rotate, flip: flip, blend: blend, pixelate: bool}

@val external parseInt: (string, int) => float = "parseInt"

let parseHex = (hex: string) => {
  let hex = if Js.String2.startsWith(hex, "#") {
    Js.String2.substr(hex, ~from=1)
  } else {
    hex
  }
  if Js.String2.length(hex) == 6 {
    let f = parseInt(hex, 16)
    if Js.Float.isNaN(f) {
      None
    } else {
      let i = Belt.Float.toInt(f)
      Some(i)
    }
  } else {
    None
  }
}

let shift: (int, int) => int = %raw(`
    function shift(value, shift) {
      return value >> shift & 255
    }
  `)

let hexToRGB = (hex: string) => {
  switch parseHex(hex) {
  | None => None
  | Some(value) => {
      let r = shift(value, 16)
      let g = shift(value, 8)
      let b = shift(value, 0)
      Some((r, g, b))
    }
  }
}

let blendColors = (r1: int, g1: int, b1: int, r2: int, g2: int, b2: int) => (
  (Belt.Int.toFloat(r1) *. Belt.Int.toFloat(r2) /. 255.0)->Belt.Float.toInt,
  (Belt.Int.toFloat(g1) *. Belt.Int.toFloat(g2) /. 255.0)->Belt.Float.toInt,
  (Belt.Int.toFloat(b1) *. Belt.Int.toFloat(b2) /. 255.0)->Belt.Float.toInt,
)

// Scale (dw, dh) so it fits inside (sw, sh)
let fit = (sw, sh, dw, dh) => {
  let wScale = Belt.Int.toFloat(sw) /. Belt.Int.toFloat(dw)
  let hScale = Belt.Int.toFloat(sh) /. Belt.Int.toFloat(dh)
  let scale = Js.Math.min_float(wScale, hScale)
  let (w, h) = if scale < 1.0 {
    (Belt.Int.toFloat(dw) *. scale, Belt.Int.toFloat(dh) *. scale)
  } else {
    (Belt.Int.toFloat(dw), Belt.Int.toFloat(dh))
  }
  (Js.Math.ceil_int(w), Js.Math.ceil_int(h))
}

let preparePixelationCanvas = (sourceCanvas, sx, sy, sw, sh, dw, dh) => {
  let (sw2, sh2) = fit(sw, sh, dw, dh)
  let canvas = Generator_CanvasFactory.make(sw2, sh2)
  let context = Canvas.getContext2d(canvas)
  context->Context2d.setImageSmoothingEnabled(false)
  context->Context2d.drawCanvas(sourceCanvas, sx, sy, sw, sh, 0, 0, sw2, sh2)
  canvas
}

let drawNearestNeighbor = (
  texture: t,
  page: Generator_Page.t,
  sx,
  sy,
  sw,
  sh,
  dx,
  dy,
  dw,
  dh,
  options: drawNearestNeighborOptions,
) => {
  let (canvas, sx, sy, sw, sh, dx, dy, dw, dh) = if options.pixelate {
    let canvas = preparePixelationCanvas(
      texture.imageWithCanvas.canvasWithContext.canvas,
      sx,
      sy,
      sw,
      sh,
      dw,
      dh,
    )
    (canvas, 0, 0, Canvas.getWidth(canvas), Canvas.getHeight(canvas), dx, dy, dw, dh)
  } else {
    (texture.imageWithCanvas.canvasWithContext.canvas, sx, sy, sw, sh, dx, dy, dw, dh)
  }

  if sw > 0 && sh > 0 && dw > 0 && dh > 0 {
    let imageData = Context2d.getImageData(Canvas.getContext2d(canvas), sx, sy, sw, sh)
    let pix = imageData.data

    let tempCanvas = Generator_CanvasFactory.make(dw, dh)
    let tempContext = Canvas.getContext2d(tempCanvas)

    let deltax = Belt.Int.toFloat(dw) /. Belt.Int.toFloat(sw)
    let deltay = Belt.Int.toFloat(dh) /. Belt.Int.toFloat(sh)

    let pixw = Js.Math.floor(deltax)
    let pixh = Js.Math.floor(deltay)

    let pixw = Belt.Int.toFloat(pixw) < deltax ? pixw + 1 : pixw
    let pixh = Belt.Int.toFloat(pixh) < deltay ? pixh + 1 : pixh

    let blend = switch options.blend {
    | #None => None
    | #MultiplyHex(hex) => hexToRGB(hex)
    | #MultiplyRGB(r, g, b) => Some(r, g, b)
    }

    for y in 0 to sh - 1 {
      for x in 0 to sw - 1 {
        let tx = Belt.Int.toFloat(x) *. deltax
        let ty = Belt.Int.toFloat(y) *. deltay

        // Source pixel
        let i = (y * sw + x) * 4

        let r = Belt.Option.getWithDefault(pix[i + 0], 0)
        let g = Belt.Option.getWithDefault(pix[i + 1], 0)
        let b = Belt.Option.getWithDefault(pix[i + 2], 0)
        let a = Belt.Int.toFloat(Belt.Option.getWithDefault(pix[i + 3], 0)) /. 255.0

        let (r, g, b) = switch blend {
        | None => (r, g, b)
        | Some((r2, g2, b2)) => blendColors(r, g, b, r2, g2, b2)
        }

        Context2d.setFillStyleRGBA(tempContext, r, g, b, a)
        Context2d.fillRect(tempContext, Js.Math.floor(tx), Js.Math.floor(ty), pixw, pixh)
      }
    }

    let context = page.canvasWithContext.context

    // Save the current state of the page
    Context2d.save(context)

    // Move to the destination coordinate
    Context2d.translate(context, Belt.Int.toFloat(dx), Belt.Int.toFloat(dy))

    switch options.rotate {
    | #None => ()
    | #Corner(degrees) => {
        let radians = degrees *. Js.Math._PI /. 180.0
        Context2d.rotate(context, radians)
      }
    | #Center(degrees) => {
        let radians = degrees *. Js.Math._PI /. 180.0
        Context2d.translate(context, Belt.Int.toFloat(dw) /. 2.0, Belt.Int.toFloat(dh) /. 2.0)
        Context2d.rotate(context, radians)
        Context2d.translate(context, Belt.Int.toFloat(dw) /. -2.0, Belt.Int.toFloat(dh) /. -2.0)
      }
    }

    switch options.flip {
    | #None => ()
    | #Horizontal => {
        Context2d.translate(context, Belt.Int.toFloat(dw), 0.0)
        Context2d.scale(context, -1, 1)
      }
    | #Vertical => {
        Context2d.translate(context, 0.0, Belt.Int.toFloat(dh))
        Context2d.scale(context, 1, -1)
      }
    }

    Context2d.drawCanvasXY(context, tempCanvas, 0, 0)

    Context2d.restore(context)
  }
}

let draw = (
  texture: t,
  page: Generator_Page.t,
  sx,
  sy,
  sw,
  sh,
  dx,
  dy,
  dw,
  dh,
  ~flip: flip,
  ~rotate: rotate,
  ~blend: blend,
  ~pixelate: bool,
  (),
) => {
  if sh > 0 && dh > 0 && sw > 0 && dw > 0 {
    let sourceScaleX =
      Belt.Int.toFloat(texture.imageWithCanvas.width) /. Belt.Int.toFloat(texture.standardWidth)
    let sourceScaleY =
      Belt.Int.toFloat(texture.imageWithCanvas.height) /. Belt.Int.toFloat(texture.standardHeight)

    let sx = Js.Math.floor(Belt.Int.toFloat(sx) *. sourceScaleX)
    let sy = Js.Math.floor(Belt.Int.toFloat(sy) *. sourceScaleY)
    let sw = Js.Math.floor(Belt.Int.toFloat(sw) *. sourceScaleX)
    let sh = Js.Math.floor(Belt.Int.toFloat(sh) *. sourceScaleY)

    drawNearestNeighbor(
      texture,
      page,
      sx,
      sy,
      sw,
      sh,
      dx,
      dy,
      dw,
      dh,
      {rotate, flip, blend, pixelate},
    )
  }
}
