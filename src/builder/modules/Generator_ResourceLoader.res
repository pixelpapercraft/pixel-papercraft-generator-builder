module Builder = Generator_Builder

type imageTuple = (string, Dom2.Image.t)
type textureTuple = (string, Generator_Texture.t)

let imageDefToImage = (imageDef: Builder.imageDef): Promise.t<imageTuple> => {
  Generator_ImageFactory.makeFromUrl(imageDef.url)->Promise.thenResolve(image => (
    imageDef.id,
    image,
  ))
}

let textureDefToTexture = (textureDef: Builder.textureDef): Promise.t<textureTuple> => {
  Generator_Texture.makeFromUrl(
    textureDef.url,
    textureDef.standardWidth,
    textureDef.standardHeight,
  )->Promise.thenResolve(texture => (textureDef.id, texture))
}

let loadResources = (generatorDef: Builder.generatorDef) => {
  let imagePromises = generatorDef.images->Js.Array2.map(imageDefToImage)->Promise.all
  let texturePromises = generatorDef.textures->Js.Array2.map(textureDefToTexture)->Promise.all

  imagePromises
  ->Promise.then((images: array<imageTuple>) => {
    texturePromises->Promise.thenResolve((textures: array<textureTuple>) => Ok(images, textures))
  })
  ->Promise.catch(exn => {
    Js.log(exn)
    Promise.resolve(Error("Failed to load resources"))
  })
}
