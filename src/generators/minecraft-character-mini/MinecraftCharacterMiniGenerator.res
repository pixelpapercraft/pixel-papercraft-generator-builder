let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character-mini"

let name = "Minecraft Character Mini"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Skin Overlay",
    url: requireImage("skin-overlay"),
  },
  {
    id: "Skin Background",
    url: requireImage("skin-background"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacterLegacy.steve
let alex = TextureMap.MinecraftCharacterLegacy.alex

// type cuboid = {
//   right: Builder.rectangleLegacy,
//   front: Builder.rectangleLegacy,
//   left: Builder.rectangleLegacy,
//   back: Builder.rectangleLegacy,
//   top: Builder.rectangleLegacy,
//   bottom: Builder.rectangleLegacy,
// }

// type rightLeftCuboid = {
//   right: cuboid,
//   left: cuboid,
// }

// type skin = {
//   head: cuboid,
//   body: cuboid,
//   leg: rightLeftCuboid,
//   arm: rightLeftCuboid,
//   alex: rightLeftCuboid,
// }

// // Define the texture regions
// let char = {
//   head: {
//     right: {x: 0, y: 8, w: 8, h: 8},
//     front: {x: 8, y: 8, w: 8, h: 8},
//     left: {x: 16, y: 8, w: 8, h: 8},
//     back: {x: 24, y: 8, w: 8, h: 8},
//     top: {x: 8, y: 0, w: 8, h: 8},
//     bottom: {x: 16, y: 0, w: 8, h: 8},
//   },
//   body: {
//     right: {x: 16, y: 20, w: 4, h: 12},
//     front: {x: 20, y: 20, w: 8, h: 12},
//     left: {x: 28, y: 20, w: 4, h: 12},
//     back: {x: 32, y: 20, w: 8, h: 12},
//     top: {x: 20, y: 16, w: 8, h: 4},
//     bottom: {x: 28, y: 16, w: 8, h: 4},
//   },
//   leg: {
//     right: {
//       right: {x: 0, y: 20, w: 4, h: 12},
//       front: {x: 4, y: 20, w: 4, h: 12},
//       left: {x: 8, y: 20, w: 4, h: 12},
//       back: {x: 12, y: 20, w: 4, h: 12},
//       top: {x: 4, y: 16, w: 4, h: 4},
//       bottom: {x: 8, y: 16, w: 4, h: 4},
//     },
//     left: {
//       right: {x: 16, y: 52, w: 4, h: 12},
//       front: {x: 20, y: 52, w: 4, h: 12},
//       left: {x: 24, y: 52, w: 4, h: 12},
//       back: {x: 28, y: 52, w: 4, h: 12},
//       top: {x: 20, y: 48, w: 4, h: 4},
//       bottom: {x: 24, y: 48, w: 4, h: 4},
//     },
//   },
//   arm: {
//     right: {
//       right: {x: 40, y: 20, w: 4, h: 12},
//       front: {x: 44, y: 20, w: 4, h: 12},
//       left: {x: 48, y: 20, w: 4, h: 12},
//       back: {x: 52, y: 20, w: 4, h: 12},
//       top: {x: 44, y: 16, w: 4, h: 4},
//       bottom: {x: 48, y: 16, w: 4, h: 4},
//     },
//     left: {
//       right: {x: 32, y: 52, w: 4, h: 12},
//       front: {x: 36, y: 52, w: 4, h: 12},
//       left: {x: 40, y: 52, w: 4, h: 12},
//       back: {x: 44, y: 52, w: 4, h: 12},
//       top: {x: 36, y: 48, w: 4, h: 4},
//       bottom: {x: 40, y: 48, w: 4, h: 4},
//     },
//   },
//   alex: {
//     right: {
//       right: {x: 40, y: 20, w: 4, h: 12},
//       front: {x: 44, y: 20, w: 3, h: 12},
//       left: {x: 47, y: 20, w: 4, h: 12},
//       back: {x: 51, y: 20, w: 3, h: 12},
//       top: {x: 44, y: 16, w: 3, h: 4},
//       bottom: {x: 47, y: 16, w: 3, h: 4},
//     },
//     left: {
//       right: {x: 32, y: 52, w: 4, h: 12},
//       front: {x: 36, y: 52, w: 3, h: 12},
//       left: {x: 39, y: 52, w: 4, h: 12},
//       back: {x: 43, y: 52, w: 3, h: 12},
//       top: {x: 36, y: 48, w: 3, h: 4},
//       bottom: {x: 39, y: 48, w: 3, h: 4},
//     },
//   },
// }

// let overlay = {
//   head: {
//     right: {x: 32, y: 8, w: 8, h: 8},
//     front: {x: 40, y: 8, w: 8, h: 8},
//     left: {x: 48, y: 8, w: 8, h: 8},
//     back: {x: 56, y: 8, w: 8, h: 8},
//     top: {x: 40, y: 0, w: 8, h: 8},
//     bottom: {x: 48, y: 0, w: 8, h: 8},
//   },
//   body: {
//     right: {x: 16, y: 36, w: 4, h: 12},
//     front: {x: 20, y: 36, w: 8, h: 12},
//     left: {x: 28, y: 36, w: 4, h: 12},
//     back: {x: 32, y: 36, w: 8, h: 12},
//     top: {x: 20, y: 32, w: 8, h: 4},
//     bottom: {x: 28, y: 32, w: 8, h: 4},
//   },
//   leg: {
//     right: {
//       right: {x: 0, y: 36, w: 4, h: 12},
//       front: {x: 4, y: 36, w: 4, h: 12},
//       left: {x: 8, y: 36, w: 4, h: 12},
//       back: {x: 12, y: 36, w: 4, h: 12},
//       top: {x: 4, y: 32, w: 4, h: 4},
//       bottom: {x: 8, y: 32, w: 4, h: 4},
//     },
//     left: {
//       right: {x: 0, y: 52, w: 4, h: 12},
//       front: {x: 4, y: 52, w: 4, h: 12},
//       left: {x: 8, y: 52, w: 4, h: 12},
//       back: {x: 12, y: 52, w: 4, h: 12},
//       top: {x: 4, y: 48, w: 4, h: 4},
//       bottom: {x: 8, y: 48, w: 4, h: 4},
//     },
//   },
//   arm: {
//     right: {
//       right: {x: 40, y: 36, w: 4, h: 12},
//       front: {x: 44, y: 36, w: 4, h: 12},
//       left: {x: 48, y: 36, w: 4, h: 12},
//       back: {x: 52, y: 36, w: 4, h: 12},
//       top: {x: 44, y: 32, w: 4, h: 4},
//       bottom: {x: 48, y: 32, w: 4, h: 4},
//     },
//     left: {
//       right: {x: 48, y: 52, w: 4, h: 12},
//       front: {x: 52, y: 52, w: 4, h: 12},
//       left: {x: 56, y: 52, w: 4, h: 12},
//       back: {x: 60, y: 52, w: 4, h: 12},
//       top: {x: 52, y: 48, w: 4, h: 4},
//       bottom: {x: 56, y: 48, w: 4, h: 4},
//     },
//   },
//   alex: {
//     right: {
//       right: {x: 40, y: 36, w: 4, h: 12},
//       front: {x: 44, y: 36, w: 3, h: 12},
//       left: {x: 47, y: 36, w: 4, h: 12},
//       back: {x: 51, y: 36, w: 3, h: 12},
//       top: {x: 44, y: 32, w: 3, h: 4},
//       bottom: {x: 47, y: 32, w: 3, h: 4},
//     },
//     left: {
//       right: {x: 48, y: 52, w: 4, h: 12},
//       front: {x: 52, y: 52, w: 3, h: 12},
//       left: {x: 55, y: 52, w: 4, h: 12},
//       back: {x: 59, y: 52, w: 3, h: 12},
//       top: {x: 52, y: 48, w: 3, h: 4},
//       bottom: {x: 55, y: 48, w: 3, h: 4},
//     },
//   },
// }

type options = {
  skin: string,
  x: int,
  y: int,
  alexModel: bool,
  showHeadOverlay: bool,
  showBodyOverlay: bool,
  showArmOverlay: bool,
  showLegOverlay: bool,
  bodyHeight: int,
}

let drawMini = (options: options) => {
  let skin = options.skin
  let x = options.x
  let y = options.y
  let alexModel = options.alexModel
  let showHeadOverlay = options.showHeadOverlay
  let showBodyOverlay = options.showBodyOverlay
  let showArmOverlay = options.showArmOverlay
  let showLegOverlay = options.showLegOverlay
  let bodyHeight = options.bodyHeight
  let legHeight = 64 - bodyHeight

  //skn background
  Generator.drawImage("Skin Background", (x, y))

  // head
  let ox = x + 49
  let oy = y + 90
  Generator.drawTextureLegacy(
    skin,
    // char.head.right,
    steve.base.head.right,
    {x: ox, y: oy, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.front,
    // char.head.front,
    {
      x: ox + 64,
      y: oy,
      w: 64,
      h: 64,
    },
    (),
  ) // Face
  Generator.drawTextureLegacy(
    skin,
    // char.head.left,
    steve.base.head.left,
    {
      x: ox + 128,
      y: oy,
      w: 64,
      h: 64,
    },
    (),
  ) // Left
  Generator.drawTextureLegacy(
    skin,
    // char.head.back,
    steve.base.head.back,
    {
      x: ox + 192,
      y: oy,
      w: 64,
      h: 64,
    },
    (),
  ) // Back
  Generator.drawTextureLegacy(
    skin,
    // char.head.top,
    steve.base.head.top,
    {
      x: ox + 64,
      y: oy - 64,
      w: 64,
      h: 64,
    },
    (),
  ) // Top

  // head overlay
  if showHeadOverlay {
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.right,
      steve.overlay.head.right,
      {
        x: ox,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Right
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.front,
      steve.overlay.head.front,
      {
        x: ox + 64,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Face
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.left,
      steve.overlay.head.left,
      {
        x: ox + 128,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Left
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.back,
      steve.overlay.head.back,
      {
        x: ox + 192,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.top,
      steve.overlay.head.top,
      {
        x: ox + 64,
        y: oy - 64,
        w: 64,
        h: 64,
      },
      (),
    )
  }

  //head flaps
  let ox = x + 49
  let oy = y + 26
  Generator.drawTextureLegacy(
    skin,
    // char.head.right,
    steve.base.head.right,
    {x: ox + 64, y: oy, w: 64, h: 64},
    ~rotateLegacy=90.0,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    skin,
    // char.head.left,
    steve.base.head.left,
    {x: ox + 128, y: oy + 64, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Left
  if showHeadOverlay {
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.right,
      steve.overlay.head.right,
      {x: ox + 64, y: oy, w: 64, h: 64},
      ~rotateLegacy=90.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      skin,
      // overlay.head.left,
      steve.overlay.head.left,
      {x: ox + 128, y: oy + 64, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    )
  }

  // body
  let ox = x + 49
  let oy = y + 154
  Generator.drawTextureLegacy(
    skin,
    // char.body.right,
    steve.base.body.right,
    {
      x: ox,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    (),
  ) // rght
  Generator.drawTextureLegacy(
    skin,
    // char.body.front,
    steve.base.body.front,
    {
      x: ox + 64,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    (),
  ) // front
  Generator.drawTextureLegacy(
    skin,
    // char.body.left,
    steve.base.body.left,
    {
      x: ox + 128,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    (),
  ) // Left
  Generator.drawTextureLegacy(
    skin,
    // char.body.back,
    steve.base.body.back,
    {
      x: ox + 192,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    (),
  ) // Back

  // body
  if showBodyOverlay {
    Generator.drawTextureLegacy(
      skin,
      // overlay.body.right,
      steve.overlay.body.right,
      {
        x: ox,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      (),
    ) // rght
    Generator.drawTextureLegacy(
      skin,
      // overlay.body.front,
      steve.overlay.body.front,
      {
        x: ox + 64,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      (),
    ) // front
    Generator.drawTextureLegacy(
      skin,
      // overlay.body.left,
      steve.overlay.body.left,
      {
        x: ox + 128,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      (),
    ) // Left
    Generator.drawTextureLegacy(
      skin,
      // overlay.body.back,
      steve.overlay.body.back,
      {
        x: ox + 192,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      (),
    )
  }

  //Arms
  if alexModel {
    // right arm
    let ox = x + 49
    let oy = y + 10
    Generator.drawTextureLegacy(
      skin,
      // char.alex.right.left,
      alex.base.rightArm.left,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // char.alex.right.right,
      alex.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        // overlay.alex.right.left,
        alex.overlay.rightArm.left,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        // overlay.alex.right.right,
        alex.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      )
    }

    //left arm
    let ox = x + 241
    let oy = y + 42
    Generator.drawTextureLegacy(
      skin,
      // char.alex.left.right,
      alex.base.leftArm.right,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // char.alex.left.left,
      alex.base.leftArm.left,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        // overlay.alex.left.right,
        alex.overlay.leftArm.right,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        // overlay.alex.left.left,
        alex.overlay.leftArm.left,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      )
    }
  } else {
    // right arm
    let ox = x + 49
    let oy = y + 10
    Generator.drawTextureLegacy(
      skin,
      // char.arm.right.left,
      steve.base.rightArm.left,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // char.arm.right.right,
      steve.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        // overlay.arm.right.left,
        steve.overlay.rightArm.left,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        // overlay.arm.right.right,
        steve.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      )
    }

    //left arm
    let ox = x + 241
    let oy = y + 42
    Generator.drawTextureLegacy(
      skin,
      // char.arm.left.right,
      steve.base.leftArm.right,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // char.arm.left.left,
      steve.base.leftArm.left,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        // overlay.arm.left.right,
        steve.overlay.leftArm.right,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        // overlay.arm.left.left,
        steve.overlay.leftArm.left,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      )
    }
  }

  //legs
  let ox = x + 49
  let oy = y + 154 //287;

  //right
  Generator.drawTextureLegacy(
    skin,
    // char.leg.right.front,
    steve.base.rightLeg.front,
    {
      x: ox + 64,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    (),
  ) // front
  Generator.drawTextureLegacy(
    skin,
    // char.leg.right.right,
    steve.base.rightLeg.right,
    {
      x: ox,
      y: oy + bodyHeight,
      w: 64,
      h: legHeight,
    },
    (),
  ) // right
  Generator.drawTextureLegacy(
    skin,
    // char.leg.right.back,
    steve.base.rightLeg.back,
    {
      x: ox + 224,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    (),
  ) // Back
  Generator.drawTextureLegacy(
    skin,
    // char.leg.right.bottom,
    steve.base.rightLeg.bottom,
    {x: ox + 64, y: oy + 64, w: 32, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //left
  Generator.drawTextureLegacy(
    skin,
    // char.leg.left.front,
    steve.base.leftLeg.front,
    {
      x: ox + 96,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    (),
  ) // front
  Generator.drawTextureLegacy(
    skin,
    // char.leg.left.left,
    steve.base.leftLeg.left,
    {
      x: ox + 128,
      y: oy + bodyHeight,
      w: 64,
      h: legHeight,
    },
    (),
  ) // Left
  Generator.drawTextureLegacy(
    skin,
    // char.leg.left.back,
    steve.base.leftLeg.back,
    {
      x: ox + 192,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    (),
  ) // Back
  Generator.drawTextureLegacy(
    skin,
    // char.leg.left.bottom,
    steve.base.leftLeg.bottom,
    {x: ox + 96, y: oy + 64, w: 32, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  if showLegOverlay {
    //right
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.right.front,
      steve.overlay.rightLeg.front,
      {
        x: ox + 64,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      (),
    ) // front
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.right.right,
      steve.overlay.rightLeg.right,
      {
        x: ox,
        y: oy + bodyHeight,
        w: 64,
        h: legHeight,
      },
      (),
    ) // right
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.right.back,
      steve.overlay.rightLeg.back,
      {
        x: ox + 224,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.right.bottom,
      steve.overlay.rightLeg.bottom,
      {x: ox + 64, y: oy + 64, w: 32, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom

    //left
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.left.front,
      steve.overlay.leftLeg.front,
      {
        x: ox + 96,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      (),
    ) // front
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.left.left,
      steve.overlay.leftLeg.left,
      {
        x: ox + 128,
        y: oy + bodyHeight,
        w: 64,
        h: legHeight,
      },
      (),
    ) // Left
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.left.back,
      steve.overlay.leftLeg.back,
      {
        x: ox + 192,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      // overlay.leg.left.bottom,
      steve.overlay.leftLeg.bottom,
      {x: ox + 96, y: oy + 64, w: 32, h: 64},
      ~flip=#Vertical,
      (),
    )
  }

  //draw the fold and cut lines
  Generator.drawImage("Skin Overlay", (x, y))
}

let script = () => {
  // Define the user inputs
  Generator.defineTextureInput("Skin 1", {standardWidth: 64, standardHeight: 64, choices: []})
  Generator.defineTextureInput("Skin 2", {standardWidth: 64, standardHeight: 64, choices: []})

  let showSkin1 = Generator.hasTexture("Skin 1")
  let showSkin2 = Generator.hasTexture("Skin 2")

  if showSkin1 {
    Generator.defineSelectInput("Skin 1 Model Type", ["Steve", "Alex"])
    let modelType1 = Generator.getSelectInputValue("Skin 1 Model Type")

    Generator.defineBooleanInput("Skin 1 Head Overlay", true)
    Generator.defineBooleanInput("Skin 1 Body Overlay", true)
    Generator.defineBooleanInput("Skin 1 Arm Overlay", true)
    Generator.defineBooleanInput("Skin 1 Leg Overlay", true)
    Generator.defineRangeInput(
      "Skin 1 Body Height",
      {
        min: 0,
        max: 64,
        value: 32,
        step: 1,
      },
    )

    let alexModel1 = modelType1 === "Alex"
    let showSkin1HeadOverlay = Generator.getBooleanInputValue("Skin 1 Head Overlay")
    let showSkin1BodyOverlay = Generator.getBooleanInputValue("Skin 1 Body Overlay")
    let showSkin1ArmOverlay = Generator.getBooleanInputValue("Skin 1 Arm Overlay")
    let showSkin1LegOverlay = Generator.getBooleanInputValue("Skin 1 Leg Overlay")
    let skin1BodyHeight = Generator.getRangeInputValue("Skin 1 Body Height")

    let skin1Options = {
      skin: "Skin 1",
      x: 151,
      y: 108,
      alexModel: alexModel1,
      showHeadOverlay: showSkin1HeadOverlay,
      showBodyOverlay: showSkin1BodyOverlay,
      showArmOverlay: showSkin1ArmOverlay,
      showLegOverlay: showSkin1LegOverlay,
      bodyHeight: skin1BodyHeight,
    }

    drawMini(skin1Options)
  }

  if showSkin2 {
    Generator.defineSelectInput("Skin 2 Model Type", ["Steve", "Alex"])
    let modelType2 = Generator.getSelectInputValue("Skin 2 Model Type")

    Generator.defineBooleanInput("Skin 2 Head Overlay", true)
    Generator.defineBooleanInput("Skin 2 Body Overlay", true)
    Generator.defineBooleanInput("Skin 2 Arm Overlay", true)
    Generator.defineBooleanInput("Skin 2 Leg Overlay", true)
    Generator.defineRangeInput(
      "Skin 2 Body Height",
      {
        min: 0,
        max: 64,
        value: 32,
        step: 1,
      },
    )

    let alexModel2 = modelType2 === "Alex"
    let showSkin2HeadOverlay = Generator.getBooleanInputValue("Skin 2 Head Overlay")
    let showSkin2BodyOverlay = Generator.getBooleanInputValue("Skin 2 Body Overlay")
    let showSkin2ArmOverlay = Generator.getBooleanInputValue("Skin 2 Arm Overlay")
    let showSkin2LegOverlay = Generator.getBooleanInputValue("Skin 2 Leg Overlay")
    let skin2BodyHeight = +Generator.getRangeInputValue("Skin 2 Body Height")
    let skin2Options = {
      skin: "Skin 2",
      x: 151,
      y: 453,
      alexModel: alexModel2,
      showHeadOverlay: showSkin2HeadOverlay,
      showBodyOverlay: showSkin2BodyOverlay,
      showArmOverlay: showSkin2ArmOverlay,
      showLegOverlay: showSkin2LegOverlay,
      bodyHeight: skin2BodyHeight,
    }

    drawMini(skin2Options)
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
