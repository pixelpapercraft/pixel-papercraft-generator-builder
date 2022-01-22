module TexturePicker = MinecraftBlock_TexturePicker
module Textures = MinecraftBlock_Textures
module Face = MinecraftBlock_Face
module Types = MinecraftBlock_Types

let id = "minecraft-block"

let name = "Minecraft Block"

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
  {id: "Folds-Cake", url: Generator.requireImage("./images/Folds-Cake.png")},
  {id: "Tabs-Cake", url: Generator.requireImage("./images/Tabs-Cake.png")},
]

let textures: array<Generator.textureDef> = Textures.textures

let script = () => {
  Generator.defineSelectInput("Version", Textures.versionIds)
  let versionId = Generator.getSelectInputValue("Version")

  Generator.defineCustomStringInput(MinecraftBlock_Constants.currentBlockTextureId, onChange => {
    <TexturePicker versionId={versionId} onChange={onChange} />
  })

  Generator.defineSelectInput("Number of Blocks", ["1", "2"])
  let numberOfBlocks =
    Generator.getSelectInputValue("Number of Blocks")
    ->Belt.Int.fromString
    ->Belt.Option.getWithDefault(1)

  Generator.defineBooleanInput("Show Folds", true)

  Generator.drawImage("Background", (0, 0))

  for i in 1 to numberOfBlocks {
    let blockId = Js.Int.toString(i)

    let typeName = "Block " ++ blockId ++ " Type"
    Generator.defineSelectInput(
      typeName,
      ["Block", "Slab", "Stair", "Fence", "Door", "Trapdoor", "Snow Layers", "Cake"],
    )
    let blockType = Generator.getSelectInputValue(typeName)

    let ox = 57
    let oy = 16 + 400 * (i - 1)

    switch blockType {
    | "Block" => Types.Block.draw(blockId, ox, oy)
    | "Slab" => Types.Slab.draw(blockId, ox, oy)
    | "Stair" => Types.Stair.draw(blockId, ox, oy)
    | "Fence" => Types.Fence.draw(blockId, ox, oy)
    | "Door" => Types.Door.draw(blockId, ox, oy)
    | "Trapdoor" => Types.Trapdoor.draw(blockId, ox, oy)
    | "Snow Layers" => Types.Snow.draw(blockId, ox, oy)
    | "Cake" => Types.Cake.draw(blockId, ox, oy)
    | _ => ()
    }
  }

  Generator.defineButtonInput("Clear", () => {
    let currentTextureChoice = Generator.getStringInputValue(
      MinecraftBlock_Constants.currentBlockTextureId,
    )
    Generator.clearStringInputValues()
    Generator.setStringInputValue(
      MinecraftBlock_Constants.currentBlockTextureId,
      currentTextureChoice,
    )
  })

  Generator.drawImage("Title", (0, 0))
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
