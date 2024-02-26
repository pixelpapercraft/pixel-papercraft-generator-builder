let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-axolotl-character"

let name = "Minecraft Axolotl Character"

let history = [
  "Feb 2022 M16 - Initial script developed.",
  "6 Feb 2022 lostminer - Refactoring.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let video: Generator.videoDef = {url: "https://www.youtube.com/embed/QVRD8Bl_hjA?rel=0"}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
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
  ],
)

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

// Arms, Legs, Hands, Feet
let armOrLegPart = rectangle => topOf(rectangle, heightOf(rectangle) - 1)
let handOrFootPart = rectangle => bottomOf(rectangle, 1)

let drawHead = (layer: TextureMap.MinecraftCharacter.layer, faceStretch: int) => {
  let {head} = layer
  let offset = switch faceStretch {
  | 0 => 0
  | 1 => 6
  | 2 => 12
  | 3 => 20
  | 4 => 32
  | _ => 40
  }
  let ox = 229
  let oy = 214
  let pixelate = offset > 0
  Generator.drawTexture("Skin", head.right, (ox - 40, oy, 40 - offset, 40), ~pixelate, ())
  Generator.drawTexture("Skin", head.front, (ox - offset, oy, 64 + offset * 2, 40), ())
  Generator.drawTexture("Skin", head.left, (ox + 64 + offset, oy, 40 - offset, 40), ~pixelate, ())
  Generator.drawTexture("Skin", head.back, (ox + 64 + 40, oy, 64, 40), ())
  Generator.drawTexture("Skin", head.top, (ox, oy - 40, 64, 40), ())
  Generator.drawTexture("Skin", head.bottom, (ox, oy + 40, 64, 40), ~flip=#Vertical, ())
}

let drawBody = (layer: TextureMap.MinecraftCharacter.layer) => {
  let {body} = layer
  let ox = 234
  let oy = 405
  Generator.drawTexture("Skin", body.top, (ox, oy, 64, 32), ())
  Generator.drawTexture("Skin", body.back, (ox, oy - 80, 64, 80), ~flip=#Vertical, ())
  Generator.drawTexture("Skin", body.bottom, (ox + 80 + 64, oy, 64, 32), ~flip=#Vertical, ())
  Generator.drawTexture("Skin", body.front, (ox, oy + 32, 64, 80), ())
  Generator.drawTexture("Skin", body.left, (ox + 64, oy + 32, 32, 80), ~rotateLegacy=-90.00, ())
  Generator.drawTexture("Skin", body.right, (ox, oy, 32, 80), ~rotateLegacy=90.00, ())
}

let drawLimb = (leg: TextureMap.cuboid, ox, oy) => {
  Generator.drawTexture("Skin", armOrLegPart(leg.left), (ox + 8, oy - 24, 8, 24), ())
  Generator.drawTexture("Skin", handOrFootPart(leg.left), (ox, oy, 24, 16), ())
  Generator.drawTexture("Skin", armOrLegPart(leg.right), (ox - 16, oy - 24, 8, 24), ())
  Generator.drawTexture("Skin", handOrFootPart(leg.right), (ox - 24, oy, 24, 16), ())
}

let drawArms = (layer: TextureMap.MinecraftCharacter.layer) => {
  drawLimb(layer.leftArm, 461, 495)
  drawLimb(layer.rightArm, 403, 495)
}

let drawLegs = (layer: TextureMap.MinecraftCharacter.layer) => {
  drawLimb(layer.rightLeg, 403, 548)
  drawLimb(layer.leftLeg, 461, 548)
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
    "Tail Fins Texture",
    (2, 26, 9, 1),
    (258 - 32, 533 + 32, 72, 8),
    ~rotate=-90.00,
    (),
  )
  Generator.drawTexture(
    // Right Side upper
    "Tail Fins Texture",
    (2, 26, 9, 1),
    (330 - 32, 533 + 32, 72, 8),
    ~rotate=-90.0,
    ~flip=#Vertical,
    (),
  )
  Generator.drawTexture(
    // Left Side lower
    "Tail Fins Texture",
    (2, 31, 12, 5),
    (258 - 28, 605 + 28, 96, 40),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    // Right Side lower
    "Tail Fins Texture",
    (2, 31, 12, 5),
    (298 - 28, 605 + 28, 96, 40),
    ~rotate=-90.0,
    ~flip=#Vertical,
    (),
  )
}

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
  Generator.defineTextureInput(
    "Head Fins Texture",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Blue", "Cyan", "Pink", "Gold", "Brown"],
    },
  )
  Generator.defineTextureInput(
    "Tail Fins Texture",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Blue", "Cyan", "Pink", "Gold", "Brown"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Show Overlay", true)
  Generator.defineRangeInput("Axolotl Face", {min: 0, max: 5, step: 1, value: 0})

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showOverlay = Generator.getBooleanInputValue("Show Overlay")
  let faceStretch = Generator.getRangeInputValue("Axolotl Face")

  drawHead(steve.base, faceStretch)
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
    drawHead(steve.overlay, faceStretch)
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

  let showHeadFinsTexture = Generator.hasTexture("Head Fins Texture")
  if showHeadFinsTexture {
    drawHeadFinsTexture()
  }

  let showTailFindTexture = Generator.hasTexture("Tail Fins Texture")
  if showTailFindTexture {
    drawTailFinsTexture()
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
  id,
  name,
  history,
  thumbnail: Some(thumbnail),
  video: Some(video),
  instructions: None,
  images,
  textures,
  script,
}
