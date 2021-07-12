let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character"

let name = "Minecraft Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail.jpg"),
}

let imageIds = ["Background-Alex", "Background-Steve", "Folds-Alex", "Folds-Steve", "Labels"]
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
  // Inputs
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  //Generator.defineBooleanInput("Show Overlay", true)
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Draw
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  //let showOverlay = Generator.getBooleanInputValue("Show Overlay")
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")

  Generator.defineRegionInput((74, 25, 256, 192), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((268, 201, 192, 160), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((383, 373, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((99, 373, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((383, 587, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((99, 587, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  // Background
  if alexModel {
    Generator.drawImage("Background-Alex", (0, 0))
  } else {
    Generator.drawImage("Background-Steve", (0, 0))
  }

  // Head
  let ox = 74
  let oy = 25
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: ox, y: oy + 64, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: ox + 64, y: oy + 64, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: ox + 128, y: oy + 64, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: ox + 192, y: oy + 64, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: ox + 64, y: oy, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: ox + 64, y: oy + 128, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Torso
  let ox = 268
  let oy = 201
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: ox + 32, y: oy + 32, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: ox + 96, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: ox + 128, y: oy + 32, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: ox + 32, y: oy, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: ox + 32, y: oy + 128, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Arms
  if alexModel {
    // Right Arm
    let ox = 107
    let oy = 373
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 3, h: 12},
      {x: ox + 32, y: oy + 32, w: 24, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 12},
      {x: ox + 56, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 12},
      {x: ox + 88, y: oy + 32, w: 24, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: ox + 32, y: oy, w: 24, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 16, w: 3, h: 4},
      {x: ox + 32, y: oy + 128, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Left Arm
    let ox = 415
    let oy = 373
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 3, h: 12},
      {x: ox + 32, y: oy + 32, w: 24, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 52, w: 4, h: 12},
      {x: ox + 56, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 12},
      {x: ox - 24, y: oy + 32, w: 24, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: ox + 32, y: oy, w: 24, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 48, w: 3, h: 4},
      {x: ox + 32, y: oy + 128, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom
  } else {
    // Right Arm
    let ox = 99
    let oy = 373
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 4, h: 12},
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 20, w: 4, h: 12},
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 20, w: 4, h: 12},
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 16, w: 4, h: 4},
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Left Arm
    let ox = 415
    let oy = 373
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 4, h: 12},
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 52, w: 4, h: 12},
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 52, w: 4, h: 12},
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  // Right Leg
  let ox = 99
  let oy = 587
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 12},
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 12},
    {x: ox + 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 12},
    {x: ox + 64, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 12},
    {x: ox + 96, y: oy + 32, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: ox + 32, y: oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: ox + 32, y: oy + 128, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  let ox = 415
  let oy = 587
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 12},
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 12},
    {x: ox + 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 12},
    {x: ox + 64, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 12},
    {x: ox - 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: ox + 32, y: oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: ox + 32, y: oy + 128, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Overlays
  if !hideHelmet {
    // Head2
    let ox = 74
    let oy = 25
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 8, h: 8},
      {x: ox, y: oy + 64, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 8, w: 8, h: 8},
      {x: ox + 64, y: oy + 64, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 8, w: 8, h: 8},
      {x: ox + 128, y: oy + 64, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 8, w: 8, h: 8},
      {x: ox + 192, y: oy + 64, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 0, w: 8, h: 8},
      {x: ox + 64, y: oy, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 0, w: 8, h: 8},
      {x: ox + 64, y: oy + 128, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    )
  } // Bottom

  if !hideJacket {
    // Torso2
    let ox = 268
    let oy = 201
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: ox + 32, y: oy + 32, w: 64, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: ox + 128, y: oy + 32, w: 64, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: ox + 32, y: oy, w: 64, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: ox + 32, y: oy + 128, w: 64, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bottom}

  // Arms2

  if alexModel {
    if !hideRightSleeve {
      // Right Arm2
      let ox = 107
      let oy = 373
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 12},
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 3, h: 12},
        {x: ox + 32, y: oy + 32, w: 24, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 12},
        {x: ox + 56, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 36, w: 3, h: 12},
        {x: ox + 88, y: oy + 32, w: 24, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 3, h: 4},
        {x: ox + 32, y: oy, w: 24, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 32, w: 3, h: 4},
        {x: ox + 32, y: oy + 128, w: 24, h: 32},
        (),
      )
    } // Bottom

    if !hideLeftSleeve {
      // Left Arm2
      let ox = 415
      let oy = 373
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 12},
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 3, h: 12},
        {x: ox + 32, y: oy + 32, w: 24, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 52, w: 4, h: 12},
        {x: ox + 56, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 12},
        {x: ox - 24, y: oy + 32, w: 24, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 3, h: 4},
        {x: ox + 32, y: oy, w: 24, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 48, w: 3, h: 4},
        {x: ox + 32, y: oy + 128, w: 24, h: 32},
        (),
      )
    } // Bottom
  } else {
    if !hideRightSleeve {
      // Right Arm2
      let ox = 99
      let oy = 373
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 12},
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 4, h: 12},
        {x: ox + 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 36, w: 4, h: 12},
        {x: ox + 64, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 36, w: 4, h: 12},
        {x: ox + 96, y: oy + 32, w: 32, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 4, h: 4},
        {x: ox + 32, y: oy, w: 32, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 32, w: 4, h: 4},
        {x: ox + 32, y: oy + 128, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      )
    } // Bottom

    if !hideLeftSleeve {
      // Left Arm2
      let ox = 415
      let oy = 373
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 12},
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 4, h: 12},
        {x: ox + 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 52, w: 4, h: 12},
        {x: ox + 64, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 60, y: 52, w: 4, h: 12},
        {x: ox - 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 4, h: 4},
        {x: ox + 32, y: oy, w: 32, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 48, w: 4, h: 4},
        {x: ox + 32, y: oy + 128, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      )
    } // Bottom
  }

  if !hideRightPant {
    // Right Leg2
    let ox = 99
    let oy = 587
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 36, w: 4, h: 12},
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 36, w: 4, h: 12},
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 36, w: 4, h: 12},
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bottom

  if !hideLeftPant {
    // Left Leg2
    let ox = 415
    let oy = 587
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 4, h: 12},
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 52, w: 4, h: 12},
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 52, w: 4, h: 12},
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bottom

  // Fold Lines
  if showFolds {
    if alexModel {
      Generator.drawImage("Folds-Alex", (0, 0))
    } else {
      Generator.drawImage("Folds-Steve", (0, 0))
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
