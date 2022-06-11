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

  let ox = 249
  let oy = 245

  // Center
  Generator.drawTexture("Texture", (26, 14, 16, 12), (ox - 16, oy + 16, 128, 96), ~rotate=-90.0, ())

  // Front Side

  Generator.drawTexture("Texture", Map.minecart.sides.front, (ox - 16, oy - 64, 128, 64), ())
  Generator.drawTexture("Texture", Map.minecart.sides.top, (ox - 16, oy - 80, 128, 16), ())
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.back,
    (ox - 16, oy - 144, 128, 64),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.bottom.right,
    (ox + 40, oy - 216, 16, 128),
    ~rotate=-90.0,
    (),
  )

  // Right Side

  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.front,
    (ox + 64, oy + 32, 128, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.top,
    (ox + 104, oy + 56, 128, 16),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.back,
    (ox + 144, oy + 32, 128, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.left,
    (ox + 200, oy - 40, 16, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.right,
    (ox + 200, oy + 104, 16, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.bottom.bottom,
    (ox + 168, oy + 56, 160, 16),
    ~flip=#Vertical,
    ~rotate=90.0,
    (),
  )

  // Back Side

  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.front,
    (ox - 16, oy + 128, 128, 64),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.top,
    (ox - 16, oy + 192, 128, 16),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture("Texture", Map.minecart.sides.back, (ox - 16, oy + 208, 128, 64), ())
  Generator.drawTexture(
    "Texture",
    Map.minecart.bottom.left,
    (ox + 40, oy + 216, 16, 128),
    ~rotate=-90.0,
    (),
  )

  // Left Side

  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.front,
    (ox - 96, oy + 32, 128, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.top,
    (ox - 136, oy + 56, 128, 16),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.back,
    (ox - 176, oy + 32, 128, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.left,
    (ox - 120, oy + 104, 16, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.sides.right,
    (ox - 120, oy - 40, 16, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Texture",
    Map.minecart.bottom.top,
    (ox - 232, oy + 56, 160, 16),
    ~rotate=90.0,
    (),
  )

  // Bottom
  Generator.drawTexture(
    "Texture",
    Map.minecart.bottom.front,
    (ox - 32, oy + 304, 160, 128),
    ~rotate=-90.0,
    (),
  )

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
