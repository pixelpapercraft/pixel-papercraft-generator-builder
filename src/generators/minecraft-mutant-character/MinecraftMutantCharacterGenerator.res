let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)

let id = "minecraft-mutant-character"

let name = "Mutant Character"

let history = ["Created by PaperDogChannel.", "02 Feb 2024 NinjolasNJM - added skin input"]

let video: Generator.videoDef = {url: "https://www.youtube.com/embed/DVzumgRinjY?rel=0"}

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {id: "Page1", url: requireImage("Page1.png")},
  {id: "Page2", url: requireImage("Page2.png")},
  {id: "Page3", url: requireImage("Page3.png")},
  {id: "Page4", url: requireImage("Page4.png")},
  {id: "Hole1", url: requireImage("Hole1.png")},
  {id: "Hole2", url: requireImage("Hole2.png")},
  {id: "Hole3", url: requireImage("Hole3.png")},
]

let textures: array<Generator.textureDef> = MinecraftSkins.skins

let script = () => {
  Generator.defineSkinInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 64,
      choices: ["Steve", "Alex"],
    },
  )

  Generator.defineSelectInput("Skin Model", ["Steve", "Alex"])
  let alexModel = Generator.getSelectInputValue("Skin Model") === "Alex"

  Generator.usePage("Page 1")
  Generator.drawImage("Page1", (0, 0))
  // Head
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 8, h: 8}, {x: 260, y: 88, w: 84, h: 84}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 8, y: 8, w: 8, h: 8}, {x: 2, y: 88, w: 84, h: 84}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 16, y: 8, w: 8, h: 8}, {x: 88, y: 88, w: 84, h: 84}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 24, y: 8, w: 8, h: 8}, {x: 174, y: 88, w: 84, h: 84}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 8, y: 0, w: 8, h: 8}, {x: 2, y: 2, w: 84, h: 84}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 8, h: 8},
    {x: 2, y: 174, w: 84, h: 84},
    ~flip=#Vertical,
    (),
  ) // Bottom

  Generator.drawTextureLegacy("Skin", {x: 32, y: 8, w: 8, h: 8}, {x: 260, y: 88, w: 84, h: 84}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 40, y: 8, w: 8, h: 8}, {x: 2, y: 88, w: 84, h: 84}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 48, y: 8, w: 8, h: 8}, {x: 88, y: 88, w: 84, h: 84}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 56, y: 8, w: 8, h: 8}, {x: 174, y: 88, w: 84, h: 84}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 40, y: 0, w: 8, h: 8}, {x: 2, y: 2, w: 84, h: 84}, ()) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 48, y: 0, w: 8, h: 8},
    {x: 2, y: 174, w: 84, h: 84},
    ~flip=#Vertical,
    (),
  ) // Bottom

  ////Right Arm

  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 6},
      {x: 200, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 3, h: 6},
      {x: 2, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 20, w: 4, h: 6},
      {x: 68, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 20, w: 3, h: 6},
      {x: 134, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 3, h: 4},
      {x: 2, y: 264, w: 64, h: 64},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 36, w: 4, h: 6},
      {x: 200, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 36, w: 3, h: 6},
      {x: 2, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 36, w: 4, h: 6},
      {x: 68, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 36, w: 3, h: 6},
      {x: 134, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 32, w: 3, h: 4},
      {x: 2, y: 264, w: 64, h: 64},
      (),
    )
    /////Left Arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 6},
      {x: 200 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 3, h: 6},
      {x: 2 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 52, w: 4, h: 6},
      {x: 68 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 52, w: 3, h: 6},
      {x: 134 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: 2 + 224 + 64, y: 264, w: 64, h: 64},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 52, w: 4, h: 6},
      {x: 200 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 52, w: 3, h: 6},
      {x: 2 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 55, y: 52, w: 4, h: 6},
      {x: 68 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 59, y: 52, w: 3, h: 6},
      {x: 134 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 48, w: 3, h: 4},
      {x: 2 + 224 + 64, y: 264, w: 64, h: 64},
      (),
    )
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 20, w: 4, h: 6},
      {x: 200, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 20, w: 4, h: 6},
      {x: 2, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 20, w: 4, h: 6},
      {x: 68, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 20, w: 4, h: 6},
      {x: 134, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 16, w: 4, h: 4},
      {x: 2, y: 264, w: 64, h: 64},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 36, w: 4, h: 6},
      {x: 200, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 36, w: 4, h: 6},
      {x: 2, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 36, w: 4, h: 6},
      {x: 68, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 36, w: 4, h: 6},
      {x: 134, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 32, w: 4, h: 4},
      {x: 2, y: 264, w: 64, h: 64},
      (),
    )
    /////Left Arm
    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 52, w: 4, h: 6},
      {x: 200 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 52, w: 4, h: 6},
      {x: 2 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 52, w: 4, h: 6},
      {x: 68 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 52, w: 4, h: 6},
      {x: 134 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: 2 + 224 + 64, y: 264, w: 64, h: 64},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 52, w: 4, h: 6},
      {x: 200 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 52, w: 4, h: 6},
      {x: 2 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 52, w: 4, h: 6},
      {x: 68 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 60, y: 52, w: 4, h: 6},
      {x: 134 + 224 + 64, y: 330, w: 64, h: 168},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 48, w: 4, h: 4},
      {x: 2 + 224 + 64, y: 264, w: 64, h: 64},
      (),
    )
  }
  //Legs
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 20, w: 4, h: 6},
    {x: 204, y: 596, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 20, w: 4, h: 6}, {x: 6, y: 596, w: 64, h: 116}, ())
  Generator.drawTextureLegacy("Skin", {x: 8, y: 20, w: 4, h: 6}, {x: 72, y: 596, w: 64, h: 116}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 20, w: 4, h: 6},
    {x: 138, y: 596, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 16, w: 4, h: 4}, {x: 6, y: 529, w: 64, h: 65}, ())

  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 36, w: 4, h: 6},
    {x: 204, y: 596, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 36, w: 4, h: 6}, {x: 6, y: 596, w: 64, h: 116}, ())
  Generator.drawTextureLegacy("Skin", {x: 8, y: 36, w: 4, h: 6}, {x: 72, y: 596, w: 64, h: 116}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 36, w: 4, h: 6},
    {x: 138, y: 596, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 32, w: 4, h: 4}, {x: 6, y: 529, w: 64, h: 65}, ())

  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 52, w: 4, h: 6},
    {x: 204 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 52, w: 4, h: 6},
    {x: 6 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 52, w: 4, h: 6},
    {x: 72 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 52, w: 4, h: 6},
    {x: 138 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 6 + 283, y: 527, w: 64, h: 65},
    (),
  )

  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 52, w: 4, h: 6},
    {x: 204 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 52, w: 4, h: 6},
    {x: 6 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 52, w: 4, h: 6},
    {x: 72 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 52, w: 4, h: 6},
    {x: 138 + 283, y: 594, w: 64, h: 116},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 48, w: 4, h: 4},
    {x: 6 + 283, y: 527, w: 64, h: 65},
    (),
  )

  Generator.usePage("Page 2")
  Generator.drawImage("Page2", (0, 0))
  if alexModel {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 26, w: 4, h: 6},
      {x: 190, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 26, w: 3, h: 6},
      {x: 2, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 26, w: 4, h: 6},
      {x: 65, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 26, w: 3, h: 6},
      {x: 127, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy("Skin", {x: 44, y: 16, w: 3, h: 4}, {x: 2, y: 2, w: 61, h: 61}, ())
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 16, w: 3, h: 4},
      {x: 2, y: 227, w: 61, h: 61},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 42, w: 4, h: 6},
      {x: 190, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 42, w: 3, h: 6},
      {x: 2, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 42, w: 4, h: 6},
      {x: 65, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 51, y: 42, w: 3, h: 6},
      {x: 127, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy("Skin", {x: 44, y: 32, w: 3, h: 4}, {x: 2, y: 2, w: 61, h: 61}, ())
    Generator.drawTextureLegacy(
      "Skin",
      {x: 47, y: 32, w: 3, h: 4},
      {x: 2, y: 227, w: 61, h: 61},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 58, w: 4, h: 6},
      {x: 190 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 58, w: 3, h: 6},
      {x: 2 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 58, w: 4, h: 6},
      {x: 65 + 267, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 43, y: 58, w: 3, h: 6},
      {x: 127 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 3, h: 4},
      {x: 2 + 267, y: 2, w: 61, h: 61},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 39, y: 48, w: 3, h: 4},
      {x: 2 + 267, y: 227, w: 61, h: 61},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 58, w: 4, h: 6},
      {x: 190 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 58, w: 3, h: 6},
      {x: 2 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 55, y: 58, w: 4, h: 6},
      {x: 65 + 267, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 59, y: 58, w: 3, h: 6},
      {x: 127 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 48, w: 3, h: 4},
      {x: 2 + 267, y: 2, w: 61, h: 61},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 55, y: 48, w: 3, h: 4},
      {x: 2 + 267, y: 227, w: 61, h: 61},
      (),
    )
  } else {
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 26, w: 4, h: 6},
      {x: 190, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 26, w: 4, h: 6},
      {x: 2, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 26, w: 4, h: 6},
      {x: 65, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 26, w: 4, h: 6},
      {x: 127, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy("Skin", {x: 44, y: 16, w: 4, h: 4}, {x: 2, y: 2, w: 61, h: 61}, ())
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 16, w: 4, h: 4},
      {x: 2, y: 227, w: 61, h: 61},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 42, w: 4, h: 6},
      {x: 190, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 42, w: 4, h: 6},
      {x: 2, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 42, w: 4, h: 6},
      {x: 65, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 42, w: 4, h: 6},
      {x: 127, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy("Skin", {x: 44, y: 32, w: 4, h: 4}, {x: 2, y: 2, w: 61, h: 61}, ())
    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 32, w: 4, h: 4},
      {x: 2, y: 227, w: 61, h: 61},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 32, y: 58, w: 4, h: 6},
      {x: 190 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 58, w: 4, h: 6},
      {x: 2 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 58, w: 4, h: 6},
      {x: 65 + 267, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 44, y: 58, w: 4, h: 6},
      {x: 127 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 36, y: 48, w: 4, h: 4},
      {x: 2 + 267, y: 2, w: 61, h: 61},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 40, y: 48, w: 4, h: 4},
      {x: 2 + 267, y: 227, w: 61, h: 61},
      (),
    )

    Generator.drawTextureLegacy(
      "Skin",
      {x: 48, y: 58, w: 4, h: 6},
      {x: 190 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 58, w: 4, h: 6},
      {x: 2 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 58, w: 4, h: 6},
      {x: 65 + 267, y: 65, w: 60, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 60, y: 58, w: 4, h: 6},
      {x: 127 + 267, y: 65, w: 61, h: 160},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 52, y: 48, w: 4, h: 4},
      {x: 2 + 267, y: 2, w: 61, h: 61},
      (),
    )
    Generator.drawTextureLegacy(
      "Skin",
      {x: 56, y: 48, w: 4, h: 4},
      {x: 2 + 267, y: 227, w: 61, h: 61},
      (),
    )
  }

  //Legs
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 26, w: 4, h: 6},
    {x: 191, y: 359, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 26, w: 4, h: 6}, {x: 3, y: 359, w: 61, h: 110}, ())
  Generator.drawTextureLegacy("Skin", {x: 8, y: 26, w: 4, h: 6}, {x: 66, y: 359, w: 61, h: 110}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 26, w: 4, h: 6},
    {x: 128, y: 359, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 16, w: 4, h: 4}, {x: 3, y: 295, w: 61, h: 62}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 16, w: 4, h: 4},
    {x: 3, y: 295 + 62 + 4 + 110, w: 61, h: 62},
    ~flip=#Vertical,
    (),
  )

  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 42, w: 4, h: 6},
    {x: 191, y: 359, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 42, w: 4, h: 6}, {x: 3, y: 359, w: 61, h: 110}, ())
  Generator.drawTextureLegacy("Skin", {x: 8, y: 42, w: 4, h: 6}, {x: 66, y: 359, w: 61, h: 110}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 42, w: 4, h: 6},
    {x: 128, y: 359, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 32, w: 4, h: 4}, {x: 3, y: 295, w: 61, h: 62}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 32, w: 4, h: 4},
    {x: 3, y: 295 + 62 + 4 + 110, w: 61, h: 62},
    ~flip=#Vertical,
    (),
  )

  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 58, w: 4, h: 6},
    {x: 459, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 58, w: 4, h: 6},
    {x: 270, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 58, w: 4, h: 6},
    {x: 333, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 58, w: 4, h: 6},
    {x: 396, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 48, w: 4, h: 4},
    {x: 270, y: 293, w: 61, h: 62},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 24, y: 48, w: 4, h: 4},
    {x: 270, y: 469, w: 61, h: 62},
    ~flip=#Vertical,
    (),
  )

  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 58, w: 4, h: 6},
    {x: 459, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 4, y: 58, w: 4, h: 6},
    {x: 270, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 58, w: 4, h: 6},
    {x: 333, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 12, y: 58, w: 4, h: 6},
    {x: 396, y: 357, w: 61, h: 110},
    (),
  )
  Generator.drawTextureLegacy("Skin", {x: 4, y: 48, w: 4, h: 4}, {x: 270, y: 293, w: 61, h: 62}, ())
  Generator.drawTextureLegacy(
    "Skin",
    {x: 8, y: 48, w: 4, h: 4},
    {x: 270, y: 469, w: 61, h: 62},
    ~flip=#Vertical,
    (),
  )

  Generator.usePage("Page 3")
  Generator.drawImage("Page3", (0, 0))
  // Torso11
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 20, w: 4, h: 7},
    {x: 131, y: 4, w: 168, h: 126},
    ~rotateLegacy=90.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 20, w: 8, h: 7},
    {x: 133, y: 174, w: 252, h: 126},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 20, w: 4, h: 7},
    {x: 387, y: 172, w: 168, h: 126},
    ~rotateLegacy=270.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 20, w: 8, h: 7},
    {x: 385, y: 598, w: 252, h: 126},
    ~rotateLegacy=180.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 16, w: 8, h: 4},
    {x: 133, y: 4, w: 252, h: 168},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 26, w: 8, h: 1},
    {x: 133, y: 302, w: 252, h: 168},
    (),
  )

  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 36, w: 4, h: 7},
    {x: 131, y: 4, w: 168, h: 126},
    ~rotateLegacy=90.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 36, w: 8, h: 7},
    {x: 133, y: 174, w: 252, h: 126},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 36, w: 4, h: 7},
    {x: 387, y: 172, w: 168, h: 126},
    ~rotateLegacy=270.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 36, w: 8, h: 7},
    {x: 385, y: 598, w: 252, h: 126},
    ~rotateLegacy=180.0,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 32, w: 8, h: 4},
    {x: 133, y: 4, w: 252, h: 168},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 42, w: 8, h: 1},
    {x: 133, y: 302, w: 252, h: 168},
    (),
  )

  Generator.drawImage("Hole1", (216, 32))
  Generator.drawImage("Hole2", (182, 320))

  Generator.usePage("Page 4")
  Generator.drawImage("Page4", (0, 0))
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 27, w: 4, h: 5},
    {x: 434, y: 134, w: 128, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 27, w: 8, h: 5},
    {x: 3, y: 134, w: 150, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 27, w: 4, h: 5},
    {x: 154, y: 134, w: 128, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 27, w: 8, h: 5},
    {x: 283, y: 134, w: 150, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 16, w: 8, h: 4},
    {x: 3, y: 306, w: 150, h: 128},
    ~flip=#Vertical,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 26, w: 8, h: 1},
    {x: 3, y: 306 - 128 - 171 - 2, w: 150, h: 128},
    (),
  )

  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 41, w: 4, h: 5},
    {x: 434, y: 134, w: 128, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 41, w: 8, h: 5},
    {x: 3, y: 134, w: 150, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 41, w: 4, h: 5},
    {x: 154, y: 134, w: 128, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 32, y: 41, w: 8, h: 5},
    {x: 283, y: 134, w: 150, h: 171},
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 28, y: 39, w: 8, h: 9},
    {x: 3, y: 306, w: 150, h: 128},
    ~flip=#Vertical,
    (),
  )
  Generator.drawTextureLegacy(
    "Skin",
    {x: 20, y: 42, w: 8, h: 1},
    {x: 3, y: 306 - 128 - 171 - 2, w: 150, h: 128},
    (),
  )

  Generator.drawImage("Hole3", (3, 339))
  Generator.drawImage("Hole3", (87, 339))
}

let generator: Generator.generatorDef = {
  id,
  name,
  history,
  thumbnail: Some(thumbnail),
  video: Some(video),
  instructions: None,
  images,
  textures,
  script,
}
