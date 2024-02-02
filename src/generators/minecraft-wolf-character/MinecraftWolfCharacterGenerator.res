let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-wolf-character"

let name = "Minecraft Wolf Character"

let history = [
  "Originally developed by dodecaphon.",
  "06 Feb 2015 lostminer - Add user variables.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
  "29 Sep 2020 NinjolasNJM - Various updates.",
  "02 Feb 2024 NinjolasNJM - added skin input.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v3-thumbnail-256.jpeg"),
}

let imageIds = ["Background", "Folds", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
    {
      id: "Angry Wolf",
      url: requireTexture("wolf_angry"),
      standardWidth: 64,
      standardHeight: 32,
    },
  ],
)

let steve = TextureMap.MinecraftCharacterLegacy.steve

let script = () => {
  // Inputs
  Generator.defineSkinInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )
  Generator.defineSelectInput("Skin Model", ["Steve", "Alex"])

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Show Red Eyes", false)

  // Get user variables
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showRedEyes = Generator.getBooleanInputValue("Show Red Eyes")

  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")
  let tailType =
    Generator.getSelectInputValue("Tail Type")->Belt.Int.fromString->Belt.Option.getWithDefault(1)

  let cycleTailTypes = t => {
    let t = if t === 4 {
      1
    } else {
      t + 1
    }
    Belt.Int.toString(t)
  }

  Generator.defineRegionInput((341, 312, 160, 112), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((85, 198, 240, 160), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((346, 575, 64, 88), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((259, 575, 64, 88), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((172, 575, 64, 88), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((85, 575, 64, 88), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })
  Generator.defineRegionInput((407, 518, 88, 64), () => {
    Generator.setSelectInputValue("Tail Type", cycleTailTypes(tailType))
  })

  // Script Variables
  let ox = 0 // ox means 'origin x'
  let oy = 0 // oy means 'origin y'
  let og = 0
  let oh = 0
  let ol = 0
  let om = 0
  let dx = 407
  let dy = 518

  let drawLimb = (sx: int, sy: int, dx: int, dy: int, isArm: bool) => {
    if isArm && alexModel {
      Generator.drawTexture("Skin", (sx + 4, sy, 3, 4), (dx + 16, dy, 16, 16), ()) // top
      Generator.drawTexture("Skin", (sx, sy + 4, 4, 12), (dx, dy + 16, 16, 56), ()) // left
      Generator.drawTexture("Skin", (sx + 4, sy + 4, 3, 12), (dx + 16, dy + 16, 16, 56), ()) // front
      Generator.drawTexture("Skin", (sx + 7, sy + 4, 4, 12), (dx + 32, dy + 16, 16, 56), ()) // right
      Generator.drawTexture("Skin", (sx + 11, sy + 4, 3, 12), (dx + 48, dy + 16, 16, 56), ()) // back
      Generator.drawTexture(
        "Skin",
        (sx + 7, sy, 3, 4),
        (dx + 16, dy + 72, 16, 16),
        ~flip=#Vertical,
        (),
      ) // bottom
    } else {
      Generator.drawTexture("Skin", (sx + 4, sy, 4, 4), (dx + 16, dy, 16, 16), ()) // top
      Generator.drawTexture("Skin", (sx, sy + 4, 4, 12), (dx, dy + 16, 16, 56), ()) // left
      Generator.drawTexture("Skin", (sx + 4, sy + 4, 4, 12), (dx + 16, dy + 16, 16, 56), ()) // front
      Generator.drawTexture("Skin", (sx + 8, sy + 4, 4, 12), (dx + 32, dy + 16, 16, 56), ()) // right
      Generator.drawTexture("Skin", (sx + 12, sy + 4, 4, 12), (dx + 48, dy + 16, 16, 56), ()) // back
      Generator.drawTexture(
        "Skin",
        (sx + 8, sy, 4, 4),
        (dx + 16, dy + 72, 16, 16),
        ~flip=#Vertical,
        (),
      ) // bottom
    }
  }

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

  if !hideHelmet {
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
      {x: 56, y: 8, w: 8, h: 8},
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
      {x: 45, y: 13, w: 1, h: 3},
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
  }

  // Legs
  drawLimb(0, 16, 85, 575, false) // right leg
  if !hideRightPant {
    drawLimb(0, 32, 85, 575, false) // right leg
  }

  drawLimb(16, 48, 172, 575, false) // left leg
  if !hideLeftPant {
    drawLimb(0, 48, 172, 575, false) // left leg
  }

  //Arms
  drawLimb(40, 16, 259, 575, true) // right arm
  if !hideRightSleeve {
    drawLimb(40, 32, 259, 575, true) // right arm
  }

  drawLimb(32, 48, 346, 575, true) // left arm
  if !hideLeftSleeve {
    drawLimb(48, 48, 346, 575, true) // left arm
  }

  // Tail

  let drawTail = (sx, sy, isArm) => {
    if isArm && alexModel {
      // Tail
      Generator.drawTexture(
        "Skin",
        (sx + 4, sy, 3, 4),
        (dx + 72, dy + 16, 16, 16),
        ~rotate=90.0,
        (),
      ) // top
      Generator.drawTexture(
        "Skin",
        (sx, sy + 4, 4, 12),
        (dx + 36, dy - 20, 16, 56),
        ~rotate=90.0,
        (),
      ) // left
      Generator.drawTexture(
        "Skin",
        (sx + 4, sy + 4, 3, 12),
        (dx + 36, dy - 4, 16, 56),
        ~rotate=90.0,
        (),
      ) // front
      Generator.drawTexture(
        "Skin",
        (sx + 7, sy + 4, 4, 12),
        (dx + 36, dy + 12, 16, 56),
        ~rotate=90.0,
        (),
      ) // right
      Generator.drawTexture(
        "Skin",
        (sx + 11, sy + 4, 3, 12),
        (dx + 36, dy + 28, 16, 56),
        ~rotate=90.0,
        (),
      ) // back
      Generator.drawTexture(
        "Skin",
        (sx + 7, sy, 3, 4),
        (dx, dy + 16, 16, 16),
        ~flip=#Vertical,
        ~rotate=90.0,
        (),
      ) // bottom
    } else {
      // Tail
      Generator.drawTexture(
        "Skin",
        (sx + 4, sy, 4, 4),
        (dx + 72, dy + 16, 16, 16),
        ~rotate=90.0,
        (),
      ) // top
      Generator.drawTexture(
        "Skin",
        (sx, sy + 4, 4, 12),
        (dx + 36, dy - 20, 16, 56),
        ~rotate=90.0,
        (),
      ) // left
      Generator.drawTexture(
        "Skin",
        (sx + 4, sy + 4, 4, 12),
        (dx + 36, dy - 4, 16, 56),
        ~rotate=90.0,
        (),
      ) // front
      Generator.drawTexture(
        "Skin",
        (sx + 8, sy + 4, 4, 12),
        (dx + 36, dy + 12, 16, 56),
        ~rotate=90.0,
        (),
      ) // right
      Generator.drawTexture(
        "Skin",
        (sx + 12, sy + 4, 4, 12),
        (dx + 36, dy + 28, 16, 56),
        ~rotate=90.0,
        (),
      ) // back
      Generator.drawTexture(
        "Skin",
        (sx + 8, sy, 4, 4),
        (dx, dy + 16, 16, 16),
        ~flip=#Vertical,
        ~rotate=90.0,
        (),
      ) // bottom
    }
  }

  switch tailType {
  | 1 => {
      let sx = 0
      let sy = 16
      let sx2 = 0
      let sy2 = 32
      let isArm = false
      drawTail(sx, sy, isArm)
      if !hideRightPant {
        drawTail(sx2, sy2, isArm)
      }
    }
  | 2 => {
      let sx = 16
      let sy = 48
      let sx2 = 0
      let sy2 = 48
      let isArm = false
      drawTail(sx, sy, isArm)
      if !hideLeftPant {
        drawTail(sx2, sy2, isArm)
      }
    }
  | 3 => {
      let sx = 40
      let sy = 16
      let sx2 = 40
      let sy2 = 32
      let isArm = true
      drawTail(sx, sy, isArm)
      if !hideRightSleeve {
        drawTail(sx2, sy2, isArm)
      }
    }
  | 4 => {
      let sx = 32
      let sy = 48
      let sx2 = 48
      let sy2 = 48
      let isArm = true
      drawTail(sx, sy, isArm)
      if !hideLeftSleeve {
        drawTail(sx2, sy2, isArm)
      }
    }
  | _ => ()
  }

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

  if !hideJacket {
    // body
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 36, w: 8, h: 4},
      {x: 141, y: 254, w: 64, h: 48},
      (),
    ) // bottom
    Generator.drawTextureLegacy(
      "Skin",
      {x: 16, y: 36, w: 4, h: 4},
      {x: 85, y: 254, w: 56, h: 48},
      (),
    ) // left
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
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: 141, y: 198, w: 64, h: 56},
      (),
    ) // front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 141, y: 302, w: 64, h: 56},
      ~flip=#Vertical,
      (),
    ) // back

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
    Generator.drawTextureLegacy(
      "Skin",
      {x: 20, y: 32, w: 8, h: 4},
      {x: 163, y: 379, w: 48, h: 48},
      (),
    ) // front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 28, y: 32, w: 8, h: 4},
      {x: 163, y: 499, w: 48, h: 48},
      ~flip=#Vertical,
      (),
    ) // back

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
      {x: 25, y: 33, w: 2, h: 2},
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
      {x: 24, y: 33, w: 1, h: 2},
      {x: ol + 387, y: om + 459, w: 8, h: 16},
      (),
    ) //right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 22, y: 32, w: 2, h: 1},
      {x: ol + 371, y: om + 451, w: 16, h: 8},
      (),
    ) //top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 24, y: 32, w: 2, h: 1},
      {x: ol + 371, y: om + 475, w: 16, h: 8},
      ~flip=#Vertical,
      (),
    ) //bottom

    // right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 22, y: 33, w: 2, h: 2},
      {x: ol + 444, y: om + 459, w: 16, h: 16},
      (),
    ) //front
    Generator.drawTextureLegacy(
      "Skin",
      {x: 25, y: 33, w: 2, h: 2},
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
      {x: 24, y: 33, w: 1, h: 2},
      {x: ol + 460, y: om + 459, w: 8, h: 16},
      (),
    ) //right
    Generator.drawTextureLegacy(
      "Skin",
      {x: 22, y: 32, w: 2, h: 1},
      {x: ol + 444, y: om + 451, w: 16, h: 8},
      (),
    ) //top
    Generator.drawTextureLegacy(
      "Skin",
      {x: 24, y: 32, w: 2, h: 1},
      {x: ol + 444, y: om + 475, w: 16, h: 8},
      ~flip=#Vertical,
      (),
    ) //bottom
  }

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
