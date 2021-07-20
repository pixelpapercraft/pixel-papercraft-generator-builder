let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-squid-character"

let name = "Minecraft Squid Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Background",
    url: requireImage("Background"),
  },
  {
    id: "Mouth",
    url: requireImage("Mouth"),
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

  Generator.defineSelectInput("Tentacle 1", ["Right Arm", "Left Arm", "Right Leg", "Left Leg"])
  Generator.defineSelectInput("Tentacle 2", ["Left Arm", "Right Arm", "Left Leg", "Right Leg"])
  Generator.defineSelectInput("Tentacle 3", ["Left Leg", "Right Leg", "Left Arm", "Right Arm"])
  Generator.defineSelectInput("Tentacle 4", ["Left Leg", "Right Leg", "Left Arm", "Right Arm"])
  Generator.defineSelectInput("Tentacle 5", ["Left Leg", "Right Leg", "Left Arm", "Right Arm"])
  Generator.defineSelectInput("Tentacle 6", ["Right Leg", "Left Leg", "Right Arm", "Left Arm"])
  Generator.defineSelectInput("Tentacle 7", ["Right Leg", "Left Leg", "Right Arm", "Left Arm"])
  Generator.defineSelectInput("Tentacle 8", ["Right Leg", "Left Leg", "Right Arm", "Left Arm"])

  let tent1 = Generator.getSelectInputValue("Tentacle 1")
  let tent2 = Generator.getSelectInputValue("Tentacle 2")
  let tent3 = Generator.getSelectInputValue("Tentacle 3")
  let tent4 = Generator.getSelectInputValue("Tentacle 4")
  let tent5 = Generator.getSelectInputValue("Tentacle 5")
  let tent6 = Generator.getSelectInputValue("Tentacle 6")
  let tent7 = Generator.getSelectInputValue("Tentacle 7")
  let tent8 = Generator.getSelectInputValue("Tentacle 8")

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
    | "Right Arm" => rightArm(nx, ny)
    | "Left Arm" => leftArm(nx, ny)
    | "Right Leg" => rightLeg(nx, ny)
    | "Left Leg" => leftLeg(nx, ny)
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
  drawTentacle(471, 16, tent1)

  // Tentacle 2
  drawTentacle(471, 215, tent2)

  // Tentacle 3
  drawTentacle(470, 412, tent3)

  // Tentacle 4
  drawTentacle(376, 412, tent4)

  // Tentacle 5
  drawTentacle(280, 415, tent5)

  // Tentacle 6
  drawTentacle(196, 415, tent6)

  // Tentacle 7
  drawTentacle(109, 415, tent7)

  // Tentacle 8
  drawTentacle(15, 416, tent8)

  //Remember to add back the overlay here

  // Draw a special overlay
  Generator.drawImage("Mouth", (179, 289))
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
