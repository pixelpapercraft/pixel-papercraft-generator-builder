type t = {
  id: string,
  canvasWithContext: Generator_CanvasWithContext.t,
}

let make = (id: string, isLandscape: bool) => {
  let canvasWithContext = isLandscape
    ? Generator_CanvasWithContext.make(
        Generator_PageSize.A4.px.height,
        Generator_PageSize.A4.px.width,
      )
    : Generator_CanvasWithContext.make(
        Generator_PageSize.A4.px.width,
        Generator_PageSize.A4.px.height,
      )
  let page = {id, canvasWithContext}
  page
}
