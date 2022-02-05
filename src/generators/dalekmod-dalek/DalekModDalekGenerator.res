let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "dalek"

let name = "Doctor Who Dalek"

let history = [
  "gootube2000 - First release.",
  "13 Feb 2015 lostminer - Update to use new version of generator.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail.jpeg"),
}

let instructions = {
  let dalek = Generator.requireImage("./instructions/dalek.jpeg")
  let dalekSkin = Generator.requireImage("./instructions/60sDalek.png")

  `
Create your own Dalek papercraft, thanks to the team who make the [Dalek Mod](https://swdteam.com/p/dalek-mod).

## What is a Dalek?

<div class="not-prose" style="float:right;max-width:150px;">
  <img src="${dalek}" />
</div>

Daleks are a main enemy of a character called The Doctor in the TV show Doctor Who.

Daleks are armoured, mutant creatures who are intensely xenophobic and bent on universal domination.

Daleks are hated and feared throughout time and space. They are the oldest and most frequent foes of The Doctor.

[More about Daleks](http://tardis.wikia.com/wiki/Dalek)

[More about Doctor Who](http://www.thedoctorwhosite.co.uk/doctorwho/information-about-doctor-who)

## How to use the Dalek generator

### Option 1: Use an existing Dalek skin

* Select one of the Dalek skins from the generator.
* Download and print your Dalek papercraft.

### Option 2: Create your own texture

* Download a sample Dalek skin (Right click and save):
  ![Dalek](${dalekSkin})
* Edit this skin in your favourite graphics program.
* Choose this file in the generator.
* Download and print your Dalek papercraft.
`
}

let images: array<Generator.imageDef> = [
  {
    id: "Background1",
    url: requireImage("Background1"),
  },
  {
    id: "Colors1",
    url: requireImage("Colors1"),
  },
  {
    id: "Background2",
    url: requireImage("Background2"),
  },
  {
    id: "Colors2",
    url: requireImage("Colors2"),
  },
]

type dalekDef = {
  file: string,
  id: string,
}

let daleks: array<dalekDef> = [
  {file: "60sDalek", id: "60's Dalek"},
  {file: "80sDalek", id: "80's Dalek"},
  {file: "RedDalek", id: "Red Dalek"},
  {file: "YellowDalek", id: "Yellow Dalek"},
  {file: "MovieDalekGold", id: "Gold Dalek"},
  {file: "EntityGoldDalek", id: "Gold Entity Dalek"},
  {file: "EntityMDalekBlk", id: "Black Entity Dalek"},
  {file: "EntityMDalekBlu", id: "Blue Entity Dalek"},
  {file: "EntityMDalekRed", id: "Red Entity Dalek"},
  {file: "EnderDalek", id: "Ender Dalek"},
  {file: "ClassicSupreme", id: "Classic Supreme Dalek"},
  {file: "ImperialDalek", id: "Imperial Dalek"},
  {file: "InvasionDalek", id: "Invasion Dalek"},
  {file: "Ironside", id: "Ironside Dalek"},
  {file: "MarineDalek", id: "Marine Dalek"},
  {file: "PilotDalek", id: "Pilot Dalek"},
  {file: "RenegadeDalek", id: "Renegade Dalek"},
  {file: "ScientistDalek", id: "Scientist Dalek"},
  {file: "StoneDalek", id: "Stone Dalek"},
  {file: "Strategist", id: "Strategist Dalek"},
  {file: "SuicideDalek", id: "Suicide Dalek"},
]

let dalekTextures: array<
  Generator.textureDef,
> = daleks->Js.Array2.map((dalek: dalekDef): Generator.textureDef => {
  id: dalek.id,
  url: requireTexture("daleks/" ++ dalek.file),
  standardWidth: 64,
  standardHeight: 64,
})

// let otherTextures: array<Generator.textureDef> = [
//   {
//     id: "Skin",
//     url: requireTexture("daleks/EntityMDalekRed"),
//     standardWidth: 64,
//     standardHeight: 64,
//   },
// ]

// let textures: array<Generator.textureDef> = Js.Array2.concat(otherTextures, dalekTextures)

let textures = dalekTextures

let script = () => {
  // Define user inputs
  Generator.defineTextureInput(
    "Skin",
    {
      standardWidth: 128,
      standardHeight: 128,
      choices: daleks->Js.Array2.map((dalek: dalekDef) => dalek.id),
    },
  )

  // Define user variables
  Generator.defineBooleanInput("Show Colors", false)

  // Get user variable values
  let showColors = Generator.getBooleanInputValue("Show Colors")

  ////////////////////////////////////////////////////////////////////////////////
  //
  // Page 1
  //
  ////////////////////////////////////////////////////////////////////////////////

  Generator.usePage("Head and Body")

  // Background
  Generator.drawImage("Background1", (0, 0))

  // Left Lightbulb
  Generator.drawTextureLegacy("Skin", {x: 5, y: 44, w: 1, h: 3}, {x: 27, y: 110, w: 5, h: 15}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 6, y: 44, w: 1, h: 3}, {x: 32, y: 110, w: 5, h: 15}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 7, y: 44, w: 1, h: 3}, {x: 37, y: 110, w: 5, h: 15}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 8, y: 44, w: 1, h: 3}, {x: 22, y: 110, w: 5, h: 15}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 6, y: 45, w: 1, h: 1}, {x: 32, y: 105, w: 5, h: 5}, ()) // Top

  // Right Lightbulb
  Generator.drawTextureLegacy("Skin", {x: 5, y: 44, w: 1, h: 3}, {x: 55, y: 110, w: 5, h: 15}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 6, y: 44, w: 1, h: 3}, {x: 60, y: 110, w: 5, h: 15}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 7, y: 44, w: 1, h: 3}, {x: 65, y: 110, w: 5, h: 15}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 8, y: 44, w: 1, h: 3}, {x: 70, y: 110, w: 5, h: 15}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 6, y: 45, w: 1, h: 1}, {x: 60, y: 105, w: 5, h: 5}, ()) // Top

  // Top Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 58, y: 110, w: 30, h: 2},
    {x: 95, y: 70, w: 150, h: 10},
    (),
  ) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 66, y: 102, w: 7, h: 8},
    {x: 135, y: 30, w: 35, h: 40},
    (),
  ) // Top

  // Bottom Head
  Generator.drawTextureLegacy(
    "Skin",
    {x: 58, y: 124, w: 38, h: 4},
    {x: 95, y: 175, w: 190, h: 20},
    (),
  ) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 68, y: 114, w: 9, h: 10},
    {x: 190, y: 125, w: 45, h: 50},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 77, y: 114, w: 9, h: 10},
    {x: 190, y: 195, w: 45, h: 50},
    (),
  ) // Bottom

  // "Neck" 1
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 28, h: 1}, {x: 211, y: 263, w: 140, h: 5}, ()) // Right, Face, Left, Back

  // "Neck" 2
  Generator.drawTextureLegacy("Skin", {x: 0, y: 40, w: 38, h: 1}, {x: 34, y: 288, w: 190, h: 5}, ()) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 68, y: 114, w: 9, h: 10},
    {x: 79, y: 243, w: 50, h: 45},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 77, y: 114, w: 9, h: 10},
    {x: 79, y: 293, w: 50, h: 45},
    (),
  ) // Bottom

  // "Neck" 3
  Generator.drawTextureLegacy("Skin", {x: 0, y: 8, w: 28, h: 1}, {x: 176, y: 342, w: 140, h: 5}, ()) // Right, Face, Left, Back

  // "Neck" 4
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 40, w: 38, h: 1},
    {x: 100, y: 406, w: 190, h: 5},
    (),
  ) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 68, y: 114, w: 9, h: 10},
    {x: 145, y: 361, w: 50, h: 45},
    (),
  ) // Top

  // Body
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 109, w: 46, h: 5},
    {x: 15, y: 483, w: 230, h: 25},
    (),
  ) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 68, y: 114, w: 9, h: 10},
    {x: 70, y: 428, w: 60, h: 55},
    (),
  ) // Top

  // Eye
  Generator.drawTextureLegacy("Skin", {x: 0, y: 1, w: 1, h: 3}, {x: 20, y: 180, w: 5, h: 15}, ()) // Right
  Generator.drawTextureLegacy("Skin", {x: 1, y: 1, w: 3, h: 3}, {x: 25, y: 180, w: 15, h: 15}, ()) // Face
  Generator.drawTextureLegacy("Skin", {x: 4, y: 1, w: 1, h: 3}, {x: 40, y: 180, w: 5, h: 15}, ()) // Left
  Generator.drawTextureLegacy("Skin", {x: 5, y: 1, w: 3, h: 3}, {x: 45, y: 180, w: 15, h: 15}, ()) // Back
  Generator.drawTextureLegacy("Skin", {x: 1, y: 0, w: 3, h: 1}, {x: 25, y: 175, w: 15, h: 5}, ()) // Top
  Generator.drawTextureLegacy("Skin", {x: 4, y: 0, w: 3, h: 1}, {x: 25, y: 195, w: 15, h: 5}, ()) // Bottom
  Generator.drawTextureLegacy("Skin", {x: 0, y: 42, w: 1, h: 1}, {x: 30, y: 185, w: 5, h: 5}, ()) // Center

  // Eyestalk
  Generator.drawTextureLegacy("Skin", {x: 2, y: 56, w: 5, h: 4}, {x: 310, y: 433, w: 30, h: 20}, ()) // Right, Face, Left, Back
  Generator.drawTextureLegacy("Skin", {x: 1, y: 59, w: 1, h: 1}, {x: 305, y: 438, w: 5, h: 5}, ()) // Top

  //Tazer
  Generator.drawTextureLegacy("Skin", {x: 1, y: 48, w: 7, h: 1}, {x: 270, y: 483, w: 30, h: 20}, ()) // Right, Face, Left, Back
  Generator.drawTextureLegacy("Skin", {x: 0, y: 48, w: 1, h: 1}, {x: 265, y: 488, w: 5, h: 5}, ()) // Top

  // Color Identifiers
  if showColors {
    Generator.drawImage("Colors1", (0, 0))
  }

  ////////////////////////////////////////////////////////////////
  //
  // Page 2
  //
  ////////////////////////////////////////////////////////////////

  Generator.usePage("Skirt")

  // Background
  Generator.drawImage("Background2", (0, 0))

  // Top Skirt
  Generator.drawTextureLegacy(
    "Skin",
    {x: 1, y: 93, w: 47, h: 5},
    {x: 120, y: 116, w: 235, h: 25},
    (),
  ) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 14, y: 60, w: 11, h: 14},
    {x: 180, y: 56, w: 55, h: 60},
    (),
  ) // Top

  // Middle Skirt
  Generator.drawTextureLegacy("Skin", {x: 0, y: 74, w: 50, h: 6}, {x: 5, y: 256, w: 250, h: 30}, ()) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 13, y: 80, w: 11, h: 14},
    {x: 75, y: 186, w: 55, h: 70},
    (),
  ) // Top

  // Bottom Skirt
  Generator.drawTextureLegacy(
    "Skin",
    {x: 0, y: 16, w: 58, h: 4},
    {x: 35, y: 460, w: 290, h: 15},
    (),
  ) // Right, Face, Left, Back
  Generator.drawTextureLegacy(
    "Skin",
    {x: 16, y: 0, w: 13, h: 16},
    {x: 115, y: 380, w: 65, h: 80},
    (),
  ) // Top
  Generator.drawTextureLegacy(
    "Skin",
    {x: 29, y: 0, w: 13, h: 16},
    {x: 115, y: 380, w: 65, h: 80},
    (),
  ) // Bottom

  // Color Identifiers
  if showColors {
    Generator.drawImage("Colors2", (0, 0))
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
