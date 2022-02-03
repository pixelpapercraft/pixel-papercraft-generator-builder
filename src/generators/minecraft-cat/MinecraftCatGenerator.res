let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-cat"

let name = "Minecraft Cat"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "All Black",
    url: requireTexture("all_black"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Black",
    url: requireTexture("all_black"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "All Black",
    url: requireTexture("black"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "British Shorthair",
    url: requireTexture("british_shorthair"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Calico",
    url: requireTexture("calico"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Jellie",
    url: requireTexture("jellie"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Ocelot",
    url: requireTexture("ocelot"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Persian",
    url: requireTexture("persian"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Ragdoll",
    url: requireTexture("ragdoll"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Red",
    url: requireTexture("red"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Siamese",
    url: requireTexture("siamese"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Tabby",
    url: requireTexture("tabby"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "White",
    url: requireTexture("white"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Test",
    url: requireTexture("tabby-test"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput(
    "Cat",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: [
        "All Black",
        "Black",
        "British Shorthair",
        "Calico",
        "Jellie",
        "Ocelot",
        "Persian",
        "Ragdoll",
        "Red",
        "Siamese",
        "Tabby",
        "White",
        "Test",
      ],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Script Variables

  // Head
  Generator.drawTextureLegacy("Cat", {x: 0, y: 5, w: 20, h: 4}, {x: 40, y: 73, w: 160, h: 32}, ()) // all sides

  Generator.drawTextureLegacy("Cat", {x: 5, y: 0, w: 5, h: 5}, {x: 80, y: 33, w: 40, h: 40}, ()) // Top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 10, y: 0, w: 5, h: 5},
    {x: 80, y: 105, w: 40, h: 40},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  Generator.drawTextureLegacy("Cat", {x: 20, y: 6, w: 6, h: 16}, {x: 40, y: 241, w: 48, h: 128}, ()) // left
  Generator.drawTextureLegacy("Cat", {x: 26, y: 6, w: 4, h: 16}, {x: 88, y: 241, w: 32, h: 128}, ()) // front
  Generator.drawTextureLegacy(
    "Cat",
    {x: 30, y: 6, w: 6, h: 16},
    {x: 120, y: 241, w: 48, h: 128},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Cat",
    {x: 36, y: 6, w: 4, h: 16},
    {x: 168, y: 241, w: 32, h: 128},
    (),
  ) // back
  Generator.drawTextureLegacy("Cat", {x: 26, y: 0, w: 4, h: 6}, {x: 88, y: 193, w: 32, h: 48}, ()) // top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 30, y: 0, w: 4, h: 6},
    {x: 88, y: 369, w: 32, h: 48},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Back Left Leg
  Generator.drawTextureLegacy("Cat", {x: 8, y: 17, w: 8, h: 4}, {x: 251, y: 336, w: 64, h: 32}, ()) // leg1
  Generator.drawTextureLegacy("Cat", {x: 10, y: 13, w: 2, h: 2}, {x: 267, y: 320, w: 16, h: 16}, ()) // top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 10, y: 13, w: 2, h: 2},
    {x: 267, y: 368, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Back Right Leg
  Generator.drawTextureLegacy("Cat", {x: 8, y: 17, w: 8, h: 4}, {x: 340, y: 336, w: 64, h: 32}, ()) // leg1
  Generator.drawTextureLegacy("Cat", {x: 10, y: 13, w: 2, h: 2}, {x: 356, y: 320, w: 16, h: 16}, ()) // top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 10, y: 13, w: 2, h: 2},
    {x: 356, y: 368, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Front Left Leg
  Generator.drawTextureLegacy("Cat", {x: 40, y: 8, w: 8, h: 4}, {x: 251, y: 248, w: 64, h: 32}, ()) // leg (all sides)
  Generator.drawTextureLegacy("Cat", {x: 42, y: 0, w: 2, h: 2}, {x: 267, y: 232, w: 16, h: 16}, ()) // top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 44, y: 0, w: 2, h: 2},
    {x: 267, y: 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Front Right Leg
  Generator.drawTextureLegacy("Cat", {x: 40, y: 8, w: 8, h: 4}, {x: 340, y: 248, w: 64, h: 32}, ()) // leg (all sides)
  Generator.drawTextureLegacy("Cat", {x: 42, y: 0, w: 2, h: 2}, {x: 356, y: 232, w: 16, h: 16}, ()) // top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 44, y: 0, w: 2, h: 2},
    {x: 356, y: 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Tail

  // top
  Generator.drawTextureLegacy("Cat", {x: 2, y: 16, w: 1, h: 8}, {x: 469, y: 294, w: 8, h: 64}, ()) // right
  Generator.drawTextureLegacy("Cat", {x: 3, y: 16, w: 1, h: 8}, {x: 477, y: 294, w: 8, h: 64}, ()) // back
  Generator.drawTextureLegacy("Cat", {x: 0, y: 16, w: 1, h: 8}, {x: 485, y: 294, w: 8, h: 64}, ()) // left
  Generator.drawTextureLegacy("Cat", {x: 1, y: 16, w: 1, h: 8}, {x: 493, y: 294, w: 8, h: 64}, ()) // front
  Generator.drawTextureLegacy(
    "Cat",
    {x: 2, y: 15, w: 1, h: 1},
    {x: 477, y: 358, w: 8, h: 8},
    ~flip=#Vertical,
    (),
  ) // bottom

  // bottom
  Generator.drawTextureLegacy("Cat", {x: 6, y: 16, w: 1, h: 8}, {x: 541, y: 294, w: 8, h: 64}, ()) // right
  Generator.drawTextureLegacy("Cat", {x: 7, y: 16, w: 1, h: 8}, {x: 549, y: 294, w: 8, h: 64}, ()) // back
  Generator.drawTextureLegacy("Cat", {x: 4, y: 16, w: 1, h: 8}, {x: 557, y: 294, w: 8, h: 64}, ()) // left
  Generator.drawTextureLegacy("Cat", {x: 5, y: 16, w: 1, h: 8}, {x: 565, y: 294, w: 8, h: 64}, ()) // front
  Generator.drawTextureLegacy(
    "Cat",
    {x: 6, y: 15, w: 1, h: 1},
    {x: 549, y: 358, w: 8, h: 8},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Nose
  Generator.drawTextureLegacy("Cat", {x: 2, y: 26, w: 3, h: 2}, {x: 256, y: 80, w: 24, h: 16}, ()) // front
  Generator.drawTextureLegacy("Cat", {x: 2, y: 25, w: 3, h: 1}, {x: 256, y: 72, w: 24, h: 8}, ()) // top
  Generator.drawTextureLegacy("Cat", {x: 5, y: 26, w: 1, h: 2}, {x: 280, y: 80, w: 8, h: 16}, ()) // right
  Generator.drawTextureLegacy("Cat", {x: 1, y: 26, w: 1, h: 2}, {x: 248, y: 80, w: 8, h: 16}, ()) // left
  Generator.drawTextureLegacy(
    "Cat",
    {x: 5, y: 25, w: 3, h: 1},
    {x: 256, y: 96, w: 24, h: 8},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Ears

  // left
  Generator.drawTextureLegacy(
    "Cat",
    {x: 6, y: 12, w: 2, h: 1},
    {x: 253, y: 161, w: 16, h: 8},
    ~rotateLegacy=90.0,
    (),
  ) //left
  Generator.drawTextureLegacy("Cat", {x: 8, y: 12, w: 1, h: 1}, {x: 253, y: 177, w: 8, h: 8}, ()) //front
  Generator.drawTextureLegacy(
    "Cat",
    {x: 9, y: 12, w: 2, h: 1},
    {x: 261, y: 177, w: 16, h: 8},
    ~rotateLegacy=-90.0,
    (),
  ) //right
  Generator.drawTextureLegacy(
    "Cat",
    {x: 11, y: 12, w: 1, h: 1},
    {x: 261, y: 161, w: 8, h: 8},
    ~rotateLegacy=180.0,
    (),
  ) //back
  Generator.drawTextureLegacy("Cat", {x: 8, y: 10, w: 1, h: 2}, {x: 253, y: 161, w: 8, h: 16}, ()) //top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 9, y: 10, w: 1, h: 2},
    {x: 269, y: 161, w: 8, h: 16},
    ~flip=#Horizontal,
    (),
  ) //bottom

  // right
  Generator.drawTextureLegacy(
    "Cat",
    {x: 0, y: 12, w: 2, h: 1},
    {x: 176, y: 161, w: 16, h: 8},
    ~rotateLegacy=90.0,
    (),
  ) //left
  Generator.drawTextureLegacy("Cat", {x: 2, y: 12, w: 1, h: 1}, {x: 176, y: 177, w: 8, h: 8}, ()) //front
  Generator.drawTextureLegacy(
    "Cat",
    {x: 3, y: 12, w: 2, h: 1},
    {x: 184, y: 177, w: 16, h: 8},
    ~rotateLegacy=-90.0,
    (),
  ) //right
  Generator.drawTextureLegacy(
    "Cat",
    {x: 5, y: 12, w: 1, h: 1},
    {x: 184, y: 161, w: 8, h: 8},
    ~rotateLegacy=180.0,
    (),
  ) //back
  Generator.drawTextureLegacy("Cat", {x: 2, y: 10, w: 1, h: 2}, {x: 176, y: 161, w: 8, h: 16}, ()) //top
  Generator.drawTextureLegacy(
    "Cat",
    {x: 3, y: 10, w: 1, h: 2},
    {x: 192, y: 161, w: 8, h: 16},
    ~flip=#Horizontal,
    (),
  ) //bottom

  // Background
  Generator.drawImage("Background", (0, 0))

  //Fold Lines
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
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
