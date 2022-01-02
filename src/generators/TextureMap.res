type cuboidLegacy = {
  top: Builder.rectangleLegacy,
  bottom: Builder.rectangleLegacy,
  front: Builder.rectangleLegacy,
  right: Builder.rectangleLegacy,
  left: Builder.rectangleLegacy,
  back: Builder.rectangleLegacy,
}

type cuboid = {
  top: Builder.rectangle,
  bottom: Builder.rectangle,
  front: Builder.rectangle,
  right: Builder.rectangle,
  left: Builder.rectangle,
  back: Builder.rectangle,
}

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
      head: {
        right: {x: 0, y: 8, w: 8, h: 8},
        front: {x: 8, y: 8, w: 8, h: 8},
        left: {x: 16, y: 8, w: 8, h: 8},
        back: {x: 24, y: 8, w: 8, h: 8},
        top: {x: 8, y: 0, w: 8, h: 8},
        bottom: {x: 16, y: 0, w: 8, h: 8},
      },
      rightArm: {
        right: {x: 40, y: 20, w: 4, h: 12},
        front: {x: 44, y: 20, w: 4, h: 12},
        left: {x: 48, y: 20, w: 4, h: 12},
        back: {x: 52, y: 20, w: 4, h: 12},
        top: {x: 44, y: 16, w: 4, h: 4},
        bottom: {x: 48, y: 16, w: 4, h: 4},
      },
      leftArm: {
        right: {x: 32, y: 52, w: 4, h: 12},
        front: {x: 36, y: 52, w: 4, h: 12},
        left: {x: 40, y: 52, w: 4, h: 12},
        back: {x: 44, y: 52, w: 4, h: 12},
        top: {x: 36, y: 48, w: 4, h: 4},
        bottom: {x: 40, y: 48, w: 4, h: 4},
      },
      body: {
        right: {x: 16, y: 20, w: 4, h: 12},
        front: {x: 20, y: 20, w: 8, h: 12},
        left: {x: 28, y: 20, w: 4, h: 12},
        back: {x: 32, y: 20, w: 8, h: 12},
        top: {x: 20, y: 16, w: 8, h: 4},
        bottom: {x: 28, y: 16, w: 8, h: 4},
      },
      rightLeg: {
        right: {x: 0, y: 20, w: 4, h: 12},
        front: {x: 4, y: 20, w: 4, h: 12},
        left: {x: 8, y: 20, w: 4, h: 12},
        back: {x: 12, y: 20, w: 4, h: 12},
        top: {x: 4, y: 16, w: 4, h: 4},
        bottom: {x: 8, y: 16, w: 4, h: 4},
      },
      leftLeg: {
        right: {x: 16, y: 52, w: 4, h: 12},
        front: {x: 20, y: 52, w: 4, h: 12},
        left: {x: 24, y: 52, w: 4, h: 12},
        back: {x: 28, y: 52, w: 4, h: 12},
        top: {x: 20, y: 48, w: 4, h: 4},
        bottom: {x: 24, y: 48, w: 4, h: 4},
      },
    },
    overlay: {
      head: {
        right: {x: 32, y: 8, w: 8, h: 8},
        front: {x: 40, y: 8, w: 8, h: 8},
        left: {x: 48, y: 8, w: 8, h: 8},
        back: {x: 56, y: 8, w: 8, h: 8},
        top: {x: 40, y: 0, w: 8, h: 8},
        bottom: {x: 48, y: 0, w: 8, h: 8},
      },
      rightArm: {
        right: {x: 40, y: 36, w: 4, h: 12},
        front: {x: 44, y: 36, w: 4, h: 12},
        left: {x: 48, y: 36, w: 4, h: 12},
        back: {x: 52, y: 36, w: 4, h: 12},
        top: {x: 44, y: 32, w: 4, h: 4},
        bottom: {x: 48, y: 32, w: 4, h: 4},
      },
      leftArm: {
        right: {x: 48, y: 52, w: 4, h: 12},
        front: {x: 52, y: 52, w: 4, h: 12},
        left: {x: 56, y: 52, w: 4, h: 12},
        back: {x: 60, y: 52, w: 4, h: 12},
        top: {x: 52, y: 48, w: 4, h: 4},
        bottom: {x: 56, y: 48, w: 4, h: 4},
      },
      body: {
        right: {x: 16, y: 36, w: 4, h: 12},
        front: {x: 20, y: 36, w: 8, h: 12},
        left: {x: 28, y: 36, w: 4, h: 12},
        back: {x: 32, y: 36, w: 8, h: 12},
        top: {x: 20, y: 32, w: 8, h: 4},
        bottom: {x: 28, y: 32, w: 8, h: 4},
      },
      rightLeg: {
        right: {x: 0, y: 36, w: 4, h: 12},
        front: {x: 4, y: 36, w: 4, h: 12},
        left: {x: 8, y: 36, w: 4, h: 12},
        back: {x: 12, y: 36, w: 4, h: 12},
        top: {x: 4, y: 32, w: 4, h: 4},
        bottom: {x: 8, y: 32, w: 4, h: 4},
      },
      leftLeg: {
        right: {x: 0, y: 52, w: 4, h: 12},
        front: {x: 4, y: 52, w: 4, h: 12},
        left: {x: 8, y: 52, w: 4, h: 12},
        back: {x: 12, y: 52, w: 4, h: 12},
        top: {x: 4, y: 48, w: 4, h: 4},
        bottom: {x: 8, y: 48, w: 4, h: 4},
      },
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: {
        right: {x: 40, y: 20, w: 4, h: 12},
        front: {x: 44, y: 20, w: 3, h: 12},
        left: {x: 47, y: 20, w: 4, h: 12},
        back: {x: 51, y: 20, w: 3, h: 12},
        top: {x: 44, y: 16, w: 3, h: 4},
        bottom: {x: 47, y: 16, w: 3, h: 4},
      },
      leftArm: {
        right: {x: 32, y: 52, w: 4, h: 12},
        front: {x: 36, y: 52, w: 3, h: 12},
        left: {x: 39, y: 52, w: 4, h: 12},
        back: {x: 43, y: 52, w: 3, h: 12},
        top: {x: 36, y: 48, w: 3, h: 4},
        bottom: {x: 39, y: 48, w: 3, h: 4},
      },
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: {
        right: {x: 40, y: 36, w: 4, h: 12},
        front: {x: 44, y: 36, w: 3, h: 12},
        left: {x: 47, y: 36, w: 4, h: 12},
        back: {x: 51, y: 36, w: 3, h: 12},
        top: {x: 44, y: 32, w: 3, h: 4},
        bottom: {x: 47, y: 32, w: 3, h: 4},
      },
      leftArm: {
        right: {x: 48, y: 52, w: 4, h: 12},
        front: {x: 52, y: 52, w: 3, h: 12},
        left: {x: 55, y: 52, w: 4, h: 12},
        back: {x: 59, y: 52, w: 3, h: 12},
        top: {x: 52, y: 48, w: 3, h: 4},
        bottom: {x: 55, y: 48, w: 3, h: 4},
      },
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}

module MinecraftCharacter = {
  type layer = {
    head: cuboid,
    rightArm: cuboid,
    leftArm: cuboid,
    body: cuboid,
    rightLeg: cuboid,
    leftLeg: cuboid,
  }

  type t = {
    base: layer,
    overlay: layer,
  }

  let steve: t = {
    base: {
      head: {
        right: (0, 8, 8, 8),
        front: (8, 8, 8, 8),
        left: (16, 8, 8, 8),
        back: (24, 8, 8, 8),
        top: (8, 0, 8, 8),
        bottom: (16, 0, 8, 8),
      },
      rightArm: {
        right: (40, 20, 4, 12),
        front: (44, 20, 4, 12),
        left: (48, 20, 4, 12),
        back: (52, 20, 4, 12),
        top: (44, 16, 4, 4),
        bottom: (48, 16, 4, 4),
      },
      leftArm: {
        right: (32, 52, 4, 12),
        front: (36, 52, 4, 12),
        left: (40, 52, 4, 12),
        back: (44, 52, 4, 12),
        top: (36, 48, 4, 4),
        bottom: (40, 48, 4, 4),
      },
      body: {
        right: (16, 20, 4, 12),
        front: (20, 20, 8, 12),
        left: (28, 20, 4, 12),
        back: (32, 20, 8, 12),
        top: (20, 16, 8, 4),
        bottom: (28, 16, 8, 4),
      },
      rightLeg: {
        right: (0, 20, 4, 12),
        front: (4, 20, 4, 12),
        left: (8, 20, 4, 12),
        back: (12, 20, 4, 12),
        top: (4, 16, 4, 4),
        bottom: (8, 16, 4, 4),
      },
      leftLeg: {
        right: (16, 52, 4, 12),
        front: (20, 52, 4, 12),
        left: (24, 52, 4, 12),
        back: (28, 52, 4, 12),
        top: (20, 48, 4, 4),
        bottom: (24, 48, 4, 4),
      },
    },
    overlay: {
      head: {
        right: (32, 8, 8, 8),
        front: (40, 8, 8, 8),
        left: (48, 8, 8, 8),
        back: (56, 8, 8, 8),
        top: (40, 0, 8, 8),
        bottom: (48, 0, 8, 8),
      },
      rightArm: {
        right: (40, 36, 4, 12),
        front: (44, 36, 4, 12),
        left: (48, 36, 4, 12),
        back: (52, 36, 4, 12),
        top: (44, 32, 4, 4),
        bottom: (48, 32, 4, 4),
      },
      leftArm: {
        right: (48, 52, 4, 12),
        front: (52, 52, 4, 12),
        left: (56, 52, 4, 12),
        back: (60, 52, 4, 12),
        top: (52, 48, 4, 4),
        bottom: (56, 48, 4, 4),
      },
      body: {
        right: (16, 36, 4, 12),
        front: (20, 36, 8, 12),
        left: (28, 36, 4, 12),
        back: (32, 36, 8, 12),
        top: (20, 32, 8, 4),
        bottom: (28, 32, 8, 4),
      },
      rightLeg: {
        right: (0, 36, 4, 12),
        front: (4, 36, 4, 12),
        left: (8, 36, 4, 12),
        back: (12, 36, 4, 12),
        top: (4, 32, 4, 4),
        bottom: (8, 32, 4, 4),
      },
      leftLeg: {
        right: (0, 52, 4, 12),
        front: (4, 52, 4, 12),
        left: (8, 52, 4, 12),
        back: (12, 52, 4, 12),
        top: (4, 48, 4, 4),
        bottom: (8, 48, 4, 4),
      },
    },
  }

  let alex: t = {
    base: {
      head: steve.base.head,
      rightArm: {
        right: (40, 20, 4, 12),
        front: (44, 20, 3, 12),
        left: (47, 20, 4, 12),
        back: (51, 20, 3, 12),
        top: (44, 16, 3, 4),
        bottom: (47, 16, 3, 4),
      },
      leftArm: {
        right: (32, 52, 4, 12),
        front: (36, 52, 3, 12),
        left: (39, 52, 4, 12),
        back: (43, 52, 3, 12),
        top: (36, 48, 3, 4),
        bottom: (39, 48, 3, 4),
      },
      body: steve.base.body,
      rightLeg: steve.base.rightLeg,
      leftLeg: steve.base.leftLeg,
    },
    overlay: {
      head: steve.overlay.head,
      rightArm: {
        right: (40, 36, 4, 12),
        front: (44, 36, 3, 12),
        left: (47, 36, 4, 12),
        back: (51, 36, 3, 12),
        top: (44, 32, 3, 4),
        bottom: (47, 32, 3, 4),
      },
      leftArm: {
        right: (48, 52, 4, 12),
        front: (52, 52, 3, 12),
        left: (55, 52, 4, 12),
        back: (59, 52, 3, 12),
        top: (52, 48, 3, 4),
        bottom: (55, 48, 3, 4),
      },
      body: steve.overlay.body,
      rightLeg: steve.overlay.rightLeg,
      leftLeg: steve.overlay.leftLeg,
    },
  }
}
