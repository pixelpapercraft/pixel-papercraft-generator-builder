let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)

let id = "minecraft-allay-character"

let name = "Minecraft Allay Character"

let history = [
  "1 May 2022 PaperDoggy - Initial script developed.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]
let video: Generator.videoDef = {url: "https://www.youtube.com/embed/vG-mXWu0OlA?rel=0"}
let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [{id: "Overlay", url: requireImage("OverlayAllay.png")}]

let textures: array<Generator.textureDef> = MinecraftSkins.skins

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

module Drawing = {
  let drawHead = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.base.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.base.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.base.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.base.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      texture,
      steve.base.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(texture, steve.overlay.head.front, (ox, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.overlay.head.right, (ox - 51, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.overlay.head.left, (ox + 51, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.overlay.head.back, (ox + 51 * 2, oy, 50, 50), ())
    Generator.drawTexture(texture, steve.overlay.head.top, (ox, oy - 51, 50, 50), ())
    Generator.drawTexture(
      texture,
      steve.overlay.head.bottom,
      (ox, oy + 51, 50, 50),
      ~flip=#Vertical,
      (),
    )
  }

  let drawBody = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture(texture, steve.base.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture(texture, steve.base.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture(texture, steve.base.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture(texture, steve.base.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      texture,
      steve.base.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.body.front, (ox, oy, 30, 30), ())
    Generator.drawTexture(texture, steve.overlay.body.right, (ox - 21, oy, 20, 30), ())
    Generator.drawTexture(texture, steve.overlay.body.left, (ox + 31, oy, 20, 30), ())
    Generator.drawTexture(texture, steve.overlay.body.back, (ox + 31 + 21, oy, 30, 30), ())
    Generator.drawTexture(texture, steve.overlay.body.top, (ox, oy - 21, 30, 20), ())

    Generator.drawTexture(
      texture,
      steve.overlay.body.front,
      (ox - 21 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.right,
      (ox - 21 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.left,
      (ox - 21 - 21 - 31 - 21, oy, 20, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.back,
      (ox - 21 - 21 - 31 - 21 - 31, oy, 30, 30),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.top,
      (ox - 21 - 21 - 31, oy - 21, 30, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawRightArm = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.base.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.base.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.base.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.base.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      steve.base.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.overlay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.overlay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.overlay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.overlay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      steve.overlay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArm = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.base.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.base.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.base.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.base.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      steve.base.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.overlay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.overlay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, steve.overlay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture(texture, steve.overlay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      steve.overlay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawRightArmAlex = (ox, oy, texture) => {
    Generator.drawTexture(texture, alex.base.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.base.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.base.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.base.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.base.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      alex.base.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, alex.overlay.rightArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.overlay.rightArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.overlay.rightArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.overlay.rightArm.back, (ox - 11 - 21, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.overlay.rightArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      alex.overlay.rightArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArmAlex = (ox, oy, texture) => {
    Generator.drawTexture(texture, alex.base.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.base.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.base.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.base.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.base.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      alex.base.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, alex.overlay.leftArm.front, (ox, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.overlay.leftArm.right, (ox - 21, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.overlay.leftArm.left, (ox + 11, oy, 20, 40), ())
    Generator.drawTexture(texture, alex.overlay.leftArm.back, (ox + 11 + 21, oy, 10, 40), ())
    Generator.drawTexture(texture, alex.overlay.leftArm.top, (ox, oy - 21, 10, 20), ())
    Generator.drawTexture(
      texture,
      alex.overlay.leftArm.bottom,
      (ox, oy + 41, 10, 20),
      ~flip=#Horizontal,
      (),
    )
  }

  let drawLegs = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture(texture, steve.base.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture(texture, steve.base.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture(texture, steve.base.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      texture,
      steve.base.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, steve.base.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture(texture, steve.base.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      texture,
      steve.base.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(texture, steve.base.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture(texture, steve.base.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture(texture, steve.base.leftLeg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      texture,
      steve.base.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      texture,
      steve.base.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.body.front, (ox, oy, 30, 25), ())
    Generator.drawTexture(texture, steve.overlay.body.right, (ox - 21, oy, 20, 25), ())
    Generator.drawTexture(texture, steve.overlay.body.left, (ox + 31, oy, 20, 25), ())
    Generator.drawTexture(texture, steve.overlay.body.back, (ox + 31 + 21, oy, 30, 25), ())

    Generator.drawTexture(
      texture,
      steve.overlay.body.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.left,
      (ox + 31 + 31 + 21 + 31, oy, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.back,
      (ox + 31 + 21 + 31, oy, 30, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.rightLeg.front, (ox, oy + 25, 15, 25), ())
    Generator.drawTexture(texture, steve.overlay.rightLeg.right, (ox - 21, oy + 25, 20, 25), ())
    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.back,
      (ox + 31 + 21 + 15, oy + 25, 15, 25),
      (),
    )

    Generator.drawTexture(texture, steve.overlay.leftLeg.front, (ox + 15, oy + 25, 15, 25), ())
    Generator.drawTexture(texture, steve.overlay.leftLeg.left, (ox + 31, oy + 25, 20, 25), ())
    Generator.drawTexture(texture, steve.overlay.leftLeg.back, (ox + 31 + 21, oy + 25, 15, 25), ())

    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.right,
      (ox + 31 + 21 + 31 + 31 + 21 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.back,
      (ox + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )

    Generator.drawTexture(
      texture,
      steve.overlay.leftLeg.front,
      (ox + 31 + 21 + 31 + 21 + 31, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.leftLeg.left,
      (ox + 31 + 21 + 31 + 31, oy + 25, 20, 25),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.leftLeg.back,
      (ox + 31 + 21 + 31 + 15, oy + 25, 15, 25),
      ~flip=#Horizontal,
      (),
    )
  }
}
let script = () => {
  // Inputs
  Generator.defineSkinInput(
    "Skin 1",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )
  Generator.defineSelectInput("Skin 1 Model", ["Steve", "Alex"])
  let alexModel1 = Generator.getSelectInputValue("Skin 1 Model") === "Alex"
  Generator.defineSkinInput(
    "Skin 2",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )
  Generator.defineSelectInput("Skin 2 Model", ["Steve", "Alex"])
  let alexModel2 = Generator.getSelectInputValue("Skin 2 Model") === "Alex"
  Drawing.drawHead(62, 63, "Skin 1")
  Drawing.drawBody(422, 84, "Skin 1")
  if alexModel1 {
    Drawing.drawRightArmAlex(186, 198, "Skin 1")
    Drawing.drawLeftArmAlex(48, 198, "Skin 1")
  } else {
    Drawing.drawRightArm(186, 198, "Skin 1")
    Drawing.drawLeftArm(48, 198, "Skin 1")
  }
  Drawing.drawLegs(279, 197, "Skin 1")

  Drawing.drawHead(62, 424, "Skin 2")
  Drawing.drawBody(422, 445, "Skin 2")
  if alexModel2 {
    Drawing.drawRightArmAlex(186, 198 + 361, "Skin 2")
    Drawing.drawLeftArmAlex(48, 198 + 361, "Skin 2")
  } else {
    Drawing.drawRightArm(186, 198 + 361, "Skin 2")
    Drawing.drawLeftArm(48, 198 + 361, "Skin 2")
  }
  Drawing.drawLegs(278, 559, "Skin 2")
  Generator.drawImage("Overlay", (0, 0))
}

let generator: Generator.generatorDef = {
  id,
  name,
  thumbnail: Some(thumbnail),
  video: Some(video),
  instructions: None,
  images,
  textures,
  script,
  history,
}
