let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-villager-character"

let name = "Minecraft Villager Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail.jpg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Background",
    url: requireImage("Background"),
  },
  {
    id: "RobeCover",
    url: requireImage("RobeCover"),
  },
  {
    id: "Labels",
    url: requireImage("Labels"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacterLegacy.steve

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Background
  Generator.drawImage("Background", (0, 0))

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

  //Helmet
  Generator.drawTextureLegacy("Skin", {x: 32, y: 8, w: 32, h: 8}, {x: 22, y: 74, w: 256, h: 80}, ()) // HeadSides
  Generator.drawTextureLegacy("Skin", {x: 40, y: 0, w: 8, h: 8}, {x: 86, y: 10, w: 64, h: 64}, ()) // HeadRoof
  Generator.drawTextureLegacy("Skin", {x: 48, y: 0, w: 8, h: 8}, {x: 86, y: 154, w: 64, h: 64}, ()) // HeadNeck

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

  // Jacket
  Generator.drawTextureLegacy("Skin", {x: 20, y: 32, w: 8, h: 4}, {x: 373, y: 26, w: 64, h: 48}, ()) // Neck
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
  Generator.drawTextureLegacy("Skin", {x: 4, y: 32, w: 4, h: 4}, {x: 86, y: 240, w: 32, h: 32}, ()) // LegTop
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: 86, y: 368, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // LegBottom

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

  // LeftPant
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 52, w: 16, h: 12},
    {x: 178, y: 272, w: 128, h: 96},
    (),
  ) // LegSides
  Generator.drawTextureLegacy("Skin", {x: 4, y: 48, w: 4, h: 4}, {x: 210, y: 240, w: 32, h: 32}, ()) // LegTop
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 48, w: 4, h: 4},
    {x: 210, y: 368, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // LegBottom

  // RightArm
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 20, w: 16, h: 6},
    {x: 21, y: 451, w: 128, h: 64},
    (),
  ) // ArmSides
  Generator.drawTextureLegacy("Skin", {x: 44, y: 16, w: 4, h: 4}, {x: 53, y: 419, w: 32, h: 32}, ()) // ArmShoulder
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 24, w: 4, h: 3},
    {x: 53, y: 547, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // ArmElbow

  // RightSleeve
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 36, w: 16, h: 6},
    {x: 21, y: 451, w: 128, h: 64},
    (),
  ) // ArmSides
  Generator.drawTextureLegacy("Skin", {x: 44, y: 32, w: 4, h: 4}, {x: 53, y: 419, w: 32, h: 32}, ()) // ArmShoulder
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 40, w: 4, h: 3},
    {x: 53, y: 547, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // ArmElbow

  // LeftArm
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

  // Hands
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 28, w: 4, h: 4},
    {x: 373, y: 332, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightFist
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 60, w: 4, h: 4},
    {x: 437, y: 300, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // LeftFist
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 24, w: 4, h: 4},
    {x: 341, y: 332, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightArmPit
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 56, w: 4, h: 4},
    {x: 469, y: 300, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // LeftArmPit
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 28, w: 4, h: 4},
    {x: 373, y: 300, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightThumb
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 60, w: 4, h: 4},
    {x: 437, y: 268, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // LeftThumb
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 28, w: 4, h: 4},
    {x: 373, y: 364, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightPinkie
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
    {x: 52, y: 28, w: 4, h: 4},
    {x: 533, y: 300, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // RightPalm

  // Hands Overlay
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 44, w: 4, h: 4},
    {x: 373, y: 332, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightFist
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 60, w: 4, h: 4},
    {x: 437, y: 300, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // LeftFist
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 40, w: 4, h: 4},
    {x: 341, y: 332, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightArmPit
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 56, w: 4, h: 4},
    {x: 469, y: 300, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // LeftArmPit
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 44, w: 4, h: 4},
    {x: 373, y: 300, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightThumb
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 60, w: 4, h: 4},
    {x: 437, y: 268, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // LeftThumb
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 44, w: 4, h: 4},
    {x: 373, y: 364, w: 32, h: 32},
    ~rotateLegacy=270.0,
    (),
  ) // RightPinkie
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
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 44, w: 4, h: 4},
    {x: 533, y: 300, w: 32, h: 32},
    ~rotateLegacy=90.0,
    (),
  ) // RightPalm

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

  // Robe2
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

  // RobeCoverNEEDED
  Generator.drawImage("RobeCover", (0, 0))

  //Labels
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
