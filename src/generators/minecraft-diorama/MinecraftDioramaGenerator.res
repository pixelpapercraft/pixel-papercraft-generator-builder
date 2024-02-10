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

  let dioramaSize = Generator.defineAndGetSelectInput(
    "Diorama Size",
    ["800%", "400%", "200%", "Custom"],
  )

  let dioramaWidth = switch dioramaSize {
  | "800%" => 800
  | "400%" => 400
  | "200%" => 200
  | "Custom" =>
    Generator.defineAndGetRangeInput("Diorama Width", {min: 100, max: 1600, value: 800, step: 50})
  | _ => 128
  }

  let dioramaHeight =
    dioramaSize !== "Custom"
      ? dioramaWidth
      : {
          let separateHeight = Generator.defineAndGetBooleanInput("Separate Height", false)
          separateHeight
            ? Generator.defineAndGetRangeInput(
                "Diorama Height",
                {min: 100, max: 1600, value: 800, step: 50},
              )
            : dioramaWidth
        }

  // if dioramaSize is not custom, = dioramaWidth
  // if dioramaSize is custom, define boolean, and then = rangeInput

  let pageFormat = Generator.defineAndGetBooleanInput("Landscape Mode", false)

  let ox = pageFormat ? 37 : 42
  let oy = 41
  let (bx, by) = pageFormat ? (768, 512) : (512, 768)
  let width = 16 * dioramaWidth / 100 //Belt.Float.toInt(16.0 *. Belt.Int.toFloat(dioramaWidth) /. 100.0)
  let height = 16 * dioramaHeight / 100

  let options = (ox, oy, width, height, bx / width, by / height, editMode)

  Generator.usePage(~isLandscape=pageFormat, "Page")

  // Blocks
  Types.Block.draw(options)

  // Tabs
  Types.Tabs.draw(options)

  // Folds
  Types.Folds.draw(options)

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
