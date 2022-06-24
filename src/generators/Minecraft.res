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
type center = [#Right | #Front | #Left | #Back | #Top | #Bottom]

let drawCuboid = (
  id: string,
  source: Cuboid.t,
  position: Builder.position,
  scale: (int, int, int),
  ~direction: direction=#East,
  ~center: center=#Front,
  ~flip: Generator_Texture.flip=#None,
  ~blend: Generator_Texture.blend=#None,
  ~rotate: float=0.0,
  ~pixelate: bool=false,
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
      let move = (face: t, x, y): t => {
        rectangle: face.rectangle->Cuboid.translateRectangle(x, y),
        flip: face.flip,
        rotate: face.rotate,
      }
      let rotate = (face: t, r): t => {
        {
          rectangle: face.rectangle,
          flip: face.flip,
          rotate: face.rotate +. r,
        }
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

      let draw = (id: string, source: Builder.rectangle, dest: t, rotate: float) => {
        let (dx, dy, dw, dh) = dest.rectangle
        let destination = switch mod_float(dest.rotate -. rotate +. 720.0, 360.0) {
        | 0.0 => (dx, dy, dw, dh)
        | 90.0 => (dx + dh, dy, dh, dw)
        | 180.0 => (dx + dw, dy + dh, dw, dh)
        | 270.0 => (dx, dy + dw, dh, dw)
        | _ => (dx, dy, dw, dh)
        }

        Generator.drawTexture(
          id,
          source,
          destination,
          ~flip=dest.flip,
          ~rotateLegacy=dest.rotate,
          (),
        )
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

    let make = ((w, h, d), direction, center, r): t => {
      let n: int = switch center {
      | #Right => 0
      | #Front => 1
      | #Left => 2
      | #Back => 3
      | #Top => 4
      | #Bottom => 5
      }

      // Change width, height and depth to work with correct face layout
      let (w, h, d) = (
        n == 0 || n == 2 ? d : w,
        n > 3 ? d : h,
        n == 0 || n == 2 ? w : n > 3 ? h : d,
      )

      // Define base layout, according to direction
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
      // Rotate and flip to match centers
      let a = [dest.right, dest.front, dest.left, dest.back, dest.top, dest.bottom]
      let m = Belt.Int.toFloat(n)

      let dest = {
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

      // Rotate and translate faces according to the rotation
      let rotate = (face: Face.t) => {
        let (sx, sy, sw, sh) = face.rectangle
        let radians = r *. Js.Math._PI /. 180.0
        let cos = Js.Math.cos(radians)
        let sin = Js.Math.sin(radians)

        Face.translate(
          face,
          Belt.Float.toInt(Belt.Int.toFloat(sx) *. cos -. Belt.Int.toFloat(sy) *. sin) - sx,
          Belt.Float.toInt(Belt.Int.toFloat(sx) *. sin +. Belt.Int.toFloat(sy) *. cos) - sy,
        )->Face.rotate(r)
      }

      let translate = (face: Face.t, s) => {
        Face.translate(face, s * (d + w / 2), s * (d + h / 2))
      }
      {
        top: dest.top->translate(-1)->rotate->translate(1),
        bottom: dest.bottom->translate(-1)->rotate->translate(1),
        right: dest.right->translate(-1)->rotate->translate(1),
        front: dest.front->translate(-1)->rotate->translate(1),
        left: dest.left->translate(-1)->rotate->translate(1),
        back: dest.back->translate(-1)->rotate->translate(1),
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

  let dest = Dest.make((w, h, d), direction, center, rotate)
  let dest = Dest.translate(dest, x, y)

  Dest.Face.draw(id, source.top, dest.top, rotate)
  Dest.Face.draw(id, source.bottom, dest.bottom, rotate)
  Dest.Face.draw(id, source.right, dest.right, rotate)
  Dest.Face.draw(id, source.front, dest.front, rotate)
  Dest.Face.draw(id, source.left, dest.left, rotate)
  Dest.Face.draw(id, source.back, dest.back, rotate)
}
