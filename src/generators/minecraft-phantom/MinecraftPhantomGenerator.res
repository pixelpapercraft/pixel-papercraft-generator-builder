let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-phantom"

let name = "Minecraft Phantom"

let history = [
  "30 Jun 2022 NinjolasNJM - first release.",
  "28 Jan 2024 NinjolasNJM - Updated to work with current functions.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let video: Generator.videoDef = {url: "https://www.youtube.com/embed/pgz6PnHkmpY"}

let instructions = `
## How to use the Minecraft Phantom Generator?

### Option 1: Standard Model

* Using the dashed tabs and ignoring the colored tabs, make the design normally.

### Option 2: Simple Action Figure

* Ignore the dashed tabs.
* Glue each part to each other by the colored tab to where the arrows point. Complete the outer parts first, followed by the next inner parts, with the body last.
* Glue the head to the body by the white label.

`

let imageIds = ["Foreground", "Folds", "Foreground-Action-Figure", "Folds-Action-Figure", "Labels"]
let toImageDef = (id): Generator.imageDef => {id, url: requireImage(id)}
let images: array<Generator.imageDef> = imageIds->Js.Array2.map(toImageDef)

let textures: array<Generator.textureDef> = [
  {
    id: "Phantom",
    url: requireTexture("phantom"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Phantom Eyes",
    url: requireTexture("phantom_eyes"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let drawHead = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (56, 24, 40)
  Minecraft.drawCuboid(texture, Minecraft.Phantom.phantom.head, (ox, oy), scale, ())
}

let drawBody = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (40, 24, 72)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.body,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~orientation=#South,
    (),
  )
}

let drawWing1 = (texture: string, (ox, oy): Generator_Builder.position, leftSide: bool) => {
  let scale = (48, 16, 72)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.wing1,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~flip=leftSide ? #Horizontal : #None,
    ~orientation=#South,
    (),
  )
}

let drawWing2 = (texture: string, (ox, oy): Generator_Builder.position, leftSide: bool) => {
  let scale = (104, 8, 72)

  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.wing2,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~flip=leftSide ? #Horizontal : #None,
    ~orientation=#South,
    (),
  )
}

let drawTail1 = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (24, 16, 48)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.tail1,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~orientation=#East,
    (),
  )
}

let drawTail2 = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (8, 8, 48)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.tail2,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~orientation=#East,
    (),
  )
}

/* let drawBodyActionFigure = (texture: string, (ox, oy): Generator_Builder.position) => {
  let scale = (40, 24, 72)
  Minecraft.drawCuboid(
    texture,
    Minecraft.Phantom.phantom.body,
    (ox, oy),
    scale,
    ~center=#Bottom,
    ~orientation=#South,
    (),
  )
}

let drawWing1ActionFigure = (
  texture: string,
  (ox, oy): Generator_Builder.position,
  leftSide: bool,
) => {
  let scale = (48, 16, 72)
  // Horrifically hacky way to get the wing flipped without using a flip parameter, which does not exist yet
  /* if leftSide {
    let source = Minecraft.Phantom.phantom.wing1
    let dest =
      Minecraft.Cuboid.Dest.setLayout(scale, #North, #Top)->Minecraft.Cuboid.Dest.translate((
        ox,
        oy,
      ))
    Minecraft.Cuboid.Face.draw(
      texture,
      source.front,
      dest.front->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.back,
      dest.back->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.top,
      dest.top->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.bottom,
      dest.bottom->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.left,
      dest.right->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.right,
      dest.left->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    // New Things
    Minecraft.Cuboid.Face.draw(
      texture,
      source.bottom,
      dest.bottom
      ->Minecraft.Cuboid.Face.translate((64, -88))
      ->Minecraft.Cuboid.Face.rotate(180.0)
      ->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.front,
      dest.front->Minecraft.Cuboid.Face.translate((-48, 0)),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      source.back,
      dest.back->Minecraft.Cuboid.Face.translate((-48, 0)),
    )
  } else {
    Minecraft.drawCuboid(
      texture,
      Minecraft.Phantom.phantom.wing1,
      (ox, oy),
      scale,
      ~center=#Top,
      ~orientation=#North,
      (),
    )
    // New things
    Minecraft.Cuboid.Face.draw(
      texture,
      Minecraft.Phantom.phantom.wing1.bottom,
      Minecraft.Cuboid.Face.make((ox - 48, oy + 16, 48, 72))->Minecraft.Cuboid.Face.flip(
        #Horizontal,
      ),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      Minecraft.Phantom.phantom.wing1.front,
      Minecraft.Cuboid.Face.make((ox + 64, oy + 88, 48, 16))->Minecraft.Cuboid.Face.flip(
        #Horizontal,
      ),
    )
    Minecraft.Cuboid.Face.draw(
      texture,
      Minecraft.Phantom.phantom.wing1.back,
      Minecraft.Cuboid.Face.make((ox + 64, oy, 48, 16))->Minecraft.Cuboid.Face.flip(#Horizontal),
    )
  }*/
} */

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

let drawFoldLineCuboidNorth = (
  (ox, oy): Generator_Builder.position,
  (width, height, depth): Minecraft.scale,
) => {
  drawFoldLineRect((ox + height, oy, width, height * 2 + depth * 2))
  drawFoldLineRect((ox, oy + depth + height, height * 2 + width, depth))
  Generator.drawFoldLine((ox + height, oy + depth), (ox + height + width, oy + depth))
}

let drawFoldLineCuboidWing = (
  (ox, oy): Generator_Builder.position,
  (width, height, depth): Minecraft.scale,
) => {
  Generator.drawFoldLine((ox + height, oy + depth - 1), (ox + width + height, oy + depth - 1))
  Generator.drawFoldLine(
    (ox, oy + depth + height - 1),
    (ox + height * 2 + width, oy + depth + height - 1),
  )
  Generator.drawFoldLine((ox + height - 1, oy + height), (ox + height - 1, oy + height + depth * 2))
  Generator.drawFoldLine(
    (ox + height + width, oy + height),
    (ox + height + width, oy + height + depth * 2),
  )
  Generator.drawFoldLine((ox - 1, oy + height + depth), (ox - 1, oy + height + depth * 2))
  Generator.drawFoldLine(
    (ox + width + height * 2, oy + height + depth),
    (ox + width + height * 2, oy + height + depth * 2),
  )
  Generator.drawFoldLine((ox, oy + height + depth * 2), (ox + height, oy + height + depth * 2))
  Generator.drawFoldLine(
    (ox + width + height, oy + height + depth * 2),
    (ox + width + height * 2, oy + height + depth * 2),
  )
}

let drawFolds = () => {
  let (ox, oy) = (201, 37)
  drawFoldLineCuboid((ox, oy), (56, 24, 40), ()) // drawHead
  let (ox, oy) = (253, 197)
  drawFoldLineCuboidNorth((ox, oy), (40, 24, 72)) // drawBody
  let (ox, oy) = (313, 637)
  drawFoldLineCuboid((ox, oy), (24, 48, 16), ~leftSide=true, ()) // drawTail1
  let (ox, oy) = (217, 645)
  drawFoldLineCuboid((ox, oy), (8, 48, 8), ~leftSide=true, ()) // drawTail2
  let (ox, oy) = (449, 197)
  drawFoldLineCuboidNorth((ox, oy), (48, 16, 72)) // drawWing1
  let (ox, oy) = (429, 453)
  drawFoldLineCuboidWing((ox, oy), (104, 8, 72)) // drawWing2
  let (ox, oy) = (65, 197)
  drawFoldLineCuboidNorth((ox, oy), (48, 16, 72)) // drawWing1
  let (ox, oy) = (45, 453)
  drawFoldLineCuboidWing((ox, oy), (104, 8, 72)) // drawWing2

  Generator.drawImage("Folds", (0, 0))
}

let drawPhantom = (texture: string, showFolds: bool, showLabels: bool) => {
  let (ox, oy) = (201, 37)
  drawHead(texture, (ox, oy))
  let (ox, oy) = (253, 197)
  drawBody(texture, (ox, oy))
  let (ox, oy) = (313, 637)
  drawTail1(texture, (ox, oy))
  let (ox, oy) = (217, 645)
  drawTail2(texture, (ox, oy))
  let (ox, oy) = (449, 197)
  drawWing1(texture, (ox, oy), false)
  let (ox, oy) = (429, 453)
  drawWing2(texture, (ox, oy), false)
  let (ox, oy) = (65, 197)
  drawWing1(texture, (ox, oy), true)
  let (ox, oy) = (45, 453)
  drawWing2(texture, (ox, oy), true)

  // Foreground
  Generator.drawImage("Foreground", (0, 0))

  // Fold Lines
  if showFolds {
    drawFolds()
  }

  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }
}

/* let drawPhantomActionFigure = (texture: string, showFolds: bool, showLabels: bool) => {
  let (ox, oy) = (201, 37)
  drawHead(texture, (ox, oy))
  let (ox, oy) = (253, 197)
  drawBodyActionFigure(texture, (ox, oy))
  let (ox, oy) = (313, 637)
  drawTail1(texture, (ox, oy))
  let (ox, oy) = (217, 645)
  drawTail2(texture, (ox, oy))
  let (ox, oy) = (449, 197)
  drawWing1ActionFigure(texture, (ox, oy), false)
  let (ox, oy) = (429, 453)
  drawWing2(texture, (ox, oy), false)
  let (ox, oy) = (65, 197)
  drawWing1ActionFigure(texture, (ox, oy), true)
  let (ox, oy) = (45, 453)
  drawWing2(texture, (ox, oy), true)

  // Foreground
  Generator.drawImage("Foreground-Action-Figure", (0, 0))

  // Fold Lines
  if showFolds {
    drawFolds()
  }

  // Labels
  if showLabels {
    Generator.drawImage("Labels", (0, 0))
  }
}*/

let script = () => {
  // Define user inputs
  Generator.defineTextureInput("Phantom", {standardWidth: 64, standardHeight: 32, choices: []})
  Generator.defineTextureInput("Phantom Eyes", {standardWidth: 64, standardHeight: 32, choices: []})

  // Define user variables
  Generator.defineBooleanInput("Show Folds", true)
  Generator.defineBooleanInput("Show Labels", true)
  //Generator.defineBooleanInput("Action Figure", true)

  // Get user variable values
  let showLabels = Generator.getBooleanInputValue("Show Labels")
  let showFolds = Generator.getBooleanInputValue("Show Folds")

  //let actionFigure = Generator.getBooleanInputValue("Action Figure")

  // Draw Phantom
  //if actionFigure {
  //  drawPhantomActionFigure("Phantom", false, false) //, showFolds, showLabels)
  //  // Draw Phantom Eyes
  //  drawPhantomActionFigure("Phantom Eyes", false, false) //, showFolds, showLabels)
  //} else {
  drawPhantom("Phantom", showFolds, showLabels)
  // Draw Phantom Eyes
  drawPhantom("Phantom Eyes", showFolds, showLabels)
  //}

  // Fill Transparent Parts, with a different color while creating
  Generator.fillBackgroundColorWithWhite()
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: None,
  video: Some(video),
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images,
  textures,
  script,
}
