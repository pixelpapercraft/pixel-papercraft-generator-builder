type context2d
type domMatrix

module Image = {
  type t = Dom.htmlImageElement

  type onLoadCallback = unit => unit
  type onErrorCallback = exn => unit

  @new external make: unit => t = "Image"
  @set external setSrc: (t, string) => unit = "src"
  @set external setOnLoad: (t, onLoadCallback) => unit = "onload"
  @set external setOnError: (t, onErrorCallback) => unit = "onerror"
  @get external getWidth: t => int = "width"
  @get external getHeight: t => int = "height"
}

module Context2d = {
  type t = context2d
  type imageData = {data: array<int>}

  @send
  external drawCanvas: (
    context2d,
    Dom.htmlCanvasElement,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
  ) => unit = "drawImage"

  @send external drawCanvasXY: (context2d, Dom.htmlCanvasElement, int, int) => unit = "drawImage"
  @send external drawImageXY: (context2d, Image.t, int, int) => unit = "drawImage"
  @send external getImageData: (context2d, int, int, int, int) => imageData = "getImageData"
  @send external putImageData: (imageData, int, int) => unit = "putImageData"
  @send external save: context2d => unit = "save"
  @send external restore: context2d => unit = "restore"
  @send external translate: (context2d, int, int) => unit = "translate"
  @send external scale: (context2d, int, int) => unit = "scale"
  @send external rotate: (context2d, float) => unit = "rotate"
  @send external fillRect: (context2d, int, int, int, int) => unit = "fillRect"
  @send external getTransform: context2d => domMatrix = "getTransform"
  @set external fillStyle: (context2d, string) => unit = "fillStyle"

  let setFillStyleRGBA = (context, r, g, b, a) => {
    let value =
      "rgba(" ++
      Js.Int.toString(r) ++
      "," ++
      Js.Int.toString(g) ++
      "," ++
      Js.Int.toString(b) ++
      "," ++
      Js.Float.toString(a) ++ ")"
    fillStyle(context, value)
  }
}

module Document = {
  type t = Dom.document

  @val external document: t = "document"
  @send external getElementById: (t, string) => Js.Nullable.t<Dom.element> = "getElementById"
  @send external getElementById_UNSAFE: (t, string) => Dom.element = "getElementById"
  @send external createElement: (t, string) => 'a = "createElement"

  let createCanvasElement = (document: t): Dom.htmlCanvasElement =>
    createElement(document, "canvas")
}

module Canvas = {
  type t = Dom.htmlCanvasElement
  type getContextOptions = {alpha: bool}

  @set external setWidth: (t, int) => unit = "width"
  @set external setHeight: (t, int) => unit = "height"
  @get external getWidth: t => int = "width"
  @get external getHeight: t => int = "height"
  @send external getContext: (t, string) => 'a = "getContext"
  @send external getContextWithOptions: (t, string, getContextOptions) => 'a = "getContext"
  @send external toDataUrl: (t, string) => string = "toDataURL"

  let make = (width, height) => {
    let canvas: t = Document.createElement(Document.document, "canvas")
    setWidth(canvas, width)
    setHeight(canvas, height)
    canvas
  }

  let getContext2d = (canvas: t): Context2d.t => getContext(canvas, "2d")
  let getContext2dWithAlpha = (canvas: t): Context2d.t =>
    getContextWithOptions(canvas, "2d", {alpha: true})
  let toDataUrlAsPng = (canvas: t) => toDataUrl(canvas, "image/png")
}

module File = {
  type t = {name: string}
}

module FileReader = {
  type t

  type onLoadCallback = ReactEvent.Form.t => unit

  @new external make: unit => t = "FileReader"
  @set external setOnLoad: (t, onLoadCallback) => unit = "onload"
  @send external readAsDataUrl: (t, File.t) => unit = "readAsDataURL"
}
