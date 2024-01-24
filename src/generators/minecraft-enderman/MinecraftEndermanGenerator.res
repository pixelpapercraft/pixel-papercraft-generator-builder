let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-enderman"

let name = "Minecraft Enderman"

let history = [
  "Originally developed by ODF.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "19 Sep 2020 NinjolasNJM - Fixed orientations of limbs.",
  "07 Jun 2021 NinjolasNJM - Converted to ReScript generator.",
  "17 Jul 2021 M16 - Updated generator photo.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Labels", "Folds"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Enderman",
    url: requireTexture("enderman"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Enderman Eyes",
    url: requireTexture("enderman_eyes"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Enderman", {standardWidth: 64, standardHeight: 32, choices: []})
  Generator.defineTextureInput(
    "Enderman Eyes",
    {standardWidth: 64, standardHeight: 32, choices: []},
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Background
  Generator.drawImage("Background", (0, 0))

  // Mouth
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 0, y: 24, w: 8, h: 8},
    {x: 74, y: 89, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 8, y: 24, w: 8, h: 8},
    {x: 138, y: 89, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 16, y: 24, w: 8, h: 8},
    {x: 202, y: 89, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 24, y: 24, w: 8, h: 8},
    {x: 266, y: 89, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 8, y: 16, w: 8, h: 8},
    {x: 138, y: 25, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 16, y: 16, w: 8, h: 8},
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Head
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 74, y: 89, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 138, y: 89, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 202, y: 89, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 266, y: 89, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 138, y: 25, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 32, y: 20, w: 4, h: 12},
    {x: 268, y: 233, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 36, y: 20, w: 8, h: 12},
    {x: 300, y: 233, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 44, y: 20, w: 4, h: 12},
    {x: 364, y: 233, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 48, y: 20, w: 8, h: 12},
    {x: 396, y: 233, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 36, y: 16, w: 8, h: 4},
    {x: 300, y: 201, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 44, y: 16, w: 8, h: 4},
    {x: 300, y: 329, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right arm
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 96, y: 399, w: 16, h: 240},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 112, y: 399, w: 16, h: 240},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 128, y: 399, w: 16, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 144, y: 399, w: 16, h: 240},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 112, y: 383, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 112, y: 639, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left arm
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 222, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 206, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 190, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 174, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 206, y: 383, w: 16, h: 16},
    ~flip=#Horizontal,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 222, y: 655, w: 16, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  // Right leg
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 276, y: 399, w: 16, h: 240},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 292, y: 399, w: 16, h: 240},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 308, y: 399, w: 16, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 324, y: 399, w: 16, h: 240},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 292, y: 383, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 292, y: 639, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 401, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 385, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 369, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 353, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 385, y: 383, w: 16, h: 16},
    ~flip=#Horizontal,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 401, y: 655, w: 16, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  //-------------------------------------------------------------//
  // FROM NOW ALL THE TEXTURES ARE FROM THE FILE "enderman_eyes" //
  //-------------------------------------------------------------//

  // Mouth
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 0, y: 24, w: 8, h: 8},
    {x: 74, y: 89, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 8, y: 24, w: 8, h: 8},
    {x: 138, y: 89, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 16, y: 24, w: 8, h: 8},
    {x: 202, y: 89, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 24, y: 24, w: 8, h: 8},
    {x: 266, y: 89, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 8, y: 16, w: 8, h: 8},
    {x: 138, y: 25, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 16, y: 16, w: 8, h: 8},
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Head
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 74, y: 89, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 138, y: 89, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 202, y: 89, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 266, y: 89, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 138, y: 25, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 32, y: 20, w: 4, h: 12},
    {x: 268, y: 233, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 36, y: 20, w: 8, h: 12},
    {x: 300, y: 233, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 44, y: 20, w: 4, h: 12},
    {x: 364, y: 233, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 48, y: 20, w: 8, h: 12},
    {x: 396, y: 233, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 36, y: 16, w: 8, h: 4},
    {x: 300, y: 201, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 44, y: 16, w: 8, h: 4},
    {x: 300, y: 329, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right arm
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 96, y: 399, w: 16, h: 240},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 112, y: 399, w: 16, h: 240},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 128, y: 399, w: 16, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 144, y: 399, w: 16, h: 240},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 112, y: 383, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 112, y: 639, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left arm
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 222, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 206, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 190, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 174, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 206, y: 383, w: 16, h: 16},
    ~flip=#Horizontal,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 222, y: 655, w: 16, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  // Right leg
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 276, y: 399, w: 16, h: 240},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 292, y: 399, w: 16, h: 240},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 308, y: 399, w: 16, h: 240},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 324, y: 399, w: 16, h: 240},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 292, y: 383, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 292, y: 639, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 56, y: 2, w: 2, h: 30},
    {x: 401, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 2, w: 2, h: 30},
    {x: 385, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 2, w: 2, h: 30},
    {x: 369, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 62, y: 2, w: 2, h: 30},
    {x: 353, y: 399, w: 16, h: 240},
    ~flip=#Horizontal,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 58, y: 0, w: 2, h: 2},
    {x: 385, y: 383, w: 16, h: 16},
    ~flip=#Horizontal,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Enderman Eyes",
    {x: 60, y: 0, w: 2, h: 2},
    {x: 401, y: 655, w: 16, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  // Fold Lines
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
