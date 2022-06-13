module Builder = Generator.Builder

type cuboidLegacy = {
  top: Builder.rectangleLegacy,
  bottom: Builder.rectangleLegacy,
  front: Builder.rectangleLegacy,
  right: Builder.rectangleLegacy,
  left: Builder.rectangleLegacy,
  back: Builder.rectangleLegacy,
}

let makeCuboidLegacy = ((x, y): Builder.position, (w, h, l)): cuboidLegacy => {
  top: {x: x + l, y: y, w: w, h: l},
  bottom: {x: x + l + w, y: y, w: w, h: l},
  front: {x: x + l, y: y + l, w: w, h: h},
  right: {x: x, y: y + l, w: l, h: h},
  left: {x: x + l + w, y: y + l, w: l, h: h},
  back: {x: x + l * 2 + w, y: y + l, w: w, h: h},
}

type cuboid = Builder.cuboid

let makeCuboid = Builder.makeCuboid

module MinecraftCharacterLegacy = {
  type layer = {
    head: cuboidLegacy,
    rightArm: cuboidLegacy,
    leftArm: cuboidLegacy,
    body: cuboidLegacy,
    rightLeg: cuboidLegacy,
    leftLeg: cuboidLegacy,
  }

  type t = {
    base: layer,
    overlay: layer,
  }

  let steve: t = {
    base: {
      head: makeCuboidLegacy((0, 0), (8, 8, 8)),
      rightArm: makeCuboidLegacy((40, 16), (4, 12, 4)),
      leftArm: makeCuboidLegacy((32, 48), (4, 12, 4)),
      body: makeCuboidLegacy((16, 16), (8, 12, 4)),
      rightLeg: makeCuboidLegacy((0, 16), (4, 12, 4)),
      leftLeg: makeCuboidLegacy((16, 48), (4, 12, 4)),
    },
    overlay: {
      head: makeCuboidLegacy((32, 0), (8, 8, 8)),
      rightArm: makeCuboidLegacy((40, 32), (4, 12, 4)),
      leftArm: makeCuboidLegacy((48, 48), (4, 12, 4)),
      body: makeCuboidLegacy((16, 32), (8, 12, 4)),
      rightLeg: makeCuboidLegacy((0, 32), (4, 12, 4)),
      leftLeg: makeCuboidLegacy((0, 48), (4, 12, 4)),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: makeCuboidLegacy((40, 16), (3, 12, 4)),
      leftArm: makeCuboidLegacy((32, 48), (3, 12, 4)),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: makeCuboidLegacy((40, 32), (3, 12, 4)),
      leftArm: makeCuboidLegacy((48, 48), (3, 12, 4)),
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}

module MinecraftCharacter = {
  type layer = {
    head: Builder.cuboid,
    rightArm: Builder.cuboid,
    leftArm: Builder.cuboid,
    body: Builder.cuboid,
    rightLeg: Builder.cuboid,
    leftLeg: Builder.cuboid,
  }

  type t = {
    base: layer,
    overlay: layer,
  }

  let steve: t = {
    base: {
      head: Builder.makeCuboid((0, 0), (8, 8, 8)),
      rightArm: Builder.makeCuboid((40, 16), (4, 12, 4)),
      leftArm: Builder.makeCuboid((32, 48), (4, 12, 4)),
      body: Builder.makeCuboid((16, 16), (8, 12, 4)),
      rightLeg: Builder.makeCuboid((0, 16), (4, 12, 4)),
      leftLeg: Builder.makeCuboid((16, 48), (4, 12, 4)),
    },
    overlay: {
      head: Builder.makeCuboid((32, 0), (8, 8, 8)),
      rightArm: Builder.makeCuboid((40, 32), (4, 12, 4)),
      leftArm: Builder.makeCuboid((48, 48), (4, 12, 4)),
      body: Builder.makeCuboid((16, 32), (8, 12, 4)),
      rightLeg: Builder.makeCuboid((0, 32), (4, 12, 4)),
      leftLeg: Builder.makeCuboid((0, 48), (4, 12, 4)),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: Builder.makeCuboid((40, 16), (3, 12, 4)),
      leftArm: Builder.makeCuboid((32, 48), (3, 12, 4)),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: Builder.makeCuboid((40, 32), (3, 12, 4)),
      leftArm: Builder.makeCuboid((48, 48), (3, 12, 4)),
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}
