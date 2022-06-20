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
  xTranslate: int,
  yTranslate: int,
): Builder.rectangle => {
  let (x, y, w, h) = rectangle
  (x + xTranslate, y + yTranslate, w, h)
}

module Cuboid = {
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
    let flip = ({rectangle, flip, rotate}: t, f: Generator_Texture.flip) => {
      rectangle: rectangle,
      flip: flip == #None ? f : #None,
      rotate: flip == #None ? rotate : flip != f ? rotate +. 180.0 : rotate,
    }
    let rotate = ({rectangle, flip, rotate}: t, r: float) => {
      rectangle: rectangle,
      flip: flip,
      rotate: rotate +. r,
    }

    let translate = ({rectangle, flip, rotate}: t, (dx, dy): Builder.position) => {
      rectangle: rectangle->translateRectangle(dx, dy),
      flip: flip,
      rotate: rotate,
    }

    let draw = (textureId: string, source: t, dest: t) => {
      Generator.drawTexture(
        textureId,
        source.rectangle,
        dest.rectangle,
        ~flip=dest.flip,
        ~rotate=dest.rotate,
        (),
      )
    }
  }
  type t = {
    front: Face.t,
    back: Face.t,
    top: Face.t,
    bottom: Face.t,
    right: Face.t,
    left: Face.t,
  }

  let translate = (cuboid: t, position: Builder.position) => {
    front: Face.translate(cuboid.front, position),
    back: Face.translate(cuboid.back, position),
    top: Face.translate(cuboid.top, position),
    bottom: Face.translate(cuboid.bottom, position),
    right: Face.translate(cuboid.right, position),
    left: Face.translate(cuboid.left, position),
  }

  type direction = [#East | #West | #North | #South]
  type center = [#Right | #Front | #Left | #Back | #Top | #Bottom]
  type scale = (int, int, int)
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
  //             | (Vert)  |
  //             +----W----+
  //
  let makeSource = ((w, h, d): scale): t => {
    {
      top: Face.make((d, 0, w, d)),
      bottom: Face.make((d + w, 0, w, d)),
      front: Face.make((d, d, w, h)),
      right: Face.make((0, d, d, h)),
      left: Face.make((d + w, d, d, h)),
      back: Face.make((d * 2 + w, d, w, h)),
    }
  }

  let makeDest = ((w, h, d): scale, direction: direction): t => {
    switch direction {
    | #East => {
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
        //             | (Vert)  |
        //             +----W----+
        //
        top: Face.make((d, 0, w, d)),
        right: Face.make((0, d, d, h)),
        front: Face.make((d, d, w, h)),
        left: Face.make((d + w, d, d, h)),
        back: Face.make((d + w + d, d, w, h)),
        bottom: Face.make((d, d + h, w, d)),
      }
    | #West => {
        // (0,0)
        //   .                   +----W----+
        //                       |         |
        //                       D   Top   D
        //                       |         |
        //   +----W----+----D----+----W----+----D----+
        //   |         |         |         |         |
        //   H  Back   H  Right  H  Front  H  Left   H
        //   |         |         |         |         |
        //   +----W----+----D----+----W----+----D----+
        //                       |         |
        //                       D Bottom  D
        //                       | (Vert)  |
        //                       +----W----+
        //
        top: Face.make((w + d, 0, w, d)),
        back: Face.make((0, d, w, h)),
        right: Face.make((w, d, d, h)),
        front: Face.make((w + d, d, w, h)),
        left: Face.make((w + d + w, d, d, h)),
        bottom: Face.make((w + d, d + h, w, d)),
      }
    | #North => {
        // (0,0)
        //   .         +----W----+
        //             |         |
        //             D   Top   D
        //             |         |
        //   +----D----+----W----+----D----+
        //   |         |         |         |
        //   H  Right  H  Front  H  Left   H
        //   |         |         |         |
        //   +----D----+----W----+----D----+
        //             |         |
        //             D Bottom  D
        //             | (Vert)  |
        //             +----W----+
        //             |         |
        //             H  Back   H
        //             | (180.0) |
        //             +----W----+
        //
        top: Face.make((d, 0, w, d)),
        right: Face.make((0, d, d, h)),
        front: Face.make((d, d, w, h)),
        left: Face.make((d + w, d, d, h)),
        bottom: Face.make((d, d + h, w, d)),
        back: Face.make((d, d + h + d, w, h))->Face.rotate(180.0),
      }
    | #South => {
        // (0,0)
        //   .         +----W----+
        //             |         |
        //             H  Back   H
        //             | (180.0) |
        //             +----W----+
        //             |         |
        //             D   Top   D
        //             |         |
        //   +----D----+----W----+----D----+
        //   |         |         |         |
        //   H  Right  H  Front  H  Left   H
        //   |         |         |         |
        //   +----D----+----W----+----D----+
        //             |         |
        //             D Bottom  D
        //             | (Vert)  |
        //             +----W----+
        //
        back: Face.make((d, 0, w, h))->Face.rotate(180.0),
        top: Face.make((d, h, w, d)),
        right: Face.make((0, h + d, d, h)),
        front: Face.make((d, h + d, w, h)),
        left: Face.make((d + w, h + d, d, h)),
        bottom: Face.make((d, h * 2 + d, w, d)),
      }
    }
  }

  let getLayout = (scale, direction, center): t => {
    let cuboid = makeDest(scale, direction)
    switch center {
    | #Right => {
        right: cuboid.front,
        front: cuboid.left,
        left: cuboid.back,
        back: cuboid.right,
        top: cuboid.top->Face.rotate(-90.0),
        bottom: cuboid.bottom->Face.rotate(90.0)->Face.flip(#Vertical),
      }
    | #Front => {
        right: cuboid.right,
        front: cuboid.front,
        left: cuboid.left,
        back: cuboid.back,
        top: cuboid.top,
        bottom: cuboid.bottom->Face.flip(#Vertical),
      }
    | #Left => {
        right: cuboid.back,
        front: cuboid.right,
        left: cuboid.front,
        back: cuboid.left,
        top: cuboid.top->Face.rotate(90.0),
        bottom: cuboid.bottom->Face.rotate(-90.0)->Face.flip(#Vertical),
      }
    | #Back => {
        right: cuboid.left,
        front: cuboid.back,
        left: cuboid.right,
        back: cuboid.front,
        top: cuboid.top->Face.rotate(180.0),
        bottom: cuboid.bottom->Face.rotate(180.0)->Face.flip(#Vertical),
      }
    | #Top => {
        right: cuboid.right->Face.rotate(90.0),
        front: cuboid.bottom,
        left: cuboid.left->Face.rotate(-90.0),
        back: cuboid.top,
        top: cuboid.front,
        bottom: cuboid.back->Face.flip(#Vertical)->Face.rotate(180.0),
      }
    | #Bottom => {
        right: cuboid.right->Face.rotate(-90.0),
        front: cuboid.top,
        left: cuboid.left->Face.rotate(90.0),
        back: cuboid.bottom->Face.rotate(180.0),
        top: cuboid.back->Face.rotate(180.0),
        bottom: cuboid.front->Face.flip(#Vertical),
      }
    }
  }

  let draw = (
    textureId: string,
    source: t,
    position: Builder.position,
    scale: scale,
    ~direction: direction=#East,
    ~center: center=#Front,
    (),
  ) => {
    let dest = getLayout(scale, direction, center)->translate(position)
    Face.draw(textureId, source.front, dest.front)
    Face.draw(textureId, source.back, dest.back)
    Face.draw(textureId, source.top, dest.top)
    Face.draw(textureId, source.bottom, dest.bottom)
    Face.draw(textureId, source.left, dest.left)
    Face.draw(textureId, source.right, dest.right)
  }
}

/* module Cuboid = {
  module Face = {
    type t = {rectangle, flip, rotate, (etc)}
    let translate = rectangle->translateRectangle
  }
  
  type t = {top: Face.t, ... } // Faces.t
  let translate
  let translateRectangle

  let makeSource = scale: t // make
  let makeDest = (scale, direction): t // make2
  let getLayout = (scale, direction): t // getFaces

  let drawFace, or Face.draw
  let drawCuboid, or Cuboid.draw, = (textureId, source: makeSource, position, scale, ~direction) => {
    let dest = getLayout??-> translate(position)
    draw each of dest's faces
  }


 */

let drawCuboid = (
  textureId: string,
  source: Cuboid.t,
  position: Builder.position,
  scale: Cuboid.scale,
  ~direction: Cuboid.direction=#East,
  ~center: Cuboid.center=#Front,
  (),
) => Cuboid.draw(textureId, source, position, scale, ~direction, ~center, ())

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

  let {makeSource, translate} = module(Cuboid)

  let steve: t = {
    base: {
      head: makeSource((8, 8, 8))->translate((0, 0)),
      rightArm: makeSource((4, 12, 4))->translate((40, 16)),
      leftArm: makeSource((4, 12, 4))->translate((32, 48)),
      body: makeSource((8, 12, 4))->translate((16, 16)),
      rightLeg: makeSource((4, 12, 4))->translate((0, 16)),
      leftLeg: makeSource((4, 12, 4))->translate((16, 48)),
    },
    overlay: {
      head: makeSource((8, 8, 8))->translate((32, 0)),
      rightArm: makeSource((4, 12, 4))->translate((40, 32)),
      leftArm: makeSource((4, 12, 4))->translate((48, 48)),
      body: makeSource((8, 12, 4))->translate((16, 32)),
      rightLeg: makeSource((4, 12, 4))->translate((0, 32)),
      leftLeg: makeSource((4, 12, 4))->translate((0, 48)),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: makeSource((3, 12, 4))->translate((40, 16)),
      leftArm: makeSource((3, 12, 4))->translate((32, 48)),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: makeSource((3, 12, 4))->translate((40, 32)),
      leftArm: makeSource((3, 12, 4))->translate((48, 48)),
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}

/* type direction = [#East | #West | #North | #South]
type center = [#Right | #Front | #Left | #Back | #Top | #Bottom]

let drawCuboid = (
  id: string,
  source: Cuboid.t,
  position: Builder.position,
  scale: (int, int, int),
  ~direction: direction=#East,
  ~center: center=#Front,
  (),
) => {
  let (x, y) = position
  let (w, h, d) = scale

  module Dest = {
    module Face = {
      type t = {rectangle: Builder.rectangle, flip: Generator_Texture.flip, rotate: float}
      let make = (rectangle, ~flip=#None, ~rotate=0.0, ()) => {
        rectangle: rectangle,
        flip: flip,
        rotate: rotate,
      }

      let translate = (face: t, x, y): t => {
        rectangle: face.rectangle->Cuboid.translateRectangle(x, y),
        flip: face.flip,
        rotate: face.rotate,
      }
      let rotate = (face: t, r): t => {
        rectangle: face.rectangle,
        flip: face.flip,
        rotate: face.rotate +. r,
      }
      let flip = (face: t, f): t => {
        rectangle: face.rectangle,
        flip: face.flip == #None ? f : #None,
        rotate: face.flip == #None
          ? face.rotate
          : face.flip != f
          ? face.rotate +. 180.0
          : face.rotate,
      }

      let draw = (id: string, source: Builder.rectangle, dest: t) => {
        let (dx, dy, dw, dh) = dest.rectangle
        let destination = switch mod_float(dest.rotate +. 720.0, 360.0) {
        | 0.0 => (dx, dy, dw, dh)
        | 90.0 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
        | 180.0 => (dx, dy, dw, dh)
        | 270.0 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
        | _ => (dx, dy, dw, dh)
        }

        Generator.drawTexture(id, source, destination, ~flip=dest.flip, ~rotate=dest.rotate, ())
      }
    }
    type t = {
      top: Face.t,
      bottom: Face.t,
      right: Face.t,
      front: Face.t,
      left: Face.t,
      back: Face.t,
    }

    let make = ((w, h, d), direction, center): t => {
      let n: int = switch center {
      | #Right => 0
      | #Front => 1
      | #Left => 2
      | #Back => 3
      | #Top => 4
      | #Bottom => 5
      }

      let (w, h, d) = (
        n == 0 || n == 2 ? d : w,
        n > 3 ? d : h,
        n == 0 || n == 2 ? w : n > 3 ? h : d,
      )

      let dest = {
        top: Face.make((d, 0, w, d), ()),
        bottom: Face.make((d, d + h, w, d), ()),
        right: Face.make((0, d, d, h), ()),
        front: Face.make((d, d, w, h), ()),
        left: Face.make((d + w, d, d, h), ()),
        back: switch direction {
        | #East => Face.make((d * 2 + w, d, w, h), ())
        | #West => Face.make((-w, d, w, h), ())
        | #North => Face.make((d, -w, w, h), ~rotate=180.0, ())
        | #South => Face.make((d, d * 2 + h, w, h), ~rotate=180.0, ())
        },
      }
      let a = [dest.right, dest.front, dest.left, dest.back, dest.top, dest.bottom]
      let m = Belt.Int.toFloat(n)

      {
        right: a[n < 4 ? mod(5 - n, 4) : 0]->Face.rotate(
          m < 4.0 ? 0.0 : (m -. 3.0) *. 180.0 -. 90.0,
        ),
        front: a[n < 4 ? mod(6 - n, 4) : n == 4 ? 5 : 4],
        left: a[n < 4 ? mod(7 - n, 4) : 2]->Face.rotate(
          m < 4.0 ? 0.0 : (m -. 3.0) *. -180.0 +. 90.0,
        ),
        back: a[n < 4 ? mod(8 - n, 4) : n == 4 ? 4 : 5]->Face.rotate(m < 4.0 ? 0.0 : 180.0),
        top: a[n < 4 ? 4 : n == 4 ? 1 : 3]->Face.rotate(
          m > 3.0 ? (m -. 4.0) *. 180.0 : (Belt.Int.toFloat(mod(n, 4)) -. 1.0) *. 90.0,
        ),
        bottom: a[n < 4 ? 5 : n == 4 ? 3 : 1]
        ->Face.flip(#Vertical)
        ->Face.rotate(
          m > 3.0 ? (5.0 -. m) *. -180.0 : (Belt.Int.toFloat(mod(n, 4)) -. 1.0) *. -90.0,
        ),
      }
    }
    let translate = (dest: t, x, y) => {
      let translate = face => Face.translate(face, x, y)
      {
        top: dest.top->translate,
        bottom: dest.bottom->translate,
        right: dest.right->translate,
        front: dest.front->translate,
        left: dest.left->translate,
        back: dest.back->translate,
      }
    }
  }

  // Have default destination- exact information for center = front, direction = east.
  // Given direction, change back position to be at the correct place, with correct rotation.
  // Given center, assign dest faces to be at correct faces, and have correct rotations
  // draw at destination, with its parameters

  let dest = Dest.make((w, h, d), direction, center)->Dest.translate(x, y)

  Dest.Face.draw(id, source.top, dest.top)
  Dest.Face.draw(id, source.bottom, dest.bottom)
  Dest.Face.draw(id, source.right, dest.right)
  Dest.Face.draw(id, source.front, dest.front)
  Dest.Face.draw(id, source.left, dest.left)
  Dest.Face.draw(id, source.back, dest.back)
} */
