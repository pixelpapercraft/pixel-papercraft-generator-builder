module TexturePicker = TexturePicker
module Face = TextureFace
module Types = MinecraftBlock_Types
module Markdown = Generator.Markdown
module TextureVersions = TextureVersions

let id = "minecraft-block"

let name = "Minecraft Block"

let history = [
  "Dec 2021 lostminer - Block generator rewrite.",
  "Dec 2021 NinjolasNJM - Add Stairs, Fence, Door, Trapdoor and Snow.",
  "Jan 2022 NinjolasNJM - Add Cake Block type.",
  "Jan 2024 NinjolasNJM - Now uses the universal texture picker, with erase mode, flip buttons and new textures.",
  "Jan 2024 NinjolasNJM - Add Minecart Block type.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {id: "Background", url: Generator.requireImage("./images/Background.png")},
  {id: "Title", url: Generator.requireImage("./images/Title.png")},
  {id: "Folds-Block", url: Generator.requireImage("./images/Folds-Block.png")},
  {id: "Tabs-Block", url: Generator.requireImage("./images/Tabs-Block.png")},
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
  {id: "Folds-Minecart", url: Generator.requireImage("./images/Folds-Minecart.png")},
  {id: "Tabs-Minecart", url: Generator.requireImage("./images/Tabs-Minecart.png")},
]

let textures: array<Generator.textureDef> = TextureVersions.allTextureDefs

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

  Generator.defineSelectInput("Number of Blocks", ["1", "2"])
  let numberOfBlocks =
    Generator.getSelectInputValue("Number of Blocks")
    ->Belt.Int.fromString
    ->Belt.Option.getWithDefault(1)

  Generator.defineBooleanInput("Show Folds", true)

  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Wherever it gets used, ( in item it was first and array that is iterated through,) SelectedTextureFreame is split into textureDefId and frame, then its rectangle is used as frame.rectangle. Example:
  /* let {textureDefId, frame} = selectedTextureFrame
   ... Generator.drawItem(textureDefId, frame.rectangle, etc. )
   In our case we need not just the rectangle, but the rotation and blend and maybe more (we need to add a flip part?) so using all of frame may be optimal.  
 */

  Generator.drawImage("Background", (0, 0))

  for i in 1 to numberOfBlocks {
    let blockId = Js.Int.toString(i)

    let typeName = "Block " ++ blockId ++ " Type"
    Generator.defineSelectInput(
      typeName,
      [
        "Block",
        "Slab",
        "Stair",
        "Fence",
        "Door",
        "Trapdoor",
        "Snow Layers",
        "Cake",
        "Minecart Block",
      ],
    )
    let blockType = Generator.getSelectInputValue(typeName)

    let ox = 57
    let oy = 16 + 400 * (i - 1)

    switch blockType {
    | "Block" => Types.Block.draw(blockId, ox, oy, showFolds)
    | "Slab" => Types.Slab.draw(blockId, ox, oy, showFolds)
    | "Stair" => Types.Stair.draw(blockId, ox, oy, showFolds)
    | "Fence" => Types.Fence.draw(blockId, ox, oy, showFolds)
    | "Door" => Types.Door.draw(blockId, ox, oy, showFolds)
    | "Trapdoor" => Types.Trapdoor.draw(blockId, ox, oy, showFolds)
    | "Snow Layers" => Types.Snow.draw(blockId, ox, oy, showFolds)
    | "Cake" => Types.Cake.draw(blockId, ox, oy, showFolds)
    | "Minecart Block" => Types.Minecart.draw(blockId, ox, oy, showFolds)
    | _ => ()
    }
  }

  // Show a button which allows the items to be cleared
  Generator.defineButtonInput("Clear", () => {
    let currentTextureChoice = Generator.getStringInputValue("SelectedTextureFrame")

    Generator.clearStringInputValues()

    Generator.setStringInputValue("SelectedTextureFrame", currentTextureChoice)
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
