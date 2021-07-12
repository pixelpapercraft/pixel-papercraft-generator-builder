module Components = MinecraftBlock_Components
module Textures = MinecraftBlock_Textures
module Face = MinecraftBlock_Face

let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

type region = (int, int, int, int)

module Block = {
  module Regions = {
    type faces = {
      top: region,
      bottom: region,
      right: region,
      front: region,
      left: region,
      back: region,
    }

    let size = 128

    let make = (ox, oy): faces => {
      top: (ox + size, oy + 0, size, size),
      bottom: (ox + size, oy + size * 2, size, size),
      right: (ox, oy + size, size, size),
      front: (ox + size, oy + size, size, size),
      left: (ox + size * 2, oy + size, size, size),
      back: (ox + size * 3, oy + size, size, size),
    }
  }

  let draw = (blockId: string, ox: int, oy: int) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("BlockFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("BlockFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("BlockFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("BlockFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("BlockFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("BlockFaceBack" ++ blockId, regions.back)

    Face.draw("BlockFaceTop" ++ blockId, (0, 0, 16, 16), regions.top)
    Face.draw("BlockFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom)
    Face.draw("BlockFaceRight" ++ blockId, (0, 0, 16, 16), regions.right)
    Face.draw("BlockFaceFront" ++ blockId, (0, 0, 16, 16), regions.front)
    Face.draw("BlockFaceLeft" ++ blockId, (0, 0, 16, 16), regions.left)
    Face.draw("BlockFaceBack" ++ blockId, (0, 0, 16, 16), regions.back)

    Generator.drawImage("Tabs-Block", (ox - 32, oy - 1))

    let showFolds = Generator.getBooleanInputValue("Show Folds")
    if showFolds {
      Generator.drawImage("Folds-Block", (ox - 32, oy - 1))
    }
  }
}

module Slab = {
  module Regions = {
    type faces = {
      top: region,
      bottom: region,
      right: region,
      front: region,
      left: region,
      back: region,
    }

    let size = 128

    let make = (ox, oy) => {
      top: (ox + size, oy + size / 2, size, size),
      bottom: (ox + size, oy + size * 2, size, size),
      right: (ox, oy + size * 3 / 2, size, size / 2),
      front: (ox + size, oy + size * 3 / 2, size, size / 2),
      left: (ox + size * 2, oy + size * 3 / 2, size, size / 2),
      back: (ox + size * 3, oy + size * 3 / 2, size, size / 2),
    }
  }

  let draw = (blockId: string, ox: int, oy: int) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("SlabFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("SlabFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("SlabFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("SlabFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("SlabFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("SlabFaceBack" ++ blockId, regions.back)

    Face.draw("SlabFaceTop" ++ blockId, (0, 0, 16, 16), regions.top)
    Face.draw("SlabFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom)
    Face.draw("SlabFaceRight" ++ blockId, (0, 8, 16, 8), regions.right)
    Face.draw("SlabFaceFront" ++ blockId, (0, 8, 16, 8), regions.front)
    Face.draw("SlabFaceLeft" ++ blockId, (0, 8, 16, 8), regions.left)
    Face.draw("SlabFaceBack" ++ blockId, (0, 8, 16, 8), regions.back)

    Generator.drawImage("Tabs-Slab", (ox - 32, oy - 1))

    let showFolds = Generator.getBooleanInputValue("Show Folds")
    if showFolds {
      Generator.drawImage("Folds-Slab", (ox - 32, oy - 1))
    }
  }
}

module Stair = {
  module Regions = {
    type faces = {
      top: region,
      top2: region,
      bottom: region,
      right: region,
      front: region,
      left: region,
      back: region,
      back2: region,
    }

    let size = 128

    let make = (ox, oy): faces => {
      top: (ox + size, oy + size / 2, size, size / 2),
      top2: (ox + size * 3, oy + size, size, size / 2),
      bottom: (ox + size, oy + size * 2, size, size),
      right: (ox, oy + size, size, size),
      front: (ox + size, oy + size, size, size),
      left: (ox + size * 2, oy + size, size, size),
      back: (ox + size * 3, oy + size * 3 / 2, size, size / 2),
      back2: (ox + size, oy + 0, size, size / 2),
    }
  }

  let draw = (blockId: string, ox: int, oy: int) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("StairFaceTop" ++ blockId, regions.top)
    //Face.defineInputRegion("StairFaceTop2" ++ blockId, regions.top2)
    Face.defineInputRegion("StairFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("StairFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("StairFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("StairFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("StairFaceBack" ++ blockId, regions.back)
    //Face.defineInputRegion("StairFaceBack2" ++ blockId, regions.back2)

    Face.draw("StairFaceTop" ++ blockId, (0, 8, 16, 8), regions.top)
    Face.draw180("StairFaceBack" ++ blockId, (0, 0, 16, 8), regions.back2)
    Face.draw("StairFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom)
    Face.draw("StairFaceRight" ++ blockId, (0, 0, 16, 16), regions.right)
    Face.draw("StairFaceFront" ++ blockId, (0, 0, 16, 16), regions.front)
    Face.draw("StairFaceLeft" ++ blockId, (0, 0, 16, 16), regions.left)
    Face.draw("StairFaceBack" ++ blockId, (0, 8, 16, 8), regions.back)
    Face.draw180("StairFaceTop" ++ blockId, (0, 0, 16, 8), regions.top2)

    Generator.drawImage("Tabs-Stair", (ox - 32, oy - 1))

    let showFolds = Generator.getBooleanInputValue("Show Folds")
    if showFolds {
      Generator.drawImage("Folds-Stair", (ox - 32, oy - 1))
    }
  }
}

module Fence = {
  module Regions = {
    type faces = {
      // fence post
      top: region,
      bottom: region,
      right: region,
      front: region,
      left: region,
      back: region,
      // short fence rail 1
      stop1: region,
      sbottom1: region,
      sright1: region,
      sfront1: region,
      sleft1: region,
      sback1: region,
      // short fence rail 2
      stop2: region,
      sbottom2: region,
      sright2: region,
      sfront2: region,
      sleft2: region,
      sback2: region,
      // long fence rail 1
      ltop1: region,
      lbottom1: region,
      lright1: region,
      lfront1: region,
      lleft1: region,
      lback1: region,
      l2top1: region,
      l2bottom1: region,
      l2front1: region,
      l2back1: region,
      // long fence rail 2
      ltop2: region,
      lbottom2: region,
      lright2: region,
      lfront2: region,
      lleft2: region,
      lback2: region,
      l2top2: region,
      l2bottom2: region,
      l2front2: region,
      l2back2: region,
    }

    let size = 128
    let size2 = 16
    let size3 = 24
    let sizel = 96
    let x1 = -1
    let x2 = 320
    let y1 = 96
    let y2 = 208

    let make = (ox, oy): faces => {
      // fence post
      top: (ox + size + size / 4, oy + size * 3 / 4, size / 4, size / 4),
      bottom: (ox + size + size / 4, oy + size * 2, size / 4, size / 4),
      right: (ox + size + size / 2, oy + size, size / 4, size),
      front: (ox + size + size / 4, oy + size, size / 4, size),
      left: (ox + size, oy + size, size / 4, size),
      back: (ox + size + size * 3 / 4, oy + size, size / 4, size),
      // short fence rail 1
      stop1: (ox + x1 + size2, oy + y1, sizel / 2, size2),
      sbottom1: (ox + x1 + size2, oy + y1 + size2 + size3, sizel / 2, size2),
      sright1: (ox + x1 + size2 + sizel / 2, oy + y1 + size2, size2, size3),
      sfront1: (ox + x1 + size2, oy + y1 + size2, sizel / 2, size3),
      sleft1: (ox + x1, oy + y1 + size2, size2, size3),
      sback1: (ox + x1 + size2, oy + y1 + size2 * 2 + size3, sizel / 2, size3),
      // short fence rail 2
      stop2: (ox + x1 + size2, oy + y2, sizel / 2, size2),
      sbottom2: (ox + x1 + size2, oy + y2 + size2 + size3, sizel / 2, size2),
      sright2: (ox + x1 + size2 + sizel / 2, oy + y2 + size2, size2, size3),
      sfront2: (ox + x1 + size2, oy + y2 + size2, sizel / 2, size3),
      sleft2: (ox + x1, oy + y2 + size2, size2, size3),
      sback2: (ox + x1 + size2, oy + y2 + size2 * 2 + size3, sizel / 2, size3),
      // long fence rail 1
      ltop1: (ox + x2 + size2, oy + y1, sizel / 2, size2),
      lbottom1: (ox + x2 + size2, oy + y1 + size2 + size3, sizel / 2, size2),
      lright1: (ox + x2 + size2 + sizel, oy + y1 + size2, size2, size3),
      lfront1: (ox + x2 + size2, oy + y1 + size2, sizel / 2, size3),
      lleft1: (ox + x2, oy + y1 + size2, size2, size3),
      lback1: (ox + x2 + size2, oy + y1 + size2 * 2 + size3, sizel / 2, size3),
      l2top1: (ox + x2 + size2 + sizel / 2, oy + y1, sizel / 2, size2),
      l2bottom1: (ox + x2 + size2 + sizel / 2, oy + y1 + size2 + size3, sizel / 2, size2),
      l2front1: (ox + x2 + size2 + sizel / 2, oy + y1 + size2, sizel / 2, size3),
      l2back1: (ox + x2 + size2 + sizel / 2, oy + y1 + size2 * 2 + size3, sizel / 2, size3),
      // long fence rail 2
      ltop2: (ox + x2 + size2, oy + y2, sizel / 2, size2),
      lbottom2: (ox + x2 + size2, oy + y2 + size2 + size3, sizel / 2, size2),
      lright2: (ox + x2 + size2 + sizel, oy + y2 + size2, size2, size3),
      lfront2: (ox + x2 + size2, oy + y2 + size2, sizel / 2, size3),
      lleft2: (ox + x2, oy + y2 + size2, size2, size3),
      lback2: (ox + x2 + size2, oy + y2 + size2 * 2 + size3, sizel / 2, size3),
      l2top2: (ox + x2 + size2 + sizel / 2, oy + y2, sizel / 2, size2),
      l2bottom2: (ox + x2 + size2 + sizel / 2, oy + y2 + size2 + size3, sizel / 2, size2),
      l2front2: (ox + x2 + size2 + sizel / 2, oy + y2 + size2, sizel / 2, size3),
      l2back2: (ox + x2 + size2 + sizel / 2, oy + y2 + size2 * 2 + size3, sizel / 2, size3),
    }
  }

  let draw = (blockId: string, ox: int, oy: int) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("FenceFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("FenceFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("FenceFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("FenceFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("FenceFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("FenceFaceBack" ++ blockId, regions.back)

    Face.draw("FenceFaceTop" ++ blockId, (6, 6, 4, 4), regions.top)
    Face.draw("FenceFaceBottom" ++ blockId, (6, 6, 4, 4), regions.bottom)
    Face.draw("FenceFaceRight" ++ blockId, (6, 0, 4, 16), regions.right)
    Face.draw("FenceFaceFront" ++ blockId, (6, 0, 4, 16), regions.front)
    Face.draw("FenceFaceLeft" ++ blockId, (6, 0, 4, 16), regions.left)
    Face.draw("FenceFaceBack" ++ blockId, (6, 0, 4, 16), regions.back)

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.stop1)
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.sbottom1)
    Face.draw("FenceFaceRight" ++ blockId, (7, 1, 2, 3), regions.sright1)
    Face.draw("FenceFaceFront" ++ blockId, (10, 1, 6, 3), regions.sfront1)
    Face.draw("FenceFaceLeft" ++ blockId, (7, 1, 2, 3), regions.sleft1)
    Face.draw180("FenceFaceBack" ++ blockId, (0, 1, 6, 3), regions.sback1)

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.stop2)
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.sbottom2)
    Face.draw("FenceFaceRight" ++ blockId, (7, 7, 2, 3), regions.sright2)
    Face.draw("FenceFaceFront" ++ blockId, (10, 7, 6, 3), regions.sfront2)
    Face.draw("FenceFaceLeft" ++ blockId, (7, 7, 2, 3), regions.sleft2)
    Face.draw180("FenceFaceBack" ++ blockId, (0, 7, 6, 3), regions.sback2)

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.ltop1)
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.lbottom1)
    Face.draw("FenceFaceRight" ++ blockId, (7, 1, 2, 3), regions.lright1)
    Face.draw("FenceFaceFront" ++ blockId, (10, 1, 6, 3), regions.lfront1)
    Face.draw("FenceFaceLeft" ++ blockId, (7, 1, 2, 3), regions.lleft1)
    Face.draw180("FenceFaceBack" ++ blockId, (0, 1, 6, 3), regions.lback1)
    Face.draw("FenceFaceTop" ++ blockId, (0, 7, 6, 2), regions.l2top1)
    Face.draw("FenceFaceBottom" ++ blockId, (0, 7, 6, 2), regions.l2bottom1)
    Face.draw("FenceFaceFront" ++ blockId, (0, 1, 6, 3), regions.l2front1)
    Face.draw180("FenceFaceBack" ++ blockId, (7, 1, 6, 3), regions.l2back1)

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.ltop2)
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.lbottom2)
    Face.draw("FenceFaceRight" ++ blockId, (7, 7, 2, 3), regions.lright2)
    Face.draw("FenceFaceFront" ++ blockId, (10, 7, 6, 3), regions.lfront2)
    Face.draw("FenceFaceLeft" ++ blockId, (7, 7, 2, 3), regions.lleft2)
    Face.draw180("FenceFaceBack" ++ blockId, (0, 7, 6, 3), regions.lback2)
    Face.draw("FenceFaceTop" ++ blockId, (0, 7, 6, 2), regions.l2top2)
    Face.draw("FenceFaceBottom" ++ blockId, (0, 7, 6, 2), regions.l2bottom2)
    Face.draw("FenceFaceFront" ++ blockId, (0, 7, 6, 3), regions.l2front2)
    Face.draw180("FenceFaceBack" ++ blockId, (7, 7, 6, 3), regions.l2back2)

    Generator.drawImage("Tabs-Fence", (ox - 32, oy - 1))

    let showFolds = Generator.getBooleanInputValue("Show Folds")
    if showFolds {
      Generator.drawImage("Folds-Fence", (ox - 32, oy - 1))
    }
  }
}

let id = "minecraft-block"

let name = "Minecraft Block"

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background")},
  {id: "Title", url: requireImage("Title")},
  {id: "Folds-Block", url: requireImage("Folds-Block")},
  {id: "Tabs-Block", url: requireImage("Tabs-Block")},
  {id: "Folds-Slab", url: requireImage("Folds-Slab")},
  {id: "Tabs-Slab", url: requireImage("Tabs-Slab")},
  {id: "Folds-Stair", url: requireImage("Folds-Stair")},
  {id: "Tabs-Stair", url: requireImage("Tabs-Stair")},
  {id: "Folds-Fence", url: requireImage("Folds-Fence")},
  {id: "Tabs-Fence", url: requireImage("Tabs-Fence")},
]

let textures: array<Generator.textureDef> = Textures.textures

let script = () => {
  Generator.defineSelectInput("Version", Textures.versionIds)
  let versionId = Generator.getSelectInputValue("Version")

  Generator.defineCustomStringInput("BlockTexture", onChange => {
    <Components.TexturePicker versionId={versionId} onChange={onChange} />
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
    Generator.defineSelectInput(typeName, ["Block", "Slab", "Stair", "Fence"])
    let blockType = Generator.getSelectInputValue(typeName)

    switch blockType {
    | "Block" => {
        let ox = 57
        let oy = 16 + 400 * (i - 1)
        Block.draw(blockId, ox, oy)
      }
    | "Slab" => {
        let ox = 57
        let oy = 16 + 400 * (i - 1)
        Slab.draw(blockId, ox, oy)
      }
    | "Stair" => {
        let ox = 57
        let oy = 16 + 400 * (i - 1)
        Stair.draw(blockId, ox, oy)
      }
    | "Fence" => {
        let ox = 57
        let oy = 16 + 400 * (i - 1)
        Fence.draw(blockId, ox, oy)
      }
    | _ => ()
    }
  }

  Generator.drawImage("Title", (0, 0))
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
