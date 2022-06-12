let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-phantom"

let name = "Minecraft Phantom"

let history = ["30 Jun 2022 NinjolasNJM - first release."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Labels", "Folds"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Phantom",
    url: requireTexture("phantom"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Phantom Eyes",
    url: requireTexture("phantom_eyes"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

module Map = {
  type t = {
    head: TextureMap.cuboid,
    body: TextureMap.cuboid,
    wing1: TextureMap.cuboid,
    wing2: TextureMap.cuboid,
    tail1: TextureMap.cuboid,
    tail2: TextureMap.cuboid,
  }

  let phantom = {
    head: TextureMap.makeCuboid((0, 0), (7, 3, 5)),
    body: TextureMap.makeCuboid((0, 8), (5, 3, 9)),
    wing1: TextureMap.makeCuboid((23, 12), (6, 2, 9)),
    wing2: TextureMap.makeCuboid((16, 24), (13, 1, 9)),
    tail1: TextureMap.makeCuboid((23, 12), (3, 2, 6)),
    tail2: TextureMap.makeCuboid((16, 24), (1, 1, 6)),
  }
}

let drawPhantom = (texture: string, (ox, oy): Generator_Builder.position) => {
  Generator.drawCuboid(texture, Map.phantom.head, (ox, oy), (64, 96, 48), ~leftSide=true, ())
}

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Phantom", {standardWidth: 64, standardHeight: 32, choices: []})
  Generator.defineTextureInput("Phantom Eyes", {standardWidth: 64, standardHeight: 32, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", false)
  Generator.defineBooleanInput("Show Labels", false)

  // Get user variable values
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  let ox = 0
  let oy = 0
  // Background
  //Generator.drawImage("Background", (0, 0))

  // Draw Phantom
  drawPhantom("Phantom", (ox, oy))
  // Draw Phantom Eyes
  drawPhantom("Phantom Eyes", (ox, oy))

  // Fold Lines
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
