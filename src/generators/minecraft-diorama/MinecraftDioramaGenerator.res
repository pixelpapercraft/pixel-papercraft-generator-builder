let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")
module TexturePicker = TexturePicker
module Face = TextureFace
module Types = MinecraftDiorama_Types
module Markdown = Generator.Markdown
module TextureVersions = TextureVersions

let id = "minecraft-diorama"

let name = "Minecraft Diorama"

let history = ["24 Jan 2024 NinjolasNJM - Initial Script Finished"]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {id: "Title Portrait", url: Generator.requireImage("./images/TitlePortrait.png")},
  {id: "Title Landscape", url: Generator.requireImage("./images/TitleLandscape.png")},
]

let textures: array<Generator.textureDef> = Belt.Array.concat(
  TextureVersions.allTextureDefs,
  [
    {
      id: "Tab",
      url: requireTexture("Tab"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Tab Left",
      url: requireTexture("TabLeft"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Tab Right",
      url: requireTexture("TabRight"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Tab Middle",
      url: requireTexture("TabMiddle"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Fold",
      url: requireTexture("Fold"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Debug",
      url: requireTexture("debug"),
      standardWidth: 128,
      standardHeight: 128,
    },
  ],
)

let definitions = Belt.Array.concat(
  TextureVersions.itemDefinitions,
  TextureVersions.blockDefinitions,
)

let script = () => {
  // Show a drop down of different texture versions

  Generator.defineSelectInput("Version", TextureVersions.versionIds(definitions))
  let versionId = Generator.getSelectInputValue("Version")

  // Get the current selected version
  let textureVersion = TextureVersions.findVersion(versionId, definitions)

  // Show the Texture Picker
  // When a texture is selected, we need to encode it into a string variable
  Generator.defineCustomStringInput("SelectedTextureFrame", (onChange: string => unit) => {
    <TexturePicker
      textureVersion
      onSelect={selectedTexture => {
        onChange(TexturePicker.SelectedTexture.encode(selectedTexture))
      }}
      enableRotation=true
      enableErase=true
    />
  })

  let editMode = Generator.defineAndGetSelectInput("Edit Mode", ["Blocks", "Tabs", "Folds"])

  let dioramaSize = Generator.defineAndGetSelectInput("Diorama Size", ["800%", "400%", "200%"])

  let pageFormat = Generator.defineAndGetBooleanInput("Landscape Mode", false)

  let ox = pageFormat ? 37 : 42
  let oy = 41
  let (bx, by) = pageFormat ? (6, 4) : (4, 6)

  let options800 = (ox, oy, 128, bx, by, editMode)
  let options400 = (ox, oy, 64, bx * 2, by * 2, editMode)
  let options200 = (ox, oy, 32, bx * 4, by * 4, editMode)

  Generator.usePage(~isLandscape=pageFormat, "Page")

  switch dioramaSize {
  | "800%" => Types.Block.draw(options800)
  | "400%" => Types.Block.draw(options400)
  | "200%" => Types.Block.draw(options200)
  | _ => ()
  }

  // Tabs

  switch dioramaSize {
  | "800%" => Types.Tabs.draw(options800)
  | "400%" => Types.Tabs.draw(options400)
  | "200%" => Types.Tabs.draw(options200)
  | _ => ()
  }

  // Folds

  switch dioramaSize {
  | "800%" => Types.Folds.draw(options800)
  | "400%" => Types.Folds.draw(options400)
  | "200%" => Types.Folds.draw(options200)
  | _ => ()
  }

  Generator.defineButtonInput("Clear", () => {
    // Save things we don't want cleared
    let currentTextureChoice = Generator.getStringInputValue("SelectedTextureFrame")
    let currentVersionId = versionId
    let currentEditMode = editMode
    let currentDioramaSize = dioramaSize
    let currentPageFormat = pageFormat

    // Clear everything
    Generator.clearStringInputValues()
    Generator.clearBooleanInputValues()
    Generator.clearSelectInputValues()

    // Restore everything except the blocks, tabs and folds
    Generator.setStringInputValue("SelectedTextureFrame", currentTextureChoice)
    Generator.setSelectInputValue("Version", currentVersionId)
    Generator.setSelectInputValue("Edit Mode", currentEditMode)
    Generator.setSelectInputValue("Diorama Size", currentDioramaSize)
    Generator.setBooleanInputValue("Landscape Mode", currentPageFormat)
  })

  pageFormat
    ? Generator.drawImage("Title Landscape", (0, 0))
    : Generator.drawImage("Title Portrait", (0, 0))
  Generator.fillBackgroundColorWithWhite()
  Generator.fillBackgroundColorWithWhite()
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: None, // Some(thumbnail),
  video: None,
  instructions: None,
  images,
  textures,
  script,
}
