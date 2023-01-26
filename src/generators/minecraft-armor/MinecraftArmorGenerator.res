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
    id: "Helmet Overlay",
    url: requireTexture("leather_layer_1_overlay"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Chestplate Overlay",
    url: requireTexture("leather_layer_1_overlay"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Leggings Overlay",
    url: requireTexture("leather_layer_2_overlay"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Boots Overlay",
    url: requireTexture("leather_layer_1_overlay"),
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
    id: "Leather",
    url: requireTexture("leather_layer_1"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather Overlay",
    url: requireTexture("leather_layer_1_overlay"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather ",
    url: requireTexture("leather_layer_2"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Leather  Overlay",
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

// Some pseudo for the gradient map implementation:
/*
let gradient_blend = (image, map, color_pallette) => {
  for (x, y) in image {
    for (i, j) in map {
      if getColor(image, x, y) == getColor(map, i, j) {
        draw(getColor(color_pallette, i, j), (x, y, 1, 1))
      }
    }
  }
}
*/

// draw left cuboid

let drawLeftCuboid = (
  textureId: string,
  source: Minecraft.Cuboid.Source.t,
  dest: Generator_Builder.position,
  tint: string,
) => {
  let (dx, dy) = dest
  Generator.drawTexture(
    textureId,
    source.top,
    (dx + 64, dy, 32, 32),
    ~flip=#Horizontal,
    ~blend=#MultiplyHex(tint),
    (),
  ) // top
  Generator.drawTexture(
    textureId,
    source.bottom,
    (dx + 64, dy + 128, 32, 32),
    ~rotate=180.0,
    ~blend=#MultiplyHex(tint),
    (),
  ) // top
  Generator.drawTexture(
    textureId,
    source.back,
    (dx, dy + 32, 32, 96),
    ~flip=#Horizontal,
    ~blend=#MultiplyHex(tint),
    (),
  ) // top
  Generator.drawTexture(
    textureId,
    source.left,
    (dx + 32, dy + 32, 32, 96),
    ~flip=#Horizontal,
    ~blend=#MultiplyHex(tint),
    (),
  ) // top
  Generator.drawTexture(
    textureId,
    source.front,
    (dx + 64, dy + 32, 32, 96),
    ~flip=#Horizontal,
    ~blend=#MultiplyHex(tint),
    (),
  ) // top
  Generator.drawTexture(
    textureId,
    source.right,
    (dx + 96, dy + 32, 32, 96),
    ~flip=#Horizontal,
    ~blend=#MultiplyHex(tint),
    (),
  ) // top
}

let materials = ["Chainmail", "Gold", "Iron", "Diamond", "Netherite", "Turtle Shell"]

let script = () => {
  // Inputs

  Generator.defineTextureInput(
    "Helmet",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Leather", "Chainmail", "Gold", "Iron", "Diamond", "Netherite", "Turtle Shell"],
    },
  )
  Generator.defineTextureInput(
    "Chestplate",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Leather", "Chainmail", "Gold", "Iron", "Diamond", "Netherite"],
    },
  )
  Generator.defineTextureInput(
    "Leggings",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Leather ", "Chainmail ", "Gold ", "Iron ", "Diamond ", "Netherite "],
    },
  )
  Generator.defineTextureInput(
    "Boots",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Leather", "Chainmail", "Gold", "Iron", "Diamond", "Netherite"],
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

  let drawHead = (textureId: string, tint: string) => {
    let (ox, oy) = (74, 25)
    let scale = (64, 64, 64)
    Minecraft.drawCuboid(textureId, char.base.head, (ox, oy), scale, ~blend=#MultiplyHex(tint), ())
    if showHeadOverlay {
      Minecraft.drawCuboid(
        textureId,
        char.overlay.head,
        (ox, oy),
        scale,
        ~blend=#MultiplyHex(tint),
        (),
      )
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawBody = (textureId: string, tint: string) => {
    let (ox, oy) = (268, 201)
    let scale = (64, 96, 32)
    Minecraft.drawCuboid(textureId, char.base.body, (ox, oy), scale, ~blend=#MultiplyHex(tint), ())
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawRightArm = (textureId: string, tint: string) => {
    let (ox, oy) = (99, 373)
    let scale = (32, 96, 32)
    Minecraft.drawCuboid(
      textureId,
      char.base.rightArm,
      (ox, oy),
      scale,
      ~blend=#MultiplyHex(tint),
      (),
    )
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftArm = (textureId: string, tint: string) => {
    let (ox, oy) = (383, 373)
    //let scale = (32, 96, 32)
    drawLeftCuboid(textureId, char.base.leftArm, (ox, oy), tint)
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~direction=#West, ())
    } */
  }
  let drawRightLeg = (textureId: string, tint: string) => {
    let (ox, oy) = (99, 587)
    let scale = (32, 96, 32)
    Minecraft.drawCuboid(
      textureId,
      char.base.rightLeg,
      (ox, oy),
      scale,
      ~blend=#MultiplyHex(tint),
      (),
    ) // Leggings
    Minecraft.drawCuboid(
      textureId,
      char.base.rightLeg,
      (ox, oy),
      scale,
      ~blend=#MultiplyHex(tint),
      (),
    ) // Boots
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftLeg = (textureId: string, tint: string) => {
    let (ox, oy) = (383, 587)
    //let scale = (32, 96, 32)
    drawLeftCuboid(textureId, char.base.leftLeg, (ox, oy), tint)
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

  let getTint = (colorId: string) => {
    // Define user variables
    Generator.defineSelectInput(
      colorId,
      [
        "Leather",
        "Black",
        "Red",
        "Green",
        "Brown",
        "Blue",
        "Purple",
        "Cyan",
        "Light Gray",
        "Gray",
        "Pink",
        "Lime",
        "Yellow",
        "Light Blue",
        "Magenta",
        "Orange",
        "White",
      ],
    )

    switch Generator.getSelectInputValue(colorId) {
    | "Leather" => "A06540"
    | "Black" => "1D1D21"
    | "Red" => "B02E26"
    | "Green" => "5E7C16"
    | "Brown" => "835432"
    | "Blue" => "3C44AA"
    | "Purple" => "8932B8"
    | "Cyan" => "169C9C"
    | "Light Gray" => "9D9D97"
    | "Gray" => "474F52"
    | "Pink" => "F38BAA"
    | "Lime" => "80C71F"
    | "Yellow" => "FED83D"
    | "Light Blue" => "3AB3DA"
    | "Magenta" => "C74EBD"
    | "Orange" => "F9801D"
    | "White" => "F9FFFE"
    | _ => "A06540"
    }
  }

  let drawHelmet = () => {
    let tintHelmet = Generator.defineAndGetBooleanInput("Tint Helmet", false)
    if tintHelmet {
      let helmetColor = getTint("Helmet Color")
      drawHead("Helmet", helmetColor)
      Generator.defineTextureInput(
        "Helmet Overlay",
        {
          standardWidth: 64,
          standardHeight: 64,
          choices: ["Leather Overlay"],
        },
      )
      drawHead("Helmet Overlay", "None")
    } else {
      drawHead("Helmet", "None")
    }
    Generator.defineRegionInput((74, 25, 256, 192), () => {
      Generator.setBooleanInputValue("Show Head Overlay", !showHeadOverlay)
    })
  }

  let drawChestplate = () => {
    let tintChestplate = Generator.defineAndGetBooleanInput("Tint Chestplate", false)
    if tintChestplate {
      let chestplateColor = getTint("Chestplate Color")
      drawBody("Chestplate", chestplateColor)
      drawLeftArm("Chestplate", chestplateColor)
      drawRightArm("Chestplate", chestplateColor)
      Generator.defineTextureInput(
        "Chestplate Overlay",
        {
          standardWidth: 64,
          standardHeight: 64,
          choices: ["Leather Overlay"],
        },
      )
      drawBody("Chestplate Overlay", "None")
      drawLeftArm("Chestplate Overlay", "None")
      drawRightArm("Chestplate Overlay", "None")
    } else {
      drawBody("Chestplate", "None")
      drawLeftArm("Chestplate", "None")
      drawRightArm("Chestplate", "None")
    }
  }

  let drawLeggings = () => {
    let tintLeggings = Generator.defineAndGetBooleanInput("Tint Leggings", false)
    if tintLeggings {
      let leggingsColor = getTint("Leggings Color")
      drawBody("Leggings", leggingsColor)
      drawLeftLeg("Leggings", leggingsColor)
      drawRightLeg("Leggings", leggingsColor)
      Generator.defineTextureInput(
        "Leggings Overlay",
        {
          standardWidth: 64,
          standardHeight: 64,
          choices: ["Leather Overlay"],
        },
      )
      drawBody("Leggings Overlay", "None")
      drawLeftLeg("Leggings Overlay", "None")
      drawRightLeg("Leggings Overlay", "None")
    } else {
      drawBody("Leggings", "None")
      drawLeftLeg("Leggings", "None")
      drawRightLeg("Leggings", "None")
    }
  }

  let drawBoots = () => {
    let tintBoots = Generator.defineAndGetBooleanInput("Tint Boots", false)
    if tintBoots {
      let bootsColor = getTint("Boots Color")
      drawLeftLeg("Boots", bootsColor)
      drawRightLeg("Boots", bootsColor)
      Generator.defineTextureInput(
        "Boots Overlay",
        {
          standardWidth: 64,
          standardHeight: 64,
          choices: ["Leather Overlay"],
        },
      )
      drawLeftLeg("Boots Overlay", "None")
      drawRightLeg("Boots Overlay", "None")
    } else {
      drawLeftLeg("Boots", "None")
      drawRightLeg("Boots", "None")
    }
  }

  // Helmet
  drawHelmet()

  // Leggings
  drawLeggings()

  // Chestplate
  drawChestplate()

  // Boots
  drawBoots()

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
