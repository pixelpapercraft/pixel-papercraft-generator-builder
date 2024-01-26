let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-action-figure"

let name = "Minecraft Action Figure"

let history = [
  "16 Aug 2020 NinjolasNJM - Initial script finished.",
  "03 Oct 2020 NinjolasNJM - Added Alex support and Hand Notches.",
  "09 Oct 2020 NinjolasNJM - Tweaked pelvis, bottom of body and leg height.",
  "24 Feb 2021 NinjolasNJM - Moved pelvis so that the leg's pivot point is accurate to the game, changed leg height accordingly.",
  "06 Jun 2021 NinjolasNJM - Converted to ReScript generator.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let imageIds = [
  "Backgroundalex",
  "Backgroundsteve",
  "Foldsalex",
  "Foldssteve",
  "Foreground",
  "Labels",
  "Notch",
]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin2",
    url: requireTexture("Skin64x64ReferenceSteve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Alex",
    url: requireTexture("Skin64x64Alex"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = Minecraft.Character.steve
let alex = Minecraft.Character.alex

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex", "Skin2"],
    },
  )
  Generator.defineSelectInput("Skin Model", ["Steve", "Alex"])
  Generator.defineBooleanInput("Show Folds", false)
  Generator.defineBooleanInput("Show Labels", false)
  Generator.defineBooleanInput("Hand Notches", false)

  // Get user variable values
  let isAlexModel = Generator.getSelectInputValue("Skin Model") === "Alex"

  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let handNotches = Generator.getBooleanInputValue("Hand Notches")

  let showHeadOverlay = Generator.getBooleanInputValueWithDefault("Show Head Overlay", true)
  let showBodyOverlay = Generator.getBooleanInputValueWithDefault("Show Body Overlay", true)
  let showLeftArmOverlay = Generator.getBooleanInputValueWithDefault("Show Left Arm Overlay", true)
  let showRightArmOverlay = Generator.getBooleanInputValueWithDefault(
    "Show Right Arm Overlay",
    true,
  )
  let showLeftLegOverlay = Generator.getBooleanInputValueWithDefault("Show Left Leg Overlay", true)
  let showRightLegOverlay = Generator.getBooleanInputValueWithDefault(
    "Show Right Leg Overlay",
    true,
  )

  let char = isAlexModel ? alex : steve

  let drawHead = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 64, 64)
    Minecraft.drawCuboid("Skin", char.base.head, (ox, oy), scale, ())

    if showHeadOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.head, (ox, oy), scale, ())
    }
  }

  let drawNeck = ((ox, oy): Generator_Builder.position) => {
    Generator.drawTexture("Skin", char.base.head.bottom, (ox, oy, 96, 64), ()) // Neck

    if showHeadOverlay {
      Generator.drawTexture("Skin", char.overlay.head.bottom, (ox, oy, 96, 64), ()) // Neck
    }
  }

  let drawBody = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.body, (ox, oy), scale, ())
    Generator.drawTexture("Skin", (0, 20, 4, 4), (ox, oy + 128, 32, 32), ()) // Right Hip
    Generator.drawTexture("Skin", (24, 52, 4, 4), (ox + 96, oy + 128, 32, 32), ()) // Left Hip

    if showBodyOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.body, (ox, oy), scale, ())
    }
    if showRightLegOverlay {
      Generator.drawTexture("Skin", (0, 36, 4, 4), (ox, oy + 128, 32, 32), ()) // Right Hip
    }
    if showLeftLegOverlay {
      Generator.drawTexture("Skin", (8, 52, 4, 4), (ox + 96, oy + 128, 32, 32), ()) // Left Hip
    }
  }

  let drawPelvis = ((ox, oy): Generator_Builder.position) => {
    Generator.drawTexture("Skin", char.base.rightLeg.top, (ox, oy, 32, 128), ()) // Right Pelvis
    Generator.drawTexture("Skin", char.base.leftLeg.top, (ox + 32, oy, 32, 128), ()) // Left Pelvis

    if showRightLegOverlay {
      Generator.drawTexture("Skin", char.overlay.rightLeg.top, (ox, oy, 32, 128), ()) // Right Pelvis
    }

    if showLeftLegOverlay {
      Generator.drawTexture("Skin", char.overlay.leftLeg.top, (ox + 32, oy, 32, 128), ()) // Left Pelvis
    }
  }

  let drawRightArm = ((ox, oy): Generator_Builder.position) => {
    let scale = char == alex ? (24, 96, 32) : (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.rightArm, (ox, oy), scale, ())

    if showRightArmOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.rightArm, (ox, oy), scale, ())
    }
  }

  let drawRightShoulder = ((ox, oy): Generator_Builder.position) => {
    Generator.drawTexture("Skin", (char == alex ? 47 : 48, 20, 4, 4), (ox, oy + 15, 32, 32), ()) //Right Shoulder Inside
    Generator.drawTexture("Skin", (char == alex ? 47 : 48, 20, 4, 4), (ox, oy + 49, 32, 32), ()) //Right Shoulder

    if showRightArmOverlay {
      Generator.drawTexture("Skin", (char == alex ? 47 : 48, 36, 4, 4), (ox, oy + 15, 32, 32), ()) //Right Shoulder Inside
      Generator.drawTexture("Skin", (char == alex ? 47 : 48, 36, 4, 4), (ox, oy + 49, 32, 32), ()) //Right Shoulder
    }
  }

  let drawLeftArm = ((ox, oy): Generator_Builder.position) => {
    let scale = char == alex ? (24, 96, 32) : (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.leftArm, (ox, oy), scale, ~orientation=#East, ())

    if showLeftArmOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.leftArm, (ox, oy), scale, ~orientation=#East, ())
    }
  }

  let drawLeftShoulder = ((ox, oy): Generator_Builder.position) => {
    Generator.drawTexture("Skin", (32, 52, 4, 4), (ox, oy + 15, 32, 32), ()) //Left Shoulder Inside
    Generator.drawTexture("Skin", (32, 52, 4, 4), (ox, oy + 49, 32, 32), ()) //Left Shoulder

    if showLeftArmOverlay {
      Generator.drawTexture("Skin", (48, 52, 4, 4), (ox, oy + 15, 32, 32), ()) //Left Shoulder Inside
      Generator.drawTexture("Skin", (48, 52, 4, 4), (ox, oy + 49, 32, 32), ()) //Left Shoulder
    }
  }

  let drawRightLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.rightLeg, (ox, oy), scale, ())
    Generator.drawTexture("Skin", (12, 20, 4, 4), (ox + 32, oy - 50, 32, 32), ~rotate=180.0, ())
    Generator.drawTexture("Skin", char.base.rightLeg.top, (ox + 32, oy - 18, 32, 50), ())

    // 50 pixels tall top, so that the back texture is in line with where it should be on the back side

    if showRightLegOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.rightLeg, (ox, oy), scale, ())
      Generator.drawTexture("Skin", (12, 36, 4, 4), (ox + 32, oy - 50, 32, 32), ~rotate=180.0, ())
      Generator.drawTexture("Skin", char.base.rightLeg.top, (ox + 32, oy - 18, 32, 50), ())
      Generator.drawTexture("Skin", char.overlay.rightLeg.top, (ox + 32, oy - 18, 32, 50), ())
      // 50 pixels tall top, so that the back texture is in line with where it should be on the back side
    }
  }
  let drawLeftLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.leftLeg, (ox, oy), scale, ~orientation=#East, ())
    Generator.drawTexture("Skin", (28, 52, 4, 4), (ox + 64, oy - 50, 32, 32), ~rotate=180.0, ())
    Generator.drawTexture("Skin", char.base.leftLeg.top, (ox + 64, oy - 18, 32, 50), ())

    // 50 pixels tall top, so that the back texture is in line with where it should be on the back side
    if showLeftLegOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.leftLeg, (ox, oy), scale, ~orientation=#East, ())
      Generator.drawTexture("Skin", (12, 52, 4, 4), (ox + 64, oy - 50, 32, 32), ~rotate=180.0, ())
      Generator.drawTexture("Skin", char.base.leftLeg.top, (ox + 64, oy - 18, 32, 50), ())
      Generator.drawTexture("Skin", char.overlay.leftLeg.top, (ox + 64, oy - 18, 32, 50), ())
      // 50 pixels tall top, so that the back texture is in line with where it should be on the back side
    }
  }

  // The foreground was designed on a 32px grid with an offset of (9, 5) that makes the cells more centered. This function makes finding the (ox, oy) much easier as you only need to count the cells instead of find the actual coordinates.
  let getGridOrigin = (x: int, y: int) => (9 + 32 * x, 5 + 32 * y)

  // Head
  let (ox, oy) = getGridOrigin(1, 1)

  drawHead((ox, oy))
  Generator.defineRegionInput((ox, oy, 256, 192), () => {
    Generator.setBooleanInputValue("Show Head Overlay", !showHeadOverlay)
  })

  // Neck

  let (ox, oy) = getGridOrigin(13, 3)

  drawNeck((ox, oy))

  // Body

  let (ox, oy) = getGridOrigin(7, 6)

  drawBody((ox, oy))
  Generator.defineRegionInput((ox, oy, 192, 160), () => {
    Generator.setBooleanInputValue("Show Body Overlay", !showBodyOverlay)
  })

  // Pelvis

  let (ox, oy) = getGridOrigin(8, 15)

  drawPelvis((ox, oy))

  // Arms

  // Right Arm

  let (ox, oy) = getGridOrigin(2, 10)

  drawRightArm((ox, oy))
  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Arm Overlay", !showRightArmOverlay)
  })

  // Right Shoulder

  let (ox, oy) = getGridOrigin(7, 11)

  drawRightShoulder((ox, oy))

  // Left Arm

  let (ox, oy) = getGridOrigin(12, 10)

  drawLeftArm((ox, oy))
  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 166), () => {
    Generator.setBooleanInputValue("Show Left Arm Overlay", !showLeftArmOverlay)
  })

  // Left  Shoulder

  let (ox, oy) = getGridOrigin(10, 11)

  drawLeftShoulder((ox, oy))

  // Right Leg

  let (ox, oy) = getGridOrigin(2, 18)

  drawRightLeg((ox, oy))
  Generator.defineRegionInput((ox, oy - 48, 128, 208), () => {
    Generator.setBooleanInputValue("Show Right Leg Overlay", !showRightLegOverlay)
  })

  // Left Leg

  let (ox, oy) = getGridOrigin(12, 18)

  drawLeftLeg((ox, oy))
  Generator.defineRegionInput((ox, oy - 48, 128, 208), () => {
    Generator.setBooleanInputValue("Show Left Leg Overlay", !showLeftLegOverlay)
  })

  // Background
  /* if isAlexModel {
    Generator.drawImage("Backgroundalex", (0, 0))
  } else {
    Generator.drawImage("Backgroundsteve", (0, 0))
  } */
  // Foreground
  //Generator.drawImage("Foreground", (0, 0))

  // Folds
  if showFolds {
    if isAlexModel {
      Generator.drawImage("Foldsalex", (0, 0))
    } else {
      Generator.drawImage("Foldssteve", (0, 0))
    }
  }

  // Hand Notches
  if handNotches {
    if isAlexModel {
      Generator.drawImage("Notch", (341, 307)) // Front Left Notch
      Generator.drawImage("Notch", (285, 307)) // Back Left Notch
      Generator.drawImage("Notch", (477, 683)) // Front Right Notch
      Generator.drawImage("Notch", (533, 683)) // Back Right Notch
    } else {
      Generator.drawImage("Notch", (345, 307)) // Front Left Notch
      Generator.drawImage("Notch", (281, 307)) // Back Left Notch
      Generator.drawImage("Notch", (473, 683)) // Front Right Notch
      Generator.drawImage("Notch", (537, 683)) // Back Right Notch
    }
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
