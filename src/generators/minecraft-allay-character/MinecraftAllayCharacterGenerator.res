let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "minecraft-allay-character"

let name = "Minecraft Allay Character"

let history = ["1 May 2022 PaperDoggy - Initial script developed."]

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

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

module Drawing = {
  let drawHead1 = (ox, oy) => {
    Generator.drawTexture("Skin1", steve.base.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.base.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.base.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.base.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.base.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin1",
      steve.base.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture("Skin1", steve.overlay.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.overlay.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.overlay.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.overlay.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin1", steve.overlay.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin1",
      steve.overlay.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
  }

  let drawBody1 = (ox, oy) => {
    Generator.drawTexture("Skin1", steve.base.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin1", steve.base.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin1", steve.base.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture("Skin1", steve.base.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture("Skin1", steve.base.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin1",
      steve.base.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", steve.overlay.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin1", steve.overlay.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin1", steve.overlay.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture("Skin1", steve.overlay.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture("Skin1", steve.overlay.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawRightArm1 = (ox, oy) => {
    Generator.drawTexture("Skin1", steve.base.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.base.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.base.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.base.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.base.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      steve.base.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", steve.overlay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      steve.overlay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm1 = (ox, oy) => {
    Generator.drawTexture("Skin1", steve.base.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.base.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.base.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.base.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.base.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      steve.base.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", steve.overlay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", steve.overlay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      steve.overlay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawRightArm1Alex = (ox, oy) => {
    Generator.drawTexture("Skin1", alex.base.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.base.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.base.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.base.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.base.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      alex.base.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", alex.overlay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      alex.overlay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm1Alex = (ox, oy) => {
    Generator.drawTexture("Skin1", alex.base.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.base.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.base.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.base.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.base.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      alex.base.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", alex.overlay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", alex.overlay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      alex.overlay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawLegs1 = (ox, oy) => {
    Generator.drawTexture("Skin1", steve.base.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin1", steve.base.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin1", steve.base.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture("Skin1", steve.base.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      "Skin1",
      steve.base.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", steve.base.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", steve.base.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      steve.base.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin1", steve.base.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", steve.base.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture("Skin1", steve.base.leftLeg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      "Skin1",
      steve.base.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      steve.base.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.base.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", steve.overlay.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin1", steve.overlay.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin1", steve.overlay.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture("Skin1", steve.overlay.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", steve.overlay.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", steve.overlay.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      steve.overlay.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin1", steve.overlay.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", steve.overlay.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture("Skin1", steve.overlay.leftLeg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      "Skin1",
      steve.overlay.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      steve.overlay.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      steve.overlay.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawHead2 = (ox, oy) => {
    Generator.drawTexture("Skin2", steve.base.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.base.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.base.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.base.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.base.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin2",
      steve.base.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture("Skin2", steve.overlay.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.overlay.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.overlay.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.overlay.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin2", steve.overlay.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin2",
      steve.overlay.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
  }

  let drawBody2 = (ox, oy) => {
    Generator.drawTexture("Skin2", steve.base.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin2", steve.base.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin2", steve.base.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture("Skin2", steve.base.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture("Skin2", steve.base.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin2",
      steve.base.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", steve.overlay.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin2", steve.overlay.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin2", steve.overlay.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture("Skin2", steve.overlay.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture("Skin1", steve.overlay.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawRightArm2 = (ox, oy) => {
    Generator.drawTexture("Skin2", steve.base.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.base.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.base.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.base.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.base.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      steve.base.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", steve.overlay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      steve.overlay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm2 = (ox, oy) => {
    Generator.drawTexture("Skin2", steve.base.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.base.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.base.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.base.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.base.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      steve.base.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", steve.overlay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", steve.overlay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      steve.overlay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawRightArm2Alex = (ox, oy) => {
    Generator.drawTexture("Skin2", alex.base.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.base.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.base.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.base.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.base.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      alex.base.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", alex.overlay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      alex.overlay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm2Alex = (ox, oy) => {
    Generator.drawTexture("Skin2", alex.base.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.base.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.base.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.base.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.base.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      alex.base.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", alex.overlay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", alex.overlay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      alex.overlay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawLegs2 = (ox, oy) => {
    Generator.drawTexture("Skin2", steve.base.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin2", steve.base.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin2", steve.base.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture("Skin2", steve.base.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      "Skin2",
      steve.base.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", steve.base.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", steve.base.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      steve.base.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin2", steve.base.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", steve.base.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture("Skin2", steve.base.leftLeg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      "Skin2",
      steve.base.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      steve.base.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.base.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", steve.overlay.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin2", steve.overlay.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin2", steve.overlay.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture("Skin2", steve.overlay.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", steve.overlay.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", steve.overlay.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      steve.overlay.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin2", steve.overlay.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", steve.overlay.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture("Skin2", steve.overlay.leftLeg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      "Skin2",
      steve.overlay.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      steve.overlay.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      steve.overlay.leftLeg.back,
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
  history: history,
}
