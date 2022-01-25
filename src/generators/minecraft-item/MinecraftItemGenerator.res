module TexturePicker = MinecraftItem_TexturePicker
module TextureVersions = MinecraftItem_TextureVersions

let id = "minecraft-item"

let name = "Minecraft Item"

let images: array<Generator.imageDef> = []

let textures: array<Generator.textureDef> = TextureVersions.allTextureDefs

let drawItem = (id, rectangle, x, y, size) => {
  Generator.drawTexture(id, rectangle, (x, y, size, size), ())
  Generator.drawTexture(id, rectangle, (x + size, y, size, size), ~flip=#Horizontal, ())
}

let script = () => {
  // Show a drop down of different texture versions
  Generator.defineSelectInput("Version", TextureVersions.versionIds)
  let versionId = Generator.getSelectInputValue("Version")

  // Get the current selected version
  let textureVersion = TextureVersions.findVersion(versionId)

  // Show the Texture Picker
  // When a texture is selected, we need to encode it into a string variable
  Generator.defineCustomStringInput("SelectedTextureFrame", (onChange: string => unit) => {
    <TexturePicker
      textureVersion
      onSelect={frame => {
        onChange(Generator_TextureFrame.encodeFrame(frame))
      }}
    />
  })

  // Decode the selected texture
  let selectedTextureFrame = Generator_TextureFrame.decodeFrame(
    Generator.getStringInputValue("SelectedTextureFrame"),
  )

  // If we have a valid version and selected texture, then draw that texture
  switch (textureVersion, selectedTextureFrame) {
  | (Some(textureVersion), Some(selectedTextureFrame)) => {
      let {textureDef} = textureVersion

      let size = 16 * 8 // 800% of the Minecraft default
      let border = 25

      let ox = border
      let oy = border
      drawItem(textureDef.id, selectedTextureFrame.rectangle, ox, oy, size)

      let ox = ox + size * 2 + border
      let oy = border
      drawItem(textureDef.id, selectedTextureFrame.rectangle, ox, oy, size)
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
