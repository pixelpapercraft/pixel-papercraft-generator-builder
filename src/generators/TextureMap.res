module Builder = Generator.Builder

module MinecraftCharacterLegacy = {
  type layer = {
    head: Builder.cuboidLegacy,
    rightArm: Builder.cuboidLegacy,
    leftArm: Builder.cuboidLegacy,
    body: Builder.cuboidLegacy,
    rightLeg: Builder.cuboidLegacy,
    leftLeg: Builder.cuboidLegacy,
  }

  type t = {
    base: layer,
    overlay: layer,
  }

  let steve: t = {
    base: {
      head: Builder.makeCuboidLegacy((0, 0), (8, 8, 8)),
      rightArm: Builder.makeCuboidLegacy((40, 16), (4, 12, 4)),
      leftArm: Builder.makeCuboidLegacy((32, 48), (4, 12, 4)),
      body: Builder.makeCuboidLegacy((16, 16), (8, 12, 4)),
      rightLeg: Builder.makeCuboidLegacy((0, 16), (4, 12, 4)),
      leftLeg: Builder.makeCuboidLegacy((16, 48), (4, 12, 4)),
    },
    overlay: {
      head: Builder.makeCuboidLegacy((32, 0), (8, 8, 8)),
      rightArm: Builder.makeCuboidLegacy((40, 32), (4, 12, 4)),
      leftArm: Builder.makeCuboidLegacy((48, 48), (4, 12, 4)),
      body: Builder.makeCuboidLegacy((16, 32), (8, 12, 4)),
      rightLeg: Builder.makeCuboidLegacy((0, 32), (4, 12, 4)),
      leftLeg: Builder.makeCuboidLegacy((0, 48), (4, 12, 4)),
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: Builder.makeCuboidLegacy((40, 16), (3, 12, 4)),
      leftArm: Builder.makeCuboidLegacy((32, 48), (3, 12, 4)),
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: Builder.makeCuboidLegacy((40, 32), (3, 12, 4)),
      leftArm: Builder.makeCuboidLegacy((48, 48), (3, 12, 4)),
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
