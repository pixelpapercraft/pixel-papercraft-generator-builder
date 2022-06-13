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

type direction = [#East | #West | #North | #South]

let drawCuboid = (
  id: string,
  source: Cuboid.t,
  position: Builder.position,
  scale: (int, int, int),
  ~direction: direction=#East,
  (),
) => {
  // ~flip, ~blend, ~rotate, ~pixelate - rotate and flip can be used for some generators and for simplifying old player model drawing, respectively

  /* Improvements: add ~flip, ~blend, ~rotate, ~pixelate, which do the same as what they do in drawTexture(), and ~center, That changes the center face of the cuboid.
   
 */

  let (x, y) = position
  let (w, h, d) = scale

  module Dest = {
    type face = {rectangle: Builder.rectangle, flip: Generator_Texture.flip, rotate: float}
    type t = {
      top: face,
      bottom: face,
      right: face,
      front: face,
      left: face,
      back: face,
    }
  }

  let makeDest = (w, h, d, direction): Dest.t => {
    top: {rectangle: (d, 0, w, d)->Cuboid.translateRectangle(x, y), flip: #None, rotate: 0.0},
    bottom: {
      rectangle: (d, d + h, w, d)->Cuboid.translateRectangle(x, y),
      flip: #Vertical,
      rotate: 0.0,
    },
    right: {rectangle: (0, d, d, h)->Cuboid.translateRectangle(x, y), flip: #None, rotate: 0.0},
    front: {rectangle: (d, d, w, h)->Cuboid.translateRectangle(x, y), flip: #None, rotate: 0.0},
    left: {rectangle: (d + w, d, d, h)->Cuboid.translateRectangle(x, y), flip: #None, rotate: 0.0},
    back: switch direction {
    | #East => {
        rectangle: (d * 2 + w, d, w, h)->Cuboid.translateRectangle(x, y),
        flip: #None,
        rotate: 0.0,
      }
    | #West => {rectangle: (-w, d, w, h)->Cuboid.translateRectangle(x, y), flip: #None, rotate: 0.0}
    | #North => {
        rectangle: (d, -w, w, h)->Cuboid.translateRectangle(x, y),
        flip: #None,
        rotate: 180.0,
      }
    | #South => {
        rectangle: (d, d * 2 + h, w, h)->Cuboid.translateRectangle(x, y),
        flip: #None,
        rotate: 180.0,
      }
    },
  }

  // Have default destination- exact information for center = front, direction = east.
  // Given direction, change back position to be at the correct place, with correct rotation.
  // Given center, assign dest faces to be at correct faces, and have correct rotations
  // draw at destination, with its parameters

  let dest = makeDest(w, h, d, direction)
  //tbrflb
  Generator.drawTexture(
    id,
    source.top,
    dest.top.rectangle,
    ~flip=dest.top.flip,
    ~rotate=dest.top.rotate,
    (),
  )
  Generator.drawTexture(
    id,
    source.bottom,
    dest.bottom.rectangle,
    ~flip=dest.bottom.flip,
    ~rotate=dest.bottom.rotate,
    (),
  )
  Generator.drawTexture(
    id,
    source.right,
    dest.right.rectangle,
    ~flip=dest.right.flip,
    ~rotate=dest.right.rotate,
    (),
  )
  Generator.drawTexture(
    id,
    source.front,
    dest.front.rectangle,
    ~flip=dest.front.flip,
    ~rotate=dest.front.rotate,
    (),
  )
  Generator.drawTexture(
    id,
    source.left,
    dest.left.rectangle,
    ~flip=dest.left.flip,
    ~rotate=dest.left.rotate,
    (),
  )
  Generator.drawTexture(
    id,
    source.back,
    dest.back.rectangle,
    ~flip=dest.back.flip,
    ~rotate=dest.back.rotate,
    (),
  )
}
