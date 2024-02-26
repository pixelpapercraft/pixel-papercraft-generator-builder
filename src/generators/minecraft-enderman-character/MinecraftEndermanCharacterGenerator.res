let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-enderman-character"

let name = "Minecraft Enderman Character"

let history = [
  "Originally developed by ODF.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "12 Sep 2020 NinjolasNJM - Updated to use 1.8+ skins; fixed rotation of left arms and legs.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Labels", "Folds"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = MinecraftSkins.skins

let steve = TextureMap.MinecraftCharacterLegacy.steve
let alex = TextureMap.MinecraftCharacterLegacy.alex

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

  // Overlay Region variables
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")

  Generator.defineRegionInput((74, 25, 256, 192), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((268, 201, 192, 160), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((276, 384, 64, 270), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })
  Generator.defineRegionInput((353, 384, 64, 270), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((96, 384, 64, 270), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((174, 384, 64, 270), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  Generator.drawTextureLegacy("Skin", steve.base.head.right, {x: 74, y: 89, w: 64, h: 64}, ()) // Right
  Generator.drawTextureLegacy("Skin", steve.base.head.front, {x: 138, y: 89, w: 64, h: 64}, ()) // Face
  Generator.drawTextureLegacy("Skin", steve.base.head.left, {x: 202, y: 89, w: 64, h: 64}, ()) // Left
  Generator.drawTextureLegacy("Skin", steve.base.head.back, {x: 266, y: 89, w: 64, h: 64}, ()) // Back
  Generator.drawTextureLegacy("Skin", steve.base.head.top, {x: 138, y: 25, w: 64, h: 64}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.head.bottom,
    {x: 138, y: 153, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  Generator.drawTextureLegacy("Skin", steve.base.body.right, {x: 268, y: 233, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", steve.base.body.front, {x: 300, y: 233, w: 64, h: 96}, ()) // Face
  Generator.drawTextureLegacy("Skin", steve.base.body.left, {x: 364, y: 233, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", steve.base.body.back, {x: 396, y: 233, w: 64, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", steve.base.body.top, {x: 300, y: 201, w: 64, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.body.bottom,
    {x: 300, y: 329, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right arm
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.right,
      {x: 96, y: 400, w: 16, h: 238},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.front,
      {x: 112, y: 400, w: 16, h: 238},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.left,
      {x: 128, y: 400, w: 16, h: 238},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.back,
      {x: 144, y: 400, w: 16, h: 238},
      (),
    ) // Back
    Generator.drawTextureLegacy("Skin", alex.base.rightArm.top, {x: 112, y: 384, w: 16, h: 16}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.bottom,
      {x: 112, y: 638, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.right,
      {x: 96, y: 400, w: 16, h: 238},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.front,
      {x: 112, y: 400, w: 16, h: 238},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.left,
      {x: 128, y: 400, w: 16, h: 238},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.back,
      {x: 144, y: 400, w: 16, h: 238},
      (),
    ) // Back
    Generator.drawTextureLegacy("Skin", steve.base.rightArm.top, {x: 112, y: 384, w: 16, h: 16}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.bottom,
      {x: 112, y: 638, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  // Left arm
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.right,
      {x: 190, y: 400, w: 16, h: 238},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.front,
      {x: 206, y: 400, w: 16, h: 238},
      (),
    ) // Face
    Generator.drawTextureLegacy("Skin", alex.base.leftArm.left, {x: 222, y: 400, w: 16, h: 238}, ()) // Left
    Generator.drawTextureLegacy("Skin", alex.base.leftArm.back, {x: 174, y: 400, w: 16, h: 238}, ()) // Back
    Generator.drawTextureLegacy("Skin", alex.base.leftArm.top, {x: 206, y: 384, w: 16, h: 16}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.bottom,
      {x: 206, y: 638, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.right,
      {x: 190, y: 400, w: 16, h: 238},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.front,
      {x: 206, y: 400, w: 16, h: 238},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.left,
      {x: 222, y: 400, w: 16, h: 238},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.back,
      {x: 174, y: 400, w: 16, h: 238},
      (),
    ) // Back
    Generator.drawTextureLegacy("Skin", steve.base.leftArm.top, {x: 206, y: 384, w: 16, h: 16}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.bottom,
      {x: 206, y: 638, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  // Right leg
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.right,
    {x: 276, y: 400, w: 16, h: 238},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.front,
    {x: 292, y: 400, w: 16, h: 238},
    (),
  ) // Face
  Generator.drawTextureLegacy("Skin", steve.base.rightLeg.left, {x: 308, y: 400, w: 16, h: 238}, ()) // Left
  Generator.drawTextureLegacy("Skin", steve.base.rightLeg.back, {x: 324, y: 400, w: 16, h: 238}, ()) // Back
  Generator.drawTextureLegacy("Skin", steve.base.rightLeg.top, {x: 292, y: 384, w: 16, h: 16}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.bottom,
    {x: 292, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  Generator.drawTextureLegacy("Skin", steve.base.leftLeg.right, {x: 369, y: 400, w: 16, h: 238}, ()) // Right
  Generator.drawTextureLegacy("Skin", steve.base.leftLeg.front, {x: 385, y: 400, w: 16, h: 238}, ()) // Face
  Generator.drawTextureLegacy("Skin", steve.base.leftLeg.left, {x: 401, y: 400, w: 16, h: 238}, ()) // Left
  Generator.drawTextureLegacy("Skin", steve.base.leftLeg.back, {x: 353, y: 400, w: 16, h: 238}, ()) // Back
  Generator.drawTextureLegacy("Skin", steve.base.leftLeg.top, {x: 385, y: 384, w: 16, h: 16}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.leftLeg.bottom,
    {x: 385, y: 638, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Overlays
  if !hideHelmet {
    // Hat layer
    Generator.drawTextureLegacy("Skin", steve.overlay.head.right, {x: 74, y: 89, w: 64, h: 64}, ()) // Right
    Generator.drawTextureLegacy("Skin", steve.overlay.head.front, {x: 138, y: 89, w: 64, h: 64}, ()) // Face
    Generator.drawTextureLegacy("Skin", steve.overlay.head.left, {x: 202, y: 89, w: 64, h: 64}, ()) // Left
    Generator.drawTextureLegacy("Skin", steve.overlay.head.back, {x: 266, y: 89, w: 64, h: 64}, ()) // Back
    Generator.drawTextureLegacy("Skin", steve.overlay.head.top, {x: 138, y: 25, w: 64, h: 64}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.bottom,
      {x: 138, y: 153, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideJacket {
    // Jacket
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.right,
      {x: 268, y: 233, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.front,
      {x: 300, y: 233, w: 64, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy("Skin", steve.overlay.body.left, {x: 364, y: 233, w: 32, h: 96}, ()) // Left
    Generator.drawTextureLegacy("Skin", steve.overlay.body.back, {x: 396, y: 233, w: 64, h: 96}, ()) // Back
    Generator.drawTextureLegacy("Skin", steve.overlay.body.top, {x: 300, y: 201, w: 64, h: 32}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.bottom,
      {x: 300, y: 329, w: 64, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideRightSleeve {
    // Right Sleeve
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.right,
        {x: 96, y: 400, w: 16, h: 238},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.front,
        {x: 112, y: 400, w: 16, h: 238},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.left,
        {x: 128, y: 400, w: 16, h: 238},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.back,
        {x: 144, y: 400, w: 16, h: 238},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.top,
        {x: 112, y: 384, w: 16, h: 16},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.bottom,
        {x: 112, y: 638, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.right,
        {x: 96, y: 400, w: 16, h: 238},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.front,
        {x: 112, y: 400, w: 16, h: 238},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.left,
        {x: 128, y: 400, w: 16, h: 238},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.back,
        {x: 144, y: 400, w: 16, h: 238},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.top,
        {x: 112, y: 384, w: 16, h: 16},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.bottom,
        {x: 112, y: 638, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom
    }
  }

  if !hideLeftSleeve {
    // Left Sleeve
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.right,
        {x: 190, y: 400, w: 16, h: 238},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.front,
        {x: 206, y: 400, w: 16, h: 238},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.front,
        {x: 222, y: 400, w: 16, h: 238},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.back,
        {x: 174, y: 400, w: 16, h: 238},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.top,
        {x: 206, y: 384, w: 16, h: 16},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.bottom,
        {x: 206, y: 638, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.right,
        {x: 190, y: 400, w: 16, h: 238},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.front,
        {x: 206, y: 400, w: 16, h: 238},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.front,
        {x: 222, y: 400, w: 16, h: 238},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.back,
        {x: 174, y: 400, w: 16, h: 238},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.top,
        {x: 206, y: 384, w: 16, h: 16},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.bottom,
        {x: 206, y: 638, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom
    }
  }

  if !hideRightPant {
    // Right Pant
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.right,
      {x: 276, y: 400, w: 16, h: 238},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.front,
      {x: 292, y: 400, w: 16, h: 238},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.left,
      {x: 308, y: 400, w: 16, h: 238},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.back,
      {x: 324, y: 400, w: 16, h: 238},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.top,
      {x: 292, y: 384, w: 16, h: 16},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.bottom,
      {x: 292, y: 638, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideLeftPant {
    // Left Pant
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.right,
      {x: 369, y: 400, w: 16, h: 238},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.front,
      {x: 385, y: 400, w: 16, h: 238},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.left,
      {x: 401, y: 400, w: 16, h: 238},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.back,
      {x: 353, y: 400, w: 16, h: 238},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.top,
      {x: 385, y: 384, w: 16, h: 16},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.bottom,
      {x: 385, y: 638, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

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
