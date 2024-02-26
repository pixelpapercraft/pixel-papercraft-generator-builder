let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-character"

let name = "Minecraft Character"

let history = [
  "01 Feb 2015 gootube2000 - First release.",
  "05 Feb 2015 gootube2000 - Fixed orientation of the hands, feet and under the head.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "20 Feb 2015 lostminer - Make background non-transparent.",
  "02 Oct 2020 NinjolasNJM - Combined Steve and Alex Generators into one.",
  "27 May 2021 lostminer - Convert to ReScript generator.",
  "17 Jul 2021 M16 - Updated generator photo.",
  "27 May 2022 NinjolasNJM - Made folds drawn using drawFolds, and parts drawn using drawCuboid, and added title",
  "12 Jun 2022 NinjolasNJM - Updated to use new Minecraft module",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let instructions = `
## How to use the Minecraft Character Generator?

1. Select your Minecraft skin file.
2. Choose the your Minecraft skin file model type.
3. Download and print your character papercraft.
`

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background")},
  {id: "SteveTabs", url: requireImage("SteveTabs")},
  {id: "AlexTabs", url: requireImage("AlexTabs")},
  {id: "SteveFolds", url: requireImage("SteveFolds")},
  {id: "AlexFolds", url: requireImage("AlexFolds")},
  {id: "Labels", url: requireImage("Labels")},
]

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
  Generator.defineText(
    "Click in the papercraft template to turn on and off the overlay for each part.",
  )

  // Draw

  let isAlexModel = Generator.getSelectInputValue("Skin Model") === "Alex"

  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

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
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawBody = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.body, (ox, oy), scale, ())
    if showBodyOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.body, (ox, oy), scale, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawRightArm = ((ox, oy): Generator_Builder.position) => {
    let scale = char == alex ? (24, 96, 32) : (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.rightArm, (ox, oy), scale, ())
    if showRightArmOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.rightArm, (ox, oy), scale, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftArm = ((ox, oy): Generator_Builder.position) => {
    let scale = char == alex ? (24, 96, 32) : (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.leftArm, (ox, oy), scale, ~orientation=#East, ())
    if showLeftArmOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.leftArm, (ox, oy), scale, ~orientation=#East, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~orientation=#East, ())
    } */
  }
  let drawRightLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.rightLeg, (ox, oy), scale, ())
    if showRightLegOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.rightLeg, (ox, oy), scale, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.leftLeg, (ox, oy), scale, ~orientation=#East, ())
    if showLeftLegOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.leftLeg, (ox, oy), scale, ~orientation=#East, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~orientation=#East, ())
    } */
  }

  let drawFolds = () => {
    if isAlexModel {
      Generator.drawImage("AlexFolds", (0, 0))
    } else {
      Generator.drawImage("SteveFolds", (0, 0))
    }

    // Later replace with drawLineFold functions
  }

  // Background

  Generator.drawImage("Background", (0, 0))

  if isAlexModel {
    Generator.drawImage("AlexTabs", (0, 0))
  } else {
    Generator.drawImage("SteveTabs", (0, 0))
  }

  // Head

  let (ox, oy) = (74, 25)

  drawHead((ox, oy))
  Generator.defineRegionInput((ox, oy, 256, 192), () => {
    Generator.setBooleanInputValue("Show Head Overlay", !showHeadOverlay)
  })

  // Body

  let (ox, oy) = (268, 201)

  drawBody((ox, oy))
  Generator.defineRegionInput((ox, oy, 192, 160), () => {
    Generator.setBooleanInputValue("Show Body Overlay", !showBodyOverlay)
  })

  // Arms

  // Right Arm

  let (ox, oy) = (isAlexModel ? 107 : 99, 373)

  drawRightArm((ox, oy))
  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Arm Overlay", !showRightArmOverlay)
  })

  // Left Arm

  let (ox, oy) = (isAlexModel ? 391 : 383, 373)

  drawLeftArm((ox, oy))
  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 166), () => {
    Generator.setBooleanInputValue("Show Left Arm Overlay", !showLeftArmOverlay)
  })

  // Right Leg

  let (ox, oy) = (99, 587)

  drawRightLeg((ox, oy))
  Generator.defineRegionInput((ox, oy, 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Leg Overlay", !showRightLegOverlay)
  })

  // Left Leg

  let (ox, oy) = (383, 587)

  drawLeftLeg((ox, oy))
  Generator.defineRegionInput((ox, oy, 128, 160), () => {
    Generator.setBooleanInputValue("Show Left Leg Overlay", !showLeftLegOverlay)
  })

  // Folds

  if showFolds {
    drawFolds()
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
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images,
  textures,
  script,
}
