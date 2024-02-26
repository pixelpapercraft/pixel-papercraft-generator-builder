let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-horse"

let name = "Minecraft Horse"

let history = ["11 Jul 2021 NinjolasNJM - Initial script finished."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v3-thumbnail-256.jpeg"),
}

let imageIds = ["Foreground-Horse", "Foreground-Mule", "Folds-Horse", "Folds-Mule", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Horse",
    url: requireTexture("horse_white"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Black Horse",
    url: requireTexture("horse_black"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Brown Horse",
    url: requireTexture("horse_brown"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Chestnut Horse",
    url: requireTexture("horse_chestnut"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Creamy Horse",
    url: requireTexture("horse_creamy"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Dark Brown Horse",
    url: requireTexture("horse_darkbrown"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Gray Horse",
    url: requireTexture("horse_gray"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "White Horse",
    url: requireTexture("horse_white"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skeleton Horse",
    url: requireTexture("horse_skeleton"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Zombie Horse",
    url: requireTexture("horse_zombie"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Donkey",
    url: requireTexture("donkey"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Mule",
    url: requireTexture("mule"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Black Dots",
    url: requireTexture("horse_markings_blackdots"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "White",
    url: requireTexture("horse_markings_white"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "White Dots",
    url: requireTexture("horse_markings_whitedots"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "White Field",
    url: requireTexture("horse_markings_whitefield"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Leather",
    url: requireTexture("horse_armor_leather"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Gold",
    url: requireTexture("horse_armor_gold"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Iron",
    url: requireTexture("horse_armor_iron"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Diamond",
    url: requireTexture("horse_armor_diamond"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Horse",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: [
        "Black Horse",
        "Brown Horse",
        "Chestnut Horse",
        "Creamy Horse",
        "Dark Brown Horse",
        "Gray Horse",
        "White Horse",
        "Skeleton Horse",
        "Zombie Horse",
        "Donkey",
        "Mule",
      ],
    },
  )
  Generator.defineTextureInput(
    "Markings",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Black Dots", "White", "White Dots", "White Field"],
    },
  )
  Generator.defineTextureInput(
    "Armor",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Leather", "Gold", "Iron", "Diamond"],
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Donkey / Mule Model", false)

  // Get user variable values
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let muleModel = Generator.getBooleanInputValue("Donkey / Mule Model")

  // Define regions

  let drawHorse = (texture: string) => {
    // Head
    let ox = 20
    let oy = 20

    Generator.drawTexture(texture, (7, 13, 6, 7), (ox + 56, oy + 0, 48, 56), ()) // Top
    Generator.drawTexture(texture, (13, 13, 6, 7), (ox + 56, oy + 96, 48, 56), ~flip=#Vertical, ()) // Bottom
    Generator.drawTexture(texture, (0, 20, 7, 5), (ox + 0, oy + 56, 56, 40), ()) // Right
    Generator.drawTexture(texture, (7, 20, 6, 5), (ox + 56, oy + 56, 48, 40), ()) // Front
    Generator.drawTexture(texture, (13, 20, 7, 5), (ox + 104, oy + 56, 56, 40), ()) // Left
    Generator.drawTexture(texture, (20, 20, 6, 5), (ox + 160, oy + 56, 48, 40), ()) // Back

    // Mouth
    let ox = 140
    let oy = 142

    Generator.drawTexture(texture, (5, 25, 4, 5), (ox + 40, oy + 0, 32, 40), ()) // Top
    Generator.drawTexture(texture, (9, 25, 4, 5), (ox + 40, oy + 80, 32, 40), ~flip=#Vertical, ()) // Bottom
    Generator.drawTexture(texture, (0, 30, 5, 5), (ox + 0, oy + 40, 40, 40), ()) // Right
    Generator.drawTexture(texture, (5, 30, 4, 5), (ox + 40, oy + 40, 32, 40), ()) // Front
    Generator.drawTexture(texture, (9, 30, 5, 5), (ox + 72, oy + 40, 40, 40), ()) // Left
    Generator.drawTexture(texture, (14, 30, 4, 5), (ox + 112, oy + 40, 32, 40), ()) // Back

    // Neck
    let ox = 24
    let oy = 232

    Generator.drawTexture(texture, (7, 35, 4, 7), (ox + 56, oy + 0, 32, 56), ()) // Top
    Generator.drawTexture(texture, (11, 35, 4, 7), (ox + 56, oy + 152, 32, 56), ~flip=#Vertical, ()) // Bottom
    Generator.drawTexture(texture, (0, 42, 7, 12), (ox + 0, oy + 56, 56, 96), ()) // Right
    Generator.drawTexture(texture, (7, 42, 4, 12), (ox + 56, oy + 56, 32, 96), ()) // Front
    Generator.drawTexture(texture, (11, 42, 7, 12), (ox + 88, oy + 56, 56, 96), ()) // Left
    Generator.drawTexture(texture, (18, 42, 4, 12), (ox + 144, oy + 56, 32, 96), ()) // Back

    // Mane
    let ox = 321
    let oy = 16

    Generator.drawTexture(texture, (58, 36, 2, 2), (ox + 16, oy + 0, 16, 16), ~rotate=180.0, ()) // Top
    //Generator.drawTexture(texture, (60, 36, 2, 2), (ox + 16, oy + 144, 16, 16), ~rotate=180.0, ~flip=#Vertical, ()) // Bottom
    Generator.drawTexture(texture, (56, 38, 2, 16), (ox + 32, oy + 16, 16, 128), ()) // Right
    Generator.drawTexture(texture, (58, 38, 2, 16), (ox + 48, oy + 16, 16, 128), ()) // Front
    Generator.drawTexture(texture, (60, 38, 2, 16), (ox + 0, oy + 16, 16, 128), ()) // Left
    Generator.drawTexture(texture, (62, 38, 2, 16), (ox + 16, oy + 16, 16, 128), ()) // Back

    // Tail
    let ox = 224
    let oy = 348

    Generator.drawTexture(texture, (46, 36, 3, 4), (ox + 32, oy + 0, 24, 32), ~rotate=180.0, ()) // Top
    // Generator.drawTexture(texture, (49, 36, 3, 4), (ox + 32, oy + 144, 24, 32), ~flip=#Vertical, ()) // Bottom Is not generated
    Generator.drawTexture(texture, (42, 40, 4, 14), (ox + 56, oy + 32, 32, 112), ()) // Right
    Generator.drawTexture(texture, (46, 40, 3, 14), (ox + 88, oy + 32, 24, 112), ()) // Front
    Generator.drawTexture(texture, (49, 40, 4, 14), (ox + 0, oy + 32, 32, 112), ()) // Left
    Generator.drawTexture(texture, (53, 40, 3, 14), (ox + 32, oy + 32, 24, 112), ()) // Back

    // Horse Ears
    let horseEars = (ox: int, oy: int) => {
      Generator.drawTexture(texture, (20, 16, 2, 1), (ox + 8, oy + 40, 16, 8), ()) // Top
      Generator.drawTexture(texture, (22, 16, 2, 1), (ox + 8, oy + 64, 16, 8), ~flip=#Vertical, ()) // Bottom
      Generator.drawTexture(texture, (19, 17, 1, 2), (ox + 0, oy + 48, 8, 16), ()) // Right
      Generator.drawTexture(texture, (20, 17, 2, 2), (ox + 8, oy + 48, 16, 16), ()) // Front
      Generator.drawTexture(texture, (22, 17, 1, 2), (ox + 24, oy + 48, 8, 16), ()) // Left
      Generator.drawTexture(texture, (23, 17, 2, 2), (ox + 32, oy + 48, 16, 16), ()) // Back
    }

    // Donkey / Mule Ears

    let muleEars = (ox: int, oy: int) => {
      Generator.drawTexture(texture, (1, 12, 2, 1), (ox + 8, oy + 0, 16, 8), ()) // Top
      Generator.drawTexture(texture, (3, 12, 2, 1), (ox + 8, oy + 64, 16, 8), ~flip=#Vertical, ()) // Bottom
      Generator.drawTexture(texture, (0, 13, 1, 7), (ox + 0, oy + 8, 8, 56), ()) // Right
      Generator.drawTexture(texture, (1, 13, 2, 7), (ox + 8, oy + 8, 16, 56), ()) // Front
      Generator.drawTexture(texture, (3, 13, 1, 7), (ox + 24, oy + 8, 8, 56), ()) // Left
      Generator.drawTexture(texture, (4, 13, 2, 7), (ox + 32, oy + 8, 16, 56), ()) // Back
    }

    // Left Ear
    let ox = 332
    let oy = 249

    if muleModel {
      muleEars(ox, oy)
    } else {
      horseEars(ox, oy)
    }

    // Right Ear
    let ox = 256
    let oy = 249

    if muleModel {
      muleEars(ox, oy)
    } else {
      horseEars(ox, oy)
    }

    // Body
    let ox = 40
    let oy = 452

    Generator.drawTexture(texture, (22, 32, 10, 22), (ox + 80, oy + 80, 80, 176), ~rotate=180.0, ()) // Top
    Generator.drawTexture(
      texture,
      (32, 32, 10, 22),
      (ox + 240, oy + 80, 80, 176),
      ~flip=#Vertical,
      (),
    ) // Bottom
    Generator.drawTexture(
      texture,
      (0, 54, 22, 10),
      (ox + 112, oy + 128, 176, 80),
      ~rotate=-90.0,
      (),
    ) // Right
    Generator.drawTexture(texture, (22, 54, 10, 10), (ox + 80, oy + 0, 80, 80), ~rotate=180.0, ()) // Front
    Generator.drawTexture(texture, (32, 54, 22, 10), (ox - 48, oy + 128, 176, 80), ~rotate=90.0, ()) // Left
    Generator.drawTexture(texture, (54, 54, 10, 10), (ox + 80, oy + 256, 80, 80), ()) // Back

    // Front Left Leg
    let ox = 413
    let oy = 40

    Generator.drawTexture(texture, (52, 21, 4, 4), (ox + 64, oy + 0, 32, 32), ~flip=#Horizontal, ()) // Top
    Generator.drawTexture(texture, (56, 21, 4, 4), (ox + 64, oy + 120, 32, 32), ~rotate=180.0, ()) // Bottom
    Generator.drawTexture(
      texture,
      (48, 25, 4, 11),
      (ox + 96, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Right
    Generator.drawTexture(
      texture,
      (52, 25, 4, 11),
      (ox + 64, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Front
    Generator.drawTexture(
      texture,
      (56, 25, 4, 11),
      (ox + 32, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Left
    Generator.drawTexture(
      texture,
      (60, 25, 4, 11),
      (ox + 0, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Back

    // Front Right Leg
    let ox = 413
    let oy = 238

    Generator.drawTexture(texture, (52, 21, 4, 4), (ox + 32, oy + 0, 32, 32), ()) // Top
    Generator.drawTexture(texture, (56, 21, 4, 4), (ox + 32, oy + 120, 32, 32), ~flip=#Vertical, ()) // Bottom
    Generator.drawTexture(texture, (48, 25, 4, 11), (ox + 0, oy + 32, 32, 88), ()) // Right
    Generator.drawTexture(texture, (52, 25, 4, 11), (ox + 32, oy + 32, 32, 88), ()) // Front
    Generator.drawTexture(texture, (56, 25, 4, 11), (ox + 64, oy + 32, 32, 88), ()) // Left
    Generator.drawTexture(texture, (60, 25, 4, 11), (ox + 96, oy + 32, 32, 88), ()) // Back

    // Back Left Leg
    let ox = 413
    let oy = 436

    Generator.drawTexture(texture, (52, 21, 4, 4), (ox + 64, oy + 0, 32, 32), ~flip=#Horizontal, ()) // Top
    Generator.drawTexture(texture, (56, 21, 4, 4), (ox + 64, oy + 120, 32, 32), ~rotate=180.0, ()) // Bottom
    Generator.drawTexture(
      texture,
      (48, 25, 4, 11),
      (ox + 96, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Right
    Generator.drawTexture(
      texture,
      (52, 25, 4, 11),
      (ox + 64, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Front
    Generator.drawTexture(
      texture,
      (56, 25, 4, 11),
      (ox + 32, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Left
    Generator.drawTexture(
      texture,
      (60, 25, 4, 11),
      (ox + 0, oy + 32, 32, 88),
      ~flip=#Horizontal,
      (),
    ) // Back

    // Back Right Leg
    let ox = 413
    let oy = 634

    Generator.drawTexture(texture, (52, 21, 4, 4), (ox + 32, oy + 0, 32, 32), ()) // Top
    Generator.drawTexture(texture, (56, 21, 4, 4), (ox + 32, oy + 120, 32, 32), ~flip=#Vertical, ()) // Bottom
    Generator.drawTexture(texture, (48, 25, 4, 11), (ox + 0, oy + 32, 32, 88), ()) // Right
    Generator.drawTexture(texture, (52, 25, 4, 11), (ox + 32, oy + 32, 32, 88), ()) // Front
    Generator.drawTexture(texture, (56, 25, 4, 11), (ox + 64, oy + 32, 32, 88), ()) // Left
    Generator.drawTexture(texture, (60, 25, 4, 11), (ox + 96, oy + 32, 32, 88), ()) // Back
  }

  // Draw Horse
  drawHorse("Horse")
  drawHorse("Markings")
  drawHorse("Armor")

  // Foreground
  if muleModel {
    Generator.drawImage("Foreground-Mule", (0, 0))
  } else {
    Generator.drawImage("Foreground-Horse", (0, 0))
  }

  // Folds
  if showFolds {
    if muleModel {
      Generator.drawImage("Folds-Mule", (0, 0))
    } else {
      Generator.drawImage("Folds-Horse", (0, 0))
    }
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
