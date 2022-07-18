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

    // When a face is flipped both vertically and horizontally, this is the same as rotating 180 degrees.
    let flip = (face: t, flip: Generator_Texture.flip) => {
      let (newFlip, newRotate) = switch (face.flip, flip) {
      | (#None, #None) => (#None, face.rotate)
      | (#None, #Vertical) => (#Vertical, face.rotate)
      | (#None, #Horizontal) => (#Horizontal, face.rotate)
      | (#Vertical, #None) => (#Vertical, face.rotate)
      | (#Vertical, #Vertical) => (#None, face.rotate)
      | (#Vertical, #Horizontal) => (#None, face.rotate +. 180.0)
      | (#Horizontal, #None) => (#Horizontal, face.rotate)
      | (#Horizontal, #Vertical) => (#None, face.rotate +. 180.0)
      | (#Horizontal, #Horizontal) => (#None, face.rotate)
      }
      {
        rectangle: face.rectangle,
        flip: newFlip,
        rotate: newRotate,
      }
    }

    let rotate2 = ({rectangle, flip, rotate}: t, axis: Generator_Builder.position, r: float) => {
      let rad = r *. Js.Math._PI /. 180.0
      let (cos, sin) = (Js.Math.cos(rad), Js.Math.sin(rad))
      let (x, y, w, h) = rectangle
      let (x0, y0) = axis
      let (x1, y1) = (Belt.Int.toFloat(x - x0), Belt.Int.toFloat(y - y0))
      let (x2, y2) = (x1 *. cos -. y1 *. sin, x1 *. sin +. y1 *. cos)
      let (x3, y3) = (Belt.Float.toInt(x2) + x0, Belt.Float.toInt(y2) + y0)

      {
        rectangle: mod_float(r +. 360.0, 180.0) == 90.0
          ? (x3 + (w - h) / 2, y3 - (w - h) / 2, h, w)
          : (x3, y3, w, h),
        flip: flip,
        rotate: rotate +. r,
      }
    }

    let rotate = ({rectangle, flip, rotate}: t, r: float) => {
      let (x, y, w, h) = rectangle

      rotate2({rectangle: rectangle, flip: flip, rotate: rotate}, (x + w / 2, y + h / 2), r)
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
        ~rotateLegacy=dest.rotate,
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

    type direction = [#East | #West | #North | #South]

    type center = [#Right | #Front | #Left | #Back | #Top | #Bottom]

    let translate = (dest: t, position: Builder.position) => {
      front: Face.translate(dest.front, position),
      back: Face.translate(dest.back, position),
      top: Face.translate(dest.top, position),
      bottom: Face.translate(dest.bottom, position),
      right: Face.translate(dest.right, position),
      left: Face.translate(dest.left, position),
    }

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
          back: Face.make((d, 0, w, h))->Face.rotate(180.0),
          top: Face.make((d, h, w, d)),
          right: Face.make((0, h + d, d, h)),
          front: Face.make((d, h + d, w, h)),
          left: Face.make((d + w, h + d, d, h)),
          bottom: Face.make((d, h * 2 + d, w, d)),
        }
      | #South => {
          top: Face.make((d, 0, w, d)),
          right: Face.make((0, d, d, h)),
          front: Face.make((d, d, w, h)),
          left: Face.make((d + w, d, d, h)),
          bottom: Face.make((d, d + h, w, d)),
          back: Face.make((d, d + h + d, w, h))->Face.rotate(180.0),
        }
      }
    }

    let rotate = (dest: t, scale: scale, rotate: float): t => {
      let (w, h, d) = scale
      let axis = (d + w / 2, d + h / 2)
      {
        right: dest.right->Face.rotate2(axis, rotate),
        front: dest.front->Face.rotate2(axis, rotate),
        left: dest.left->Face.rotate2(axis, rotate),
        back: dest.back->Face.rotate2(axis, rotate),
        top: dest.top->Face.rotate2(axis, rotate),
        bottom: dest.bottom->Face.rotate2(axis, rotate),
      }
    }

    let setLayout = (scale, direction, center, r): t => {
      let (w, h, d) = scale
      let scale = switch center {
      | #Right => (d, h, w)
      | #Left => (d, h, w)
      | #Top => (w, d, h)
      | #Bottom => (w, d, h)
      | _ => (w, h, d)
      }

      let dest = make(scale, direction)
      let dest = switch center {
      | #Right => {
          right: dest.front,
          front: dest.left,
          left: dest.back,
          back: dest.right,
          top: dest.top->Face.rotate(-90.0),
          bottom: dest.bottom->Face.rotate(90.0)->Face.flip(#Vertical),
        }
      | #Front => {
          right: dest.right,
          front: dest.front,
          left: dest.left,
          back: dest.back,
          top: dest.top,
          bottom: dest.bottom->Face.flip(#Vertical),
        }
      | #Left => {
          right: dest.back,
          front: dest.right,
          left: dest.front,
          back: dest.left,
          top: dest.top->Face.rotate(90.0),
          bottom: dest.bottom->Face.rotate(-90.0)->Face.flip(#Vertical),
        }
      | #Back => {
          right: dest.left,
          front: dest.back,
          left: dest.right,
          back: dest.front,
          top: dest.top->Face.rotate(180.0),
          bottom: dest.bottom->Face.rotate(180.0)->Face.flip(#Vertical),
        }
      | #Top => {
          right: dest.right->Face.rotate(90.0),
          front: dest.bottom,
          left: dest.left->Face.rotate(-90.0),
          back: dest.top->Face.rotate(180.0),
          top: dest.front,
          bottom: dest.back->Face.flip(#Vertical)->Face.rotate(180.0),
        }
      | #Bottom => {
          right: dest.right->Face.rotate(-90.0),
          front: dest.top,
          left: dest.left->Face.rotate(90.0),
          back: dest.bottom->Face.rotate(180.0),
          top: dest.back->Face.rotate(180.0),
          bottom: dest.front->Face.flip(#Vertical),
        }
      }
      rotate(dest, scale, r)
    }
  }

  let draw = (
    textureId: string,
    source: Source.t,
    position: Builder.position,
    scale: scale,
    ~direction: Dest.direction=#East,
    ~center: Dest.center=#Front,
    ~rotate: float=0.0,
    (),
  ) => {
    let dest = Dest.setLayout(scale, direction, center, rotate)->Dest.translate(position)
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
  ~center: Cuboid.Dest.center=#Front,
  ~rotate: float=0.0,
  (),
) => Cuboid.draw(textureId, source, position, scale, ~direction, ~center, ~rotate, ())

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
