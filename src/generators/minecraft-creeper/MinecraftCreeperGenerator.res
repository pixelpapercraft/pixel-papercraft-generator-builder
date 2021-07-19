let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-creeper"

let name = "Minecraft Creeper"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let instructions: Generator.instructionsDef = {
  open Generator.Markup
  let creeperTexture = requireTexture("creeper")
  <div>
    <H2> {"How to use the Minecraft Creeper Generator?"->React.string} </H2>
    <H3> {"Option 1: Use a texture pack or mod Creeper skin"->React.string} </H3>
    <OL>
      <LI> {"Download your favourite texture pack or mod."->React.string} </LI>
      <LI> {"Find the creeper.png file."->React.string} </LI>
      <LI> {"Select this file in the generator."->React.string} </LI>
      <LI> {"Download and print your new Creeper papercraft."->React.string} </LI>
    </OL>
    <H3> {"Option 2: Create your own Creeper skin"->React.string} </H3>
    <OL>
      <LI>
        {"Download a sample Creeper skin."->React.string}
        <a href={creeperTexture}> <img className="border p-1" src={creeperTexture} /> </a>
      </LI>
      <LI> {"Edit this skin in your favourite graphics program."->React.string} </LI>
      <LI> {"Select this file in the generator."->React.string} </LI>
      <LI> {"Download and print your new Creeper papercraft."->React.string} </LI>
    </OL>
  </div>
}

let imageIds = ["Background", "Folds", "Labels"]
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

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

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
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(instructions),
  images: images,
  textures: textures,
  script: script,
}
