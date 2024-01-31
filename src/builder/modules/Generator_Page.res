type t = {
  id: string,
  isLandscape: bool,
  canvasWithContext: Generator_CanvasWithContext.t,
}

let make = (id: string, isLandscape: bool) => {
  let canvasWithContext = Generator_CanvasWithContext.make(
    Generator_PageSize.A4.px.width,
    Generator_PageSize.A4.px.height,
  )
  let page = {id, isLandscape, canvasWithContext}
  page
}
/*
 For landscape to be as smooth as possible, it may be best for the page only to be landscape on the canvas and not when printed, so that PDF and other exporting methods are easier, and also use with the diorama regions is smoother. In other words, this page shouldn't reference the landscape part.
 */
