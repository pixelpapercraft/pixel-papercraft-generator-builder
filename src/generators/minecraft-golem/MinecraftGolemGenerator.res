let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-golem"

let name = "Minecraft Golem"

let history = [
  "Originally Developed by Wajy.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "20 Feb 2015 lostminer - Make the nose optional.",
  "19 Sep 2020 NinjolasNJM - Fixed bottom textures and allowed for multiple types of flowers and damage cracks.",
  "07 Jun 2021 NinjolasNJM - Converted to ReScript generator. The ability to select between several default flower and damage textures still needs to be implemented.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Golem",
    url: requireTexture("iron_golem"),
    standardWidth: 128,
    standardHeight: 128,
  },
  {
    id: "Poppy Flower",
    url: requireTexture("flower_poppy"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "Rose Flower",
    url: requireTexture("flower_rose"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "Cyan Flower",
    url: requireTexture("flower_cyan"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "Low Damage",
    url: requireTexture("damage_low"),
    standardWidth: 128,
    standardHeight: 128,
  },
  {
    id: "Medium Damage",
    url: requireTexture("damage_medium"),
    standardWidth: 128,
    standardHeight: 128,
  },
  {
    id: "High Damage",
    url: requireTexture("damage_high"),
    standardWidth: 128,
    standardHeight: 128,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Golem",
    {
      standardWidth: 128,
      standardHeight: 128,
      choices: [],
    },
  )
  Generator.defineTextureInput(
    "Flower",
    {
      standardWidth: 16,
      standardHeight: 16,
      choices: ["Poppy Flower", "Rose Flower", "Cyan Flower"],
    },
  )
  Generator.defineTextureInput(
    "Damage",
    {
      standardWidth: 128,
      standardHeight: 128,
      choices: ["Low Damage", "Medium Damage", "High Damage"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  let ox = 39
  let oy = 19
  Generator.drawTextureLegacy(
    "Golem",
    {x: 0, y: 8, w: 8, h: 10},
    {x: ox + 0, y: oy + 64, w: 64, h: 80},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Golem",
    {x: 8, y: 8, w: 8, h: 10},
    {x: ox + 64, y: oy + 64, w: 64, h: 80},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Golem",
    {x: 16, y: 8, w: 8, h: 10},
    {x: ox + 128, y: oy + 64, w: 64, h: 80},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 24, y: 8, w: 8, h: 10},
    {x: ox + 192, y: oy + 64, w: 64, h: 80},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 8, y: 0, w: 8, h: 8},
    {x: ox + 64, y: oy + 0, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 16, y: 0, w: 8, h: 8},
    {x: ox + 64, y: oy + 144, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Waist
  let ox = 325
  let oy = 77
  Generator.drawTextureLegacy(
    "Golem",
    {x: 6, y: 76, w: 9, h: 5},
    {x: ox + 48, y: oy + 48, w: 72, h: 40},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 15, y: 76, w: 6, h: 5},
    {x: ox + 120, y: oy + 48, w: 48, h: 40},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 0, y: 76, w: 6, h: 5},
    {x: ox + 0, y: oy + 48, w: 48, h: 40},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Golem",
    {x: 21, y: 76, w: 9, h: 5},
    {x: ox + 168, y: oy + 48, w: 72, h: 40},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 6, y: 70, w: 9, h: 6},
    {x: ox + 48, y: oy + 0, w: 72, h: 48},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 15, y: 70, w: 9, h: 6},
    {x: ox + 48, y: oy + 88, w: 72, h: 48},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Torso
  let ox = 120
  let oy = 198
  Generator.drawTextureLegacy(
    "Golem",
    {x: 11, y: 51, w: 18, h: 12},
    {x: ox + 88, y: oy + 88, w: 144, h: 96},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 29, y: 51, w: 11, h: 12},
    {x: ox + 232, y: oy + 88, w: 88, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 40, y: 51, w: 18, h: 12},
    {x: ox + 320, y: oy + 88, w: 144, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 0, y: 51, w: 11, h: 12},
    {x: ox + 0, y: oy + 88, w: 89, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Golem",
    {x: 11, y: 40, w: 18, h: 11},
    {x: ox + 88, y: oy + 0, w: 144, h: 88},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 29, y: 40, w: 18, h: 11},
    {x: ox + 88, y: oy + 184, w: 144, h: 88},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right Leg
  let ox = 398
  let oy = 408
  Generator.drawTextureLegacy(
    "Golem",
    {x: 42, y: 5, w: 6, h: 16},
    {x: ox + 40, y: oy + 40, w: 48, h: 128},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 48, y: 5, w: 6, h: 16},
    {x: ox + 88, y: oy + 40, w: 40, h: 128},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 53, y: 5, w: 6, h: 16},
    {x: ox + 128, y: oy + 40, w: 48, h: 128},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 37, y: 5, w: 5, h: 16},
    {x: ox + 0, y: oy + 40, w: 40, h: 128},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Golem",
    {x: 42, y: 0, w: 6, h: 5},
    {x: ox + 40, y: oy + 0, w: 48, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 48, y: 0, w: 6, h: 5},
    {x: ox + 40, y: oy + 168, w: 48, h: 40},
    ~flip=#Vertical,
    (),
  ) //Bottom

  // Left Leg
  let ox = 398
  let oy = 622
  Generator.drawTextureLegacy(
    "Golem",
    {x: 65, y: 5, w: 6, h: 16},
    {x: ox + 40, y: oy + 40, w: 48, h: 128},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 71, y: 5, w: 5, h: 16},
    {x: ox + 88, y: oy + 40, w: 40, h: 128},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 76, y: 5, w: 6, h: 16},
    {x: ox + 128, y: oy + 40, w: 48, h: 128},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 60, y: 5, w: 5, h: 16},
    {x: ox + 0, y: oy + 40, w: 40, h: 128},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 65, y: 0, w: 6, h: 5},
    {x: ox + 40, y: oy + 0, w: 48, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 71, y: 0, w: 6, h: 5},
    {x: ox + 40, y: oy + 168, w: 48, h: 40},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right Arm
  let ox = 29
  let oy = 493
  Generator.drawTextureLegacy(
    "Golem",
    {x: 66, y: 27, w: 4, h: 30},
    {x: ox + 48, y: oy + 48, w: 32, h: 240},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 70, y: 27, w: 6, h: 30},
    {x: ox + 80, y: oy + 48, w: 48, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 76, y: 27, w: 4, h: 30},
    {x: ox + 128, y: oy + 48, w: 32, h: 240},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 60, y: 27, w: 6, h: 30},
    {x: ox + 0, y: oy + 48, w: 48, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 66, y: 21, w: 4, h: 6},
    {x: ox + 48, y: oy + 0, w: 32, h: 48},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 70, y: 21, w: 4, h: 6},
    {x: ox + 48, y: oy + 288, w: 32, h: 48},
    ~flip=#Vertical,
    (),
  ) //Bottom

  // Left Arm
  let ox = 216
  let oy = 493
  Generator.drawTextureLegacy(
    "Golem",
    {x: 66, y: 64, w: 4, h: 30},
    {x: ox + 48, y: oy + 48, w: 32, h: 240},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 70, y: 64, w: 6, h: 30},
    {x: ox + 80, y: oy + 48, w: 48, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 76, y: 64, w: 4, h: 30},
    {x: ox + 128, y: oy + 48, w: 32, h: 240},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 60, y: 64, w: 6, h: 30},
    {x: ox + 0, y: oy + 48, w: 48, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 66, y: 58, w: 4, h: 6},
    {x: ox + 48, y: oy + 0, w: 32, h: 48},
    (),
  ) //Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 70, y: 21, w: 4, h: 6},
    {x: ox + 48, y: oy + 288, w: 32, h: 48},
    ~flip=#Vertical,
    (),
  ) //Bottom

  // Nose

  let ox = 57
  let oy = 400
  Generator.drawTextureLegacy(
    "Golem",
    {x: 28, y: 2, w: 2, h: 4},
    {x: ox + 0, y: oy + 16, w: 16, h: 32},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Golem",
    {x: 26, y: 2, w: 2, h: 4},
    {x: ox + 16, y: oy + 16, w: 16, h: 32},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Golem",
    {x: 24, y: 2, w: 2, h: 4},
    {x: ox + 32, y: oy + 16, w: 16, h: 32},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Golem",
    {x: 30, y: 2, w: 2, h: 4},
    {x: ox + 48, y: oy + 16, w: 16, h: 32},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Golem",
    {x: 26, y: 0, w: 2, h: 2},
    {x: ox + 16, y: oy + 0, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Golem",
    {x: 28, y: 0, w: 2, h: 2},
    {x: ox + 16, y: oy + 48, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Flower
  let showFlower = Generator.hasTexture("Flower")
  if showFlower {
    let ox = 95
    let oy = 262
    Generator.drawTextureLegacy(
      "Flower",
      {x: 5, y: 5, w: 8, h: 11},
      {x: ox + 0, y: oy + 0, w: 64, h: 88},
      ~rotateLegacy=90.0,
      (),
    ) // Right Side
    Generator.drawTextureLegacy(
      "Flower",
      {x: 5, y: 5, w: 8, h: 11},
      {x: ox + 0, y: oy - 64, w: 64, h: 88},
      ~flip=#Horizontal,
      ~rotateLegacy=90.0,
      (),
    ) // Right Side
  }

  // Damage
  let showDamage = Generator.hasTexture("Damage")
  if showDamage {
    // Head
    let ox = 39
    let oy = 19
    Generator.drawTextureLegacy(
      "Damage",
      {x: 0, y: 8, w: 8, h: 10},
      {x: ox + 0, y: oy + 64, w: 64, h: 80},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Damage",
      {x: 8, y: 8, w: 8, h: 10},
      {x: ox + 64, y: oy + 64, w: 64, h: 80},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Damage",
      {x: 16, y: 8, w: 8, h: 10},
      {x: ox + 128, y: oy + 64, w: 64, h: 80},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 24, y: 8, w: 8, h: 10},
      {x: ox + 192, y: oy + 64, w: 64, h: 80},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 8, y: 0, w: 8, h: 8},
      {x: ox + 64, y: oy + 0, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 16, y: 0, w: 8, h: 8},
      {x: ox + 64, y: oy + 144, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Waist
    let ox = 325
    let oy = 77
    Generator.drawTextureLegacy(
      "Damage",
      {x: 6, y: 76, w: 9, h: 5},
      {x: ox + 48, y: oy + 48, w: 72, h: 40},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 15, y: 76, w: 6, h: 5},
      {x: ox + 120, y: oy + 48, w: 48, h: 40},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 0, y: 76, w: 6, h: 5},
      {x: ox + 0, y: oy + 48, w: 48, h: 40},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Damage",
      {x: 21, y: 76, w: 9, h: 5},
      {x: ox + 168, y: oy + 48, w: 72, h: 40},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 6, y: 70, w: 9, h: 6},
      {x: ox + 48, y: oy + 0, w: 72, h: 48},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 15, y: 70, w: 9, h: 6},
      {x: ox + 48, y: oy + 88, w: 72, h: 48},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Torso
    let ox = 120
    let oy = 198
    Generator.drawTextureLegacy(
      "Damage",
      {x: 11, y: 51, w: 18, h: 12},
      {x: ox + 88, y: oy + 88, w: 144, h: 96},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 29, y: 51, w: 11, h: 12},
      {x: ox + 232, y: oy + 88, w: 88, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 40, y: 51, w: 18, h: 12},
      {x: ox + 320, y: oy + 88, w: 144, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 0, y: 51, w: 11, h: 12},
      {x: ox + 0, y: oy + 88, w: 89, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Damage",
      {x: 11, y: 40, w: 18, h: 11},
      {x: ox + 88, y: oy + 0, w: 144, h: 88},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 29, y: 40, w: 18, h: 11},
      {x: ox + 88, y: oy + 184, w: 144, h: 88},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Right Leg
    let ox = 398
    let oy = 408
    Generator.drawTextureLegacy(
      "Damage",
      {x: 42, y: 5, w: 6, h: 16},
      {x: ox + 40, y: oy + 40, w: 48, h: 128},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 48, y: 5, w: 6, h: 16},
      {x: ox + 88, y: oy + 40, w: 40, h: 128},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 53, y: 5, w: 6, h: 16},
      {x: ox + 128, y: oy + 40, w: 48, h: 128},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 37, y: 5, w: 5, h: 16},
      {x: ox + 0, y: oy + 40, w: 40, h: 128},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Damage",
      {x: 42, y: 0, w: 6, h: 5},
      {x: ox + 40, y: oy + 0, w: 48, h: 40},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 48, y: 0, w: 6, h: 5},
      {x: ox + 40, y: oy + 168, w: 48, h: 40},
      ~flip=#Vertical,
      (),
    ) //Bottom

    // Left Leg
    let ox = 398
    let oy = 622
    Generator.drawTextureLegacy(
      "Damage",
      {x: 65, y: 5, w: 6, h: 16},
      {x: ox + 40, y: oy + 40, w: 48, h: 128},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 71, y: 5, w: 5, h: 16},
      {x: ox + 88, y: oy + 40, w: 40, h: 128},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 76, y: 5, w: 6, h: 16},
      {x: ox + 128, y: oy + 40, w: 48, h: 128},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 60, y: 5, w: 5, h: 16},
      {x: ox + 0, y: oy + 40, w: 40, h: 128},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 65, y: 0, w: 6, h: 5},
      {x: ox + 40, y: oy + 0, w: 48, h: 40},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 71, y: 0, w: 6, h: 5},
      {x: ox + 40, y: oy + 168, w: 48, h: 40},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Right Arm
    let ox = 29
    let oy = 493
    Generator.drawTextureLegacy(
      "Damage",
      {x: 66, y: 27, w: 4, h: 30},
      {x: ox + 48, y: oy + 48, w: 32, h: 240},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 70, y: 27, w: 6, h: 30},
      {x: ox + 80, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 76, y: 27, w: 4, h: 30},
      {x: ox + 128, y: oy + 48, w: 32, h: 240},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 60, y: 27, w: 6, h: 30},
      {x: ox + 0, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 66, y: 21, w: 4, h: 6},
      {x: ox + 48, y: oy + 0, w: 32, h: 48},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 70, y: 21, w: 4, h: 6},
      {x: ox + 48, y: oy + 288, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) //Bottom

    // Left Arm
    let ox = 216
    let oy = 493
    Generator.drawTextureLegacy(
      "Damage",
      {x: 66, y: 64, w: 4, h: 30},
      {x: ox + 48, y: oy + 48, w: 32, h: 240},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 70, y: 64, w: 6, h: 30},
      {x: ox + 80, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 76, y: 64, w: 4, h: 30},
      {x: ox + 128, y: oy + 48, w: 32, h: 240},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 60, y: 64, w: 6, h: 30},
      {x: ox + 0, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 66, y: 58, w: 4, h: 6},
      {x: ox + 48, y: oy + 0, w: 32, h: 48},
      (),
    ) //Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 70, y: 21, w: 4, h: 6},
      {x: ox + 48, y: oy + 288, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) //Bottom

    // Nose

    let ox = 57
    let oy = 400
    Generator.drawTextureLegacy(
      "Damage",
      {x: 28, y: 2, w: 2, h: 4},
      {x: ox + 0, y: oy + 16, w: 16, h: 32},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Damage",
      {x: 26, y: 2, w: 2, h: 4},
      {x: ox + 16, y: oy + 16, w: 16, h: 32},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Damage",
      {x: 24, y: 2, w: 2, h: 4},
      {x: ox + 32, y: oy + 16, w: 16, h: 32},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Damage",
      {x: 30, y: 2, w: 2, h: 4},
      {x: ox + 48, y: oy + 16, w: 16, h: 32},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Damage",
      {x: 26, y: 0, w: 2, h: 2},
      {x: ox + 16, y: oy + 0, w: 16, h: 16},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Damage",
      {x: 28, y: 0, w: 2, h: 2},
      {x: ox + 16, y: oy + 48, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }
  // Folds
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
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
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
