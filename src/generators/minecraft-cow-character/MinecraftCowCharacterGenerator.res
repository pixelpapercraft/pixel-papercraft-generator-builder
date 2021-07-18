let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-cow-character"

let name = "Minecraft Cow Character"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Background",
    url: requireImage("Background"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let skin = TextureMap.MinecraftCharacterLegacy.steve

let script = () => {
  // Define input textures
  Generator.defineTextureInput("Skin", {standardWidth: 64, standardHeight: 64, choices: []})

  // Background
  Generator.drawImage("Background", (0, 0))

  // Head
  Generator.drawTextureLegacy("Skin", skin.base.head.right, {x: 25, y: 72, w: 48, h: 64}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.base.head.front, {x: 73, y: 72, w: 64, h: 64}, ()) // Face
  Generator.drawTextureLegacy("Skin", skin.base.head.left, {x: 137, y: 72, w: 49, h: 64}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.base.head.back, {x: 186, y: 72, w: 64, h: 64}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.base.head.top, {x: 73, y: 24, w: 64, h: 48}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.base.head.bottom,
    {x: 73, y: 136, w: 64, h: 48},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // RightArm
  Generator.drawTextureLegacy("Skin", skin.base.rightArm.right, {x: 29, y: 244, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.base.rightArm.front, {x: 61, y: 244, w: 32, h: 96}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.base.rightArm.left, {x: 93, y: 244, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.base.rightArm.back, {x: 125, y: 244, w: 32, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.base.rightArm.top, {x: 61, y: 212, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.base.rightArm.bottom,
    {x: 61, y: 340, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // LeftArm
  Generator.drawTextureLegacy("Skin", skin.base.leftArm.right, {x: 423, y: 50, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.base.leftArm.front, {x: 455, y: 50, w: 32, h: 96}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.base.leftArm.left, {x: 487, y: 50, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.base.leftArm.back, {x: 519, y: 50, w: 32, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.base.leftArm.top, {x: 455, y: 18, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.base.leftArm.bottom,
    {x: 455, y: 146, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Body
  Generator.drawTextureLegacy("Skin", skin.base.body.right, {x: 194, y: 195, w: 80, h: 144}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.base.body.front, {x: 274, y: 195, w: 96, h: 144}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.base.body.left, {x: 370, y: 195, w: 80, h: 144}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.base.body.back, {x: 450, y: 195, w: 96, h: 144}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.base.body.top, {x: 274, y: 115, w: 96, h: 80}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.base.body.bottom,
    {x: 274, y: 339, w: 96, h: 80},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // RightLeg
  Generator.drawTextureLegacy("Skin", skin.base.rightLeg.right, {x: 121, y: 414, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.base.rightLeg.front, {x: 153, y: 414, w: 32, h: 96}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.base.rightLeg.left, {x: 185, y: 414, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.base.rightLeg.back, {x: 217, y: 414, w: 32, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 4, y: 16, w: 4, h: 4}, {x: 153, y: 382, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.base.rightLeg.bottom,
    {x: 153, y: 510, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // LeftLeg
  Generator.drawTextureLegacy("Skin", skin.base.leftLeg.right, {x: 427, y: 406, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.base.leftLeg.front, {x: 459, y: 406, w: 32, h: 96}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.base.leftLeg.left, {x: 491, y: 406, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.base.leftLeg.back, {x: 523, y: 406, w: 32, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.base.leftLeg.top, {x: 459, y: 374, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.base.leftLeg.bottom,
    {x: 459, y: 502, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  //Overlays

  // Helmet
  Generator.drawTextureLegacy("Skin", skin.overlay.head.right, {x: 25, y: 72, w: 48, h: 64}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.overlay.head.front, {x: 73, y: 72, w: 64, h: 64}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.overlay.head.left, {x: 137, y: 72, w: 49, h: 64}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.overlay.head.back, {x: 186, y: 72, w: 64, h: 64}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.overlay.head.top, {x: 73, y: 24, w: 64, h: 48}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.head.bottom,
    {x: 73, y: 136, w: 64, h: 48},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // RightSleeve
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightArm.right,
    {x: 29, y: 244, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightArm.front,
    {x: 61, y: 244, w: 32, h: 96},
    (),
  ) // Front
  Generator.drawTextureLegacy("Skin", skin.overlay.rightArm.left, {x: 93, y: 244, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightArm.back,
    {x: 125, y: 244, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", skin.overlay.rightArm.top, {x: 61, y: 212, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightArm.bottom,
    {x: 61, y: 340, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // LeftSleeve
  Generator.drawTextureLegacy("Skin", skin.overlay.leftArm.right, {x: 423, y: 50, w: 32, h: 96}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.overlay.leftArm.front, {x: 455, y: 50, w: 32, h: 96}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.overlay.leftArm.left, {x: 487, y: 50, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.overlay.leftArm.back, {x: 519, y: 50, w: 32, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.overlay.leftArm.top, {x: 455, y: 18, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.leftArm.bottom,
    {x: 455, y: 146, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // Jacket
  Generator.drawTextureLegacy("Skin", skin.overlay.body.right, {x: 194, y: 195, w: 80, h: 144}, ()) // Right
  Generator.drawTextureLegacy("Skin", skin.overlay.body.front, {x: 274, y: 195, w: 96, h: 144}, ()) // Front
  Generator.drawTextureLegacy("Skin", skin.overlay.body.left, {x: 370, y: 195, w: 80, h: 144}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.overlay.body.back, {x: 450, y: 195, w: 96, h: 144}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.overlay.body.top, {x: 274, y: 115, w: 96, h: 80}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.body.bottom,
    {x: 274, y: 339, w: 96, h: 80},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // RightPant
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightLeg.right,
    {x: 121, y: 414, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightLeg.front,
    {x: 153, y: 414, w: 32, h: 96},
    (),
  ) // Front
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightLeg.left,
    {x: 185, y: 414, w: 32, h: 96},
    (),
  ) // Left
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightLeg.back,
    {x: 217, y: 414, w: 32, h: 96},
    (),
  ) // Back
  Generator.drawTextureLegacy("Skin", skin.overlay.rightLeg.top, {x: 153, y: 382, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.rightLeg.bottom,
    {x: 153, y: 510, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom

  // LeftPant
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.leftLeg.right,
    {x: 427, y: 406, w: 32, h: 96},
    (),
  ) // Right
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.leftLeg.front,
    {x: 459, y: 406, w: 32, h: 96},
    (),
  ) // Front
  Generator.drawTextureLegacy("Skin", skin.overlay.leftLeg.left, {x: 491, y: 406, w: 32, h: 96}, ()) // Left
  Generator.drawTextureLegacy("Skin", skin.overlay.leftLeg.back, {x: 523, y: 406, w: 32, h: 96}, ()) // Back
  Generator.drawTextureLegacy("Skin", skin.overlay.leftLeg.top, {x: 459, y: 374, w: 32, h: 32}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    skin.overlay.leftLeg.bottom,
    {x: 459, y: 502, w: 32, h: 32},
    ~flip=#Vertical,
    (),
  ) // Bottom
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
