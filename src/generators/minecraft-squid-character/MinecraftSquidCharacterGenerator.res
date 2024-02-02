let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-squid-character"

let name = "Minecraft Squid Character"

let history = [
  "Originally developed by frownieman.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "18 Mar 2015 frownieman - Added compatibility to 1.8 skins.",
  "29 Sep 2020 NinjolasNJM - Fixed bottom texture rotations, and added the ability to choose which tentacle has which textures.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v3-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Folds"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
    {
      id: "Squid",
      url: requireTexture("Squid"),
      standardWidth: 64,
      standardHeight: 32,
    },
  ],
)

let steve = TextureMap.MinecraftCharacterLegacy.steve

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

  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")

  let tent1 =
    Generator.getSelectInputValue("Tentacle 1")->Belt.Int.fromString->Belt.Option.getWithDefault(5)
  let tent2 =
    Generator.getSelectInputValue("Tentacle 2")->Belt.Int.fromString->Belt.Option.getWithDefault(7)
  let tent3 =
    Generator.getSelectInputValue("Tentacle 3")->Belt.Int.fromString->Belt.Option.getWithDefault(3)
  let tent4 =
    Generator.getSelectInputValue("Tentacle 4")->Belt.Int.fromString->Belt.Option.getWithDefault(3)
  let tent5 =
    Generator.getSelectInputValue("Tentacle 5")->Belt.Int.fromString->Belt.Option.getWithDefault(3)
  let tent6 =
    Generator.getSelectInputValue("Tentacle 6")->Belt.Int.fromString->Belt.Option.getWithDefault(1)
  let tent7 =
    Generator.getSelectInputValue("Tentacle 7")->Belt.Int.fromString->Belt.Option.getWithDefault(1)
  let tent8 =
    Generator.getSelectInputValue("Tentacle 8")->Belt.Int.fromString->Belt.Option.getWithDefault(1)

  let cycleTentacleTypes = t => {
    let t = mod(t, 8) + 1
    Belt.Int.toString(t)
  }

  Generator.defineRegionInput((67, 49, 384, 192), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((67, 241, 384, 128), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  //Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  //let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Tentacle Types
  let rightArmBase = (ox, oy) => {
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 16, w: 3, h: 4},
        {x: ox + 32, y: oy + 176, w: 16, h: 16},
        ~flip=#Vertical,
        ~rotateLegacy=270.0,
        (),
      ) // Bottom
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 20, w: 4, h: 12},
        {x: ox + 0, y: oy + 16, w: 16, h: 144},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 20, w: 3, h: 12},
        {x: ox + 16, y: oy + 16, w: 16, h: 144},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 20, w: 4, h: 12},
        {x: ox + 32, y: oy + 16, w: 16, h: 144},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 20, w: 3, h: 12},
        {x: ox + 48, y: oy + 16, w: 16, h: 144},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 16, w: 3, h: 4},
        {x: ox + 48, y: oy + 0, w: 16, h: 16},
        ~rotateLegacy=90.0,
        (),
      ) // Top
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 16, w: 4, h: 4},
        {x: ox + 32, y: oy + 176, w: 16, h: 16},
        ~flip=#Vertical,
        ~rotateLegacy=270.0,
        (),
      ) // Bottom
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 20, w: 16, h: 12},
        {x: ox + 0, y: oy + 16, w: 64, h: 144},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 16, w: 4, h: 4},
        {x: ox + 48, y: oy + 0, w: 16, h: 16},
        ~rotateLegacy=90.0,
        (),
      ) // Top
    }
  }
  let leftArmBase = (ox, oy) => {
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 39, y: 48, w: 3, h: 4},
        {x: ox + 32, y: oy + 160, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom
      Generator.drawTextureLegacy(
        "Skin",
        {x: 32, y: 52, w: 4, h: 12},
        {x: ox + 16, y: oy + 16, w: 16, h: 144},
        (),
      ) // Right
      Generator.drawTextureLegacy(
        "Skin",
        {x: 36, y: 52, w: 3, h: 12},
        {x: ox + 32, y: oy + 16, w: 16, h: 144},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 39, y: 52, w: 4, h: 12},
        {x: ox + 48, y: oy + 16, w: 16, h: 144},
        (),
      ) // Left
      Generator.drawTextureLegacy(
        "Skin",
        {x: 43, y: 52, w: 3, h: 12},
        {x: ox + 0, y: oy + 16, w: 16, h: 144},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 36, y: 48, w: 3, h: 4},
        {x: ox + 32, y: oy + 0, w: 16, h: 16},
        (),
      ) // Top
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 48, w: 4, h: 4},
        {x: ox + 32, y: oy + 160, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom
      Generator.drawTextureLegacy(
        "Skin",
        {x: 32, y: 52, w: 12, h: 12},
        {x: ox + 16, y: oy + 16, w: 48, h: 144},
        (),
      ) // Front
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 52, w: 4, h: 12},
        {x: ox + 0, y: oy + 16, w: 16, h: 144},
        (),
      ) // Back
      Generator.drawTextureLegacy(
        "Skin",
        {x: 36, y: 48, w: 4, h: 4},
        {x: ox + 32, y: oy + 0, w: 16, h: 16},
        (),
      ) // Top
    }
  }

  let rightLegBase = (ox, oy) => {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 16, w: 4, h: 4},
      {x: ox + 32, y: oy + 176, w: 16, h: 16},
      ~flip=#Vertical,
      ~rotateLegacy=270.0,
      (),
    ) // Bottom
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 20, w: 16, h: 12},
      {x: ox + 0, y: oy + 16, w: 64, h: 144},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 16, w: 4, h: 4},
      {x: ox + 48, y: oy + 0, w: 16, h: 16},
      ~rotateLegacy=90.0,
      (),
    ) // Top
  }

  let leftLegBase = (ox, oy) => {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 24, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy + 160, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 52, w: 12, h: 12},
      {x: ox + 16, y: oy + 16, w: 48, h: 144},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 52, w: 4, h: 12},
      {x: ox + 0, y: oy + 16, w: 16, h: 144},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy + 0, w: 16, h: 16},
      (),
    ) // Top
  }
  let rightArm = (ox, oy) => {
    rightArmBase(ox, oy) // Base
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 32, w: 3, h: 4},
        {x: ox + 32, y: oy + 176, w: 16, h: 16},
        ~flip=#Vertical,
        ~rotateLegacy=270.0,
        (),
      ) // Bottom Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 4, h: 12},
        {x: ox + 0, y: oy + 16, w: 16, h: 144},
        (),
      ) // Right Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 36, w: 3, h: 12},
        {x: ox + 16, y: oy + 16, w: 16, h: 144},
        (),
      ) // Front Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 47, y: 36, w: 4, h: 12},
        {x: ox + 32, y: oy + 16, w: 16, h: 144},
        (),
      ) // Left Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 51, y: 36, w: 3, h: 12},
        {x: ox + 48, y: oy + 16, w: 16, h: 144},
        (),
      ) // Back Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 3, h: 4},
        {x: ox + 48, y: oy + 0, w: 16, h: 16},
        ~rotateLegacy=90.0,
        (),
      ) // Top Overlay
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 32, w: 4, h: 4},
        {x: ox + 32, y: oy + 176, w: 16, h: 16},
        ~flip=#Vertical,
        ~rotateLegacy=270.0,
        (),
      ) // Bottom Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 40, y: 36, w: 16, h: 12},
        {x: ox + 0, y: oy + 16, w: 64, h: 144},
        (),
      ) // Front Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 44, y: 32, w: 4, h: 4},
        {x: ox + 48, y: oy + 0, w: 16, h: 16},
        ~rotateLegacy=90.0,
        (),
      ) // Top Overlay
    }
  }

  let leftArm = (ox, oy) => {
    leftArmBase(ox, oy) // Base
    if alexModel {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 48, w: 3, h: 4},
        {x: ox + 32, y: oy + 160, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 4, h: 12},
        {x: ox + 16, y: oy + 16, w: 16, h: 144},
        (),
      ) // Right Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 52, w: 3, h: 12},
        {x: ox + 32, y: oy + 16, w: 16, h: 144},
        (),
      ) // Front Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 55, y: 52, w: 4, h: 12},
        {x: ox + 48, y: oy + 16, w: 16, h: 144},
        (),
      ) // Left Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 59, y: 52, w: 3, h: 12},
        {x: ox + 0, y: oy + 16, w: 16, h: 144},
        (),
      ) // Back Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 3, h: 4},
        {x: ox + 32, y: oy + 0, w: 16, h: 16},
        (),
      ) // Top Overlay
    } else {
      Generator.drawTextureLegacy(
        "Skin",
        {x: 56, y: 48, w: 4, h: 4},
        {x: ox + 32, y: oy + 160, w: 16, h: 16},
        ~flip=#Vertical,
        (),
      ) // Bottom Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 48, y: 52, w: 12, h: 12},
        {x: ox + 16, y: oy + 16, w: 48, h: 144},
        (),
      ) // Front Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 60, y: 52, w: 4, h: 12},
        {x: ox + 0, y: oy + 16, w: 16, h: 144},
        (),
      ) // Back Overlay
      Generator.drawTextureLegacy(
        "Skin",
        {x: 52, y: 48, w: 4, h: 4},
        {x: ox + 32, y: oy + 0, w: 16, h: 16},
        (),
      ) // Top Overlay
    }
  }

  let rightLeg = (ox, oy) => {
    rightLegBase(ox, oy) // Base
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 32, w: 4, h: 4},
      {x: ox + 32, y: oy + 176, w: 16, h: 16},
      ~flip=#Vertical,
      ~rotateLegacy=270.0,
      (),
    ) // Bottom Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 36, w: 16, h: 12},
      {x: ox + 0, y: oy + 16, w: 64, h: 144},
      (),
    ) // Front Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 32, w: 4, h: 4},
      {x: ox + 48, y: oy + 0, w: 16, h: 16},
      ~rotateLegacy=90.0,
      (),
    ) // Top Overlay
  }

  let leftLeg = (ox, oy) => {
    leftLegBase(ox, oy) // Base
    Generator.drawTextureLegacy(
      "Skin",
      {x: 8, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy + 160, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // Bottom Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 0, y: 52, w: 12, h: 12},
      {x: ox + 16, y: oy + 16, w: 48, h: 144},
      (),
    ) // Front Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 12, y: 52, w: 4, h: 12},
      {x: ox + 0, y: oy + 16, w: 16, h: 144},
      (),
    ) // Back Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 48, w: 4, h: 4},
      {x: ox + 32, y: oy + 0, w: 16, h: 16},
      (),
    ) // Top Overlay
  }

  // Tentacle Function

  let drawTentacle = (nx, ny, tentType) => {
    switch tentType {
    | 1 => rightLeg(nx, ny)
    | 2 => rightLegBase(nx, ny)
    | 3 => leftLeg(nx, ny)
    | 4 => leftLegBase(nx, ny)
    | 5 => rightArm(nx, ny)
    | 6 => rightArmBase(nx, ny)
    | 7 => leftArm(nx, ny)
    | 8 => leftArmBase(nx, ny)
    | _ => ()
    }
  }

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 8, h: 8}, {x: 67, y: 145, w: 96, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 8, y: 8, w: 8, h: 8}, {x: 163, y: 145, w: 96, h: 96}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 16, y: 8, w: 8, h: 8}, {x: 259, y: 145, w: 96, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 24, y: 8, w: 8, h: 8}, {x: 355, y: 145, w: 96, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 8, y: 0, w: 8, h: 8}, {x: 163, y: 49, w: 96, h: 96}, ()) // Top

  if !hideHelmet {
    // Hat
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 8, w: 8, h: 8},
      {x: 67, y: 145, w: 96, h: 96},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 8, w: 8, h: 8},
      {x: 163, y: 145, w: 96, h: 96},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 8, w: 8, h: 8},
      {x: 259, y: 145, w: 96, h: 96},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 8, w: 8, h: 8},
      {x: 355, y: 145, w: 96, h: 96},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 0, w: 8, h: 8},
      {x: 163, y: 49, w: 96, h: 96},
      (),
    ) // Top
  }

  // Body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 67, y: 241, w: 96, h: 32},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 163, y: 241, w: 96, h: 32},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 259, y: 241, w: 96, h: 32},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 355, y: 241, w: 96, h: 32},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 163, y: 273, w: 96, h: 96},
    ~flip=#Vertical,
    (),
  ) // Bottom

  if !hideJacket {
    // Body Overlay
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 12},
      {x: 67, y: 241, w: 96, h: 32},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 12},
      {x: 163, y: 241, w: 96, h: 32},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 36, w: 4, h: 12},
      {x: 259, y: 241, w: 96, h: 32},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 36, w: 8, h: 12},
      {x: 355, y: 241, w: 96, h: 32},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 163, y: 273, w: 96, h: 96},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }

  //Tentacles

  // Tentacle 1
  Generator.defineRegionInput((471, 16, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 1", cycleTentacleTypes(tent1))
  })
  drawTentacle(471, 16, tent1)

  // Tentacle 2
  Generator.defineRegionInput((471, 215, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 2", cycleTentacleTypes(tent2))
  })
  drawTentacle(471, 215, tent2)

  // Tentacle 3
  Generator.defineRegionInput((470, 416, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 3", cycleTentacleTypes(tent3))
  })
  drawTentacle(470, 416, tent3)

  // Tentacle 4
  Generator.defineRegionInput((376, 416, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 4", cycleTentacleTypes(tent4))
  })
  drawTentacle(376, 416, tent4)

  // Tentacle 5
  Generator.defineRegionInput((280, 416, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 5", cycleTentacleTypes(tent5))
  })
  drawTentacle(280, 416, tent5)

  // Tentacle 6
  Generator.defineRegionInput((196, 416, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 6", cycleTentacleTypes(tent6))
  })
  drawTentacle(196, 416, tent6)

  // Tentacle 7
  Generator.defineRegionInput((109, 416, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 7", cycleTentacleTypes(tent7))
  })
  drawTentacle(109, 416, tent7)

  // Tentacle 8
  Generator.defineRegionInput((15, 416, 64, 176), () => {
    Generator.setSelectInputValue("Tentacle 8", cycleTentacleTypes(tent8))
  })
  drawTentacle(15, 416, tent8)

  //Remember to add back the overlay here

  // Mouth
  Generator.drawTexture("Squid", (27, 2, 6, 8), (187, 289, 48, 64), ()) // Mouth 1
  Generator.drawTexture("Squid", (26, 3, 8, 6), (179, 297, 64, 48), ()) // Mouth 2

  // Folds
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
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
