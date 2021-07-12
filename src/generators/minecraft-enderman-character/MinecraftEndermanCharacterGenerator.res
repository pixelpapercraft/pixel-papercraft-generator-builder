let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-enderman-character"

let name = "Minecraft Enderman Character"

let images: array<Generator.imageDef> = [
  {
    id: "Background",
    url: requireImage("Background"),
  },
  {
    id: "Folds",
    url: requireImage("Folds"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let script = () => {
  // Define input textures
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 8, h: 8}, {x: 74, y: 89, w: 64, h: 64}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 8, y: 8, w: 8, h: 8}, {x: 138, y: 89, w: 64, h: 64}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 16, y: 8, w: 8, h: 8}, {x: 202, y: 89, w: 64, h: 64}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 24, y: 8, w: 8, h: 8}, {x: 266, y: 89, w: 64, h: 64}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 8, y: 0, w: 8, h: 8}, {x: 138, y: 25, w: 64, h: 64}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Hat layer
  Generator.drawTextureLegacy("Skin", {x: 32, y: 8, w: 8, h: 8}, {x: 74, y: 89, w: 64, h: 64}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 40, y: 8, w: 8, h: 8}, {x: 138, y: 89, w: 64, h: 64}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 48, y: 8, w: 8, h: 8}, {x: 202, y: 89, w: 64, h: 64}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 56, y: 8, w: 8, h: 8}, {x: 266, y: 89, w: 64, h: 64}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 40, y: 0, w: 8, h: 8}, {x: 138, y: 25, w: 64, h: 64}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 0, w: 8, h: 8},
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 268, y: 233, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 300, y: 233, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 364, y: 233, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 396, y: 233, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 300, y: 201, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 300, y: 329, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Jacket
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 36, w: 4, h: 12},
    {x: 268, y: 233, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 36, w: 8, h: 12},
    {x: 300, y: 233, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 36, w: 4, h: 12},
    {x: 364, y: 233, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 36, w: 8, h: 12},
    {x: 396, y: 233, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 32, w: 8, h: 4},
    {x: 300, y: 201, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 32, w: 8, h: 4},
    {x: 300, y: 329, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right arm
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 20, w: 4, h: 12},
    {x: 96, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 20, w: 4, h: 12},
    {x: 112, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 20, w: 4, h: 12},
    {x: 128, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 20, w: 4, h: 12},
    {x: 144, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 16, w: 4, h: 4},
    {x: 112, y: 384, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 16, w: 4, h: 4},
    {x: 112, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right Sleeve
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 36, w: 4, h: 12},
    {x: 96, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 36, w: 4, h: 12},
    {x: 112, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 36, w: 4, h: 12},
    {x: 128, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 36, w: 4, h: 12},
    {x: 144, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 32, w: 4, h: 4},
    {x: 112, y: 384, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 32, w: 4, h: 4},
    {x: 112, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left arm
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 52, w: 4, h: 12},
    {x: 190, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 52, w: 4, h: 12},
    {x: 206, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 52, w: 4, h: 12},
    {x: 222, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 52, w: 4, h: 12},
    {x: 174, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 48, w: 4, h: 4},
    {x: 206, y: 384, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 48, w: 4, h: 4},
    {x: 206, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Sleeve
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 52, w: 4, h: 12},
    {x: 190, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 52, w: 4, h: 12},
    {x: 206, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 56, y: 52, w: 4, h: 12},
    {x: 222, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 60, y: 52, w: 4, h: 12},
    {x: 174, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 48, w: 4, h: 4},
    {x: 206, y: 384, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 56, y: 48, w: 4, h: 4},
    {x: 206, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 12},
    {x: 276, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 12},
    {x: 292, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 12},
    {x: 308, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: 324, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", {x: 4, y: 16, w: 4, h: 4}, {x: 292, y: 384, w: 16, h: 16}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 292, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right Pant
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 4, h: 12},
    {x: 276, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 36, w: 4, h: 12},
    {x: 292, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 36, w: 4, h: 12},
    {x: 308, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 36, w: 4, h: 12},
    {x: 324, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", {x: 4, y: 32, w: 4, h: 4}, {x: 292, y: 384, w: 16, h: 16}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: 292, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 12},
    {x: 369, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 12},
    {x: 385, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 12},
    {x: 401, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 353, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 385, y: 384, w: 16, h: 16},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 385, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Pant
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 52, w: 4, h: 12},
    {x: 369, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 52, w: 4, h: 12},
    {x: 385, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 52, w: 4, h: 12},
    {x: 401, y: 400, w: 16, h: 238},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 52, w: 4, h: 12},
    {x: 353, y: 400, w: 16, h: 238},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", {x: 4, y: 48, w: 4, h: 4}, {x: 385, y: 384, w: 16, h: 16}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 48, w: 4, h: 4},
    {x: 385, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Fold Lines
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
