let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-action-figure"

let name = "Minecraft Action Figure"

let history = [
  "16 Aug 2020 NinjolasNJM - Initial script finished.",
  "03 Oct 2020 NinjolasNJM - Added Alex support and Hand Notches.",
  "09 Oct 2020 NinjolasNJM - Tweaked pelvis, bottom of body and leg height.",
  "24 Feb 2021 NinjolasNJM - Moved pelvis so that the leg's pivot point is accurate to the game, changed leg height accordingly.",
  "06 Jun 2021 NinjolasNJM - Converted to ReScript generator.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let imageIds = ["Backgroundalex", "Backgroundsteve", "Foldsalex", "Foldssteve", "Labels", "Notch"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin2",
    url: requireTexture("Skin64x64ReferenceSteve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Alex",
    url: requireTexture("Skin64x64Alex"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = Minecraft.Character.steve
let alex = Minecraft.Character.alex

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )
  Generator.defineSelectInput("Skin Model", ["Steve", "Alex"])
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Hand Notches", true)

  // Get user variable values
  let isAlexModel = Generator.getSelectInputValue("Skin Model") === "Alex"

  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let handNotches = Generator.getBooleanInputValue("Hand Notches")

  let showHeadOverlay = Generator.getBooleanInputValueWithDefault("Show Head Overlay", true)
  let showBodyOverlay = Generator.getBooleanInputValueWithDefault("Show Body Overlay", true)
  let showLeftArmOverlay = Generator.getBooleanInputValueWithDefault("Show Left Arm Overlay", true)
  let showRightArmOverlay = Generator.getBooleanInputValueWithDefault(
    "Show Right Arm Overlay",
    true,
  )
  let showLeftLegOverlay = Generator.getBooleanInputValueWithDefault("Show Left Leg Overlay", true)
  let showRightLegOverlay = Generator.getBooleanInputValueWithDefault(
    "Show Right Leg Overlay",
    true,
  )

  let char = isAlexModel ? alex : steve

  // Define regions
  /* Generator.defineRegionInput((10, 534, 192, 256), () => {
    Generator.setBooleanInputValue("Show Helmet", !showHeadOverlay)
  })
  Generator.defineRegionInput((35, 50, 192, 144), () => {
    Generator.setBooleanInputValue("Show BodyOverlay", !showBodyOverlay)
  })
  Generator.defineRegionInput((265, 211, 128, 160), () => {
    Generator.setBooleanInputValue("Show Left Arm Overlay", !showLeftArmOverlay)
  })
  Generator.defineRegionInput((425, 587, 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Arm Overlay", !showRightArmOverlay)
  })
  Generator.defineRegionInput((425, 162, 128, 208), () => {
    Generator.setBooleanInputValue("Show Left Leg Overlay", !showLeftLegOverlay)
  })
  Generator.defineRegionInput((265, 538, 128, 208), () => {
    Generator.setBooleanInputValue("Show Right Leg Overlay", !showRightLegOverlay)
  })*/

  // Head
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 74, y: 790, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 74, y: 726, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 74, y: 662, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 74, y: 598, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 10, y: 726, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 138, y: 726, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    ~flip=#Vertical,
    (),
  ) // Bot

  //Neck
  Generator.drawTextureLegacy("Skin2", {x: 16, y: 0, w: 8, h: 8}, {x: 36, y: 414, w: 64, h: 96}, ()) // Bot

  //Pelvis
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 163, y: 380, w: 32, h: 130},
    (),
  ) // Left Pelvis
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 131, y: 380, w: 32, h: 130},
    (),
  ) // Right Pelvis

  //Body
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 16, y: 16, w: 24, h: 16},
    {x: 35, y: 50, w: 192, h: 128},
    (),
  ) // Body
  Generator.drawTextureLegacy("Skin2", {x: 0, y: 20, w: 4, h: 4}, {x: 35, y: 178, w: 32, h: 32}, ()) // Right hip
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 24, y: 52, w: 4, h: 4},
    {x: 131, y: 178, w: 32, h: 32},
    (),
  ) // Left hip
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 67, y: 178, w: 64, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bot

  // Arms

  if isAlexModel {
    //Left Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 39, y: 48, w: 3, h: 4},
      {x: 329, y: 338, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left Hand
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 48, w: 11, h: 16},
      {x: 297, y: 211, w: 88, h: 128},
      (),
    ) //Left arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 43, y: 52, w: 3, h: 12},
      {x: 273, y: 243, w: 24, h: 96},
      (),
    ) //Back Left Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 121, w: 32, h: 32},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 86, w: 32, h: 32},
      (),
    ) //Left Shoulder Inside

    //Right Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 47, y: 16, w: 3, h: 4},
      {x: 465, y: 714, w: 24, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right Hand
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 40, y: 16, w: 14, h: 16},
      {x: 433, y: 587, w: 112, h: 128},
      (),
    ) //Right Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 47, y: 20, w: 4, h: 4},
      {x: 489, y: 496, w: 32, h: 32},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 47, y: 20, w: 4, h: 4},
      {x: 489, y: 462, w: 32, h: 32},
      (),
    ) //Right Shoulder Inside
  } else {
    //Left Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 40, y: 48, w: 4, h: 4},
      {x: 329, y: 338, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left Hand
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 48, w: 12, h: 16},
      {x: 297, y: 211, w: 96, h: 128},
      (),
    ) //Left arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 44, y: 52, w: 4, h: 12},
      {x: 265, y: 243, w: 32, h: 96},
      (),
    ) //Back Left Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 121, w: 32, h: 32},
      (),
    ) //Left Shoulder
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 52, w: 4, h: 4},
      {x: 297, y: 86, w: 32, h: 32},
      (),
    ) //Left Shoulder Inside

    //Right Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 48, y: 16, w: 4, h: 4},
      {x: 457, y: 714, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right Hand
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 40, y: 16, w: 16, h: 16},
      {x: 425, y: 587, w: 128, h: 128},
      (),
    ) //Right Arm
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 48, y: 20, w: 4, h: 4},
      {x: 489, y: 496, w: 32, h: 32},
      (),
    ) //Right Shoulder
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 48, y: 20, w: 4, h: 4},
      {x: 489, y: 462, w: 32, h: 32},
      (),
    ) //Right Shoulder Inside
  }
  // Legs

  //Left Leg
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 16, y: 48, w: 12, h: 16},
    {x: 457, y: 210, w: 96, h: 128},
    (),
  ) //Left Leg
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 28, y: 52, w: 4, h: 8},
    {x: 521, y: 210, w: 32, h: 64},
    ~rotateLegacy=180.0,
    (),
  ) //Left Buttock
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 28, y: 52, w: 4, h: 12},
    {x: 425, y: 242, w: 32, h: 96},
    (),
  ) //Back Left Leg
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 489, y: 338, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) //Left foot

  //Right Leg
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 0, y: 16, w: 16, h: 16},
    {x: 265, y: 586, w: 128, h: 128},
    (),
  ) //Right Leg
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 12, y: 20, w: 4, h: 8},
    {x: 329, y: 586, w: 32, h: 64},
    ~rotateLegacy=180.0,
    (),
  ) //Right Buttock
  Generator.drawTextureLegacy(
    "Skin2",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 297, y: 714, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) //Right foot

  //Overlay
  if !showHeadOverlay {
    // Helmet
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 32, y: 8, w: 8, h: 8},
      {x: 74, y: 790, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 40, y: 8, w: 8, h: 8},
      {x: 74, y: 726, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 48, y: 8, w: 8, h: 8},
      {x: 74, y: 662, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 56, y: 8, w: 8, h: 8},
      {x: 74, y: 598, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 40, y: 0, w: 8, h: 8},
      {x: 10, y: 726, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 138, y: 726, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      ~flip=#Vertical,
      (),
    ) // Bot

    //Neck
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 48, y: 0, w: 8, h: 8},
      {x: 36, y: 414, w: 64, h: 96},
      (),
    )
  } // Bot

  if !showBodyOverlay {
    //BodyOverlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 16, y: 32, w: 24, h: 16},
      {x: 35, y: 50, w: 192, h: 128},
      (),
    ) // BodyOverlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 67, y: 178, w: 64, h: 32},
      ~flip=#Vertical,
      (),
    )
  } // Bot

  // Arm Overlays

  if isAlexModel {
    if !showLeftArmOverlay {
      //Left Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 55, y: 48, w: 3, h: 4},
        {x: 329, y: 338, w: 24, h: 32},
        ~flip=#Vertical,
        (),
      ) //Left Glove
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 48, w: 11, h: 16},
        {x: 297, y: 211, w: 88, h: 128},
        (),
      ) //Left Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 59, y: 52, w: 3, h: 12},
        {x: 273, y: 243, w: 24, h: 96},
        (),
      ) //Back Left Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 121, w: 32, h: 32},
        (),
      ) //Left Shoulder Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 86, w: 32, h: 32},
        (),
      )
    } //Left Shoulder Arm Overlay Inside

    if !showRightArmOverlay {
      //Right Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 47, y: 32, w: 3, h: 4},
        {x: 465, y: 714, w: 24, h: 32},
        ~flip=#Vertical,
        (),
      ) //Right Glove
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 40, y: 32, w: 14, h: 16},
        {x: 433, y: 587, w: 112, h: 128},
        (),
      ) //Right Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 47, y: 36, w: 4, h: 4},
        {x: 489, y: 496, w: 32, h: 32},
        (),
      ) //Right Shoulder Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 47, y: 36, w: 4, h: 4},
        {x: 489, y: 462, w: 32, h: 32},
        (),
      ) //Right Shoulder Arm Overlay Inside
    }
  } else {
    if !showLeftArmOverlay {
      //Left Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 56, y: 48, w: 4, h: 4},
        {x: 329, y: 338, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      ) //Left Glove
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 48, w: 12, h: 16},
        {x: 297, y: 211, w: 96, h: 128},
        (),
      ) //Left Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 60, y: 52, w: 4, h: 12},
        {x: 265, y: 243, w: 32, h: 96},
        (),
      ) //Back Left Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 121, w: 32, h: 32},
        (),
      ) //Left Shoulder Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 52, w: 4, h: 4},
        {x: 297, y: 86, w: 32, h: 32},
        (),
      )
    } //Left Shoulder Arm Overlay Inside

    if !showRightArmOverlay {
      //Right Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 32, w: 4, h: 4},
        {x: 457, y: 714, w: 32, h: 32},
        ~flip=#Vertical,
        (),
      ) //Right Glove
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 40, y: 32, w: 16, h: 16},
        {x: 425, y: 587, w: 128, h: 128},
        (),
      ) //Right Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 36, w: 4, h: 4},
        {x: 489, y: 496, w: 32, h: 32},
        (),
      ) //Right Shoulder Arm Overlay
      Generator.drawTextureLegacy(
        "Skin2",
        {x: 48, y: 36, w: 4, h: 4},
        {x: 489, y: 462, w: 32, h: 32},
        (),
      )
    } //Right Shoulder Arm Overlay Inside
  }
  // Leg Overlays

  if !showLeftLegOverlay {
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 4, y: 48, w: 4, h: 4},
      {x: 163, y: 380, w: 32, h: 130},
      (),
    ) // Left Pelvis

    //Left Leg Leg Overlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 0, y: 48, w: 12, h: 16},
      {x: 457, y: 210, w: 96, h: 128},
      (),
    ) //Left Leg Leg Overlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 12, y: 52, w: 4, h: 8},
      {x: 521, y: 210, w: 32, h: 64},
      ~rotateLegacy=180.0,
      (),
    ) //Left Buttock Leg Overlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 12, y: 52, w: 4, h: 12},
      {x: 425, y: 242, w: 32, h: 96},
      (),
    ) //Back Left Leg Leg Overlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 8, y: 48, w: 4, h: 4},
      {x: 489, y: 338, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Left foot Shoe

    Generator.drawTextureLegacy(
      "Skin2",
      {x: 8, y: 52, w: 4, h: 4},
      {x: 131, y: 178, w: 32, h: 32},
      (),
    ) // Left Hip Leg Overlay
  }

  if !showRightLegOverlay {
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 4, y: 32, w: 4, h: 4},
      {x: 131, y: 380, w: 32, h: 130},
      (),
    ) // Right Pelvis

    //Right Leg Leg Overlay
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 0, y: 32, w: 16, h: 16},
      {x: 265, y: 586, w: 128, h: 128},
      (),
    ) //Right Leg
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 12, y: 36, w: 4, h: 8},
      {x: 329, y: 586, w: 32, h: 64},
      ~rotateLegacy=180.0,
      (),
    ) //Right Buttock
    Generator.drawTextureLegacy(
      "Skin2",
      {x: 8, y: 32, w: 4, h: 4},
      {x: 297, y: 714, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) //Right foot

    Generator.drawTextureLegacy(
      "Skin2",
      {x: 0, y: 36, w: 4, h: 4},
      {x: 35, y: 178, w: 32, h: 32},
      (),
    ) // Right Hip Leg Overlay
  }

  let drawHead = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 64, 64)
    Minecraft.drawCuboid("Skin", char.base.head, (ox, oy), ~rotate=270.0, scale, ())
    Generator.drawTexture("Skin", char.base.head.bottom, (36, 414, 64, 96), ()) // Neck
    if showHeadOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.head, (ox, oy), ~rotate=270.0, scale, ())
      Generator.drawTexture("Skin", char.overlay.head.bottom, (36, 414, 64, 96), ()) // Neck
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }

  let drawBody = ((ox, oy): Generator_Builder.position) => {
    let scale = (64, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.body, (ox, oy), scale, ())
    Generator.drawTexture("Skin", char.base.rightLeg.right, (ox, oy + 128, 32, 96), ()) // Right Hip
    Generator.drawTexture("Skin", char.base.leftLeg.left, (ox + 96, oy + 128, 32, 96), ()) // Left Hip
    Generator.drawTexture("Skin", char.base.rightLeg.top, (131, 380, 32, 128), ()) // Right Pelvis
    Generator.drawTexture("Skin", char.base.leftLeg.top, (163, 380, 32, 128), ()) // Left Pelvis
    if showBodyOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.body, (ox, oy), scale, ())
    }
    if showRightLegOverlay {
      Generator.drawTexture("Skin", char.base.rightLeg.right, (ox, oy + 128, 32, 96), ()) // Right Hip
      Generator.drawTexture("Skin", char.base.rightLeg.top, (131, 380, 32, 128), ()) // Right Pelvis
    }
    if showLeftLegOverlay {
      Generator.drawTexture("Skin", char.base.leftLeg.left, (ox + 96, oy + 128, 32, 96), ()) // Left Hip
      Generator.drawTexture("Skin", char.base.leftLeg.top, (163, 380, 32, 128), ()) // Left Pelvis
    }
  }

  let drawRightArm = ((ox, oy): Generator_Builder.position) => {
    let scale = char == alex ? (24, 96, 32) : (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.rightArm, (ox, oy), scale, ())
    if showRightArmOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.rightArm, (ox, oy), scale, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftArm = ((ox, oy): Generator_Builder.position) => {
    let scale = char == alex ? (24, 96, 32) : (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.leftArm, (ox, oy), scale, ~orientation=#East, ())
    if showLeftArmOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.leftArm, (ox, oy), scale, ~orientation=#East, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~orientation=#East, ())
    } */
  }
  let drawRightLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.rightLeg, (ox, oy), scale, ())
    if showRightLegOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.rightLeg, (ox, oy), scale, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ())
    } */
  }
  let drawLeftLeg = ((ox, oy): Generator_Builder.position) => {
    let scale = (32, 96, 32)
    Minecraft.drawCuboid("Skin", char.base.leftLeg, (ox, oy), scale, ~orientation=#East, ())
    if showLeftLegOverlay {
      Minecraft.drawCuboid("Skin", char.overlay.leftLeg, (ox, oy), scale, ~orientation=#East, ())
    }
    /* if showFolds {
      Generator.drawFoldLineCuboid((ox, oy), scale, ~orientation=#East, ())
    } */
  }

  // Head

  let (ox, oy) = (9, 598)

  drawHead((ox, oy))
  Generator.defineRegionInput((ox, oy, 192, 256), () => {
    Generator.setBooleanInputValue("Show Head Overlay", !showHeadOverlay)
  })

  // Body

  let (ox, oy) = (35, 50)

  drawBody((ox, oy))
  Generator.defineRegionInput((ox, oy, 192, 160), () => {
    Generator.setBooleanInputValue("Show Body Overlay", !showBodyOverlay)
  })

  // Arms

  // Right Arm

  let (ox, oy) = (isAlexModel ? 433 : 425, 587)

  drawRightArm((ox, oy))
  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Arm Overlay", !showRightArmOverlay)
  })

  // Left Arm

  let (ox, oy) = (isAlexModel ? 273 : 265, 211)

  drawLeftArm((ox, oy))
  Generator.defineRegionInput((ox, oy, isAlexModel ? 112 : 128, 166), () => {
    Generator.setBooleanInputValue("Show Left Arm Overlay", !showLeftArmOverlay)
  })

  // Right Leg

  let (ox, oy) = (265, 587)

  drawRightLeg((ox, oy))
  Generator.defineRegionInput((ox, oy, 128, 160), () => {
    Generator.setBooleanInputValue("Show Right Leg Overlay", !showRightLegOverlay)
  })

  // Left Leg

  let (ox, oy) = (425, 211)

  drawLeftLeg((ox, oy))
  Generator.defineRegionInput((ox, oy, 128, 160), () => {
    Generator.setBooleanInputValue("Show Left Leg Overlay", !showLeftLegOverlay)
  })

  // Background
  if isAlexModel {
    Generator.drawImage("Backgroundalex", (0, 0))
  } else {
    Generator.drawImage("Backgroundsteve", (0, 0))
  }

  // Folds
  if showFolds {
    if isAlexModel {
      Generator.drawImage("Foldsalex", (0, 0))
    } else {
      Generator.drawImage("Foldssteve", (0, 0))
    }
  }
  // Hand Notches
  if handNotches {
    if isAlexModel {
      Generator.drawImage("Notch", (341, 307)) // Front Left Notch
      Generator.drawImage("Notch", (285, 307)) // Back Left Notch
      Generator.drawImage("Notch", (477, 683)) // Front Right Notch
      Generator.drawImage("Notch", (533, 683)) // Back Right Notch
    } else {
      Generator.drawImage("Notch", (345, 307)) // Front Left Notch
      Generator.drawImage("Notch", (281, 307)) // Back Left Notch
      Generator.drawImage("Notch", (473, 683)) // Front Right Notch
      Generator.drawImage("Notch", (537, 683)) // Back Right Notch
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
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
