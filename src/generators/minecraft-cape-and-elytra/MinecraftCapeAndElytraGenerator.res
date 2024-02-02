let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-cape-and-elytra"

let name = "Minecraft Cape And Elytra"

let history = [
  "16 Mar 2021 NinjolasNJM - Initially completed both cape and elytra generation.",
  "06 Jun 2021 NinjolasNJM - Converted to ReScript generator.",
  "02 Feb 2024 NinjolasNJM - added default textures and improved folds. ",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let imageIds = ["Foreground", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Cape",
    url: requireTexture("Migrator"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Migrator Cape",
    url: requireTexture("Migrator"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Vanilla Cape",
    url: requireTexture("Vanilla"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Cherry Blossom Cape",
    url: requireTexture("CherryBlossom"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Minecon 2011 Cape",
    url: requireTexture("Minecon2011"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Minecon 2012 Cape",
    url: requireTexture("Minecon2012"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Minecon 2013 Cape",
    url: requireTexture("Minecon2013"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Minecon 2015 Cape",
    url: requireTexture("Minecon2015"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Minecon 2016 Cape",
    url: requireTexture("Minecon2016"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Founder's Cape",
    url: requireTexture("Minecon2019"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Mojang Cape",
    url: requireTexture("Mojang"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Elytra",
    url: requireTexture("Elytra"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let script = () => {
  // Define the user inputs
  Generator.defineTextureInput(
    "Cape",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: [
        "Migrator Cape",
        "Vanilla Cape",
        "Cherry Blossom Cape",
        "Minecon 2011 Cape",
        "Minecon 2012 Cape",
        "Minecon 2013 Cape",
        "Minecon 2015 Cape",
        "Minecon 2016 Cape",
        "Founder's Cape",
        "Mojang Cape",
        "Elytra",
      ],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Cape
  Generator.drawTextureLegacy("Cape", {x: 0, y: 1, w: 1, h: 16}, {x: 74, y: 116, w: 8, h: 128}, ()) // Right
  Generator.drawTextureLegacy(
    "Cape",
    {x: 1, y: 1, w: 10, h: 16},
    {x: 82, y: 116, w: 80, h: 128},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Cape",
    {x: 11, y: 1, w: 1, h: 16},
    {x: 162, y: 116, w: 8, h: 128},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Cape",
    {x: 12, y: 1, w: 10, h: 16},
    {x: 170, y: 116, w: 80, h: 128},
    (),
  ) // Back
  Generator.drawTextureLegacy("Cape", {x: 1, y: 0, w: 10, h: 1}, {x: 82, y: 108, w: 80, h: 8}, ()) // Top
  Generator.drawTextureLegacy(
    "Cape",
    {x: 11, y: 0, w: 10, h: 1},
    {x: 82, y: 244, w: 80, h: 8},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Elytra Harness
  Generator.drawTextureLegacy("Cape", {x: 36, y: 2, w: 6, h: 4}, {x: 402, y: 180, w: 48, h: 32}, ()) // Left Harness Bottom
  Generator.drawTextureLegacy("Cape", {x: 36, y: 2, w: 4, h: 5}, {x: 418, y: 140, w: 32, h: 40}, ()) // Left Harness Top
  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 6, h: 4},
    {x: 450, y: 180, w: 48, h: 32},
    ~flip=#Horizontal,
    (),
  ) // Right Harness Bottom
  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 4, h: 5},
    {x: 450, y: 140, w: 32, h: 40},
    ~flip=#Horizontal,
    (),
  ) // Right Harness Top

  // Left Elytron

  // Left Wing
  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 10, h: 20},
    {x: 81, y: 336, w: 80, h: 160},
    (),
  ) // Left Wing Front (Back in game)
  Generator.drawTextureLegacy(
    "Cape",
    {x: 24, y: 0, w: 10, h: 2},
    {x: 161, y: 336, w: 80, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) // Left Wing Top (Top in game)
  Generator.drawTextureLegacy(
    "Cape",
    {x: 34, y: 2, w: 2, h: 20},
    {x: 49, y: 336, w: 32, h: 160},
    (),
  ) // Left Wing Side (Side in game)

  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 10, h: 20},
    {x: 161, y: 336, w: 80, h: 160},
    ~flip=#Horizontal,
    (),
  ) // Left Wing Front (Back in game) Back
  Generator.drawTextureLegacy(
    "Cape",
    {x: 24, y: 0, w: 10, h: 2},
    {x: 161, y: 304, w: 80, h: 32},
    ~flip=#Vertical,
    (),
  ) // Left Wing Top (Top in game) Back
  Generator.drawTextureLegacy(
    "Cape",
    {x: 34, y: 2, w: 2, h: 20},
    {x: 241, y: 336, w: 32, h: 160},
    ~flip=#Horizontal,
    (),
  ) // Left Wing Side (Side in game) Back

  // Left Wing Base
  Generator.drawTextureLegacy(
    "Cape",
    {x: 34, y: 2, w: 2, h: 2},
    {x: 353, y: 352, w: 32, h: 112},
    (),
  ) // Left Wing Base

  // Left Wing Joint
  Generator.drawTextureLegacy("Cape", {x: 36, y: 2, w: 4, h: 4}, {x: 496, y: 375, w: 32, h: 32}, ()) // Left Wing Joint 1
  Generator.drawTextureLegacy("Cape", {x: 36, y: 2, w: 4, h: 4}, {x: 496, y: 409, w: 32, h: 32}, ()) // Left Wing Joint 2

  // Right Elytron

  // Right Wing
  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 10, h: 20},
    {x: 81, y: 592, w: 80, h: 160},
    (),
  ) // Right Wing Front (Back in game)
  Generator.drawTextureLegacy(
    "Cape",
    {x: 24, y: 0, w: 10, h: 2},
    {x: 161, y: 592, w: 80, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) // Right Wing Top (Top in game)
  Generator.drawTextureLegacy(
    "Cape",
    {x: 34, y: 2, w: 2, h: 20},
    {x: 49, y: 592, w: 32, h: 160},
    (),
  ) // Right Wing Side (Side in game)

  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 10, h: 20},
    {x: 161, y: 592, w: 80, h: 160},
    ~flip=#Horizontal,
    (),
  ) // Right Wing Front (Back in game) Back
  Generator.drawTextureLegacy(
    "Cape",
    {x: 24, y: 0, w: 10, h: 2},
    {x: 161, y: 560, w: 80, h: 32},
    ~flip=#Vertical,
    (),
  ) // Right Wing Top (Top in game) Back
  Generator.drawTextureLegacy(
    "Cape",
    {x: 34, y: 2, w: 2, h: 20},
    {x: 241, y: 592, w: 32, h: 160},
    ~flip=#Horizontal,
    (),
  ) // Right Wing Side (Side in game) Back

  // Right Wing Base
  Generator.drawTextureLegacy(
    "Cape",
    {x: 34, y: 2, w: 2, h: 2},
    {x: 353, y: 608, w: 32, h: 112},
    ~flip=#Horizontal,
    (),
  ) // Right Wing Base

  // Right Wing Joint
  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 4, h: 4},
    {x: 496, y: 631, w: 32, h: 32},
    ~flip=#Horizontal,
    (),
  ) // Right Wing Joint 1
  Generator.drawTextureLegacy(
    "Cape",
    {x: 36, y: 2, w: 4, h: 4},
    {x: 496, y: 665, w: 32, h: 32},
    ~flip=#Horizontal,
    (),
  ) // Right Wing Joint 2

  // Draw the Foreground image
  Generator.drawImage("Foreground", (0, 0))

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
