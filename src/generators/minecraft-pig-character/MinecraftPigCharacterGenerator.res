let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-pig-character"

let name = "Minecraft Pig Character"

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
  Generator.defineBooleanInput("Show Folds", true)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 8, h: 8}, {x: 90, y: 206, w: 64, h: 64}, ()) // Right Done
  Generator.drawTextureLegacy("Skin", {x: 8, y: 8, w: 8, h: 8}, {x: 154, y: 206, w: 64, h: 64}, ()) // Face Done
  Generator.drawTextureLegacy("Skin", {x: 16, y: 8, w: 8, h: 8}, {x: 218, y: 206, w: 64, h: 64}, ()) // Left Done
  Generator.drawTextureLegacy("Skin", {x: 24, y: 8, w: 8, h: 8}, {x: 282, y: 206, w: 64, h: 64}, ()) // Back Done
  Generator.drawTextureLegacy("Skin", {x: 8, y: 0, w: 8, h: 8}, {x: 154, y: 142, w: 64, h: 64}, ()) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 154, y: 270, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom Done

  // Body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 295, y: 531, w: 65, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 359, y: 451, w: 80, h: 64},
    ~rotateLegacy=90.0,
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 295, y: 387, w: 64, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 167, y: 451, w: 80, h: 64},
    ~flip=#Horizontal,
    ~rotateLegacy=90.0,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 295, y: 451, w: 80, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 295, y: 596, w: 80, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Bottom

  //legs
  //Front Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 52, w: 4, h: 12},
    {x: 444, y: 149, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 52, w: 4, h: 12},
    {x: 380, y: 149, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 52, w: 4, h: 12},
    {x: 476, y: 149, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 52, w: 4, h: 12},
    {x: 412, y: 149, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 48, w: 4, h: 4},
    {x: 444, y: 117, w: 32, h: 32},
    (),
  ) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 48, w: 4, h: 4},
    {x: 444, y: 197, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done
  //Front Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 20, w: 4, h: 12},
    {x: 444, y: 295, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 20, w: 4, h: 12},
    {x: 380, y: 295, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 20, w: 4, h: 12},
    {x: 476, y: 295, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 20, w: 4, h: 12},
    {x: 412, y: 295, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 16, w: 4, h: 4},
    {x: 444, y: 263, w: 32, h: 32},
    (),
  ) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 16, w: 4, h: 4},
    {x: 444, y: 343, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done
  //Back Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 12},
    {x: 444, y: 442, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 380, y: 442, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 12},
    {x: 476, y: 442, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 12},
    {x: 412, y: 442, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 444, y: 410, w: 32, h: 32},
    (),
  ) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 444, y: 490, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done
  //Back Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 12},
    {x: 444, y: 587, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: 380, y: 587, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 12},
    {x: 476, y: 587, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 12},
    {x: 412, y: 587, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy("Skin", {x: 4, y: 16, w: 4, h: 4}, {x: 444, y: 555, w: 32, h: 32}, ()) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 444, y: 635, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done

  //Second Layer

  //Helmet
  Generator.drawTextureLegacy("Skin", {x: 32, y: 8, w: 8, h: 8}, {x: 90, y: 206, w: 64, h: 64}, ()) // Right Done
  Generator.drawTextureLegacy("Skin", {x: 40, y: 8, w: 8, h: 8}, {x: 154, y: 206, w: 64, h: 64}, ()) // Face Done
  Generator.drawTextureLegacy("Skin", {x: 48, y: 8, w: 8, h: 8}, {x: 218, y: 206, w: 64, h: 64}, ()) // Left Done
  Generator.drawTextureLegacy("Skin", {x: 56, y: 8, w: 8, h: 8}, {x: 282, y: 206, w: 64, h: 64}, ()) // Back Done
  Generator.drawTextureLegacy("Skin", {x: 40, y: 0, w: 8, h: 8}, {x: 154, y: 142, w: 64, h: 64}, ()) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 0, w: 8, h: 8},
    {x: 154, y: 270, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom Done

  // Body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 36, w: 4, h: 12},
    {x: 295, y: 531, w: 65, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 32, w: 8, h: 4},
    {x: 359, y: 451, w: 80, h: 64},
    ~rotateLegacy=90.0,
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 36, w: 4, h: 12},
    {x: 295, y: 387, w: 64, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 32, w: 8, h: 4},
    {x: 167, y: 451, w: 80, h: 64},
    ~rotateLegacy=90.0,
    ~flip=#Horizontal,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 36, w: 8, h: 12},
    {x: 295, y: 451, w: 80, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 36, w: 8, h: 12},
    {x: 295, y: 596, w: 80, h: 128},
    ~rotateLegacy=90.0,
    (),
  ) // Bottom

  //legs
  //Front Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 52, w: 4, h: 12},
    {x: 444, y: 149, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 60, y: 52, w: 4, h: 12},
    {x: 380, y: 149, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 56, y: 52, w: 4, h: 12},
    {x: 476, y: 149, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 52, w: 4, h: 12},
    {x: 412, y: 149, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 48, w: 4, h: 4},
    {x: 444, y: 117, w: 32, h: 32},
    (),
  ) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 56, y: 48, w: 4, h: 4},
    {x: 444, y: 197, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done
  //Front Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 36, w: 4, h: 12},
    {x: 444, y: 295, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 36, w: 4, h: 12},
    {x: 380, y: 295, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 36, w: 4, h: 12},
    {x: 476, y: 295, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 36, w: 4, h: 12},
    {x: 412, y: 295, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 32, w: 4, h: 4},
    {x: 444, y: 263, w: 32, h: 32},
    (),
  ) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 32, w: 4, h: 4},
    {x: 444, y: 343, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done
  //Back Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 52, w: 4, h: 12},
    {x: 444, y: 442, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 52, w: 4, h: 12},
    {x: 380, y: 442, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 52, w: 4, h: 12},
    {x: 476, y: 442, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 52, w: 4, h: 12},
    {x: 412, y: 442, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy("Skin", {x: 4, y: 48, w: 4, h: 4}, {x: 444, y: 410, w: 32, h: 32}, ()) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 48, w: 4, h: 4},
    {x: 444, y: 490, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done
  //Back Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 36, w: 4, h: 12},
    {x: 444, y: 587, w: 32, h: 48},
    (),
  ) // Front Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 36, w: 4, h: 12},
    {x: 380, y: 587, w: 32, h: 48},
    (),
  ) // Back Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 36, w: 4, h: 12},
    {x: 476, y: 587, w: 32, h: 48},
    (),
  ) // Left Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 4, h: 12},
    {x: 412, y: 587, w: 32, h: 48},
    (),
  ) // Right Done
  Generator.drawTextureLegacy("Skin", {x: 4, y: 32, w: 4, h: 4}, {x: 444, y: 555, w: 32, h: 32}, ()) // Top Done
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: 444, y: 635, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom Done

  // Fold Lines
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
