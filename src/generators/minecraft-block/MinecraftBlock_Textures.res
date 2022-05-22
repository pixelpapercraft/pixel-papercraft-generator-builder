module Builder = Generator.Builder

module TextureData = {
  // Order from oldest to newest
  let definitions: array<(Generator.textureDef, {..})> = [
    MinecraftBlock_Texture_minecraft_1_13_2.data,
    MinecraftBlock_Texture_minecraft_1_18_1.data,
  ]

  let versions = definitions->Belt.Array.map(((_, version)) => version)
  let textures = definitions->Belt.Array.map(((texture, _)) => texture)
}

type textureFrame = {
  versionId: string,
  textureId: string,
  frame: int,
  frameIndex: int,
  blend: Generator_Texture.blend,
}

let textureSize = 16

let textures: array<Generator.textureDef> = TextureData.textures

let versionIds: array<string> =
  TextureData.versions->Js.Array2.map(version => version["id"])->Belt.Array.reverse

let findVersion = versionId => {
  TextureData.versions->Js.Array2.find(version => version["id"] === versionId)
}

let findVersionTexture = (versionId, textureId) => {
  let version = findVersion(versionId)
  switch version {
  | None => None
  | Some(version) => version["textures"]->Js.Array2.find(texture => texture["id"] === textureId)
  }
}

let findTextureDef = versionId => {
  TextureData.textures->Js.Array2.find(texture => texture.id === versionId)
}

let calculateTextureFrameIndex = (textureIndex: int, frame: int) => {
  textureIndex + (frame - 1) * textureSize
}

let findTextureFrames = (versionId): option<array<textureFrame>> => {
  switch findVersion(versionId) {
  | None => None
  | Some(version) => {
      let textureFrames =
        version["textures"]
        ->Js.Array2.map(texture => {
          let textureId = texture["id"]
          let frames = texture["frames"]
          let index = texture["index"]
          let textureFrames = Belt.Array.range(1, frames)->Belt.Array.map(frame => {
            let frameIndex = calculateTextureFrameIndex(index, frame)
            let textureFrame = {
              versionId: versionId,
              textureId: textureId,
              frame: frame,
              frameIndex: frameIndex,
              blend: #None,
            }
            textureFrame
          })
          textureFrames
        })
        ->Belt.Array.concatMany
      Some(textureFrames)
    }
  }
}

let findTextureFrameIndex = (versionId, textureId, frame) => {
  let texture = findVersionTexture(versionId, textureId)
  switch texture {
  | None => None
  | Some(texture) => {
      let textureIndex = texture["index"]
      let frameIndex = calculateTextureFrameIndex(textureIndex, frame)
      Some(frameIndex)
    }
  }
}

let findTextureFrameCount = (versionId, textureId) => {
  let texture = findVersionTexture(versionId, textureId)
  switch texture {
  | None => 0
  | Some(texture) => texture["frames"]
  }
}
