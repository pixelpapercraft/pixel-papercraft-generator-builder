module TexturePicker = MinecraftDiorama_TexturePicker
module Textures = MinecraftDiorama_Textures
module Face = MinecraftDiorama_Face

type region = (int, int, int, int)

module Diorama = {
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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("DioramaFaceTop" ++ dioramaId, regions.top)
    Face.defineInputRegion("DioramaFaceBottom" ++ dioramaId, regions.bottom)
    Face.defineInputRegion("DioramaFaceRight" ++ dioramaId, regions.right)
    Face.defineInputRegion("DioramaFaceFront" ++ dioramaId, regions.front)
    Face.defineInputRegion("DioramaFaceLeft" ++ dioramaId, regions.left)
    Face.defineInputRegion("DioramaFaceBack" ++ dioramaId, regions.back)

    Face.draw("DioramaFaceTop" ++ dioramaId, (0, 0, 16, 16), regions.top, ())
    Face.draw("DioramaFaceBottom" ++ dioramaId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("DioramaFaceRight" ++ dioramaId, (0, 0, 16, 16), regions.right, ())
    Face.draw("DioramaFaceFront" ++ dioramaId, (0, 0, 16, 16), regions.front, ())
    Face.draw("DioramaFaceLeft" ++ dioramaId, (0, 0, 16, 16), regions.left, ())
    Face.draw("DioramaFaceBack" ++ dioramaId, (0, 0, 16, 16), regions.back, ())

    Generator.drawImage("Tabs-Diorama", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Diorama", (ox - 32, oy - 1))
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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("SlabFaceTop" ++ dioramaId, regions.top)
    Face.defineInputRegion("SlabFaceBottom" ++ dioramaId, regions.bottom)
    Face.defineInputRegion("SlabFaceRight" ++ dioramaId, regions.right)
    Face.defineInputRegion("SlabFaceFront" ++ dioramaId, regions.front)
    Face.defineInputRegion("SlabFaceLeft" ++ dioramaId, regions.left)
    Face.defineInputRegion("SlabFaceBack" ++ dioramaId, regions.back)

    Face.draw("SlabFaceTop" ++ dioramaId, (0, 0, 16, 16), regions.top, ())
    Face.draw("SlabFaceBottom" ++ dioramaId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("SlabFaceRight" ++ dioramaId, (0, 8, 16, 8), regions.right, ())
    Face.draw("SlabFaceFront" ++ dioramaId, (0, 8, 16, 8), regions.front, ())
    Face.draw("SlabFaceLeft" ++ dioramaId, (0, 8, 16, 8), regions.left, ())
    Face.draw("SlabFaceBack" ++ dioramaId, (0, 8, 16, 8), regions.back, ())

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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("StairFaceTop" ++ dioramaId, regions.top)
    //Face.defineInputRegion("StairFaceTop2" ++ dioramaId, regions.top2)
    Face.defineInputRegion("StairFaceBottom" ++ dioramaId, regions.bottom)
    Face.defineInputRegion("StairFaceRight" ++ dioramaId, regions.right)
    Face.defineInputRegion("StairFaceFront" ++ dioramaId, regions.front)
    Face.defineInputRegion("StairFaceLeft" ++ dioramaId, regions.left)
    Face.defineInputRegion("StairFaceBack" ++ dioramaId, regions.back)
    //Face.defineInputRegion("StairFaceBack2" ++ dioramaId, regions.back2)

    Face.draw("StairFaceTop" ++ dioramaId, (0, 8, 16, 8), regions.top, ())
    Face.draw("StairFaceBack" ++ dioramaId, (0, 0, 16, 8), regions.back2, ~rotate=180.0, ())
    Face.draw("StairFaceBottom" ++ dioramaId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw("StairFaceRight" ++ dioramaId, (0, 0, 16, 16), regions.right, ())
    Face.draw("StairFaceFront" ++ dioramaId, (0, 0, 16, 16), regions.front, ())
    Face.draw("StairFaceLeft" ++ dioramaId, (0, 0, 16, 16), regions.left, ())
    Face.draw("StairFaceBack" ++ dioramaId, (0, 8, 16, 8), regions.back, ())
    Face.draw("StairFaceTop" ++ dioramaId, (0, 0, 16, 8), regions.top2, ~rotate=180.0, ())

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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("FenceFaceTop" ++ dioramaId, regions.top)
    Face.defineInputRegion("FenceFaceBottom" ++ dioramaId, regions.bottom)
    Face.defineInputRegion("FenceFaceRight" ++ dioramaId, regions.right)
    Face.defineInputRegion("FenceFaceFront" ++ dioramaId, regions.front)
    Face.defineInputRegion("FenceFaceLeft" ++ dioramaId, regions.left)
    Face.defineInputRegion("FenceFaceBack" ++ dioramaId, regions.back)

    Face.draw("FenceFaceTop" ++ dioramaId, (6, 6, 4, 4), regions.top, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (6, 6, 4, 4), regions.bottom, ())
    Face.draw("FenceFaceRight" ++ dioramaId, (6, 0, 4, 16), regions.right, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (6, 0, 4, 16), regions.front, ())
    Face.draw("FenceFaceLeft" ++ dioramaId, (6, 0, 4, 16), regions.left, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (6, 0, 4, 16), regions.back, ())

    Face.draw("FenceFaceTop" ++ dioramaId, (10, 7, 6, 2), regions.stop1, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (10, 7, 6, 2), regions.sbottom1, ())
    Face.draw("FenceFaceRight" ++ dioramaId, (7, 1, 2, 3), regions.sright1, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (10, 1, 6, 3), regions.sfront1, ())
    Face.draw("FenceFaceLeft" ++ dioramaId, (7, 1, 2, 3), regions.sleft1, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (0, 1, 6, 3), regions.sback1, ~rotate=180.0, ())

    Face.draw("FenceFaceTop" ++ dioramaId, (10, 7, 6, 2), regions.stop2, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (10, 7, 6, 2), regions.sbottom2, ())
    Face.draw("FenceFaceRight" ++ dioramaId, (7, 7, 2, 3), regions.sright2, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (10, 7, 6, 3), regions.sfront2, ())
    Face.draw("FenceFaceLeft" ++ dioramaId, (7, 7, 2, 3), regions.sleft2, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (0, 7, 6, 3), regions.sback2, ~rotate=180.0, ())

    Face.draw("FenceFaceTop" ++ dioramaId, (10, 7, 6, 2), regions.ltop1, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (10, 7, 6, 2), regions.lbottom1, ())
    Face.draw("FenceFaceRight" ++ dioramaId, (7, 1, 2, 3), regions.lright1, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (10, 1, 6, 3), regions.lfront1, ())
    Face.draw("FenceFaceLeft" ++ dioramaId, (7, 1, 2, 3), regions.lleft1, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (0, 1, 6, 3), regions.lback1, ~rotate=180.0, ())
    Face.draw("FenceFaceTop" ++ dioramaId, (0, 7, 6, 2), regions.l2top1, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (0, 7, 6, 2), regions.l2bottom1, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (0, 1, 6, 3), regions.l2front1, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (7, 1, 6, 3), regions.l2back1, ~rotate=180.0, ())

    Face.draw("FenceFaceTop" ++ dioramaId, (10, 7, 6, 2), regions.ltop2, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (10, 7, 6, 2), regions.lbottom2, ())
    Face.draw("FenceFaceRight" ++ dioramaId, (7, 7, 2, 3), regions.lright2, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (10, 7, 6, 3), regions.lfront2, ())
    Face.draw("FenceFaceLeft" ++ dioramaId, (7, 7, 2, 3), regions.lleft2, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (0, 7, 6, 3), regions.lback2, ~rotate=180.0, ())
    Face.draw("FenceFaceTop" ++ dioramaId, (0, 7, 6, 2), regions.l2top2, ())
    Face.draw("FenceFaceBottom" ++ dioramaId, (0, 7, 6, 2), regions.l2bottom2, ())
    Face.draw("FenceFaceFront" ++ dioramaId, (0, 7, 6, 3), regions.l2front2, ())
    Face.draw("FenceFaceBack" ++ dioramaId, (7, 7, 6, 3), regions.l2back2, ~rotate=180.0, ())

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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("DoorFace1" ++ dioramaId, regions.front1)
    Face.defineInputRegion("DoorFace2" ++ dioramaId, regions.front2)

    Face.draw("DoorFace2" ++ dioramaId, (13, 0, 3, 16), regions.top, ~rotate=-90.0, ())
    Face.draw("DoorFace2" ++ dioramaId, (13, 0, 3, 16), regions.bottom, ~rotate=90.0, ())
    Face.draw("DoorFace1" ++ dioramaId, (0, 0, 3, 16), regions.right1, ~flip=#Horizontal, ())
    Face.draw("DoorFace1" ++ dioramaId, (0, 0, 16, 16), regions.front1, ())
    Face.draw("DoorFace1" ++ dioramaId, (0, 0, 3, 16), regions.left1, ())
    Face.draw("DoorFace1" ++ dioramaId, (0, 0, 16, 16), regions.back1, ~flip=#Horizontal, ())
    Face.draw("DoorFace2" ++ dioramaId, (0, 0, 3, 16), regions.right2, ~flip=#Horizontal, ())
    Face.draw("DoorFace2" ++ dioramaId, (0, 0, 16, 16), regions.front2, ())
    Face.draw("DoorFace2" ++ dioramaId, (0, 0, 3, 16), regions.left2, ())
    Face.draw("DoorFace2" ++ dioramaId, (0, 0, 16, 16), regions.back2, ~flip=#Horizontal, ())

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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("TrapdoorFace" ++ dioramaId, regions.front)

    Face.draw("TrapdoorFace" ++ dioramaId, (0, 0, 16, 3), regions.top, ~rotate=180.0, ())
    Face.draw("TrapdoorFace" ++ dioramaId, (0, 0, 16, 3), regions.bottom, ())
    Face.draw("TrapdoorFace" ++ dioramaId, (0, 0, 16, 3), regions.right, ~rotate=90.0, ())
    Face.draw("TrapdoorFace" ++ dioramaId, (0, 0, 16, 16), regions.front, ~flip=#Horizontal, ())
    Face.draw("TrapdoorFace" ++ dioramaId, (0, 0, 16, 3), regions.left, ~rotate=-90.0, ())
    Face.draw("TrapdoorFace" ++ dioramaId, (0, 0, 16, 16), regions.back, ())

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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    Generator.defineSelectInput(
      "Diorama " ++ dioramaId ++ " Level",
      ["1", "2", "3", "4", "5", "6", "7", "8"],
    )
    Generator.defineBooleanInput(
      "Diorama " ++ dioramaId ++ " Offset for Intermediate Levels",
      false,
    )

    let levels =
      Generator.getSelectInputValue("Diorama " ++ dioramaId ++ " Level")
      ->Belt.Int.fromString
      ->Belt.Option.getWithDefault(1)

    let offset = Generator.getBooleanInputValue(
      "Diorama " ++ dioramaId ++ " Offset for Intermediate Levels",
    )
      ? 1
      : 0

    let regions = Regions.make(ox, oy, levels, offset)

    Face.defineInputRegion("SnowFaceTop" ++ dioramaId, regions.top)
    Face.defineInputRegion("SnowFaceBottom" ++ dioramaId, regions.bottom)
    Face.defineInputRegion("SnowFaceRight" ++ dioramaId, regions.right)
    Face.defineInputRegion("SnowFaceFront" ++ dioramaId, regions.front)
    Face.defineInputRegion("SnowFaceLeft" ++ dioramaId, regions.left)
    Face.defineInputRegion("SnowFaceBack" ++ dioramaId, regions.back)

    Face.draw("SnowFaceTop" ++ dioramaId, (0, 0, 16, 16), regions.top, ())
    Face.draw("SnowFaceBottom" ++ dioramaId, (0, 0, 16, 16), regions.bottom, ())
    Face.draw(
      "SnowFaceRight" ++ dioramaId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.right,
      (),
    )
    Face.draw(
      "SnowFaceFront" ++ dioramaId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.front,
      (),
    )
    Face.draw(
      "SnowFaceLeft" ++ dioramaId,
      (0, 16 - levels * 2 + offset, 16, levels * 2 - offset),
      regions.left,
      (),
    )
    Face.draw(
      "SnowFaceBack" ++ dioramaId,
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

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    Generator.defineSelectInput(
      "Diorama " ++ dioramaId ++ " Bites Taken",
      ["0", "1", "2", "3", "4", "5", "6"],
    )

    let bites =
      Generator.getSelectInputValue("Diorama " ++ dioramaId ++ " Bites Taken")
      ->Belt.Int.fromString
      ->Belt.Option.getWithDefault(1)

    let regions = Regions.make(ox, oy, bites)

    Face.defineInputRegion("CakeFaceTop" ++ dioramaId, regions.top)
    Face.defineInputRegion("CakeFaceBottom" ++ dioramaId, regions.bottom)
    Face.defineInputRegion("CakeFaceRight" ++ dioramaId, regions.right)
    Face.defineInputRegion("CakeFaceFront" ++ dioramaId, regions.front)
    Face.defineInputRegion("CakeFaceLeft" ++ dioramaId, regions.left)
    Face.defineInputRegion("CakeFaceBack" ++ dioramaId, regions.back)

    Face.draw("CakeFaceTop" ++ dioramaId, (1 + bites * 2, 1, 14 - 2 * bites, 14), regions.top, ())
    Face.draw(
      "CakeFaceBottom" ++ dioramaId,
      (1 + bites * 2, 1, 14 - 2 * bites, 14),
      regions.bottom,
      (),
    )
    Face.draw("CakeFaceRight" ++ dioramaId, (1, 8, 14, 8), regions.right, ())
    Face.draw(
      "CakeFaceFront" ++ dioramaId,
      (1 + bites * 2, 8, 14 - 2 * bites, 8),
      regions.front,
      (),
    )
    Face.draw("CakeFaceLeft" ++ dioramaId, (1, 8, 14, 8), regions.left, ())
    Face.draw("CakeFaceBack" ++ dioramaId, (1, 8, 14 - 2 * bites, 8), regions.back, ())

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

module Free = {
  module Regions = {
    type faces = {
      a1: region,
      a2: region,
      a3: region,
      a4: region,
      b1: region,
      b2: region,
      b3: region,
      b4: region,
      c1: region,
      c2: region,
      c3: region,
      c4: region,
      d1: region,
      d2: region,
      d3: region,
      d4: region,
      e1: region,
      e2: region,
      e3: region,
      e4: region,
      f1: region,
      f2: region,
      f3: region,
      f4: region,
    }

    let size = 128

    let make = (ox, oy): faces => {
      a1: (ox + size * 0, oy + size * 0, size, size),
      a2: (ox + size * 1, oy + size * 0, size, size),
      a3: (ox + size * 2, oy + size * 0, size, size),
      a4: (ox + size * 3, oy + size * 0, size, size),
      b1: (ox + size * 0, oy + size * 1, size, size),
      b2: (ox + size * 1, oy + size * 1, size, size),
      b3: (ox + size * 2, oy + size * 1, size, size),
      b4: (ox + size * 3, oy + size * 1, size, size),
      c1: (ox + size * 0, oy + size * 2, size, size),
      c2: (ox + size * 1, oy + size * 2, size, size),
      c3: (ox + size * 2, oy + size * 2, size, size),
      c4: (ox + size * 3, oy + size * 2, size, size),
      d1: (ox + size * 0, oy + size * 3, size, size),
      d2: (ox + size * 1, oy + size * 3, size, size),
      d3: (ox + size * 2, oy + size * 3, size, size),
      d4: (ox + size * 3, oy + size * 3, size, size),
      e1: (ox + size * 0, oy + size * 4, size, size),
      e2: (ox + size * 1, oy + size * 4, size, size),
      e3: (ox + size * 2, oy + size * 4, size, size),
      e4: (ox + size * 3, oy + size * 4, size, size),
      f1: (ox + size * 0, oy + size * 5, size, size),
      f2: (ox + size * 1, oy + size * 5, size, size),
      f3: (ox + size * 2, oy + size * 5, size, size),
      f4: (ox + size * 3, oy + size * 5, size, size),
    }
  }

  let draw = (dioramaId: string, ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("FreeFaceA1" ++ dioramaId, regions.a1)
    Face.defineInputRegion("FreeFaceA2" ++ dioramaId, regions.a2)
    Face.defineInputRegion("FreeFaceA3" ++ dioramaId, regions.a3)
    Face.defineInputRegion("FreeFaceA4" ++ dioramaId, regions.a4)
    Face.defineInputRegion("FreeFaceB1" ++ dioramaId, regions.b1)
    Face.defineInputRegion("FreeFaceB2" ++ dioramaId, regions.b2)
    Face.defineInputRegion("FreeFaceB3" ++ dioramaId, regions.b3)
    Face.defineInputRegion("FreeFaceB4" ++ dioramaId, regions.b4)
    Face.defineInputRegion("FreeFaceC1" ++ dioramaId, regions.c1)
    Face.defineInputRegion("FreeFaceC2" ++ dioramaId, regions.c2)
    Face.defineInputRegion("FreeFaceC3" ++ dioramaId, regions.c3)
    Face.defineInputRegion("FreeFaceC4" ++ dioramaId, regions.c4)
    Face.defineInputRegion("FreeFaceD1" ++ dioramaId, regions.d1)
    Face.defineInputRegion("FreeFaceD2" ++ dioramaId, regions.d2)
    Face.defineInputRegion("FreeFaceD3" ++ dioramaId, regions.d3)
    Face.defineInputRegion("FreeFaceD4" ++ dioramaId, regions.d4)
    Face.defineInputRegion("FreeFaceE1" ++ dioramaId, regions.e1)
    Face.defineInputRegion("FreeFaceE2" ++ dioramaId, regions.e2)
    Face.defineInputRegion("FreeFaceE3" ++ dioramaId, regions.e3)
    Face.defineInputRegion("FreeFaceE4" ++ dioramaId, regions.e4)
    Face.defineInputRegion("FreeFaceF1" ++ dioramaId, regions.f1)
    Face.defineInputRegion("FreeFaceF2" ++ dioramaId, regions.f2)
    Face.defineInputRegion("FreeFaceF3" ++ dioramaId, regions.f3)
    Face.defineInputRegion("FreeFaceF4" ++ dioramaId, regions.f4)

    Face.draw("FreeFaceA1" ++ dioramaId, (0, 0, 16, 16), regions.a1, ())
    Face.draw("FreeFaceA2" ++ dioramaId, (0, 0, 16, 16), regions.a2, ())
    Face.draw("FreeFaceA3" ++ dioramaId, (0, 0, 16, 16), regions.a3, ())
    Face.draw("FreeFaceA4" ++ dioramaId, (0, 0, 16, 16), regions.a4, ())
    Face.draw("FreeFaceB1" ++ dioramaId, (0, 0, 16, 16), regions.b1, ())
    Face.draw("FreeFaceB2" ++ dioramaId, (0, 0, 16, 16), regions.b2, ())
    Face.draw("FreeFaceB3" ++ dioramaId, (0, 0, 16, 16), regions.b3, ())
    Face.draw("FreeFaceB4" ++ dioramaId, (0, 0, 16, 16), regions.b4, ())
    Face.draw("FreeFaceC1" ++ dioramaId, (0, 0, 16, 16), regions.c1, ())
    Face.draw("FreeFaceC2" ++ dioramaId, (0, 0, 16, 16), regions.c2, ())
    Face.draw("FreeFaceC3" ++ dioramaId, (0, 0, 16, 16), regions.c3, ())
    Face.draw("FreeFaceC4" ++ dioramaId, (0, 0, 16, 16), regions.c4, ())
    Face.draw("FreeFaceD1" ++ dioramaId, (0, 0, 16, 16), regions.d1, ())
    Face.draw("FreeFaceD2" ++ dioramaId, (0, 0, 16, 16), regions.d2, ())
    Face.draw("FreeFaceD3" ++ dioramaId, (0, 0, 16, 16), regions.d3, ())
    Face.draw("FreeFaceD4" ++ dioramaId, (0, 0, 16, 16), regions.d4, ())
    Face.draw("FreeFaceE1" ++ dioramaId, (0, 0, 16, 16), regions.e1, ())
    Face.draw("FreeFaceE2" ++ dioramaId, (0, 0, 16, 16), regions.e2, ())
    Face.draw("FreeFaceE3" ++ dioramaId, (0, 0, 16, 16), regions.e3, ())
    Face.draw("FreeFaceE4" ++ dioramaId, (0, 0, 16, 16), regions.e4, ())
    Face.draw("FreeFaceF1" ++ dioramaId, (0, 0, 16, 16), regions.f1, ())
    Face.draw("FreeFaceF2" ++ dioramaId, (0, 0, 16, 16), regions.f2, ())
    Face.draw("FreeFaceF3" ++ dioramaId, (0, 0, 16, 16), regions.f3, ())
    Face.draw("FreeFaceF4" ++ dioramaId, (0, 0, 16, 16), regions.f4, ())
    //Generator.drawImage("Tabs-Diorama", (ox - 32, oy - 1))

    //if showFolds {
    //  Generator.drawImage("Folds-Diorama", (ox - 32, oy - 1))
    //}
  }
}
