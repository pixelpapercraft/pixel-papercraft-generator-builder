type cuboidLegacy = {
  top: Builder.rectangleLegacy,
  bottom: Builder.rectangleLegacy,
  front: Builder.rectangleLegacy,
  right: Builder.rectangleLegacy,
  left: Builder.rectangleLegacy,
  back: Builder.rectangleLegacy,
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
        top: {x: 43, y: 52, w: 3, h: 12},
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
