module PageSize = Generator.PageSize

let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "testing"

let name = "Testing"

let history = []

let thumbnail: Generator.thumnbnailDef = {
  url: "https://www.pixelpapercraft.com/images/header/logo.png",
}

let images: array<Generator.imageDef> = [
  {
    id: "Grid",
    url: requireImage("Grid.png"),
  },
  {
    id: "ImageColors4x4",
    url: requireImage("Colors4x4.png"),
  },
  {
    id: "ImageColors64x64",
    url: requireImage("Colors64x64.png"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "TextureColors4x4",
    url: requireTexture("Colors4x4.png"),
    standardWidth: 4,
    standardHeight: 4,
  },
  {
    id: "TextureColors64x64",
    url: requireTexture("Colors64x64.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Creeper",
    url: requireTexture("Creeper.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve",
    url: requireTexture("Steve.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve-Corners",
    url: requireTexture("Steve-Corners.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve-Faces",
    url: requireTexture("Steve-Faces.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve256",
    url: requireTexture("Steve256.png"),
    standardWidth: 256,
    standardHeight: 256,
  },
  {
    id: "GrassTop",
    url: requireTexture("GrassTop.png"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "GrassSide",
    url: requireTexture("GrassSide.png"),
    standardWidth: 16,
    standardHeight: 16,
  },
  /* {
    id: "WebTexture",
    url: "data:image/png;base64,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",
    standardWidth: 64,
    standardHeight: 64,
  }, */
]

module Config = {
  let colCount = 4
  let rowCount = 6
  let gridCellSize = 128
  let gridWidth = gridCellSize * colCount
  let gridHeight = gridCellSize * rowCount
  let offsetX = (PageSize.A4.px.width - gridWidth) / 2
  let offsetY = (PageSize.A4.px.height - gridHeight) / 2
}

let assertEquals = (actual, expected) => {
  let text = if actual === expected {
    `${actual} === ${expected}: PASS`
  } else {
    `${actual} === ${expected}: FAIL`
  }
  Generator.defineText(text)
}

let drawGrid = () => {
  for y in 0 to Config.rowCount - 1 {
    for x in 0 to Config.colCount - 1 {
      let xpos = Config.offsetX + x * Config.gridCellSize
      let ypos = Config.offsetY + y * Config.gridCellSize
      Generator.drawImage("Grid", (xpos, ypos))
    }
  }
}

/* let drawWebTexturePage = () => {
  Generator.usePage("Web Texture")
  Generator.fillBackgroundColorWithWhite()

  Generator.drawTexture("WebTexture", (0, 0, 16, 16), (100, 100, 164, 164), ())
} */
let drawTextInput = () => {
  Generator.defineTextInput("Input")

  Generator.defineText(Generator.getStringInputValue("Input"))
}

let drawTextInputPage = () => {
  Generator.usePage("Text Input")
  Generator.fillBackgroundColorWithWhite()

  let textInput = Generator.defineAndGetSelectInput("Text Choices", ["One", "Two", "Three", "Four"])
  Generator.drawText(textInput, (20, 40), 24)
  Generator.drawText(Generator.getStringInputValue("Input"), (20, 70), 24)
}

let drawSteveBodyCuboid = (x, y, scale, direction, center) => {
  Minecraft.drawCuboid(
    "Steve-Faces",
    Minecraft.Character.steve.base.body,
    (x, y),
    (2 * scale, 3 * scale, scale),
    ~center,
    ~direction,
    (),
  )
}

let drawCuboidTestPage3 = () => {
  Generator.usePage("Cuboid 3")
  Generator.fillBackgroundColorWithWhite()
  let scale = 16
  let y = 10
  drawSteveBodyCuboid(10, y, scale, #North, #Front)
  drawSteveBodyCuboid(80, y, scale, #North, #Back)
  drawSteveBodyCuboid(150, y, scale, #North, #Right)
  drawSteveBodyCuboid(240, y, scale, #North, #Left)
  drawSteveBodyCuboid(330, y, scale, #North, #Top)
  drawSteveBodyCuboid(460, y, scale, #North, #Bottom)

  let y = y + 180
  drawSteveBodyCuboid(10, y, scale, #South, #Front)
  drawSteveBodyCuboid(80, y, scale, #South, #Back)
  drawSteveBodyCuboid(150, y, scale, #South, #Right)
  drawSteveBodyCuboid(240, y, scale, #South, #Left)
  drawSteveBodyCuboid(330, y, scale, #South, #Top)
  drawSteveBodyCuboid(460, y, scale, #South, #Bottom)

  let y = y + 180
  drawSteveBodyCuboid(10, y, scale, #West, #Front)
  drawSteveBodyCuboid(110, y, scale, #West, #Back)
  drawSteveBodyCuboid(210, y, scale, #West, #Right)
  drawSteveBodyCuboid(310, y, scale, #West, #Left)
  drawSteveBodyCuboid(380, y - 50, scale, #West, #Top)
  drawSteveBodyCuboid(420, y + 20, scale, #West, #Bottom)

  let y = y + 180
  drawSteveBodyCuboid(10, y, scale, #East, #Front)
  drawSteveBodyCuboid(110, y, scale, #East, #Back)
  drawSteveBodyCuboid(210, y, scale, #East, #Right)
  drawSteveBodyCuboid(310, y, scale, #East, #Left)
  drawSteveBodyCuboid(380, y - 50, scale, #East, #Top)
  drawSteveBodyCuboid(420, y + 20, scale, #East, #Bottom)
}

let drawSteveHeadCuboid2 = (x, y, center) => {
  let x = x - 64
  let y = y - 64

  Minecraft.drawCuboid(
    "Steve-Faces",
    Minecraft.Character.steve.base.head,
    (x, y),
    (64, 64, 64),
    ~center,
    ~direction=#East,
    (),
  )
}

let drawCuboidTestPage2 = () => {
  Generator.usePage("Cuboid 2")
  Generator.fillBackgroundColorWithWhite()

  let n = 1
  Generator.defineText("Answer: " ++ Belt.Int.toString(mod(n + 1, 4)))
  drawSteveHeadCuboid2(99, 79, #Right)
  drawSteveHeadCuboid2(387, 79, #Front)
  drawSteveHeadCuboid2(99, 279, #Left)
  drawSteveHeadCuboid2(387, 279, #Back)
  drawSteveHeadCuboid2(99, 479, #Top)
  drawSteveHeadCuboid2(387, 479, #Bottom)
  drawSteveHeadCuboid2(99, 679, #Front)
  drawSteveHeadCuboid2(387, 679, #Front)
}

let drawSteveHeadCuboid = (x, y, size, direction) => {
  let (w, h) = switch direction {
  | #North | #South => (size * 3, size * 4)
  | #West | #East => (size * 4, size * 3)
  }
  Generator.drawTexture("TextureColors4x4", (2, 0, 1, 1), (x, y, w, h), ())
  Minecraft.drawCuboid(
    "Steve-Corners",
    Minecraft.Character.steve.base.head,
    (x, y),
    (size, size, size),
    ~direction,
    (),
  )
}

let drawCuboidTestPage = () => {
  Generator.usePage("Cuboid")
  Generator.fillBackgroundColorWithWhite()

  drawSteveHeadCuboid(10, 10, 10, #East)
  drawSteveHeadCuboid(100, 10, 10, #West)
  drawSteveHeadCuboid(10, 100, 10, #North)
  drawSteveHeadCuboid(100, 100, 10, #South)

  drawSteveHeadCuboid(200, 10, 33, #East)
  drawSteveHeadCuboid(400, 10, 33, #West)
  drawSteveHeadCuboid(200, 150, 33, #North)
  drawSteveHeadCuboid(400, 150, 33, #South)

  drawSteveHeadCuboid(10, 300, 64, #East)
  drawSteveHeadCuboid(330, 300, 64, #West)
  drawSteveHeadCuboid(10, 550, 64, #North)
  drawSteveHeadCuboid(330, 550, 64, #South)
}

let drawSteveHead = (texture, ox, oy, size) => {
  let head = TextureMap.MinecraftCharacter.steve.base.head
  Generator.drawTexture(texture, head.front, (ox + size, oy + size, size, size), ())
  Generator.drawTexture(texture, head.right, (ox, oy + size, size, size), ())
  Generator.drawTexture(texture, head.left, (ox + size * 2, oy + size, size, size), ())
  Generator.drawTexture(texture, head.top, (ox + size, oy, size, size), ())
  Generator.drawTexture(texture, head.back, (ox + size * 3, oy + size, size, size), ())
  Generator.drawTexture(
    texture,
    head.bottom,
    (ox + size, oy + size * 2, size, size),
    ~flip=#Vertical,
    (),
  )
}

let drawFoldBox = (x, y, size, direction: [#clockwise | #anticlockwise]) => {
  let p1 = (x, y)
  let p2 = (x + size, y)
  let p3 = (x + size, y + size)
  let p4 = (x, y + size)
  if direction === #clockwise {
    Generator.drawFoldLine(p1, p2)
    Generator.drawFoldLine(p2, p3)
    Generator.drawFoldLine(p3, p4)
    Generator.drawFoldLine(p4, p1)
  } else {
    Generator.drawFoldLine(p2, p1)
    Generator.drawFoldLine(p3, p2)
    Generator.drawFoldLine(p4, p3)
    Generator.drawFoldLine(p1, p4)
  }
}

let drawFoldsSun = (ox, oy, size) => {
  let angles = [
    0.0,
    15.0,
    30.0,
    45.0,
    60.0,
    75.0,
    90.0,
    105.0,
    120.0,
    135.0,
    150.0,
    165.0,
    180.0,
    195.0,
    210.0,
    225.0,
    240.0,
    255.0,
    270.0,
    285.0,
    300.0,
    315.0,
    330.0,
    345.0,
  ]
  let innerRadius = 20.0
  let outerRadius = 20.0 +. size
  angles->Belt.Array.forEach(angle => {
    let radians = angle *. Js.Math._PI /. 180.0
    let x1 = Belt.Float.toInt(innerRadius *. Js.Math.cos(radians))
    let y1 = Belt.Float.toInt(innerRadius *. Js.Math.sin(radians))
    let x2 = Belt.Float.toInt(outerRadius *. Js.Math.cos(radians))
    let y2 = Belt.Float.toInt(outerRadius *. Js.Math.sin(radians))
    Generator.drawFoldLine((ox + x1, oy + y1), (ox + x2, oy + y2))
  })
}

let drawFoldLinesTestPage = () => {
  Generator.usePage("Fold Lines")

  // Clockwise
  let ox = 40
  let oy = 70
  let size = 64
  Generator.drawText("Clockwise", (ox, oy - 20), 16)
  drawSteveHead("Steve", ox, oy, size)
  drawFoldBox(ox + size, oy + size, size, #clockwise)

  // Anti-clockwise
  let ox = 300
  let oy = 70
  let size = 64
  Generator.drawText("Anti-Clockwise", (ox, oy - 20), 16)
  drawSteveHead("Steve", ox, oy, size)
  drawFoldBox(ox + size, oy + size, size, #anticlockwise)

  Generator.drawText("Arbitrary Sizes", (40, 320), 16)

  let ox = 40
  let oy = 340

  for index in 0 to 19 {
    let size = 4 + index
    let x = ox + index * 27
    let y = oy
    drawFoldBox(x, y, size, #clockwise)
  }

  let ox = 40
  let oy = 380

  for index in 0 to 12 {
    let size = 24 + index
    let x = ox + index * 40
    let y = oy
    drawFoldBox(x, y, size, #clockwise)
  }

  Generator.drawText("Power of 2 Sizes", (40, 440), 16)

  let ox = 40
  let oy = 460

  for index in 0 to 4 {
    let exp = Belt.Int.toFloat(index) +. 2.0
    let size = Js.Math.pow_float(~base=2.0, ~exp)->Belt.Float.toInt
    let x = ox + index * 50
    let y = oy
    drawFoldBox(x, y, size, #clockwise)
  }

  Generator.drawText("Contrast", (40, 560), 16)
  let ox = 40
  let oy = 580
  let size = 128
  Generator.drawTexture("TextureColors64x64", (0, 0, 64, 64), (ox, oy, 128, 128), ())
  drawFoldBox(ox + 16, oy + 16, size - 32, #clockwise)
  drawFoldBox(ox + 48, oy + 48, size - 96, #clockwise)

  let ox = 280
  let oy = 560
  Generator.drawText("Angles", (ox, oy), 16)
  drawFoldsSun(ox + 140, oy + 100, 100.0)
}

let drawSun = (ox, oy, ~color, ~width) => {
  let angles = [
    0.0,
    15.0,
    30.0,
    45.0,
    60.0,
    75.0,
    90.0,
    105.0,
    120.0,
    135.0,
    150.0,
    165.0,
    180.0,
    195.0,
    210.0,
    225.0,
    240.0,
    255.0,
    270.0,
    285.0,
    300.0,
    315.0,
    330.0,
    345.0,
  ]
  let innerRadius = 20.0
  let outerRadius = 50.0
  angles->Belt.Array.forEach(angle => {
    let radians = angle *. Js.Math._PI /. 180.0
    let x1 = Belt.Float.toInt(innerRadius *. Js.Math.cos(radians))
    let y1 = Belt.Float.toInt(innerRadius *. Js.Math.sin(radians))
    let x2 = Belt.Float.toInt(outerRadius *. Js.Math.cos(radians))
    let y2 = Belt.Float.toInt(outerRadius *. Js.Math.sin(radians))
    Generator.drawLine((ox + x1, oy + y1), (ox + x2, oy + y2), ~color, ~width, ())
  })
}

let drawSquare = (ox, oy, ~color, ~width) => {
  let size = 50
  let ox = ox - size / 2
  let oy = oy - size / 2
  let p1 = (ox, oy)
  let p2 = (ox + size, oy)
  let p3 = (ox + size, oy + size)
  let p4 = (ox, oy + size)
  Generator.drawLine(p1, p2, ~color, ~width, ())
  Generator.drawLine(p2, p3, ~color, ~width, ())
  Generator.drawLine(p3, p4, ~color, ~width, ())
  Generator.drawLine(p4, p1, ~color, ~width, ())
}

let drawLinesTestPage = () => {
  Generator.usePage("Lines")
  drawSun(100, 100, ~color="#000000", ~width=1)
  drawSun(250, 100, ~color="#000000", ~width=2)
  drawSun(400, 100, ~color="#000000", ~width=3)
  drawSun(100, 250, ~color="#ff0000", ~width=1)
  drawSun(250, 250, ~color="#00ff00", ~width=2)
  drawSun(400, 250, ~color="#0000ff", ~width=3)

  drawSquare(100, 400, ~color="#000000", ~width=1)
  drawSquare(250, 400, ~color="#000000", ~width=2)
  drawSquare(400, 400, ~color="#000000", ~width=3)
  drawSquare(100, 550, ~color="#ff0000", ~width=1)
  drawSquare(250, 550, ~color="#00ff00", ~width=2)
  drawSquare(400, 550, ~color="#0000ff", ~width=3)
}

let rgbaToHex: ((int, int, int, int)) => string = %raw(`
  function rgbaToHex(rgba) {
    let r = rgba[0].toString(16);
    let g = rgba[1].toString(16);
    let b = rgba[2].toString(16);
    let a = rgba[3].toString(16);

    if (r.length == 1)
      r = "0" + r;
    if (g.length == 1)
      g = "0" + g;
    if (b.length == 1)
      b = "0" + b;
    if (a.length == 1)
      a = "0" + a;

    return "#" + r + g + b + a;
  }
`)

let drawTextureImagePageColorTestPage = () => {
  Generator.usePage("Texture Image Page Color Test")

  let makeAssertText = (actual, expected) => {
    let label = `Actual: ${actual}; Expected: ${expected};`
    let result = actual === expected ? "SUCCESS" : "FAIL"
    `${label} Result: ${result}`
  }

  let getTexturePixelColor = (id, x, y) => {
    switch Generator.getTexturePixelColor(id, x, y) {
    | None => "Unknown"
    | Some(color) => rgbaToHex(color)
    }
  }

  let getImagePixelColor = (id, x, y) => {
    switch Generator.getImagePixelColor(id, x, y) {
    | None => "Unknown"
    | Some(color) => rgbaToHex(color)
    }
  }

  let getPagePixelColor = (x, y) => {
    switch Generator.getCurrentPagePixelColor(x, y) {
    | None => "Unknown"
    | Some(color) => rgbaToHex(color)
    }
  }
  let pixelSize = 64 / 4

  Generator.drawText("Texture Color Test", (20, 40), 24)
  Generator.drawTexture("TextureColors64x64", (0, 0, 64, 64), (500, 20, 64, 64), ())

  let textureColor00 = getTexturePixelColor("TextureColors64x64", 0 * pixelSize, 0 * pixelSize)
  let textureColor11 = getTexturePixelColor("TextureColors64x64", 1 * pixelSize, 1 * pixelSize)
  let textureColor22 = getTexturePixelColor("TextureColors64x64", 2 * pixelSize, 2 * pixelSize)
  let textureColor33 = getTexturePixelColor("TextureColors64x64", 3 * pixelSize, 3 * pixelSize)

  Generator.drawText(makeAssertText(textureColor00, "#000000ff"), (20, 80), 16)
  Generator.drawText(makeAssertText(textureColor11, "#777777ff"), (20, 120), 16)
  Generator.drawText(makeAssertText(textureColor22, "#ff000080"), (20, 160), 16)
  Generator.drawText(makeAssertText(textureColor33, "#ffffff80"), (20, 200), 16)

  Generator.drawText("Image Color Test", (20, 260), 24)
  Generator.drawImage("ImageColors64x64", (500, 240))

  let imageColor00 = getImagePixelColor("ImageColors64x64", 0 * pixelSize, 0 * pixelSize)
  let imageColor11 = getImagePixelColor("ImageColors64x64", 1 * pixelSize, 1 * pixelSize)
  let imageColor22 = getImagePixelColor("ImageColors64x64", 2 * pixelSize, 2 * pixelSize)
  let imageColor33 = getImagePixelColor("ImageColors64x64", 3 * pixelSize, 3 * pixelSize)

  Generator.drawText(makeAssertText(imageColor00, "#000000ff"), (20, 300), 16)
  Generator.drawText(makeAssertText(imageColor11, "#777777ff"), (20, 340), 16)
  Generator.drawText(makeAssertText(imageColor22, "#ff000080"), (20, 380), 16)
  Generator.drawText(makeAssertText(imageColor33, "#ffffff80"), (20, 420), 16)

  Generator.drawText("Page Color Test", (20, 480), 24)
  let imageX = 500
  let imageY = 460
  Generator.drawImage("ImageColors64x64", (imageX, imageY))
  Generator.fillBackgroundColor("#ffffff")

  let pageColor00 = getPagePixelColor(imageX + 0 * pixelSize, imageY + 0 * pixelSize)
  let pageColor11 = getPagePixelColor(imageX + 1 * pixelSize, imageY + 1 * pixelSize)
  let pageColor22 = getPagePixelColor(imageX + 2 * pixelSize, imageY + 2 * pixelSize)
  let pageColor33 = getPagePixelColor(imageX + 3 * pixelSize, imageY + 3 * pixelSize)

  Generator.drawText(makeAssertText(pageColor00, "#000000ff"), (20, 520), 16)
  Generator.drawText(makeAssertText(pageColor11, "#777777ff"), (20, 560), 16)
  Generator.drawText(makeAssertText(pageColor22, "#ff7f7fff"), (20, 600), 16) // ff000080 + ffffffff === ff7f7fff
  Generator.drawText(makeAssertText(pageColor33, "#ffffffff"), (20, 640), 16) // ffffff80 + ffffffff === ffffffff
}

let drawButtonInputTest = () => {
  // Define a counter variable, with a default value of 1
  let counter =
    Generator.getSelectInputValue("Counter")->Belt.Int.fromString->Belt.Option.getWithDefault(1)

  // Show the counter
  Generator.defineText("Counter is " ++ Belt.Int.toString(counter))

  // Define a button that increments the counter
  Generator.defineButtonInput("Increment Counter", () => {
    let nextCounter = counter >= 6 ? 1 : counter + 1
    let nextCounterString = Belt.Int.toString(nextCounter)
    Generator.setSelectInputValue("Counter", nextCounterString)
  })
}

let drawTextureRotationTest = (texture, src) => {
  drawGrid()

  let dst = (gridx, gridy) => {
    (
      Config.offsetX + gridx * Config.gridCellSize + Config.gridCellSize / 4,
      Config.offsetY + gridy * Config.gridCellSize + Config.gridCellSize / 4,
      Config.gridCellSize / 2,
      Config.gridCellSize / 2,
    )
  }

  Generator.drawTexture(texture, src, dst(0, 0), ~rotate=0.0, ())
  Generator.drawTexture(texture, src, dst(1, 0), ~rotate=90.0, ())
  Generator.drawTexture(texture, src, dst(2, 0), ~rotate=180.0, ())
  Generator.drawTexture(texture, src, dst(3, 0), ~rotate=270.0, ())

  Generator.drawTexture(texture, src, dst(0, 1), ~rotate=0.0, ~flip=#Horizontal, ())
  Generator.drawTexture(texture, src, dst(1, 1), ~rotate=90.0, ~flip=#Horizontal, ())
  Generator.drawTexture(texture, src, dst(2, 1), ~rotate=180.0, ~flip=#Horizontal, ())
  Generator.drawTexture(texture, src, dst(3, 1), ~rotate=270.0, ~flip=#Horizontal, ())

  Generator.drawTexture(texture, src, dst(0, 2), ~rotate=0.0, ~flip=#Vertical, ())
  Generator.drawTexture(texture, src, dst(1, 2), ~rotate=90.0, ~flip=#Vertical, ())
  Generator.drawTexture(texture, src, dst(2, 2), ~rotate=180.0, ~flip=#Vertical, ())
  Generator.drawTexture(texture, src, dst(3, 2), ~rotate=270.0, ~flip=#Vertical, ())

  Generator.drawTexture(texture, src, dst(0, 3), ~rotate=45.0, ())
  Generator.drawTexture(texture, src, dst(1, 3), ~rotate=90.0, ())
  Generator.drawTexture(texture, src, dst(2, 3), ~rotate=135.0, ())
  Generator.drawTexture(texture, src, dst(3, 3), ~rotate=180.0, ())

  Generator.drawTexture(texture, src, dst(0, 4), ~rotate=45.0, ~flip=#Horizontal, ())
  Generator.drawTexture(texture, src, dst(1, 4), ~rotate=90.0, ~flip=#Horizontal, ())
  Generator.drawTexture(texture, src, dst(2, 4), ~rotate=135.0, ~flip=#Horizontal, ())
  Generator.drawTexture(texture, src, dst(3, 4), ~rotate=180.0, ~flip=#Horizontal, ())

  Generator.drawTexture(texture, src, dst(0, 5), ~rotate=45.0, ~flip=#Vertical, ())
  Generator.drawTexture(texture, src, dst(1, 5), ~rotate=90.0, ~flip=#Vertical, ())
  Generator.drawTexture(texture, src, dst(2, 5), ~rotate=135.0, ~flip=#Vertical, ())
  Generator.drawTexture(texture, src, dst(3, 5), ~rotate=180.0, ~flip=#Vertical, ())
}

let drawTextureRotation64Test = () => {
  Generator.usePage("Texture Rotation 64")
  drawTextureRotationTest("Steve", (8, 8, 8, 8))
}

let drawTextureRotation256Test = () => {
  Generator.usePage("Texture Rotation 256")
  drawTextureRotationTest("Steve256", (32, 32, 32, 32))
}

let drawTextureCropRotationTest = () => {
  Generator.usePage("Texture Crop Rotation")

  drawGrid()

  let sw = 8
  let sh = 3
  let scale = 8
  let dw = sw * scale
  let dh = sh * scale

  let src = (8, 11, sw, sh)

  let dst = (gridx, gridy) => (
    Config.offsetX + gridx * Config.gridCellSize + Config.gridCellSize / 2 - dw / 2,
    Config.offsetY + gridy * Config.gridCellSize + Config.gridCellSize / 2 - dh / 2,
    dw,
    dh,
  )

  let rows = 6
  let cols = 4
  let deg = 360.0 /. Js.Int.toFloat(rows * cols)

  for row in 0 to rows - 1 {
    for col in 0 to cols - 1 {
      let factor = Js.Int.toFloat(row * cols + col)
      let rotate = deg *. factor
      Generator.drawTexture("Steve", src, dst(col, row), ~rotate, ())
    }
  }
}

let drawTextureTintTest = () => {
  Generator.usePage("Texture Tint")

  drawGrid()

  let padding = 32
  let size = Config.gridCellSize - padding
  let indent = padding / 2

  let tints = [
    "#90814D",
    "#BFB755",
    "#59C93C",
    "#64C73F",
    "#79C05A",
    "#88BB67",
    "#507A32",
    "#6A7039",
    "#4C763C",
    "#91BD59",
    "#8EB971",
    "#55C93F",
    "#8AB689",
    "#83B593",
    "#86B87F",
    "#86B783",
    "#80B497",
  ]

  let getTint = index => Belt.Array.get(tints, index)

  for row in 1 to Config.rowCount {
    for col in 1 to Config.colCount {
      let x = Config.offsetX + Config.gridCellSize * (col - 1) + indent
      let y = Config.offsetY + Config.gridCellSize * (row - 1) + indent
      let index = col - 1 + (row - 1) * Config.colCount
      switch getTint(index) {
      | None => {
          Generator.drawTexture("Steve", (8, 8, 8, 8), (x, y, size, size), ())
          Generator.drawTexture(
            "GrassSide",
            (0, 0, 16, 16),
            (x, y, size, size),
            ~blend=#MultiplyHex("#59C93C"),
            (),
          )
        }
      | Some(tint) =>
        Generator.drawTexture(
          "GrassTop",
          (0, 0, 16, 16),
          (x, y, size, size),
          ~blend=#MultiplyHex(tint),
          (),
        )
      }
    }
  }
}

let drawTextureCropTest = () => {
  Generator.usePage("Texture Crop")

  let padding = 32
  let size = Config.gridCellSize - padding
  let indent = padding / 2

  let tests = [
    (8, 8, 8, 8, size, size, false),
    (8, 8, 8, 8, size, size, true),
    (8, 8, 8, 8, size / 2, size, false),
    (8, 8, 8, 8, size / 2, size, true),
    (8, 8, 8, 8, size / 4, size, false),
    (8, 8, 8, 8, size / 4, size, true),
    (8, 8, 8, 8, size / 8, size, false),
    (8, 8, 8, 8, size / 8, size, true),
    (8, 8, 8, 8, size, size / 2, false),
    (8, 8, 8, 8, size, size / 2, true),
    (8, 8, 8, 8, size, size / 4, false),
    (8, 8, 8, 8, size, size / 4, true),
    (8, 8, 8, 8, size, size / 8, false),
    (8, 8, 8, 8, size, size / 8, true),
    (8, 8, 8, 8, size / 2, size / 2, false),
    (8, 8, 8, 8, size / 2, size / 2, true),
    (8, 8, 8, 8, size / 4, size / 4, false),
    (8, 8, 8, 8, size / 4, size / 4, true),
    (8, 8, 8, 8, size / 8, size / 8, false),
    (8, 8, 8, 8, size / 8, size / 8, true),
    (8, 8, 8, 8, 8, 8, true),
    (8, 8, 8, 8, 4, 4, true),
    (8, 8, 8, 8, 2, 2, true),
    (8, 8, 8, 8, 1, 1, true),
  ]

  drawGrid()

  for row in 1 to Config.rowCount {
    for col in 1 to Config.colCount {
      let x = Config.offsetX + Config.gridCellSize * (col - 1) + indent
      let y = Config.offsetY + Config.gridCellSize * (row - 1) + indent
      let index = col - 1 + (row - 1) * Config.colCount
      if index < Js.Array2.length(tests) {
        let (sx, sy, sw, sh, dw, dh, pixelate) = tests[index]
        Generator.drawTexture("Steve", (sx, sy, sw, sh), (x, y, dw, dh), ~pixelate, ())
      }
    }
  }
}

let drawRectTab = (rectangle, orientation, ~tabAngle) => {
  Generator.fillRect(rectangle, "#ff000020")
  Generator.drawTab(rectangle, orientation, ~tabAngle, ())
}

let drawTabsTestPage = () => {
  Generator.usePage("Tabs")
  Generator.fillBackgroundColorWithWhite()

  let tabAngle = 45.0

  drawRectTab((10, 10, 100, 30), #North, ~tabAngle)
  drawRectTab((150, 10, 100, 30), #South, ~tabAngle)
  drawRectTab((300, 10, 100, 30), #East, ~tabAngle)
  drawRectTab((450, 10, 100, 30), #West, ~tabAngle)

  drawRectTab((10, 80, 100, 100), #North, ~tabAngle)
  drawRectTab((150, 80, 100, 100), #South, ~tabAngle)
  drawRectTab((300, 80, 100, 100), #East, ~tabAngle)
  drawRectTab((450, 80, 100, 100), #West, ~tabAngle)

  drawRectTab((10, 220, 30, 100), #North, ~tabAngle)
  drawRectTab((150, 220, 30, 100), #South, ~tabAngle)
  drawRectTab((300, 220, 30, 100), #East, ~tabAngle)
  drawRectTab((450, 220, 30, 100), #West, ~tabAngle)

  let tabAngle = 80.0

  drawRectTab((10, 400, 100, 50), #North, ~tabAngle)
  drawRectTab((150, 400, 100, 50), #South, ~tabAngle)
  drawRectTab((300, 400, 100, 50), #East, ~tabAngle)
  drawRectTab((450, 400, 100, 50), #West, ~tabAngle)

  drawRectTab((10, 500, 100, 100), #North, ~tabAngle)
  drawRectTab((150, 500, 100, 100), #South, ~tabAngle)
  drawRectTab((300, 500, 100, 100), #East, ~tabAngle)
  drawRectTab((450, 500, 100, 100), #West, ~tabAngle)

  drawRectTab((10, 650, 50, 100), #North, ~tabAngle)
  drawRectTab((150, 650, 50, 100), #South, ~tabAngle)
  drawRectTab((300, 650, 50, 100), #East, ~tabAngle)
  drawRectTab((450, 650, 50, 100), #West, ~tabAngle)
}

let drawSteveHeadWithTabs = (texture, ox, oy, size) => {
  let head = Minecraft.Character.steve.base.head

  let frontFace = (ox + size, oy + size, size, size)
  Generator.drawTexture(texture, head.front, frontFace, ())

  let rightFace = (ox, oy + size, size, size)
  Generator.drawTexture(texture, head.right, rightFace, ())
  Minecraft.drawFaceTabs(rightFace, [#West, #North, #South], ())

  let leftFace = (ox + size * 2, oy + size, size, size)
  Generator.drawTexture(texture, head.left, leftFace, ())
  Minecraft.drawFaceTabs(leftFace, [#North, #South], ())

  let topFace = (ox + size, oy, size, size)
  Generator.drawTexture(texture, head.top, topFace, ())
  Minecraft.drawFaceTabs(topFace, [#North, #West, #East], ())

  let backFace = (ox + size * 3, oy + size, size, size)
  Generator.drawTexture(texture, head.back, backFace, ())
  Minecraft.drawFaceTabs(backFace, [#North, #South, #East], ())

  let bottomFace = (ox + size, oy + size * 2, size, size)
  Generator.drawTexture(texture, head.bottom, bottomFace, ~flip=#Vertical, ())
  Minecraft.drawFaceTabs(bottomFace, [#West, #East, #South], ())
}

let drawSteveFaceWithTabs = (x, y, w, h, ~size=?, ~tabAngle, ()) => {
  let size = switch size {
  | Some(size) => size
  | None => Minecraft.getTabSize()
  }
  let head = Minecraft.Character.steve.base.head
  let face = (x, y, w, h)
  Generator.drawTexture("Steve", head.front, face, ())
  Minecraft.drawFaceTabs(face, [#North, #East, #South, #West], ~size, ~tabAngle, ())
}

let drawFaceTabsTestPage = () => {
  Generator.usePage("Face Tabs")
  Generator.fillBackgroundColorWithWhite()

  Minecraft.setTabSize(24)
  drawSteveFaceWithTabs(50, 50, 64, 64, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(200, 50, 64, 32, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(350, 50, 32, 64, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(500, 50, 32, 32, ~tabAngle=45.0, ())

  Minecraft.setTabSize(48)
  drawSteveFaceWithTabs(50, 200, 64, 64, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(200, 200, 64, 32, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(350, 200, 32, 64, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(500, 200, 32, 32, ~tabAngle=45.0, ())

  Minecraft.setTabSize(12)
  drawSteveFaceWithTabs(50, 350, 64, 64, ~tabAngle=60.0, ())
  drawSteveFaceWithTabs(200, 350, 64, 32, ~tabAngle=60.0, ())
  drawSteveFaceWithTabs(350, 350, 32, 64, ~tabAngle=60.0, ())
  drawSteveFaceWithTabs(500, 350, 32, 32, ~tabAngle=60.0, ())

  Minecraft.setTabSize(12)
  drawSteveFaceWithTabs(50, 500, 64, 64, ~tabAngle=30.0, ())
  drawSteveFaceWithTabs(200, 500, 64, 32, ~tabAngle=30.0, ())
  drawSteveFaceWithTabs(350, 500, 32, 64, ~tabAngle=30.0, ())
  drawSteveFaceWithTabs(500, 500, 32, 32, ~tabAngle=30.0, ())

  drawSteveFaceWithTabs(400, 650, 16, 16, ~size=8, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(450, 650, 16, 8, ~size=8, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(400, 700, 8, 16, ~size=8, ~tabAngle=45.0, ())
  drawSteveFaceWithTabs(450, 700, 8, 8, ~size=4, ~tabAngle=45.0, ())

  let ox = 50
  let oy = 600
  let size = 64
  Minecraft.setTabSize(24)
  drawSteveHeadWithTabs("Steve", ox, oy, size)
}

let script = () => {
  //drawWebTexturePage()
  drawTextInput()
  drawTextInputPage()
  drawCuboidTestPage3()
  drawCuboidTestPage2()
  drawFaceTabsTestPage()
  drawTabsTestPage()
  drawCuboidTestPage()
  drawFoldLinesTestPage()
  drawLinesTestPage()
  drawTextureImagePageColorTestPage()
  drawButtonInputTest()
  drawTextureRotation64Test()
  drawTextureRotation256Test()
  drawTextureCropRotationTest()
  drawTextureTintTest()
  drawTextureCropTest()
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
