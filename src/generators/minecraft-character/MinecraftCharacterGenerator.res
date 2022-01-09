let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character"

let name = "Minecraft Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let instructions: Generator.instructionsDef = {
  open Generator.Markup
  <div>
    <H2> {"How to use the Minecraft Character Generator?"->React.string} </H2>
    <OL>
      <LI> {"Choose the your texture file model type"->React.string} </LI>
      <LI> {"Select your Minecraft skin file"->React.string} </LI>
      <LI> {"Download and print your character papercraft"->React.string} </LI>
    </OL>
  </div>
}

let imageIds = ["Background-Alex", "Background-Steve", "Folds-Alex", "Folds-Steve", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

let script = () => {
  // Inputs
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  Generator.defineText(
    "Click in the papercraft template to turn on and off the overlay for each part.",
  )

  // Draw
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")

  Generator.defineRegionInput((72, 24, 264, 198), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((266, 198, 198, 166), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((382, 372, 134, 166), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((99, 372, 134, 166), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((383, 584, 134, 166), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((99, 584, 134, 166), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  // Background
  if alexModel {
    Generator.drawImage("Background-Alex", (0, 0))
  } else {
    Generator.drawImage("Background-Steve", (0, 0))
  }

  // Head
  let ox = 74
  let oy = 25
  Generator.drawTexture("Skin", steve.base.head.right, (ox, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.front, (ox + 64, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.left, (ox + 128, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.back, (ox + 192, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.top, (ox + 64, oy, 64, 64), ())
  Generator.drawTexture(
    "Skin",
    steve.base.head.bottom,
    (ox + 64, oy + 128, 64, 64),
    ~flip=#Vertical,
    (),
  )

  // Torso
  let ox = 268
  let oy = 201
  Generator.drawTexture("Skin", steve.base.body.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.body.front, (ox + 32, oy + 32, 64, 96), ())
  Generator.drawTexture("Skin", steve.base.body.left, (ox + 96, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.body.back, (ox + 128, oy + 32, 64, 96), ())
  Generator.drawTexture("Skin", steve.base.body.top, (ox + 32, oy, 64, 32), ()) // Top
  Generator.drawTexture(
    "Skin",
    steve.base.body.bottom,
    (ox + 32, oy + 128, 64, 32),
    ~flip=#Vertical,
    (),
  )

  // Arms
  if alexModel {
    // Right Arm
    let ox = 107
    let oy = 373
    Generator.drawTexture("Skin", alex.base.rightArm.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", alex.base.rightArm.front, (ox + 32, oy + 32, 24, 96), ())
    Generator.drawTexture("Skin", alex.base.rightArm.left, (ox + 56, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", alex.base.rightArm.back, (ox + 88, oy + 32, 24, 96), ())
    Generator.drawTexture("Skin", alex.base.rightArm.top, (ox + 32, oy, 24, 32), ())
    Generator.drawTexture(
      "Skin",
      alex.base.rightArm.bottom,
      (ox + 32, oy + 128, 24, 32),
      ~flip=#Vertical,
      (),
    )

    // Left Arm
    let ox = 415
    let oy = 373
    Generator.drawTexture("Skin", alex.base.leftArm.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", alex.base.leftArm.front, (ox + 32, oy + 32, 24, 96), ())
    Generator.drawTexture("Skin", alex.base.leftArm.left, (ox + 56, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", alex.base.leftArm.back, (ox - 24, oy + 32, 24, 96), ())
    Generator.drawTexture("Skin", alex.base.leftArm.top, (ox + 32, oy, 24, 32), ())
    Generator.drawTexture(
      "Skin",
      alex.base.leftArm.bottom,
      (ox + 32, oy + 128, 24, 32),
      ~flip=#Vertical,
      (),
    )
  } else {
    // Right Arm
    let ox = 99
    let oy = 373
    Generator.drawTexture("Skin", steve.base.rightArm.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.rightArm.front, (ox + 32, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.rightArm.left, (ox + 64, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.rightArm.back, (ox + 96, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.rightArm.top, (ox + 32, oy, 32, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.base.rightArm.bottom,
      (ox + 32, oy + 128, 32, 32),
      ~flip=#Vertical,
      (),
    )

    // Left Arm
    let ox = 415
    let oy = 373
    Generator.drawTexture("Skin", steve.base.leftArm.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.leftArm.front, (ox + 32, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.leftArm.left, (ox + 64, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.leftArm.back, (ox - 32, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.base.leftArm.top, (ox + 32, oy, 32, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.base.leftArm.bottom,
      (ox + 32, oy + 128, 32, 32),
      ~flip=#Vertical,
      (),
    )
  }

  // Right Leg
  let ox = 99
  let oy = 587
  Generator.drawTexture("Skin", steve.base.rightLeg.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.front, (ox + 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.left, (ox + 64, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.back, (ox + 96, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.rightLeg.top, (ox + 32, oy, 32, 32), ())
  Generator.drawTexture(
    "Skin",
    steve.base.rightLeg.bottom,
    (ox + 32, oy + 128, 32, 32),
    ~flip=#Vertical,
    (),
  )

  // Left Leg
  let ox = 415
  let oy = 587
  Generator.drawTexture("Skin", steve.base.leftLeg.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.front, (ox + 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.left, (ox + 64, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.back, (ox - 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", steve.base.leftLeg.top, (ox + 32, oy, 32, 32), ())
  Generator.drawTexture(
    "Skin",
    steve.base.leftLeg.bottom,
    (ox + 32, oy + 128, 32, 32),
    ~flip=#Vertical,
    (),
  )

  // Overlays
  if !hideHelmet {
    // Head2
    let ox = 74
    let oy = 25
    Generator.drawTexture("Skin", steve.overlay.head.right, (ox, oy + 64, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.front, (ox + 64, oy + 64, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.left, (ox + 128, oy + 64, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.back, (ox + 192, oy + 64, 64, 64), ())
    Generator.drawTexture("Skin", steve.overlay.head.top, (ox + 64, oy, 64, 64), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.head.bottom,
      (ox + 64, oy + 128, 64, 64),
      ~flip=#Vertical,
      (),
    )
  }

  if !hideJacket {
    // Torso2
    let ox = 268
    let oy = 201
    Generator.drawTexture("Skin", steve.overlay.body.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.front, (ox + 32, oy + 32, 64, 96), ()) // Face
    Generator.drawTexture("Skin", steve.overlay.body.left, (ox + 96, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.back, (ox + 128, oy + 32, 64, 96), ())
    Generator.drawTexture("Skin", steve.overlay.body.top, (ox + 32, oy, 64, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.body.bottom,
      (ox + 32, oy + 128, 64, 32),
      ~flip=#Vertical,
      (),
    )
  }

  // Arms2

  if alexModel {
    if !hideRightSleeve {
      // Right Arm2
      let ox = 107
      let oy = 373
      Generator.drawTexture("Skin", alex.overlay.rightArm.right, (ox, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", alex.overlay.rightArm.front, (ox + 32, oy + 32, 24, 96), ())
      Generator.drawTexture("Skin", alex.overlay.rightArm.left, (ox + 56, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", alex.overlay.rightArm.back, (ox + 88, oy + 32, 24, 96), ())
      Generator.drawTexture("Skin", alex.overlay.rightArm.top, (ox + 32, oy, 24, 32), ())
      Generator.drawTexture("Skin", alex.overlay.rightArm.bottom, (ox + 32, oy + 128, 24, 32), ())
    }

    if !hideLeftSleeve {
      // Left Arm2
      let ox = 415
      let oy = 373
      Generator.drawTexture("Skin", alex.overlay.leftArm.right, (ox, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", alex.overlay.leftArm.front, (ox + 32, oy + 32, 24, 96), ())
      Generator.drawTexture("Skin", alex.overlay.leftArm.left, (ox + 56, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", alex.overlay.leftArm.back, (ox - 24, oy + 32, 24, 96), ())
      Generator.drawTexture("Skin", alex.overlay.leftArm.top, (ox + 32, oy, 24, 32), ())
      Generator.drawTexture("Skin", alex.overlay.leftArm.bottom, (ox + 32, oy + 128, 24, 32), ())
    }
  } else {
    if !hideRightSleeve {
      // Right Arm2
      let ox = 99
      let oy = 373
      Generator.drawTexture("Skin", steve.overlay.rightArm.right, (ox, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.rightArm.front, (ox + 32, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.rightArm.left, (ox + 64, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.rightArm.back, (ox + 96, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.rightArm.top, (ox + 32, oy, 32, 32), ())
      Generator.drawTexture(
        "Skin",
        steve.overlay.rightArm.bottom,
        (ox + 32, oy + 128, 32, 32),
        ~flip=#Vertical,
        (),
      )
    }

    if !hideLeftSleeve {
      // Left Arm2
      let ox = 415
      let oy = 373
      Generator.drawTexture("Skin", steve.overlay.leftArm.right, (ox, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.leftArm.front, (ox + 32, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.leftArm.left, (ox + 64, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.leftArm.back, (ox - 32, oy + 32, 32, 96), ())
      Generator.drawTexture("Skin", steve.overlay.leftArm.top, (ox + 32, oy, 32, 32), ())
      Generator.drawTexture(
        "Skin",
        steve.overlay.leftArm.bottom,
        (ox + 32, oy + 128, 32, 32),
        ~flip=#Vertical,
        (),
      )
    }
  }

  if !hideRightPant {
    // Right Leg2
    let ox = 99
    let oy = 587
    Generator.drawTexture("Skin", steve.overlay.rightLeg.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.front, (ox + 32, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.left, (ox + 64, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.back, (ox + 96, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.rightLeg.top, (ox + 32, oy, 32, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.rightLeg.bottom,
      (ox + 32, oy + 128, 32, 32),
      ~flip=#Vertical,
      (),
    )
  }

  if !hideLeftPant {
    // Left Leg2
    let ox = 415
    let oy = 587
    Generator.drawTexture("Skin", steve.overlay.leftLeg.right, (ox, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.front, (ox + 32, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.left, (ox + 64, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.back, (ox - 32, oy + 32, 32, 96), ())
    Generator.drawTexture("Skin", steve.overlay.leftLeg.top, (ox + 32, oy, 32, 32), ())
    Generator.drawTexture(
      "Skin",
      steve.overlay.leftLeg.bottom,
      (ox + 32, oy + 128, 32, 32),
      ~flip=#Vertical,
      (),
    )
  }

  // Fold Lines
  if showFolds {
    if alexModel {
      Generator.drawImage("Folds-Alex", (0, 0))
    } else {
      Generator.drawImage("Folds-Steve", (0, 0))
    }
  }

  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(instructions),
  images: images,
  textures: textures,
  script: script,
}
