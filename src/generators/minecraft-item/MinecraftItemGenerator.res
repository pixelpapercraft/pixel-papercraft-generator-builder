module TexturePicker = Generator_TexturePicker
module Textures = MinecraftItem_Textures

let id = "minecraft-item"

let name = "Minecraft Item"

let images: array<Generator.imageDef> = []

let textures: array<Generator.textureDef> = MinecraftItem_Textures.allTextureDefs

let script = () => {
  Generator.defineSelectInput("Version", Textures.versionIds)
  let versionId = Generator.getSelectInputValue("Version")
  let textureFrames = Textures.findVersion(versionId)

  Generator.defineCustomStringInput("CurrentTexture", (onChange: string => unit) => {
    switch textureFrames {
    | None => React.null
    | Some({textureDef, frames}) =>
      <TexturePicker
        texture=textureDef
        frames
        onSelect={frame => {
          onChange(Generator_TextureFrame.encodeFrame(frame))
        }}
      />
    }
  })

  let currentTexture = Generator.getStringInputValue("CurrentTexture")
  let frame = Generator_TextureFrame.decodeFrame(currentTexture)

  switch (textureFrames, frame) {
  | (Some({textureDef}), Some(frame)) => {
      Generator.drawTexture(textureDef.id, frame.rectangle, (100, 100, 16 * 8, 16 * 8), ())

      Generator.drawTexture(
        textureDef.id,
        frame.rectangle,
        (100 + 16 * 8, 100, 16 * 8, 16 * 8),
        ~flip=#Horizontal,
        (),
      )
    }
  | _ => ()
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
