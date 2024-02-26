let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character-heads"

let name = "Minecraft Character Heads"

let history = [
  "Originally developed by ODF.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "17 Jul 2021 M16 - Updated generator photo.",
  "12 Jun 2022 NinjolasNJM - Updated to use Minecraft module, and added Action Figure option",
  "02 Feb 2024 NinjolasNJM - added skin input and improved folds",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background")},
  {id: "Tabs", url: requireImage("Tabs")},
  {id: "Folds", url: requireImage("Folds")},
  {id: "Action Figure", url: requireImage("Action-Figure")},
]

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
    {
      id: "Zombie",
      url: requireTexture("Zombie"),
      standardWidth: 64,
      standardHeight: 64,
    },
    {
      id: "Enderman",
      url: requireTexture("Enderman"),
      standardWidth: 64,
      standardHeight: 64,
    },
    {
      id: "Skeleton",
      url: requireTexture("Skeleton"),
      standardWidth: 64,
      standardHeight: 64,
    },
    {
      id: "Wither Skeleton",
      url: requireTexture("Wither_Skeleton"),
      standardWidth: 64,
      standardHeight: 64,
    },
    {
      id: "Creeper",
      url: requireTexture("Creeper"),
      standardWidth: 64,
      standardHeight: 64,
    },
    {
      id: "Blaze",
      url: requireTexture("Blaze"),
      standardWidth: 64,
      standardHeight: 64,
    },
  ],
)

let script = () => {
  // Define user inputs
  for i in 1 to 8 {
    Generator.defineSkinInput(
      "Head " ++ Js.Int.toString(i),
      {
        standardWidth: 64,
        standardHeight: 64,
        choices: [
          "Steve",
          "Alex",
          "Zombie",
          "Enderman",
          "Skeleton",
          "Wither Skeleton",
          "Creeper",
          "Blaze",
        ],
      },
    )
  }

  // Define and get user variables
  let showFolds = Generator.defineAndGetBooleanInput("Show Folds", true)
  let actionFigure = Generator.defineAndGetBooleanInput("Action Figure", false)

  let steve = Minecraft.Character.steve

  // Helper Function to draw heads
  let drawHead = (textureId, x, y) => {
    let x = x - 64
    let y = y - 64
    if Generator.hasTexture(textureId) {
      // Draw Tabs
      Generator.drawImage("Tabs", (x - 26, y - 1))
      // Define Overlay Input
      let showOverlay = Generator.getBooleanInputValueWithDefault(
        "Show " ++ textureId ++ " Overlay",
        true,
      )
      Generator.defineRegionInput((x, y, 256, 192), () => {
        Generator.setBooleanInputValue("Show " ++ textureId ++ " Overlay", !showOverlay)
      })
      // Draw Head
      Minecraft.drawCuboid(textureId, steve.base.head, (x, y), (64, 64, 64), ())
      if showOverlay {
        Minecraft.drawCuboid(textureId, steve.overlay.head, (x, y), (64, 64, 64), ())
      }

      // draw Folds and Action Figure Cut lines
      if showFolds {
        //Generator.drawFoldLineCuboid((x, y), (64, 64, 64), ())

        Generator.drawImage("Folds", (x - 26, y - 1))
      }
      if actionFigure {
        Generator.drawImage("Action Figure", (x + 64, y + 128))
      }
    }
  }

  // Background
  Generator.drawImage("Background", (0, 0))

  // Draw the heads
  drawHead("Head 1", 99, 79)
  drawHead("Head 2", 387, 79)
  drawHead("Head 3", 99, 279)
  drawHead("Head 4", 387, 279)
  drawHead("Head 5", 99, 479)
  drawHead("Head 6", 387, 479)
  drawHead("Head 7", 99, 679)
  drawHead("Head 8", 387, 679)
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
