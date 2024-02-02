module Markdown = Generator.Markdown

let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "amogus-bendable"

let name = "Amogus Bendable"

let history = [
  "Jan 2022 PaperDogChannel - First release.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let video: Generator.videoDef = {url: "https://www.youtube.com/embed/0v8_l7J4qWg?rel=0"}

let amogusImage = Generator.requireImage("./instructions/amogus-100.png")

let instructions = `
"Amogus" is a corrupted version of the Among Us game name. In January 2021,
the word gained popularity as a catchphrase used in ironic memes, often used
to replace dialogue in various cartoons. Additionally, Amogus refers to a even
more simplified like drawing of a crewmate from Among Us used in these type of memes.
![Amogus](${amogusImage})
`

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background.png")},
  {id: "Folds", url: requireImage("Folds.png")},
]

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
    {
      id: "Colors",
      url: requireTexture("Colors.png"),
      standardWidth: 16,
      standardHeight: 2,
    },
  ],
)

let script = () => {
  Generator.defineSelectInput(
    "Color",
    [
      "Red",
      "Black",
      "White",
      "Rose",
      "Blue",
      "Cyan",
      "Yellow",
      "Pink",
      "Purple",
      "Orange",
      "Banana",
      "Coral",
      "Lime",
      "Green",
      "Gray",
      "Maroon",
      "Brown",
      "Tan",
    ],
  )

  Generator.defineSkinInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )
  Generator.drawImage("Background", (0, 0))
  let red = Generator.getSelectInputValue("Color") === "Red"
  let black = Generator.getSelectInputValue("Color") === "Black"
  let white = Generator.getSelectInputValue("Color") === "White"
  let rose = Generator.getSelectInputValue("Color") === "Rose"
  let blue = Generator.getSelectInputValue("Color") === "Blue"
  let cyan = Generator.getSelectInputValue("Color") === "Cyan"
  let yellow = Generator.getSelectInputValue("Color") === "Yellow"
  let pink = Generator.getSelectInputValue("Color") === "Pink"
  let purple = Generator.getSelectInputValue("Color") === "Purple"
  let orange = Generator.getSelectInputValue("Color") === "Orange"
  let banana = Generator.getSelectInputValue("Color") === "Banana"
  let coral = Generator.getSelectInputValue("Color") === "Coral"
  let lime = Generator.getSelectInputValue("Color") === "Lime"
  let green = Generator.getSelectInputValue("Color") === "Green"
  let gray = Generator.getSelectInputValue("Color") === "Gray"
  let maroon = Generator.getSelectInputValue("Color") === "Maroon"
  let brown = Generator.getSelectInputValue("Color") === "Brown"
  let tancolour = Generator.getSelectInputValue("Color") === "Tan"

  //Drawing
  if red {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 0, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if black {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 1, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if rose {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 2, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if blue {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 3, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if cyan {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 4, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if yellow {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 5, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if pink {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 6, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if purple {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 7, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if orange {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 8, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if banana {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 9, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if coral {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 10, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if lime {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 11, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if green {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 12, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if gray {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 13, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if maroon {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 14, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if brown {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 15, y: 0, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if tancolour {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 0, y: 1, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }
  if white {
    Generator.drawTextureLegacy(
      "Colors",
      {x: 1, y: 1, w: 1, h: 1},
      {x: 0, y: 0, w: 600, h: 660},
      (),
    )
  }

  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: 47, y: 229, w: 87 - 47, h: 253 - 229},
    ~rotateLegacy=0.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8 + 32, y: 8, w: 8, h: 8},
    {x: 47, y: 229, w: 87 - 47, h: 253 - 229},
    ~rotateLegacy=0.0,
    (),
  )
  Generator.drawImage("Folds", (0, 0))
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: Some(thumbnail),
  video: Some(video),
  instructions: Some(<Markdown> {instructions} </Markdown>),
  images,
  textures,
  script,
}
