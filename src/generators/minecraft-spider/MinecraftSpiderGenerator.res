let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-spider"

let name = "Minecraft Spider"

let history = []

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let imageIds = ["Foreground", "Labels", "Folds"]
let toImageDef = (id): Generator.imageDef => {id: id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Spider",
    url: requireTexture("testing"),
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
  drawCuboidCenterTopRotate180(texture, Minecraft.Spider.spider.abdomen, (ox, oy), scale, #West)
}

let drawLeg = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (128, 16, 16)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Spider.spider.leg,
    (ox, oy),
    scale,
    ~center=#Top,
    ~direction=#North,
    (),
  )
}

let drawSpider = (texture: string) => {
  drawHead(texture, (169, 37))

  drawThorax(texture, (225, 325))

  //drawAbdomen(texture, (233, 485))
  drawLeg(texture, (393, 229))
  drawLeg(texture, (393, 325))
  drawLeg(texture, (393, 421))
  drawLeg(texture, (393, 517))

  drawLeg(texture, (41, 229))
  drawLeg(texture, (41, 325))
  drawLeg(texture, (41, 421))
  drawLeg(texture, (41, 517))
}

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Spider",
    {standardWidth: 64, standardHeight: 32, choices: ["Spider", "Cave Spider"]},
  )
  Generator.defineTextureInput("Spider Eyes", {standardWidth: 64, standardHeight: 32, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", false)
  Generator.defineBooleanInput("Show Labels", false)

  // Get user variable values
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  Generator.drawImage("Foreground", (0, 0))

  drawSpider("Spider")
  // draw Spider Eyes
  drawSpider("Spider Eyes")

  // Background
  //Generator.drawImage("Foreground", (0, 0))

  // Fold Lines
  if showFolds {
    Generator.drawImage("Folds", (0, 0))
  }
  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }
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
