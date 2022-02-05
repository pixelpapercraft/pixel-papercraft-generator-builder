let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-axolotl-character"

let name = "Minecraft Axolotl Character"

let history = ["Feb 2022 M16 - Initial script developed."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2thumbnail_256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Blue",
    url: requireTexture("axolotl_blue"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Cyan",
    url: requireTexture("axolotl_cyan"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Pink",
    url: requireTexture("axolotl_lucy"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Gold",
    url: requireTexture("axolotl_gold"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Brown",
    url: requireTexture("axolotl_wild"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacterLegacy.steve
let alex = TextureMap.MinecraftCharacterLegacy.alex

let script = () => {
  // Define input textures
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})
  Generator.defineTextureInput(
    "Tail Fin Texture",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Blue", "Cyan", "Pink", "Gold", "Brown"],
    },
  )
  Generator.defineTextureInput(
    "Head Fins Texture",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Blue", "Cyan", "Pink", "Gold", "Brown"],
    },
  )
  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Axolotl Eyes", true)
  Generator.defineBooleanInput("Show Skin Overlay", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showEyes = Generator.getBooleanInputValue("Axolotl Eyes")
  let showOverlay = Generator.getBooleanInputValue("Show Skin Overlay")

  // Head
  Generator.drawTexture(
    //Axolotl's right
    "Skin",
    (0, 8, 8, 8),
    (189, 214, 40, 40),
    (),
  )
  Generator.drawTexture(
    //Front
    "Skin",
    (8, 8, 8, 8),
    (229, 214, 64, 40),
    (),
  )
  Generator.drawTexture(
    //Axolotl's left
    "Skin",
    (16, 8, 8, 8),
    (293, 214, 40, 40),
    (),
  )
  Generator.drawTexture(
    //Back
    "Skin",
    (24, 8, 8, 8),
    (333, 214, 64, 40),
    (),
  )
  Generator.drawTexture(
    //Front
    "Skin",
    (8, 0, 8, 8),
    (229, 174, 64, 40),
    (),
  )
  Generator.drawTexture(
    //Bottom
    "Skin",
    (16, 0, 8, 8),
    (229, 254, 64, 40),
    ~flip=#Vertical,
    (),
  )

  //Body
  Generator.drawTexture(
    //Top
    "Skin",
    (20, 16, 8, 4),
    (234, 405, 64, 32),
    (),
  )
  Generator.drawTexture(
    //Back
    "Skin",
    (32, 20, 8, 12),
    (234, 325, 64, 80),
    ~flip=#Vertical,
    (),
  )
  Generator.drawTexture(
    //Bottom
    "Skin",
    (28, 16, 8, 4),
    (378, 405, 64, 32),
    ~flip=#Vertical,
    (),
  )
  Generator.drawTexture(
    //Front
    "Skin",
    (20, 20, 8, 12),
    (234, 437, 64, 80),
    (),
  )
  Generator.drawTexture(
    //Left
    "Skin",
    (28, 20, 4, 12),
    (298, 437, 32, 80),
    ~rotateLegacy=-90.00,
    (),
  )
  Generator.drawTexture(
    //Right
    "Skin",
    (16, 20, 4, 12),
    (234, 405, 32, 80),
    ~rotateLegacy=90.00,
    (),
  )

  // Arms
  if alexModel {
    //Left Arm
    Generator.drawTexture(
      //Front
      "Skin",
      (39, 52, 4, 11),
      (469, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Front-Hand
      "Skin",
      (39, 63, 4, 1),
      (461, 495, 24, 16),
      (),
    )
    Generator.drawTexture(
      //Back
      "Skin",
      (32, 52, 4, 11),
      (445, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Back-Hand
      "Skin",
      (32, 63, 4, 1),
      (437, 495, 24, 16),
      (),
    )

    //Right Arm
    Generator.drawTexture(
      //Front
      "Skin",
      (47, 20, 4, 11),
      (387, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Front-Hand
      "Skin",
      (47, 31, 4, 1),
      (379, 495, 24, 16),
      (),
    )
    Generator.drawTexture(
      //Back
      "Skin",
      (40, 20, 4, 11),
      (411, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Back-Hand
      "Skin",
      (40, 31, 4, 1),
      (403, 495, 24, 16),
      (),
    )
  } else {
    //Left Arm
    Generator.drawTexture(
      //Front
      "Skin",
      (40, 52, 4, 11),
      (469, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Front-Hand
      "Skin",
      (40, 63, 4, 1),
      (461, 495, 24, 16),
      (),
    )
    Generator.drawTexture(
      //Back
      "Skin",
      (32, 52, 4, 11),
      (445, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Back-Hand
      "Skin",
      (32, 63, 4, 1),
      (437, 495, 24, 16),
      (),
    )

    //Right Arm
    Generator.drawTexture(
      //Front
      "Skin",
      (48, 20, 4, 11),
      (387, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Front-Hand
      "Skin",
      (48, 31, 4, 1),
      (379, 495, 24, 16),
      (),
    )
    Generator.drawTexture(
      //Back
      "Skin",
      (40, 20, 4, 11),
      (411, 471, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Back-Hand
      "Skin",
      (40, 31, 4, 1),
      (403, 495, 24, 16),
      (),
    )
  }

  // Right Leg
  Generator.drawTexture(
    //Right Side
    "Skin",
    (0, 20, 4, 11),
    (387, 524, 8, 24),
    (),
  )
  Generator.drawTexture(
    //Right Foot
    "Skin",
    (0, 31, 4, 1),
    (379, 548, 24, 16),
    (),
  )
  Generator.drawTexture(
    //Left Side
    "Skin",
    (8, 20, 4, 11),
    (411, 524, 8, 24),
    (),
  )
  Generator.drawTexture(
    //Left Foot
    "Skin",
    (8, 31, 4, 1),
    (403, 548, 24, 16),
    (),
  )

  // Left Leg
  Generator.drawTexture(
    //Right Side
    "Skin",
    (16, 52, 4, 11),
    (445, 524, 8, 24),
    (),
  )
  Generator.drawTexture(
    //Right Foot
    "Skin",
    (16, 63, 4, 1),
    (437, 548, 24, 16),
    (),
  )
  Generator.drawTexture(
    //Left Side
    "Skin",
    (24, 52, 4, 11),
    (469, 524, 8, 24),
    (),
  )
  Generator.drawTexture(
    //Left Foot
    "Skin",
    (24, 63, 4, 1),
    (461, 548, 24, 16),
    (),
  )

  //Fins
  //Tail
  Generator.drawTexture(
    //Left Side
    "Skin",
    (35, 20, 1, 12),
    (258, 533, 40, 168),
    (),
  )
  Generator.drawTexture(
    //Right Side
    "Skin",
    (36, 20, 1, 12),
    (298, 533, 40, 168),
    (),
  )
  //Head
  Generator.drawTexture(
    //Top Left Fin's Backside
    "Skin",
    (9, 1, 2, 1),
    (273, 7, 24, 24),
    ~flip=#Horizontal,
    (),
  )
  Generator.drawTexture(
    //Top Left Fin's Frontside
    "Skin",
    (9, 2, 2, 1),
    (249, 7, 24, 24),
    (),
  )
  Generator.drawTexture(
    //Top Right Fin's Backside
    "Skin",
    (13, 1, 2, 1),
    (299, 7, 24, 24),
    ~flip=#Horizontal,
    (),
  )
  Generator.drawTexture(
    //Top Right Fin's Frontside
    "Skin",
    (13, 2, 2, 1),
    (323, 7, 24, 24),
    (),
  )
  Generator.drawTexture(
    //Middle Left Fin's Backside
    "Skin",
    (1, 8, 1, 3),
    (268, 41, 24, 32),
    (),
  )
  Generator.drawTexture(
    //Middle Left Fin's Frontside
    "Skin",
    (2, 8, 1, 3),
    (268, 73, 24, 32),
    (),
  )
  Generator.drawTexture(
    //Middle Right Fin's Backside
    "Skin",
    (22, 8, 1, 3),
    (304, 41, 24, 32),
    (),
  )
  Generator.drawTexture(
    //Middle Right Fin's Frontside
    "Skin",
    (21, 8, 1, 3),
    (304, 73, 24, 32),
    (),
  )
  Generator.drawTexture(
    //Bottom Left Fin's Backside
    "Skin",
    (2, 14, 1, 2),
    (268, 110, 24, 24),
    (),
  )
  Generator.drawTexture(
    //Bottom Left Fin's Frontside
    "Skin",
    (1, 14, 1, 2),
    (268, 134, 24, 24),
    (),
  )
  Generator.drawTexture(
    //Bottom Right Fin's Backside
    "Skin",
    (21, 14, 1, 2),
    (304, 110, 24, 24),
    (),
  )
  Generator.drawTexture(
    //Bottom Right Fin's Frontside
    "Skin",
    (22, 14, 1, 2),
    (304, 134, 24, 24),
    (),
  )

  //Overlay
  if showOverlay {
    // Head
    Generator.drawTexture(
      //Axolotl's right
      "Skin",
      (32, 8, 8, 8),
      (189, 214, 40, 40),
      (),
    )
    Generator.drawTexture(
      //Front
      "Skin",
      (40, 8, 8, 8),
      (229, 214, 64, 40),
      (),
    )
    Generator.drawTexture(
      //Axolotl's left
      "Skin",
      (48, 8, 8, 8),
      (293, 214, 40, 40),
      (),
    )
    Generator.drawTexture(
      //Back
      "Skin",
      (56, 8, 8, 8),
      (333, 214, 64, 40),
      (),
    )
    Generator.drawTexture(
      //Front
      "Skin",
      (40, 0, 8, 8),
      (229, 174, 64, 40),
      (),
    )
    Generator.drawTexture(
      //Bottom
      "Skin",
      (48, 0, 8, 8),
      (229, 254, 64, 40),
      ~flip=#Vertical,
      (),
    )

    //Body
    Generator.drawTexture(
      //Top
      "Skin",
      (20, 32, 8, 4),
      (234, 405, 64, 32),
      (),
    )
    Generator.drawTexture(
      //Back
      "Skin",
      (32, 36, 8, 12),
      (234, 325, 64, 80),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(
      //Bottom
      "Skin",
      (28, 32, 8, 4),
      (378, 405, 64, 32),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(
      //Front
      "Skin",
      (20, 36, 8, 12),
      (234, 437, 64, 80),
      (),
    )
    Generator.drawTexture(
      //Left
      "Skin",
      (28, 36, 4, 12),
      (298, 437, 32, 80),
      ~rotateLegacy=-90.00,
      (),
    )
    Generator.drawTexture(
      //Right
      "Skin",
      (16, 36, 4, 12),
      (234, 405, 32, 80),
      ~rotateLegacy=90.00,
      (),
    )
    // Arms
    if alexModel {
      //Left Arm
      Generator.drawTexture(
        //Front
        "Skin",
        (55, 52, 4, 11),
        (469, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Front-Hand
        "Skin",
        (55, 63, 4, 1),
        (461, 495, 24, 16),
        (),
      )
      Generator.drawTexture(
        //Back
        "Skin",
        (48, 52, 4, 11),
        (445, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Back-Hand
        "Skin",
        (48, 63, 4, 1),
        (437, 495, 24, 16),
        (),
      )

      //Right Arm
      Generator.drawTexture(
        //Front
        "Skin",
        (47, 36, 4, 11),
        (387, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Front-Hand
        "Skin",
        (47, 47, 4, 1),
        (379, 495, 24, 16),
        (),
      )
      Generator.drawTexture(
        //Back
        "Skin",
        (40, 36, 4, 11),
        (411, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Back-Hand
        "Skin",
        (40, 47, 4, 1),
        (403, 495, 24, 16),
        (),
      )
    } else {
      //Left Arm
      Generator.drawTexture(
        //Front
        "Skin",
        (56, 52, 4, 11),
        (469, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Front-Hand
        "Skin",
        (56, 63, 4, 1),
        (461, 495, 24, 16),
        (),
      )
      Generator.drawTexture(
        //Back
        "Skin",
        (48, 52, 4, 11),
        (445, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Back-Hand
        "Skin",
        (48, 63, 4, 1),
        (437, 495, 24, 16),
        (),
      )

      //Right Arm
      Generator.drawTexture(
        //Front
        "Skin",
        (48, 36, 4, 11),
        (387, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Front-Hand
        "Skin",
        (48, 47, 4, 1),
        (379, 495, 24, 16),
        (),
      )
      Generator.drawTexture(
        //Back
        "Skin",
        (40, 36, 4, 11),
        (411, 471, 8, 24),
        (),
      )
      Generator.drawTexture(
        //Back-Hand
        "Skin",
        (40, 47, 4, 1),
        (403, 495, 24, 16),
        (),
      )
    }

    // Right Leg
    Generator.drawTexture(
      //Right Side
      "Skin",
      (0, 36, 4, 11),
      (387, 524, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Right Foot
      "Skin",
      (0, 47, 4, 1),
      (379, 548, 24, 16),
      (),
    )
    Generator.drawTexture(
      //Left Side
      "Skin",
      (8, 36, 4, 11),
      (411, 524, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Left Foot
      "Skin",
      (8, 47, 4, 1),
      (403, 548, 24, 16),
      (),
    )

    // Left Leg
    Generator.drawTexture(
      //Right Side
      "Skin",
      (0, 52, 4, 11),
      (445, 524, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Right Foot
      "Skin",
      (0, 63, 4, 1),
      (437, 548, 24, 16),
      (),
    )
    Generator.drawTexture(
      //Left Side
      "Skin",
      (8, 52, 4, 11),
      (469, 524, 8, 24),
      (),
    )
    Generator.drawTexture(
      //Left Foot
      "Skin",
      (8, 63, 4, 1),
      (461, 548, 24, 16),
      (),
    )

    //Fins
    //Tail
    Generator.drawTexture(
      //Left Side
      "Skin",
      (35, 36, 1, 12),
      (258, 533, 40, 168),
      (),
    )
    Generator.drawTexture(
      //Left Side
      "Skin",
      (36, 36, 1, 12),
      (298, 533, 40, 168),
      (),
    )
    //Head
    Generator.drawTexture(
      //Top Left Fin's Backside
      "Skin",
      (41, 1, 2, 1),
      (273, 7, 24, 24),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      //Top Left Fin's Frontside
      "Skin",
      (41, 2, 2, 1),
      (249, 7, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Top Right Fin's Backside
      "Skin",
      (45, 1, 2, 1),
      (299, 7, 24, 24),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      //Top Right Fin's Frontside
      "Skin",
      (45, 2, 2, 1),
      (323, 7, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Middle Left Fin's Backside
      "Skin",
      (33, 8, 1, 3),
      (268, 41, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Middle Left Fin's Frontside
      "Skin",
      (34, 8, 1, 3),
      (268, 73, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Middle Right Fin's Backside
      "Skin",
      (54, 8, 1, 3),
      (304, 41, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Middle Right Fin's Frontside
      "Skin",
      (53, 8, 1, 3),
      (304, 73, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Bottom Left Fin's Backside
      "Skin",
      (34, 14, 1, 2),
      (268, 110, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Bottom Left Fin's Frontside
      "Skin",
      (33, 14, 1, 2),
      (268, 134, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Bottom Right Fin's Backside
      "Skin",
      (53, 14, 1, 2),
      (304, 110, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Bottom Right Fin's Frontside
      "Skin",
      (54, 14, 1, 2),
      (304, 134, 24, 24),
      (),
    )
  }

  //Axolotl Eyes
  if showEyes {
    Generator.drawTexture("Skin", (9, 12, 6, 2), (221, 229, 80, 16), ())
    if showOverlay {
      Generator.drawTexture("Skin", (41, 12, 6, 2), (221, 229, 80, 16), ())
    }
  }

  let showTail = Generator.hasTexture("Tail Fin Texture")
  if showTail {
    Generator.drawTexture(
      //Left Side upper
      "Tail Fin Texture",
      (2, 26, 9, 1),
      (258, 605, 72, 8),
      ~rotateLegacy=-90.00,
      (),
    )
    Generator.drawTexture(
      //Right Side upper
      "Tail Fin Texture",
      (2, 26, 9, 1),
      (330, 605, 72, 8),
      ~rotateLegacy=-90.00,
      (),
    )
    Generator.drawTexture(
      //Left Side lower
      "Tail Fin Texture",
      (2, 31, 12, 5),
      (258, 701, 96, 40),
      ~rotateLegacy=-90.00,
      (),
    )
    Generator.drawTexture(
      //right Side lower
      "Tail Fin Texture",
      (2, 31, 12, 5),
      (298, 701, 96, 40),
      ~rotateLegacy=-90.00,
      ~flip=#Vertical,
      (),
    )
  }

  let showFins = Generator.hasTexture("Head Fins Texture")
  if showFins {
    //Head
    Generator.drawTexture(
      //Top Left Fin's Backside
      "Head Fins Texture",
      (3, 37, 3, 3),
      (249, 7, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Top Left Fin's Frontside
      "Head Fins Texture",
      (8, 37, 3, 3),
      (273, 7, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Top Right Fin's Backside
      "Head Fins Texture",
      (3, 37, 3, 3),
      (299, 7, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Top Right Fin's Frontside
      "Head Fins Texture",
      (8, 37, 3, 3),
      (323, 7, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Middle Left Fin's Backside
      "Head Fins Texture",
      (0, 40, 3, 4),
      (268, 41, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Middle Right Fin's Backside
      "Head Fins Texture",
      (11, 40, 3, 4),
      (304, 41, 24, 32),
      (),
    )
    Generator.drawTexture(
      //Middle Right Fin's Frontside
      "Head Fins Texture",
      (0, 40, 3, 4),
      (268, 73, 24, 32),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      //Middle Left Fin's Frontside
      "Head Fins Texture",
      (11, 40, 3, 4),
      (304, 73, 24, 32),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      //Bottom Left Fin's Backside
      "Head Fins Texture",
      (0, 44, 3, 3),
      (268, 110, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Bottom Left Fin's Frontside
      "Head Fins Texture",
      (11, 44, 3, 3),
      (304, 110, 24, 24),
      (),
    )
    Generator.drawTexture(
      //Bottom Right Fin's Backside
      "Head Fins Texture",
      (0, 44, 3, 3),
      (268, 134, 24, 24),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(
      //Bottom Right Fin's Frontside
      "Head Fins Texture",
      (11, 44, 3, 3),
      (304, 134, 24, 24),
      ~flip=#Vertical,
      (),
    )
  }

  // Background
  Generator.drawImage("Background", (0, 0))

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
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
