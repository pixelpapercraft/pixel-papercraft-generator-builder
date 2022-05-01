let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-creeper"

let name = "Minecraft Creeper"

let history = [
  "Originally developed by gootube2000.",
  "19 Jun 2014 lostminer - Fix glitch in body, Make back legs face forward rather than backward.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "29 Sep 2020 NinjolasNJM - Fixed bottom textures.",
  "06 Jun 2021 NinjolasNJM - Converted to ReScript generator.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let instructions = {
  let creeperTexture = requireTexture("creeper")
  `
## How to use the Minecraft Creeper Generator?

### Option 1: Use a texture pack or mod Creeper skin

* Download your favourite texture pack or mod.
* Find the **creeper.png** texture file.
* Select this file in the generator.
* "Download and print your new Creeper papercraft. 

## Option 2: Create your own Creeper skin

* Download a sample Creeper texture (right click and save):
  ![Creeper Texture](${creeperTexture})
* Edit this texture in your favourite graphics program.
* Select this file in the generator.
* Download and print your new Creeper papercraft.
`
}

let imageIds = [
  "Background",
  "Folds",
  "Labels",
  "Action-Figure",
  "Action-Figure-Folds",
  "Action-Figure-Labels",
]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("creeper"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 32, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Action Figure", false)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let actionFigure = Generator.getBooleanInputValue("Action Figure")

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  let ox = 164
  let oy = 110
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: 0 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 64 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: 128 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: 192 + ox, y: 64 + oy, w: 64, h: 64},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: 64 + ox, y: 0 + oy, w: 64, h: 64},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 64 + ox, y: 128 + oy, w: 64, h: 64},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  let ox = 196
  let oy = 340
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 32 + ox, y: 32 + oy, w: 64, h: 96},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 128 + ox, y: 32 + oy, w: 64, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 32 + ox, y: oy, w: 64, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 96 + ox, y: 192 + oy, w: 64, h: 32},
    ~flip=#Vertical,
    ~rotateLegacy=270.0,
    (),
  ) // Bottom

  // Front Right Foot
  let ox = 62
  let oy = 471
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 6},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 6},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 6},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 6},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 0 + oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 80 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Front Left Foot
  let ox = 121
  let oy = 589
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 6},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 6},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 6},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 6},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 0 + oy, w: 32, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 80 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Back Right Foot
  let ox = 419
  let oy = 471
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 6},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 6},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 6},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 6},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 112 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  // Back Left Foot
  let ox = 367
  let oy = 589
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 6},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 20, w: 4, h: 6},
    {x: 96 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Face
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 20, w: 4, h: 6},
    {x: 0 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 6},
    {x: 32 + ox, y: 32 + oy, w: 32, h: 48},
    (),
  ) // Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 32 + oy, w: 32, h: 32},
    ~rotateLegacy=180.0,
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 64 + ox, y: 112 + oy, w: 32, h: 32},
    ~flip=#Vertical,
    ~rotateLegacy=180.0,
    (),
  ) // Bottom

  // Action Figure
  if actionFigure {
    //Neck
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 0, w: 8, h: 8},
      {x: 44, y: 254, w: 64, h: 96},
      (),
    )

    // Foreground
    Generator.drawImage("Action-Figure", (0, 0))

    // Folds
    if showFolds {
      Generator.drawImage("Action-Figure-Folds", (0, 0))
    }

    // Labels
    if showLabels {
      Generator.drawImage("Action-Figure-Labels", (0, 0))
    }
  }

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
  id: id,
  name: name,
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
