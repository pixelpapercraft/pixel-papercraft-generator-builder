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
  {id: "Background", url: Generator.requireImage("./images/Background.png")},
  {id: "Title", url: Generator.requireImage("./images/Title.png")},
  {id: "Folds-Diorama", url: Generator.requireImage("./images/Folds-Block.png")},
  {id: "Tabs-Diorama", url: Generator.requireImage("./images/Tabs-Block.png")},
  {id: "Folds-Slab", url: Generator.requireImage("./images/Folds-Slab.png")},
  {id: "Tabs-Slab", url: Generator.requireImage("./images/Tabs-Slab.png")},
  {id: "Folds-Stair", url: Generator.requireImage("./images/Folds-Stair.png")},
  {id: "Tabs-Stair", url: Generator.requireImage("./images/Tabs-Stair.png")},
  {id: "Folds-Fence", url: Generator.requireImage("./images/Folds-Fence.png")},
  {id: "Tabs-Fence", url: Generator.requireImage("./images/Tabs-Fence.png")},
  {id: "Folds-Door", url: Generator.requireImage("./images/Folds-Door.png")},
  {id: "Tabs-Door", url: Generator.requireImage("./images/Tabs-Door.png")},
  {id: "Folds-Trapdoor", url: Generator.requireImage("./images/Folds-Trapdoor.png")},
  {id: "Tabs-Trapdoor", url: Generator.requireImage("./images/Tabs-Trapdoor.png")},
  {id: "Folds-Snow-Top", url: Generator.requireImage("./images/Folds-Snow-Top.png")},
  {id: "Folds-Snow-Bottom", url: Generator.requireImage("./images/Folds-Snow-Bottom.png")},
  {id: "Tabs-Snow-Top", url: Generator.requireImage("./images/Tabs-Snow-Top.png")},
  {id: "Tabs-Snow-Middle", url: Generator.requireImage("./images/Tabs-Snow-Middle.png")},
  {id: "Tabs-Snow-Bottom", url: Generator.requireImage("./images/Tabs-Snow-Bottom.png")},
  {id: "Folds-Cake-Left", url: Generator.requireImage("./images/Folds-Cake-Left.png")},
  {id: "Folds-Cake-Middle", url: Generator.requireImage("./images/Folds-Cake-Middle.png")},
  {id: "Folds-Cake-Right", url: Generator.requireImage("./images/Folds-Cake-Right.png")},
  {id: "Tabs-Cake-Left", url: Generator.requireImage("./images/Tabs-Cake-Left.png")},
  {id: "Tabs-Cake-Middle", url: Generator.requireImage("./images/Tabs-Cake-Middle.png")},
  {id: "Tabs-Cake-Corner", url: Generator.requireImage("./images/Tabs-Cake-Corner.png")},
  {id: "Tabs-Cake-Right", url: Generator.requireImage("./images/Tabs-Cake-Right.png")},
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

  let showFolds = Generator.getBooleanInputValue("Show Folds")

  Generator.drawImage("Background", (0, 0))

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

  Generator.defineSelectInput("Diorama Size", ["Diorama", "Free"])
  let dioramaSize = Generator.getSelectInputValue("Diorama Size")

  let ox = 57
  let oy = 16

  switch dioramaSize {
  | "Diorama" => Types.Diorama.draw(ox, oy, 128, 4, 6)
  | "Free" => Types.Free.draw(ox, oy, showFolds)
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
