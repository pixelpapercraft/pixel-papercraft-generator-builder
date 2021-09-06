let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-creeper-character"

let name = "Minecraft Creeper Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = [
  "Background",
  "Folds",
  "Labels",
  "Action-Figure",
  "Action-Figure-Folds",
  "Action-Figure-Labels",
]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

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
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Action Figure", false)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let actionFigure = Generator.getBooleanInputValue("Action Figure")

  // Overlay Region variables
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideFrontRightPant = Generator.getBooleanInputValue("Hide Front Right Pant")
  let hideFrontLeftPant = Generator.getBooleanInputValue("Hide Front Left Pant")
  let hideBackRightPant = Generator.getBooleanInputValue("Hide Back Right Pant")
  let hideBackLeftPant = Generator.getBooleanInputValue("Hide Back Left Pant")

  Generator.defineRegionInput((164, 110, 256, 192), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((196, 340, 192, 192), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((62, 471, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Front Right Pant", !hideFrontRightPant)
  })
  Generator.defineRegionInput((121, 589, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Front Left Pant", !hideFrontLeftPant)
  })
  Generator.defineRegionInput((419, 471, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Back Right Pant", !hideBackRightPant)
  })
  Generator.defineRegionInput((367, 589, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Back Left Pant", !hideBackLeftPant)
  })

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

  // Overlays
  if !hideHelmet {
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
  }

  if !hideJacket {
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
  }

  if !hideFrontRightPant {
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
  }

  if !hideFrontLeftPant {
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
  }

  if !hideBackRightPant {
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
  }

  if !hideBackLeftPant {
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

  // Action Figure
  if actionFigure {
    //Neck
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 0, w: 8, h: 8},
      {x: 44, y: 254, w: 64, h: 96},
      (),
    )
    // Neck Overlay
    if !hideHelmet {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 0, w: 8, h: 8},
        {x: 44, y: 254, w: 64, h: 96},
        (),
      )
    }

    // Foreground
    Generator.drawImage("Action-Figure", (0, 0))

    // Folds
    if showFolds {
      Generator.drawImage("Action-Figure-Folds", (0, 0))
    }

    // Labels
    if showLabels {
      Generator.drawImage("Action-Figure-Labels", (0, 0))
    }
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
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
