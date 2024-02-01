open Dom2

let hasValidSourceDimensions = (width: int, height: int) => {
  mod(width, 64) === 0 && width === height * 2
}

let makeImage = () => {
  Image.make()
}

let makeCanvas = (width: int, height: int) => {
  let canvas = Document.createCanvasElement(Window.document)
  Canvas.setWidth(canvas, width)
  Canvas.setHeight(canvas, height)
  canvas
}

let copy = (
  sourceCanvas: Canvas.t,
  destCanvas: Canvas.t,
  sx: int,
  sy: int,
  sw: int,
  sh: int,
  dx: int,
  dy: int,
  dw: int,
  dh: int,
  scale: float,
) => {
  let destContext = Canvas.getContext2d(destCanvas)
  destContext->Context2d.drawCanvas(
    sourceCanvas,
    Belt.Float.toInt(Js.Int.toFloat(sx) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(sy) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(sw) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(sh) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(dx) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(dy) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(dw) *. scale),
    Belt.Float.toInt(Js.Int.toFloat(dh) *. scale),
  )
}

let convertCallback = (source: Image.t, onSuccess: Image.t => unit, onError: exn => unit) => {
  let sw = Image.width(source)
  let sh = Image.height(source)

  // Ensure the source has a 2:1 ratio for width:height, and if not, return the original image
  if !hasValidSourceDimensions(sw, sh) {
    onSuccess(source)
  }

  // The destination image will be a square with the same
  // dimensions as the source width
  let dw = sw
  let dh = sw

  // Create the canvas and context
  let sCanvas = makeCanvas(sw, sh)
  let sContext = Canvas.getContext2dWithAlpha(sCanvas)
  let dCanvas = makeCanvas(dw, dh)
  let dContext = Canvas.getContext2dWithAlpha(dCanvas)

  // Draw the source image onto the top left corner of the source canvas
  Context2d.drawImageXY(sContext, source, 0, 0)

  // Also draw the source image onto the top left corner of the destination canvas
  Context2d.drawImageXY(dContext, source, 0, 0)

  // Determine the multiplication factor for when the source image
  // is a multiple of 64 pixels;
  let scale = Js.Int.toFloat(sw) /. 64.0

  // Save the current transformation state of the destination canvas
  Context2d.save(dContext)

  // Flip the destination canvas horizontally
  // so when we draw the new parts they will be flipped
  Context2d.translate(dContext, Belt.Int.toFloat(dw), 0.0)
  Context2d.scale(dContext, -1, 1)

  // Copying: Leg
  copy(sCanvas, dCanvas, 0, 20, 4, 12, 36, 52, 4, 12, scale) // Right
  copy(sCanvas, dCanvas, 4, 20, 4, 12, 40, 52, 4, 12, scale) // Front
  copy(sCanvas, dCanvas, 8, 20, 4, 12, 44, 52, 4, 12, scale) // Left
  copy(sCanvas, dCanvas, 12, 20, 4, 12, 32, 52, 4, 12, scale) // Back
  copy(sCanvas, dCanvas, 4, 16, 4, 4, 40, 48, 4, 4, scale) // Top
  copy(sCanvas, dCanvas, 8, 16, 4, 4, 36, 48, 4, 4, scale) // Bottom

  // Copying: Arm
  copy(sCanvas, dCanvas, 40, 20, 4, 12, 20, 52, 4, 12, scale) // Right
  copy(sCanvas, dCanvas, 44, 20, 4, 12, 24, 52, 4, 12, scale) // Front
  copy(sCanvas, dCanvas, 48, 20, 4, 12, 28, 52, 4, 12, scale) // Left
  copy(sCanvas, dCanvas, 52, 20, 4, 12, 16, 52, 4, 12, scale) // Back
  copy(sCanvas, dCanvas, 44, 16, 4, 4, 24, 48, 4, 4, scale) // Top
  copy(sCanvas, dCanvas, 48, 16, 4, 4, 20, 48, 4, 4, scale) // Bottom

  // Return the destination back to it's original unflipped state
  Context2d.restore(dContext)

  let dataUrl = Canvas.toDataUrlAsPng(dCanvas)
  let image = makeImage()
  let onLoad = () => onSuccess(image)
  image->Image.onLoad(onLoad)
  image->Image.onError(onError)
  image->Image.src(dataUrl)
}

let convert = (source: Image.t): Promise.t<Image.t> => {
  Promise.make((resolve, reject) => {
    let onSuccess = image => {
      resolve(. image)
    }
    let onError = exn => {
      reject(. exn)
    }
    convertCallback(source, onSuccess, onError)
  })
}
