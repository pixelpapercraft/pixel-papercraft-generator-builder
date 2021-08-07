let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-squid-character"

let name = "Minecraft Squid Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let imageIds = ["Background", "Folds"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Squid",
    url: requireTexture("Squid"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let steve = TextureMap.MinecraftCharacterLegacy.steve

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  Generator.defineSelectInput("Tentacle 1", ["3", "4", "1", "2"])
  Generator.defineSelectInput("Tentacle 2", ["4", "3", "2", "1"])
  Generator.defineSelectInput("Tentacle 3", ["2", "1", "4", "3"])
  Generator.defineSelectInput("Tentacle 4", ["2", "1", "4", "3"])
  Generator.defineSelectInput("Tentacle 5", ["2", "1", "4", "3"])
  Generator.defineSelectInput("Tentacle 6", ["1", "2", "3", "4"])
  Generator.defineSelectInput("Tentacle 7", ["1", "2", "3", "4"])
  Generator.defineSelectInput("Tentacle 8", ["1", "2", "3", "4"])

  let tent1 =
    Generator.getSelectInputValue("Tentacle 1")->Belt.Int.fromString->Belt.Option.getWithDefault(3)
  let tent2 =
    Generator.getSelectInputValue("Tentacle 2")->Belt.Int.fromString->Belt.Option.getWithDefault(4)
  let tent3 =
    Generator.getSelectInputValue("Tentacle 3")->Belt.Int.fromString->Belt.Option.getWithDefault(2)
  let tent4 =
    Generator.getSelectInputValue("Tentacle 4")->Belt.Int.fromString->Belt.Option.getWithDefault(2)
  let tent5 =
    Generator.getSelectInputValue("Tentacle 5")->Belt.Int.fromString->Belt.Option.getWithDefault(2)
  let tent6 =
    Generator.getSelectInputValue("Tentacle 6")->Belt.Int.fromString->Belt.Option.getWithDefault(1)
  let tent7 =
    Generator.getSelectInputValue("Tentacle 7")->Belt.Int.fromString->Belt.Option.getWithDefault(1)
  let tent8 =
    Generator.getSelectInputValue("Tentacle 8")->Belt.Int.fromString->Belt.Option.getWithDefault(1)

  let cycleTentacleTypes = t => {
    let t = if t === 4 {
      1
    } else {
      t + 1
    }
    Belt.Int.toString(t)
  }

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  //Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  //let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Tentacle Types

  let rightArm = (ox, oy) => {
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

  let leftArm = (ox, oy) => {
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

  let rightLeg = (ox, oy) => {
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
    | 3 => rightArm(nx, ny)
    | 4 => leftArm(nx, ny)
    | 1 => rightLeg(nx, ny)
    | 2 => leftLeg(nx, ny)
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

  // Hat
  Generator.drawTextureLegacy("Skin", {x: 32, y: 8, w: 8, h: 8}, {x: 67, y: 145, w: 96, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 40, y: 8, w: 8, h: 8}, {x: 163, y: 145, w: 96, h: 96}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 48, y: 8, w: 8, h: 8}, {x: 259, y: 145, w: 96, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 56, y: 8, w: 8, h: 8}, {x: 355, y: 145, w: 96, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 40, y: 0, w: 8, h: 8}, {x: 163, y: 49, w: 96, h: 96}, ()) // Top

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
  Generator.defineRegionInput((15, 16, 64, 176), () => {
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
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
