let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

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
  {id: "SteveFolds", url: requireImage("SteveFolds")},
  {id: "AlexTabs", url: requireImage("AlexTabs")},
  {id: "AlexFolds", url: requireImage("AlexFolds")},
  {id: "Labels", url: requireImage("Labels")},
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Alex",
    url: requireTexture("SkinAlex64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

let drawHead = (head: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", head.right, (ox, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", head.front, (ox + 64, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", head.left, (ox + 128, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", head.back, (ox + 192, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", head.top, (ox + 64, oy, 64, 64), ())
  Generator.drawTexture("Skin", head.bottom, (ox + 64, oy + 128, 64, 64), ~flip=#Vertical, ())
}

let drawBody = (body: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", body.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", body.front, (ox + 32, oy + 32, 64, 96), ())
  Generator.drawTexture("Skin", body.left, (ox + 96, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", body.back, (ox + 128, oy + 32, 64, 96), ())
  Generator.drawTexture("Skin", body.top, (ox + 32, oy, 64, 32), ())
  Generator.drawTexture("Skin", body.bottom, (ox + 32, oy + 128, 64, 32), ~flip=#Vertical, ())
}

let drawRightLeg = (rightLeg: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", rightLeg.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightLeg.front, (ox + 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightLeg.left, (ox + 64, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightLeg.back, (ox + 96, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightLeg.top, (ox + 32, oy, 32, 32), ())
  Generator.drawTexture("Skin", rightLeg.bottom, (ox + 32, oy + 128, 32, 32), ~flip=#Vertical, ())
}

let drawLeftLeg = (leftLeg: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", leftLeg.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftLeg.front, (ox + 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftLeg.left, (ox + 64, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftLeg.back, (ox - 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftLeg.top, (ox + 32, oy, 32, 32), ())
  Generator.drawTexture("Skin", leftLeg.bottom, (ox + 32, oy + 128, 32, 32), ~flip=#Vertical, ())
}

let drawSteveRightArm = (rightArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", rightArm.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightArm.front, (ox + 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightArm.left, (ox + 64, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightArm.back, (ox + 96, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightArm.top, (ox + 32, oy, 32, 32), ())
  Generator.drawTexture("Skin", rightArm.bottom, (ox + 32, oy + 128, 32, 32), ~flip=#Vertical, ())
}

let drawSteveLeftArm = (leftArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", leftArm.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftArm.front, (ox + 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftArm.left, (ox + 64, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftArm.back, (ox - 32, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftArm.top, (ox + 32, oy, 32, 32), ())
  Generator.drawTexture("Skin", leftArm.bottom, (ox + 32, oy + 128, 32, 32), ~flip=#Vertical, ())
}

let drawAlexRightArm = (rightArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", rightArm.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightArm.front, (ox + 32, oy + 32, 24, 96), ())
  Generator.drawTexture("Skin", rightArm.left, (ox + 56, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", rightArm.back, (ox + 88, oy + 32, 24, 96), ())
  Generator.drawTexture("Skin", rightArm.top, (ox + 32, oy, 24, 32), ())
  Generator.drawTexture("Skin", rightArm.bottom, (ox + 32, oy + 128, 24, 32), ~flip=#Vertical, ())
}

let drawAlexLeftArm = (leftArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", leftArm.right, (ox, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftArm.front, (ox + 32, oy + 32, 24, 96), ())
  Generator.drawTexture("Skin", leftArm.left, (ox + 56, oy + 32, 32, 96), ())
  Generator.drawTexture("Skin", leftArm.back, (ox - 24, oy + 32, 24, 96), ())
  Generator.drawTexture("Skin", leftArm.top, (ox + 32, oy, 24, 32), ())
  Generator.drawTexture("Skin", leftArm.bottom, (ox + 32, oy + 128, 24, 32), ~flip=#Vertical, ())
}

/* let drawHead = (head: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (0, 0), (8, 8, 8), (ox, oy), (64, 64, 64), ())
}

let drawBody = (body: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (16, 16), (8, 12, 4), (ox, oy), (64, 96, 32), ())
}

let drawRightLeg = (rightLeg: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (0, 16), (4, 12, 4), (ox, oy), (32, 96, 32), ())
}

let drawLeftLeg = (leftLeg: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (16, 48), (4, 12, 4), (ox, oy), (32, 96, 32), ~leftSide=true, ())
}

let drawSteveRightArm = (rightArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (40, 16), (4, 12, 4), (ox, oy), (32, 96, 32), ())
}

let drawSteveLeftArm = (leftArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (32, 48), (4, 12, 4), (ox, oy), (32, 96, 32), ~leftSide=true, ())
}

let drawAlexRightArm = (rightArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (40, 16), (3, 12, 4), (ox, oy), (24, 96, 32), ())
}

let drawAlexLeftArm = (leftArm: Generator_Builder.cuboid, ox, oy) => {
  Generator.drawCuboid("Skin", (32, 48), (3, 12, 4), (ox, oy), (24, 96, 32), ())
} */

let script = () => {
  // Inputs

  Generator.defineTextureInput(
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

  Generator.defineRegionInput((72, 24, 264, 198), () => {
    Generator.setBooleanInputValue("Show Head Overlay", !showHeadOverlay)
  })
  Generator.defineRegionInput((266, 198, 198, 166), () => {
    Generator.setBooleanInputValue("Show Body Overlay", !showBodyOverlay)
  })
  Generator.defineRegionInput((382, 372, 134, 166), () => {
    Generator.setBooleanInputValue("Show Left Arm Overlay", !showLeftArmOverlay)
  })
  Generator.defineRegionInput((99, 372, 134, 166), () => {
    Generator.setBooleanInputValue("Show Right Arm Overlay", !showRightArmOverlay)
  })
  Generator.defineRegionInput((383, 584, 134, 166), () => {
    Generator.setBooleanInputValue("Show Left Leg Overlay", !showLeftLegOverlay)
  })
  Generator.defineRegionInput((99, 584, 134, 166), () => {
    Generator.setBooleanInputValue("Show Right Leg Overlay", !showRightLegOverlay)
  })

  // Background

  Generator.drawImage("Background", (0, 0))

  if isAlexModel {
    Generator.drawImage("AlexTabs", (0, 0))
  } else {
    Generator.drawImage("SteveTabs", (0, 0))
  }

  // Head

  let ox = 74
  let oy = 25
  drawHead(steve.base.head, ox, oy)
  if showHeadOverlay {
    drawHead(steve.overlay.head, ox, oy)
  }

  // Body

  let ox = 268
  let oy = 201
  drawBody(steve.base.body, ox, oy)
  if showBodyOverlay {
    drawBody(steve.overlay.body, ox, oy)
  }

  // Arms

  if isAlexModel {
    let ox = 107
    let oy = 373
    drawAlexRightArm(alex.base.rightArm, ox, oy)
    if showRightArmOverlay {
      drawAlexRightArm(alex.overlay.rightArm, ox, oy)
    }

    // Left Arm
    let ox = 383
    let oy = 373
    drawAlexLeftArm(alex.base.leftArm, ox, oy)
    if showLeftArmOverlay {
      drawAlexLeftArm(alex.overlay.leftArm, ox, oy)
    }
  } else {
    // Right Arm
    let ox = 99
    let oy = 373
    drawSteveRightArm(steve.base.rightArm, ox, oy)
    if showRightArmOverlay {
      drawSteveRightArm(steve.overlay.rightArm, ox, oy)
    }

    // Left Arm
    let ox = 383
    let oy = 373
    drawSteveLeftArm(steve.base.leftArm, ox, oy)
    if showLeftArmOverlay {
      drawSteveLeftArm(steve.overlay.leftArm, ox, oy)
    }
  }

  // Right Leg

  let ox = 99
  let oy = 587
  drawRightLeg(steve.base.rightLeg, ox, oy)
  if showRightLegOverlay {
    drawRightLeg(steve.overlay.rightLeg, ox, oy)
  }

  // Left Leg

  let ox = 383
  let oy = 587
  drawLeftLeg(steve.base.leftLeg, ox, oy)
  if showLeftLegOverlay {
    drawLeftLeg(steve.overlay.leftLeg, ox, oy)
  }

  // Folds

  if showFolds {
    if isAlexModel {
      Generator.drawImage("AlexFolds", (0, 0))
    } else {
      Generator.drawImage("SteveFolds", (0, 0))
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
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
