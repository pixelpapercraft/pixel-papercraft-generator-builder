let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-armor"

let name = "Minecraft Armor"

let history = []

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let instructions = `
## How to use the Minecraft armor Generator?

We don't know 
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
    id: "Helmet",
    url: requireTexture("diamond_layer_1"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Chestplate",
    url: requireTexture("diamond_layer_1"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Leggings",
    url: requireTexture("diamond_layer_2"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Boots",
    url: requireTexture("diamond_layer_1"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Chainmail",
    url: requireTexture("chainmail_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Chainmail ",
    url: requireTexture("chainmail_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Diamond",
    url: requireTexture("diamond_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Diamond ",
    url: requireTexture("diamond_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Gold",
    url: requireTexture("gold_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Gold ",
    url: requireTexture("gold_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Iron",
    url: requireTexture("iron_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Iron ",
    url: requireTexture("iron_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Netherite",
    url: requireTexture("netherite_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Netherite ",
    url: requireTexture("netherite_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather 1",
    url: requireTexture("leather_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather 1 Overlay",
    url: requireTexture("leather_layer_1_overlay"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather 2",
    url: requireTexture("leather_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather 2 Overlay",
    url: requireTexture("leather_layer_2_overlay"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Turtle Shell",
    url: requireTexture("turtle_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Notch",
    url: requireTexture("Notch"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Steve",
    url: requireTexture("steve"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

// Armor model
let make2 = ((w, h, d): Minecraft.scale): Minecraft.Cuboid.Source.t => {
  top: (d, 0, w, d * 2),
  bottom: (d + w, 0, w, d * 2),
  front: (d, d * 2, w, h * 2),
  right: (0, d * 2, d, h * 2),
  left: (d + w, d * 2, d, h * 2),
  back: (d * 2 + w, d * 2, w, h * 2),
}
let old: Minecraft.Character.t = {
  base: {
    head: make2((8, 8, 8))->Minecraft.Character.translate((0, 0)),
    rightArm: make2((4, 12, 4))->Minecraft.Character.translate((40, 32)),
    leftArm: make2((4, 12, 4))->Minecraft.Character.translate((40, 32)),
    body: make2((8, 12, 4))->Minecraft.Character.translate((16, 32)),
    rightLeg: make2((4, 12, 4))->Minecraft.Character.translate((0, 32)),
    leftLeg: make2((4, 12, 4))->Minecraft.Character.translate((0, 32)),
  },
  overlay: {
    head: make2((8, 8, 8))->Minecraft.Character.translate((32, 0)),
    rightArm: make2((0, 0, 0))->Minecraft.Character.translate((0, 0)),
    leftArm: make2((0, 0, 0))->Minecraft.Character.translate((0, 0)),
    body: make2((0, 0, 0))->Minecraft.Character.translate((0, 0)),
    rightLeg: make2((0, 0, 0))->Minecraft.Character.translate((0, 0)),
    leftLeg: make2((0, 0, 0))->Minecraft.Character.translate((0, 0)),
  },
}

// draw left cuboid

let drawLeftCuboid = (
  textureId: string,
  source: Minecraft.Cuboid.Source.t,
  dest: Generator_Builder.position,
) => {
  let (dx, dy) = dest
  Generator.drawTexture(textureId, source.top, (dx + 64, dy, 32, 32), ~flip=#Horizontal, ()) // top
  Generator.drawTexture(textureId, source.bottom, (dx + 64, dy + 128, 32, 32), ~rotate=180.0, ()) // top
  Generator.drawTexture(textureId, source.back, (dx, dy + 32, 32, 96), ~flip=#Horizontal, ()) // top
  Generator.drawTexture(textureId, source.left, (dx + 32, dy + 32, 32, 96), ~flip=#Horizontal, ()) // top
  Generator.drawTexture(textureId, source.front, (dx + 64, dy + 32, 32, 96), ~flip=#Horizontal, ()) // top
  Generator.drawTexture(textureId, source.right, (dx + 96, dy + 32, 32, 96), ~flip=#Horizontal, ()) // top
}

let script = () => {
  // Inputs

  Generator.defineTextureInput(
    "Helmet",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Chainmail", "Gold", "Iron", "Diamond", "Netherite", "Turtle Shell"],
    },
  )
  Generator.defineTextureInput(
    "Chestplate",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Chainmail", "Gold", "Iron", "Diamond", "Netherite"],
    },
  )
  Generator.defineTextureInput(
    "Leggings",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Chainmail ", "Gold ", "Iron ", "Diamond ", "Netherite "],
    },
  )
  Generator.defineTextureInput(
    "Boots",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Chainmail", "Gold", "Iron", "Diamond", "Netherite"],
    },
  )
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineText(
    "Click in the papercraft template to turn on and off the overlay for each part.",
  )

  // Draw

  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  let showHeadOverlay = Generator.getBooleanInputValueWithDefault("Show Head Overlay", true)

  let char = old

  let drawHead = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 64, 64)
    Minecraft.drawCuboid("Helmet", char.base.head, (ox, oy), scale, ())
    if showHeadOverlay {
      Minecraft.drawCuboid("Helmet", char.overlay.head, (ox, oy), scale, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawBody = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 96, 32)
    Minecraft.drawCuboid("Leggings", char.base.body, (ox, oy), scale, ()) // Leggings
    Minecraft.drawCuboid("Chestplate", char.base.body, (ox, oy), scale, ()) // Chestplate
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawRightArm = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Chestplate", char.base.rightArm, (ox, oy), scale, ())
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftArm = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    drawLeftCuboid("Chestplate", char.base.leftArm, (ox, oy))
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~direction=#West, ())
    } */
  }
  let drawRightLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Leggings", char.base.rightLeg, (ox, oy), scale, ()) // Leggings
    Minecraft.drawCuboid("Boots", char.base.rightLeg, (ox, oy), scale, ()) // Boots
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    drawLeftCuboid("Leggings", char.base.leftLeg, (ox, oy)) // Leggings
    drawLeftCuboid("Boots", char.base.leftLeg, (ox, oy)) // Boots
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~direction=#West, ())
    } */
  }

  let drawFolds = () => {
    Generator.drawImage("SteveFolds", (0, 0))
    // Later replace with drawLineFold functions
  }

  // Background

  Generator.drawImage("Background", (0, 0))

  Generator.drawImage("SteveTabs", (0, 0))

  // Head

  let (ox, oy) = (74, 25)

  drawHead((ox, oy))
  Generator.defineRegionInput((ox, oy, 256, 192), () => {
    Generator.setBooleanInputValue("Show Head Overlay", !showHeadOverlay)
  })

  // Body

  let (ox, oy) = (268, 201)

  drawBody((ox, oy))

  // Arms

  // Right Arm

  let (ox, oy) = (99, 373)

  drawRightArm((ox, oy))

  // Left Arm

  let (ox, oy) = (383, 373)

  drawLeftArm((ox, oy))

  // Right Leg

  let (ox, oy) = (99, 587)

  drawRightLeg((ox, oy))

  // Left Leg

  let (ox, oy) = (383, 587)

  drawLeftLeg((ox, oy))

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
