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

let steve = TextureMap.MinecraftCharacterLegacy.steve
let alex = TextureMap.MinecraftCharacterLegacy.alex

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
  Generator.drawTextureLegacy("Skin", steve.base.head.right, {x: ox, y: oy + 64, w: 64, h: 64}, ()) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.head.front,
    {x: ox + 64, y: oy + 64, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.head.left,
    {x: ox + 128, y: oy + 64, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.head.back,
    {x: ox + 192, y: oy + 64, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", steve.base.head.top, {x: ox + 64, y: oy, w: 64, h: 64}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.head.bottom,
    {x: ox + 64, y: oy + 128, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Torso
  let ox = 268
  let oy = 201
  Generator.drawTextureLegacy("Skin", steve.base.body.right, {x: ox, y: oy + 32, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.body.front,
    {x: ox + 32, y: oy + 32, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.body.left,
    {x: ox + 96, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.body.back,
    {x: ox + 128, y: oy + 32, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", steve.base.body.top, {x: ox + 32, y: oy, w: 64, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steve.base.body.bottom,
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
      alex.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.front,
      {x: ox + 32, y: oy + 32, w: 24, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.left,
      {x: ox + 56, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.back,
      {x: ox + 88, y: oy + 32, w: 24, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.top,
      {x: ox + 32, y: oy, w: 24, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.rightArm.bottom,
      {x: ox + 32, y: oy + 128, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Left Arm
    let ox = 415
    let oy = 373
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.front,
      {x: ox + 32, y: oy + 32, w: 24, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.left,
      {x: ox + 56, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.back,
      {x: ox - 24, y: oy + 32, w: 24, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.top,
      {x: ox + 32, y: oy, w: 24, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      alex.base.leftArm.bottom,
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
    let ox = 415
    let oy = 373
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

  // Right Leg
  let ox = 99
  let oy = 587
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
  let ox = 415
  let oy = 587
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

  // Overlays
  if !hideHelmet {
    // Head2
    let ox = 74
    let oy = 25
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.right,
      {x: ox, y: oy + 64, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.front,
      {x: ox + 64, y: oy + 64, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.left,
      {x: ox + 128, y: oy + 64, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.back,
      {x: ox + 192, y: oy + 64, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.top,
      {x: ox + 64, y: oy, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.head.bottom,
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
      steve.overlay.body.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.front,
      {x: ox + 32, y: oy + 32, w: 64, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.left,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.back,
      {x: ox + 128, y: oy + 32, w: 64, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.top,
      {x: ox + 32, y: oy, w: 64, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steve.overlay.body.bottom,
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
      let ox = 415
      let oy = 373
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
      let ox = 99
      let oy = 373
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
      let ox = 415
      let oy = 373
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

  if !hideRightPant {
    // Right Leg2
    let ox = 99
    let oy = 587
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
    let ox = 415
    let oy = 587
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
