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

  type direction = [#East | #West | #North | #South]
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
  //             |         |
  //             +----W----+
  //
  let make = (width, height, depth): t => {
    {
      top: (depth, 0, width, depth),
      bottom: (depth + width, 0, width, depth),
      front: (depth, depth, width, height),
      right: (0, depth, depth, height),
      left: (depth + width, depth, depth, height),
      back: (depth * 2 + width, depth, width, height),
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

  let make2 = ((w, h, d): scale, direction: direction): t => {
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
        //             |         |
        //             +----W----+
        //
        top: (d, 0, w, d),
        right: (0, d, d, h),
        front: (d, d, w, h),
        left: (d + w, d, d, h),
        back: (d + w + d, d, w, h),
        bottom: (d, d + h, w, d),
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
        //                       |         |
        //                       +----W----+
        //
        top: (w + d, 0, w, d),
        back: (0, d, w, h),
        right: (w, d, d, h),
        front: (w + d, d, w, h),
        left: (w + d + w, d, d, h),
        bottom: (w + d, d + h, w, d),
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
        //             |         |
        //             +----W----+
        //             |         |
        //             H  Back   H
        //             |         |
        //             +----W----+
        //
        top: (d, 0, w, d),
        right: (0, d, d, h),
        front: (d, d, w, h),
        left: (d + w, d, d, h),
        bottom: (d, d + h, w, d),
        back: (d, d + h + d, w, h),
      }
    | #South => {
        // (0,0)
        //   .         +----W----+
        //             |         |
        //             H  Back   H
        //             |         |
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
        //             |         |
        //             +----W----+
        //
        back: (d, 0, w, h),
        top: (d, h, w, d),
        right: (0, h + d, d, h),
        front: (d, h + d, w, h),
        left: (d + w, h + d, d, h),
        bottom: (d, h + d + w, w, d),
      }
    }
  }
}

/* module Cuboid = {
  module Face = {
    type t = {rectangle, flip, rotate, (etc)}
    let translate = rectangle->translateRectangle
  }
  
  type t = {top: Face.t, ... } // CuboidFaces.t
  let translate
  let translateRectangle

  let makeSource = scale: t // make
  let makeDest = (scale, direction): t // make2
  let getLayout = (scale, direction): t // getCuboidFaces

  let drawFace, or Face.draw
  let drawCuboid, or Cuboid.draw, = (textureId, source: makeSource, position, scale, ~direction) => {
    let dest = getLayout??-> translate(position)
    draw each of dest's faces
  }


 */

module CuboidFace = {
  type t = {
    rectangle: Builder.rectangle,
    flip: Generator_Texture.flip,
    rotate: float,
  }

  let translate = ({rectangle, flip, rotate}: t, (dx, dy): Builder.position) => {
    rectangle: rectangle->Cuboid.translateRectangle(dx, dy),
    flip: flip,
    rotate: rotate,
  }
}

module CuboidFaces = {
  type t = {
    front: CuboidFace.t,
    back: CuboidFace.t,
    top: CuboidFace.t,
    bottom: CuboidFace.t,
    right: CuboidFace.t,
    left: CuboidFace.t,
  }

  let translate = (faces: t, position: Builder.position) => {
    front: CuboidFace.translate(faces.front, position),
    back: CuboidFace.translate(faces.back, position),
    top: CuboidFace.translate(faces.top, position),
    bottom: CuboidFace.translate(faces.bottom, position),
    right: CuboidFace.translate(faces.right, position),
    left: CuboidFace.translate(faces.left, position),
  }
}

let getCuboidFaces = (scale: Cuboid.scale, direction: Cuboid.direction): CuboidFaces.t => {
  let cuboid = Cuboid.make2(scale, direction)
  switch direction {
  | #East => {
      top: {rectangle: cuboid.top, flip: #None, rotate: 0.0},
      right: {rectangle: cuboid.right, flip: #None, rotate: 0.0},
      front: {rectangle: cuboid.front, flip: #None, rotate: 0.0},
      left: {rectangle: cuboid.left, flip: #None, rotate: 0.0},
      back: {rectangle: cuboid.back, flip: #None, rotate: 0.0},
      bottom: {rectangle: cuboid.bottom, flip: #Vertical, rotate: 0.0},
    }
  | #West => {
      top: {rectangle: cuboid.top, flip: #None, rotate: 0.0},
      right: {rectangle: cuboid.right, flip: #None, rotate: 0.0},
      front: {rectangle: cuboid.front, flip: #None, rotate: 0.0},
      left: {rectangle: cuboid.left, flip: #None, rotate: 0.0},
      back: {rectangle: cuboid.back, flip: #None, rotate: 0.0},
      bottom: {rectangle: cuboid.bottom, flip: #Vertical, rotate: 0.0},
    }
  | #North => {
      top: {rectangle: cuboid.top, flip: #None, rotate: 0.0},
      right: {rectangle: cuboid.right, flip: #None, rotate: 0.0},
      front: {rectangle: cuboid.front, flip: #None, rotate: 0.0},
      left: {rectangle: cuboid.left, flip: #None, rotate: 0.0},
      back: {rectangle: cuboid.back, flip: #None, rotate: 180.0},
      bottom: {rectangle: cuboid.bottom, flip: #Vertical, rotate: 0.0},
    }
  | #South => {
      top: {rectangle: cuboid.top, flip: #None, rotate: 0.0},
      right: {rectangle: cuboid.right, flip: #None, rotate: 0.0},
      front: {rectangle: cuboid.front, flip: #None, rotate: 0.0},
      left: {rectangle: cuboid.left, flip: #None, rotate: 0.0},
      back: {rectangle: cuboid.back, flip: #None, rotate: 180.0},
      bottom: {rectangle: cuboid.bottom, flip: #Vertical, rotate: 0.0},
    }
  }
}

let drawCuboidFace = (textureId: string, source: Builder.rectangle, face: CuboidFace.t) => {
  Generator.drawTexture(textureId, source, face.rectangle, ~flip=face.flip, ~rotate=face.rotate, ())
}

let drawCuboid = (
  textureId: string,
  source: Cuboid.t,
  position: Builder.position,
  scale: Cuboid.scale,
  ~direction: Cuboid.direction=#East,
  (),
) => {
  let faces = getCuboidFaces(scale, direction)->CuboidFaces.translate(position)
  drawCuboidFace(textureId, source.front, faces.front)
  drawCuboidFace(textureId, source.back, faces.back)
  drawCuboidFace(textureId, source.top, faces.top)
  drawCuboidFace(textureId, source.bottom, faces.bottom)
  drawCuboidFace(textureId, source.left, faces.left)
  drawCuboidFace(textureId, source.right, faces.right)
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
