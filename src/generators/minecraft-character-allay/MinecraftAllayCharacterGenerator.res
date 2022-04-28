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
    topoverlay: Builder.rectangle,
    bottomoverlay: Builder.rectangle,
    frontoverlay: Builder.rectangle,
    rightoverlay: Builder.rectangle,
    leftoverlay: Builder.rectangle,
    backoverlay: Builder.rectangle,
  }

  type t = {
    head: cuboid,
    body: cuboid,
    rleg: cuboid,
    lleg: cuboid,
    rarm: cuboid,
    larm: cuboid,
    rarmAlex: cuboid,
    larmAlex: cuboid,
  }

  let allay: t = {
    head: {
      top: (8, 0, 8, 8),
      bottom: (16, 0, 8, 8),
      front: (8, 8, 8, 8),
      right: (0, 8, 8, 8),
      left: (16, 8, 8, 8),
      back: (24, 8, 8, 8),
      topoverlay: (8 + 32, 0, 8, 8),
      bottomoverlay: (16 + 32, 0, 8, 8),
      frontoverlay: (8 + 32, 8, 8, 8),
      rightoverlay: (0 + 32, 8, 8, 8),
      leftoverlay: (16 + 32, 8, 8, 8),
      backoverlay: (24 + 32, 8, 8, 8),
    },
    body: {
      top: (20, 16, 8, 4),
      bottom: (28, 16, 8, 4),
      front: (20, 20, 8, 12),
      right: (16, 20, 4, 12),
      left: (28, 20, 4, 12),
      back: (32, 20, 8, 12),
      topoverlay: (20, 16 + 16, 8, 4),
      bottomoverlay: (28, 16 + 16, 8, 4),
      frontoverlay: (20, 20 + 16, 8, 12),
      rightoverlay: (16, 20 + 16, 4, 12),
      leftoverlay: (28, 20 + 16, 4, 12),
      backoverlay: (32, 20 + 16, 8, 12),
    },
    rleg: {
      top: (4, 16, 4, 4),
      bottom: (8, 16, 4, 4),
      front: (4, 20, 4, 12),
      right: (0, 20, 4, 12),
      left: (8, 20, 4, 12),
      back: (12, 20, 4, 12),
      topoverlay: (4, 16 + 16, 4, 4),
      bottomoverlay: (8, 16 + 16, 4, 4),
      frontoverlay: (4, 20 + 16, 4, 12),
      rightoverlay: (0, 20 + 16, 4, 12),
      leftoverlay: (8, 20 + 16, 4, 12),
      backoverlay: (12, 20 + 16, 4, 12),
    },
    lleg: {
      top: (20, 48, 4, 4),
      bottom: (24, 48, 4, 4),
      front: (20, 52, 4, 12),
      right: (16, 52, 4, 12),
      left: (24, 52, 4, 12),
      back: (28, 52, 4, 12),
      topoverlay: (20 - 16, 48, 4, 4),
      bottomoverlay: (24 - 16, 48, 4, 4),
      frontoverlay: (20 - 16, 52, 4, 12),
      rightoverlay: (16 - 16, 52, 4, 12),
      leftoverlay: (24 - 16, 52, 4, 12),
      backoverlay: (28 - 16, 52, 4, 12),
    },
    rarm: {
      top: (44, 16, 4, 4),
      bottom: (48, 16, 4, 4),
      front: (44, 20, 4, 12),
      right: (40, 20, 4, 12),
      left: (48, 20, 4, 12),
      back: (52, 20, 4, 12),
      topoverlay: (44, 16 + 16, 4, 4),
      bottomoverlay: (48, 16 + 16, 4, 4),
      frontoverlay: (44, 20 + 16, 4, 12),
      rightoverlay: (40, 20 + 16, 4, 12),
      leftoverlay: (48, 20 + 16, 4, 12),
      backoverlay: (52, 20 + 16, 4, 12),
    },
    larm: {
      top: (44, 16, 4, 4),
      bottom: (48, 16, 4, 4),
      front: (44, 20, 4, 12),
      right: (40, 20, 4, 12),
      left: (48, 20, 4, 12),
      back: (52, 20, 4, 12),
      topoverlay: (44 + 16, 16, 4, 4),
      bottomoverlay: (48 + 16, 16, 4, 4),
      frontoverlay: (44 + 16, 20, 4, 12),
      rightoverlay: (40 + 16, 20, 4, 12),
      leftoverlay: (48 + 16, 20, 4, 12),
      backoverlay: (52 + 16, 20, 4, 12),
    },
    rarmAlex: {
      top: (44, 16, 3, 4),
      bottom: (48 - 1, 16, 3, 4),
      front: (44, 20, 3, 12),
      right: (40, 20, 4, 12),
      left: (48 - 1, 20, 4, 12),
      back: (52 - 1, 20, 3, 12),
      topoverlay: (44, 16 + 16, 3, 4),
      bottomoverlay: (48 - 1, 16 + 16, 3, 4),
      frontoverlay: (44, 20 + 16, 3, 12),
      rightoverlay: (40, 20 + 16, 4, 12),
      leftoverlay: (48 - 1, 20 + 16, 4, 12),
      backoverlay: (52 - 1, 20 + 16, 3, 12),
    },
    larmAlex: {
      top: (44, 16, 3, 4),
      bottom: (48 - 1, 16, 3, 4),
      front: (44, 20, 3, 12),
      right: (40, 20, 4, 12),
      left: (48 - 1, 20, 4, 12),
      back: (52 - 1, 20, 3, 12),
      topoverlay: (44 + 16 - 2, 16, 3, 4),
      bottomoverlay: (48 + 16 - 3, 16, 3, 4),
      frontoverlay: (44 + 16 - 2, 20, 3, 12),
      rightoverlay: (40 + 16 - 2, 20, 4, 12),
      leftoverlay: (48 + 16 - 3, 20, 4, 12),
      backoverlay: (52 + 16 - 3, 20, 3, 12),
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
    Generator.drawTexture("Skin1", TextureMap.allay.head.frontoverlay, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.rightoverlay, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.leftoverlay, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.backoverlay, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin1", TextureMap.allay.head.topoverlay, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.head.bottomoverlay,
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

    Generator.drawTexture("Skin1", TextureMap.allay.body.frontoverlay, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.rightoverlay, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.leftoverlay, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backoverlay,
      (ox + 31 + 21, oy, 30, 30),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.body.topoverlay, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.frontoverlay,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.rightoverlay,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.leftoverlay,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backoverlay,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.topoverlay,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawrarm1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.rarm.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.rightoverlay, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarm.backoverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.rarm.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarm.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawlarm1 = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.larm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.larm.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larm.rightoverlay, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larm.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larm.backoverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.larm.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larm.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawrarm1Alex = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarmAlex.rightoverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarmAlex.backoverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.rarmAlex.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rarmAlex.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawlarm1Alex = (ox, oy) => {
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larmAlex.rightoverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larmAlex.backoverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.larmAlex.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.larmAlex.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawlegs1 = (ox, oy) => {
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

    Generator.drawTexture("Skin1", TextureMap.allay.rleg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.rleg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.lleg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.lleg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.lleg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.body.frontoverlay, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.rightoverlay, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin1", TextureMap.allay.body.leftoverlay, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backoverlay,
      (ox + 31 + 21, oy, 30, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.frontoverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.rightoverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.leftoverlay,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.body.backoverlay,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin1", TextureMap.allay.rleg.frontoverlay, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.rightoverlay,
      (ox - 21, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.backoverlay,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.frontoverlay,
      (ox + 15, oy + 25, 15, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.leftoverlay,
      (ox + 31, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.backoverlay,
      (ox + 31 + 21, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.frontoverlay,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.rightoverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.rleg.backoverlay,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.frontoverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.leftoverlay,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin1",
      TextureMap.allay.lleg.backoverlay,
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
    Generator.drawTexture("Skin2", TextureMap.allay.head.frontoverlay, (ox, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.rightoverlay, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.leftoverlay, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.backoverlay, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture("Skin2", TextureMap.allay.head.topoverlay, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.head.bottomoverlay,
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

    Generator.drawTexture("Skin2", TextureMap.allay.body.frontoverlay, (ox, oy, 30, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.rightoverlay, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.leftoverlay, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backoverlay,
      (ox + 31 + 21, oy, 30, 30),
      (),
    )
    Generator.drawTexture("Skin1", TextureMap.allay.body.topoverlay, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.frontoverlay,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.rightoverlay,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.leftoverlay,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backoverlay,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.topoverlay,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawrarm2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.rarm.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.rightoverlay, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarm.backoverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.rarm.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarm.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawlarm2 = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.larm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.larm.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larm.rightoverlay, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larm.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larm.backoverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.larm.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larm.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawrarm2Alex = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarmAlex.rightoverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarmAlex.backoverlay,
      (ox - 11 - 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.rarmAlex.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rarmAlex.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawlarm2Alex = (ox, oy) => {
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.front, (ox, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larmAlex.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.frontoverlay, (ox, oy, 10, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larmAlex.rightoverlay,
      (ox - 21, oy, 20, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.leftoverlay, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larmAlex.backoverlay,
      (ox + 11 + 21, oy, 10, 40),
      (),
    )
    Generator.drawTexture("Skin2", TextureMap.allay.larmAlex.topoverlay, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.larmAlex.bottomoverlay,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawlegs2 = (ox, oy) => {
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

    Generator.drawTexture("Skin2", TextureMap.allay.rleg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.rleg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.lleg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.lleg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.lleg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.body.frontoverlay, (ox, oy, 30, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.rightoverlay, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture("Skin2", TextureMap.allay.body.leftoverlay, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backoverlay,
      (ox + 31 + 21, oy, 30, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.frontoverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.rightoverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.leftoverlay,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.body.backoverlay,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture("Skin2", TextureMap.allay.rleg.frontoverlay, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.rightoverlay,
      (ox - 21, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.backoverlay,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.frontoverlay,
      (ox + 15, oy + 25, 15, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.leftoverlay,
      (ox + 31, oy + 25, 20, 25),
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.backoverlay,
      (ox + 31 + 21, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.frontoverlay,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.rightoverlay,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.rleg.backoverlay,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.frontoverlay,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.leftoverlay,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      "Skin2",
      TextureMap.allay.lleg.backoverlay,
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
    Drawing.drawrarm1Alex(186, 198)
    Drawing.drawlarm1Alex(48, 198)
  } else {
    Drawing.drawrarm1(186, 198)
    Drawing.drawlarm1(48, 198)
  }
  Drawing.drawlegs1(279, 197)

  Drawing.drawHead2(62, 424)
  Drawing.drawBody2(422, 445)
  if alexModel2 {
    Drawing.drawrarm2Alex(186, 198 + 361)
    Drawing.drawlarm2Alex(48, 198 + 361)
  } else {
    Drawing.drawrarm2(186, 198 + 361)
    Drawing.drawlarm2(48, 198 + 361)
  }
  Drawing.drawlegs2(278, 559)
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
