let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-axolotl-character"

let name = "Minecraft Axolotl Character"

let history = ["Feb 2022 M16 - Initial script developed."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2thumbnail_256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Blue",
    url: requireTexture("axolotl_blue"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Cyan",
    url: requireTexture("axolotl_cyan"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Pink",
    url: requireTexture("axolotl_lucy"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Gold",
    url: requireTexture("axolotl_gold"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Brown",
    url: requireTexture("axolotl_wild"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

// Provides the parts of a rectangle
let xOf = ((x, _, _, _)) => x
let yOf = ((_, y, _, _)) => y
let widthOf = ((_, _, w, _)) => w
let heightOf = ((_, _, _, h)) => h

// Calculates the top "n" pixels of a rectangle
let topOf = ((x, y, w, _), n) => (x, y, w, n)

// Calculates the bottom "n" pixels of a rectangle
let bottomOf = ((x, y, w, h), n) => (x, y + h - n, w, n)

// Leg and Foot
let legPart = rectangle => topOf(rectangle, heightOf(rectangle) - 1)
let footPart = rectangle => bottomOf(rectangle, 1)

// Arm and Hand
let armPart = rectangle => topOf(rectangle, heightOf(rectangle) - 1)
let handPart = rectangle => bottomOf(rectangle, 1)

let drawHead = (layer: TextureMap.MinecraftCharacter.layer) => {
  let {head} = layer
  Generator.drawTexture("Skin", head.right, (189, 214, 40, 40), ())
  Generator.drawTexture("Skin", head.front, (229, 214, 64, 40), ())
  Generator.drawTexture("Skin", head.left, (293, 214, 40, 40), ())
  Generator.drawTexture("Skin", head.back, (333, 214, 64, 40), ())
  Generator.drawTexture("Skin", head.top, (229, 174, 64, 40), ())
  Generator.drawTexture("Skin", head.bottom, (229, 254, 64, 40), ~flip=#Vertical, ())
}

let drawBody = (layer: TextureMap.MinecraftCharacter.layer) => {
  let {body} = layer
  Generator.drawTexture("Skin", body.top, (234, 405, 64, 32), ())
  Generator.drawTexture("Skin", body.back, (234, 325, 64, 80), ~flip=#Vertical, ())
  Generator.drawTexture("Skin", body.bottom, (378, 405, 64, 32), ~flip=#Vertical, ())
  Generator.drawTexture("Skin", body.front, (234, 437, 64, 80), ())
  Generator.drawTexture("Skin", body.left, (298, 437, 32, 80), ~rotateLegacy=-90.00, ())
  Generator.drawTexture("Skin", body.right, (234, 405, 32, 80), ~rotateLegacy=90.00, ())
}

let drawArms = (layer: TextureMap.MinecraftCharacter.layer) => {
  // Left Arm
  Generator.drawTexture("Skin", armPart(layer.leftArm.left), (469, 471, 8, 24), ())
  Generator.drawTexture("Skin", handPart(layer.leftArm.left), (461, 495, 24, 16), ())
  Generator.drawTexture("Skin", armPart(layer.leftArm.right), (445, 471, 8, 24), ())
  Generator.drawTexture("Skin", handPart(layer.leftArm.right), (437, 495, 24, 16), ())
  // Right Arm
  Generator.drawTexture("Skin", armPart(layer.rightArm.left), (387, 471, 8, 24), ())
  Generator.drawTexture("Skin", handPart(layer.rightArm.left), (379, 495, 24, 16), ())
  Generator.drawTexture("Skin", armPart(layer.rightArm.right), (411, 471, 8, 24), ())
  Generator.drawTexture("Skin", handPart(layer.rightArm.right), (403, 495, 24, 16), ())
}

let drawLegs = (layer: TextureMap.MinecraftCharacter.layer) => {
  // Right Leg
  Generator.drawTexture("Skin", legPart(layer.rightLeg.right), (387, 524, 8, 24), ())
  Generator.drawTexture("Skin", footPart(layer.rightLeg.right), (379, 548, 24, 16), ())
  Generator.drawTexture("Skin", legPart(layer.rightLeg.left), (411, 524, 8, 24), ())
  Generator.drawTexture("Skin", footPart(layer.rightLeg.left), (403, 548, 24, 16), ())
  // Left Leg
  Generator.drawTexture("Skin", legPart(layer.leftLeg.right), (445, 524, 8, 24), ())
  Generator.drawTexture("Skin", footPart(layer.leftLeg.right), (437, 548, 24, 16), ())
  Generator.drawTexture("Skin", legPart(layer.leftLeg.left), (469, 524, 8, 24), ())
  Generator.drawTexture("Skin", footPart(layer.leftLeg.left), (461, 548, 24, 16), ())
}

module HeadFins = {
  let topLeftBack = (249, 7, 24, 24)
  let topLeftFront = (273, 7, 24, 24)
  let topRightBack = (323, 7, 24, 24)
  let topRightFront = (299, 7, 24, 24)

  let middleLeftBack = (268, 41, 24, 32)
  let middleLeftFront = (268, 73, 24, 32)
  let middleRightBack = (304, 41, 24, 32)
  let middleRightFront = (304, 73, 24, 32)

  let bottomLeftBack = (268, 110, 24, 24)
  let bottomLeftFront = (268, 134, 24, 24)
  let bottomRightBack = (304, 110, 24, 24)
  let bottomRightFront = (304, 134, 24, 24)
}

let drawHeadFins = (layer: TextureMap.MinecraftCharacter.layer) => {
  let {top, right, left} = layer.head

  let topX = xOf(top)
  let topY = yOf(top)

  let rightX = xOf(right)
  let rightY = yOf(right)

  let leftX = xOf(left)
  let leftY = yOf(left)

  let r = (topX + 1, topY + 2, 2, 1)
  Generator.drawTexture("Skin", r, HeadFins.topLeftBack, ())

  let r = (topX + 1, topY + 1, 2, 1)
  Generator.drawTexture("Skin", r, HeadFins.topLeftFront, ~flip=#Horizontal, ())

  let r = (topX + 5, topY + 1, 2, 1)
  Generator.drawTexture("Skin", r, HeadFins.topRightFront, ~flip=#Horizontal, ())

  let r = (topX + 5, topY + 2, 2, 1)
  Generator.drawTexture("Skin", r, HeadFins.topRightBack, ())

  let r = (rightX + 1, rightY, 1, 3)
  Generator.drawTexture("Skin", r, HeadFins.middleLeftBack, ())

  let r = (rightX + 2, rightY, 1, 3)
  Generator.drawTexture("Skin", r, HeadFins.middleLeftFront, ())

  let r = (leftX + 6, leftY, 1, 3)
  Generator.drawTexture("Skin", r, HeadFins.middleRightBack, ())

  let r = (leftX + 5, leftY, 1, 3)
  Generator.drawTexture("Skin", r, HeadFins.middleRightFront, ())

  let r = (rightX + 2, rightY + 6, 1, 2)
  Generator.drawTexture("Skin", r, HeadFins.bottomLeftBack, ())

  let r = (rightX + 1, rightY + 6, 1, 2)
  Generator.drawTexture("Skin", r, HeadFins.bottomLeftFront, ())

  let r = (leftX + 5, leftY + 6, 1, 2)
  Generator.drawTexture("Skin", r, HeadFins.bottomRightBack, ())

  let r = (leftX + 6, leftY + 6, 1, 2)
  Generator.drawTexture("Skin", r, HeadFins.bottomRightFront, ())
}

let drawHeadFinsTexture = () => {
  Generator.drawTexture("Head Fins Texture", (3, 37, 3, 3), HeadFins.topLeftBack, ())
  Generator.drawTexture("Head Fins Texture", (8, 37, 3, 3), HeadFins.topLeftFront, ())
  Generator.drawTexture("Head Fins Texture", (3, 37, 3, 3), HeadFins.topRightFront, ())
  Generator.drawTexture("Head Fins Texture", (8, 37, 3, 3), HeadFins.topRightBack, ())
  Generator.drawTexture("Head Fins Texture", (0, 40, 3, 4), HeadFins.middleLeftBack, ())
  Generator.drawTexture(
    "Head Fins Texture",
    (0, 40, 3, 4),
    HeadFins.middleLeftFront,
    ~flip=#Horizontal,
    (),
  )
  Generator.drawTexture("Head Fins Texture", (11, 40, 3, 4), HeadFins.middleRightBack, ())
  Generator.drawTexture(
    "Head Fins Texture",
    (11, 40, 3, 4),
    HeadFins.middleRightFront,
    ~flip=#Horizontal,
    (),
  )
  Generator.drawTexture("Head Fins Texture", (0, 44, 3, 3), HeadFins.bottomLeftBack, ())
  Generator.drawTexture(
    "Head Fins Texture",
    (0, 44, 3, 3),
    HeadFins.bottomLeftFront,
    ~flip=#Vertical,
    (),
  )
  Generator.drawTexture("Head Fins Texture", (11, 44, 3, 3), HeadFins.bottomRightBack, ())
  Generator.drawTexture(
    "Head Fins Texture",
    (11, 44, 3, 3),
    HeadFins.bottomRightFront,
    ~flip=#Vertical,
    (),
  )
}

let drawTailFins = (layer: TextureMap.MinecraftCharacter.layer) => {
  let {back} = layer.body

  let backX = xOf(back)
  let backY = yOf(back)
  let backHeight = heightOf(back)

  let r = (backX + 3, backY, 1, backHeight)
  Generator.drawTexture("Skin", r, (258, 533, 40, 168), ())

  let r = (backX + 4, backY, 1, backHeight)
  Generator.drawTexture("Skin", r, (298, 533, 40, 168), ())
}

let drawTailFinsTexture = () => {
  Generator.drawTexture(
    // Left Side upper
    "Tail Fin Texture",
    (2, 26, 9, 1),
    (258 - 32, 533 + 32, 72, 8),
    ~rotate=-90.00,
    (),
  )
  Generator.drawTexture(
    // Right Side upper
    "Tail Fin Texture",
    (2, 26, 9, 1),
    (330 - 32, 533 + 32, 72, 8),
    ~rotate=-90.0,
    ~flip=#Vertical,
    (),
  )
  Generator.drawTexture(
    // Left Side lower
    "Tail Fin Texture",
    (2, 31, 12, 5),
    (258 - 28, 605 + 28, 96, 40),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    // Right Side lower
    "Tail Fin Texture",
    (2, 31, 12, 5),
    (298 - 28, 605 + 28, 96, 40),
    ~rotate=-90.0,
    ~flip=#Vertical,
    (),
  )
}

let drawEyes = (layer: TextureMap.MinecraftCharacter.layer) => {
  let {front} = layer.head

  let frontX = xOf(front)
  let frontY = yOf(front)

  let r = (frontX + 1, frontY + 4, 6, 2)
  Generator.drawTexture("Skin", r, (221, 229, 80, 16), ())
}

let script = () => {
  // Define input textures
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})
  Generator.defineTextureInput(
    "Tail Fin Texture",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Blue", "Cyan", "Pink", "Gold", "Brown"],
    },
  )
  Generator.defineTextureInput(
    "Head Fins Texture",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Blue", "Cyan", "Pink", "Gold", "Brown"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Axolotl Eyes", true)
  Generator.defineBooleanInput("Show Skin Overlay", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showEyes = Generator.getBooleanInputValue("Axolotl Eyes")
  let showOverlay = Generator.getBooleanInputValue("Show Skin Overlay")

  drawHead(steve.base)
  drawBody(steve.base)

  if alexModel {
    drawArms(alex.base)
  } else {
    drawArms(steve.base)
  }

  drawLegs(steve.base)
  drawHeadFins(steve.base)
  drawTailFins(steve.base)

  if showOverlay {
    drawHead(steve.overlay)
    drawBody(steve.overlay)

    if alexModel {
      drawArms(alex.overlay)
    } else {
      drawArms(steve.overlay)
    }

    drawLegs(steve.overlay)
    drawHeadFins(steve.overlay)
    drawTailFins(steve.overlay)
  }

  if showEyes {
    drawEyes(steve.base)
    if showOverlay {
      drawEyes(steve.overlay)
    }
  }

  let showTail = Generator.hasTexture("Tail Fin Texture")
  if showTail {
    drawTailFinsTexture()
  }

  let showFins = Generator.hasTexture("Head Fins Texture")
  if showFins {
    drawHeadFinsTexture()
  }

  Generator.drawImage("Background", (0, 0))

  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }

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
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
