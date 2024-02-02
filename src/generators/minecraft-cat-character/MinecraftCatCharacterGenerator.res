let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-cat-character"

let name = "Minecraft Cat Character"

let history = [
  "Originally developed by dodecaphon.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "17 Sep 2020 NinjolasNJM - Updated to use 1.8+ skins.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = MinecraftSkins.skins

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

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Script Variables
  let ox = 15 // ox means 'origin x'
  let oy = 8 // oy means 'origin y'
  let oa = 0
  let ob = 0
  let og = 15
  let oh = 8
  let ol = 0
  let om = 0
  let oi = 0
  let oo = 0

  // Overlay region variables
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")
  let tailType =
    Generator.getSelectInputValue("Tail Type")->Belt.Int.fromString->Belt.Option.getWithDefault(1)

  let cycleTailTypes = t => {
    let t = if t === 4 {
      1
    } else {
      t + 1
    }
    Belt.Int.toString(t)
  }

  Generator.defineRegionInput((40, 33, 160, 112), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((40, 193, 160, 224), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((340, 232, 64, 64), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((251, 232, 128 / 2, 64), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((340, 320, 64, 64), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((251, 320, 64, 64), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })
  Generator.defineRegionInput((469, 283, 104, 83), () => {
    Generator.setSelectInputValue("Tail Type", cycleTailTypes(tailType))
  })

  // Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: ox + 25, y: oy + 65, w: 40, h: 32},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: ox + 65, y: oy + 97, w: 40, h: 40},
    ~flip=#Vertical,
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: ox + 105, y: oy + 65, w: 40, h: 32},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: ox + 145, y: oy + 65, w: 40, h: 32},
    (),
  ) // back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: ox + 65, y: oy + 25, w: 40, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: ox + 65, y: oy + 65, w: 40, h: 32},
    (),
  ) // face

  // nose
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 3},
    {x: og + 241, y: oh + 76, w: 24, h: 12},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 1},
    {x: og + 241, y: oh + 68, w: 24, h: 8},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 13, y: 13, w: 1, h: 3},
    {x: og + 265, y: oh + 76, w: 8, h: 12},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 15, w: 4, h: 1},
    {x: og + 241, y: oh + 88, w: 24, h: 8},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 1, h: 3},
    {x: og + 233, y: oh + 76, w: 8, h: 12},
    (),
  ) // left

  // Ears

  // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 1, w: 1, h: 1},
    {x: ol + 168, y: om + 168, w: 24, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 0, w: 1, h: 1},
    {x: ol + 168, y: om + 152, w: 24, h: 16},
    (),
  ) //back

  // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 14, y: 1, w: 1, h: 1},
    {x: ol + 245, y: om + 169, w: 24, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 14, y: 0, w: 1, h: 1},
    {x: ol + 245, y: om + 153, w: 24, h: 16},
    (),
  ) //back

  if !hideHelmet {
    // Hat
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0 + 32, y: 8, w: 8, h: 8},
      {x: ox + 25, y: oy + 65, w: 40, h: 32},
      (),
    ) // left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16 + 32, y: 0, w: 8, h: 8},
      {x: ox + 65, y: oy + 97, w: 40, h: 40},
      ~flip=#Vertical,
      (),
    ) // bottom
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16 + 32, y: 8, w: 8, h: 8},
      {x: ox + 105, y: oy + 65, w: 40, h: 32},
      (),
    ) // right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 24 + 32, y: 8, w: 8, h: 8},
      {x: ox + 145, y: oy + 65, w: 40, h: 32},
      (),
    ) // back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8 + 32, y: 0, w: 8, h: 8},
      {x: ox + 65, y: oy + 25, w: 40, h: 40},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8 + 32, y: 8, w: 8, h: 8},
      {x: ox + 65, y: oy + 65, w: 40, h: 32},
      (),
    ) // face

    // nose Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 42, y: 13, w: 4, h: 3},
      {x: og + 241, y: oh + 76, w: 24, h: 12},
      (),
    ) // front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 42, y: 13, w: 4, h: 1},
      {x: og + 241, y: oh + 68, w: 24, h: 8},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 45, y: 13, w: 1, h: 3},
      {x: og + 265, y: oh + 76, w: 8, h: 12},
      (),
    ) // right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 42, y: 15, w: 4, h: 1},
      {x: og + 241, y: oh + 88, w: 24, h: 8},
      (),
    ) // bottom
    Generator.drawTextureLegacy(
      "Skin",
      {x: 42, y: 13, w: 1, h: 3},
      {x: og + 233, y: oh + 76, w: 8, h: 12},
      (),
    ) // left

    // left Helmet
    Generator.drawTextureLegacy(
      "Skin",
      {x: 41, y: 1, w: 1, h: 1},
      {x: ol + 168, y: om + 168, w: 24, h: 16},
      (),
    ) //front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 41, y: 0, w: 1, h: 1},
      {x: ol + 168, y: om + 152, w: 24, h: 16},
      (),
    ) //back

    // right Helmet
    Generator.drawTextureLegacy(
      "Skin",
      {x: 46, y: 1, w: 1, h: 1},
      {x: ol + 245, y: om + 169, w: 24, h: 16},
      (),
    ) //front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 46, y: 0, w: 1, h: 1},
      {x: ol + 245, y: om + 153, w: 24, h: 16},
      (),
    ) //back
  }

  // Legs

  if alexModel {
    // Front Right Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 12},
      {x: oa + 251, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (right)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 3, h: 12},
      {x: oa + 267, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (front)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 12},
      {x: oa + 283, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (left)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 12},
      {x: oa + 299, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (back)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 16, w: 3, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  } else {
    // Front Right Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 16, h: 12},
      {x: oa + 251, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 16, w: 4, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  if !hideRightSleeve {
    if alexModel {
      // Front Right Leg Pant
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 12},
        {x: oa + 251, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (right)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 3, h: 12},
        {x: oa + 267, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (front)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 12},
        {x: oa + 283, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (left)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 36, w: 3, h: 12},
        {x: oa + 299, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (back)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 3, h: 4},
        {x: oa + 267, y: ob + 232, w: 16, h: 16},
        (),
      ) // top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 32, w: 3, h: 4},
        {x: oa + 267, y: ob + 280, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // bottom
    } else {
      // Front Right Leg Pant
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 16, h: 12},
        {x: oa + 251, y: ob + 248, w: 64, h: 32},
        (),
      ) // leg (all sides)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 4, h: 4},
        {x: oa + 267, y: ob + 232, w: 16, h: 16},
        (),
      ) // top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 32, w: 4, h: 4},
        {x: oa + 267, y: ob + 280, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // bottom
    }
  }

  if alexModel {
    // Front Left Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 12},
      {x: oa + 340, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (right)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 3, h: 12},
      {x: oa + 356, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (front)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 52, w: 4, h: 12},
      {x: oa + 372, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (left)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 12},
      {x: oa + 388, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (back)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 48, w: 3, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  } else {
    // Front Left Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 16, h: 12},
      {x: oa + 340, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  if !hideLeftSleeve {
    if alexModel {
      // Front Left Leg Pant
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 12},
        {x: oa + 340, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (right)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 3, h: 12},
        {x: oa + 356, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (front)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 52, w: 4, h: 12},
        {x: oa + 372, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (left)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 12},
        {x: oa + 388, y: ob + 248, w: 16, h: 32},
        (),
      ) // leg (back)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 3, h: 4},
        {x: oa + 356, y: ob + 232, w: 16, h: 16},
        (),
      ) // top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 48, w: 3, h: 4},
        {x: oa + 356, y: ob + 280, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // bottom
    } else {
      // Front Left Leg Pant
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 16, h: 12},
        {x: oa + 340, y: ob + 248, w: 64, h: 32},
        (),
      ) // leg (all sides)
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 4, h: 4},
        {x: oa + 356, y: ob + 232, w: 16, h: 16},
        (),
      ) // top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 48, w: 4, h: 4},
        {x: oa + 356, y: ob + 280, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // bottom
    }
  }

  let ob = ob + 88

  // Back Right Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 16, h: 12},
    {x: oa + 251, y: ob + 248, w: 64, h: 32},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: oa + 267, y: ob + 232, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: oa + 267, y: ob + 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  if !hideRightPant {
    // Back Right Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 16, h: 12},
      {x: oa + 251, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  // Back Left Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 16, h: 12},
    {x: oa + 340, y: ob + 248, w: 64, h: 32},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: oa + 356, y: ob + 232, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: oa + 356, y: ob + 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  if !hideLeftPant {
    // Back Left Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 16, h: 12},
      {x: oa + 340, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  let drawTail = (sx, sy, isArm) => {
    if isArm && alexModel {
      // Tail
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx, y: sy + 4, w: 4, h: 6},
        {x: oi + 469, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg1 (right)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 4, y: sy + 4, w: 3, h: 6},
        {x: oi + 477, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg1 (front)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 7, y: sy + 4, w: 4, h: 6},
        {x: oi + 485, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg1 (left)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 11, y: sy + 4, w: 3, h: 6},
        {x: oi + 493, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg1 (back)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx, y: sy + 10, w: 4, h: 6},
        {x: oi + 541, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg2 (right)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 4, y: sy + 10, w: 3, h: 6},
        {x: oi + 549, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg2 (front)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 7, y: sy + 10, w: 4, h: 6},
        {x: oi + 557, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg2 (left)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 11, y: sy + 10, w: 3, h: 6},
        {x: oi + 565, y: oo + 294, w: 8, h: 64},
        (),
      ) // leg2 (back)
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 5, y: sy + 1, w: 1, h: 1},
        {x: oi + 477, y: oo + 358, w: 8, h: 8},
        (),
      ) // end1
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 9, y: sy + 1, w: 1, h: 1},
        {x: oi + 549, y: oo + 358, w: 8, h: 8},
        (),
      ) // end2
    } else {
      // Tail
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx, y: sy + 4, w: 16, h: 6},
        {x: oi + 469, y: oo + 294, w: 32, h: 64},
        (),
      ) // leg1
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx, y: sy + 10, w: 16, h: 6},
        {x: oi + 541, y: oo + 294, w: 32, h: 64},
        (),
      ) // leg2
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 5, y: sy + 1, w: 1, h: 1},
        {x: oi + 477, y: oo + 358, w: 8, h: 8},
        (),
      ) // end1
      Generator.drawTextureLegacy(
        "Skin",
        {x: sx + 9, y: sy + 1, w: 1, h: 1},
        {x: oi + 549, y: oo + 358, w: 8, h: 8},
        (),
      ) // end2
    }
  }

  switch tailType {
  | 1 => {
      let sx = 0
      let sy = 16
      let sx2 = 0
      let sy2 = 32
      let isArm = false
      drawTail(sx, sy, isArm)
      if !hideRightPant {
        drawTail(sx2, sy2, isArm)
      }
    }
  | 2 => {
      let sx = 16
      let sy = 48
      let sx2 = 0
      let sy2 = 48
      let isArm = false
      drawTail(sx, sy, isArm)
      if !hideLeftPant {
        drawTail(sx2, sy2, isArm)
      }
    }
  | 3 => {
      let sx = 40
      let sy = 16
      let sx2 = 40
      let sy2 = 32
      let isArm = true
      drawTail(sx, sy, isArm)
      if !hideRightSleeve {
        drawTail(sx2, sy2, isArm)
      }
    }
  | 4 => {
      let sx = 32
      let sy = 48
      let sx2 = 48
      let sy2 = 48
      let isArm = true
      drawTail(sx, sy, isArm)
      if !hideLeftSleeve {
        drawTail(sx2, sy2, isArm)
      }
    }
  | _ => ()
  }

  /* // Tail Overlay
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 16, h: 6},
    {x: oi + 469, y: oo + 294, w: 32, h: 64},
    (),
  ) // leg1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 42, w: 16, h: 6},
    {x: oi + 541, y: oo + 294, w: 32, h: 64},
    (),
  ) // leg2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 5, y: 33, w: 1, h: 1},
    {x: oi + 477, y: oo + 358, w: 8, h: 8},
    (),
  ) // end1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 33, w: 1, h: 1},
    {x: oi + 549, y: oo + 358, w: 8, h: 8},
    (),
  ) // end2 */

  // body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 40, y: 241, w: 48, h: 128},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 88, y: 241, w: 32, h: 128},
    (),
  ) // middle
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 120, y: 241, w: 48, h: 128},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 168, y: 241, w: 32, h: 128},
    (),
  ) // top
  Generator.drawTextureLegacy("Skin", {x: 20, y: 16, w: 8, h: 4}, {x: 88, y: 193, w: 32, h: 48}, ()) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 88, y: 369, w: 32, h: 48},
    ~flip=#Vertical,
    (),
  ) // back

  if !hideJacket {
    // Jacket
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: 40, y: 241, w: 48, h: 128},
      (),
    ) // left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: 88, y: 241, w: 32, h: 128},
      (),
    ) // middle
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: 120, y: 241, w: 48, h: 128},
      (),
    ) // right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: 168, y: 241, w: 32, h: 128},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: 88, y: 193, w: 32, h: 48},
      (),
    ) // front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 88, y: 369, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) // back
  }

  // Background
  Generator.drawImage("Background", (0, 0))

  //Fold Lines
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
