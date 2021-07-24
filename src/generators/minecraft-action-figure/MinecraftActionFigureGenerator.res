let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-action-figure"

let name = "Minecraft Action Figure"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let imageIds = ["Backgroundalex", "Backgroundsteve", "Foldsalex", "Foldssteve", "Labels", "Notch"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Hand Notches", false)
  //Generator.defineBooleanInput("Show Overlay", true)
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"

  let handNotches = Generator.getBooleanInputValue("Hand Notches")

  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  //let showOverlay = Generator.getBooleanInputValue("Show Overlay")

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
  Generator.defineRegionInput((35, 50, 192, 144), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((265, 211, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((425, 587, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((425, 162, 128, 208), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((265, 538, 128, 208), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  // Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 74, y: 790, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 74, y: 726, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 74, y: 662, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 74, y: 598, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 10, y: 726, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 138, y: 726, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    ~flip=#Vertical,
    (),
  ) // Bot

  //Neck
  Generator.drawTextureLegacy("Skin", {x: 16, y: 0, w: 8, h: 8}, {x: 36, y: 414, w: 64, h: 96}, ()) // Bot

  //Pelvis
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 163, y: 380, w: 32, h: 130},
    (),
  ) // Left Pelvis
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 131, y: 380, w: 32, h: 130},
    (),
  ) // Right Pelvis

  //Body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 16, w: 24, h: 16},
    {x: 35, y: 50, w: 192, h: 128},
    (),
  ) // Body
  Generator.drawTextureLegacy("Skin", {x: 0, y: 20, w: 4, h: 4}, {x: 35, y: 178, w: 32, h: 32}, ()) // Right hip
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 4},
    {x: 131, y: 178, w: 32, h: 32},
    (),
  ) // Left hip
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 67, y: 178, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bot

  // Arms

  if alexModel {
    //Left Arm
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
    ) //Left arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 12},
      {x: 273, y: 243, w: 24, h: 96},
      (),
    ) //Back Left Arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 121, w: 32, h: 32},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 86, w: 32, h: 32},
      (),
    ) //Left Shoulder Inside

    //Right Arm
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
    ) //Right Arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 4},
      {x: 489, y: 496, w: 32, h: 32},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 4},
      {x: 489, y: 462, w: 32, h: 32},
      (),
    ) //Right Shoulder Inside
  } else {
    //Left Arm
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
    ) //Left arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 52, w: 4, h: 12},
      {x: 265, y: 243, w: 32, h: 96},
      (),
    ) //Back Left Arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 121, w: 32, h: 32},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 86, w: 32, h: 32},
      (),
    ) //Left Shoulder Inside

    //Right Arm
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
    ) //Right Arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 20, w: 4, h: 4},
      {x: 489, y: 496, w: 32, h: 32},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 20, w: 4, h: 4},
      {x: 489, y: 462, w: 32, h: 32},
      (),
    ) //Right Shoulder Inside
  }
  // Legs

  //Left Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 48, w: 12, h: 16},
    {x: 457, y: 210, w: 96, h: 128},
    (),
  ) //Left Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 8},
    {x: 521, y: 210, w: 32, h: 64},
    ~rotateLegacy=180.0,
    (),
  ) //Left Buttock
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 425, y: 242, w: 32, h: 96},
    (),
  ) //Back Left Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 489, y: 338, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) //Left foot

  //Right Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 16, w: 16, h: 16},
    {x: 265, y: 586, w: 128, h: 128},
    (),
  ) //Right Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 8},
    {x: 329, y: 586, w: 32, h: 64},
    ~rotateLegacy=180.0,
    (),
  ) //Right Buttock
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 297, y: 714, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) //Right foot

  //Overlay
  if !hideHelmet {
    // Helmet
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 8, h: 8},
      {x: 74, y: 790, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 8, w: 8, h: 8},
      {x: 74, y: 726, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 8, w: 8, h: 8},
      {x: 74, y: 662, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 8, w: 8, h: 8},
      {x: 74, y: 598, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 0, w: 8, h: 8},
      {x: 10, y: 726, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 138, y: 726, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      ~flip=#Vertical,
      (),
    ) // Bot

    //Neck
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 36, y: 414, w: 64, h: 96},
      (),
    )
  } // Bot

  if !hideJacket {
    //Jacket
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 32, w: 24, h: 16},
      {x: 35, y: 50, w: 192, h: 128},
      (),
    ) // Jacket
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 67, y: 178, w: 64, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bot

  // Sleeves

  if alexModel {
    if !hideLeftSleeve {
      //Left Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 48, w: 3, h: 4},
        {x: 329, y: 338, w: 24, h: 32},
        ~flip=#Vertical,
        (),
      ) //Left Glove
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 48, w: 11, h: 16},
        {x: 297, y: 211, w: 88, h: 128},
        (),
      ) //Left Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 12},
        {x: 273, y: 243, w: 24, h: 96},
        (),
      ) //Back Left Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 121, w: 32, h: 32},
        (),
      ) //Left Shoulder Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 86, w: 32, h: 32},
        (),
      )
    } //Left Shoulder Sleeve Inside

    if !hideRightSleeve {
      //Right Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 32, w: 3, h: 4},
        {x: 465, y: 714, w: 24, h: 32},
        ~flip=#Vertical,
        (),
      ) //Right Glove
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 32, w: 14, h: 16},
        {x: 433, y: 587, w: 112, h: 128},
        (),
      ) //Right Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 4},
        {x: 489, y: 496, w: 32, h: 32},
        (),
      ) //Right Shoulder Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 4},
        {x: 489, y: 462, w: 32, h: 32},
        (),
      ) //Right Shoulder Sleeve Inside
    }
  } else {
    if !hideLeftSleeve {
      //Left Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 48, w: 4, h: 4},
        {x: 329, y: 338, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      ) //Left Glove
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 48, w: 12, h: 16},
        {x: 297, y: 211, w: 96, h: 128},
        (),
      ) //Left Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 60, y: 52, w: 4, h: 12},
        {x: 265, y: 243, w: 32, h: 96},
        (),
      ) //Back Left Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 121, w: 32, h: 32},
        (),
      ) //Left Shoulder Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 86, w: 32, h: 32},
        (),
      )
    } //Left Shoulder Sleeve Inside

    if !hideRightSleeve {
      //Right Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 32, w: 4, h: 4},
        {x: 457, y: 714, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      ) //Right Glove
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 32, w: 16, h: 16},
        {x: 425, y: 587, w: 128, h: 128},
        (),
      ) //Right Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 36, w: 4, h: 4},
        {x: 489, y: 496, w: 32, h: 32},
        (),
      ) //Right Shoulder Sleeve
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 36, w: 4, h: 4},
        {x: 489, y: 462, w: 32, h: 32},
        (),
      )
    } //Right Shoulder Sleeve Inside
  }
  // Pants

  if !hideLeftPant {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: 163, y: 380, w: 32, h: 130},
      (),
    ) // Left Pelvis

    //Left Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 48, w: 12, h: 16},
      {x: 457, y: 210, w: 96, h: 128},
      (),
    ) //Left Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 8},
      {x: 521, y: 210, w: 32, h: 64},
      ~rotateLegacy=180.0,
      (),
    ) //Left Buttock Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: 425, y: 242, w: 32, h: 96},
      (),
    ) //Back Left Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: 489, y: 338, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left foot Shoe

    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 52, w: 4, h: 4},
      {x: 131, y: 178, w: 32, h: 32},
      (),
    ) // Left Hip Pant
  }

  if !hideRightPant {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: 131, y: 380, w: 32, h: 130},
      (),
    ) // Right Pelvis

    //Right Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 32, w: 16, h: 16},
      {x: 265, y: 586, w: 128, h: 128},
      (),
    ) //Right Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 8},
      {x: 329, y: 586, w: 32, h: 64},
      ~rotateLegacy=180.0,
      (),
    ) //Right Buttock
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: 297, y: 714, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right foot

    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 4, h: 4},
      {x: 35, y: 178, w: 32, h: 32},
      (),
    ) // Right Hip Pant
  }

  // Background
  if alexModel {
    Generator.drawImage("Backgroundalex", (0, 0))
  } else {
    Generator.drawImage("Backgroundsteve", (0, 0))
  }

  // Folds
  if showFolds {
    if alexModel {
      Generator.drawImage("Foldsalex", (0, 0))
    } else {
      Generator.drawImage("Foldssteve", (0, 0))
    }
  }
  // Hand Notches
  if handNotches {
    if alexModel {
      Generator.drawImage("Notch", (341, 307)) // Front Left Notch
      Generator.drawImage("Notch", (285, 307)) // Back Left Notch
      Generator.drawImage("Notch", (477, 683)) // Front Right Notch
      Generator.drawImage("Notch", (533, 683)) // Back Right Notch
    } else {
      Generator.drawImage("Notch", (345, 307)) // Front Left Notch
      Generator.drawImage("Notch", (281, 307)) // Back Left Notch
      Generator.drawImage("Notch", (473, 683)) // Front Right Notch
      Generator.drawImage("Notch", (537, 683)) // Back Right Notch
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
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
