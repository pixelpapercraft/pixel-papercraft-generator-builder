module TexturePicker = MinecraftDiorama_TexturePicker
module Textures = MinecraftDiorama_Textures
module Face = MinecraftDiorama_Face
module Types = MinecraftDiorama_Types

let id = "minecraft-diorama"

let name = "Minecraft Diorama"

let history = ["Mystery"]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {id: "Title", url: Generator.requireImage("./images/Title.png")},
]

let textures: array<Generator.textureDef> = Textures.textures

let script = () => {
  Generator.defineSelectInput("Version", Textures.versionIds)
  let versionId = Generator.getSelectInputValue("Version")

  Generator.defineCustomStringInput(
    MinecraftDiorama_Constants.currentDioramaTextureId,
    onChange => {
      <TexturePicker versionId={versionId} onChange={onChange} />
    },
  )

  Generator.defineBooleanInput("Show Folds", true)

  //let showFolds = Generator.getBooleanInputValue("Show Folds")

  /* // Decode the selected texture
  let selectedTextureFrame = TexturePicker.SelectedTexture.decode(
    Generator.getStringInputValue("SelectedTextureFrame"),
  )

  // Decode the added textures
  let selectedTextureFrames = TexturePicker.SelectedTexture.decodeArray(
    Generator.getStringInputValue("SelectedTextureFrames"),
  )

  // Show a button which adds the selected texture to the page
  Generator.defineButtonInput("Add Item", () => {
    switch selectedTextureFrame {
    | Some(selectedTextureFrame) => {
        let selectedTextureFrames = Belt.Array.concat(selectedTextureFrames, [selectedTextureFrame])
        Generator.setStringInputValue(
          "SelectedTextureFrames",
          TexturePicker.SelectedTexture.encodeArray(selectedTextureFrames),
        )
      }
    | None => ()
    }
  }) */

  Generator.defineSelectInput("Diorama Size", ["800%", "400%", "200%"])
  let dioramaSize = Generator.getSelectInputValue("Diorama Size")

  let ox = 42
  let oy = 40

  switch dioramaSize {
  | "800%" => Types.Diorama.draw(ox, oy, 128, 4, 6)
  | "400%" => Types.Diorama.draw(ox, oy, 64, 8, 12)
  | "200%" => Types.Diorama.draw(ox, oy, 32, 16, 24)
  | _ => ()
  }

  Generator.defineButtonInput("Clear", () => {
    let currentTextureChoice = Generator.getStringInputValue(
      MinecraftDiorama_Constants.currentDioramaTextureId,
    )
    Generator.clearStringInputValues()
    Generator.setStringInputValue(
      MinecraftDiorama_Constants.currentDioramaTextureId,
      currentTextureChoice,
    )
  })

  Generator.drawImage("Title", (0, 0))
  Generator.fillBackgroundColorWithWhite()
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images,
  textures,
  script,
}
