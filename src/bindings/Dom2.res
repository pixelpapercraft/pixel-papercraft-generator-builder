type context2d
type domMatrix

module Style = {
  type t = Dom.htmlStyleElement

  @set external height: (t, int) => unit = "height"
  @set external width: (t, int) => unit = "width"
  @set external maxWidth: (t, string) => unit = "maxWidth"
  @set external visibility: (t, [#hidden]) => unit = "visibility"
  @set external textAlign: (t, [#center]) => unit = "textAlign"
}

module Element = {
  type t = Dom.element
  type eventListener = Dom.event => unit

  @set external value: (t, string) => unit = "value"
  @send external focus: t => unit = "focus"

  @get external width: t => int = "width"
  @get external height: t => int = "height"
  @get external style: t => Style.t = "style"
  @send external appendChild: (t, t) => unit = "appendChild"
  @send external removeChild: (t, t) => unit = "removeChild"
  @val external cloneNode: t => unit = "cloneNode"
  @send external addEventListener: (t, string, eventListener) => unit = "addEventListener"
  @send external removeEventListener: (t, string, eventListener) => unit = "removeEventListener"
  @send
  external addReactKeyboardEventListener: (t, [#keydown], ReactEvent.Keyboard.t => unit) => unit =
    "addEventListener"
  @send
  external removeReactKeyboardEventListener: (
    t,
    [#keydown],
    ReactEvent.Keyboard.t => unit,
  ) => unit = "removeEventListener"
}

module Window = {
  type t = Dom.window

  external asElement: t => Element.t = "%identity"

  @val external instance: t = "window"
  @val external document: Dom.document = "document"
  @send external print: t => unit = "print"
}

module Iframe = {
  type t = Dom.htmlIframeElement

  external asElement: t => Element.t = "%identity"

  @get external parentNode: t => Dom.element = "parentNode"
  @get external contentDocument: t => Dom.document = "contentDocument"
  @get external contentWindow: t => Dom.window = "contentWindow"
  @send external setAttribute: (t, string, string) => unit = "setAttribute"

  let setSrcDocAttribute = (iframe: t, value: string) => setAttribute(iframe, "srcdoc", value)
}

module Image = {
  type t = Dom.htmlImageElement

  type onLoadCallback = unit => unit
  type onErrorCallback = exn => unit

  external asElement: t => Dom.element = "%identity"
  external fromDomElement: Dom.element => Dom.htmlImageElement = "%identity"

  @new external make: unit => t = "Image"
  @set external src: (t, string) => unit = "src"
  @set external onLoad: (t, onLoadCallback) => unit = "onload"
  @set external onLoadOption: (t, option<onLoadCallback>) => unit = "onload"
  @set external onError: (t, onErrorCallback) => unit = "onerror"
  @get external width: t => int = "width"
  @get external height: t => int = "height"
  @get external offsetWidth: t => int = "offsetWidth"
  @get external offsetHeight: t => int = "offsetHeight"
  @get external naturalWidth: t => int = "naturalWidth"
  @get external naturalHeight: t => int = "naturalHeight"
  @send
  external addEventListener: (t, [#load | #error], Dom.event => unit) => unit = "addEventListener"
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
  @send external translate: (context2d, float, float) => unit = "translate"
  @send external scale: (context2d, int, int) => unit = "scale"
  @send external rotate: (context2d, float) => unit = "rotate"
  @send external fillRect: (context2d, int, int, int, int) => unit = "fillRect"
  @send external fill: context2d => unit = "fill"
  @set external filter: (context2d, string) => unit = "filter"
  @send external getTransform: context2d => domMatrix = "getTransform"
  @send external moveTo: (context2d, float, float) => unit = "moveTo"
  @send external lineTo: (context2d, float, float) => unit = "lineTo"
  @send external rect: (context2d, float, float, float, float) => unit = "rect"
  @send external beginPath: context2d => unit = "beginPath"
  @send external closePath: context2d => unit = "closePath"
  @send external strokeRect: (context2d, float, float, float, float) => unit = "strokeRect"
  @send external stroke: context2d => unit = "stroke"
  @send external setLineDash: (context2d, array<int>) => unit = "setLineDash"
  @set external fillStyle: (context2d, string) => unit = "fillStyle"
  @set external strokeStyle: (context2d, string) => unit = "strokeStyle"
  @set external lineWidth: (context2d, int) => unit = "lineWidth"
  @set external lineDashOffset: (context2d, int) => unit = "lineDashOffset"
  @get external getFillStyle: context2d => string = "fillStyle"
  @set external setFillStyle: (context2d, string) => unit = "fillStyle"
  @send external fillText: (context2d, string, int, int) => unit = "fillText"
  @set external font: (context2d, string) => unit = "font"

  @set
  external setWebkitImageSmoothingEnabled: (context2d, bool) => unit = "webkitImageSmoothingEnabled"
  @set external setMozImageSmoothingEnabled: (context2d, bool) => unit = "mozImageSmoothingEnabled"
  @set external setImageSmoothingEnabled: (context2d, bool) => unit = "imageSmoothingEnabled"

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
    setFillStyle(context, value)
  }
}

module Body = {
  type t = Dom.htmlBodyElement

  external asElement: t => Element.t = "%identity"
}

module Document = {
  type t = Dom.document

  external toDomElement: t => Dom.element = "%identity"

  // @val external document: t = "document"
  @get external body: t => Dom.htmlBodyElement = "body"
  @send external getElementById: (t, string) => Js.Nullable.t<Dom.element> = "getElementById"
  @send external getElementById_UNSAFE: (t, string) => Dom.element = "getElementById"
  @send external createElement: (t, string) => 'a = "createElement"

  let createCanvasElement = (document: t): Dom.htmlCanvasElement =>
    createElement(document, "canvas")

  let createIframeElement = (document: t): Iframe.t => createElement(document, "iframe")
}

module Canvas = {
  type t = Dom.htmlCanvasElement
  type getContextOptions = {alpha: bool, willReadFrequently: bool}

  @set external setWidth: (t, int) => unit = "width"
  @set external setHeight: (t, int) => unit = "height"
  @get external getWidth: t => int = "width"
  @get external getHeight: t => int = "height"
  @send external getContext: (t, string) => 'a = "getContext"
  @send external getContextWithOptions: (t, string, getContextOptions) => 'a = "getContext"
  @send external toDataUrl: (t, string) => string = "toDataURL"

  let make = (width, height) => {
    let canvas: t = Document.createElement(Window.document, "canvas")
    setWidth(canvas, width)
    setHeight(canvas, height)
    canvas
  }

  let getContext2d = (canvas: t): Context2d.t =>
    getContextWithOptions(canvas, "2d", {alpha: true, willReadFrequently: true}) //getContext(canvas, "2d")
  let getContext2dWithAlpha = (canvas: t): Context2d.t =>
    getContextWithOptions(canvas, "2d", {alpha: true, willReadFrequently: true})
  let toDataUrlAsPng = (canvas: t) => toDataUrl(canvas, "image/png")
}

module File = {
  type t = {name: string}

  @get external name: t => string = "name"
  @get external size: t => int = "size" // bytes
  @get external type_: t => string = "type"
  @get external lastModified: t => int = "lastModified"
  @get external lastModifiedDate: t => Js.Date.t = "lastModifiedDate"
}

module FileReader = {
  type t
  type dataUrl = string
  type listenEvent = [#load]

  type onLoadCallback = ReactEvent.Form.t => unit

  @new external make: unit => t = "FileReader"
  @set external setOnLoad: (t, onLoadCallback) => unit = "onload"
  @send external readAsDataUrl: (t, File.t) => unit = "readAsDataURL"
  @get external result: t => dataUrl = "result"
  @send
  external addEventListener: (t, listenEvent, unit => unit, bool) => unit = "addEventListener"
}

module FileList = {
  type t

  @get
  external length: t => int = "length"

  @send
  external item: (t, int) => File.t = "item"
}

module Event = {
  type t = ReactEvent.Form.t

  let currentTarget = ReactEvent.Form.currentTarget

  let currentTargetFiles = (event: t): FileList.t => ReactEvent.Form.currentTarget(event)["files"]
}

module FormData = {
  type t

  @new external make: unit => t = "FormData"
  @send external appendString: (t, string, string) => unit = "append"
  @send external appendBool: (t, string, bool) => unit = "append"
  @send external appendFile: (t, string, File.t) => unit = "append"
  @send external appendStringArray: (t, string, array<string>) => unit = "append"
}
