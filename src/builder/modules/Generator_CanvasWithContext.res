open Dom2

type t = {
  canvas: Canvas.t,
  context: Context2d.t,
  contextWithAlpha: Context2d.t,
  width: int,
  height: int,
}

let make = (width: int, height: int): t => {
  let canvas = Document.createCanvasElement(Window.document)
  let context = Canvas.getContext2d(canvas)
  let contextWithAlpha = Dom2.Canvas.getContext2dWithAlpha(canvas)
  Canvas.setWidth(canvas, width)
  Canvas.setHeight(canvas, height)
  let canvasWithContext = {
    width: width,
    height: height,
    canvas: canvas,
    context: context,
    contextWithAlpha: contextWithAlpha,
  }
  canvasWithContext
}
