type t = {
  id: string,
  canvasWithContext: Generator_CanvasWithContext.t,
}

let make = (id: string) => {
  let canvasWithContext = Generator_CanvasWithContext.make(
    Generator_PageSize.A4.px.width,
    Generator_PageSize.A4.px.height,
  )
  let page = {id: id, canvasWithContext: canvasWithContext}
  page
}
