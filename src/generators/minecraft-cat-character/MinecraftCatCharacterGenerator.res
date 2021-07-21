let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-cat-character"

let name = "Minecraft Cat Character"

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
]

let script = () => {
  // Define user inputs
  Generator.defineSelectInput("Skin Model Type", ["Steve", "Alex"])
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")

  // Script Variables
  let ox = 15 // ox means 'origin x'
  let oy = 8 // oy means 'origin y'
  let oa = 0
  let ob = 0
  let og = 15
  let oh = 8
  let ol = 0
  let om = 0
  let oi = 0
  let oo = 0

  // Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 8, w: 8, h: 8},
    {x: ox + 25, y: oy + 65, w: 40, h: 32},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: ox + 65, y: oy + 97, w: 40, h: 40},
    ~flip=#Vertical,
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 8, w: 8, h: 8},
    {x: ox + 105, y: oy + 65, w: 40, h: 32},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 8, w: 8, h: 8},
    {x: ox + 145, y: oy + 65, w: 40, h: 32},
    (),
  ) // back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 0, w: 8, h: 8},
    {x: ox + 65, y: oy + 25, w: 40, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 8, w: 8, h: 8},
    {x: ox + 65, y: oy + 65, w: 40, h: 32},
    (),
  ) // face

  // Hat
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0 + 32, y: 8, w: 8, h: 8},
    {x: ox + 25, y: oy + 65, w: 40, h: 32},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16 + 32, y: 0, w: 8, h: 8},
    {x: ox + 65, y: oy + 97, w: 40, h: 40},
    ~flip=#Vertical,
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16 + 32, y: 8, w: 8, h: 8},
    {x: ox + 105, y: oy + 65, w: 40, h: 32},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24 + 32, y: 8, w: 8, h: 8},
    {x: ox + 145, y: oy + 65, w: 40, h: 32},
    (),
  ) // back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8 + 32, y: 0, w: 8, h: 8},
    {x: ox + 65, y: oy + 25, w: 40, h: 40},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8 + 32, y: 8, w: 8, h: 8},
    {x: ox + 65, y: oy + 65, w: 40, h: 32},
    (),
  ) // face

  // Legs

  if alexModel {
    // Front Right Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 12},
      {x: oa + 251, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (right)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 3, h: 12},
      {x: oa + 267, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (front)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 12},
      {x: oa + 283, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (left)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 12},
      {x: oa + 299, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (back)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 16, w: 3, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  } else {
    // Front Right Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 16, h: 12},
      {x: oa + 251, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 16, w: 4, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  if alexModel {
    // Front Right Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 36, w: 4, h: 12},
      {x: oa + 251, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (right)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 36, w: 3, h: 12},
      {x: oa + 267, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (front)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 36, w: 4, h: 12},
      {x: oa + 283, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (left)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 36, w: 3, h: 12},
      {x: oa + 299, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (back)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 32, w: 3, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 32, w: 3, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  } else {
    // Front Right Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 36, w: 16, h: 12},
      {x: oa + 251, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 32, w: 4, h: 4},
      {x: oa + 267, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 32, w: 4, h: 4},
      {x: oa + 267, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  if alexModel {
    // Front Left Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 12},
      {x: oa + 340, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (right)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 3, h: 12},
      {x: oa + 356, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (front)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 52, w: 4, h: 12},
      {x: oa + 372, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (left)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 12},
      {x: oa + 388, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (back)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 48, w: 3, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  } else {
    // Front Left Leg
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 16, h: 12},
      {x: oa + 340, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  if alexModel {
    // Front Left Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 52, w: 4, h: 12},
      {x: oa + 340, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (right)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 52, w: 3, h: 12},
      {x: oa + 356, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (front)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 55, y: 52, w: 4, h: 12},
      {x: oa + 372, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (left)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 59, y: 52, w: 3, h: 12},
      {x: oa + 388, y: ob + 248, w: 16, h: 32},
      (),
    ) // leg (back)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 48, w: 3, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 55, y: 48, w: 3, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  } else {
    // Front Left Leg Pant
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 52, w: 16, h: 12},
      {x: oa + 340, y: ob + 248, w: 64, h: 32},
      (),
    ) // leg (all sides)
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 232, w: 16, h: 16},
      (),
    ) // top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 48, w: 4, h: 4},
      {x: oa + 356, y: ob + 280, w: 16, h: 16},
      ~flip=#Vertical,
      (),
    ) // bottom
  }

  let ob = ob + 88

  // Back Right Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 16, h: 12},
    {x: oa + 251, y: ob + 248, w: 64, h: 32},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 16, w: 4, h: 4},
    {x: oa + 267, y: ob + 232, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: oa + 267, y: ob + 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Back Right Leg Pant
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 16, h: 12},
    {x: oa + 251, y: ob + 248, w: 64, h: 32},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 32, w: 4, h: 4},
    {x: oa + 267, y: ob + 232, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: oa + 267, y: ob + 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Back Left Leg
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 16, h: 12},
    {x: oa + 340, y: ob + 248, w: 64, h: 32},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: oa + 356, y: ob + 232, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: oa + 356, y: ob + 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Back Left Leg Pant
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 52, w: 16, h: 12},
    {x: oa + 340, y: ob + 248, w: 64, h: 32},
    (),
  ) // leg (all sides)
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 48, w: 4, h: 4},
    {x: oa + 356, y: ob + 232, w: 16, h: 16},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 48, w: 4, h: 4},
    {x: oa + 356, y: ob + 280, w: 16, h: 16},
    ~flip=#Vertical,
    (),
  ) // bottom

  // Tail
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 16, h: 6},
    {x: oi + 469, y: oo + 294, w: 32, h: 64},
    (),
  ) // leg1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 26, w: 16, h: 6},
    {x: oi + 541, y: oo + 294, w: 32, h: 64},
    (),
  ) // leg2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 5, y: 17, w: 1, h: 1},
    {x: oi + 477, y: oo + 358, w: 8, h: 8},
    (),
  ) // end1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 17, w: 1, h: 1},
    {x: oi + 549, y: oo + 358, w: 8, h: 8},
    (),
  ) // end2

  // Tail Overlay
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 16, h: 6},
    {x: oi + 469, y: oo + 294, w: 32, h: 64},
    (),
  ) // leg1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 42, w: 16, h: 6},
    {x: oi + 541, y: oo + 294, w: 32, h: 64},
    (),
  ) // leg2
  Generator.drawTextureLegacy(
    "Skin",
    {x: 5, y: 33, w: 1, h: 1},
    {x: oi + 477, y: oo + 358, w: 8, h: 8},
    (),
  ) // end1
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 33, w: 1, h: 1},
    {x: oi + 549, y: oo + 358, w: 8, h: 8},
    (),
  ) // end2

  // nose
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 3},
    {x: og + 241, y: oh + 76, w: 24, h: 12},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 4, h: 1},
    {x: og + 241, y: oh + 68, w: 24, h: 8},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 13, y: 13, w: 1, h: 3},
    {x: og + 265, y: oh + 76, w: 8, h: 12},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 15, w: 4, h: 1},
    {x: og + 241, y: oh + 88, w: 24, h: 8},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 10, y: 13, w: 1, h: 3},
    {x: og + 233, y: oh + 76, w: 8, h: 12},
    (),
  ) // left

  // nose Overlay
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 4, h: 3},
    {x: og + 241, y: oh + 76, w: 24, h: 12},
    (),
  ) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 4, h: 1},
    {x: og + 241, y: oh + 68, w: 24, h: 8},
    (),
  ) // top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 45, y: 13, w: 1, h: 3},
    {x: og + 265, y: oh + 76, w: 8, h: 12},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 15, w: 4, h: 1},
    {x: og + 241, y: oh + 88, w: 24, h: 8},
    (),
  ) // bottom
  Generator.drawTextureLegacy(
    "Skin",
    {x: 42, y: 13, w: 1, h: 3},
    {x: og + 233, y: oh + 76, w: 8, h: 12},
    (),
  ) // left

  // body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 12},
    {x: 40, y: 241, w: 48, h: 128},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 12},
    {x: 88, y: 241, w: 32, h: 128},
    (),
  ) // middle
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 12},
    {x: 120, y: 241, w: 48, h: 128},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 12},
    {x: 168, y: 241, w: 32, h: 128},
    (),
  ) // top
  Generator.drawTextureLegacy("Skin", {x: 20, y: 16, w: 8, h: 4}, {x: 88, y: 193, w: 32, h: 48}, ()) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 88, y: 369, w: 32, h: 48},
    ~flip=#Vertical,
    (),
  ) // back

  // Jacket
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 36, w: 4, h: 12},
    {x: 40, y: 241, w: 48, h: 128},
    (),
  ) // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 36, w: 8, h: 12},
    {x: 88, y: 241, w: 32, h: 128},
    (),
  ) // middle
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 36, w: 4, h: 12},
    {x: 120, y: 241, w: 48, h: 128},
    (),
  ) // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 36, w: 8, h: 12},
    {x: 168, y: 241, w: 32, h: 128},
    (),
  ) // top
  Generator.drawTextureLegacy("Skin", {x: 20, y: 32, w: 8, h: 4}, {x: 88, y: 193, w: 32, h: 48}, ()) // front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 32, w: 8, h: 4},
    {x: 88, y: 369, w: 32, h: 48},
    ~flip=#Vertical,
    (),
  ) // back

  // Ears

  // left
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 1, w: 1, h: 1},
    {x: ol + 168, y: om + 168, w: 24, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 9, y: 0, w: 1, h: 1},
    {x: ol + 168, y: om + 152, w: 24, h: 16},
    (),
  ) //back

  // right
  Generator.drawTextureLegacy(
    "Skin",
    {x: 14, y: 1, w: 1, h: 1},
    {x: ol + 245, y: om + 169, w: 24, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 14, y: 0, w: 1, h: 1},
    {x: ol + 245, y: om + 153, w: 24, h: 16},
    (),
  ) //back

  // left Helmet
  Generator.drawTextureLegacy(
    "Skin",
    {x: 41, y: 1, w: 1, h: 1},
    {x: ol + 168, y: om + 168, w: 24, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 41, y: 0, w: 1, h: 1},
    {x: ol + 168, y: om + 152, w: 24, h: 16},
    (),
  ) //back

  // right Helmet
  Generator.drawTextureLegacy(
    "Skin",
    {x: 46, y: 1, w: 1, h: 1},
    {x: ol + 245, y: om + 169, w: 24, h: 16},
    (),
  ) //front
  Generator.drawTextureLegacy(
    "Skin",
    {x: 46, y: 0, w: 1, h: 1},
    {x: ol + 245, y: om + 153, w: 24, h: 16},
    (),
  ) //back

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
