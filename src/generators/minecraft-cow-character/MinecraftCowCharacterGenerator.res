let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-cow-character"

let name = "Minecraft Cow Character"

let history = [
  "Originally created by Poekoko.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "29 Sep 2020 NinjolasNJM - Updated to work with 1.8+ Skins.",
  "17 Jul 2021 M16 - Updated generator photo.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
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

  // Overlay region variables
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")

  Generator.defineRegionInput((25, 24, 224, 160), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((194, 115, 352, 304), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((421, 394, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((46, 394, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((421, 586, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((46, 586, 128, 160), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  Generator.drawTextureLegacy("Skin", steve.base.head.right, {x: 25, y: 72, w: 48, h: 64}, ()) // Right
  Generator.drawTextureLegacy("Skin", steve.base.head.front, {x: 73, y: 72, w: 64, h: 64}, ()) // Face
  Generator.drawTextureLegacy("Skin", steve.base.head.left, {x: 137, y: 72, w: 48, h: 64}, ()) // Left
  Generator.drawTextureLegacy("Skin", steve.base.head.back, {x: 185, y: 72, w: 64, h: 64}, ()) // Back
  Generator.drawTextureLegacy("Skin", steve.base.head.top, {x: 73, y: 24, w: 64, h: 48}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.head.bottom,
    {x: 73, y: 136, w: 64, h: 48},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Arms
  if alexModel {
    // Right Arm
    let ox = 46
    let oy = 394
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.back,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Left Arm
    let ox = 453
    let oy = 394
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.back,
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom
  } else {
    // Right Arm
    let ox = 46
    let oy = 394
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.back,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.rightArm.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Left Arm
    let ox = 453
    let oy = 394
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.back,
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.base.leftArm.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  // Body
  Generator.drawTextureLegacy("Skin", steve.base.body.right, {x: 194, y: 195, w: 80, h: 144}, ()) // Right
  Generator.drawTextureLegacy("Skin", steve.base.body.front, {x: 274, y: 195, w: 96, h: 144}, ()) // Front
  Generator.drawTextureLegacy("Skin", steve.base.body.left, {x: 370, y: 195, w: 80, h: 144}, ()) // Left
  Generator.drawTextureLegacy("Skin", steve.base.body.back, {x: 450, y: 195, w: 96, h: 144}, ()) // Back
  Generator.drawTextureLegacy("Skin", steve.base.body.top, {x: 274, y: 115, w: 96, h: 80}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.body.bottom,
    {x: 274, y: 339, w: 96, h: 80},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Right Leg
  let ox = 46
  let oy = 586
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.right,
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.front,
    {x: ox + 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.left,
    {x: ox + 64, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.back,
    {x: ox + 96, y: oy + 32, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.top,
    {x: ox + 32, y: oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.rightLeg.bottom,
    {x: ox + 32, y: oy + 128, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  let ox = 453
  let oy = 586
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.leftLeg.right,
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.leftLeg.front,
    {x: ox + 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.leftLeg.left,
    {x: ox + 64, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.leftLeg.back,
    {x: ox - 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", steve.base.leftLeg.top, {x: ox + 32, y: oy, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.leftLeg.bottom,
    {x: ox + 32, y: oy + 128, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Overlays

  if !hideHelmet {
    // Helmet
    Generator.drawTextureLegacy("Skin", steve.overlay.head.right, {x: 25, y: 72, w: 48, h: 64}, ()) // Right
    Generator.drawTextureLegacy("Skin", steve.overlay.head.front, {x: 73, y: 72, w: 64, h: 64}, ()) // Front
    Generator.drawTextureLegacy("Skin", steve.overlay.head.left, {x: 137, y: 72, w: 48, h: 64}, ()) // Left
    Generator.drawTextureLegacy("Skin", steve.overlay.head.back, {x: 185, y: 72, w: 64, h: 64}, ()) // Back
    Generator.drawTextureLegacy("Skin", steve.overlay.head.top, {x: 73, y: 24, w: 64, h: 48}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.bottom,
      {x: 73, y: 136, w: 64, h: 48},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  // Arms2

  if alexModel {
    if !hideRightSleeve {
      // Right Arm2
      let ox = 46
      let oy = 394
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.front,
        {x: ox + 32, y: oy + 32, w: 24, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.left,
        {x: ox + 56, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.back,
        {x: ox + 88, y: oy + 32, w: 24, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.top,
        {x: ox + 32, y: oy, w: 24, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.rightArm.bottom,
        {x: ox + 32, y: oy + 128, w: 24, h: 32},
        (),
      )
    } // Bottom

    if !hideLeftSleeve {
      // Left Arm2
      let ox = 453
      let oy = 394
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.right,
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.front,
        {x: ox + 32, y: oy + 32, w: 24, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.left,
        {x: ox + 56, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.back,
        {x: ox - 24, y: oy + 32, w: 24, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.top,
        {x: ox + 32, y: oy, w: 24, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        alex.overlay.leftArm.bottom,
        {x: ox + 32, y: oy + 128, w: 24, h: 32},
        (),
      )
    } // Bottom
  } else {
    if !hideRightSleeve {
      // Right Arm2
      let ox = 46
      let oy = 394
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.front,
        {x: ox + 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.left,
        {x: ox + 64, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.back,
        {x: ox + 96, y: oy + 32, w: 32, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.top,
        {x: ox + 32, y: oy, w: 32, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.rightArm.bottom,
        {x: ox + 32, y: oy + 128, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      )
    } // Bottom

    if !hideLeftSleeve {
      // Left Arm2
      let ox = 453
      let oy = 394
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.right,
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.front,
        {x: ox + 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.left,
        {x: ox + 64, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.back,
        {x: ox - 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.top,
        {x: ox + 32, y: oy, w: 32, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        steve.overlay.leftArm.bottom,
        {x: ox + 32, y: oy + 128, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      )
    } // Bottom
  }

  if !hideJacket {
    // Jacket
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.right,
      {x: 194, y: 195, w: 80, h: 144},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.front,
      {x: 274, y: 195, w: 96, h: 144},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.left,
      {x: 370, y: 195, w: 80, h: 144},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.back,
      {x: 450, y: 195, w: 96, h: 144},
      (),
    ) // Back
    Generator.drawTextureLegacy("Skin", steve.overlay.body.top, {x: 274, y: 115, w: 96, h: 80}, ()) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.bottom,
      {x: 274, y: 339, w: 96, h: 80},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  if !hideRightPant {
    // Right Leg2
    let ox = 46
    let oy = 586
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.back,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.rightLeg.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bottom

  if !hideLeftPant {
    // Left Leg2
    let ox = 453
    let oy = 586
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.back,
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.leftLeg.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bottom

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
