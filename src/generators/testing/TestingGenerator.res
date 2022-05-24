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
    id: "TextureColors",
    url: requireTexture("Colors.png"),
    standardWidth: 4,
    standardHeight: 4,
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

let drawPage4 = () => {
  Generator.usePage("Page 4")

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

let drawPage5 = () => {
  Generator.usePage("Page 5")

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

let drawPage = (texture, src) => {
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

let script = () => {
  Generator.defineText("Test page for some generator features.")

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

  Generator.defineText("Texture pixel color test")

  let textureColor00 = switch Generator.getTexturePixelColor("TextureColors", 0, 0) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let textureColor11 = switch Generator.getTexturePixelColor("TextureColors", 1, 1) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let textureColor22 = switch Generator.getTexturePixelColor("TextureColors", 2, 2) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let textureColor33 = switch Generator.getTexturePixelColor("TextureColors", 3, 3) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  assertEquals(textureColor00, "#000000ff")
  assertEquals(textureColor11, "#777777ff")
  assertEquals(textureColor22, "#ff000080")
  assertEquals(textureColor33, "#ffffff80")

  Generator.defineText("Image pixel color test")

  let imageColor00 = switch Generator.getImagePixelColor("ImageColors4x4", 0, 0) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let imageColor11 = switch Generator.getImagePixelColor("ImageColors4x4", 1, 1) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let imageColor22 = switch Generator.getImagePixelColor("ImageColors4x4", 2, 2) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let imageColor33 = switch Generator.getImagePixelColor("ImageColors4x4", 3, 3) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  assertEquals(imageColor00, "#000000ff")
  assertEquals(imageColor11, "#777777ff")
  assertEquals(imageColor22, "#ff000080")
  assertEquals(imageColor33, "#ffffff80")

  Generator.usePage("Color Test 1")

  Generator.fillBackgroundColor()
  Generator.drawImage("ImageColors64x64", (0, 0))

  Generator.defineText("Page pixel color test #1")

  let pageColor00 = switch Generator.getCurrentPagePixelColor(0 * 16, 0 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let pageColor11 = switch Generator.getCurrentPagePixelColor(1 * 16, 1 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let pageColor22 = switch Generator.getCurrentPagePixelColor(2 * 16, 2 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let pageColor33 = switch Generator.getCurrentPagePixelColor(3 * 16, 3 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  assertEquals(pageColor00, "#000000ff")
  assertEquals(pageColor11, "#777777ff")
  assertEquals(pageColor22, "#800000ff") // ff000080 + 000000ff === 800000ff
  assertEquals(pageColor33, "#808080ff") // ffffff80 + 000000ff === 808080ff

  Generator.usePage("Color Test 2")

  Generator.fillBackgroundColor(~color="#ffff00", ())
  Generator.drawImage("ImageColors64x64", (0, 0))

  Generator.defineText("Page pixel color test #1")

  let pageColor00 = switch Generator.getCurrentPagePixelColor(0 * 16, 0 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let pageColor11 = switch Generator.getCurrentPagePixelColor(1 * 16, 1 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let pageColor22 = switch Generator.getCurrentPagePixelColor(2 * 16, 2 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  let pageColor33 = switch Generator.getCurrentPagePixelColor(3 * 16, 3 * 16) {
  | None => "Unknown"
  | Some(color) => rgbaToHex(color)
  }

  assertEquals(pageColor00, "#000000ff")
  assertEquals(pageColor11, "#777777ff")
  assertEquals(pageColor22, "#ff7f7fff") // ff000080 + ffffffff === ff7f7fff
  assertEquals(pageColor33, "#ffffffff") // ffffff80 + ffffffff === ffffffff

  // Use a page (this is needed for region inputs to work)
  Generator.usePage("Page 1")

  // Define a region that increments the counter
  Generator.defineRegionInput((0, 0, 100, 100), () => {
    let nextCounter = counter >= 6 ? 1 : counter + 1
    let nextCounterString = Belt.Int.toString(nextCounter)
    Generator.setSelectInputValue("Counter", nextCounterString)
  })

  drawPage("Steve", (8, 8, 8, 8))

  Generator.usePage("Page 2")
  drawPage("Steve256", (32, 32, 32, 32))

  Generator.usePage("Page 3")
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

  drawPage4()

  drawPage5()
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
