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

let translateRectangle = (
  rectangle: Builder.rectangle,
  (xTranslate, yTranslate): Builder.position,
): Builder.rectangle => {
  let (x, y, w, h) = rectangle
  (x + xTranslate, y + yTranslate, w, h)
}
type scale = (int, int, int)

module Cuboid = {
  module Source = {
    type t = {
      front: Builder.rectangle,
      back: Builder.rectangle,
      top: Builder.rectangle,
      bottom: Builder.rectangle,
      right: Builder.rectangle,
      left: Builder.rectangle,
    }

    let make = ((w, h, d): scale): t => {
      top: (d, 0, w, d),
      bottom: (d + w, 0, w, d),
      front: (d, d, w, h),
      right: (0, d, d, h),
      left: (d + w, d, d, h),
      back: (d * 2 + w, d, w, h),
    }

    let translate = (source: t, position: Builder.position) => {
      front: translateRectangle(source.front, position),
      back: translateRectangle(source.back, position),
      top: translateRectangle(source.top, position),
      bottom: translateRectangle(source.bottom, position),
      right: translateRectangle(source.right, position),
      left: translateRectangle(source.left, position),
    }
  }

  module Face = {
    type t = {
      rectangle: Builder.rectangle,
      flip: Generator_Texture.flip,
      rotate: float,
    }

    let make = (rect: Builder.rectangle): t => {
      rectangle: rect,
      flip: #None,
      rotate: 0.0,
    }

    let translate = ({rectangle, flip, rotate}: t, position: Builder.position) => {
      rectangle: rectangle->translateRectangle(position),
      flip: flip,
      rotate: rotate,
    }

    let draw = (textureId: string, source: Builder.rectangle, dest: t) => {
      Generator.drawTexture(
        textureId,
        source,
        dest.rectangle,
        ~flip=dest.flip,
        ~rotate=dest.rotate,
        (),
      )
    }
  }

  module Dest = {
    type t = {
      front: Face.t,
      back: Face.t,
      top: Face.t,
      bottom: Face.t,
      right: Face.t,
      left: Face.t,
    }
    let translate = (dest: t, position: Builder.position) => {
      front: Face.translate(dest.front, position),
      back: Face.translate(dest.back, position),
      top: Face.translate(dest.top, position),
      bottom: Face.translate(dest.bottom, position),
      right: Face.translate(dest.right, position),
      left: Face.translate(dest.left, position),
    }

    type direction = [#East | #West | #North | #South]

    let make = ((w, h, d): scale, direction: direction): t => {
      switch direction {
      | #East => {
          top: Face.make((d, 0, w, d)),
          right: Face.make((0, d, d, h)),
          front: Face.make((d, d, w, h)),
          left: Face.make((d + w, d, d, h)),
          back: Face.make((d + w + d, d, w, h)),
          bottom: Face.make((d, d + h, w, d)),
        }
      | #West => {
          top: Face.make((w + d, 0, w, d)),
          back: Face.make((0, d, w, h)),
          right: Face.make((w, d, d, h)),
          front: Face.make((w + d, d, w, h)),
          left: Face.make((w + d + w, d, d, h)),
          bottom: Face.make((w + d, d + h, w, d)),
        }
      | #North => {
          top: Face.make((d, 0, w, d)),
          right: Face.make((0, d, d, h)),
          front: Face.make((d, d, w, h)),
          left: Face.make((d + w, d, d, h)),
          bottom: Face.make((d, d + h, w, d)),
          back: Face.make((d, d + h + d, w, h)),
        }
      | #South => {
          back: Face.make((d, 0, w, h)),
          top: Face.make((d, h, w, d)),
          right: Face.make((0, h + d, d, h)),
          front: Face.make((d, h + d, w, h)),
          left: Face.make((d + w, h + d, d, h)),
          bottom: Face.make((d, h + d + w, w, d)),
        }
      }
    }

    let setLayout = (scale, direction): t => {
      let dest = make(scale, direction)
      switch direction {
      | #East => {
          top: dest.top,
          right: dest.right,
          front: dest.front,
          left: dest.left,
          back: dest.back,
          bottom: {rectangle: dest.bottom.rectangle, flip: #Vertical, rotate: 0.0},
        }
      | #West => {
          top: dest.top,
          right: dest.right,
          front: dest.front,
          left: dest.left,
          back: dest.back,
          bottom: {rectangle: dest.bottom.rectangle, flip: #Vertical, rotate: 0.0},
        }
      | #North => {
          top: dest.top,
          right: dest.right,
          front: dest.front,
          left: dest.left,
          back: {rectangle: dest.back.rectangle, flip: #None, rotate: 180.0},
          bottom: {rectangle: dest.bottom.rectangle, flip: #Vertical, rotate: 0.0},
        }
      | #South => {
          top: dest.top,
          right: dest.right,
          front: dest.front,
          left: dest.left,
          back: {rectangle: dest.back.rectangle, flip: #None, rotate: 180.0},
          bottom: {rectangle: dest.bottom.rectangle, flip: #Vertical, rotate: 0.0},
        }
      }
    }
  }

  let draw = (
    textureId: string,
    source: Source.t,
    position: Builder.position,
    scale: scale,
    ~direction: Dest.direction=#East,
    (),
  ) => {
    let dest = Dest.setLayout(scale, direction)->Dest.translate(position)
    Face.draw(textureId, source.front, dest.front)
    Face.draw(textureId, source.back, dest.back)
    Face.draw(textureId, source.top, dest.top)
    Face.draw(textureId, source.bottom, dest.bottom)
    Face.draw(textureId, source.left, dest.left)
    Face.draw(textureId, source.right, dest.right)
  }
}

let drawCuboid = (
  textureId: string,
  source: Cuboid.Source.t,
  position: Builder.position,
  scale: scale,
  ~direction: Cuboid.Dest.direction=#East,
  (),
) => Cuboid.draw(textureId, source, position, scale, ~direction, ())

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
      head: Cuboid.Source.t,
      rightArm: Cuboid.Source.t,
      leftArm: Cuboid.Source.t,
      body: Cuboid.Source.t,
      rightLeg: Cuboid.Source.t,
      leftLeg: Cuboid.Source.t,
    }
  }

  type t = {
    base: Layer.t,
    overlay: Layer.t,
  }

  let {make, translate} = module(Cuboid.Source)

  let steve: t = {
    base: {
      head: make((8, 8, 8))->translate((0, 0)),
      rightArm: make((4, 12, 4))->translate((40, 16)),
      leftArm: make((4, 12, 4))->translate((32, 48)),
      body: make((8, 12, 4))->translate((16, 16)),
      rightLeg: make((4, 12, 4))->translate((0, 16)),
      leftLeg: make((4, 12, 4))->translate((16, 48)),
    },
    overlay: {
      head: make((8, 8, 8))->translate((32, 0)),
      rightArm: make((4, 12, 4))->translate((40, 32)),
      leftArm: make((4, 12, 4))->translate((48, 48)),
      body: make((8, 12, 4))->translate((16, 32)),
      rightLeg: make((4, 12, 4))->translate((0, 32)),
      leftLeg: make((4, 12, 4))->translate((0, 48)),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: make((3, 12, 4))->translate((40, 16)),
      leftArm: make((3, 12, 4))->translate((32, 48)),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: make((3, 12, 4))->translate((40, 32)),
      leftArm: make((3, 12, 4))->translate((48, 48)),
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}

let setTabSize = (tabSize: int) => {
  Generator.setIntegerVariable("tabSize", tabSize)
}

let defaultTabSize = 24

let getTabSize = () => {
  switch Generator.getIntegerVariable("tabSize") {
  | None => defaultTabSize
  | Some(value) => value
  }
}

let drawFaceTab = (
  face: Builder.rectangle,
  side: Generator.Orientation.t,
  ~showFoldLine: bool=true,
  ~tabAngle: float=45.0,
  ~size: option<int>=?,
  (),
) => {
  let size = switch size {
  | Some(size) => size
  | None => getTabSize()
  }
  let (x, y, w, h) = face
  let tabRect = switch side {
  | #North => (x, y - size, w, size)
  | #East => (x + w, y, size, h)
  | #South => (x, y + h, w, size)
  | #West => (x - size, y, size, h)
  }
  Generator.drawTab(tabRect, side, ~showFoldLine, ~tabAngle, ())
}

let drawFaceTabs = (
  face: Builder.rectangle,
  sides: array<Generator.Orientation.t>,
  ~showFoldLine: bool=true,
  ~tabAngle: float=45.0,
  ~size: option<int>=?,
  (),
) => {
  let size = switch size {
  | Some(size) => size
  | None => getTabSize()
  }
  sides->Belt.Array.forEach(side => {
    drawFaceTab(face, side, ~showFoldLine, ~tabAngle, ~size, ())
  })
}
