let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-spider"

let name = "Minecraft Spider"

let history = ["30 Jun 2022 NinjolasNJM - first release."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Foreground", "Labels", "Folds"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Spider",
    url: requireTexture("spider"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Cave Spider",
    url: requireTexture("cave_spider"),
    standardWidth: 64,
    standardHeight: 32,
  },
  {
    id: "Spider Eyes",
    url: requireTexture("spider_eyes"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let drawCuboidCenterTopRotate180 = (
  texture: string,
  source: Minecraft.Cuboid.t,
  (ox, oy): Generator_Builder.position,
  scale: Minecraft.Cuboid.scale,
  direction: Minecraft.Cuboid.direction,
) => {
  let dest = Minecraft.Cuboid.getLayout(scale, direction, #Top)

  Minecraft.Cuboid.Face.draw(
    texture,
    source.right,
    dest.left->Minecraft.Cuboid.Face.translate((ox, oy)),
  )
  Minecraft.Cuboid.Face.draw(
    texture,
    source.front,
    dest.back->Minecraft.Cuboid.Face.rotate(180.0)->Minecraft.Cuboid.Face.translate((ox, oy)),
  )
  Minecraft.Cuboid.Face.draw(
    texture,
    source.left,
    dest.right->Minecraft.Cuboid.Face.translate((ox, oy)),
  )
  Minecraft.Cuboid.Face.draw(
    texture,
    source.back,
    dest.front->Minecraft.Cuboid.Face.translate((ox, oy)),
  )
  Minecraft.Cuboid.Face.draw(
    texture,
    source.top,
    dest.top->Minecraft.Cuboid.Face.rotate(180.0)->Minecraft.Cuboid.Face.translate((ox, oy)),
  )
  Minecraft.Cuboid.Face.draw(
    texture,
    source.bottom,
    dest.bottom->Minecraft.Cuboid.Face.rotate(180.0)->Minecraft.Cuboid.Face.translate((ox, oy)),
  )
}

let drawHead = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (64, 64, 64)
  Minecraft.drawCuboid(texture, Minecraft.Spider.spider.head, (ox, oy), scale, ())
}

let drawThorax = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (48, 48, 48)
  drawCuboidCenterTopRotate180(texture, Minecraft.Spider.spider.thorax, (ox, oy), scale, #North)
}

let drawAbdomen = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (80, 64, 96)
  drawCuboidCenterTopRotate180(texture, Minecraft.Spider.spider.abdomen, (ox, oy), scale, #East)
}

let drawLeg = (
  texture: string,
  (ox, oy): Generator_Builder.position,
  direction: Minecraft.Cuboid.direction,
  leftSide: bool,
) => {
  let scale = (128, 16, 16)
  if leftSide {
    let source = Minecraft.Spider.spider.leg
    let dest =
      Minecraft.Cuboid.getLayout(scale, direction, #Top)->Minecraft.Cuboid.translate((ox, oy))

    Minecraft.Cuboid.Face.draw(
      texture,
      source.right,
      dest.right->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.front,
      dest.back->Minecraft.Cuboid.Face.flip(#Vertical),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.left,
      dest.left->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.back,
      dest.front->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(texture, source.top, dest.top->Minecraft.Cuboid.Face.flip(#Vertical))
    Minecraft.Cuboid.Face.draw(
      texture,
      source.bottom,
      dest.bottom->Minecraft.Cuboid.Face.flip(#Vertical),
    )
  } else {
    drawCuboidCenterTopRotate180(texture, Minecraft.Spider.spider.leg, (ox, oy), scale, direction)
  }
}

let drawSpider = (texture: string) => {
  drawHead(texture, (169, 21))

  drawThorax(texture, (225, 309))

  drawAbdomen(texture, (177, 549))
  drawLeg(texture, (393, 205), #South, false)
  drawLeg(texture, (393, 301), #South, false)
  drawLeg(texture, (393, 405), #North, false)
  drawLeg(texture, (393, 501), #North, false)

  drawLeg(texture, (41, 205), #South, true)
  drawLeg(texture, (41, 301), #South, true)
  drawLeg(texture, (41, 405), #North, true)
  drawLeg(texture, (41, 501), #North, true)
}

let drawFoldLineRect = ((x, y, w, h): Generator_Builder.rectangle) => {
  Generator.drawFoldLine((x, y - 1), (x + w, y - 1))
  Generator.drawFoldLine((x + w, y), (x + w, y + h))
  Generator.drawFoldLine((x + w, y + h + 1), (x, y + h + 1))
  Generator.drawFoldLine((x, y + h), (x, y))
}

let drawFoldLineCuboid = (
  (x, y): Generator_Builder.position,
  (w, h, d): Minecraft.Cuboid.scale,
  (),
) => {
  drawFoldLineRect((x + d, y, w, d * 2 + h))
  drawFoldLineRect((x, y + d, w * 2 + d * 2, h))
  Generator.drawFoldLine((x + d * 2 + w - 1, y + d), (x + d * 2 + w - 1, y + d + h))
}

let drawFoldLineCuboid1 = (
  (x, y): Generator_Builder.position,
  (w, h, d): Minecraft.Cuboid.scale,
  (),
) => {
  drawFoldLineRect((x + d, y, w, d * 2 + h * 2))
  drawFoldLineRect((x, y + d, w + d * 2, h))
  Generator.drawFoldLine((x + d, y + h + d * 2 - 1), (x + w + d, y + h + d * 2 - 1))
}

let drawFolds = () => {
  drawFoldLineCuboid((169, 21), (64, 64, 64), ())

  drawFoldLineCuboid1((225, 309), (48, 48, 48), ())

  drawFoldLineCuboid((177, 549), (80, 96, 64), ())

  Generator.drawImage("Folds", (0, 0))
}

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Spider",
    {standardWidth: 64, standardHeight: 32, choices: ["Spider", "Cave Spider"]},
  )
  Generator.defineTextureInput("Spider Eyes", {standardWidth: 64, standardHeight: 32, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)

  // Get user variable values
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  drawSpider("Spider")
  // draw Spider Eyes
  drawSpider("Spider Eyes")

  // Background
  Generator.drawImage("Foreground", (0, 0))

  // Fold Lines
  if showFolds {
    drawFolds()
  }
  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }

  // Fill Background
  Generator.fillBackgroundColorWithWhite()
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
