module PageSize = Generator.PageSize

let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "testing"

let name = "Testing"

let history = []

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

let script = () => {
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
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
