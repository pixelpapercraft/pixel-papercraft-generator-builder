module Face = TextureFace

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

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("BlockFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("BlockFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("BlockFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("BlockFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("BlockFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("BlockFaceBack" ++ blockId, regions.back)

    Face.draw("BlockFaceTop" ++ blockId, (0, 0, 16, 16), regions.top, ())
    Face.draw("BlockFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("BlockFaceRight" ++ blockId, (0, 0, 16, 16), regions.right, ())
    Face.draw("BlockFaceFront" ++ blockId, (0, 0, 16, 16), regions.front, ())
    Face.draw("BlockFaceLeft" ++ blockId, (0, 0, 16, 16), regions.left, ())
    Face.draw("BlockFaceBack" ++ blockId, (0, 0, 16, 16), regions.back, ())

    Generator.drawImage("Tabs-Block", (ox - 32, oy - 1))

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

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("SlabFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("SlabFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("SlabFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("SlabFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("SlabFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("SlabFaceBack" ++ blockId, regions.back)

    Face.draw("SlabFaceTop" ++ blockId, (0, 0, 16, 16), regions.top, ())
    Face.draw("SlabFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("SlabFaceRight" ++ blockId, (0, 8, 16, 8), regions.right, ())
    Face.draw("SlabFaceFront" ++ blockId, (0, 8, 16, 8), regions.front, ())
    Face.draw("SlabFaceLeft" ++ blockId, (0, 8, 16, 8), regions.left, ())
    Face.draw("SlabFaceBack" ++ blockId, (0, 8, 16, 8), regions.back, ())

    Generator.drawImage("Tabs-Slab", (ox - 32, oy - 1))

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

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("StairFaceTop" ++ blockId, regions.top)
    //Face.defineInputRegion("StairFaceTop2" ++ blockId, regions.top2)
    Face.defineInputRegion("StairFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("StairFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("StairFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("StairFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("StairFaceBack" ++ blockId, regions.back)
    //Face.defineInputRegion("StairFaceBack2" ++ blockId, regions.back2)

    Face.draw("StairFaceTop" ++ blockId, (0, 8, 16, 8), regions.top, ())
    Face.draw("StairFaceBack" ++ blockId, (0, 0, 16, 8), regions.back2, ~rotate=180.0, ())
    Face.draw("StairFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("StairFaceRight" ++ blockId, (0, 0, 16, 16), regions.right, ())
    Face.draw("StairFaceFront" ++ blockId, (0, 0, 16, 16), regions.front, ())
    Face.draw("StairFaceLeft" ++ blockId, (0, 0, 16, 16), regions.left, ())
    Face.draw("StairFaceBack" ++ blockId, (0, 8, 16, 8), regions.back, ())
    Face.draw("StairFaceTop" ++ blockId, (0, 0, 16, 8), regions.top2, ~rotate=180.0, ())

    Generator.drawImage("Tabs-Stair", (ox - 32, oy - 1))

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

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("FenceFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("FenceFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("FenceFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("FenceFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("FenceFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("FenceFaceBack" ++ blockId, regions.back)

    Face.draw("FenceFaceTop" ++ blockId, (6, 6, 4, 4), regions.top, ())
    Face.draw("FenceFaceBottom" ++ blockId, (6, 6, 4, 4), regions.bottom, ())
    Face.draw("FenceFaceRight" ++ blockId, (6, 0, 4, 16), regions.right, ())
    Face.draw("FenceFaceFront" ++ blockId, (6, 0, 4, 16), regions.front, ())
    Face.draw("FenceFaceLeft" ++ blockId, (6, 0, 4, 16), regions.left, ())
    Face.draw("FenceFaceBack" ++ blockId, (6, 0, 4, 16), regions.back, ())

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.stop1, ())
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.sbottom1, ())
    Face.draw("FenceFaceRight" ++ blockId, (7, 1, 2, 3), regions.sright1, ())
    Face.draw("FenceFaceFront" ++ blockId, (10, 1, 6, 3), regions.sfront1, ())
    Face.draw("FenceFaceLeft" ++ blockId, (7, 1, 2, 3), regions.sleft1, ())
    Face.draw("FenceFaceBack" ++ blockId, (0, 1, 6, 3), regions.sback1, ~rotate=180.0, ())

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.stop2, ())
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.sbottom2, ())
    Face.draw("FenceFaceRight" ++ blockId, (7, 7, 2, 3), regions.sright2, ())
    Face.draw("FenceFaceFront" ++ blockId, (10, 7, 6, 3), regions.sfront2, ())
    Face.draw("FenceFaceLeft" ++ blockId, (7, 7, 2, 3), regions.sleft2, ())
    Face.draw("FenceFaceBack" ++ blockId, (0, 7, 6, 3), regions.sback2, ~rotate=180.0, ())

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.ltop1, ())
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.lbottom1, ())
    Face.draw("FenceFaceRight" ++ blockId, (7, 1, 2, 3), regions.lright1, ())
    Face.draw("FenceFaceFront" ++ blockId, (10, 1, 6, 3), regions.lfront1, ())
    Face.draw("FenceFaceLeft" ++ blockId, (7, 1, 2, 3), regions.lleft1, ())
    Face.draw("FenceFaceBack" ++ blockId, (0, 1, 6, 3), regions.lback1, ~rotate=180.0, ())
    Face.draw("FenceFaceTop" ++ blockId, (0, 7, 6, 2), regions.l2top1, ())
    Face.draw("FenceFaceBottom" ++ blockId, (0, 7, 6, 2), regions.l2bottom1, ())
    Face.draw("FenceFaceFront" ++ blockId, (0, 1, 6, 3), regions.l2front1, ())
    Face.draw("FenceFaceBack" ++ blockId, (7, 1, 6, 3), regions.l2back1, ~rotate=180.0, ())

    Face.draw("FenceFaceTop" ++ blockId, (10, 7, 6, 2), regions.ltop2, ())
    Face.draw("FenceFaceBottom" ++ blockId, (10, 7, 6, 2), regions.lbottom2, ())
    Face.draw("FenceFaceRight" ++ blockId, (7, 7, 2, 3), regions.lright2, ())
    Face.draw("FenceFaceFront" ++ blockId, (10, 7, 6, 3), regions.lfront2, ())
    Face.draw("FenceFaceLeft" ++ blockId, (7, 7, 2, 3), regions.lleft2, ())
    Face.draw("FenceFaceBack" ++ blockId, (0, 7, 6, 3), regions.lback2, ~rotate=180.0, ())
    Face.draw("FenceFaceTop" ++ blockId, (0, 7, 6, 2), regions.l2top2, ())
    Face.draw("FenceFaceBottom" ++ blockId, (0, 7, 6, 2), regions.l2bottom2, ())
    Face.draw("FenceFaceFront" ++ blockId, (0, 7, 6, 3), regions.l2front2, ())
    Face.draw("FenceFaceBack" ++ blockId, (7, 7, 6, 3), regions.l2back2, ~rotate=180.0, ())

    Generator.drawImage("Tabs-Fence", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Fence", (ox - 32, oy - 1))
    }
  }
}

module Door = {
  module Regions = {
    type faces = {
      top: region,
      bottom: region,
      right1: region,
      front1: region,
      left1: region,
      back1: region,
      right2: region,
      front2: region,
      left2: region,
      back2: region,
    }

    let size = 128
    let size2 = 24

    let make = (ox, oy): faces => {
      top: (ox + size * 3 / 2 - size2 / 2, oy - size2 / 2, size2, size),
      bottom: (ox + size * 3 / 2 - size2 / 2, oy + size * 2 + size2 / 2, size2, size),
      right1: (ox + size - size2, oy + size / 2, size2, size),
      front1: (ox + size, oy + size / 2, size, size),
      left1: (ox + size * 2, oy + size / 2, size2, size),
      back1: (ox + size * 2 + size2, oy + size / 2, size, size),
      right2: (ox + size - size2, oy + size * 3 / 2, size2, size),
      front2: (ox + size, oy + size * 3 / 2, size, size),
      left2: (ox + size * 2, oy + size * 3 / 2, size2, size),
      back2: (ox + size * 2 + size2, oy + size * 3 / 2, size, size),
    }
  }

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("DoorFace1" ++ blockId, regions.front1)
    Face.defineInputRegion("DoorFace2" ++ blockId, regions.front2)

    Face.draw("DoorFace2" ++ blockId, (13, 0, 3, 16), regions.top, ~rotate=-90.0, ())
    Face.draw("DoorFace2" ++ blockId, (13, 0, 3, 16), regions.bottom, ~rotate=90.0, ())
    Face.draw("DoorFace1" ++ blockId, (0, 0, 3, 16), regions.right1, ~flip=#Horizontal, ())
    Face.draw("DoorFace1" ++ blockId, (0, 0, 16, 16), regions.front1, ())
    Face.draw("DoorFace1" ++ blockId, (0, 0, 3, 16), regions.left1, ())
    Face.draw("DoorFace1" ++ blockId, (0, 0, 16, 16), regions.back1, ~flip=#Horizontal, ())
    Face.draw("DoorFace2" ++ blockId, (0, 0, 3, 16), regions.right2, ~flip=#Horizontal, ())
    Face.draw("DoorFace2" ++ blockId, (0, 0, 16, 16), regions.front2, ())
    Face.draw("DoorFace2" ++ blockId, (0, 0, 3, 16), regions.left2, ())
    Face.draw("DoorFace2" ++ blockId, (0, 0, 16, 16), regions.back2, ~flip=#Horizontal, ())

    Generator.drawImage("Tabs-Door", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Door", (ox - 32, oy - 1))
    }
  }
}

module Trapdoor = {
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
    let size2 = 24

    let make = (ox, oy): faces => {
      top: (ox + size, oy + size - size2, size, size2),
      bottom: (ox + size, oy + size * 2, size, size2),
      right: (ox + size / 2 - size2 / 2, oy + size * 3 / 2 - size2 / 2, size, size2),
      front: (ox + size, oy + size, size, size),
      left: (ox + size * 3 / 2 + size2 / 2, oy + size * 3 / 2 - size2 / 2, size, size2),
      back: (ox + size * 2 + size2, oy + size, size, size),
    }
  }

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("TrapdoorFace" ++ blockId, regions.front)

    Face.draw("TrapdoorFace" ++ blockId, (0, 0, 16, 3), regions.top, ~rotate=180.0, ())
    Face.draw("TrapdoorFace" ++ blockId, (0, 0, 16, 3), regions.bottom, ())
    Face.draw("TrapdoorFace" ++ blockId, (0, 0, 16, 3), regions.right, ~rotate=90.0, ())
    Face.draw("TrapdoorFace" ++ blockId, (0, 0, 16, 16), regions.front, ~flip=#Horizontal, ())
    Face.draw("TrapdoorFace" ++ blockId, (0, 0, 16, 3), regions.left, ~rotate=-90.0, ())
    Face.draw("TrapdoorFace" ++ blockId, (0, 0, 16, 16), regions.back, ())

    Generator.drawImage("Tabs-Trapdoor", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Trapdoor", (ox - 32, oy - 1))
    }
  }
}

module Snow = {
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

    let make = (ox, oy, levels, offset): faces => {
      top: (ox + size, oy + size - levels * 16 + offset * 8, size, size),
      bottom: (ox + size, oy + size * 2, size, size),
      right: (ox, oy + size * 2 - levels * 16 + offset * 8, size, levels * 16 - offset * 8),
      front: (ox + size, oy + size * 2 - levels * 16 + offset * 8, size, levels * 16 - offset * 8),
      left: (
        ox + size * 2,
        oy + size * 2 - levels * 16 + offset * 8,
        size,
        levels * 16 - offset * 8,
      ),
      back: (
        ox + size * 3,
        oy + size * 2 - levels * 16 + offset * 8,
        size,
        levels * 16 - offset * 8,
      ),
    }
  }

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    Generator.defineSelectInput(
      "Block " ++ blockId ++ " Level",
      ["1", "2", "3", "4", "5", "6", "7", "8"],
    )
    Generator.defineBooleanInput("Block " ++ blockId ++ " Offset for Intermediate Levels", false)

    let levels =
      Generator.getSelectInputValue("Block " ++ blockId ++ " Level")
      ->Belt.Int.fromString
      ->Belt.Option.getWithDefault(1)

    let offset = Generator.getBooleanInputValue(
      "Block " ++ blockId ++ " Offset for Intermediate Levels",
    )
      ? 1
      : 0

    let regions = Regions.make(ox, oy, levels, offset)

    Face.defineInputRegion("SnowFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("SnowFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("SnowFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("SnowFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("SnowFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("SnowFaceBack" ++ blockId, regions.back)

    Face.draw("SnowFaceTop" ++ blockId, (0, 0, 16, 16), regions.top, ())
    Face.draw("SnowFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw(
      "SnowFaceRight" ++ blockId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.right,
      (),
    )
    Face.draw(
      "SnowFaceFront" ++ blockId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.front,
      (),
    )
    Face.draw(
      "SnowFaceLeft" ++ blockId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.left,
      (),
    )
    Face.draw(
      "SnowFaceBack" ++ blockId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.back,
      (),
    )

    Generator.drawImage("Tabs-Snow-Bottom", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Snow-Bottom", (ox - 32, oy - 1))
    }

    Generator.drawImage("Tabs-Snow-Top", (ox - 32, oy - 1 + 128 - levels * 16 + offset * 8))
    Generator.drawImage("Tabs-Snow-Middle", (ox - 32, oy - 1))
    if showFolds {
      Generator.drawImage("Folds-Snow-Top", (ox - 32, oy - 1 + 128 - levels * 16 + offset * 8))
    }
  }
}

module Cake = {
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
    let dif = 16
    let sizeb = 16
    let sizec = size - dif

    let make = (ox, oy, bites): faces => {
      top: (ox + size, oy + size / 2 + dif, sizec - sizeb * bites, sizec),
      bottom: (ox + size, oy + size * 2, sizec - sizeb * bites, sizec),
      right: (ox + dif, oy + size * 3 / 2, sizec, size / 2),
      front: (ox + size, oy + size * 3 / 2, sizec - sizeb * bites, size / 2),
      left: (ox + sizec * 2 + dif - sizeb * bites, oy + size * 3 / 2, sizec, size / 2),
      back: (
        ox + sizec * 3 + dif - sizeb * bites,
        oy + size * 3 / 2,
        sizec - sizeb * bites,
        size / 2,
      ),
    }
  }

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    Generator.defineSelectInput(
      "Block " ++ blockId ++ " Bites Taken",
      ["0", "1", "2", "3", "4", "5", "6"],
    )

    let bites =
      Generator.getSelectInputValue("Block " ++ blockId ++ " Bites Taken")
      ->Belt.Int.fromString
      ->Belt.Option.getWithDefault(1)

    let regions = Regions.make(ox, oy, bites)

    Face.defineInputRegion("CakeFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("CakeFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("CakeFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("CakeFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("CakeFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("CakeFaceBack" ++ blockId, regions.back)

    Face.draw("CakeFaceTop" ++ blockId, (1 + bites * 2, 1, 14 - 2 * bites, 14), regions.top, ())
    Face.draw(
      "CakeFaceBottom" ++ blockId,
      (1 + bites * 2, 1, 14 - 2 * bites, 14),
      regions.bottom,
      (),
    )
    Face.draw("CakeFaceRight" ++ blockId, (1, 8, 14, 8), regions.right, ())
    Face.draw("CakeFaceFront" ++ blockId, (1 + bites * 2, 8, 14 - 2 * bites, 8), regions.front, ())
    Face.draw("CakeFaceLeft" ++ blockId, (1, 8, 14, 8), regions.left, ())
    Face.draw("CakeFaceBack" ++ blockId, (1, 8, 14 - 2 * bites, 8), regions.back, ())

    Generator.drawImage("Tabs-Cake-Left", (ox - 32, oy - 1))
    if showFolds {
      Generator.drawImage("Folds-Cake-Left", (ox - 32, oy - 1))
    }

    Generator.drawImage("Tabs-Cake-Middle", (ox - 32 - bites * 16, oy - 1))
    if showFolds {
      Generator.drawImage("Folds-Cake-Middle", (ox - 32 - bites * 16, oy - 1))
    }

    Generator.drawImage("Tabs-Cake-Right", (ox - 16 - bites * 32, oy - 1))
    if showFolds {
      Generator.drawImage("Folds-Cake-Right", (ox - 32 - bites * 32, oy - 1))
    }

    Generator.drawImage("Tabs-Cake-Corner", (ox - 32 - bites * 16, oy - 1))
  }
}

module Minecart = {
  module Regions = {
    type faces = {
      top: region,
      bottom: region,
      right: region,
      front: region,
      left: region,
      back: region,
    }

    let size = 96
    let d = 48

    let make = (ox, oy): faces => {
      top: (ox + d + size, oy + d, size, size),
      bottom: (ox + d + size, oy + d + size * 2, size, size),
      right: (ox + d, oy + d + size, size, size),
      front: (ox + d + size, oy + d + size, size, size),
      left: (ox + d + size * 2, oy + d + size, size, size),
      back: (ox + d + size * 3, oy + d + size, size, size),
    }
  }

  let draw = (blockId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("MinecartFaceTop" ++ blockId, regions.top)
    Face.defineInputRegion("MinecartFaceBottom" ++ blockId, regions.bottom)
    Face.defineInputRegion("MinecartFaceRight" ++ blockId, regions.right)
    Face.defineInputRegion("MinecartFaceFront" ++ blockId, regions.front)
    Face.defineInputRegion("MinecartFaceLeft" ++ blockId, regions.left)
    Face.defineInputRegion("MinecartFaceBack" ++ blockId, regions.back)

    Face.draw("MinecartFaceTop" ++ blockId, (0, 0, 16, 16), regions.top, ())
    Face.draw("MinecartFaceBottom" ++ blockId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("MinecartFaceRight" ++ blockId, (0, 0, 16, 16), regions.right, ())
    Face.draw("MinecartFaceFront" ++ blockId, (0, 0, 16, 16), regions.front, ())
    Face.draw("MinecartFaceLeft" ++ blockId, (0, 0, 16, 16), regions.left, ())
    Face.draw("MinecartFaceBack" ++ blockId, (0, 0, 16, 16), regions.back, ())

    Generator.drawImage("Tabs-Minecart", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Minecart", (ox - 32, oy - 1))
    }
  }
}
