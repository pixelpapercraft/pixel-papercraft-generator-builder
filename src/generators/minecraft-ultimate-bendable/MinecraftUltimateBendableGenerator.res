let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-ultimate-bendable"

let name = "Minecraft Bendable Character"

let history = [
  "Originally Developed by rooterbuster.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "22 Nov 2018 NinjolasNJM - Fixed rotations of tops and bottoms and the placement of arm textures, and made compatible with 1.8+ skins.",
  "30 Aug 2020 NinjolasNJM - Fixed a few more things such as the rotation of the bottom of the head and the bottom of the waist using the wrong textures, changed the tubes and tabs to look better on more skins, and updated the code comments.",
  "06 Jun 2021 NinjolasNJM - Converted to ReScript generator, and fixed the lines on the head.",
  "02 Feb 2024 NinjolasNJM - added skin input.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let video: Generator.videoDef = {url: "https://www.youtube.com/embed/CyYn66Zm5n0?rel=0"}

let imageIds = [
  "Background-Steve",
  "Background-Alex",
  "Colors-Steve",
  "Colors-Alex",
  "Folds-Steve",
  "Folds-Alex",
  "Labels",
]
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
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Color Codes", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  //let showOverlay = Generator.getBooleanInputValue("Show Overlay")
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showColorCodes = Generator.getBooleanInputValue("Show Color Codes")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")

  // Define regions
  Generator.defineRegionInput((10, 534, 192, 256), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((35, 50, 192, 328), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((265, 50, 128, 320), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((425, 426, 128, 320), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((425, 10, 128, 360), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((265, 386, 128, 360), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  // Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 74, y: 790, w: 64, h: 64},
    ~rotateLegacy=270.0,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 74, y: 726, w: 64, h: 64},
    ~rotateLegacy=270.0,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 74, y: 662, w: 64, h: 64},
    ~rotateLegacy=270.0,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 74, y: 598, w: 64, h: 64},
    ~rotateLegacy=270.0,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 10, y: 726, w: 64, h: 64},
    ~rotateLegacy=270.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 138, y: 726, w: 64, h: 64},
    ~flip=#Vertical,
    ~rotateLegacy=270.0,
    (),
  ) // Bot

  //neck
  Generator.drawTextureLegacy("Skin", {x: 16, y: 0, w: 8, h: 8}, {x: 36, y: 414, w: 64, h: 96}, ()) // Neck

  // Chest
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 16, w: 24, h: 14},
    {x: 35, y: 50, w: 192, h: 112},
    (),
  ) // Chest
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 24, w: 8, h: 6},
    {x: 131, y: 204, w: 64, h: 48},
    ~rotateLegacy=180.0,
    (),
  ) // Vertebra

  // Spine
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 24, w: 8, h: 4},
    {x: 163, y: 143, w: 64, h: 128},
    (),
  ) // Spine

  //Waist
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 24, w: 16, h: 8},
    {x: 99, y: 282, w: 128, h: 64},
    (),
  ) // Waist
  Generator.drawTextureLegacy("Skin", {x: 32, y: 28, w: 8, h: 4}, {x: 35, y: 314, w: 64, h: 32}, ()) // Back Waist
  Generator.drawTextureLegacy("Skin", {x: 0, y: 20, w: 4, h: 4}, {x: 99, y: 346, w: 32, h: 32}, ()) // Right Hip
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 4},
    {x: 195, y: 346, w: 32, h: 32},
    (),
  ) // Left Hip

  //Pelvis
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 131, y: 380, w: 64, h: 130},
    (),
  ) //Pelvis

  // Left Arm
  if alexModel {
    //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 14, h: 8},
      {x: 273, y: 82, w: 112, h: 64},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: 361, y: 58, w: 24, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) //Left Scapula
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 56, w: 3, h: 4},
      {x: 328, y: 194, w: 24, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Left Elbow

    //Left Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 48, w: 3, h: 4},
      {x: 329, y: 338, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left Hand
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 48, w: 11, h: 16},
      {x: 297, y: 211, w: 88, h: 128},
      (),
    ) //Left Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 12},
      {x: 273, y: 243, w: 24, h: 96},
      (),
    ) //Back Left Forearm

    //Left Elbow
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 3, h: 4},
      {x: 361, y: 138, w: 24, h: 128},
      (),
    ) //Left Elbow
  } else {
    //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 16, h: 8},
      {x: 265, y: 82, w: 128, h: 64},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: 361, y: 50, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) //Left Scapula
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 56, w: 4, h: 4},
      {x: 328, y: 194, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Left Elbow

    //Left Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 48, w: 4, h: 4},
      {x: 329, y: 338, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left Hand
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 48, w: 12, h: 16},
      {x: 297, y: 211, w: 96, h: 128},
      (),
    ) //Left Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 52, w: 4, h: 12},
      {x: 265, y: 243, w: 32, h: 96},
      (),
    ) //Back Left Forearm

    //Left Elbow
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 4, h: 4},
      {x: 361, y: 138, w: 32, h: 128},
      (),
    ) //Left Elbow
  }

  // Right Arm
  if alexModel {
    //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 11, h: 8},
      {x: 457, y: 458, w: 88, h: 64},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 12},
      {x: 433, y: 458, w: 24, h: 96},
      (),
    ) //Back Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: 457, y: 458, w: 24, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) //Right Scapula
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 24, w: 3, h: 4},
      {x: 513, y: 570, w: 24, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Right Elbow

    //Right Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 16, w: 3, h: 4},
      {x: 465, y: 714, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right Hand
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 16, w: 14, h: 16},
      {x: 433, y: 587, w: 112, h: 128},
      (),
    ) //Right Forearm

    //Right Elbow
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 3, h: 4},
      {x: 433, y: 514, w: 24, h: 128},
      (),
    ) //Right Elbow
  } else {
    //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 12, h: 8},
      {x: 457, y: 458, w: 96, h: 64},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 20, w: 4, h: 12},
      {x: 425, y: 458, w: 32, h: 96},
      (),
    ) //Back Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: 457, y: 458, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) //Right Scapula
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 24, w: 4, h: 4},
      {x: 521, y: 570, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Right Elbow

    //Right Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 16, w: 4, h: 4},
      {x: 457, y: 714, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right Hand
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 16, w: 16, h: 16},
      {x: 425, y: 587, w: 128, h: 128},
      (),
    ) //Right Forearm

    //Right Elbow
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 4, h: 4},
      {x: 425, y: 514, w: 32, h: 128},
      (),
    ) //Right Elbow
  }

  //Left Thigh
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 48, w: 16, h: 16},
    {x: 425, y: 41, w: 128, h: 128},
    (),
  ) //Left Thigh
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 4},
    {x: 489, y: 41, w: 32, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) //Left Buttock
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 56, w: 4, h: 4},
    {x: 489, y: 194, w: 32, h: 48},
    ~rotateLegacy=180.0,
    (),
  ) //Left Hamstring

  //Left Calf
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 48, w: 12, h: 16},
    {x: 457, y: 210, w: 96, h: 128},
    (),
  ) //Left Calf
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 425, y: 242, w: 32, h: 96},
    (),
  ) //Back Left Calf
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 489, y: 338, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) //Left Foot

  //Left Knee
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 56, w: 4, h: 4},
    {x: 521, y: 138, w: 32, h: 128},
    (),
  ) //Left Knee

  //Right Thigh
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 16, w: 16, h: 16},
    {x: 297, y: 418, w: 128, h: 128},
    (),
  ) //Right Thigh
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: 265, y: 450, w: 32, h: 96},
    (),
  ) //Right Back Thigh
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 4},
    {x: 361, y: 418, w: 32, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) //Right Buttock
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 24, w: 4, h: 4},
    {x: 361, y: 570, w: 32, h: 48},
    ~rotateLegacy=180.0,
    (),
  ) //Right Hamstring

  //Right Calf
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 16, w: 16, h: 16},
    {x: 265, y: 586, w: 128, h: 128},
    (),
  ) //Right Calf
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 297, y: 714, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) //Right Foot

  //Right Knee
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 24, w: 4, h: 4},
    {x: 265, y: 514, w: 32, h: 128},
    (),
  ) //Right Knee

  //Overlay

  if !hideHelmet {
    // Head
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 8, h: 8},
      {x: 74, y: 790, w: 64, h: 64},
      ~rotateLegacy=270.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 8, w: 8, h: 8},
      {x: 74, y: 726, w: 64, h: 64},
      ~rotateLegacy=270.0,
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 8, w: 8, h: 8},
      {x: 74, y: 662, w: 64, h: 64},
      ~rotateLegacy=270.0,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 8, w: 8, h: 8},
      {x: 74, y: 598, w: 64, h: 64},
      ~rotateLegacy=270.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 0, w: 8, h: 8},
      {x: 10, y: 726, w: 64, h: 64},
      ~rotateLegacy=270.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 138, y: 726, w: 64, h: 64},
      ~flip=#Vertical,
      ~rotateLegacy=270.0,
      (),
    ) // Bot

    //neck
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 36, y: 414, w: 64, h: 96},
      (),
    )
  } // Neck

  if !hideJacket {
    // Chest
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 32, w: 24, h: 14},
      {x: 35, y: 50, w: 192, h: 112},
      (),
    ) // Chest
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 40, w: 8, h: 6},
      {x: 131, y: 204, w: 64, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) // Vertebra

    // Spine
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 40, w: 8, h: 4},
      {x: 163, y: 143, w: 64, h: 128},
      (),
    ) // Spine

    //Waist
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 40, w: 16, h: 8},
      {x: 99, y: 282, w: 128, h: 64},
      (),
    ) // Waist
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 44, w: 8, h: 4},
      {x: 35, y: 314, w: 64, h: 32},
      (),
    ) // Back Waist
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 4, h: 4},
      {x: 99, y: 346, w: 32, h: 32},
      (),
    ) // Right Hip
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 52, w: 4, h: 4},
      {x: 195, y: 346, w: 32, h: 32},
      (),
    ) // Left Hip

    //Pelvis
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 131, y: 380, w: 64, h: 130},
      (),
    )
  } //Pelvis

  // Left Arm
  if alexModel {
    if !hideLeftSleeve {
      //Left Shoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 14, h: 8},
        {x: 273, y: 82, w: 112, h: 64},
        (),
      ) //Left Shoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 3, h: 4},
        {x: 361, y: 58, w: 24, h: 32},
        ~rotateLegacy=90.0,
        (),
      ) //Left Scapula
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 56, w: 3, h: 4},
        {x: 328, y: 194, w: 24, h: 48},
        ~rotateLegacy=180.0,
        (),
      ) //Left Elbow

      //Left Forearm
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 48, w: 3, h: 4},
        {x: 329, y: 338, w: 24, h: 32},
        ~flip=#Vertical,
        (),
      ) //Left Hand
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 48, w: 11, h: 16},
        {x: 297, y: 211, w: 88, h: 128},
        (),
      ) //Left Forearm
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 12},
        {x: 273, y: 243, w: 24, h: 96},
        (),
      ) //Back Left Forearm

      //Left Elbow
      Generator.drawTextureLegacy(
        "Skin",
        {x: 36, y: 56, w: 3, h: 4},
        {x: 361, y: 138, w: 24, h: 128},
        (),
      ) //Left Elbow
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 56, w: 3, h: 4},
        {x: 361, y: 138, w: 24, h: 128},
        (),
      ) //Left Elbow
    }
  } else if !hideLeftSleeve {
    //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 52, w: 16, h: 8},
      {x: 265, y: 82, w: 128, h: 64},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 48, w: 4, h: 4},
      {x: 361, y: 50, w: 32, h: 32},
      ~rotateLegacy=90.0,
      (),
    ) //Left Scapula
    Generator.drawTextureLegacy(
      "Skin",
      {x: 60, y: 56, w: 4, h: 4},
      {x: 328, y: 194, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Left Elbow

    //Left Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 48, w: 4, h: 4},
      {x: 329, y: 338, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left Hand
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 48, w: 12, h: 16},
      {x: 297, y: 211, w: 96, h: 128},
      (),
    ) //Left Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 60, y: 52, w: 4, h: 12},
      {x: 265, y: 243, w: 32, h: 96},
      (),
    ) //Back Left Forearm

    //Left Elbow

    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 56, w: 4, h: 4},
      {x: 361, y: 138, w: 32, h: 128},
      (),
    ) //Left Elbow
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 56, w: 4, h: 4},
      {x: 361, y: 138, w: 32, h: 128},
      (),
    )
  }

  // Right Arm
  if alexModel {
    if !hideRightSleeve {
      //Right Shoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 11, h: 8},
        {x: 457, y: 458, w: 88, h: 64},
        (),
      ) //Right Shoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 36, w: 3, h: 12},
        {x: 433, y: 458, w: 24, h: 96},
        (),
      ) //Back Right Shoulder
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 3, h: 4},
        {x: 457, y: 458, w: 24, h: 32},
        ~rotateLegacy=270.0,
        (),
      ) //Right Scapula
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 40, w: 3, h: 4},
        {x: 513, y: 570, w: 24, h: 48},
        ~rotateLegacy=180.0,
        (),
      ) //Right Elbow

      //Right Forearm
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 32, w: 3, h: 4},
        {x: 465, y: 714, w: 24, h: 32},
        ~flip=#Vertical,
        (),
      ) //Right Hand
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 32, w: 14, h: 16},
        {x: 433, y: 587, w: 112, h: 128},
        (),
      ) //Right Forearm

      //Right Elbow
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 24, w: 3, h: 4},
        {x: 433, y: 514, w: 24, h: 128},
        (),
      ) //Right Elbow
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 40, w: 3, h: 4},
        {x: 433, y: 514, w: 24, h: 128},
        (),
      ) //Right Elbow
    }
  } else if !hideRightSleeve {
    //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 36, w: 12, h: 8},
      {x: 457, y: 458, w: 96, h: 64},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 36, w: 4, h: 12},
      {x: 425, y: 458, w: 32, h: 96},
      (),
    ) //Back Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 32, w: 4, h: 4},
      {x: 457, y: 458, w: 32, h: 32},
      ~rotateLegacy=270.0,
      (),
    ) //Right Scapula
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 40, w: 4, h: 4},
      {x: 521, y: 570, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Right Elbow

    //Right Forearm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 32, w: 4, h: 4},
      {x: 457, y: 714, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right Hand
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 32, w: 16, h: 16},
      {x: 425, y: 587, w: 128, h: 128},
      (),
    ) //Right Forearm

    //Right Elbow
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 24, w: 4, h: 4},
      {x: 425, y: 514, w: 32, h: 128},
      (),
    ) //Right Elbow

    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 40, w: 4, h: 4},
      {x: 425, y: 514, w: 32, h: 128},
      (),
    ) //Right Elbow
  }

  if !hideLeftPant {
    //Left Thigh
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 48, w: 16, h: 16},
      {x: 425, y: 41, w: 128, h: 128},
      (),
    ) //Left Thigh
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 4},
      {x: 489, y: 41, w: 32, h: 32},
      ~rotateLegacy=180.0,
      (),
    ) //Left Buttock
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 56, w: 4, h: 4},
      {x: 489, y: 194, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Left Hamstring
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 56, w: 4, h: 4},
      {x: 489, y: 194, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Left Hamstring

    //Left Calf
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 48, w: 12, h: 16},
      {x: 457, y: 210, w: 96, h: 128},
      (),
    ) //Left Calf
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: 425, y: 242, w: 32, h: 96},
      (),
    ) //Back Left Calf
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: 489, y: 338, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left Foot

    //Left Knee
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 56, w: 4, h: 4},
      {x: 521, y: 138, w: 32, h: 128},
      (),
    ) //Left Knee
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 56, w: 4, h: 4},
      {x: 521, y: 138, w: 32, h: 128},
      (),
    )
  } //Left Knee

  if !hideRightPant {
    //Right Thigh
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 32, w: 16, h: 16},
      {x: 297, y: 418, w: 128, h: 128},
      (),
    ) //Right Thigh
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 12},
      {x: 265, y: 450, w: 32, h: 96},
      (),
    ) //Right Back Thigh
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 4},
      {x: 361, y: 418, w: 32, h: 32},
      ~rotateLegacy=180.0,
      (),
    ) //Right Buttock
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 24, w: 4, h: 4},
      {x: 361, y: 570, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Right Hamstring
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 40, w: 4, h: 4},
      {x: 361, y: 570, w: 32, h: 48},
      ~rotateLegacy=180.0,
      (),
    ) //Right Hamstring

    //Right Calf
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 32, w: 16, h: 16},
      {x: 265, y: 586, w: 128, h: 128},
      (),
    ) //Right Calf
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: 297, y: 714, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right Foot

    //Right Knee
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 24, w: 4, h: 4},
      {x: 265, y: 514, w: 32, h: 128},
      (),
    ) //Right Knee
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 40, w: 4, h: 4},
      {x: 265, y: 514, w: 32, h: 128},
      (),
    ) //Right Knee
  }

  // Background
  if alexModel {
    Generator.drawImage("Background-Alex", (0, 0))
  } else {
    Generator.drawImage("Background-Steve", (0, 0))
  }

  // Folds
  if showFolds {
    if alexModel {
      Generator.drawImage("Folds-Alex", (0, 0))
    } else {
      Generator.drawImage("Folds-Steve", (0, 0))
    }
  }

  // Color Code
  if showColorCodes {
    if alexModel {
      Generator.drawImage("Colors-Alex", (0, 0))
    } else {
      Generator.drawImage("Colors-Steve", (0, 0))
    }
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
  video: Some(video),
  instructions: None,
  images,
  textures,
  script,
}
