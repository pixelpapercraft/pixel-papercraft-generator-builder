let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-phantom"

let name = "Minecraft Phantom"

let history = ["30 Jun 2022 NinjolasNJM - first release."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Foreground", "Labels", "Folds"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Phantom",
    url: requireTexture("testing"),
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

let drawHead = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (56, 24, 40)
  Minecraft.drawCuboid(texture, Minecraft.Phantom.phantom.head, (ox, oy), scale, ())
}

let drawBody = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (40, 24, 72)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.body,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~direction=#South,
    (),
  )
}

let drawWing1 = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (56, 24, 40)
  Minecraft.drawCuboid(texture, Minecraft.Phantom.phantom.head, (ox, oy), scale, ())
}

let drawWing2 = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (56, 24, 40)
  Minecraft.drawCuboid(texture, Minecraft.Phantom.phantom.head, (ox, oy), scale, ())
}

let drawTail1 = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (24, 16, 48)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.tail1,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~direction=#West,
    (),
  )
}

let drawTail2 = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (56, 24, 40)
  Minecraft.drawCuboid(texture, Minecraft.Phantom.phantom.head, (ox, oy), scale, ())
}

let drawPhantom = (texture: string) => {
  let (ox, oy) = (225, 37)
  drawHead(texture, (ox, oy))
  let (ox, oy) = (233, 197)
  drawBody(texture, (ox, oy))
  let (ox, oy) = (137, 389)
  drawTail1(texture, (ox, oy))
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

  // Draw Phantom
  drawPhantom("Phantom")
  // Draw Phantom Eyes
  drawPhantom("Phantom Eyes")

  // Fold Lines
  /* if showFolds {
    Generator.drawImage("Folds", (0, 0))
  } */
  // Background
  //Generator.drawImage("Foreground", (0, 0))
  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }
  // Fill Transparent Parts, with a different color while creating
  //Generator.fillBackgroundColor("#ff8000")
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
