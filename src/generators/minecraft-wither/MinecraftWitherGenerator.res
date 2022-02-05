let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "minecraft-wither"

let name = "Minecraft Wither"

let history = ["01 Aug 2021 Hannibanni - Created."]

let instructions = {
  let witherTexture = Generator.requireImage("./instructions/wither.png")
  `
## TODO

* Add a thumbnail image.
* Make background the A4 page tempate with Pixel Papercraft footer.

## How to use the Wither generator

### Option 1: Use an existing Wither skin

* Select one of the Wither skins from the generator.
* Download and print your Wither papercraft.

### Option 2: Create your own texture

* Download a sample Wither texture (right click and save):
  ![Wither Texture](${witherTexture})
* Edit this texture in your favourite graphics program.
* Select this file in the generator.
* Download and print your Wither papercraft.
`
}

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background.png")},
  {id: "Folds", url: requireImage("Folds.png")},
]

let witherSkinId = "Wither Skin"

let textures: array<Generator.textureDef> = [
  {
    id: "Minecraft Wither",
    url: requireTexture("wither.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: witherSkinId,
    url: requireTexture("wither.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let script = () => {
  Generator.defineTextureInput(
    witherSkinId,
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Minecraft Wither"],
    },
  )

  // Draw the Background image
  Generator.drawImage("Background", (0, 0))

  // Main Head

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 8, y: 8, w: 8, h: 8},
    {x: 110, y: 90, w: 64, h: 64},
    (),
  ) //Front Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 16, y: 8, w: 8, h: 8},
    {x: 174, y: 90, w: 64, h: 64},
    (),
  ) //Right Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 8, w: 8, h: 8},
    {x: 238, y: 90, w: 64, h: 64},
    (),
  ) //Back Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 0, y: 8, w: 8, h: 8},
    {x: 46, y: 90, w: 64, h: 64},
    (),
  ) //Left Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 8, y: 0, w: 8, h: 8},
    {x: 110, y: 26, w: 64, h: 64},
    (),
  ) //Top Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 16, y: 0, w: 8, h: 8},
    {x: 110, y: 154, w: 64, h: 64},
    (),
  ) //Down Head

  //Side Head Left

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 38, y: 6, w: 6, h: 6},
    {x: 477, y: 76, w: 48, h: 48},
    (),
  ) //Front Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 6, w: 6, h: 4},
    {x: 525, y: 76, w: 48, h: 32},
    (),
  ) //Right Head 1
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 10, w: 3, h: 2},
    {x: 525, y: 108, w: 32, h: 16},
    (),
  ) //Right Head 2
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 32, y: 6, w: 6, h: 6},
    {x: 429, y: 76, w: 48, h: 48},
    (),
  ) //Left Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 50, y: 6, w: 6, h: 4},
    {x: 381, y: 76, w: 48, h: 32},
    (),
  ) //Back Head 1
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 53, y: 10, w: 3, h: 2},
    {x: 397, y: 108, w: 32, h: 16},
    (),
  ) //Back Head 2
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 38, y: 0, w: 6, h: 6},
    {x: 477, y: 28, w: 48, h: 48},
    (),
  ) //Top Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 0, w: 6, h: 4},
    {x: 477, y: 124, w: 48, h: 32},
    (),
  ) //Down Head 1
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 4, w: 3, h: 2},
    {x: 477, y: 156, w: 24, h: 16},
    (),
  ) //Down Head 2

  //Side Head Right

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 38, y: 0, w: 6, h: 6},
    {x: 431, y: 333, w: 48, h: 48},
    (),
  ) //Top Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 6, w: 6, h: 4},
    {x: 527, y: 381, w: 32, h: 48},
    (),
  ) //Right Head 1
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 10, w: 3, h: 2},
    {x: 559, y: 381, w: 16, h: 32},
    (),
  ) //Right Head 2
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 38, y: 6, w: 6, h: 6},
    {x: 431, y: 381, w: 48, h: 48},
    (),
  ) //Front Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 50, y: 6, w: 6, h: 4},
    {x: 399, y: 381, w: 32, h: 48},
    (),
  ) //Left Head
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 38, y: 0, w: 6, h: 6},
    {x: 477, y: 28, w: 48, h: 48},
    (),
  ) //Down Head 2
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 0, w: 6, h: 4},
    {x: 477, y: 124, w: 48, h: 32},
    (),
  ) //Left Head 1
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 4, w: 4, h: 6},
    {x: 383, y: 381, w: 16, h: 32},
    (),
  ) //Back Head 2
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 4, w: 4, h: 6},
    {x: 383, y: 381, w: 16, h: 32},
    (),
  ) //Back Head 2
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 6, w: 6, h: 6},
    {x: 479, y: 381, w: 48, h: 48},
    (),
  ) ////LLLLEEEFFFFT HEAD!!!!!!!!!!!!!!!!!!!!!!!
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 47, y: 4, w: 3, h: 2},
    {x: 455, y: 461, w: 24, h: 16},
    (),
  ) //Down Head2!!!!!!!!!!!!!!!
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 44, y: 0, w: 6, h: 4},
    {x: 431, y: 429, w: 48, h: 32},
    (),
  ) //Down Head 1!!!!!!!!!!!!!!
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 32, y: 6, w: 6, h: 4},
    {x: 383, y: 381, w: 48, h: 32},
    (),
  )
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 34, y: 10, w: 4, h: 2},
    {x: 399, y: 413, w: 32, h: 16},
    (),
  )
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 50, y: 6, w: 6, h: 4},
    {x: 527, y: 381, w: 48, h: 32},
    (),
  )
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 50, y: 10, w: 3, h: 2},
    {x: 527, y: 413, w: 32, h: 16},
    (),
  )

  //Body

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 3, y: 25, w: 3, h: 10},
    {x: 397, y: 177, w: 24, h: 80},
    ~rotateLegacy=90.0,
    (),
  ) //Front Body
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 0, y: 25, w: 3, h: 10},
    {x: 397, y: 153, w: 24, h: 80},
    ~rotateLegacy=90.0,
    (),
  ) //Left Body
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 6, y: 25, w: 3, h: 10},
    {x: 397, y: 201, w: 24, h: 80},
    ~rotateLegacy=90.0,
    (),
  ) //Right Body
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 9, y: 25, w: 3, h: 10},
    {x: 397, y: 225, w: 24, h: 80},
    ~rotateLegacy=90.0,
    (),
  ) //Back Body
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 3, y: 22, w: 3, h: 3},
    {x: 293, y: 177, w: 24, h: 24},
    (),
  ) //Down Body
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 3, y: 22, w: 3, h: 3},
    {x: 397, y: 177, w: 24, h: 24},
    (),
  ) //Top Body

  //Sides Left

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 160, y: 359, w: 32, h: 16},
    (),
  ) //Frnot Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 37, y: 22, w: 4, h: 2},
    {x: 160, y: 375, w: 32, h: 16},
    (),
  ) //Down Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 22, w: 4, h: 2},
    {x: 160, y: 343, w: 32, h: 16},
    (),
  ) //Top Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 240, y: 375, w: 32, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) //Back Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 24, w: 2, h: 2},
    {x: 144, y: 359, w: 16, h: 16},
    (),
  ) //Left Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 24, w: 2, h: 2},
    {x: 192, y: 359, w: 16, h: 16},
    (),
  ) //Right Side

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 160, y: 424, w: 32, h: 16},
    (),
  ) //Frnot Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 37, y: 22, w: 4, h: 2},
    {x: 160, y: 440, w: 32, h: 16},
    (),
  ) //Down Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 22, w: 4, h: 2},
    {x: 160, y: 408, w: 32, h: 16},
    (),
  ) //Top Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 240, y: 440, w: 32, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) //Back Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 24, w: 2, h: 2},
    {x: 144, y: 424, w: 16, h: 16},
    (),
  ) //Left Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 24, w: 2, h: 2},
    {x: 192, y: 424, w: 16, h: 16},
    (),
  ) //Right Side

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 160, y: 493, w: 32, h: 16},
    (),
  ) //Frnot Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 37, y: 22, w: 4, h: 2},
    {x: 160, y: 509, w: 32, h: 16},
    (),
  ) //Down Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 22, w: 4, h: 2},
    {x: 160, y: 478, w: 32, h: 16},
    (),
  ) //Top Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 240, y: 509, w: 32, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) //Back Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 24, w: 2, h: 2},
    {x: 144, y: 493, w: 16, h: 16},
    (),
  ) //Left Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 24, y: 24, w: 2, h: 2},
    {x: 192, y: 493, w: 16, h: 16},
    (),
  ) //Right Side

  //Sides Rigt

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 319, y: 358, w: 32, h: 16},
    (),
  ) //Front Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 37, y: 22, w: 4, h: 2},
    {x: 319, y: 373, w: 32, h: 16},
    (),
  ) //Down Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 319, y: 342, w: 32, h: 16},
    (),
  ) //Top Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 303, y: 374, w: 32, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) //Back Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 2, h: 2},
    {x: 303, y: 358, w: 16, h: 16},
    (),
  ) //Left Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 2, h: 2},
    {x: 351, y: 358, w: 16, h: 16},
    (),
  ) //Right Side

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 319, y: 426, w: 32, h: 16},
    (),
  ) //Front Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 37, y: 22, w: 4, h: 2},
    {x: 319, y: 441, w: 32, h: 16},
    (),
  ) //Down Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 319, y: 410, w: 32, h: 16},
    (),
  ) //Top Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 303, y: 442, w: 32, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) //Back Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 2, h: 2},
    {x: 303, y: 426, w: 16, h: 16},
    (),
  ) //Left Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 2, h: 2},
    {x: 351, y: 426, w: 16, h: 16},
    (),
  ) //Right Side

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 319, y: 497, w: 32, h: 16},
    (),
  ) //Front Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 37, y: 22, w: 4, h: 2},
    {x: 319, y: 512, w: 32, h: 16},
    (),
  ) //Down Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 319, y: 481, w: 32, h: 16},
    (),
  ) //Top Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 4, h: 2},
    {x: 303, y: 513, w: 32, h: 16},
    ~rotateLegacy=180.0,
    (),
  ) //Back Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 2, h: 2},
    {x: 303, y: 497, w: 16, h: 16},
    (),
  ) //Left Side
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 24, w: 2, h: 2},
    {x: 351, y: 497, w: 16, h: 16},
    (),
  ) //Right Side

  //Neck

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 3, y: 19, w: 20, h: 3},
    {x: 46, y: 277, w: 160, h: 24},
    (),
  ) //Front Neck
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 3, y: 16, w: 20, h: 3},
    {x: 46, y: 253, w: 160, h: 24},
    (),
  ) //Top Neck
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 23, y: 16, w: 20, h: 3},
    {x: 46, y: 301, w: 160, h: 24},
    (),
  ) //Down Neck
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 26, y: 19, w: 20, h: 3},
    {x: 230, y: 277, w: 160, h: 24},
    (),
  ) //Back Neck
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 0, y: 19, w: 3, h: 3},
    {x: 206, y: 277, w: 24, h: 24},
    (),
  ) //Right Neck
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 23, y: 19, w: 3, h: 3},
    {x: 22, y: 277, w: 24, h: 24},
    (),
  ) //Left Neck

  //Tail

  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 15, y: 25, w: 3, h: 6},
    {x: 49, y: 393, w: 24, h: 47},
    (),
  ) //Front Tail
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 21, y: 25, w: 3, h: 6},
    {x: 97, y: 404, w: 24, h: 36},
    (),
  ) //Back Tail
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 18, y: 25, w: 3, h: 6},
    {x: 25, y: 391, w: 24, h: 49},
    (),
  ) //Left Tail
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 18, y: 25, w: 3, h: 6},
    {x: 73, y: 391, w: 24, h: 49},
    (),
  ) //Right Tail
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 18, y: 25, w: 3, h: 6},
    {x: 49, y: 368, w: 24, h: 25},
    (),
  ) //Top Tail
  Generator.drawTextureLegacy(
    witherSkinId,
    {x: 18, y: 25, w: 3, h: 6},
    {x: 49, y: 440, w: 24, h: 24},
    (),
  ) //Down Tail

  Generator.drawImage("Folds", (0, 0))

  // Generator.drawText("Pixel Papercraft", 398, 500)
  // Generator.drawText("https://www.pixelpapercraft.com", 360, 550)
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  history: history,
  thumbnail: None,
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
