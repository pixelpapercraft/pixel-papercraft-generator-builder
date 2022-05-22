open Dom2

type t = {
  image: Image.t,
  width: int,
  height: int,
  canvasWithContext: Generator_CanvasWithContext.t,
}

let makeFromImage = (image: Image.t): t => {
  let width = Image.width(image)
  let height = Image.height(image)
  let canvasWithContext = Generator_CanvasWithContext.make(width, height)
  Context2d.drawImageXY(canvasWithContext.context, image, 0, 0)
  let generatorImage = {
    image: image,
    width: Image.width(image),
    height: Image.height(image),
    canvasWithContext: canvasWithContext,
  }
  generatorImage
}

let makeFromImageUrl = (url: string): Promise.t<t> => {
  Generator_ImageFactory.makeFromUrl(url)->Promise.thenResolve(image => makeFromImage(image))
}
