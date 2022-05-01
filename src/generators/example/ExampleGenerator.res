let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "example"

let name = "Example"

let history = []

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background.png")},
  {id: "Folds", url: requireImage("Folds.png")},
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

// Helper Function to draw heads
let drawHead = (name, x, y) => {
  // Head Base
  Generator.drawTexture(name, (0, 8, 8, 8), (x - 64, y + 0, 64, 64), ()) // Right
  Generator.drawTexture(name, (8, 8, 8, 8), (x + 0, y + 0, 64, 64), ()) // Face
  Generator.drawTexture(name, (16, 8, 8, 8), (x + 64, y + 0, 64, 64), ()) // Left
  Generator.drawTexture(name, (24, 8, 8, 8), (x + 128, y + 0, 64, 64), ()) // Back
  Generator.drawTexture(name, (8, 0, 8, 8), (x + 0, y - 64, 64, 64), ()) // Top
  Generator.drawTexture(name, (16, 0, 8, 8), (x + 0, y + 64, 64, 64), ~flip=#Vertical, ()) // Bottom

  // Head Overlay
  Generator.drawTexture(name, (32, 8, 8, 8), (x - 64, y + 0, 64, 64), ()) // Right
  Generator.drawTexture(name, (40, 8, 8, 8), (x + 0, y + 0, 64, 64), ()) // Face
  Generator.drawTexture(name, (48, 8, 8, 8), (x + 64, y + 0, 64, 64), ()) // Left
  Generator.drawTexture(name, (56, 8, 8, 8), (x + 128, y + 0, 64, 64), ()) // Back
  Generator.drawTexture(name, (40, 0, 8, 8), (x + 0, y - 64, 64, 64), ()) // Top
  Generator.drawTexture(name, (48, 0, 8, 8), (x + 0, y + 64, 64, 64), ~flip=#Vertical, ()) // Bottom
}

let script = () => {
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  Generator.defineBooleanInput("Show Folds", true)
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  Generator.drawImage("Background", (0, 0))

  drawHead("Skin", 185, 117)

  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  history: history,
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
