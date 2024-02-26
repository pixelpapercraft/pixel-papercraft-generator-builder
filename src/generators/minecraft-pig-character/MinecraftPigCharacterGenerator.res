module Builder = Generator.Builder

let id = "minecraft-pig-character"

let name = "Minecraft Pig Character"

let history = [
  "Originally developed by aaronhawksley.",
  "06 Feb 2015 lostminer: Add user variables.",
  "13 Feb 2015 lostminer: Update to use new version of generator.",
  "13 Sep 2020 NinjolasNJM: Updated to use 1.8+ Skins.",
  "23 Jul 2021 NinjolasNJM: Replaced generator with one derived from Pig Generator by TepigMC.",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = []

let textures: array<Generator.textureDef> = Belt.Array.concat(
  MinecraftSkins.skins,
  [
    {
      id: "Background Sprites",
      url: Generator.requireImage("./images/background-sprites.png"),
      standardWidth: 592,
      standardHeight: 608,
    },
    {
      id: "Fold Sprites",
      url: Generator.requireImage("./images/fold-sprites.png"),
      standardWidth: 600,
      standardHeight: 808,
    },
    {
      id: "Label Sprites",
      url: Generator.requireImage("./images/label-sprites.png"),
      standardWidth: 208,
      standardHeight: 80,
    },
    {
      id: "Title Sprites",
      url: Generator.requireImage("./images/title-sprites.png"),
      standardWidth: 294,
      standardHeight: 48,
    },
    {
      id: "Pig Texture",
      url: Generator.requireImage("./textures/vanilla/pig2.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Saddle (Vanilla)",
      url: Generator.requireImage("./textures/vanilla/pig_saddle2.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Saddle (Vanilla) (Programmer Art)",
      url: Generator.requireImage("./textures/vanilla/pig_saddle.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Diamond Armor (Vanilla)",
      url: Generator.requireImage("./textures/vanilla/diamond-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Gold Armor (Vanilla)",
      url: Generator.requireImage("./textures/vanilla/gold-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Chainmail Armor (Vanilla)",
      url: Generator.requireImage("./textures/vanilla/chainmail-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Iron Armor (Vanilla)",
      url: Generator.requireImage("./textures/vanilla/iron-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Saddle (Faithful)",
      url: Generator.requireImage("./textures/faithful/saddle.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Diamond Armor (Faithful)",
      url: Generator.requireImage("./textures/faithful/diamond-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Gold Armor (Faithful)",
      url: Generator.requireImage("./textures/faithful/gold-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Chainmail Armor (Faithful)",
      url: Generator.requireImage("./textures/faithful/chainmail-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Iron Armor (Faithful)",
      url: Generator.requireImage("./textures/faithful/iron-armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Saddle (Space Pig)",
      url: Generator.requireImage("./textures/space-pig/saddle.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
    {
      id: "Armor (Space Pig)",
      url: Generator.requireImage("./textures/space-pig/armor.png"),
      standardWidth: 64,
      standardHeight: 32,
    },
  ],
)

type bgSprites = {
  body: Builder.rectangleLegacy,
  boot: Builder.rectangleLegacy,
  headAdvanced: Builder.rectangleLegacy,
  headSimple: Builder.rectangleLegacy,
  headStandardAdvanced: Builder.rectangleLegacy,
  helmet: Builder.rectangleLegacy,
  leg: Builder.rectangleLegacy,
  nose3D: Builder.rectangleLegacy,
  opaque: Builder.rectangleLegacy,
  ultraMini: Builder.rectangleLegacy,
}

type foldSprites = {
  body: Builder.rectangleLegacy,
  boot: Builder.rectangleLegacy,
  headAdvanced: Builder.rectangleLegacy,
  headAdvancedCuts: Builder.rectangleLegacy,
  headSimple: Builder.rectangleLegacy,
  headStandardAdvanced: Builder.rectangleLegacy,
  helmet: Builder.rectangleLegacy,
  leg: Builder.rectangleLegacy,
  nose3D: Builder.rectangleLegacy,
  saddle: Builder.rectangleLegacy,
}

type labelSprites = {
  bodyHead: Builder.rectangleLegacy,
  bodyLeg1: Builder.rectangleLegacy,
  bodyLeg2: Builder.rectangleLegacy,
  bodyLeg3: Builder.rectangleLegacy,
  bodyLeg4: Builder.rectangleLegacy,
  head: Builder.rectangleLegacy,
  headNose3D: Builder.rectangleLegacy,
  headStandardAdvanced: Builder.rectangleLegacy,
  leg0: Builder.rectangleLegacy,
  leg1: Builder.rectangleLegacy,
  leg2: Builder.rectangleLegacy,
  leg3: Builder.rectangleLegacy,
  leg4: Builder.rectangleLegacy,
  nose3D: Builder.rectangleLegacy,
}

type titleSprites = {
  body: Builder.rectangleLegacy,
  boot: Builder.rectangleLegacy,
  head: Builder.rectangleLegacy,
  helmet: Builder.rectangleLegacy,
  leg: Builder.rectangleLegacy,
  nose3D: Builder.rectangleLegacy,
  pixelPapercraft: Builder.rectangleLegacy,
  saddle: Builder.rectangleLegacy,
  tepigmc: Builder.rectangleLegacy,
  ultraMini: Builder.rectangleLegacy,
}

let script = () => {
  // Input names
  let skinTexture = "Skin"
  let pigTexture = "Pig Texture"
  let saddleTexture = "Saddle"
  let armorTexture = "Armor (Layer 1)"
  let bgSprite = "Background Sprites"
  let foldSprite = "Fold Sprites"
  let labelSprite = "Label Sprites"
  let titleSprite = "Title Sprites"

  let bgSprites: bgSprites = {
    body: {w: 312, h: 304, x: 0, y: 0},
    boot: {w: 152, h: 104, x: 280, y: 504},
    headAdvanced: {w: 296, h: 176, x: 0, y: 304},
    headSimple: {w: 280, h: 192, x: 312, y: 200},
    headStandardAdvanced: {w: 280, h: 200, x: 312, y: 0},
    helmet: {w: 280, h: 128, x: 0, y: 480},
    leg: {w: 152, h: 160, x: 440, y: 392},
    nose3D: {w: 80, h: 80, x: 296, y: 392},
    opaque: {w: 32, h: 32, x: 296, y: 472},
    ultraMini: {w: 36, h: 28, x: 328, y: 472},
  }

  let foldSprites: foldSprites = {
    body: {w: 312, h: 304, x: 0, y: 0},
    boot: {w: 152, h: 104, x: 448, y: 448},
    headAdvanced: {w: 296, h: 176, x: 0, y: 632},
    headAdvancedCuts: {w: 296, h: 176, x: 304, y: 632},
    headSimple: {w: 280, h: 192, x: 320, y: 256},
    headStandardAdvanced: {w: 280, h: 200, x: 0, y: 304},
    helmet: {w: 280, h: 128, x: 0, y: 504},
    leg: {w: 152, h: 160, x: 280, y: 448},
    nose3D: {w: 80, h: 80, x: 432, y: 552},
    saddle: {w: 288, h: 256, x: 312, y: 0},
  }

  let labelSprites: labelSprites = {
    bodyHead: {w: 64, h: 48, x: 0, y: 0},
    bodyLeg1: {w: 32, h: 32, x: 128, y: 0},
    bodyLeg2: {w: 32, h: 32, x: 160, y: 0},
    bodyLeg3: {w: 32, h: 24, x: 128, y: 32},
    bodyLeg4: {w: 32, h: 24, x: 160, y: 32},
    head: {w: 64, h: 48, x: 64, y: 0},
    headNose3D: {w: 32, h: 24, x: 128, y: 56},
    headStandardAdvanced: {w: 16, h: 48, x: 192, y: 0},
    leg0: {w: 0, h: 0, x: 0, y: 0},
    leg1: {w: 32, h: 32, x: 0, y: 48},
    leg2: {w: 32, h: 32, x: 32, y: 48},
    leg3: {w: 32, h: 32, x: 64, y: 48},
    leg4: {w: 32, h: 32, x: 96, y: 48},
    nose3D: {w: 32, h: 24, x: 160, y: 56},
  }

  let titleSprites: titleSprites = {
    body: {w: 46, h: 16, x: 34, y: 30},
    boot: {w: 42, h: 14, x: 44, y: 16},
    head: {w: 46, h: 14, x: 138, y: 0},
    helmet: {w: 60, h: 14, x: 184, y: 0},
    leg: {w: 34, h: 16, x: 0, y: 23},
    nose3D: {w: 46, h: 14, x: 244, y: 0},
    pixelPapercraft: {w: 208, h: 34, x: 86, y: 14},
    saddle: {w: 64, h: 14, x: 74, y: 0},
    tepigmc: {w: 74, h: 16, x: 0, y: 0},
    ultraMini: {w: 44, h: 7, x: 0, y: 16},
  }

  // Function to help with defining the inputs
  let makeTextureInput = (texture, width, height, choices) => {
    Generator.defineTextureInput(
      texture,
      {
        standardWidth: width,
        standardHeight: height,
        choices,
      },
    )
  }

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
  makeTextureInput(skinTexture, 64, 64, [])
  makeTextureInput(
    saddleTexture,
    64,
    32,
    [
      "Saddle (Vanilla)",
      "Saddle (Vanilla) (Programmer Art)",
      "Saddle (Faithful)",
      "Saddle (Space Pig)",
    ],
  )
  makeTextureInput(
    armorTexture,
    64,
    32,
    [
      "Diamond Armor (Vanilla)",
      "Gold Armor (Vanilla)",
      "Chainmail Armor (Vanilla)",
      "Iron Armor (Vanilla)",
      "Diamond Armor (Faithful)",
      "Gold Armor (Faithful)",
      "Chainmail Armor (Faithful)",
      "Iron Armor (Faithful)",
      "Armor (Space Pig)",
    ],
  )

  // Function to easily draw a section of a texture
  let drawSprite = (sprite, spriteJson: Builder.rectangleLegacy, x, y) => {
    Generator.drawTextureLegacy(
      sprite,
      {x: spriteJson.x, y: spriteJson.y, w: spriteJson.w, h: spriteJson.h},
      {x, y, w: spriteJson.w, h: spriteJson.h},
      (),
    )
  }

  // Function to easily draw a section of an image and stretch it
  let drawSpriteSized = (sprite, spriteJson: Builder.rectangleLegacy, x, y, width, height) => {
    Generator.drawTextureLegacy(
      sprite,
      {x: spriteJson.x, y: spriteJson.y, w: spriteJson.w, h: spriteJson.h},
      {x, y, w: width, h: height},
      (),
    )
  }

  // Define Layer variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  Generator.defineBooleanInput("Show Titles", true)
  Generator.defineBooleanInput("Transparent Background", false)

  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"
  let showFolds = Generator.getBooleanInputValue("Show Folds")
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showTitles = Generator.getBooleanInputValue("Show Titles")
  let isTransparent = Generator.getBooleanInputValue("Transparent Background")

  // Define Region Inputs
  let hideHelmet = Generator.getBooleanInputValue("Hide Helmet")
  let hideJacket = Generator.getBooleanInputValue("Hide Jacket")
  let hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve")
  let hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve")
  let hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant")
  let hideRightPant = Generator.getBooleanInputValue("Hide Right Pant")
  let hideHelmetOverlay = Generator.getBooleanInputValue("Hide Helmet Overlay")

  // Define Texture variables

  Generator.defineSelectInput("Head Style", ["Simple", "Advanced", "Advanced (Standard)"])
  Generator.defineBooleanInput("Separate Snout", true)

  let headStyle = Generator.getSelectInputValue("Head Style")
  let noseStyle = Generator.getBooleanInputValue("Separate Snout")

  Generator.defineSelectInput("Saddle Style", ["Attached", "Separate"])
  Generator.defineSelectInput("Helmet Style", ["Attached", "Separate"])
  Generator.defineSelectInput("Boots Style", ["Attached", "Separate"])

  let saddleStyle = Generator.getSelectInputValue("Saddle Style")
  let helmetStyle = Generator.getSelectInputValue("Helmet Style")
  let bootsStyle = Generator.getSelectInputValue("Boots Style")

  Generator.defineBooleanInput("Show Ultra Mini", true)

  let showUltraMini = Generator.getBooleanInputValue("Show Ultra Mini")

  Js.log(saddleStyle)

  let useSaddle = saddleStyle !== "None"
  let useHelmet = helmetStyle !== "None"
  let useBoots = bootsStyle !== "None"

  let simpleHead = headStyle === "Simple"
  let flatNose = !noseStyle
  let standardAdvancedHead = headStyle === "Advanced (Standard)"
  let separateSaddle = saddleStyle === "Separate"
  let separateHelmet = helmetStyle === "Separate"
  let separateBoots = bootsStyle === "Separate"

  // Head Functions
  let drawHeadAdvancedShape = (texture, x, y, tx, ty) => {
    Generator.drawTextureLegacy(
      texture,
      {x: tx, y: ty + 8, w: 8, h: 2},
      {x, y: y + 64, w: 64, h: 16},
      (),
    ) // Right 1
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 2, y: ty + 10, w: 6, h: 6},
      {x: x + 16, y: y + 80, w: 48, h: 48},
      (),
    ) // Right 2
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 8, y: ty + 8, w: 8, h: 8},
      {x: x + 64, y: y + 64, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 16, y: ty + 8, w: 8, h: 2},
      {x: x + 128, y: y + 64, w: 64, h: 16},
      (),
    ) // Left 1
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 16, y: ty + 10, w: 6, h: 6},
      {x: x + 128, y: y + 80, w: 48, h: 48},
      (),
    ) // Left 2
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 8, y: ty, w: 8, h: 8},
      {x: x + 64, y, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 16, y: ty + 2, w: 8, h: 6},
      {x: x + 64, y: y + 128, w: 64, h: 48},
      ~flip=#Vertical,
      (),
    ) // Bottom
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 24, y: ty + 8, w: 8, h: 2},
      {x: x + 192, y: y + 64, w: 64, h: 16},
      (),
    ) // Back 1
    if !standardAdvancedHead {
      Generator.drawTextureLegacy(
        texture,
        {x: tx + 24, y: ty + 10, w: 8, h: 6},
        {x: x + 176, y: y + 80, w: 64, h: 48},
        (),
      ) // Back 2
      Generator.drawTextureLegacy(
        texture,
        {x: tx + 24, y: ty + 10, w: 8, h: 2},
        {x, y: y + 144, w: 64, h: 16},
        ~rotateLegacy=270.0,
        (),
      )
    }
  }

  let drawHeadAdvanced = (texture, x, y, isHelmet, drawLabels, showSecondLayer) => {
    if !isHelmet {
      if !standardAdvancedHead {
        drawSprite(bgSprite, bgSprites.headAdvanced, x, y)
      } else {
        drawSprite(bgSprite, bgSprites.headStandardAdvanced, x + 16, y)
      }
    }

    drawHeadAdvancedShape(texture, x + 16, y, 0, 0)
    if showSecondLayer {
      drawHeadAdvancedShape(texture, x + 16, y, 32, 0)
    }

    if !standardAdvancedHead {
      drawSprite(foldSprite, foldSprites.headAdvancedCuts, x, y)
      if showFolds {
        drawSprite(foldSprite, foldSprites.headAdvanced, x, y)
      }
    } else if showFolds {
      drawSprite(foldSprite, foldSprites.headStandardAdvanced, x + 16, y)
    }

    if drawLabels && showLabels {
      if !standardAdvancedHead {
        drawSprite(labelSprite, labelSprites.head, x + 192, y + 80)
      } else {
        drawSprite(labelSprite, labelSprites.headStandardAdvanced, x + 16, y + 80)
        drawSprite(labelSprite, labelSprites.headStandardAdvanced, x + 192, y + 80)
      }
      if !flatNose {
        drawSprite(labelSprite, labelSprites.headNose3D, x + 96, y + 104)
      }
      if showTitles {
        drawSprite(titleSprite, titleSprites.head, x + 22, y + 12)
      }
    }
  }

  let drawHeadSimpleShape = (texture, x, y, textureOffsetX) => {
    Generator.drawTextureLegacy(
      texture,
      {x: textureOffsetX, y: 8, w: 8, h: 8},
      {x, y: y + 64, w: 64, h: 64},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      texture,
      {x: textureOffsetX + 8, y: 8, w: 8, h: 8},
      {x: x + 64, y: y + 64, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      texture,
      {x: textureOffsetX + 16, y: 8, w: 8, h: 8},
      {x: x + 128, y: y + 64, w: 64, h: 64},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      texture,
      {x: textureOffsetX + 24, y: 8, w: 8, h: 8},
      {x: 256, y: y + 64, w: 64, h: 64},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      texture,
      {x: textureOffsetX + 8, y: 0, w: 8, h: 8},
      {x: x + 64, y, w: 64, h: 64},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      texture,
      {x: textureOffsetX + 16, y: 0, w: 8, h: 8},
      {x: x + 64, y: y + 128, w: 64, h: 64},
      ~flip=#Vertical,
      (),
    ) // Bottom
  }
  let drawHeadSimple = (texture, x, y, isHelmet, drawLabels, showSecondLayer) => {
    if !isHelmet {
      drawSprite(bgSprite, bgSprites.headSimple, x, y)
    }

    drawHeadSimpleShape(texture, x, y, 0)
    if showSecondLayer {
      drawHeadSimpleShape(texture, x, y, 32)
    }

    if showFolds {
      drawSprite(foldSprite, foldSprites.headSimple, x, y)
    }
    if drawLabels {
      if showLabels {
        drawSprite(labelSprite, labelSprites.head, x + 192, y + 88)
        if !flatNose {
          drawSprite(labelSprite, labelSprites.headNose3D, x + 80, y + 104)
        }
      }
      if showTitles {
        drawSprite(titleSprite, titleSprites.head, x + 6, y + 12)
      }
    }
  }

  //Nose Functions
  let drawNose3D = (pig, x, y) => {
    drawSprite(bgSprite, bgSprites.nose3D, x, y)

    Generator.drawTextureLegacy(
      pig,
      {x: 16, y: 17, w: 1, h: 3},
      {x: x + 16, y: y + 32, w: 8, h: 24},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      pig,
      {x: 17, y: 17, w: 4, h: 3},
      {x: x + 24, y: y + 32, w: 32, h: 24},
      (),
    ) // Center
    Generator.drawTextureLegacy(
      pig,
      {x: 21, y: 17, w: 1, h: 3},
      {x: x + 56, y: y + 32, w: 8, h: 24},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      pig,
      {x: 10, y: 12, w: 4, h: 3},
      {x: x + 24, y, w: 32, h: 24},
      ~flip=#Vertical,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      pig,
      {x: 17, y: 16, w: 4, h: 1},
      {x: x + 24, y: y + 24, w: 32, h: 8},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      pig,
      {x: 21, y: 16, w: 4, h: 1},
      {x: x + 24, y: y + 56, w: 32, h: 8},
      ~flip=#Vertical,
      (),
    ) // Bottom

    if showFolds {
      drawSprite(foldSprite, foldSprites.nose3D, x, y)
    }
    if showLabels {
      drawSprite(labelSprite, labelSprites.nose3D, x + 24, y)
    }
    if showTitles {
      drawSprite(titleSprite, titleSprites.nose3D, x + 68, y + 6)
    }
  }

  let drawNoseFlat = (texture, x, y) => {
    Generator.drawTextureLegacy(
      texture,
      {x: 17, y: 17, w: 4, h: 3},
      {x: x + 80, y: y + 96, w: 32, h: 24},
      (),
    )
  }

  // Body Function
  let drawBody = (texture, x, y, isSaddle, drawLabels, showSecondLayer) => {
    let drawLayer = (texture, sx, sy, x, y, isSaddle, isFirstLayer) => {
      if !isSaddle {
        if isFirstLayer {
          drawSprite(bgSprite, bgSprites.body, x, y)
        }
        Generator.drawTextureLegacy(
          texture,
          {x: sx, y: sy + 4, w: 4, h: 12},
          {x, y: y + 88, w: 64, h: 128},
          (),
        ) // Right
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 4, y: sy + 4, w: 8, h: 12},
          {x: x + 64, y: y + 88, w: 80, h: 128},
          (),
        ) // Bottom
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 12, y: sy + 4, w: 4, h: 12},
          {x: x + 144, y: y + 88, w: 64, h: 128},
          (),
        ) // Left
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 16, y: sy + 4, w: 8, h: 12},
          {x: x + 208, y: y + 88, w: 80, h: 128},
          (),
        ) // Top
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 4, y: sy, w: 8, h: 4},
          {x: x + 64, y: y + 24, w: 80, h: 64},
          (),
        ) // Front
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 12, y: sy, w: 8, h: 4},
          {x: x + 64, y: y + 216, w: 80, h: 64},
          ~flip=#Vertical,
          (),
        ) // Back
      } else {
        Generator.drawTextureLegacy(
          texture,
          {x: 28, y: 16, w: 8, h: 16},
          {x, y: y + 88, w: 64, h: 128},
          (),
        ) // Right
        Generator.drawTextureLegacy(
          texture,
          {x: 36, y: 16, w: 10, h: 16},
          {x: x + 64, y: y + 88, w: 80, h: 128},
          (),
        ) // Bottom
        Generator.drawTextureLegacy(
          texture,
          {x: 46, y: 16, w: 8, h: 16},
          {x: x + 144, y: y + 88, w: 64, h: 128},
          (),
        ) // Left
        Generator.drawTextureLegacy(
          texture,
          {x: 54, y: 16, w: 10, h: 16},
          {x: x + 208, y: y + 88, w: 80, h: 128},
          (),
        ) // Top
        Generator.drawTextureLegacy(
          texture,
          {x: 36, y: 8, w: 10, h: 8},
          {x: x + 64, y: y + 24, w: 80, h: 64},
          (),
        ) // Front
        Generator.drawTextureLegacy(
          texture,
          {x: 46, y: 8, w: 10, h: 8},
          {x: x + 64, y: y + 216, w: 80, h: 64},
          ~flip=#Vertical,
          (),
        ) // Back
      }
    }

    drawLayer(texture, 16, 16, x, y, isSaddle, true) // First Layer
    if showSecondLayer {
      drawLayer(texture, 16, 32, x, y, isSaddle, false) // Second Layer
    }

    if showFolds {
      drawSprite(foldSprite, foldSprites.body, x, y)
    }

    if drawLabels {
      if showLabels {
        drawSprite(labelSprite, labelSprites.bodyHead, x + 72, y + 24)
        drawSprite(labelSprite, labelSprites.bodyLeg1, x + 64, y + 96)
        drawSprite(labelSprite, labelSprites.bodyLeg2, x + 112, y + 96)
        drawSprite(labelSprite, labelSprites.bodyLeg3, x + 64, y + 192)
        drawSprite(labelSprite, labelSprites.bodyLeg4, x + 112, y + 192)
      }
      if showTitles {
        drawSprite(titleSprite, titleSprites.body, x + 6, y + 36)
      }
    }
  }

  // Leg Function
  let drawLeg = (texture, sx, sy, ox, oy, dx, dy, labelID, showSecondLayer, alexModel) => {
    drawSprite(bgSprite, bgSprites.leg, dx, dy)

    let drawLayer = (texture, sx, sy, dx, dy, alexModel) => {
      if alexModel {
        Generator.drawTextureLegacy(
          texture,
          {x: sx, y: sy + 4, w: 4, h: 12},
          {x: dx, y: dy + 56, w: 32, h: 48},
          (),
        ) // Right
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 4, y: sy + 4, w: 3, h: 12},
          {x: dx + 32, y: dy + 56, w: 32, h: 48},
          (),
        ) // Front
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 7, y: sy + 4, w: 4, h: 12},
          {x: dx + 64, y: dy + 56, w: 32, h: 48},
          (),
        ) // Left
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 11, y: sy + 4, w: 3, h: 12},
          {x: dx + 96, y: dy + 56, w: 32, h: 48},
          (),
        ) // Back
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 4, y: sy, w: 3, h: 4},
          {x: dx + 32, y: dy + 24, w: 32, h: 32},
          (),
        ) // Top
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 7, y: sy, w: 3, h: 4},
          {x: dx + 32, y: dy + 104, w: 32, h: 32},
          ~flip=#Vertical,
          (),
        ) // Bottom
      } else {
        Generator.drawTextureLegacy(
          texture,
          {x: sx, y: sy + 4, w: 4, h: 12},
          {x: dx, y: dy + 56, w: 32, h: 48},
          (),
        ) // Right
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 4, y: sy + 4, w: 4, h: 12},
          {x: dx + 32, y: dy + 56, w: 32, h: 48},
          (),
        ) // Front
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 8, y: sy + 4, w: 4, h: 12},
          {x: dx + 64, y: dy + 56, w: 32, h: 48},
          (),
        ) // Left
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 12, y: sy + 4, w: 4, h: 12},
          {x: dx + 96, y: dy + 56, w: 32, h: 48},
          (),
        ) // Back
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 4, y: sy, w: 4, h: 4},
          {x: dx + 32, y: dy + 24, w: 32, h: 32},
          (),
        ) // Top
        Generator.drawTextureLegacy(
          texture,
          {x: sx + 8, y: sy, w: 4, h: 4},
          {x: dx + 32, y: dy + 104, w: 32, h: 32},
          ~flip=#Vertical,
          (),
        ) // Bottom
      }
    }

    drawLayer(texture, sx, sy, dx, dy, alexModel) // First Layer
    if showSecondLayer {
      drawLayer(texture, ox, oy, dx, dy, alexModel) // Second Layer
    }

    if showFolds {
      drawSprite(foldSprite, foldSprites.leg, dx, dy)
    }
    let init: Builder.rectangleLegacy = {
      x: 0,
      y: 0,
      w: 0,
      h: 0,
    }
    let sprite = ref(init)
    if labelID == 0 {
      sprite := labelSprites.leg0
    }
    if labelID == 1 {
      sprite := labelSprites.leg1
    }
    if labelID == 2 {
      sprite := labelSprites.leg2
    }
    if labelID == 3 {
      sprite := labelSprites.leg3
    }
    if labelID == 4 {
      sprite := labelSprites.leg4
    }
    if showLabels {
      drawSprite(labelSprite, sprite.contents, dx + 32, dy + 24)
    }
    if showTitles {
      drawSprite(titleSprite, titleSprites.leg, dx + 76, dy + 4)
    }
  }

  // Saddle Function (only for separate saddle)
  let drawSaddleSeparate = (texture, x, y) => {
    // Top
    Generator.drawTextureLegacy(texture, {x: 41, y: 16, w: 5, h: 16}, {x, y, w: 40, h: 128}, ()) // Bottom Left
    Generator.drawTextureLegacy(
      texture,
      {x: 46, y: 16, w: 8, h: 16},
      {x: x + 40, y, w: 64, h: 128},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      texture,
      {x: 54, y: 16, w: 10, h: 16},
      {x: x + 104, y, w: 80, h: 128},
      (),
    ) // Top
    Generator.drawTextureLegacy(
      texture,
      {x: 28, y: 16, w: 8, h: 16},
      {x: x + 184, y, w: 64, h: 128},
      (),
    ) // Right
    Generator.drawTextureLegacy(
      texture,
      {x: 41, y: 16, w: 5, h: 16},
      {x: x + 248, y, w: 40, h: 128},
      (),
    ) // Bottom Right
    // Bottom
    Generator.drawTextureLegacy(
      texture,
      {x: 41, y: 16, w: 5, h: 16},
      {x, y: y + 128, w: 40, h: 128},
      ~flip=#Vertical,
      (),
    ) // Bottom Left
    Generator.drawTextureLegacy(
      texture,
      {x: 46, y: 16, w: 8, h: 16},
      {x: x + 40, y: y + 128, w: 64, h: 128},
      ~flip=#Vertical,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      texture,
      {x: 54, y: 16, w: 10, h: 16},
      {x: x + 104, y: y + 128, w: 80, h: 128},
      ~flip=#Vertical,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      texture,
      {x: 28, y: 16, w: 8, h: 16},
      {x: x + 184, y: y + 128, w: 64, h: 128},
      ~flip=#Vertical,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      texture,
      {x: 41, y: 16, w: 5, h: 16},
      {x: x + 248, y: y + 128, w: 40, h: 128},
      ~flip=#Vertical,
      (),
    ) // Bottom Right

    if showFolds {
      drawSprite(foldSprite, foldSprites.saddle, x, y)
    }
    if showTitles {
      drawSprite(titleSprite, titleSprites.saddle, x, y - 26)
    }
  }

  let drawHelmetSeparateShape = (texture, x, y, tx, ty) => {
    Generator.drawTextureLegacy(
      texture,
      {x: tx, y: ty + 8, w: 8, h: 3},
      {x, y: y + 64, w: 64, h: 24},
      (),
    ) // Right 1
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 2, y: ty + 11, w: 6, h: 5},
      {x: x + 16, y: y + 88, w: 48, h: 40},
      (),
    ) // Right 2
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 8, y: ty + 8, w: 8, h: 8},
      {x: x + 64, y: y + 64, w: 64, h: 64},
      (),
    ) // Face
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 16, y: ty + 8, w: 8, h: 3},
      {x: x + 128, y: y + 64, w: 64, h: 24},
      (),
    ) // Left 1
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 16, y: ty + 11, w: 6, h: 5},
      {x: x + 128, y: y + 88, w: 48, h: 40},
      (),
    ) // Left 2
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 24, y: ty + 8, w: 8, h: 3},
      {x: x + 192, y: y + 64, w: 64, h: 24},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      texture,
      {x: tx + 8, y: ty, w: 8, h: 8},
      {x: x + 64, y, w: 64, h: 64},
      (),
    ) // Top
  }

  // Helmet Functions (only for separate helmet)
  let drawHelmetSeparate = (texture, x, y) => {
    drawSprite(bgSprite, bgSprites.helmet, x, y)

    drawHelmetSeparateShape(texture, x, y, 0, 0)
    if !hideHelmetOverlay {
      drawHelmetSeparateShape(texture, x, y, 32, 0)
    }

    if showFolds {
      drawSprite(foldSprite, foldSprites.helmet, x, y)
    }
    if showTitles {
      drawSprite(titleSprite, titleSprites.helmet, x - 8, y + 12)
    }
  }

  // Boot Function
  let drawBoot = (texture, x, y, separate) => {
    if separate {
      drawSprite(bgSprite, bgSprites.boot, x, y)
    }

    Generator.drawTextureLegacy(texture, {x: 0, y: 26, w: 4, h: 6}, {x, y: y + 0, w: 32, h: 48}, ()) // Right
    Generator.drawTextureLegacy(
      texture,
      {x: 4, y: 26, w: 4, h: 6},
      {x: x + 32, y: y + 0, w: 32, h: 48},
      (),
    ) // Front
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 26, w: 4, h: 6},
      {x: x + 64, y: y + 0, w: 32, h: 48},
      (),
    ) // Left
    Generator.drawTextureLegacy(
      texture,
      {x: 12, y: 26, w: 4, h: 6},
      {x: x + 96, y: y + 0, w: 32, h: 48},
      (),
    ) // Back
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 16, w: 4, h: 4},
      {x: x + 32, y: y + 48, w: 32, h: 32},
      ~flip=#Vertical,
      (),
    ) // Bottom

    if showFolds {
      drawSprite(foldSprite, foldSprites.boot, x, y)
    }
    if separate && showTitles {
      drawSprite(titleSprite, titleSprites.boot, x, y - 26)
    }
  }

  let drawUltraMiniBody = (texture, x, y) => {
    Generator.drawTextureLegacy(
      texture,
      {x: 16, y: 20, w: 4, h: 12},
      {x: x + 8, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      texture,
      {x: 20, y: 20, w: 8, h: 12},
      {x: x + 32, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      texture,
      {x: 28, y: 20, w: 4, h: 12},
      {x: x + 24, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      texture,
      {x: 32, y: 20, w: 8, h: 12},
      {x: x + 16, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Bottom

    if !hideJacket {
      Generator.drawTextureLegacy(
        texture,
        {x: 16, y: 36, w: 4, h: 12},
        {x: x + 8, y: y + 20, w: 8, h: 12},
        ~rotateLegacy=180.0,
        (),
      ) // Right Overlay
      Generator.drawTextureLegacy(
        texture,
        {x: 20, y: 36, w: 8, h: 12},
        {x: x + 32, y: y + 20, w: 8, h: 12},
        ~rotateLegacy=180.0,
        (),
      ) // Top Overlay
      Generator.drawTextureLegacy(
        texture,
        {x: 28, y: 36, w: 4, h: 12},
        {x: x + 24, y: y + 20, w: 8, h: 12},
        ~rotateLegacy=180.0,
        (),
      ) // Left Overlay
      Generator.drawTextureLegacy(
        texture,
        {x: 32, y: 36, w: 8, h: 12},
        {x: x + 16, y: y + 20, w: 8, h: 12},
        ~rotateLegacy=180.0,
        (),
      ) // Bottom Overlay
    }
  }

  let drawUltraMiniSaddle = (texture, x, y) => {
    Generator.drawTextureLegacy(
      texture,
      {x: 28, y: 16, w: 8, h: 16},
      {x: x + 8, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      texture,
      {x: 36, y: 16, w: 10, h: 16},
      {x: x + 32, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Top
    Generator.drawTextureLegacy(
      texture,
      {x: 46, y: 16, w: 8, h: 16},
      {x: x + 24, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      texture,
      {x: 54, y: 16, w: 10, h: 16},
      {x: x + 16, y: y + 20, w: 8, h: 12},
      ~rotateLegacy=180.0,
      (),
    ) // Bottom
  }

  let drawUltraMiniLegs = (texture, x, y) => {
    Generator.drawTextureLegacy(
      texture,
      {x: 24, y: 48, w: 4, h: 4},
      {x: x + 24, y: y + 8, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 4
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 16, w: 4, h: 4},
      {x: x + 29, y: y + 8, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 3
    Generator.drawTextureLegacy(
      texture,
      {x: 40, y: 48, w: 4, h: 4},
      {x: x + 24, y: y + 17, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 2
    Generator.drawTextureLegacy(
      texture,
      {x: 48, y: 16, w: 4, h: 4},
      {x: x + 29, y: y + 17, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 1

    // Overlays
    if !hideLeftPant {
      Generator.drawTextureLegacy(
        texture,
        {x: 8, y: 48, w: 4, h: 4},
        {x: x + 24, y: y + 8, w: 3, h: 3},
        ~flip=#Vertical,
        (),
      ) // Foot 4 Overlay
    }
    if !hideRightPant {
      Generator.drawTextureLegacy(
        texture,
        {x: 8, y: 32, w: 4, h: 4},
        {x: x + 29, y: y + 8, w: 3, h: 3},
        ~flip=#Vertical,
        (),
      ) // Foot 3 Overlay
    }
    if !hideLeftSleeve {
      Generator.drawTextureLegacy(
        texture,
        {x: 56, y: 48, w: 4, h: 4},
        {x: x + 24, y: y + 17, w: 3, h: 3},
        ~flip=#Vertical,
        (),
      ) // Foot 2 Overlay
    }
    if !hideRightSleeve {
      Generator.drawTextureLegacy(
        texture,
        {x: 48, y: 32, w: 4, h: 4},
        {x: x + 29, y: y + 17, w: 3, h: 3},
        ~flip=#Vertical,
        (),
      ) // Foot 1 Overlay
    }
  }

  let drawUltraMiniBoots = (texture, x, y) => {
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 16, w: 4, h: 4},
      {x: x + 24, y: y + 8, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 4
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 16, w: 4, h: 4},
      {x: x + 29, y: y + 8, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 3
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 16, w: 4, h: 4},
      {x: x + 24, y: y + 17, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 2
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 16, w: 4, h: 4},
      {x: x + 29, y: y + 17, w: 3, h: 3},
      ~flip=#Vertical,
      (),
    ) // Foot 1
  }

  let drawUltraMiniEnds = (texture, x, y) => {
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 8, w: 8, h: 8},
      {x: x + 8, y: y + 20, w: 8, h: 8},
      (),
    ) // Face
    if !hideHelmet {
      Generator.drawTextureLegacy(
        texture,
        {x: 40, y: 8, w: 8, h: 8},
        {x: x + 8, y: y + 20, w: 8, h: 8},
        (),
      ) // Face Overlay
    }
    Generator.drawTextureLegacy(
      pigTexture,
      {x: 17, y: 17, w: 4, h: 3},
      {x: x + 10, y: y + 25, w: 4, h: 3},
      (),
    ) // Nose
    Generator.drawTextureLegacy(
      texture,
      {x: 28, y: 16, w: 8, h: 4},
      {x: x + 8, y, w: 8, h: 8},
      ~flip=#Vertical,
      (),
    ) // Back
    if !hideJacket {
      Generator.drawTextureLegacy(
        texture,
        {x: 28, y: 32, w: 8, h: 4},
        {x: x + 8, y, w: 8, h: 8},
        ~flip=#Vertical,
        (),
      ) // Back Overlay
    }
  }

  let drawUltraMiniHelmet = (texture, x, y) => {
    //Generator.drawTextureLegacy(texture, {x:8,  y:0,  w:8, h:2}, {x:x+8,  y:y+18, w:8, h:2}); // Top
    Generator.drawTextureLegacy(
      texture,
      {x: 8, y: 8, w: 8, h: 8},
      {x: x + 8, y: y + 20, w: 8, h: 8},
      (),
    ) // Front
    if !hideHelmetOverlay {
      Generator.drawTextureLegacy(
        texture,
        {x: 40, y: 8, w: 8, h: 8},
        {x: x + 8, y: y + 20, w: 8, h: 8},
        (),
      ) // Front Overlay
    }
    //Generator.drawTextureLegacy(texture, {x:8, y:8, w:8, h:8}, {x:x+8, y:y+20, w:8, h:8}); // Full Helmet
  }

  // Ultra Mini Functions
  let drawUltraMini = (x, y) => {
    drawSprite(bgSprite, bgSprites.ultraMini, x, y)

    drawUltraMiniBody(skinTexture, x, y)
    drawUltraMiniLegs(skinTexture, x, y)
    drawUltraMiniEnds(skinTexture, x, y)
    if useSaddle {
      drawUltraMiniSaddle(saddleTexture, x, y)
    }
    if useHelmet {
      drawUltraMiniHelmet(armorTexture, x, y)
    }
    if useBoots {
      drawUltraMiniBoots(armorTexture, x, y)
    }
    if showTitles {
      drawSprite(titleSprite, titleSprites.ultraMini, x - 8, y - 15)
    }
  }

  // Function to draw TepigMC and Pixel Papercraft
  let drawCredits = () => {
    drawSprite(titleSprite, titleSprites.tepigmc, 19, 805) // TepigMC
    drawSprite(titleSprite, titleSprites.pixelPapercraft, 368, 788) // Pixel Papercraft
  }

  // Opaque Background Function
  let drawOpaque = () => {
    if !isTransparent {
      drawSpriteSized(bgSprite, bgSprites.opaque, 0, 0, 595, 842)
    }
  }

  ///// PAGE 1 - Pig /////
  Generator.usePage("Pig")
  drawOpaque()
  drawCredits()

  // Define Region Inputs
  Generator.defineRegionInput((64, 96, 256, 192), () => {
    Generator.setBooleanInputValue("Hide Helmet", !hideHelmet)
  })
  Generator.defineRegionInput((56, 328, 288, 256), () => {
    Generator.setBooleanInputValue("Hide Jacket", !hideJacket)
  })
  Generator.defineRegionInput((392, 312, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve)
  })
  Generator.defineRegionInput((392, 128, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve)
  })
  Generator.defineRegionInput((240, 608, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant)
  })
  Generator.defineRegionInput((392, 496, 128, 112), () => {
    Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant)
  })

  if simpleHead {
    drawHeadSimple(skinTexture, 64, 96, false, !useHelmet || separateHelmet, !hideHelmet) // Head
  } else {
    drawHeadAdvanced(skinTexture, 48, 96, false, !useHelmet || separateHelmet, !hideHelmet) // Head
  }

  drawBody(skinTexture, 56, 304, false, !useSaddle || separateSaddle, !hideJacket) // Body

  drawLeg(skinTexture, 40, 16, 40, 32, 392, 104, 1, !hideRightSleeve, alexModel) // Right Arm
  drawLeg(skinTexture, 32, 48, 48, 48, 392, 288, 2, !hideLeftSleeve, alexModel) // Left Arm
  drawLeg(skinTexture, 0, 16, 0, 32, 392, 472, 3, !hideRightPant, false) // Right Leg
  drawLeg(skinTexture, 16, 48, 0, 48, 240, 584, 4, !hideLeftPant, false) // Left Leg

  if flatNose {
    drawNoseFlat(pigTexture, 64, 104)
  } else {
    drawNose3D(pigTexture, 248, 272)
  }

  // Draw the accessories on the pig
  if useHelmet && !separateHelmet {
    Generator.defineRegionInput((128, 32, 64, 64), () => {
      Generator.setBooleanInputValue("Hide Helmet Overlay", !hideHelmetOverlay)
    })
    if simpleHead {
      drawHeadSimple(armorTexture, 64, 96, true, true, !hideHelmetOverlay)
    } else {
      drawHeadAdvanced(armorTexture, 48, 96, true, true, !hideHelmetOverlay)
    }
  }
  if useSaddle && !separateSaddle {
    drawBody(saddleTexture, 56, 304, true, true, false)
  }
  if useBoots && !separateBoots {
    drawBoot(armorTexture, 392, 160, false)
    drawBoot(armorTexture, 392, 344, false)
    drawBoot(armorTexture, 392, 528, false)
    drawBoot(armorTexture, 240, 640, false)
  }

  if showUltraMini {
    drawUltraMini(120, 650)
  }

  ///// PAGE 2 - Accessories /////
  if (useSaddle && separateSaddle) || useHelmet && separateHelmet || (useBoots && separateBoots) {
    // Only use if needed
    Generator.usePage("Accessories")
    drawOpaque()
    drawCredits()

    if useSaddle && separateSaddle {
      drawSaddleSeparate(saddleTexture, 56, 328)
    }
    if useHelmet && separateHelmet {
      Generator.defineRegionInput((64, 96, 256, 192), () => {
        Generator.setBooleanInputValue("Hide Helmet Overlay", !hideHelmetOverlay)
      })
      drawHelmetSeparate(armorTexture, 64, 96)
    }
    if useBoots && separateBoots {
      drawBoot(armorTexture, 392, 160, true)
      drawBoot(armorTexture, 392, 344, true)
      drawBoot(armorTexture, 392, 528, true)
      drawBoot(armorTexture, 240, 640, true)
    }
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
