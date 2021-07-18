let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-creeper-character"

let name = "Minecraft Creeper Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

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
  Generator.defineBooleanInput("Show Overlay", true)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showOverlay = Generator.getBooleanInputValue("Show Overlay")

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  let ox = 164
  let oy = 110
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 0 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 64 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 128 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 192 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 64 + ox, y: 0 + oy, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 64 + ox, y: 128 + oy, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  let ox = 196
  let oy = 340
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 32 + ox, y: 32 + oy, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 128 + ox, y: 32 + oy, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 32 + ox, y: oy, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 128 + ox, y: 128 + oy, w: 64, h: 32},
    ~flip=#Vertical,
    ~rotateLegacy=90.0,
    (),
  ) // Bottom

  // Front Right Foot
  let ox = 62
  let oy = 471
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 12},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 12},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 12},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 0 + oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 80 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Front Left Foot
  let ox = 121
  let oy = 589
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 12},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 12},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 12},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 64 + ox, y: 0 + oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 64 + ox, y: 80 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Back Right Foot
  let ox = 419
  let oy = 471
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 12},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 12},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 12},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 112 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  // Back Left Foot
  let ox = 367
  let oy = 589
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 12},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 12},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 12},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 64 + ox, y: 112 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  if showOverlay {
    // Helmet
    let ox = 164
    let oy = 110
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 8, h: 8},
      {x: 0 + ox, y: 64 + oy, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 8, w: 8, h: 8},
      {x: 64 + ox, y: 64 + oy, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 8, w: 8, h: 8},
      {x: 128 + ox, y: 64 + oy, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 8, w: 8, h: 8},
      {x: 192 + ox, y: 64 + oy, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 0, w: 8, h: 8},
      {x: 64 + ox, y: 0 + oy, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 64 + ox, y: 128 + oy, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Jacket
    let ox = 196
    let oy = 340
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: 0 + ox, y: 32 + oy, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: 32 + ox, y: 32 + oy, w: 64, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: 96 + ox, y: 32 + oy, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: 128 + ox, y: 32 + oy, w: 64, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: 32 + ox, y: oy, w: 64, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 128 + ox, y: 128 + oy, w: 64, h: 32},
      ~flip=#Vertical,
      ~rotateLegacy=90.0,
      (),
    ) // Bottom

    // Front Right Pant
    let ox = 62
    let oy = 471
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 12},
      {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 4, h: 12},
      {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 36, w: 4, h: 12},
      {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 36, w: 4, h: 12},
      {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: 64 + ox, y: 0 + oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: 64 + ox, y: 80 + oy, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Front Left Pant
    let ox = 121
    let oy = 589
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 4, h: 12},
      {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 52, w: 4, h: 12},
      {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 52, w: 4, h: 12},
      {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: 64 + ox, y: 0 + oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: 64 + ox, y: 80 + oy, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Back Right Pant
    let ox = 419
    let oy = 471
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 4, h: 12},
      {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 36, w: 4, h: 12},
      {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 36, w: 4, h: 12},
      {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 12},
      {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: 64 + ox, y: 32 + oy, w: 32, h: 32},
      ~rotateLegacy=180.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: 64 + ox, y: 112 + oy, w: 32, h: 32},
      ~flip=#Vertical,
      ~rotateLegacy=180.0,
      (),
    ) // Bottom

    // Back Left Pant
    let ox = 367
    let oy = 589
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 52, w: 4, h: 12},
      {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 52, w: 4, h: 12},
      {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 4, h: 12},
      {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: 64 + ox, y: 32 + oy, w: 32, h: 32},
      ~rotateLegacy=180.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: 64 + ox, y: 112 + oy, w: 32, h: 32},
      ~flip=#Vertical,
      ~rotateLegacy=180.0,
      (),
    ) // Bottom
  }

  // Folds
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
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
