let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character-heads"

let name = "Minecraft Character Heads"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail.jpg"),
}

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background")},
  {id: "Tabs", url: requireImage("Tabs")},
  {id: "Folds", url: requireImage("Folds")},
]

let textures: array<
  Generator.textureDef,
> = [/* {
    id: "Skin 1",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 2",
    url: requireTexture("Alex"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 3",
    url: requireTexture("Zombie"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 4",
    url: requireTexture("Enderman"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 5",
    url: requireTexture("Skeleton"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 6",
    url: requireTexture("Wither_Skeleton"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 7",
    url: requireTexture("Creeper"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 8",
    url: requireTexture("Blaze"),
    standardWidth: 64,
    standardHeight: 64,
  }, */]

let script = () => {
  // Define user inputs
  for i in 1 to 8 {
    Generator.defineTextureInput(
      "Skin " ++ Js.Int.toString(i),
      {standardWidth: 64, standardHeight: 64, choices: []},
    )
  }

  let showHead1 = Generator.hasTexture("Skin 1")
  let showHead2 = Generator.hasTexture("Skin 2")
  let showHead3 = Generator.hasTexture("Skin 3")
  let showHead4 = Generator.hasTexture("Skin 4")
  let showHead5 = Generator.hasTexture("Skin 5")
  let showHead6 = Generator.hasTexture("Skin 6")
  let showHead7 = Generator.hasTexture("Skin 7")
  let showHead8 = Generator.hasTexture("Skin 8")

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)

  // Get user variable values
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Helper Function to draw heads
  let drawHead = (name, x, y) => {
    Generator.drawImage("Tabs", (x - 90, y - 65)) // Head
    Generator.drawTextureLegacy(
      name,
      {x: 0, y: 8, w: 8, h: 8},
      {x: x - 64, y: y + 0, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      name,
      {x: 8, y: 8, w: 8, h: 8},
      {x: x + 0, y: y + 0, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      name,
      {x: 16, y: 8, w: 8, h: 8},
      {x: x + 64, y: y + 0, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      name,
      {x: 24, y: 8, w: 8, h: 8},
      {x: x + 128, y: y + 0, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      name,
      {x: 8, y: 0, w: 8, h: 8},
      {x: x + 0, y: y - 64, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      name,
      {x: 16, y: 0, w: 8, h: 8},
      {x: x + 0, y: y + 64, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom

    // Hat Layer
    Generator.drawTextureLegacy(
      name,
      {x: 32, y: 8, w: 8, h: 8},
      {x: x - 64, y: y + 0, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      name,
      {x: 40, y: 8, w: 8, h: 8},
      {x: x + 0, y: y + 0, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      name,
      {x: 48, y: 8, w: 8, h: 8},
      {x: x + 64, y: y + 0, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      name,
      {x: 56, y: 8, w: 8, h: 8},
      {x: x + 128, y: y + 0, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      name,
      {x: 40, y: 0, w: 8, h: 8},
      {x: x + 0, y: y - 64, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      name,
      {x: 48, y: 0, w: 8, h: 8},
      {x: x + 0, y: y + 64, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom
    // Fold Lines
    if showFolds {
      Generator.drawImage("Folds", (x - 90, y - 65))
    }
  }

  // Background
  Generator.drawImage("Background", (0, 0))

  // Draw the heads
  if showHead1 {
    drawHead("Skin 1", 99, 79)
  }
  if showHead2 {
    drawHead("Skin 2", 387, 79)
  }
  if showHead3 {
    drawHead("Skin 3", 99, 279)
  }
  if showHead4 {
    drawHead("Skin 4", 387, 279)
  }
  if showHead5 {
    drawHead("Skin 5", 99, 479)
  }
  if showHead6 {
    drawHead("Skin 6", 387, 479)
  }
  if showHead7 {
    drawHead("Skin 7", 99, 679)
  }
  if showHead8 {
    drawHead("Skin 8", 387, 679)
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
