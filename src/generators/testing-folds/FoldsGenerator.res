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
  Generator.drawTexture("Slime Ball", (4, 0, 16, 12), (100, 100, 128, 128), ())
  Generator.drawTexture("Apple", (0, 0, 16, 16), (250, 200, 64, 64), ())
  //Generator.drawTexture("Bottle", (0, 0, 16, 16), (200, 400, 112, 112), ~rotate=45.0, ())
  Generator.drawTexture("Diamond Sword", (0, 0, 16, 16), (300, 550, 128, 64), ~flip=#Horizontal, ())
  Generator.drawLine("#ff0000", (100, 100, 128, 128), ~lineWidth=1.0, ())
  //Folds.drawFolds((100, 100, 128, 128))
  //Folds.drawFolds((250, 200, 64, 64))
  //Folds.drawFolds((200, 400, 112, 112))
  //Folds.drawFolds((300, 550, 128, 64))
  // Draw a Head

  let drawHead = (head: TextureMap.cuboid, ox, oy) => {
    Generator.drawTexture("Steve", head.right, (ox, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.front, (ox + 64, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.left, (ox + 128, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.back, (ox + 192, oy + 64, 64, 64), ())
    Generator.drawTexture("Steve", head.top, (ox + 64, oy, 64, 64), ())
    Generator.drawTexture("Steve", head.bottom, (ox + 64, oy + 128, 64, 64), ~flip=#Vertical, ())
  }

  let ox = 128
  let oy = 400
  drawHead(TextureMap.MinecraftCharacter.steve.base.head, ox, oy)

  Generator.drawFold((ox + 64, oy - 1, 64, 0))
  Generator.drawFold((ox - 1, oy + 64, 0, 64))
  Generator.drawFold((ox, oy + 64 - 1, 256, 0))
  Generator.drawFold((ox, oy + 128, 256, 0))
  Generator.drawFold((ox + 64, oy + 192, 64, 0))
  Generator.drawFold((ox + 64 - 1, oy, 0, 192))
  Generator.drawFold((ox + 128, oy, 0, 192))
  Generator.drawFold((ox + 192 - 1, oy + 64, 0, 64))
  Generator.drawFold((ox + 256, oy + 64, 0, 64))

  Generator.fillBackgroundColor("#ffffff")
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
