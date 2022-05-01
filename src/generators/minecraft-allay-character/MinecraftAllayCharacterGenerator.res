let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "minecraft-allay-character"

let name = "Minecraft Allay Character"

let images: array<Generator.imageDef> = [{id: "Overlay", url: requireImage("OverlayAllay.png")}]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin1",
    url: requireTexture("Skin1.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin2",
    url: requireTexture("Skin2.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

module TextureMap = {
  type cuboid = {
    top: Builder.rectangle,
    bottom: Builder.rectangle,
    front: Builder.rectangle,
    right: Builder.rectangle,
    left: Builder.rectangle,
    back: Builder.rectangle,
    topOverlay: Builder.rectangle,
    bottomOverlay: Builder.rectangle,
    frontOverlay: Builder.rectangle,
    rightOverlay: Builder.rectangle,
    leftOverlay: Builder.rectangle,
    backOverlay: Builder.rectangle,
  }

  type t = {
    head: cuboid,
    body: cuboid,
    rightLeg: cuboid,
    leftLeg: cuboid,
    rightArm: cuboid,
    leftArm: cuboid,
    rightArmAlex: cuboid,
    leftArmAlex: cuboid,
  }

  let allay: t = {
    head: {
      top: (8, 0, 8, 8),
      bottom: (16, 0, 8, 8),
      front: (8, 8, 8, 8),
      right: (0, 8, 8, 8),
      left: (16, 8, 8, 8),
      back: (24, 8, 8, 8),
      topOverlay: (8 + 32, 0, 8, 8),
      bottomOverlay: (16 + 32, 0, 8, 8),
      frontOverlay: (8 + 32, 8, 8, 8),
      rightOverlay: (0 + 32, 8, 8, 8),
      leftOverlay: (16 + 32, 8, 8, 8),
      backOverlay: (24 + 32, 8, 8, 8),
    },
    body: {
      top: (20, 16, 8, 4),
      bottom: (28, 16, 8, 4),
      front: (20, 20, 8, 12),
      right: (16, 20, 4, 12),
      left: (28, 20, 4, 12),
      back: (32, 20, 8, 12),
      topOverlay: (20, 16 + 16, 8, 4),
      bottomOverlay: (28, 16 + 16, 8, 4),
      frontOverlay: (20, 20 + 16, 8, 12),
      rightOverlay: (16, 20 + 16, 4, 12),
      leftOverlay: (28, 20 + 16, 4, 12),
      backOverlay: (32, 20 + 16, 8, 12),
    },
    rightLeg: {
      top: (4, 16, 4, 4),
      bottom: (8, 16, 4, 4),
      front: (4, 20, 4, 12),
      right: (0, 20, 4, 12),
      left: (8, 20, 4, 12),
      back: (12, 20, 4, 12),
      topOverlay: (4, 16 + 16, 4, 4),
      bottomOverlay: (8, 16 + 16, 4, 4),
      frontOverlay: (4, 20 + 16, 4, 12),
      rightOverlay: (0, 20 + 16, 4, 12),
      leftOverlay: (8, 20 + 16, 4, 12),
      backOverlay: (12, 20 + 16, 4, 12),
    },
    leftLeg: {
      top: (20, 48, 4, 4),
      bottom: (24, 48, 4, 4),
      front: (20, 52, 4, 12),
      right: (16, 52, 4, 12),
      left: (24, 52, 4, 12),
      back: (28, 52, 4, 12),
      topOverlay: (20 - 16, 48, 4, 4),
      bottomOverlay: (24 - 16, 48, 4, 4),
      frontOverlay: (20 - 16, 52, 4, 12),
      rightOverlay: (16 - 16, 52, 4, 12),
      leftOverlay: (24 - 16, 52, 4, 12),
      backOverlay: (28 - 16, 52, 4, 12),
    },
    rightArm: {
      top: (44, 16, 4, 4),
      bottom: (48, 16, 4, 4),
      front: (44, 20, 4, 12),
      right: (40, 20, 4, 12),
      left: (48, 20, 4, 12),
      back: (52, 20, 4, 12),
      topOverlay: (44, 16 + 16, 4, 4),
      bottomOverlay: (48, 16 + 16, 4, 4),
      frontOverlay: (44, 20 + 16, 4, 12),
      rightOverlay: (40, 20 + 16, 4, 12),
      leftOverlay: (48, 20 + 16, 4, 12),
      backOverlay: (52, 20 + 16, 4, 12),
    },
    leftArm: {
      top: (44, 16, 4, 4),
      bottom: (48, 16, 4, 4),
      front: (44, 20, 4, 12),
      right: (40, 20, 4, 12),
      left: (48, 20, 4, 12),
      back: (52, 20, 4, 12),
      topOverlay: (44 + 16, 16, 4, 4),
      bottomOverlay: (48 + 16, 16, 4, 4),
      frontOverlay: (44 + 16, 20, 4, 12),
      rightOverlay: (40 + 16, 20, 4, 12),
      leftOverlay: (48 + 16, 20, 4, 12),
      backOverlay: (52 + 16, 20, 4, 12),
    },
    rightArmAlex: {
      top: (44, 16, 3, 4),
      bottom: (48 - 1, 16, 3, 4),
      front: (44, 20, 3, 12),
      right: (40, 20, 4, 12),
      left: (48 - 1, 20, 4, 12),
      back: (52 - 1, 20, 3, 12),
      topOverlay: (44, 16 + 16, 3, 4),
      bottomOverlay: (48 - 1, 16 + 16, 3, 4),
      frontOverlay: (44, 20 + 16, 3, 12),
      rightOverlay: (40, 20 + 16, 4, 12),
      leftOverlay: (48 - 1, 20 + 16, 4, 12),
      backOverlay: (52 - 1, 20 + 16, 3, 12),
    },
    leftArmAlex: {
      top: (44, 16, 3, 4),
      bottom: (48 - 1, 16, 3, 4),
      front: (44, 20, 3, 12),
      right: (40, 20, 4, 12),
      left: (48 - 1, 20, 4, 12),
      back: (52 - 1, 20, 3, 12),
      topOverlay: (44 + 16 - 2, 16, 3, 4),
      bottomOverlay: (48 + 16 - 3, 16, 3, 4),
      frontOverlay: (44 + 16 - 2, 20, 3, 12),
      rightOverlay: (40 + 16 - 2, 20, 4, 12),
      leftOverlay: (48 + 16 - 3, 20, 4, 12),
      backOverlay: (52 + 16 - 3, 20, 3, 12),
    },
  }
}
module Drawing = {
  let drawHead1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.head.frontOverlay, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.rightOverlay, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.leftOverlay, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.backOverlay, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.topOverlay, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.head.bottomOverlay,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
  }

  let drawBody1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.body.frontOverlay, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.rightOverlay, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.leftOverlay, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backOverlay,
      (ox + 31 + 21, oy, 30, 30),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.body.topOverlay, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.frontOverlay,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.rightOverlay,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.leftOverlay,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backOverlay,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.topOverlay,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawRightArm1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArm.rightOverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.leftOverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArm.backOverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.rightArm.topOverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArm.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.rightOverlay, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.leftOverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArm.backOverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.leftArm.topOverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArm.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawRightArm1Alex = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.rightArmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightArmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightArmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.back,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.rightArmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.rightArmAlex.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.rightOverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.leftOverlay,
      (ox + 11, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.backOverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.topOverlay,
      (ox, oy - 21, 10, 20),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightArmAlex.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm1Alex = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.leftArmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftArmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.back,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.leftArmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.leftArmAlex.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.rightOverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.leftOverlay,
      (ox + 11, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.backOverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.topOverlay,
      (ox, oy - 21, 10, 20),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftArmAlex.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawLegs1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.back,
      (ox + 31 + 21, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.body.frontOverlay, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.rightOverlay, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.leftOverlay, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backOverlay,
      (ox + 31 + 21, oy, 30, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.frontOverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.rightOverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.leftOverlay,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backOverlay,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.frontOverlay,
      (ox, oy + 25, 15, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.rightOverlay,
      (ox - 21, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.backOverlay,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.frontOverlay,
      (ox + 15, oy + 25, 15, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.leftOverlay,
      (ox + 31, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.backOverlay,
      (ox + 31 + 21, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.frontOverlay,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.rightOverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rightLeg.backOverlay,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.frontOverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.leftOverlay,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.leftLeg.backOverlay,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawHead2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.head.frontOverlay, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.rightOverlay, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.leftOverlay, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.backOverlay, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.topOverlay, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.head.bottomOverlay,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
  }

  let drawBody2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.body.frontOverlay, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.rightOverlay, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.leftOverlay, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backOverlay,
      (ox + 31 + 21, oy, 30, 30),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.body.topOverlay, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.frontOverlay,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.rightOverlay,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.leftOverlay,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backOverlay,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.topOverlay,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawRightArm2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArm.rightOverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.leftOverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArm.backOverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.rightArm.topOverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArm.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.rightOverlay, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.leftOverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArm.backOverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.leftArm.topOverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArm.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawRightArm2Alex = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.rightArmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightArmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightArmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.back,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.rightArmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.rightArmAlex.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.rightOverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.leftOverlay,
      (ox + 11, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.backOverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.topOverlay,
      (ox, oy - 21, 10, 20),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightArmAlex.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm2Alex = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.leftArmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftArmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.back,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.leftArmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.leftArmAlex.frontOverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.rightOverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.leftOverlay,
      (ox + 11, oy, 20, 40),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.backOverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.topOverlay,
      (ox, oy - 21, 10, 20),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftArmAlex.bottomOverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawLegs2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.back,
      (ox + 31 + 21, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.body.frontOverlay, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.rightOverlay, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.leftOverlay, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backOverlay,
      (ox + 31 + 21, oy, 30, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.frontOverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.rightOverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.leftOverlay,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backOverlay,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.frontOverlay,
      (ox, oy + 25, 15, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.rightOverlay,
      (ox - 21, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.backOverlay,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.frontOverlay,
      (ox + 15, oy + 25, 15, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.leftOverlay,
      (ox + 31, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.backOverlay,
      (ox + 31 + 21, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.frontOverlay,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.rightOverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rightLeg.backOverlay,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.frontOverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.leftOverlay,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.leftLeg.backOverlay,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
  }
}
let script = () => {
  Generator.defineSelectInput("Character 1 skin model type", ["Steve", "Alex"])
  Generator.defineTextureInput(
    "Skin1",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: [],
    },
  )
  let alexModel1 = Generator.getSelectInputValue("Character 1 skin model type") === "Alex"
  Generator.defineSelectInput("Character 2 skin model type", ["Steve", "Alex"])
  Generator.defineTextureInput(
    "Skin2",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: [],
    },
  )
  let alexModel2 = Generator.getSelectInputValue("Character 2 skin model type") === "Alex"
  Drawing.drawHead1(62, 63)
  Drawing.drawBody1(422, 84)
  if alexModel1 {
    Drawing.drawRightArm1Alex(186, 198)
    Drawing.drawLeftArm1Alex(48, 198)
  } else {
    Drawing.drawRightArm1(186, 198)
    Drawing.drawLeftArm1(48, 198)
  }
  Drawing.drawLegs1(279, 197)

  Drawing.drawHead2(62, 424)
  Drawing.drawBody2(422, 445)
  if alexModel2 {
    Drawing.drawRightArm2Alex(186, 198 + 361)
    Drawing.drawLeftArm2Alex(48, 198 + 361)
  } else {
    Drawing.drawRightArm2(186, 198 + 361)
    Drawing.drawLeftArm2(48, 198 + 361)
  }
  Drawing.drawLegs2(278, 559)
  Generator.drawImage("Overlay", (0, 0))
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
