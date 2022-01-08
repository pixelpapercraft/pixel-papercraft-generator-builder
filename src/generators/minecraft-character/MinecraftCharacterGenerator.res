let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character"

let name = "Minecraft Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let instructions: Generator.instructionsDef = {
  open Generator.Markup
  <div>
    <H2> {"How to use the Minecraft Character Generator?"->React.string} </H2>
    <OL>
      <LI> {"Choose the your texture file model type"->React.string} </LI>
      <LI> {"Select your Minecraft skin file"->React.string} </LI>
      <LI> {"Download and print your character papercraft"->React.string} </LI>
    </OL>
  </div>
}

let imageIds = ["Background-Alex", "Background-Steve", "Folds-Alex", "Folds-Steve", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin64x64ReferenceSteve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steveLegacy = TextureMap.MinecraftCharacterLegacy.steve
let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacterLegacy.alex

let script = () => {
  // Inputs
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  Generator.defineText(
    "Click in the papercraft template to turn on and off the overlay for each part.",
  )

  // Draw
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
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
  Generator.drawTexture("Skin", steve.base.head.right, (ox, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.front, (ox + 64, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.left, (ox + 128, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.back, (ox + 192, oy + 64, 64, 64), ())
  Generator.drawTexture("Skin", steve.base.head.top, (ox + 64, oy, 64, 64), ())
  Generator.drawTexture(
    "Skin",
    steve.base.head.bottom,
    (ox + 64, oy + 128, 64, 64),
    ~flip=#Vertical,
    (),
  )

  // Torso
  let ox = 268
  let oy = 201
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.body.right,
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.body.front,
    {x: ox + 32, y: oy + 32, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.body.left,
    {x: ox + 96, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.body.back,
    {x: ox + 128, y: oy + 32, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.body.top,
    {x: ox + 32, y: oy, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.body.bottom,
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
      steveLegacy.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.rightArm.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.rightArm.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.rightArm.back,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.rightArm.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.rightArm.bottom,
      {x: ox + 32, y: oy + 128, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Left Arm
    let ox = 415
    let oy = 373
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.leftArm.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.leftArm.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.leftArm.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.leftArm.back,
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.leftArm.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.base.leftArm.bottom,
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
    steveLegacy.base.rightLeg.right,
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.rightLeg.front,
    {x: ox + 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.rightLeg.left,
    {x: ox + 64, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.rightLeg.back,
    {x: ox + 96, y: oy + 32, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.rightLeg.top,
    {x: ox + 32, y: oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.rightLeg.bottom,
    {x: ox + 32, y: oy + 128, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Left Leg
  let ox = 415
  let oy = 587
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.leftLeg.right,
    {x: ox, y: oy + 32, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.leftLeg.front,
    {x: ox + 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.leftLeg.left,
    {x: ox + 64, y: oy + 32, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.leftLeg.back,
    {x: ox - 32, y: oy + 32, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.leftLeg.top,
    {x: ox + 32, y: oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    steveLegacy.base.leftLeg.bottom,
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
      steveLegacy.overlay.head.right,
      {x: ox, y: oy + 64, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.head.front,
      {x: ox + 64, y: oy + 64, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.head.left,
      {x: ox + 128, y: oy + 64, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.head.back,
      {x: ox + 192, y: oy + 64, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.head.top,
      {x: ox + 64, y: oy, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.head.bottom,
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
      steveLegacy.overlay.body.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.body.front,
      {x: ox + 32, y: oy + 32, w: 64, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.body.left,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.body.back,
      {x: ox + 128, y: oy + 32, w: 64, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.body.top,
      {x: ox + 32, y: oy, w: 64, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.body.bottom,
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
        steveLegacy.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.rightArm.front,
        {x: ox + 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.rightArm.left,
        {x: ox + 64, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.rightArm.back,
        {x: ox + 96, y: oy + 32, w: 32, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.rightArm.top,
        {x: ox + 32, y: oy, w: 32, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.rightArm.bottom,
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
        steveLegacy.overlay.leftArm.right,
        {x: ox, y: oy + 32, w: 32, h: 96},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.leftArm.front,
        {x: ox + 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Face
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.leftArm.left,
        {x: ox + 64, y: oy + 32, w: 32, h: 96},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.leftArm.back,
        {x: ox - 32, y: oy + 32, w: 32, h: 96},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.leftArm.top,
        {x: ox + 32, y: oy, w: 32, h: 32},
        (),
      ) // Top
      Generator.drawTextureLegacy(
        "Skin",
        steveLegacy.overlay.leftArm.bottom,
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
      steveLegacy.overlay.rightLeg.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.rightLeg.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.rightLeg.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.rightLeg.back,
      {x: ox + 96, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.rightLeg.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.rightLeg.bottom,
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
      steveLegacy.overlay.leftLeg.right,
      {x: ox, y: oy + 32, w: 32, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.leftLeg.front,
      {x: ox + 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.leftLeg.left,
      {x: ox + 64, y: oy + 32, w: 32, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.leftLeg.back,
      {x: ox - 32, y: oy + 32, w: 32, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.leftLeg.top,
      {x: ox + 32, y: oy, w: 32, h: 32},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin",
      steveLegacy.overlay.leftLeg.bottom,
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
  instructions: Some(instructions),
  images: images,
  textures: textures,
  script: script,
}
