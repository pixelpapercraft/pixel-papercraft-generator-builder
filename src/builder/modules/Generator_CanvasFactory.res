open Dom2

let make = (width, height) => {
  let canvas = Document.createCanvasElement(Window.document)
  Canvas.setWidth(canvas, width)
  Canvas.setHeight(canvas, height)
  canvas
}
