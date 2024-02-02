let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")

let id = "minecraft-action-figure-mini"

let name = "Minecraft Action Figure Mini"

let history = [
  "Original Mini Action Figure designed by diamondcrafter99.",
  "30 Jun 2022 NinjolasNJM - first release",
  "02 Feb 2024 NinjolasNJM - added skin input",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Folds",
    url: requireImage("Folds"),
  },
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

let steve = Minecraft.Character.steve
let alex = Minecraft.Character.alex

let drawHead = (textureId: string, layer: Minecraft.Character.Layer.t, ox, oy) => {
  Minecraft.drawCuboid(textureId, layer.head, (ox, oy), (64, 64, 64), ())
  Generator.drawTexture(textureId, layer.head.bottom, (ox + 352, oy + 32, 96, 64), ()) // Neck
}

let drawBody = (
  textureId: string,
  layer: Minecraft.Character.Layer.t,
  ox,
  oy,
  bodyHeight,
  pixelate,
) => {
  Generator.drawTexture(textureId, layer.body.top, (ox + 64, oy, 64, 64), ())
  Generator.drawTexture(textureId, layer.body.right, (ox, oy + 64, 64, bodyHeight), ~pixelate, ())
  Generator.drawTexture(
    textureId,
    layer.body.front,
    (ox + 64, oy + 64, 64, bodyHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.body.left,
    (ox + 128, oy + 64, 64, bodyHeight),
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.body.back,
    (ox + 192, oy + 64, 64, bodyHeight),
    ~pixelate,
    (),
  )
  // Generator.drawCuboid(textureId, layer.body, (ox, oy), (64, bodyHeight, 64), ~excludeFace=#Bottom, ~pixelate, ())
}

let drawRightArm = (textureId: string, layer: Minecraft.Character.Layer.t, ox, oy, pixelate) => {
  let (sx, sy, _, _) = layer.rightArm.left
  Generator.drawTexture(textureId, (sx, sy, 4, 8), (ox + 32, oy, 32, 32), ~pixelate, ()) // Shoulder Inside
  Generator.drawTexture(textureId, (sx, sy, 4, 8), (ox + 32, oy + 32, 32, 32), ~pixelate, ()) // Shoulder

  Generator.drawTexture(
    textureId,
    layer.rightArm.right,
    (ox + 8, oy + 88, 32, 48),
    ~rotate=-90.0,
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.rightArm.left,
    (ox + 56, oy + 88, 32, 48),
    ~rotate=90.0,
    ~pixelate,
    (),
  )
}

let drawLeftArm = (textureId: string, layer: Minecraft.Character.Layer.t, ox, oy, pixelate) => {
  let (sx, sy, _, _) = layer.leftArm.right
  Generator.drawTexture(textureId, (sx, sy, 4, 8), (ox + 32, oy, 32, 32), ~pixelate, ()) // Shoulder Inside
  Generator.drawTexture(textureId, (sx, sy, 4, 8), (ox + 32, oy + 32, 32, 32), ~pixelate, ()) // Shoulder

  Generator.drawTexture(
    textureId,
    layer.leftArm.right,
    (ox + 8, oy + 88, 32, 48),
    ~rotate=-90.0,
    ~pixelate,
    (),
  )
  Generator.drawTexture(
    textureId,
    layer.leftArm.left,
    (ox + 56, oy + 88, 32, 48),
    ~rotate=90.0,
    ~pixelate,
    (),
  )
}

let drawRightLeg = (
  textureId: string,
  layer: Minecraft.Character.Layer.t,
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
  layer: Minecraft.Character.Layer.t,
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
  drawFoldLineCuboid((x, y), (64, 64, 64), ()) // Head
  drawFoldLineRect((x + 352, y + 32, 96, 64)) // Neck

  drawFoldLineCuboid((x + 224, y + 160), (64, 64, 64), ()) // Body

  drawFoldLineRect((x - 32, y + 320, 96, 32)) // Right Arm
  Generator.drawFoldLine((x + 15, y + 320), (x + 15, y + 352)) // Right Arm Center

  drawFoldLineRect((x + 96, y + 320, 96, 32)) // Left Arm
  Generator.drawFoldLine((x + 144, y + 320), (x + 144, y + 352)) // Left Arm Center

  Generator.drawImage("Folds", (x - 64, y - 32))
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
    let ox = x
    let oy = y
    drawHead(textureId, steve.base, ox, oy)
    if showHeadOverlay {
      drawHead(textureId, steve.overlay, ox, oy)
    }
    Generator.defineRegionInput((ox, oy, 256, 192), () => {
      Generator.setBooleanInputValue(textureId ++ " Head Overlay", !showHeadOverlay)
    })

    // Body
    let ox = x + 224
    let oy = y + 160
    drawBody(textureId, steve.base, ox, oy, bodyHeight, pixelate)
    if showBodyOverlay {
      drawBody(textureId, steve.overlay, ox, oy, bodyHeight, pixelate)
    }
    Generator.defineRegionInput((ox, oy, 256, 64 + bodyHeight), () => {
      Generator.setBooleanInputValue(textureId ++ " Body Overlay", !showBodyOverlay)
    })

    // Arms
    let armTexture = isAlexModel ? alex : steve

    // Right Arm
    let ox = x - 32
    let oy = y + 224
    drawRightArm(textureId, armTexture.base, ox, oy, pixelate)
    if showRightArmOverlay {
      drawRightArm(textureId, armTexture.overlay, ox, oy, pixelate)
    }
    Generator.defineRegionInput((ox, oy + 96, 96, 32), () => {
      Generator.setBooleanInputValue(textureId ++ " Right Arm Overlay", !showRightArmOverlay)
    })

    // Left Arm
    let ox = x + 96
    let oy = y + 224
    drawLeftArm(textureId, armTexture.base, ox, oy, pixelate)
    if showLeftArmOverlay {
      drawLeftArm(textureId, armTexture.overlay, ox, oy, pixelate)
    }
    Generator.defineRegionInput((ox, oy + 96, 96, 32), () => {
      Generator.setBooleanInputValue(textureId ++ " Left Arm Overlay", !showLeftArmOverlay)
    })

    // Legs
    let ox = x + 224
    let oy = y + 224

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
    Generator.drawImage("Foreground", (x - 64, y - 32))
    if showFolds {
      drawFolds((x, y))
    }
  }
}

let script = () => {
  drawMini("Mini 1", 73, 30)
  drawMini("Mini 2", 73, 415)

  Generator.drawImage("Title", (0, 0))
  Generator.fillBackgroundColorWithWhite()
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: None,
  video: None,
  instructions: None,
  images,
  textures,
  script,
}
