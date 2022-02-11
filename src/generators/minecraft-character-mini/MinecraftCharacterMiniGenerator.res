let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character-mini"

let name = "Minecraft Character Mini"

let history = [
  "13 Sep 2015 Sandvich - First release using the generator builder.",
  "17 Sep 2020 NinjolasNJM - Added support for Alex skins and fixed bottom of legs.",
  "11 Feb 2022 LostMiner - Refactor. Add pixelate option.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Skin Overlay",
    url: requireImage("skin-overlay"),
  },
  {
    id: "Skin Background",
    url: requireImage("skin-background"),
  },
]

let steveSkin = requireTexture("SkinSteve64x64")
let alexSkin = requireTexture("SkinAlex64x64")

let textures: array<Generator.textureDef> = [
  // Default texture for "Mini 1"
  {
    id: "Mini 1",
    url: steveSkin,
    standardWidth: 64,
    standardHeight: 64,
  },
  // Steve texture choice
  {
    id: "Steve",
    url: steveSkin,
    standardWidth: 64,
    standardHeight: 64,
  },
  // Alex texture choice
  {
    id: "Alex",
    url: alexSkin,
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

let drawHead = (textureId: string, layer: TextureMap.MinecraftCharacter.layer, ox, oy) => {
  Generator.drawTexture(textureId, layer.head.right, (ox, oy, 64, 64), ())
  Generator.drawTexture(textureId, layer.head.front, (ox + 64, oy, 64, 64), ())
  Generator.drawTexture(textureId, layer.head.left, (ox + 128, oy, 64, 64), ())
  Generator.drawTexture(textureId, layer.head.back, (ox + 192, oy, 64, 64), ())
  Generator.drawTexture(textureId, layer.head.top, (ox + 64, oy - 64, 64, 64), ())
}

let drawHeadFlaps = (textureId: string, layer: TextureMap.MinecraftCharacter.layer, ox, oy) => {
  Generator.drawTexture(textureId, layer.head.right, (ox, oy, 64, 64), ~rotate=90.0, ())
  Generator.drawTexture(textureId, layer.head.left, (ox + 128, oy, 64, 64), ~rotate=-90.0, ())
}

let drawBody = (
  textureId: string,
  layer: TextureMap.MinecraftCharacter.layer,
  ox,
  oy,
  bodyHeight,
  pixelate,
) => {
  Generator.drawTexture(textureId, layer.body.right, (ox, oy, 64, bodyHeight), ~pixelate, ())
  Generator.drawTexture(textureId, layer.body.front, (ox + 64, oy, 64, bodyHeight), ~pixelate, ())
  Generator.drawTexture(textureId, layer.body.left, (ox + 128, oy, 64, bodyHeight), ~pixelate, ())
  Generator.drawTexture(textureId, layer.body.back, (ox + 192, oy, 64, bodyHeight), ~pixelate, ())
}

let drawRightArm = (
  textureId: string,
  layer: TextureMap.MinecraftCharacter.layer,
  ox,
  oy,
  pixelate,
) => {
  Generator.drawTexture(
    textureId,
    layer.rightArm.left,
    (ox, oy, 32, 48),
    ~rotate=90.0,
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.rightArm.right,
    (ox, oy + 32, 32, 48),
    ~rotate=90.0,
    ~pixelate,
    (),
  )
}

let drawLeftArm = (
  textureId: string,
  layer: TextureMap.MinecraftCharacter.layer,
  ox,
  oy,
  pixelate,
) => {
  Generator.drawTexture(
    textureId,
    layer.leftArm.right,
    (ox, oy, 32, 48),
    ~rotate=-90.0,
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.leftArm.left,
    (ox, oy + 32, 32, 48),
    ~rotate=-90.0,
    ~pixelate,
    (),
  )
}

let drawRightLeg = (
  textureId: string,
  layer: TextureMap.MinecraftCharacter.layer,
  ox,
  oy,
  bodyHeight,
  pixelate,
) => {
  let legHeight = 64 - bodyHeight
  Generator.drawTexture(
    textureId,
    layer.rightLeg.front,
    (ox + 64, oy + bodyHeight, 32, legHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.rightLeg.right,
    (ox, oy + bodyHeight, 64, legHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.rightLeg.back,
    (ox + 224, oy + bodyHeight, 32, legHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.rightLeg.bottom,
    (ox + 64, oy + 64, 32, 64),
    ~flip=#Vertical,
    ~pixelate,
    (),
  )
}

let drawLeftLeg = (
  textureId: string,
  layer: TextureMap.MinecraftCharacter.layer,
  ox,
  oy,
  bodyHeight,
  pixelate,
) => {
  let legHeight = 64 - bodyHeight
  Generator.drawTexture(
    textureId,
    layer.leftLeg.front,
    (ox + 96, oy + bodyHeight, 32, legHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.leftLeg.left,
    (ox + 128, oy + bodyHeight, 64, legHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.leftLeg.back,
    (ox + 192, oy + bodyHeight, 32, legHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.leftLeg.bottom,
    (ox + 96, oy + 64, 32, 64),
    ~flip=#Vertical,
    ~pixelate,
    (),
  )
}

let drawMini = (textureId: string, x: int, y: int) => {
  Generator.defineTextureInput(
    textureId,
    {standardWidth: 64, standardHeight: 64, choices: ["Steve", "Alex"]},
  )

  if Generator.hasTexture(textureId) {
    let modelTypeName = textureId ++ " Model Type"
    Generator.defineSelectInput(modelTypeName, ["Steve", "Alex"])
    let modelType = Generator.getSelectInputValue(modelTypeName)

    let headOverlayName = textureId ++ " Head Overlay"
    Generator.defineBooleanInput(headOverlayName, true)
    let showHeadOverlay = Generator.getBooleanInputValue(headOverlayName)

    let bodyOverlayName = textureId ++ " Body Overlay"
    Generator.defineBooleanInput(bodyOverlayName, true)
    let showBodyOverlay = Generator.getBooleanInputValue(bodyOverlayName)

    let armOverlayName = textureId ++ " Arm Overlay"
    Generator.defineBooleanInput(armOverlayName, true)
    let showArmOverlay = Generator.getBooleanInputValue(armOverlayName)

    let legOverlayName = textureId ++ " Leg Overlay"
    Generator.defineBooleanInput(legOverlayName, true)
    let showLegOverlay = Generator.getBooleanInputValue(legOverlayName)

    let bodyHeightName = textureId ++ " Body Height"
    Generator.defineRangeInput(bodyHeightName, {min: 0, max: 64, value: 32, step: 1})
    let bodyHeight = Generator.getRangeInputValue(bodyHeightName)

    let textureStyleName = textureId ++ " Texture Style"
    Generator.defineSelectInput(textureStyleName, ["Simple", "Detailed"])
    let textureStyle = Generator.getSelectInputValue(textureStyleName)

    let isAlexModel = modelType === "Alex"
    let pixelate = textureStyle === "Simple"

    // Skin Background
    Generator.drawImage("Skin Background", (x, y))

    // Head
    let ox = x + 49
    let oy = y + 90
    drawHead(textureId, steve.base, ox, oy)
    if showHeadOverlay {
      drawHead(textureId, steve.overlay, ox, oy)
    }

    // Head Flaps
    let ox = x + 49
    let oy = y + 26
    drawHeadFlaps(textureId, steve.base, ox, oy)
    if showHeadOverlay {
      drawHeadFlaps(textureId, steve.overlay, ox, oy)
    }

    // Body
    let ox = x + 49
    let oy = y + 154
    drawBody(textureId, steve.base, ox, oy, bodyHeight, pixelate)
    if showBodyOverlay {
      drawBody(textureId, steve.overlay, ox, oy, bodyHeight, pixelate)
    }

    // Arms
    let armTexture = isAlexModel ? alex : steve

    // Right Arm
    let ox = x + 9
    let oy = y + 2
    drawRightArm(textureId, armTexture.base, ox, oy, pixelate)
    if showArmOverlay {
      drawRightArm(textureId, armTexture.overlay, ox, oy, pixelate)
    }

    // Left Arm
    let ox = x + 249
    let oy = y + 2
    drawLeftArm(textureId, armTexture.base, ox, oy, pixelate)
    if showArmOverlay {
      drawLeftArm(textureId, armTexture.overlay, ox, oy, pixelate)
    }

    // Legs
    let ox = x + 49
    let oy = y + 154

    // Right Leg
    drawRightLeg(textureId, steve.base, ox, oy, bodyHeight, pixelate)
    if showLegOverlay {
      drawRightLeg(textureId, steve.overlay, ox, oy, bodyHeight, pixelate)
    }

    // Left Leg
    drawLeftLeg(textureId, steve.base, ox, oy, bodyHeight, pixelate)
    if showLegOverlay {
      drawLeftLeg(textureId, steve.overlay, ox, oy, bodyHeight, pixelate)
    }

    // Draw the fold and cut lines
    Generator.drawImage("Skin Overlay", (x, y))
  }
}

let script = () => {
  drawMini("Mini 1", 151, 108)
  drawMini("Mini 2", 151, 453)
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
