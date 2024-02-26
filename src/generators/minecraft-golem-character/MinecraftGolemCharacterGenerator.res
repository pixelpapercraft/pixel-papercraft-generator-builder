let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-golem-character"

let name = "Minecraft Golem Character"

let history = [
  "Originally developed by Wajy.",
  "06 Feb 2015 lostminer: Add user variables.",
  "13 Feb 2015 lostminer: Update to use new version of generator.",
  "19 Sep 2020 NinjolasNJM: Updated to use 1.8+ Skins, fixed bottom textures, and added the ability to choose from multiple flowers and damage cracks.",
  "17 Jul 2021 M16 - Updated generator photo.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
    {
      id: "Poppy",
      url: requireTexture("Flower-Poppy"),
      standardWidth: 16,
      standardHeight: 16,
    },
    {
      id: "Rose",
      url: requireTexture("Flower-Rose"),
      standardWidth: 16,
      standardHeight: 16,
    },
    {
      id: "Cyan Flower",
      url: requireTexture("Flower-Cyan"),
      standardWidth: 16,
      standardHeight: 16,
    },
    {
      id: "High",
      url: requireTexture("Damage-High"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Medium",
      url: requireTexture("Damage-Medium"),
      standardWidth: 128,
      standardHeight: 128,
    },
    {
      id: "Low",
      url: requireTexture("Damage-Low"),
      standardWidth: 128,
      standardHeight: 128,
    },
  ],
)

let steve = TextureMap.MinecraftCharacterLegacy.steve

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
    "Flower",
    {
      standardWidth: 16,
      standardHeight: 16,
      choices: ["Poppy", "Rose", "Cyan Flower"],
    },
  )

  Generator.defineTextureInput(
    "Damage",
    {
      standardWidth: 128,
      standardHeight: 128,
      choices: ["Low", "Medium", "High"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Overlay Region variables
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")

  Generator.defineRegionInput((39, 19, 256, 208), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((120, 198, 464, 272), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((398, 408, 176, 208), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })
  Generator.defineRegionInput((398, 622, 176, 208), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((29, 493, 160, 336), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((216, 493, 160, 336), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  let ox = 39
  let oy = 19
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: ox + 0, y: oy + 64, w: 64, h: 80},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: ox + 64, y: oy + 64, w: 64, h: 80},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: ox + 128, y: oy + 64, w: 64, h: 80},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: ox + 192, y: oy + 64, w: 64, h: 80},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: ox + 64, y: oy + 0, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: ox + 64, y: oy + 144, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Nose
  let ox = 57
  let oy = 400
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: ox + 0, y: oy + 16, w: 16, h: 32},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: ox + 16, y: oy + 16, w: 16, h: 32},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: ox + 32, y: oy + 16, w: 16, h: 32},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: ox + 48, y: oy + 16, w: 16, h: 32},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: ox + 16, y: oy + 0, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: ox + 16, y: oy + 48, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Waist
  let ox = 325
  let oy = 77
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 28, w: 8, h: 4},
    {x: ox + 48, y: oy + 48, w: 72, h: 40},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 28, w: 4, h: 4},
    {x: ox + 120, y: oy + 48, w: 48, h: 40},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 28, w: 4, h: 4},
    {x: ox + 0, y: oy + 48, w: 48, h: 40},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 28, w: 8, h: 4},
    {x: ox + 168, y: oy + 48, w: 72, h: 40},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: ox + 48, y: oy + 0, w: 72, h: 48},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 4, h: 4},
    {x: ox + 48, y: oy + 88, w: 72, h: 48},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Torso
  let ox = 120
  let oy = 198
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 8},
    {x: ox + 88, y: oy + 88, w: 144, h: 96},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 8},
    {x: ox + 232, y: oy + 88, w: 88, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 8},
    {x: ox + 320, y: oy + 88, w: 144, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 8},
    {x: ox + 0, y: oy + 88, w: 88, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: ox + 88, y: oy + 0, w: 144, h: 88},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: ox + 88, y: oy + 184, w: 144, h: 88},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Right Leg
  let ox = 398
  let oy = 408
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 12},
    {x: ox + 40, y: oy + 40, w: 48, h: 128},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 12},
    {x: ox + 88, y: oy + 40, w: 40, h: 128},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: ox + 128, y: oy + 40, w: 48, h: 128},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 12},
    {x: ox + 0, y: oy + 40, w: 40, h: 128},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: ox + 40, y: oy + 0, w: 48, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: ox + 40, y: oy + 168, w: 48, h: 40},
    ~flip=#Vertical,
    (),
  ) //Bottom

  //Left Leg
  let ox = 398
  let oy = 622
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 12},
    {x: ox + 40, y: oy + 40, w: 48, h: 128},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 12},
    {x: ox + 88, y: oy + 40, w: 40, h: 128},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: ox + 128, y: oy + 40, w: 48, h: 128},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 12},
    {x: ox + 0, y: oy + 40, w: 40, h: 128},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: ox + 40, y: oy + 0, w: 48, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: ox + 40, y: oy + 168, w: 48, h: 40},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Right Arm
  let ox = 29
  let oy = 493
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 3, h: 12},
      {x: ox + 48, y: oy + 48, w: 32, h: 240},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 12},
      {x: ox + 80, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 12},
      {x: ox + 128, y: oy + 48, w: 32, h: 240},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 12},
      {x: ox + 0, y: oy + 48, w: 48, h: 240},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: ox + 48, y: oy + 0, w: 32, h: 48},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 16, w: 3, h: 4},
      {x: ox + 48, y: oy + 288, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) //Bottom
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 4, h: 12},
      {x: ox + 48, y: oy + 48, w: 32, h: 240},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 20, w: 4, h: 12},
      {x: ox + 80, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 20, w: 4, h: 12},
      {x: ox + 128, y: oy + 48, w: 32, h: 240},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 12},
      {x: ox + 0, y: oy + 48, w: 48, h: 240},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: ox + 48, y: oy + 0, w: 32, h: 48},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 16, w: 4, h: 4},
      {x: ox + 48, y: oy + 288, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) //Bottom
  }

  //Left Arm
  let ox = 216
  let oy = 493
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 3, h: 12},
      {x: ox + 48, y: oy + 48, w: 32, h: 240},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 52, w: 4, h: 12},
      {x: ox + 80, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 12},
      {x: ox + 128, y: oy + 48, w: 32, h: 240},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 12},
      {x: ox + 0, y: oy + 48, w: 48, h: 240},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: ox + 48, y: oy + 0, w: 32, h: 48},
      (),
    ) //Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 48, w: 3, h: 4},
      {x: ox + 48, y: oy + 288, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) //Bottom
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 4, h: 12},
      {x: ox + 48, y: oy + 48, w: 32, h: 240},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 52, w: 4, h: 12},
      {x: ox + 80, y: oy + 48, w: 48, h: 240},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 52, w: 4, h: 12},
      {x: ox + 128, y: oy + 48, w: 32, h: 240},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 12},
      {x: ox + 0, y: oy + 48, w: 48, h: 240},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: ox + 48, y: oy + 0, w: 32, h: 48},
      (),
    ) //Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 48, w: 4, h: 4},
      {x: ox + 48, y: oy + 288, w: 32, h: 48},
      ~flip=#Vertical,
      (),
    ) //Bottom
  }

  // Overlays
  if !hideHelmet {
    // Helmet
    let ox = 39
    let oy = 19
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 8, h: 8},
      {x: ox + 0, y: oy + 64, w: 64, h: 80},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 8, w: 8, h: 8},
      {x: ox + 64, y: oy + 64, w: 64, h: 80},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 8, w: 8, h: 8},
      {x: ox + 128, y: oy + 64, w: 64, h: 80},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 8, w: 8, h: 8},
      {x: ox + 192, y: oy + 64, w: 64, h: 80},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 0, w: 8, h: 8},
      {x: ox + 64, y: oy + 0, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: ox + 64, y: oy + 144, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Nose Overlay
    let ox = 57
    let oy = 400
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: ox + 0, y: oy + 16, w: 16, h: 32},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: ox + 16, y: oy + 16, w: 16, h: 32},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: ox + 32, y: oy + 16, w: 16, h: 32},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: ox + 48, y: oy + 16, w: 16, h: 32},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: ox + 16, y: oy + 0, w: 16, h: 16},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: ox + 16, y: oy + 48, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideJacket {
    //Belt
    let ox = 325
    let oy = 77
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 44, w: 8, h: 4},
      {x: ox + 48, y: oy + 48, w: 72, h: 40},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 44, w: 4, h: 4},
      {x: ox + 120, y: oy + 48, w: 48, h: 40},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 44, w: 4, h: 4},
      {x: ox + 0, y: oy + 48, w: 48, h: 40},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 44, w: 8, h: 4},
      {x: ox + 168, y: oy + 48, w: 72, h: 40},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: ox + 48, y: oy + 0, w: 72, h: 48},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 4, h: 4},
      {x: ox + 48, y: oy + 88, w: 72, h: 48},
      ~flip=#Vertical,
      (),
    ) // Bottom

    //Jacket
    let ox = 120
    let oy = 198
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 8},
      {x: ox + 88, y: oy + 88, w: 144, h: 96},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 8},
      {x: ox + 232, y: oy + 88, w: 88, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 8},
      {x: ox + 320, y: oy + 88, w: 144, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 8},
      {x: ox + 0, y: oy + 88, w: 88, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: ox + 88, y: oy + 0, w: 144, h: 88},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: ox + 88, y: oy + 184, w: 144, h: 88},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideRightPant {
    //Right Pant
    let ox = 398
    let oy = 408
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 36, w: 4, h: 12},
      {x: ox + 40, y: oy + 40, w: 48, h: 128},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 36, w: 4, h: 12},
      {x: ox + 88, y: oy + 40, w: 40, h: 128},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 12},
      {x: ox + 128, y: oy + 40, w: 48, h: 128},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 4, h: 12},
      {x: ox + 0, y: oy + 40, w: 40, h: 128},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: ox + 40, y: oy + 0, w: 48, h: 40},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: ox + 40, y: oy + 168, w: 48, h: 40},
      ~flip=#Vertical,
      (),
    ) //Bottom
  }

  if !hideLeftPant {
    //Left Pant
    let ox = 398
    let oy = 622
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 52, w: 4, h: 12},
      {x: ox + 40, y: oy + 40, w: 48, h: 128},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 52, w: 4, h: 12},
      {x: ox + 88, y: oy + 40, w: 40, h: 128},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: ox + 128, y: oy + 40, w: 48, h: 128},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 4, h: 12},
      {x: ox + 0, y: oy + 40, w: 40, h: 128},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: ox + 40, y: oy + 0, w: 48, h: 40},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: ox + 40, y: oy + 168, w: 48, h: 40},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideRightSleeve {
    //Right Sleeve
    let ox = 29
    let oy = 493
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 3, h: 12},
        {x: ox + 48, y: oy + 48, w: 32, h: 240},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 12},
        {x: ox + 80, y: oy + 48, w: 48, h: 240},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 36, w: 3, h: 12},
        {x: ox + 128, y: oy + 48, w: 32, h: 240},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 12},
        {x: ox + 0, y: oy + 48, w: 48, h: 240},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 3, h: 4},
        {x: ox + 48, y: oy + 0, w: 32, h: 48},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 32, w: 3, h: 4},
        {x: ox + 48, y: oy + 288, w: 32, h: 48},
        ~flip=#Vertical,
        (),
      ) //Bottom
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 4, h: 12},
        {x: ox + 48, y: oy + 48, w: 32, h: 240},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 36, w: 4, h: 12},
        {x: ox + 80, y: oy + 48, w: 48, h: 240},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 36, w: 4, h: 12},
        {x: ox + 128, y: oy + 48, w: 32, h: 240},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 12},
        {x: ox + 0, y: oy + 48, w: 48, h: 240},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 4, h: 4},
        {x: ox + 48, y: oy + 0, w: 32, h: 48},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 32, w: 4, h: 4},
        {x: ox + 48, y: oy + 288, w: 32, h: 48},
        ~flip=#Vertical,
        (),
      ) //Bottom
    }
  }

  if !hideLeftSleeve {
    //Left Sleeve
    let ox = 216
    let oy = 493
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 3, h: 12},
        {x: ox + 48, y: oy + 48, w: 32, h: 240},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 52, w: 4, h: 12},
        {x: ox + 80, y: oy + 48, w: 48, h: 240},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 12},
        {x: ox + 128, y: oy + 48, w: 32, h: 240},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 12},
        {x: ox + 0, y: oy + 48, w: 48, h: 240},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 3, h: 4},
        {x: ox + 48, y: oy + 0, w: 32, h: 48},
        (),
      ) //Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 48, w: 3, h: 4},
        {x: ox + 48, y: oy + 288, w: 32, h: 48},
        ~flip=#Vertical,
        (),
      ) //Bottom
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 4, h: 12},
        {x: ox + 48, y: oy + 48, w: 32, h: 240},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 52, w: 4, h: 12},
        {x: ox + 80, y: oy + 48, w: 48, h: 240},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 60, y: 52, w: 4, h: 12},
        {x: ox + 128, y: oy + 48, w: 32, h: 240},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 12},
        {x: ox + 0, y: oy + 48, w: 48, h: 240},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 4, h: 4},
        {x: ox + 48, y: oy + 0, w: 32, h: 48},
        (),
      ) //Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 48, w: 4, h: 4},
        {x: ox + 48, y: oy + 288, w: 32, h: 48},
        ~flip=#Vertical,
        (),
      ) //Bottom
    }
  }

  //Flower

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

  //Damage
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
      {x: 15, y: 76, w: 9, h: 5},
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
