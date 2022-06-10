let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "minecraft-bee-character"

let name = "Minecraft Bee Character"

let history = ["1 May 2022 PaperDoggy - Initial script developed."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [{id: "OverlayBee", url: requireImage("OverlayBee.png")}]

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
  let drawHead = (ox, oy, k, texture) => {
    Generator.drawTexture(texture, steve.base.head.front, (ox, oy, 56, 56), ())
    Generator.drawTexture(texture, steve.base.head.right, (ox - k * 8 - 1, oy, k * 8, 56), ())
    Generator.drawTexture(texture, steve.base.head.left, (ox + 57, oy, k * 8, 56), ())
    Generator.drawTexture(texture, steve.base.head.top, (ox, oy - k * 8 - 1, 56, k * 8), ())
    Generator.drawTexture(
      texture,
      steve.base.head.bottom,
      (ox, oy + 57, 56, k * 8),
      ~flip=#Vertical,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.head.front, (ox, oy, 56, 56), ())
    Generator.drawTexture(texture, steve.overlay.head.right, (ox - k * 8 - 1, oy, k * 8, 56), ())
    Generator.drawTexture(texture, steve.overlay.head.left, (ox + 57, oy, k * 8, 56), ())
    Generator.drawTexture(texture, steve.overlay.head.top, (ox, oy - k * 8 - 1, 56, k * 8), ())
    Generator.drawTexture(
      texture,
      steve.overlay.head.bottom,
      (ox, oy + 57, 56, k * 8),
      ~flip=#Vertical,
      (),
    )
  }

  let drawBody = (ox, oy, k, texture) => {
    Generator.drawTexture(
      texture,
      steve.base.body.front,
      (ox, oy + 57 + k * 8, 56, (10 - k) * 8),
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.right,
      (ox - 1 - k * 8, oy, 56, (10 - k) * 8),
      ~rotateLegacy=90.0,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.left,
      (ox + 57 + k * 8, oy + 56, 56, 8 * (10 - k)),
      ~rotateLegacy=-90.0,
      (),
    )
    Generator.drawTexture(texture, steve.base.body.bottom, (ox + 57 + 81, oy, 56, 56), ())
    Generator.drawTexture(
      texture,
      steve.base.body.back,
      (ox, oy - 81, 56, (10 - k) * 8),
      ~rotate=180.0,
      (),
    )

    Generator.drawTexture(
      texture,
      steve.overlay.body.front,
      (ox, oy + 57 + k * 8, 56, (10 - k) * 8),
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.right,
      (ox - 1 - k * 8, oy, 56, (10 - k) * 8),
      ~rotateLegacy=90.0,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.left,
      (ox + 57 + k * 8, oy + 56, 56, 8 * (10 - k)),
      ~rotateLegacy=-90.0,
      (),
    )
    Generator.drawTexture(texture, steve.base.body.bottom, (ox + 57 + 81, oy, 56, 56), ())
    Generator.drawTexture(
      texture,
      steve.overlay.body.back,
      (ox, oy - 81, 56, (10 - k) * 8),
      ~rotate=180.0,
      (),
    )
  }

  let drawRightArm = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.rightArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(
      texture,
      steve.base.rightArm.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )

    Generator.drawTexture(
      texture,
      steve.overlay.rightArm.front,
      (ox, oy, 8, 16),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.rightArm.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )
  }
  let drawLeftArm = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.leftArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(texture, steve.base.leftArm.back, (ox + 9, oy, 8, 16), ~pixelate=true, ())

    Generator.drawTexture(texture, steve.overlay.leftArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(
      texture,
      steve.overlay.leftArm.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )
  }
  let drawRightArmAlex = (ox, oy, texture) => {
    Generator.drawTexture(texture, alex.base.rightArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(texture, alex.base.rightArm.back, (ox + 9, oy, 8, 16), ~pixelate=true, ())

    Generator.drawTexture(texture, alex.overlay.rightArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(
      texture,
      alex.overlay.rightArm.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )
  }
  let drawLeftArmAlex = (ox, oy, texture) => {
    Generator.drawTexture(texture, alex.base.leftArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(texture, alex.base.leftArm.back, (ox + 9, oy, 8, 16), ~pixelate=true, ())

    Generator.drawTexture(texture, alex.overlay.leftArm.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(
      texture,
      alex.overlay.leftArm.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )
  }

  let drawRightLeg = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.rightLeg.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(
      texture,
      steve.base.rightLeg.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )

    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.front,
      (ox, oy, 8, 16),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )
  }
  let drawLeftLeg = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.rightLeg.front, (ox, oy, 8, 16), ~pixelate=true, ())
    Generator.drawTexture(
      texture,
      steve.base.rightLeg.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )

    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.front,
      (ox, oy, 8, 16),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.back,
      (ox + 9, oy, 8, 16),
      ~pixelate=true,
      (),
    )
  }
  let drawPlan = (ox, oy, k, texture) => {
    Generator.drawTexture(texture, steve.base.head.front, (ox, oy - 32, 32, 32), ())
    Generator.drawTexture(texture, steve.base.body.front, (ox, oy, 32, 48), ())
    Generator.drawTexture(texture, steve.base.rightLeg.front, (ox, oy + 48, 16, 48), ())
    Generator.drawTexture(texture, steve.base.leftLeg.front, (ox + 16, oy + 48, 16, 48), ())

    Generator.drawTexture(
      texture,
      steve.base.head.front,
      (ox - 36, oy + 131, 28, 28),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(texture, steve.base.head.left, (ox + 44, oy + 131, k * 4, 28), ())
    Generator.drawTexture(
      texture,
      steve.base.body.left,
      (ox + 44 + k * 4, oy + 131 + 28, 28, (10 - k) * 4),
      ~rotateLegacy=-90.0,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.body.back,
      (ox + 5, oy + 174, 28, (10 - k) * 4),
      ~rotate=-180.0,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.head.top,
      (ox + 5, oy + 174 + (10 - k) * 4, 28, k * 4),
      (),
    )

    Generator.drawTexture(
      texture,
      steve.base.rightLeg.front,
      (ox - 33, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.leftLeg.front,
      (ox - 14, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.head.front, (ox, oy - 32, 32, 32), ())
    Generator.drawTexture(texture, steve.overlay.body.front, (ox, oy, 32, 48), ())
    Generator.drawTexture(texture, steve.overlay.rightLeg.front, (ox, oy + 48, 16, 48), ())
    Generator.drawTexture(texture, steve.overlay.leftLeg.front, (ox + 16, oy + 48, 16, 48), ())

    Generator.drawTexture(
      texture,
      steve.overlay.head.front,
      (ox - 36, oy + 131, 28, 28),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(texture, steve.overlay.head.left, (ox + 44, oy + 131, k * 4, 28), ())
    Generator.drawTexture(
      texture,
      steve.overlay.body.left,
      (ox + 44 + k * 4, oy + 131 + 28, 28, (10 - k) * 4),
      ~rotateLegacy=-90.0,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.body.back,
      (ox + 5, oy + 174, 28, (10 - k) * 4),
      ~rotate=-180.0,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.head.top,
      (ox + 5, oy + 174 + (10 - k) * 4, 28, k * 4),
      (),
    )

    Generator.drawTexture(
      texture,
      steve.overlay.rightLeg.front,
      (ox - 33, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.leftLeg.front,
      (ox - 14, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
  }
  let drawPlanArms = (ox, oy, texture) => {
    Generator.drawTexture(texture, steve.base.rightArm.front, (ox - 16, oy, 16, 48), ())
    Generator.drawTexture(texture, steve.base.leftArm.front, (ox + 32, oy, 16, 48), ())
    Generator.drawTexture(
      texture,
      steve.base.rightArm.front,
      (ox - 27, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.base.leftArm.front,
      (ox - 20, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )

    Generator.drawTexture(texture, steve.overlay.rightArm.front, (ox - 16, oy, 16, 48), ())
    Generator.drawTexture(texture, steve.overlay.leftArm.front, (ox + 32, oy, 16, 48), ())
    Generator.drawTexture(
      texture,
      steve.overlay.rightArm.front,
      (ox - 27, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      steve.overlay.leftArm.front,
      (ox - 20, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
  }
  let drawPlanArmsAlex = (ox, oy, texture) => {
    Generator.drawTexture(texture, alex.base.rightArm.front, (ox - 16, oy, 16, 48), ())
    Generator.drawTexture(texture, alex.base.leftArm.front, (ox + 32, oy, 16, 48), ())
    Generator.drawTexture(
      texture,
      alex.base.rightArm.front,
      (ox - 27, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      alex.base.leftArm.front,
      (ox - 20, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )

    Generator.drawTexture(texture, alex.overlay.rightArm.front, (ox - 16, oy, 16, 48), ())
    Generator.drawTexture(texture, alex.overlay.leftArm.front, (ox + 32, oy, 16, 48), ())
    Generator.drawTexture(
      texture,
      alex.overlay.rightArm.front,
      (ox - 27, oy + 160, 3, 8),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      texture,
      alex.overlay.leftArm.front,
      (ox - 20, oy + 160, 3, 8),
      ~pixelate=true,
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
  Generator.defineRangeInput("Head size 1", {min: 0, max: 10, step: 1, value: 0})
  let headmultiplier1 = Generator.getRangeInputValue("Head size 1")

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
  Generator.defineRangeInput("Head size 2", {min: 0, max: 10, step: 1, value: 0})
  let headmultiplier2 = Generator.getRangeInputValue("Head size 2")

  Generator.drawImage("OverlayBee", (0, 0))
  let ox = 108
  let oy = 103
  Drawing.drawHead(ox, oy, headmultiplier1, "Skin1")
  Drawing.drawBody(ox, oy, headmultiplier1, "Skin1")
  if alexModel1 {
    Drawing.drawRightArmAlex(ox + 221, oy - 53, "Skin1")
    Drawing.drawLeftArmAlex(ox + 245, oy - 53, "Skin1")
  } else {
    Drawing.drawRightArm(ox + 221, oy - 53, "Skin1")
    Drawing.drawLeftArm(ox + 245, oy - 53, "Skin1")
  }
  Drawing.drawRightLeg(ox + 221, oy - 20, "Skin1")
  Drawing.drawLeftLeg(ox + 245, oy - 20, "Skin1")
  Drawing.drawRightLeg(ox + 221, oy + 12, "Skin1")
  Drawing.drawLeftLeg(ox + 245, oy + 12, "Skin1")
  Drawing.drawPlan(ox + 321, oy - 48, headmultiplier1, "Skin1")

  if alexModel1 {
    Drawing.drawPlanArmsAlex(ox + 321, oy - 48, "Skin1")
  } else {
    Drawing.drawPlanArms(ox + 321, oy - 48, "Skin1")
  }

  let ox = 108
  let oy = 416
  Drawing.drawHead(ox, oy, headmultiplier2, "Skin2")
  Drawing.drawBody(ox, oy, headmultiplier2, "Skin2")
  if alexModel2 {
    Drawing.drawRightArmAlex(ox + 221, oy - 53, "Skin2")
    Drawing.drawLeftArmAlex(ox + 245, oy - 53, "Skin2")
  } else {
    Drawing.drawRightArm(ox + 221, oy - 53, "Skin2")
    Drawing.drawLeftArm(ox + 245, oy - 53, "Skin2")
  }
  Drawing.drawRightLeg(ox + 221, oy - 20, "Skin2")
  Drawing.drawLeftLeg(ox + 245, oy - 20, "Skin2")
  Drawing.drawRightLeg(ox + 221, oy + 12, "Skin2")
  Drawing.drawLeftLeg(ox + 245, oy + 12, "Skin2")
  Drawing.drawPlan(ox + 321, oy - 48, headmultiplier2, "Skin2")

  if alexModel2 {
    Drawing.drawPlanArmsAlex(ox + 321, oy - 48, "Skin2")
  } else {
    Drawing.drawPlanArms(ox + 321, oy - 48, "Skin2")
  }
  Generator.drawImage("OverlayBee", (0, 0))
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
  history: history,
}
