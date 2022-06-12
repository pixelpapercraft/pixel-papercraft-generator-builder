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

module CharacterLegacy = {
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

module Character = {
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

type direction = [#Right | #Left | #Top | #Bottom]

/* let drawCuboidLegacy = (
  id: string,
  source: CuboidLegacy.t,
  dp: Builder.position,
  ds: (int, int, int),
  ~direction: direction=#Right,
  (),
) => {
  // ~flip, ~blend, ~rotate, ~pixelate - rotate and flip can be used for some generators and for simplifying old player model drawing, respectively

  /* Direction changes the placement of the back face - this replaces the ~leftSide parameter from the old branch.
      It allows for the drawing of not only "left side" cuboids, but also any other shape that might occur.
      In conjunction with a "~center" parameter which could specify which face of the cuboid is drawn at the center, and ~rotate and ~flip parameters that match drawTexture(),
      any cross-shaped cuboid net should be drawable with drawCuboid().

      With ~direction, and unlike ~leftSide, (x, y) will always represent the point that is (-d, -d) away from 
      the center face's origin - the usual corner for a right direction, but not for the other directions. 
      This makes it so that only the back face needs to be included in the switch statement.
 */

  let (x, y) = dp
  let (w, h, d) = ds

  Generator.drawTextureLegacy(id, source.front, {x: x + d, y: y + d, w: w, h: h}, ()) // Front
  Generator.drawTextureLegacy(id, source.left, {x: x + d + w, y: y + d, w: d, h: h}, ()) // Left
  Generator.drawTextureLegacy(id, source.right, {x: x, y: y + d, w: d, h: h}, ()) // Right
  Generator.drawTextureLegacy(id, source.top, {x: x + d, y: y, w: w, h: d}, ()) // Top
  Generator.drawTextureLegacy(
    id,
    source.bottom,
    {x: x + d, y: y + d + h, w: w, h: d},
    ~flip=#Vertical,
    (),
  ) // Bottom
  // Back
  switch direction {
  | #Right =>
    Generator.drawTextureLegacy(id, source.back, {x: x + d * 2 + w, y: y + d, w: w, h: h}, ())
  | #Left => Generator.drawTextureLegacy(id, source.back, {x: x - d, y: y + d, w: w, h: h}, ())
  | #Top =>
    Generator.drawTextureLegacy(
      id,
      source.back,
      {x: x + d, y: y - h, w: w, h: h},
      ~rotateLegacy=180.0,
      (),
    )
  | #Bottom =>
    Generator.drawTextureLegacy(
      id,
      source.back,
      {x: x + d, y: y + d * 2 + h, w: w, h: h},
      ~rotateLegacy=180.0,
      (),
    )
  }
} */

let drawCuboid = (
  id: string,
  source: Cuboid.t,
  dp: Builder.position,
  ds: (int, int, int),
  ~direction: direction=#Right,
  (),
) => {
  // ~flip, ~blend, ~rotate, ~pixelate - rotate and flip can be used for some generators and for simplifying old player model drawing, respectively

  /* Direction changes the placement of the back face - this replaces the ~leftSide parameter from the old branch.
      It allows for the drawing of not only "left side" cuboids, but also any other shape that might occur.
      In conjunction with a "~center" parameter which could specify which face of the cuboid is drawn at the center, and ~rotate and ~flip parameters that match drawTexture(),
      any cross-shaped cuboid net should be drawable with drawCuboid().

      With ~direction, and unlike ~leftSide, (x, y) will always represent the point that is (-d, -d) away from 
      the center face's origin - the usual corner for a right direction, but not for the other directions. 
      This makes it so that only the back face needs to be included in the switch statement.
 */

  let (x, y) = dp
  let (w, h, d) = ds

  Generator.drawTexture(id, source.front, (x + d, y + d, w, h), ()) // Front
  Generator.drawTexture(id, source.left, (x + d + w, y + d, d, h), ()) // Left
  Generator.drawTexture(id, source.right, (x, y + d, d, h), ()) // Right
  Generator.drawTexture(id, source.top, (x + d, y, w, d), ()) // Top
  Generator.drawTexture(id, source.bottom, (x + d, y + d + h, w, d), ~flip=#Vertical, ()) // Bottom
  // Back
  switch direction {
  | #Right => Generator.drawTexture(id, source.back, (x + d * 2 + w, y + d, w, h), ())
  | #Left => Generator.drawTexture(id, source.back, (x - w, y + d, w, h), ())
  | #Top => Generator.drawTexture(id, source.back, (x + d, y - h, w, h), ~rotate=180.0, ())
  | #Bottom =>
    Generator.drawTexture(id, source.back, (x + d, y + d * 2 + h, w, h), ~rotate=180.0, ())
  }
}
