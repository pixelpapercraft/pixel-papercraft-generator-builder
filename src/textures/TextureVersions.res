/* let definitions = [
  (Texture_minecraft_1_7_10_blocks.data, 16),
  (Texture_minecraft_1_7_10_items.data, 16),
  (Texture_minecraft_1_13_2_blocks.data, 16),
  (Texture_minecraft_1_13_2_items.data, 16),
  (Texture_minecraft_1_18_1_blocks.data, 16),
  (Texture_minecraft_1_18_1_items.data, 16),
]*/
let blockDefinitions = [
  (Texture_minecraft_1_7_10_blocks.data, 16),
  (Texture_minecraft_1_13_2_blocks.data, 16),
  (Texture_minecraft_1_18_1_blocks.data, 16),
  (Texture_minecraft_1_20_4_blocks.data, 16),
]

let itemDefinitions = [
  (Texture_minecraft_1_7_10_items.data, 16),
  (Texture_minecraft_1_13_2_items.data, 16),
  (Texture_minecraft_1_18_1_items.data, 16),
  (Texture_minecraft_1_20_4_items.data, 16),
]

let allDefinitions = Belt.Array.concat(blockDefinitions, itemDefinitions)

type textureVersion = {
  textureDef: Generator.textureDef,
  frames: array<Generator_TextureFrame.frame>,
}

let textureVersions = definitions =>
  Belt.Array.map(definitions, definition => {
    let (data, frameSize) = definition
    let (textureDef, tiles) = data
    let frames = tiles->Generator_TextureFrame.tilesToFrames(frameSize)
    {textureDef, frames}
  })

let textureDefs = definitions =>
  Belt.Array.map(textureVersions(definitions), ({textureDef, _}) => textureDef)

let blockTextureDefs = textureDefs(blockDefinitions)

let itemTextureDefs = textureDefs(itemDefinitions)

let allTextureDefs = textureDefs(allDefinitions) //Belt.Array.concat(blockTextureDefs, itemTextureDefs)

let versionIds = definitions =>
  Belt.Array.map(textureVersions(definitions), ({textureDef, _}) =>
    textureDef.id
  )->Belt.Array.reverse

let findVersion = (versionId, definitions): option<textureVersion> => {
  Belt.Array.getBy(textureVersions(definitions), ({textureDef, _}) => textureDef.id === versionId)
}
