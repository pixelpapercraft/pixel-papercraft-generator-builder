module PageSize = Generator.PageSize
module Folds = FoldsGenerator_Folds

let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "testing-folds"

let name = "Folds"

let history = []

let images: array<Generator.imageDef> = [
  {
    id: "Dither",
    url: requireImage("Dither.png"),
  },
  {
    id: "Fold",
    url: requireImage("Fold.png"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Colors",
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
  {
    id: "Apple",
    url: requireTexture("apple.png"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "Slime Ball",
    url: requireTexture("slime_ball.png"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "Bottle",
    url: requireTexture("potion.png"),
    standardWidth: 16,
    standardHeight: 16,
  },
  {
    id: "Diamond Sword",
    url: requireTexture("diamond_sword.png"),
    standardWidth: 16,
    standardHeight: 16,
  },
]

//Generator.drawImage("Dither", (x + w * 8, y + h * 8))
let script = () => {
  Generator.defineText("Test page for some generator features.")
  //Generator.drawTexture("Slime Ball", (4, 0, 16, 12), (100, 100, 128, 128), ())
  //Generator.drawTexture("Apple", (0, 0, 16, 16), (250, 200, 64, 64), ())
  //Generator.drawTexture("Bottle", (0, 0, 16, 16), (200, 400, 112, 112), ~rotate=45.0, ())
  //Generator.drawTexture("Diamond Sword", (0, 0, 16, 16), (300, 550, 128, 64), ~flip=#Horizontal, ())
  /* Generator.drawLine(
    (0, 100),
    (50, 250),
    ~color="#ff0000",
    ~width=2.0,
    ~pattern=[12, 4, 4, 4],
    ~offset=14,
    (),
  )
  Generator.drawFoldPath([(0, 0), (0, 100), (100, 100), (150, 50)], ()) */
  // Draw a Head

  let drawHead = (head: TextureMap.cuboid, ox, oy) => {
    Generator.drawTexture("Steve", head.right, (ox, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.front, (ox + 64, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.left, (ox + 128, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.back, (ox + 192, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.top, (ox + 64, oy, 64, 64), ())
    Generator.drawTexture("Steve", head.bottom, (ox + 64, oy + 128, 64, 64), ~flip=#Vertical, ())
  }
  let drawHead2 = (skin: string, (x, y): (int, int)) => {
    Generator.drawCuboid(skin, (0, 0), (8, 8, 8), (x, y), (64, 64, 64), ~leftSide=true, ())
  }

  let ox = 128
  let oy = 400
  drawHead(TextureMap.MinecraftCharacter.steve.base.head, ox, oy)
  Generator.drawLineCuboid((ox, oy), (64, 64, 64), ~color="#007744", ())
  /* Generator.drawFold((ox + 64, oy - 1), (ox + 128, oy - 1))
  Generator.drawFold((ox - 1, oy + 64), (ox - 1, oy + 128))
  Generator.drawFold((ox, oy + 64 - 1), (ox + 256, oy + 64 - 1))
  Generator.drawFold((ox, oy + 128), (ox + 256, oy + 128))
  Generator.drawFold((ox + 64, oy + 192), (ox + 128, oy + 192))
  Generator.drawFold((ox + 64 - 1, oy), (ox + 64 - 1, oy + 192))
  Generator.drawFold((ox + 128, oy), (ox + 128, oy + 192))
  Generator.drawFold((ox + 192 - 1, oy + 64), (ox + 192 - 1, oy + 128))
  Generator.drawFold((ox + 256, oy + 64), (ox + 256, oy + 128)) */

  let ox = 256
  let oy = 200

  Generator.drawLinePath(
    [(ox, oy), (ox + 64, oy + 64), (ox, oy + 128), (ox - 64, oy + 64)],
    ~color="#a71810",
    ~close=true,
    (),
  )

  let ox = 100
  let oy = 150

  drawHead2("Steve", (ox, oy))
  //Generator.drawImage("Fold", (ox + 64, oy))
  //Generator.drawFoldRect((ox + 64, oy, 64, 192))
  //Generator.drawLineRect((ox, oy + 64, 256, 64), ~color="#345678", ())
  Generator.drawFoldCuboid((ox, oy), (64, 64, 64), ~leftSide=true, ())

  Generator.fillBackgroundColorWithWhite()
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
  history: history,
}
