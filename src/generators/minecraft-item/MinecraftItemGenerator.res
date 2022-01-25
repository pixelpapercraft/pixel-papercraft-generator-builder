module TexturePicker = Generator_TexturePicker

let id = "minecraft-item"

let name = "Minecraft Item"

let images: array<Generator.imageDef> = []

let textures: array<Generator.textureDef> = MinecraftItem_Textures.TextureData.textures

let script = () => {
  Generator.defineCustomStringInput("CurrentTexture", (onChange: string => unit) => {
    <TexturePicker
      texture=MinecratItem_Texture_minecraft_1_7_10.texture
      frames={Generator_TextureFrame.texturesToFrames(
        MinecratItem_Texture_minecraft_1_7_10.tiles->Generator_TextureFrame.asTextures_UNSAFE,
        16,
      )}
      onSelect={frame => {
        onChange(Generator_TextureFrame.encodeFrame(frame))
      }}
    />
  })

  let currentTexture = Generator.getStringInputValue("CurrentTexture")
  let frame = Generator_TextureFrame.decodeFrame(currentTexture)

  Js.log(frame)

  switch frame {
  | None => ()
  | Some(frame) => {
      Generator.drawTexture(
        MinecratItem_Texture_minecraft_1_7_10.texture.id,
        frame.rectangle,
        (100, 100, 16 * 8, 16 * 8),
        (),
      )

      Generator.drawTexture(
        MinecratItem_Texture_minecraft_1_7_10.texture.id,
        frame.rectangle,
        (100 + 16 * 8, 100, 16 * 8, 16 * 8),
        ~flip=#Horizontal,
        (),
      )
    }
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
