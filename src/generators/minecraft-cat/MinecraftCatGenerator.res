let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-cat"

let name = "Minecraft Cat"

let history = [
  "Originally created by Micaias32.",
  "15 Mar 2021 Micaias32 - All cats of 1.14.",
  "03 Feb 2022 NinjolasNJM - Converted to new generator builder, with updated backgrounds, folds and labels, as well as improved texture mappping and collar handling.",
  "06 Aug 2022 M16 - Update thumbnail photo.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-v2-256.jpeg"),
}

let instructions = {
  let catTexture = requireTexture("white")
  `
## How to use the Minecraft Cat Generator?

### Option 1: Use a texture pack or mod Cat skin

* Download your favourite texture pack or mod.
* Find a cat texture file.
* Select this file in the generator.
* Download and print your new Cat papercraft. 

## Option 2: Create your own Cat texture file

* Download a sample Cat texture (right click and save):
  ![Car Texture](${catTexture})
* Edit this texture in your favourite graphics program.
* Select this file in the generator.
* Download and print your new Cat papercraft.
`
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  // "Cat" texture is the default texture to show when the generator loads
  {
    id: "Cat",
    url: requireTexture("ocelot"),
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
    id: "Orange Tabby",
    url: requireTexture("red"),
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
    id: "Tuxedo",
    url: requireTexture("black"),
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
    id: "Cat Collar",
    url: requireTexture("cat_collar"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Cat",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: [
        "Black",
        "British Shorthair",
        "Calico",
        "Jellie",
        "Ocelot",
        "Orange Tabby",
        "Persian",
        "Ragdoll",
        "Siamese",
        "Tabby",
        "Tuxedo",
        "White",
      ],
    },
  )
  Generator.defineTextureInput(
    "Collar",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: ["Cat Collar"],
    },
  )

  // Define user variables
  Generator.defineSelectInput(
    "Collar Color",
    [
      "Black",
      "Red",
      "Green",
      "Brown",
      "Blue",
      "Purple",
      "Cyan",
      "Light Gray",
      "Gray",
      "Pink",
      "Lime",
      "Yellow",
      "Light Blue",
      "Magenta",
      "Orange",
      "White",
    ],
  )
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let collarColor = switch Generator.getSelectInputValue("Collar Color") {
  | "Black" => "1D1D21"
  | "Red" => "B02E26"
  | "Green" => "5E7C16"
  | "Brown" => "835432"
  | "Blue" => "3C44AA"
  | "Purple" => "8932B8"
  | "Cyan" => "169C9C"
  | "Light Gray" => "9D9D97"
  | "Gray" => "474F52"
  | "Pink" => "F38BAA"
  | "Lime" => "80C71F"
  | "Yellow" => "FED83D"
  | "Light Blue" => "3AB3DA"
  | "Magenta" => "C74EBD"
  | "Orange" => "F9801D"
  | "White" => "F9FFFE"
  | _ => "B02E26"
  }

  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Draw Cat

  let drawCat = (texture: string, tint: string) => {
    // Head
    Generator.drawTexture(texture, (0, 5, 20, 4), (40, 73, 160, 32), ~blend=#MultiplyHex(tint), ()) // all sides

    Generator.drawTexture(texture, (5, 0, 5, 5), (80, 33, 40, 40), ~blend=#MultiplyHex(tint), ()) // Top
    Generator.drawTexture(
      texture,
      (10, 0, 5, 5),
      (80, 105, 40, 40),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // Bottom

    // Body
    Generator.drawTexture(
      texture,
      (20, 6, 6, 16),
      (40, 241, 48, 128),
      ~blend=#MultiplyHex(tint),
      (),
    ) // left
    Generator.drawTexture(
      texture,
      (26, 6, 4, 16),
      (88, 241, 32, 128),
      ~blend=#MultiplyHex(tint),
      (),
    ) // front
    Generator.drawTexture(
      texture,
      (30, 6, 6, 16),
      (120, 241, 48, 128),
      ~blend=#MultiplyHex(tint),
      (),
    ) // right
    Generator.drawTexture(
      texture,
      (36, 6, 4, 16),
      (168, 241, 32, 128),
      ~blend=#MultiplyHex(tint),
      (),
    ) // back
    Generator.drawTexture(texture, (26, 0, 4, 6), (88, 193, 32, 48), ~blend=#MultiplyHex(tint), ()) // top
    Generator.drawTexture(
      texture,
      (30, 0, 4, 6),
      (88, 369, 32, 48),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Back Left Leg
    Generator.drawTexture(texture, (8, 17, 8, 4), (251, 336, 64, 32), ~blend=#MultiplyHex(tint), ()) // leg1
    Generator.drawTexture(
      texture,
      (10, 13, 2, 2),
      (267, 320, 16, 16),
      ~blend=#MultiplyHex(tint),
      (),
    ) // top
    Generator.drawTexture(
      texture,
      (10, 13, 2, 2),
      (267, 368, 16, 16),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Back Right Leg
    Generator.drawTexture(texture, (8, 17, 8, 4), (340, 336, 64, 32), ~blend=#MultiplyHex(tint), ()) // leg1
    Generator.drawTexture(
      texture,
      (10, 13, 2, 2),
      (356, 320, 16, 16),
      ~blend=#MultiplyHex(tint),
      (),
    ) // top
    Generator.drawTexture(
      texture,
      (10, 13, 2, 2),
      (356, 368, 16, 16),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Front Left Leg
    Generator.drawTexture(texture, (40, 8, 8, 4), (251, 248, 64, 32), ~blend=#MultiplyHex(tint), ()) // leg (all sides)
    Generator.drawTexture(texture, (42, 0, 2, 2), (267, 232, 16, 16), ~blend=#MultiplyHex(tint), ()) // top
    Generator.drawTexture(
      texture,
      (44, 0, 2, 2),
      (267, 280, 16, 16),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Front Right Leg
    Generator.drawTexture(texture, (40, 8, 8, 4), (340, 248, 64, 32), ~blend=#MultiplyHex(tint), ()) // leg (all sides)
    Generator.drawTexture(texture, (42, 0, 2, 2), (356, 232, 16, 16), ~blend=#MultiplyHex(tint), ()) // top
    Generator.drawTexture(
      texture,
      (44, 0, 2, 2),
      (356, 280, 16, 16),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Tail

    // top
    Generator.drawTexture(texture, (2, 16, 1, 8), (469, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // right
    Generator.drawTexture(texture, (3, 16, 1, 8), (477, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // back
    Generator.drawTexture(texture, (0, 16, 1, 8), (485, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // left
    Generator.drawTexture(texture, (1, 16, 1, 8), (493, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // front
    Generator.drawTexture(
      texture,
      (2, 15, 1, 1),
      (477, 358, 8, 8),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // bottom
    Generator.drawTexture(texture, (6, 16, 1, 8), (541, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // right
    Generator.drawTexture(texture, (7, 16, 1, 8), (549, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // back
    Generator.drawTexture(texture, (4, 16, 1, 8), (557, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // left
    Generator.drawTexture(texture, (5, 16, 1, 8), (565, 294, 8, 64), ~blend=#MultiplyHex(tint), ()) // front
    Generator.drawTexture(
      texture,
      (6, 15, 1, 1),
      (549, 358, 8, 8),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Nose
    Generator.drawTexture(texture, (2, 26, 3, 2), (256, 80, 24, 16), ~blend=#MultiplyHex(tint), ()) // front
    Generator.drawTexture(texture, (2, 25, 3, 1), (256, 72, 24, 8), ~blend=#MultiplyHex(tint), ()) // top
    Generator.drawTexture(texture, (5, 26, 1, 2), (280, 80, 8, 16), ~blend=#MultiplyHex(tint), ()) // right
    Generator.drawTexture(texture, (1, 26, 1, 2), (248, 80, 8, 16), ~blend=#MultiplyHex(tint), ()) // left
    Generator.drawTexture(
      texture,
      (5, 25, 3, 1),
      (256, 96, 24, 8),
      ~flip=#Vertical,
      ~blend=#MultiplyHex(tint),
      (),
    ) // bottom

    // Ears

    // left
    Generator.drawTexture(
      texture,
      (6, 12, 2, 1),
      (253, 161, 16, 8),
      ~rotateLegacy=90.0,
      ~blend=#MultiplyHex(tint),
      (),
    ) //left
    Generator.drawTexture(texture, (8, 12, 1, 1), (253, 177, 8, 8), ~blend=#MultiplyHex(tint), ()) //front
    Generator.drawTexture(
      texture,
      (9, 12, 2, 1),
      (261, 177, 16, 8),
      ~rotateLegacy=-90.0,
      ~blend=#MultiplyHex(tint),
      (),
    ) //right
    Generator.drawTexture(
      texture,
      (11, 12, 1, 1),
      (261, 161, 8, 8),
      ~rotateLegacy=180.0,
      ~blend=#MultiplyHex(tint),
      (),
    ) //back
    Generator.drawTexture(texture, (8, 10, 1, 2), (253, 161, 8, 16), ~blend=#MultiplyHex(tint), ()) //top
    Generator.drawTexture(
      texture,
      (9, 10, 1, 2),
      (269, 161, 8, 16),
      ~flip=#Horizontal,
      ~blend=#MultiplyHex(tint),
      (),
    ) //bottom

    // right
    Generator.drawTexture(
      texture,
      (0, 12, 2, 1),
      (176, 161, 16, 8),
      ~rotateLegacy=90.0,
      ~blend=#MultiplyHex(tint),
      (),
    ) //left
    Generator.drawTexture(texture, (2, 12, 1, 1), (176, 177, 8, 8), ~blend=#MultiplyHex(tint), ()) //front
    Generator.drawTexture(
      texture,
      (3, 12, 2, 1),
      (184, 177, 16, 8),
      ~rotateLegacy=-90.0,
      ~blend=#MultiplyHex(tint),
      (),
    ) //right
    Generator.drawTexture(
      texture,
      (5, 12, 1, 1),
      (184, 161, 8, 8),
      ~rotateLegacy=180.0,
      ~blend=#MultiplyHex(tint),
      (),
    ) //back
    Generator.drawTexture(texture, (2, 10, 1, 2), (176, 161, 8, 16), ~blend=#MultiplyHex(tint), ()) //top
    Generator.drawTexture(
      texture,
      (3, 10, 1, 2),
      (192, 161, 8, 16),
      ~flip=#Horizontal,
      ~blend=#MultiplyHex(tint),
      (),
    ) //bottom
  }

  drawCat("Cat", "None") // draw cat
  drawCat("Collar", collarColor) // draw collar

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
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
