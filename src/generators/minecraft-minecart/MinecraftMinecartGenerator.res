let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-minecart"

let name = "Minecraft Minecart"

let history = ["30 Jun NinjolasNJM - first release"]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let instructions = "
To make blocks that fit in a minecart, go to the Block Generator and select the block's type to be \"Minecart Block\".
"

let imageIds = ["Foreground-Advanced", "Foreground-Simple"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Minecart",
    url: requireTexture("minecart"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let minecart = Minecraft.Minecart.minecart

let (ox, oy) = (249, 245)

let drawFoldLineRect = ((x, y, w, h): Generator_Builder.rectangle) => {
  Generator.drawFoldLine((x, y - 1), (x + w, y - 1))
  Generator.drawFoldLine((x + w, y), (x + w, y + h))
  Generator.drawFoldLine((x + w, y + h + 1), (x, y + h + 1))
  Generator.drawFoldLine((x, y + h), (x, y))
}

let drawFoldsAdvanced = () => {
  // Center Lines
  Generator.drawFoldLine((ox - 1, oy - 64), (ox - 1, oy + 192))
  Generator.drawFoldLine((ox + 96, oy - 64), (ox + 96, oy + 192))

  Generator.drawFoldLine((ox - 80, oy - 1), (ox + 176, oy - 1))
  Generator.drawFoldLine((ox - 80, oy + 128), (ox + 176, oy + 128))

  // Top Lines
  drawFoldLineRect((ox - 16, oy - 160, 128, 96))
  Generator.drawFoldLine((ox - 16, oy - 80), (ox + 112, oy - 80))

  // Right Lines
  drawFoldLineRect((ox + 176, oy - 16, 80, 160))
  Generator.drawFoldLine((ox + 160, oy), (ox + 160, oy + 128))

  // Bottom Lines
  drawFoldLineRect((ox - 16, oy + 192, 128, 256))
  Generator.drawFoldLine((ox - 16, oy + 207), (ox + 112, oy + 207))
  Generator.drawFoldLine((ox - 16, oy + 288), (ox + 112, oy + 288))

  // Left Lines
  drawFoldLineRect((ox - 160, oy - 16, 80, 160))
  Generator.drawFoldLine((ox - 64, oy), (ox - 64, oy + 128))
}

let drawFoldsSimple = () => {
  drawFoldLineRect((ox - 16, oy - 16, 128, 160))

  drawFoldLineRect((ox - 16, oy - 176, 128, 640))
  drawFoldLineRect((ox - 16, oy - 96, 128, 320))

  drawFoldLineRect((ox - 176, oy - 16, 448, 160))
  drawFoldLineRect((ox - 96, oy - 16, 278, 160))
}

let drawAdvanced = (showFolds: bool) => {
  // Center
  Generator.drawTexture(
    "Minecart",
    (26, 14, 16, 12),
    (ox - 16, oy + 16, 128, 96),
    ~rotate=-90.0,
    (),
  )

  // Front Side

  Generator.drawTexture("Minecart", minecart.sides.front, (ox - 16, oy - 64, 128, 64), ())
  Generator.drawTexture("Minecart", minecart.sides.top, (ox - 16, oy - 80, 128, 16), ())
  Generator.drawTexture(
    "Minecart",
    minecart.sides.back,
    (ox - 16, oy - 144, 128, 64),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.right,
    (ox + 40, oy - 216, 16, 128),
    ~rotate=-90.0,
    (),
  )

  // Right Side

  Generator.drawTexture(
    "Minecart",
    minecart.sides.front,
    (ox + 64, oy + 32, 128, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.top,
    (ox + 104, oy + 56, 128, 16),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.back,
    (ox + 144, oy + 32, 128, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.left,
    (ox + 200, oy - 40, 16, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.right,
    (ox + 200, oy + 104, 16, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.bottom,
    (ox + 168, oy + 56, 160, 16),
    ~flip=#Vertical,
    ~rotate=90.0,
    (),
  )

  // Back Side

  Generator.drawTexture(
    "Minecart",
    minecart.sides.front,
    (ox - 16, oy + 128, 128, 64),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.top,
    (ox - 16, oy + 192, 128, 16),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture("Minecart", minecart.sides.back, (ox - 16, oy + 208, 128, 64), ())
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.left,
    (ox + 40, oy + 216, 16, 128),
    ~rotate=-90.0,
    (),
  )

  // Left Side

  Generator.drawTexture(
    "Minecart",
    minecart.sides.front,
    (ox - 96, oy + 32, 128, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.top,
    (ox - 136, oy + 56, 128, 16),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.back,
    (ox - 176, oy + 32, 128, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.left,
    (ox - 120, oy + 104, 16, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.right,
    (ox - 120, oy - 40, 16, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.top,
    (ox - 232, oy + 56, 160, 16),
    ~rotate=90.0,
    (),
  )

  // Bottom
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.front,
    (ox - 32, oy + 304, 160, 128),
    ~rotate=-90.0,
    (),
  )

  // Draw the Foreground image
  Generator.drawImage("Foreground-Advanced", (0, 0))

  // Folds
  if showFolds {
    drawFoldsAdvanced()
  }
}

let drawSimple = (showFolds: bool) => {
  // Center
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.back,
    (ox - 32, oy, 160, 128),
    ~rotate=-90.0,
    (),
  )

  // Front Side

  Generator.drawTexture("Minecart", minecart.sides.front, (ox - 16, oy - 96, 128, 80), ())
  Generator.drawTexture(
    "Minecart",
    minecart.sides.back,
    (ox - 16, oy - 160, 128, 64),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.right,
    (ox + 40, oy - 232, 16, 128),
    ~rotate=-90.0,
    (),
  )

  // Right Side

  Generator.drawTexture(
    "Minecart",
    minecart.sides.front,
    (ox + 72, oy + 24, 160, 80),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.back,
    (ox + 160, oy + 32, 128, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.left,
    (ox + 216, oy - 40, 16, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.right,
    (ox + 216, oy + 104, 16, 64),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.bottom,
    (ox + 184, oy + 56, 160, 16),
    ~flip=#Vertical,
    ~rotate=90.0,
    (),
  )

  // Back Side

  Generator.drawTexture(
    "Minecart",
    minecart.sides.front,
    (ox - 16, oy + 144, 128, 80),
    ~rotate=180.0,
    (),
  )
  Generator.drawTexture("Minecart", minecart.sides.back, (ox - 16, oy + 224, 128, 64), ())
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.left,
    (ox + 40, oy + 232, 16, 128),
    ~rotate=-90.0,
    (),
  )

  // Left Side

  Generator.drawTexture(
    "Minecart",
    minecart.sides.front,
    (ox - 136, oy + 24, 160, 80),
    ~rotate=-90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.back,
    (ox - 192, oy + 32, 128, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.left,
    (ox - 136, oy + 104, 16, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.sides.right,
    (ox - 136, oy - 40, 16, 64),
    ~rotate=90.0,
    (),
  )
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.top,
    (ox - 248, oy + 56, 160, 16),
    ~rotate=90.0,
    (),
  )

  // Bottom
  Generator.drawTexture(
    "Minecart",
    minecart.bottom.front,
    (ox - 32, oy + 320, 160, 128),
    ~rotate=-90.0,
    (),
  )

  // Draw the Foreground image
  Generator.drawImage("Foreground-Simple", (0, 0))

  //Folds
  if showFolds {
    drawFoldsSimple()
  }
}

let script = () => {
  // Define the user inputs
  Generator.defineTextureInput(
    "Minecart",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: [],
    },
  )

  // Define And Get user variables
  let modelType = Generator.defineAndGetSelectInput("Model Type", ["Advanced", "Simple"])
  let showFolds = Generator.defineAndGetBooleanInput("Show Folds", true)

  // Minecart

  switch modelType {
  | "Advanced" => drawAdvanced(showFolds)
  | "Simple" => drawSimple(showFolds)
  | _ => drawAdvanced(showFolds)
  }
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: None,
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images,
  textures,
  script,
}
