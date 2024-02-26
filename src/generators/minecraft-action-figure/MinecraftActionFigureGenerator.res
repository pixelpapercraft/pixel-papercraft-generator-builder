let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-action-figure"

let name = "Minecraft Action Figure"

let history = [
  "16 Aug 2020 NinjolasNJM - Initial script finished.",
  "03 Oct 2020 NinjolasNJM - Added Alex support and Hand Notches.",
  "09 Oct 2020 NinjolasNJM - Tweaked pelvis, bottom of body and leg height.",
  "24 Feb 2021 NinjolasNJM - Moved pelvis so that the leg's pivot point is accurate to the game, changed leg height accordingly.",
  "06 Jun 2021 NinjolasNJM - Converted to ReScript generator.",
  "02 Feb 2024 NinjolasNJM - Reworked layout, improved notches and added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let imageIds = [
  "Folds-Alex",
  "Folds-Steve",
  "Folds-M16",
  "Foreground-Alex",
  "Foreground-Steve",
  "Foreground-M16",
  "Labels",
]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = MinecraftSkins.skins

let steve = Minecraft.Character.steve
let alex = Minecraft.Character.alex

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
  Generator.defineSelectInput("Skin Model", ["Steve", "Alex"])
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Hand Notches", true)

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

  let m16Mode = Generator.getBooleanInputValueWithDefault("M16 Mode", false)

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

  let drawNotch = ((ox, oy): Generator_Builder.position, isLeftSide: bool) => {
    let dir = isLeftSide ? 1 : 0
    let (x, y, w, h) = (ox + dir, oy, 8, 24)

    let color = "#7b7b7b"
    //Generator.fillRect((x - dir, y, w, h), "#ff0000")
    Generator.drawLine((x, y - 1), (x + w - 1, y - 1), ~color, ())
    Generator.drawLine(
      (x + w - 10 * dir, y),
      (x + w - 10 * dir, y + h),
      ~color,
      ~pattern=[7, 1],
      (),
    )
    Generator.drawLine((x + w - 1, y + h + 1), (x, y + h + 1), ~color, ())
    //Generator.drawFoldLine((x, y + h), (x, y))
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

  let (ox, oy) = getGridOrigin(8, 17)

  drawPelvis((ox, oy))

  // Arms

  // Right Arm

  let (ox, oy) = getGridOrigin(1, 10)
  let (ox, oy) = (isAlexModel ? ox + 8 : ox, oy)

  drawRightArm((ox, oy))

  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Arm Overlay", !showRightArmOverlay)
  })

  // Right Shoulder

  let (ox, oy) = getGridOrigin(7, 12)

  drawRightShoulder((ox, oy))

  // Left Arm

  let (ox, oy) = getGridOrigin(13, 10)
  let (ox, oy) = (isAlexModel ? ox + 8 : ox, oy)

  drawLeftArm((ox, oy))

  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 166), () => {
    Generator.setBooleanInputValue("Show Left Arm Overlay", !showLeftArmOverlay)
  })

  // Left  Shoulder

  let (ox, oy) = getGridOrigin(10, 12)

  drawLeftShoulder((ox, oy))

  // Right Leg

  let (ox, oy) = getGridOrigin(1, 18)

  drawRightLeg((ox, oy))
  Generator.defineRegionInput((ox, oy - 48, 128, 208), () => {
    Generator.setBooleanInputValue("Show Right Leg Overlay", !showRightLegOverlay)
  })

  // Left Leg

  let (ox, oy) = getGridOrigin(13, 18)

  drawLeftLeg((ox, oy))
  Generator.defineRegionInput((ox, oy - 48, 128, 208), () => {
    Generator.setBooleanInputValue("Show Left Leg Overlay", !showLeftLegOverlay)
  })

  // Foreground
  if isAlexModel {
    Generator.drawImage("Foreground-Alex", (0, 0))
  } else {
    Generator.drawImage("Foreground-Steve", (0, 0))
  }

  // Folds
  if showFolds {
    if isAlexModel {
      Generator.drawImage("Folds-Alex", (0, 0))
    } else {
      Generator.drawImage("Folds-Steve", (0, 0))
    }
  }

  // M16 Mode

  Generator.defineRegionInput((1016, 1016, 64, 64), () => {
    // M + 16 = 1000 + 16 = 1016
    Generator.setBooleanInputValue("M16 Mode", !m16Mode)
  })
  if m16Mode {
    // draw new body and legs
    let (ox, oy) = getGridOrigin(7, 6)
    drawBody((ox, oy))
    let (ox, oy) = getGridOrigin(1, 18)

    drawRightLeg((ox, oy))
    let (ox, oy) = getGridOrigin(13, 18)

    drawLeftLeg((ox, oy))

    // Draw images
    Generator.drawImage("Foreground-M16", (0, 0))
    if showFolds {
      Generator.drawImage("Folds-M16", (0, 0))
    }
  }

  // Hand Notches
  if handNotches {
    // Right Hand Notches
    let (ox, oy) = getGridOrigin(1, 10)
    let (ox, oy) = (isAlexModel ? ox + 4 : ox, oy)
    drawNotch((ox + 44, oy + 104), false) // Front Notch
    drawNotch((ox + (isAlexModel ? 100 : 108), oy + 104), true) // Back Notch

    // Left Hand Notches
    let (ox, oy) = getGridOrigin(13, 10)
    let (ox, oy) = (isAlexModel ? ox + 4 : ox, oy)
    drawNotch((ox + (isAlexModel ? 68 : 76), oy + 104), true) // Front Notch
    drawNotch((ox + 12, oy + 104), false) // Back Notch
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
