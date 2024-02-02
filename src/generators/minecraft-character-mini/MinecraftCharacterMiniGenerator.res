let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-character-mini"

let name = "Minecraft Character Mini"

let history = [
  "13 Sep 2015 Sandvich - First release using the generator builder.",
  "17 Sep 2020 NinjolasNJM - Added support for Alex skins and fixed bottom of legs.",
  "11 Feb 2022 LostMiner - Refactor. Add pixelate option.",
  "03 Jun 2022 NinjolasNJM - Overhauled the foreground, added a title and an opaque background, a folds toggle, and overlay region inputs",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Foreground",
    url: requireImage("Foreground"),
  },
  {
    id: "Title",
    url: requireImage("Title"),
  },
]

let textures: array<Generator.textureDef> = MinecraftSkins.skins

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

let drawFoldLineRect = (dest: Generator_Builder.rectangle) => {
  let (x, y, w, h) = dest

  Generator.drawFoldLine((x, y - 1), (x + w, y - 1))
  Generator.drawFoldLine((x + w, y), (x + w, y + h))
  Generator.drawFoldLine((x + w, y + h + 1), (x, y + h + 1))
  Generator.drawFoldLine((x, y + h), (x, y))
}

let drawFoldLineCuboid = (
  position: Generator_Builder.position,
  scale: (int, int, int),
  ~leftSide: bool=false,
  (),
) => {
  let (x, y) = position
  let (w, h, l) = scale

  if !leftSide {
    drawFoldLineRect((x + l, y, w, l * 2 + h))
    drawFoldLineRect((x, y + l, l * 2 + w * 2, h))
    Generator.drawFoldLine((x + l * 2 + w - 1, y + l), (x + l * 2 + w - 1, y + l + h))
  } else {
    drawFoldLineRect((x + l + w, y, w, l * 2 + h))
    drawFoldLineRect((x, y + l, l * 2 + w * 2, h))
    Generator.drawFoldLine((x + w, y + l), (x + w, y + l + h))
  }
}

let drawFolds = ((x, y): (int, int)) => {
  Generator.fillRect((x + 49, y + 90, 64, 64), "#ffffff80")
  Generator.fillRect((x + 177, y + 90, 64, 64), "#ffffff80")

  drawFoldLineCuboid((x + 49, y + 26), (64, 128, 64), ())
  Generator.drawFoldLine((x + 49, y + 25), (x + 241, y + 25))

  drawFoldLineRect((x + 1, y + 10, 48, 64))
  Generator.drawFoldLine((x + 1, y + 41), (x + 49, y + 41))
  Generator.drawFoldLine((x + 48, y + 74), (x + 48, y + 90))
  Generator.drawLine((x + 49, y + 26), (x + 49, y + 42), ~color="#ff0000", ())

  drawFoldLineRect((x + 241, y + 10, 48, 64))
  Generator.drawFoldLine((x + 241, y + 41), (x + 290, y + 41))
  Generator.drawFoldLine((x + 241, y + 74), (x + 241, y + 90))
  Generator.drawLine((x + 240, y + 26), (x + 240, y + 42), ~color="#ff0000", ())

  Generator.drawLine((x + 49, y + 89), (x + 113, y + 89), ~color="#ff0000", ())
  Generator.drawLine((x + 177, y + 89), (x + 241, y + 89), ~color="#ff0000", ())
}

let drawMini = (textureId: string, x: int, y: int) => {
  Generator.defineSkinInput(
    textureId,
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )

  if Generator.hasTexture(textureId) {
    let modelTypeName = textureId ++ " Model"
    Generator.defineSelectInput(modelTypeName, ["Steve", "Alex"])
    let modelType = Generator.getSelectInputValue(modelTypeName)

    let showFolds = Generator.defineAndGetBooleanInput("Show " ++ textureId ++ " Folds", true)
    let showHeadOverlay = Generator.getBooleanInputValueWithDefault(
      textureId ++ " Head Overlay",
      true,
    )
    let showBodyOverlay = Generator.getBooleanInputValueWithDefault(
      textureId ++ " Body Overlay",
      true,
    )
    let showLeftArmOverlay = Generator.getBooleanInputValueWithDefault(
      textureId ++ " Left Arm Overlay",
      true,
    )
    let showRightArmOverlay = Generator.getBooleanInputValueWithDefault(
      textureId ++ " Right Arm Overlay",
      true,
    )
    let showLeftLegOverlay = Generator.getBooleanInputValueWithDefault(
      textureId ++ " Left Leg Overlay",
      true,
    )
    let showRightLegOverlay = Generator.getBooleanInputValueWithDefault(
      textureId ++ " Right Leg Overlay",
      true,
    )
    let bodyHeight = Generator.defineAndGetRangeInput(
      textureId ++ " Body Height",
      {min: 0, max: 64, value: 32, step: 1},
    )
    let textureStyle = Generator.defineAndGetSelectInput(
      textureId ++ " Texture Style",
      ["Simple", "Detailed"],
    )

    let isAlexModel = modelType === "Alex"
    let pixelate = textureStyle === "Simple"

    // Head
    let ox = x + 49
    let oy = y + 90
    drawHead(textureId, steve.base, ox, oy)
    if showHeadOverlay {
      drawHead(textureId, steve.overlay, ox, oy)
    }
    Generator.defineRegionInput((ox, oy - 64, 192, 128), () => {
      Generator.setBooleanInputValue(textureId ++ " Head Overlay", !showHeadOverlay)
    })

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
    Generator.defineRegionInput((ox, oy, 256, bodyHeight), () => {
      Generator.setBooleanInputValue(textureId ++ " Body Overlay", !showBodyOverlay)
    })

    // Arms
    let armTexture = isAlexModel ? alex : steve

    // Right Arm
    let ox = x + 9
    let oy = y + 2
    drawRightArm(textureId, armTexture.base, ox, oy, pixelate)
    if showRightArmOverlay {
      drawRightArm(textureId, armTexture.overlay, ox, oy, pixelate)
    }
    Generator.defineRegionInput((ox - 8, oy + 8, 48, 64), () => {
      Generator.setBooleanInputValue(textureId ++ " Right Arm Overlay", !showRightArmOverlay)
    })

    // Left Arm
    let ox = x + 249
    let oy = y + 2
    drawLeftArm(textureId, armTexture.base, ox, oy, pixelate)
    if showLeftArmOverlay {
      drawLeftArm(textureId, armTexture.overlay, ox, oy, pixelate)
    }
    Generator.defineRegionInput((ox - 8, oy + 8, 48, 64), () => {
      Generator.setBooleanInputValue(textureId ++ " Left Arm Overlay", !showLeftArmOverlay)
    })

    // Legs
    let ox = x + 49
    let oy = y + 154

    // Right Leg
    drawRightLeg(textureId, steve.base, ox, oy, bodyHeight, pixelate)
    if showRightLegOverlay {
      drawRightLeg(textureId, steve.overlay, ox, oy, bodyHeight, pixelate)
    }
    Generator.defineRegionInput((ox, oy + bodyHeight, 96, 128 - bodyHeight), () => {
      Generator.setBooleanInputValue(textureId ++ " Right Leg Overlay", !showRightLegOverlay)
    })

    // Left Leg
    drawLeftLeg(textureId, steve.base, ox, oy, bodyHeight, pixelate)
    if showLeftLegOverlay {
      drawLeftLeg(textureId, steve.overlay, ox, oy, bodyHeight, pixelate)
    }
    Generator.defineRegionInput((ox + 96, oy + bodyHeight, 160, 128 - bodyHeight), () => {
      Generator.setBooleanInputValue(textureId ++ " Left Leg Overlay", !showLeftLegOverlay)
    })

    // Draw the fold and cut lines
    Generator.drawImage("Foreground", (x, y))
    if showFolds {
      drawFolds((x, y))
    }
  }
}

let script = () => {
  drawMini("Mini 1", 121, 108)
  drawMini("Mini 2", 121, 453)

  Generator.drawImage("Title", (0, 0))
  Generator.fillBackgroundColorWithWhite()
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
