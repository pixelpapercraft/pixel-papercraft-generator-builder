module Builder = Generator.Builder

module CuboidLegacy = {
  type t = {
    top: Builder.rectangleLegacy,
    bottom: Builder.rectangleLegacy,
    front: Builder.rectangleLegacy,
    right: Builder.rectangleLegacy,
    left: Builder.rectangleLegacy,
    back: Builder.rectangleLegacy,
  }

  // W = Width
  // H = Height
  // D = Depth
  //
  // (0,0)
  //   .         +----W----+
  //             |         |
  //             D   Top   D
  //             |         |
  //   +----D----+----W----+----D----+----W----+
  //   |         |         |         |         |
  //   H  Right  H  Front  H  Left   H  Back   H
  //   |         |         |         |         |
  //   +----D----+----W----+----D----+----W----+
  //             |         |
  //             D Bottom  D
  //             |         |
  //             +----W----+
  //
  let make = (width, height, depth): t => {
    top: {x: depth, y: 0, w: width, h: depth},
    bottom: {x: depth + width, y: 0, w: width, h: depth},
    front: {x: depth, y: depth, w: width, h: height},
    right: {x: 0, y: depth, w: depth, h: height},
    left: {x: depth + width, y: depth, w: depth, h: height},
    back: {x: depth * 2 + width, y: depth, w: width, h: height},
  }

  let translateRectangle = (
    rectangle: Builder.rectangleLegacy,
    xTranslate: int,
    yTranslate: int,
  ): Builder.rectangleLegacy => {
    let {x, y, w, h} = rectangle
    {
      x: x + xTranslate,
      y: y + yTranslate,
      w: w,
      h: h,
    }
  }

  let translate = (cuboid: t, xTranslate: int, yTranslate: int): t => {
    let {top, bottom, left, right, front, back} = cuboid
    {
      top: translateRectangle(top, xTranslate, yTranslate),
      bottom: translateRectangle(bottom, xTranslate, yTranslate),
      left: translateRectangle(left, xTranslate, yTranslate),
      right: translateRectangle(right, xTranslate, yTranslate),
      front: translateRectangle(front, xTranslate, yTranslate),
      back: translateRectangle(back, xTranslate, yTranslate),
    }
  }
}

module Cuboid = {
  type t = {
    top: Builder.rectangle,
    bottom: Builder.rectangle,
    front: Builder.rectangle,
    right: Builder.rectangle,
    left: Builder.rectangle,
    back: Builder.rectangle,
  }

  // W = Width
  // H = Height
  // D = Depth
  //
  // (0,0)
  //   .         +----W----+
  //             |         |
  //             D   Top   D
  //             |         |
  //   +----D----+----W----+----D----+----W----+
  //   |         |         |         |         |
  //   H  Right  H  Front  H  Left   H  Back   H
  //   |         |         |         |         |
  //   +----D----+----W----+----D----+----W----+
  //             |         |
  //             D Bottom  D
  //             |         |
  //             +----W----+
  //
  let make = (width, height, depth): t => {
    top: (depth, 0, width, depth),
    bottom: (depth + width, 0, width, depth),
    front: (depth, depth, width, height),
    right: (0, depth, depth, height),
    left: (depth + width, depth, depth, height),
    back: (depth * 2 + width, depth, width, height),
  }

  let translateRectangle = (
    rectangle: Builder.rectangle,
    xTranslate: int,
    yTranslate: int,
  ): Builder.rectangle => {
    let (x, y, w, h) = rectangle
    (x + xTranslate, y + yTranslate, w, h)
  }

  let translate = (cuboid: t, xTranslate: int, yTranslate: int): t => {
    let {top, bottom, left, right, front, back} = cuboid
    {
      top: translateRectangle(top, xTranslate, yTranslate),
      bottom: translateRectangle(bottom, xTranslate, yTranslate),
      left: translateRectangle(left, xTranslate, yTranslate),
      right: translateRectangle(right, xTranslate, yTranslate),
      front: translateRectangle(front, xTranslate, yTranslate),
      back: translateRectangle(back, xTranslate, yTranslate),
    }
  }
}

module MinecraftCharacterLegacy = {
  module Layer = {
    type t = {
      head: CuboidLegacy.t,
      rightArm: CuboidLegacy.t,
      leftArm: CuboidLegacy.t,
      body: CuboidLegacy.t,
      rightLeg: CuboidLegacy.t,
      leftLeg: CuboidLegacy.t,
    }
  }

  type t = {
    base: Layer.t,
    overlay: Layer.t,
  }

  let {make, translate} = module(CuboidLegacy)

  let steve: t = {
    base: {
      head: make(8, 8, 8)->translate(0, 0),
      rightArm: make(4, 12, 4)->translate(40, 16),
      leftArm: make(4, 12, 4)->translate(32, 48),
      body: make(8, 12, 4)->translate(16, 16),
      rightLeg: make(4, 12, 4)->translate(0, 16),
      leftLeg: make(4, 12, 4)->translate(16, 48),
    },
    overlay: {
      head: make(8, 8, 8)->translate(32, 0),
      rightArm: make(4, 12, 4)->translate(40, 32),
      leftArm: make(4, 12, 4)->translate(48, 48),
      body: make(8, 12, 4)->translate(16, 32),
      rightLeg: make(4, 12, 4)->translate(0, 32),
      leftLeg: make(4, 12, 4)->translate(0, 48),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: make(3, 12, 4)->translate(40, 16),
      leftArm: make(3, 12, 4)->translate(32, 48),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: make(3, 12, 4)->translate(40, 32),
      leftArm: make(3, 12, 4)->translate(48, 48),
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}

module MinecraftCharacter = {
  module Layer = {
    type t = {
      head: Cuboid.t,
      rightArm: Cuboid.t,
      leftArm: Cuboid.t,
      body: Cuboid.t,
      rightLeg: Cuboid.t,
      leftLeg: Cuboid.t,
    }
  }

  type t = {
    base: Layer.t,
    overlay: Layer.t,
  }

  let {make, translate} = module(Cuboid)

  let steve: t = {
    base: {
      head: make(8, 8, 8)->translate(0, 0),
      rightArm: make(4, 12, 4)->translate(40, 16),
      leftArm: make(4, 12, 4)->translate(32, 48),
      body: make(8, 12, 4)->translate(16, 16),
      rightLeg: make(4, 12, 4)->translate(0, 16),
      leftLeg: make(4, 12, 4)->translate(16, 48),
    },
    overlay: {
      head: make(8, 8, 8)->translate(32, 0),
      rightArm: make(4, 12, 4)->translate(40, 32),
      leftArm: make(4, 12, 4)->translate(48, 48),
      body: make(8, 12, 4)->translate(16, 32),
      rightLeg: make(4, 12, 4)->translate(0, 32),
      leftLeg: make(4, 12, 4)->translate(0, 48),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: make(3, 12, 4)->translate(40, 16),
      leftArm: make(3, 12, 4)->translate(32, 48),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: make(3, 12, 4)->translate(40, 32),
      leftArm: make(3, 12, 4)->translate(48, 48),
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}

module Point = {
  type t = (float, float)

  let toIntPoint = ((x, y): t) => {
    (x->Js.Math.round->Belt.Int.fromFloat, y->Js.Math.round->Belt.Int.fromFloat)
  }

  let translate = ((x, y): t, dx, dy) => {
    (x +. dx, y +. dy)
  }
}

module Angle = {
  let toRadians = degrees => {
    degrees *. (Js.Math._PI /. 180.0)
  }
}

// Normal
//
//        p3   p4
//    +---+-----+---+        ---
//    |  /       \  |         |
//    | /         \ |         | Actual tab height
//    |/           \|         |
//    +-------------+        ---
//    p1           p4
//
//
// Overflow
//
//     +---------+      ---
//     |         |       |
//     |         |       | Rectangle tab height
//     |         |       |
//     | p2 X p3 |       |    ---
//     |   /|\   |       |     |
//     |  / | \  |       |     | Actual tab height
//     | /  |  \ |       |     |
//     |/   |   \|       |     |
//     +----+----+      ---   ---
//     p1        p4
//
let drawRectTab = (
  rectangle: Builder.rectangle,
  orientation: [#North | #South | #East | #West],
  ~showFoldLine: bool=true,
  ~tabAngle: float=60.0,
  (),
) => {
  let (x, y, w, h) = rectangle

  let x = Belt.Int.toFloat(x)
  let y = Belt.Int.toFloat(y)
  let w = Belt.Int.toFloat(w)
  let h = Belt.Int.toFloat(h)

  let tabAngleRad = Angle.toRadians(tabAngle)

  switch orientation {
  | #North => {
      //
      //    p2 ______ p3
      //      /|    |\
      //     / |    | \
      // p1 +--|----|--+ p4
      //

      let maxInset = w /. 2.0
      let inset = h /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, h)
      }

      let p1 = (0.0, h)
      let p2 = (0.0 +. inset, h -. tabHeight)
      let p3 = (w -. inset, h -. tabHeight)
      let p4 = (w, h)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      Generator.drawLine(p2, p1, ())
      Generator.drawLine(p2, p3, ())
      Generator.drawLine(p4, p3, ())

      if showFoldLine {
        Generator.drawFoldLine(p4, p1)
      }
    }
  | #East => {
      //
      //  p1
      //   +
      //   | ⟍
      //   |   ⟍  p2
      //   |     |
      //   |     |
      //   |    ⟋ p3
      //   |  ⟋
      //   +
      //  p4
      //

      let maxInset = h /. 2.0
      let inset = w /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, w)
      }

      let p1 = (0.0, 0.0)
      let p2 = (tabHeight, 0.0 +. inset)
      let p3 = (tabHeight, h -. inset)
      let p4 = (0.0, h)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      Generator.drawLine(p1, p2, ())
      Generator.drawLine(p3, p2, ())
      Generator.drawLine(p3, p4, ())

      if showFoldLine {
        Generator.drawFoldLine(p1, p4)
      }
    }
  | #South => {
      //
      // p4 +----------+ p1
      //     \         /
      //      \      /
      //    p3 +----+ p2
      //

      let maxInset = w /. 2.0
      let inset = h /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, h)
      }

      let p1 = (w, 0.0)
      let p2 = (w -. inset, tabHeight)
      let p3 = (0.0 +. inset, tabHeight)
      let p4 = (0.0, 0.0)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      Generator.drawLine(p2, p1, ())
      Generator.drawLine(p2, p3, ())
      Generator.drawLine(p4, p3, ())

      if showFoldLine {
        Generator.drawFoldLine(p4, p1)
      }
    }
  | #West => {
      //
      //       p4
      //         +
      //       / |
      //  p3 /   |
      //    |    |
      //    |    |
      //  p2 \   |
      //       \ |
      //         +
      //        p1
      //

      let maxInset = h /. 2.0
      let inset = w /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, w)
      }

      let p1 = (w, h)
      let p2 = (w -. tabHeight, h -. inset)
      let p3 = (w -. tabHeight, 0.0 +. inset)
      let p4 = (w, 0.0)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      Generator.drawLine(p1, p2, ())
      Generator.drawLine(p3, p2, ())
      Generator.drawLine(p3, p4, ())

      if showFoldLine {
        Generator.drawFoldLine(p1, p4)
      }
    }
  }
}

let drawFaceTab = (
  face: Builder.rectangle,
  side: [#North | #South | #East | #West],
  ~size: int=24,
  ~showFoldLine: bool=true,
  ~tabAngle: float=60.0,
  (),
) => {
  let (x, y, w, h) = face
  let tabRect = switch side {
  | #North => (x, y - size, w, size)
  | #East => (x + w, y, size, h)
  | #South => (x, y + h, w, size)
  | #West => (x - size, y, size, h)
  }
  drawRectTab(tabRect, side, ~showFoldLine, ~tabAngle, ())
}
