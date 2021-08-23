let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-wolf-character"

let name = "Minecraft Wolf Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
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
    id: "Angry Wolf",
    url: requireTexture("wolf_angry"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let steve = TextureMap.MinecraftCharacterLegacy.steve

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Show Red Eyes", false)

  // Get user variables
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showRedEyes = Generator.getBooleanInputValue("Show Red Eyes")

  // Script Variables
  let ox = 0 // ox means 'origin x'
  let oy = 0 // oy means 'origin y'
  let oa = 0
  let ob = 0
  let od = 0
  let oe = 0
  let og = 0
  let oh = 0
  let oj = 0
  let ol = 0
  let om = 0

  // Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: ox + 341, y: oy + 344, w: 32, h: 48},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: ox + 373, y: oy + 392, w: 48, h: 32},
    ~flip=#Vertical,
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: ox + 421, y: oy + 344, w: 32, h: 48},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: ox + 453, y: oy + 344, w: 48, h: 48},
    (),
  ) // back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: ox + 373, y: oy + 312, w: 48, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: ox + 373, y: oy + 344, w: 48, h: 48},
    (),
  ) // face

  // Legs
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom
  let oa = oa + 87
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom
  let oa = oa + 87

  //Arms
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 20, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // arm (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 16, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 16, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom
  let oa = oa + 87
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 52, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 36, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Tail
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: od + 479, y: oe + 550, w: 16, h: 16},
    ~rotateLegacy=270.0,
    (),
  ) // end

  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: od + 407, y: oe + 534, w: 16, h: 16},
    (),
  ) // front

  for m in 0 to 3 {
    let oj' = oj + 16 * m
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 20, w: 4, h: 12},
      {x: od + 423, y: oe + 582 - oj', w: 16, h: 56},
      ~rotateLegacy=270.0,
      (),
    ) // tail
  }

  // do {
  //   Generator.drawTextureLegacy(
  //     "Skin",
  //     { x: 4, y: 20, w: 4, h: 12 },
  //     { x: od + 423, y: oe + 582 - oj, w: 16, h: 56 },
  //     { rotate: 270 }
  //   ); // tail
  //   let m = m + 1;
  //   let oj = oj + 16;
  // } while (m < 4);

  // nose
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 3},
    {x: og + 416, y: oh + 232, w: 24, h: 24},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 1, h: 3},
    {x: og + 392, y: oh + 232, w: 24, h: 24},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 1},
    {x: og + 416, y: oh + 208, w: 24, h: 24},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 15, w: 4, h: 1},
    {x: og + 416, y: oh + 256, w: 24, h: 24},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 13, y: 13, w: 1, h: 3},
    {x: og + 440, y: oh + 232, w: 24, h: 24},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 3},
    {x: og + 464, y: oh + 232, w: 24, h: 24},
    ~flip=#Horizontal,
    (),
  ) // back

  // body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 4},
    {x: 141, y: 254, w: 64, h: 48},
    (),
  ) // bottom
  Generator.drawTextureLegacy("Skin", {x: 16, y: 20, w: 4, h: 4}, {x: 85, y: 254, w: 56, h: 48}, ()) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 4},
    {x: 205, y: 254, w: 56, h: 48},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 4},
    {x: 261, y: 254, w: 64, h: 48},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 141, y: 198, w: 64, h: 56},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 141, y: 302, w: 64, h: 56},
    ~flip=#Vertical,
    (),
  ) // back

  // body2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 24, w: 8, h: 8},
    {x: 163, y: 427, w: 48, h: 72},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 24, w: 4, h: 8},
    {x: 115, y: 427, w: 48, h: 72},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 24, w: 4, h: 8},
    {x: 211, y: 427, w: 48, h: 72},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 24, w: 8, h: 8},
    {x: 259, y: 427, w: 48, h: 72},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 163, y: 379, w: 48, h: 48},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 163, y: 499, w: 48, h: 48},
    ~flip=#Vertical,
    (),
  ) // back

  // Ears

  // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 17, w: 2, h: 2},
    {x: ol + 371, y: om + 459, w: 16, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 25, y: 17, w: 2, h: 2},
    {x: ol + 395, y: om + 459, w: 16, h: 16},
    (),
  ) //back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 21, y: 17, w: 1, h: 2},
    {x: ol + 363, y: om + 459, w: 8, h: 16},
    (),
  ) //left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 17, w: 1, h: 2},
    {x: ol + 387, y: om + 459, w: 8, h: 16},
    (),
  ) //right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 16, w: 2, h: 1},
    {x: ol + 371, y: om + 451, w: 16, h: 8},
    (),
  ) //top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 16, w: 2, h: 1},
    {x: ol + 371, y: om + 475, w: 16, h: 8},
    ~flip=#Vertical,
    (),
  ) //bottom

  // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 17, w: 2, h: 2},
    {x: ol + 444, y: om + 459, w: 16, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 25, y: 17, w: 2, h: 2},
    {x: ol + 468, y: om + 459, w: 16, h: 16},
    (),
  ) //back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 21, y: 17, w: 1, h: 2},
    {x: ol + 436, y: om + 459, w: 8, h: 16},
    (),
  ) //left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 17, w: 1, h: 2},
    {x: ol + 460, y: om + 459, w: 8, h: 16},
    (),
  ) //right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 16, w: 2, h: 1},
    {x: ol + 444, y: om + 451, w: 16, h: 8},
    (),
  ) //top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 16, w: 2, h: 1},
    {x: ol + 444, y: om + 475, w: 16, h: 8},
    ~flip=#Vertical,
    (),
  ) //bottom

  //Overlay

  let ox = 0 // ox means 'origin x'
  let oy = 0 // oy means 'origin y'
  let oa = 0
  let ob = 0
  let od = 0
  let oe = 0
  let og = 0
  let oh = 0
  let oj = 0
  let ol = 0
  let om = 0

  // Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 8, w: 8, h: 8},
    {x: ox + 341, y: oy + 344, w: 32, h: 48},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 0, w: 8, h: 8},
    {x: ox + 373, y: oy + 392, w: 48, h: 32},
    ~flip=#Vertical,
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 8, w: 8, h: 8},
    {x: ox + 421, y: oy + 344, w: 32, h: 48},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 8, w: 8, h: 8},
    {x: ox + 453, y: oy + 344, w: 48, h: 48},
    (),
  ) // back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 0, w: 8, h: 8},
    {x: ox + 373, y: oy + 312, w: 48, h: 32},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 8, w: 8, h: 8},
    {x: ox + 373, y: oy + 344, w: 48, h: 48},
    (),
  ) // face

  // Legs
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 32, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom
  let oa = oa + 87
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 52, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom
  let oa = oa + 87

  //Arms
  Generator.drawTextureLegacy(
    "Skin",
    {x: 40, y: 36, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // arm (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 44, y: 32, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 32, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom
  let oa = oa + 87
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 52, w: 16, h: 12},
    {x: oa + 85, y: ob + 591, w: 64, h: 56},
    (),
  ) // leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 52, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 575, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 56, y: 48, w: 4, h: 4},
    {x: oa + 101, y: ob + 647, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Tail
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: od + 479, y: oe + 549, w: 16, h: 16},
    ~rotateLegacy=270.0,
    (),
  ) // end

  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 32, w: 4, h: 4},
    {x: od + 407, y: oe + 534, w: 16, h: 16},
    (),
  ) // front

  for m in 0 to 3 {
    let oj' = oj + 16 * m
    Generator.drawTextureLegacy(
      "Skin",
      {x: 4, y: 36, w: 4, h: 12},
      {x: od + 423, y: oe + 582 - oj', w: 16, h: 56},
      ~rotateLegacy=270.0,
      (),
    ) // tail
  }

  // do {
  //   Generator.drawTextureLegacy(
  //     "Skin",
  //     { x: 4, y: 36, w: 4, h: 12 },
  //     { x: od + 423, y: oe + 582 - oj, w: 16, h: 56 },
  //     { rotate: 270 }
  //   ); // tail
  //   let m = m + 1;
  //   let oj = oj + 16;
  // } while (m < 4);

  // nose
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 4, h: 3},
    {x: og + 416, y: oh + 232, w: 24, h: 24},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 1, h: 3},
    {x: og + 392, y: oh + 232, w: 24, h: 24},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 4, h: 1},
    {x: og + 416, y: oh + 208, w: 24, h: 24},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 15, w: 4, h: 1},
    {x: og + 416, y: oh + 256, w: 24, h: 24},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 1, h: 3},
    {x: og + 440, y: oh + 232, w: 24, h: 24},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 4, h: 3},
    {x: og + 464, y: oh + 232, w: 24, h: 24},
    ~flip=#Horizontal,
    (),
  ) // back

  // body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 36, w: 8, h: 4},
    {x: 141, y: 254, w: 64, h: 48},
    (),
  ) // bottom
  Generator.drawTextureLegacy("Skin", {x: 16, y: 36, w: 4, h: 4}, {x: 85, y: 254, w: 56, h: 48}, ()) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 36, w: 4, h: 4},
    {x: 205, y: 254, w: 56, h: 48},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 36, w: 8, h: 4},
    {x: 261, y: 254, w: 64, h: 48},
    (),
  ) // top

  // body (front)
  Generator.drawTextureLegacy("Skin", {x: 20, y: 36, w: 8, h: 1}, {x: 141, y: 246, w: 64, h: 8}, ()) // front bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 36, w: 4, h: 1},
    {x: 141, y: 254, w: 56, h: 8},
    ~rotateLegacy=270.0,
    (),
  ) // front left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 36, w: 4, h: 1},
    {x: 197, y: 254, w: 56, h: 8},
    ~rotateLegacy=270.0,
    (),
  ) // front right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 36, w: 8, h: 1},
    {x: 141, y: 198, w: 64, h: 8},
    ~flip=#Horizontal,
    (),
  ) // front top

  // body (back)
  Generator.drawTextureLegacy("Skin", {x: 20, y: 41, w: 8, h: 1}, {x: 141, y: 302, w: 64, h: 8}, ()) // back top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 41, w: 4, h: 1},
    {x: 141, y: 357, w: 56, h: 8},
    ~rotateLegacy=270.0,
    (),
  ) // back left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 41, w: 4, h: 1},
    {x: 197, y: 357, w: 56, h: 8},
    ~rotateLegacy=270.0,
    (),
  ) // back right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 41, w: 8, h: 1},
    {x: 141, y: 349, w: 64, h: 8},
    ~flip=#Horizontal,
    (),
  ) // back bottom

  // body2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 40, w: 8, h: 8},
    {x: 163, y: 427, w: 48, h: 72},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 40, w: 4, h: 8},
    {x: 115, y: 427, w: 48, h: 72},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 40, w: 4, h: 8},
    {x: 211, y: 427, w: 48, h: 72},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 40, w: 8, h: 8},
    {x: 259, y: 427, w: 48, h: 72},
    (),
  ) // top

  // body2 end
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 32, w: 8, h: 4},
    {x: 163, y: 499, w: 48, h: 48},
    (),
  ) // end

  // Ears

  // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 33, w: 2, h: 2},
    {x: ol + 371, y: om + 459, w: 16, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 33, w: 2, h: 2},
    {x: ol + 395, y: om + 459, w: 16, h: 16},
    (),
  ) //back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 21, y: 33, w: 1, h: 2},
    {x: ol + 363, y: om + 459, w: 8, h: 16},
    (),
  ) //left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 26, y: 33, w: 1, h: 2},
    {x: ol + 387, y: om + 459, w: 8, h: 16},
    (),
  ) //right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 32, w: 2, h: 1},
    {x: ol + 371, y: om + 451, w: 16, h: 8},
    (),
  ) //top

  // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 22, y: 33, w: 2, h: 2},
    {x: ol + 444, y: om + 459, w: 16, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 33, w: 2, h: 2},
    {x: ol + 468, y: om + 459, w: 16, h: 16},
    (),
  ) //back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 21, y: 33, w: 1, h: 2},
    {x: ol + 436, y: om + 459, w: 8, h: 16},
    (),
  ) //left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 26, y: 33, w: 1, h: 2},
    {x: ol + 460, y: om + 459, w: 8, h: 16},
    (),
  ) //right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 32, w: 2, h: 1},
    {x: ol + 444, y: om + 451, w: 16, h: 8},
    (),
  ) //top

  // Background
  Generator.drawImage("Background", (0, 0))

  // Fold Lines
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }

  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }

  // Red Eye
  if showRedEyes {
    Generator.drawTexture("Angry Wolf", (4, 5, 2, 2), (379, 362, 12, 12), ()) // Right Eye 1
    Generator.drawTexture("Angry Wolf", (4, 4, 1, 1), (379, 356, 6, 6), ()) // Right Eye 2
    Generator.drawTexture("Angry Wolf", (8, 5, 2, 2), (403, 362, 12, 12), ()) // Left Eye 1
    Generator.drawTexture("Angry Wolf", (9, 4, 1, 1), (409, 356, 6, 6), ()) // Left Eye 2
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
