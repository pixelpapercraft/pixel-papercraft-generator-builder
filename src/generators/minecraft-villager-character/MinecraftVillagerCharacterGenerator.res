let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-villager-character"

let name = "Minecraft Villager Character"

let history = [
  "Originally developed by Boe6Eod7Nty.",
  "06 Feb 2015 lostminer: Add user variables.",
  "13 Feb 2015 lostminer: Update to use new version of generator.",
  "18 Sep 2020 NinjolasNJM: Updated to use 1.8+ skins.",
  "02 Feb 2024 NinjolasNJM - added skin input.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v3-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = MinecraftSkins.skins

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

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")

  Generator.defineRegionInput((22, 10, 256, 208), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((325, 26, 224, 192), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((173, 419, 128, 128), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((21, 419, 128, 128), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((178, 240, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((22, 240, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  // Nose1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 11, y: 13, w: 1, h: 1},
    {x: 381, y: 446, w: 16, h: 16},
    (),
  ) //NoseTop
  Generator.drawTextureLegacy(
    "Skin",
    {x: 11, y: 13, w: 1, h: 1},
    {x: 365, y: 462, w: 16, h: 32},
    (),
  ) //RightSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 11, y: 13, w: 1, h: 1},
    {x: 397, y: 462, w: 16, h: 32},
    (),
  ) //LeftSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: 381, y: 462, w: 16, h: 32},
    (),
  ) //NoseFront
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: 413, y: 462, w: 16, h: 32},
    (),
  ) //NoseBack
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 13, w: 1, h: 1},
    {x: 381, y: 494, w: 16, h: 16},
    (),
  ) //NoseBottom

  // Nose2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 11, y: 14, w: 1, h: 1},
    {x: 483, y: 446, w: 16, h: 16},
    (),
  ) //NoseTop
  Generator.drawTextureLegacy(
    "Skin",
    {x: 11, y: 14, w: 1, h: 1},
    {x: 467, y: 462, w: 16, h: 32},
    (),
  ) //RightSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 11, y: 14, w: 1, h: 1},
    {x: 499, y: 462, w: 16, h: 32},
    (),
  ) //LeftSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 14, w: 1, h: 1},
    {x: 483, y: 462, w: 16, h: 32},
    (),
  ) //NoseFront
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 14, w: 1, h: 1},
    {x: 515, y: 462, w: 16, h: 32},
    (),
  ) //NoseBack
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 14, w: 1, h: 1},
    {x: 483, y: 494, w: 16, h: 16},
    (),
  ) //NoseBottom

  // Head
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 32, h: 8}, {x: 22, y: 74, w: 256, h: 80}, ()) // HeadSides
  Generator.drawTextureLegacy("Skin", {x: 8, y: 0, w: 8, h: 8}, {x: 86, y: 10, w: 64, h: 64}, ()) // HeadRoof
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 86, y: 154, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // HeadNeck

  if !hideHelmet {
    // Nose1
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 13, w: 1, h: 1},
      {x: 381, y: 446, w: 16, h: 16},
      (),
    ) //NoseTop
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 13, w: 1, h: 1},
      {x: 365, y: 462, w: 16, h: 32},
      (),
    ) //RightSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 13, w: 1, h: 1},
      {x: 397, y: 462, w: 16, h: 32},
      (),
    ) //LeftSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: 381, y: 462, w: 16, h: 32},
      (),
    ) //NoseFront
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: 413, y: 462, w: 16, h: 32},
      (),
    ) //NoseBack
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 13, w: 1, h: 1},
      {x: 381, y: 494, w: 16, h: 16},
      (),
    ) //NoseBottom

    // Nose2
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 14, w: 1, h: 1},
      {x: 483, y: 446, w: 16, h: 16},
      (),
    ) //NoseTop
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 14, w: 1, h: 1},
      {x: 467, y: 462, w: 16, h: 32},
      (),
    ) //RightSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 14, w: 1, h: 1},
      {x: 499, y: 462, w: 16, h: 32},
      (),
    ) //LeftSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 14, w: 1, h: 1},
      {x: 483, y: 462, w: 16, h: 32},
      (),
    ) //NoseFront
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 14, w: 1, h: 1},
      {x: 515, y: 462, w: 16, h: 32},
      (),
    ) //NoseBack
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 14, w: 1, h: 1},
      {x: 483, y: 494, w: 16, h: 16},
      (),
    ) //NoseBottom

    //Helmet
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 32, h: 8},
      {x: 22, y: 74, w: 256, h: 80},
      (),
    ) // HeadSides
    Generator.drawTextureLegacy("Skin", {x: 40, y: 0, w: 8, h: 8}, {x: 86, y: 10, w: 64, h: 64}, ()) // HeadRoof
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 86, y: 154, w: 64, h: 64},
      (),
    ) // HeadNeck
  }

  // Body
  Generator.drawTextureLegacy("Skin", {x: 20, y: 16, w: 8, h: 4}, {x: 373, y: 26, w: 64, h: 48}, ()) // Neck
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 373, y: 170, w: 64, h: 48},
    // {flip: "waist"},
    (),
  ) // Waist
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 325, y: 74, w: 48, h: 96},
    (),
  ) // RightSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 437, y: 74, w: 48, h: 96},
    (),
  ) // LeftSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 373, y: 74, w: 64, h: 96},
    (),
  ) // Chest
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 485, y: 74, w: 64, h: 96},
    (),
  ) // Back

  if !hideJacket {
    // Jacket
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: 373, y: 26, w: 64, h: 48},
      (),
    ) // Neck
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 373, y: 170, w: 64, h: 48},
      // {flip: "waist"},
      (),
    ) // Waist
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: 325, y: 74, w: 48, h: 96},
      (),
    ) // RightSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: 437, y: 74, w: 48, h: 96},
      (),
    ) // LeftSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: 373, y: 74, w: 64, h: 96},
      (),
    ) // Chest
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: 485, y: 74, w: 64, h: 96},
      (),
    ) // Back
  }

  // RightLeg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 12, h: 12},
    {x: 54, y: 272, w: 96, h: 96},
    (),
  ) // LegSides
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: 22, y: 272, w: 32, h: 96},
    (),
  ) // LegBack
  Generator.drawTextureLegacy("Skin", {x: 4, y: 16, w: 4, h: 4}, {x: 86, y: 240, w: 32, h: 32}, ()) // LegTop
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 86, y: 368, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // LegBottom

  if !hideRightPant {
    // RightPant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 12, h: 12},
      {x: 54, y: 272, w: 96, h: 96},
      (),
    ) // LegSides
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 12},
      {x: 22, y: 272, w: 32, h: 96},
      (),
    ) // LegBack
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: 86, y: 240, w: 32, h: 32},
      (),
    ) // LegTop
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: 86, y: 368, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // LegBottom
  }

  // LeftLeg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 16, h: 12},
    {x: 178, y: 272, w: 128, h: 96},
    (),
  ) // LegSides
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 210, y: 240, w: 32, h: 32},
    (),
  ) // LegTop
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 210, y: 368, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // LegBottom

  if !hideLeftPant {
    // LeftPant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 16, h: 12},
      {x: 178, y: 272, w: 128, h: 96},
      (),
    ) // LegSides
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: 210, y: 240, w: 32, h: 32},
      (),
    ) // LegTop
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: 210, y: 368, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // LegBottom
  }

  // Arms and Hands

  // RightArm
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 28, w: 3, h: 4},
      {x: 373, y: 332, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightFist

    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 3, h: 4},
      {x: 341, y: 332, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightArmPit

    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 28, w: 4, h: 4},
      {x: 373, y: 300, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightThumb

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 28, w: 4, h: 4},
      {x: 373, y: 364, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightPinkie

    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 28, w: 3, h: 4},
      {x: 533, y: 300, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // RightPalm

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 6},
      {x: 21, y: 451, w: 32, h: 64},
      (),
    ) // ArmRight
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 3, h: 6},
      {x: 53, y: 451, w: 32, h: 64},
      (),
    ) // ArmFront
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 6},
      {x: 85, y: 451, w: 32, h: 64},
      (),
    ) // ArmLeft
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 6},
      {x: 117, y: 451, w: 32, h: 64},
      (),
    ) // ArmBack
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: 53, y: 419, w: 32, h: 32},
      (),
    ) // ArmShoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 3, h: 3},
      {x: 53, y: 547, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // ArmElbow

    if !hideRightSleeve {
      // RightSleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 44, w: 3, h: 4},
        {x: 373, y: 332, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightFist

      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 40, w: 3, h: 4},
        {x: 341, y: 332, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightArmPit

      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 44, w: 4, h: 4},
        {x: 373, y: 300, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightThumb

      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 44, w: 4, h: 4},
        {x: 373, y: 364, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightPinkie

      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 44, w: 3, h: 4},
        {x: 533, y: 300, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // RightPalm
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 6},
        {x: 21, y: 451, w: 32, h: 64},
        (),
      ) // ArmRight
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 3, h: 6},
        {x: 53, y: 451, w: 32, h: 64},
        (),
      ) // ArmFront
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 6},
        {x: 85, y: 451, w: 32, h: 64},
        (),
      ) // ArmLeft
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 36, w: 3, h: 6},
        {x: 117, y: 451, w: 32, h: 64},
        (),
      ) // ArmBack
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 3, h: 4},
        {x: 53, y: 419, w: 32, h: 32},
        (),
      ) // ArmShoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 40, w: 3, h: 3},
        {x: 53, y: 547, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // ArmElbow
    }
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 28, w: 4, h: 4},
      {x: 373, y: 332, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightFist

    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 4, h: 4},
      {x: 341, y: 332, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightArmPit

    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 28, w: 4, h: 4},
      {x: 373, y: 300, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightThumb

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 28, w: 4, h: 4},
      {x: 373, y: 364, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // RightPinkie

    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 28, w: 4, h: 4},
      {x: 533, y: 300, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // RightPalm

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 16, h: 6},
      {x: 21, y: 451, w: 128, h: 64},
      (),
    ) // ArmSides
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: 53, y: 419, w: 32, h: 32},
      (),
    ) // ArmShoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 4, h: 3},
      {x: 53, y: 547, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // ArmElbow

    if !hideRightSleeve {
      // RightSleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 16, h: 6},
        {x: 21, y: 451, w: 128, h: 64},
        (),
      ) // ArmSides
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 4, h: 4},
        {x: 53, y: 419, w: 32, h: 32},
        (),
      ) // ArmShoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 40, w: 4, h: 3},
        {x: 53, y: 547, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // ArmElbow

      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 44, w: 4, h: 4},
        {x: 373, y: 332, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightFist

      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 40, w: 4, h: 4},
        {x: 341, y: 332, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightArmPit

      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 44, w: 4, h: 4},
        {x: 373, y: 300, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightThumb

      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 44, w: 4, h: 4},
        {x: 373, y: 364, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // RightPinkie

      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 44, w: 4, h: 4},
        {x: 533, y: 300, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // RightPalm
    }
  }

  // LeftArm
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 60, w: 3, h: 4},
      {x: 437, y: 300, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftFist
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 3, h: 4},
      {x: 469, y: 300, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftArmPit
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 60, w: 4, h: 4},
      {x: 437, y: 268, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftThumb
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 60, w: 4, h: 4},
      {x: 437, y: 332, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftPinkie
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 60, w: 3, h: 4},
      {x: 469, y: 332, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // LeftPalm

    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 6},
      {x: 205, y: 451, w: 32, h: 64},
      (),
    ) // ArmRight
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 3, h: 6},
      {x: 237, y: 451, w: 32, h: 64},
      (),
    ) // ArmFront
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 52, w: 4, h: 6},
      {x: 269, y: 451, w: 32, h: 64},
      (),
    ) // ArmLeft
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 6},
      {x: 173, y: 451, w: 32, h: 64},
      (),
    ) // ArmBack
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: 237, y: 419, w: 32, h: 32},
      (),
    ) // ArmShoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 3, h: 3},
      {x: 269, y: 515, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // ArmElbow

    if !hideLeftSleeve {
      // LeftSleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 60, w: 3, h: 4},
        {x: 437, y: 300, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftFist
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 56, w: 3, h: 4},
        {x: 469, y: 300, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftArmPit
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 60, w: 4, h: 4},
        {x: 437, y: 268, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftThumb
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 60, w: 4, h: 4},
        {x: 437, y: 332, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftPinkie
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 60, w: 3, h: 4},
        {x: 469, y: 332, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // LeftPalm
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 6},
        {x: 205, y: 451, w: 32, h: 64},
        (),
      ) // ArmRight
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 3, h: 6},
        {x: 237, y: 451, w: 32, h: 64},
        (),
      ) // ArmFront
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 52, w: 4, h: 6},
        {x: 269, y: 451, w: 32, h: 64},
        (),
      ) // ArmLeft
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 6},
        {x: 173, y: 451, w: 32, h: 64},
        (),
      ) // ArmBack
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 3, h: 4},
        {x: 237, y: 419, w: 32, h: 32},
        (),
      ) // ArmShoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 56, w: 3, h: 3},
        {x: 269, y: 515, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // ArmElbow
    }
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 60, w: 4, h: 4},
      {x: 437, y: 300, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftFist
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 4, h: 4},
      {x: 469, y: 300, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftArmPit
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 60, w: 4, h: 4},
      {x: 437, y: 268, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftThumb
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 60, w: 4, h: 4},
      {x: 437, y: 332, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // LeftPinkie
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 60, w: 4, h: 4},
      {x: 469, y: 332, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) // LeftPalm

    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 12, h: 6},
      {x: 205, y: 451, w: 96, h: 64},
      (),
    ) // ArmSides
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 52, w: 4, h: 6},
      {x: 173, y: 451, w: 32, h: 64},
      (),
    ) // ArmBack
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: 237, y: 419, w: 32, h: 32},
      (),
    ) // ArmShoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 4, h: 3},
      {x: 269, y: 515, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) // ArmElbow

    if !hideLeftSleeve {
      // LeftSleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 12, h: 6},
        {x: 205, y: 451, w: 96, h: 64},
        (),
      ) // ArmSides
      Generator.drawTextureLegacy(
        "Skin",
        {x: 60, y: 52, w: 4, h: 6},
        {x: 173, y: 451, w: 32, h: 64},
        (),
      ) // ArmBack
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 4, h: 4},
        {x: 237, y: 419, w: 32, h: 32},
        (),
      ) // ArmShoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 56, w: 4, h: 3},
        {x: 269, y: 515, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // ArmElbow

      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 60, w: 4, h: 4},
        {x: 437, y: 300, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftFist
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 56, w: 4, h: 4},
        {x: 469, y: 300, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftArmPit
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 60, w: 4, h: 4},
        {x: 437, y: 268, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftThumb
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 60, w: 4, h: 4},
        {x: 437, y: 332, w: 32, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) // LeftPinkie
      Generator.drawTextureLegacy(
        "Skin",
        {x: 60, y: 60, w: 4, h: 4},
        {x: 469, y: 332, w: 32, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) // LeftPalm
    }
  }

  // Robe1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 71, y: 583, w: 64, h: 160},
    (),
  ) //RobeFront
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 135, y: 583, w: 48, h: 160},
    (),
  ) //RobeLeftSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 23, y: 583, w: 48, h: 160},
    (),
  ) //RobeRightSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 183, y: 583, w: 64, h: 160},
    (),
  ) //RobeBack

  if !hideJacket {
    // Robe1 Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: 71, y: 583, w: 64, h: 160},
      (),
    ) //RobeFront
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: 135, y: 583, w: 48, h: 160},
      (),
    ) //RobeLeftSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: 23, y: 583, w: 48, h: 160},
      (),
    ) //RobeRightSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: 183, y: 583, w: 64, h: 160},
      (),
    ) //RobeBack
  }

  // Robe2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 407, y: 583, w: 48, h: 160},
    (),
  ) //RobeLeftSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 295, y: 583, w: 48, h: 160},
    (),
  ) //RobeRightSide
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 343, y: 583, w: 64, h: 160},
    (),
  ) //RobeFront
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 455, y: 583, w: 64, h: 160},
    (),
  ) //RobeBack

  if !hideJacket {
    // Robe2 Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: 407, y: 583, w: 48, h: 160},
      (),
    ) //RobeLeftSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: 295, y: 583, w: 48, h: 160},
      (),
    ) //RobeRightSide
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: 343, y: 583, w: 64, h: 160},
      (),
    ) //RobeFront
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: 455, y: 583, w: 64, h: 160},
      (),
    ) //RobeBack
  }

  // Background
  Generator.drawImage("Background", (0, 0))

  // Folds
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }

  //Labels
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
