let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-minecart"

let name = "Minecraft Minecart"

let history = []

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let imageIds = ["Foreground", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Texture",
    url: requireTexture("minecart"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Minecart",
    url: requireTexture("minecart"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Testing",
    url: requireTexture("testing"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

module Map = {
  type map = {
    bottom: Generator_Builder.cuboid,
    sides: Generator_Builder.cuboid,
  }

  let minecart = {
    bottom: Generator_Builder.makeCuboid((0, 10), (20, 16, 2)),
    sides: Generator_Builder.makeCuboid((0, 0), (16, 8, 2)),
  }
}

let script = () => {
  // Define the user inputs
  Generator.defineTextureInput(
    "Texture",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: ["Minecart", "Testing"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", false)
  Generator.defineBooleanInput("Show Labels", false)

  // Get user variable values
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Minecart

  Generator.drawImage("Foreground", (0, 0))

  let ox = 249
  let oy = 245

  // Center
  Generator.drawTexture("Texture", (26, 14, 16, 12), (ox - 16, oy + 16, 128, 96), ~rotate=90.0, ())

  // First Side

  // Sides were of the wrong type. Figure this out
  Generator.drawTexture("Texture", Map.minecart.sides.front, (ox - 16, oy - 64, 128, 64), ())
  Generator.drawTexture("Texture", Map.minecart.sides.top, (ox - 16, oy - 80, 128, 16), ())
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.back,
    (ox - 16, oy - 144, 128, 64),
    ~rotate=180.0,
    (),
  )

  // Draw the Foreground image
  //Generator.drawImage("Foreground", (0, 0))

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
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
