let id = "demo"

let name = "Demo"

let images: array<Generator.imageDef> = [
  {
    id: "Grid",
    url: Generator.require("./images/Grid.png"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Creeper",
    url: Generator.require("./textures/Creeper.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve",
    url: Generator.require("./textures/Steve.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve256",
    url: Generator.require("./textures/Steve256.png"),
    standardWidth: 256,
    standardHeight: 256,
  },
]

let drawGrid = () => {
  for y in 0 to 5 {
    for x in 0 to 3 {
      Generator.drawImage("Grid", (x * 128, y * 128))
    }
  }
}

let drawPage = (texture, src) => {
  drawGrid()

  let dst = (gridx, gridy) => {
    (gridx * 128 + 128 / 4, gridy * 128 + 128 / 4, 128 / 2, 128 / 2)
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

let script = () => {
  Generator.usePage("Page 1")
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

  let dst = (gridx, gridy) => (gridx * 128 + 64 - dw / 2, gridy * 128 + 64 - dh / 2, dw, dh)

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

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  images: images,
  textures: textures,
  script: script,
}
