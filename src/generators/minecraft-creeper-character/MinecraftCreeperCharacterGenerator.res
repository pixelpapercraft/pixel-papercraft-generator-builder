let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-creeper-character"

let name = "Minecraft Creeper Character"

let history = [
  "Created by CanadaCraft, template by BrickyBoy99.",
  "13 Sep 2020 NinjolasNJM - Updated to work with 1.8+ Skins.",
  "17 Jul 2021 M16 - Updated generator photo.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = [
  "Background",
  "Tabs",
  "Folds",
  "Labels",
  "Action-Figure",
  "Action-Figure-Folds",
  "Action-Figure-Labels",
]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = MinecraftSkins.skins

let steve = TextureMap.MinecraftCharacter.steve

let script = () => {
  // Inputs
  Generator.defineSkinInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Action Figure", false)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let actionFigure = Generator.getBooleanInputValue("Action Figure")

  // Overlay Region variables
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideFrontRightPant = Generator.getBooleanInputValue("Hide Front Right Pant")
  let hideFrontLeftPant = Generator.getBooleanInputValue("Hide Front Left Pant")
  let hideBackRightPant = Generator.getBooleanInputValue("Hide Back Right Pant")
  let hideBackLeftPant = Generator.getBooleanInputValue("Hide Back Left Pant")

  Generator.defineRegionInput((164, 110, 260, 196), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((196, 340, 196, 196), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((62, 471, 134, 116), () => {
    Generator.setBooleanInputValue("Hide Front Right Pant", !hideFrontRightPant)
  })
  Generator.defineRegionInput((121, 589, 134, 116), () => {
    Generator.setBooleanInputValue("Hide Front Left Pant", !hideFrontLeftPant)
  })
  Generator.defineRegionInput((419, 471, 134, 116), () => {
    Generator.setBooleanInputValue("Hide Back Right Pant", !hideBackRightPant)
  })
  Generator.defineRegionInput((367, 589, 134, 116), () => {
    Generator.setBooleanInputValue("Hide Back Left Pant", !hideBackLeftPant)
  })

  // Background
  Generator.drawImage("Background", (0, 0))
  Generator.drawImage("Tabs", (0, 0))

  // Head
  let ox = 164
  let oy = 110
  Generator.drawTexture("Skin", steve.base.head.right, (0 + ox, 64 + oy, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.front, (64 + ox, 64 + oy, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.left, (128 + ox, 64 + oy, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.back, (192 + ox, 64 + oy, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.top, (64 + ox, 0 + oy, 64, 64), ())
  Generator.drawTexture(
    "Skin",
    steve.base.head.bottom,
    (64 + ox, 128 + oy, 64, 64),
    ~flip=#Vertical,
    (),
  )

  // Body
  let ox = 196
  let oy = 340
  Generator.drawTexture("Skin", steve.base.body.right, (0 + ox, 32 + oy, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.body.front, (32 + ox, 32 + oy, 64, 96), ())
  Generator.drawTexture("Skin", steve.base.body.left, (96 + ox, 32 + oy, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.body.back, (128 + ox, 32 + oy, 64, 96), ())
  Generator.drawTexture("Skin", steve.base.body.top, (32 + ox, oy, 64, 32), ())
  Generator.drawTexture(
    "Skin",
    steve.base.body.bottom,
    (80 + ox, 144 + oy, 64, 32),
    ~flip=#Vertical,
    ~rotate=90.0,
    (),
  )

  // Front Right Foot
  let ox = 62
  let oy = 471
  Generator.drawTexture("Skin", steve.base.rightLeg.back, (0 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.right, (32 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.front, (64 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.left, (96 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.top, (64 + ox, 0 + oy, 32, 32), ())
  Generator.drawTexture(
    "Skin",
    steve.base.rightLeg.bottom,
    (64 + ox, 80 + oy, 32, 32),
    ~flip=#Vertical,
    (),
  )

  // Front Left Foot
  let ox = 121
  let oy = 589
  Generator.drawTexture("Skin", steve.base.leftLeg.back, (0 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.right, (32 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.front, (64 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.left, (96 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.top, (64 + ox, 0 + oy, 32, 32), ())
  Generator.drawTexture(
    "Skin",
    steve.base.leftLeg.bottom,
    (64 + ox, 80 + oy, 32, 32),
    ~flip=#Vertical,
    (),
  )

  // Back Right Foot
  let ox = 419
  let oy = 471
  Generator.drawTexture("Skin", steve.base.rightLeg.right, (64 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.front, (96 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.left, (0 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.back, (32 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.top, (32 + ox, oy, 32, 32), ~rotate=180.0, ())
  Generator.drawTexture(
    "Skin",
    steve.base.rightLeg.bottom,
    (32 + ox, 80 + oy, 32, 32),
    ~flip=#Vertical,
    ~rotate=180.0,
    (),
  )

  // Back Left Foot
  let ox = 367
  let oy = 589
  Generator.drawTexture("Skin", steve.base.leftLeg.right, (64 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.front, (96 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.left, (0 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.back, (32 + ox, 32 + oy, 32, 48), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.top, (32 + ox, oy, 32, 32), ~rotate=180.0, ())
  Generator.drawTexture(
    "Skin",
    steve.base.leftLeg.bottom,
    (32 + ox, 80 + oy, 32, 32),
    ~flip=#Vertical,
    ~rotate=180.0,
    (),
  )

  // Overlays
  if !hideHelmet {
    // Helmet
    let ox = 164
    let oy = 110
    Generator.drawTexture("Skin", steve.overlay.head.right, (0 + ox, 64 + oy, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.front, (64 + ox, 64 + oy, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.left, (128 + ox, 64 + oy, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.back, (192 + ox, 64 + oy, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.top, (64 + ox, 0 + oy, 64, 64), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.head.bottom,
      (64 + ox, 128 + oy, 64, 64),
      ~flip=#Vertical,
      (),
    )
  }

  if !hideJacket {
    // Jacket
    let ox = 196
    let oy = 340
    Generator.drawTexture("Skin", steve.overlay.body.right, (0 + ox, 32 + oy, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.front, (32 + ox, 32 + oy, 64, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.left, (96 + ox, 32 + oy, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.back, (128 + ox, 32 + oy, 64, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.top, (32 + ox, oy, 64, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.body.bottom,
      (80 + ox, 144 + oy, 64, 32),
      ~flip=#Vertical,
      ~rotate=90.0,
      (),
    )
  }

  if !hideFrontRightPant {
    // Front Right Pant
    let ox = 62
    let oy = 471
    Generator.drawTexture("Skin", steve.overlay.rightLeg.back, (0 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.right, (32 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.front, (64 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.left, (96 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.top, (64 + ox, 0 + oy, 32, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.rightLeg.bottom,
      (64 + ox, 80 + oy, 32, 32),
      ~flip=#Vertical,
      (),
    )
  }

  if !hideFrontLeftPant {
    // Front Left Pant
    let ox = 121
    let oy = 589
    Generator.drawTexture("Skin", steve.overlay.leftLeg.back, (0 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.right, (32 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.front, (64 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.left, (96 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.top, (64 + ox, 0 + oy, 32, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.leftLeg.bottom,
      (64 + ox, 80 + oy, 32, 32),
      ~flip=#Vertical,
      (),
    )
  }

  if !hideBackRightPant {
    // Back Right Pant
    let ox = 419
    let oy = 471
    Generator.drawTexture("Skin", steve.overlay.rightLeg.right, (64 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.front, (96 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.left, (0 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.back, (32 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.rightLeg.top,
      (32 + ox, oy, 32, 32),
      ~rotate=180.0,
      (),
    )
    Generator.drawTexture(
      "Skin",
      steve.overlay.rightLeg.bottom,
      (32 + ox, 80 + oy, 32, 32),
      ~flip=#Vertical,
      ~rotate=180.0,
      (),
    )
  }

  if !hideBackLeftPant {
    // Back Left Pant
    let ox = 367
    let oy = 589
    Generator.drawTexture("Skin", steve.overlay.leftLeg.left, (64 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.front, (96 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.right, (0 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.back, (32 + ox, 32 + oy, 32, 48), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.leftLeg.top,
      (32 + ox, oy, 32, 32),
      ~rotate=180.0,
      (),
    )
    Generator.drawTexture(
      "Skin",
      steve.overlay.leftLeg.bottom,
      (32 + ox, 80 + oy, 32, 32),
      ~flip=#Vertical,
      ~rotate=180.0,
      (),
    )
  }

  // Action Figure
  if actionFigure {
    //Neck
    Generator.drawTexture("Skin", steve.base.head.bottom, (44, 254, 64, 96), ())

    // Neck Overlay
    if !hideHelmet {
      Generator.drawTexture("Skin", steve.overlay.head.bottom, (44, 254, 64, 96), ())
    }

    // Foreground
    Generator.drawImage("Action-Figure", (0, 0))

    // Folds
    if showFolds {
      Generator.drawImage("Action-Figure-Folds", (0, 0))
    }

    // Labels
    if showLabels {
      Generator.drawImage("Action-Figure-Labels", (0, 0))
    }
  }

  // Folds
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }

  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images,
  textures,
  script,
}
