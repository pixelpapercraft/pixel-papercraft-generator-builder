let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "minecraft-ghast-bendable"

let name = "Minecraft Ghast Bendable"
let images: array<Generator.imageDef> = [
  {id: "FSBack", url: requireImage("FSBack.png")},
  {id: "FSBendablePart", url: requireImage("FSBendablePart.png")},
  {id: "FSBottom", url: requireImage("FSBottom.png")},
  {id: "FSFace", url: requireImage("FSFace.png")},
  {id: "FSLeftSide", url: requireImage("FSLeftSide.png")},
  {id: "FSRightSide", url: requireImage("FSRightSide.png")},
  {id: "FSTentacles1", url: requireImage("FSTentacles1.png")},
  {id: "FSTentacles2", url: requireImage("FSTentacles2.png")},
  {id: "FSTop", url: requireImage("FSTop.png")},
  {id: "FSHoles", url: requireImage("FSHoles.png")},
  {id: "FSHole1", url: requireImage("FSHole1.png")},
  {id: "SSize", url: requireImage("SSize.png")},
  {id: "SSizeHoles", url: requireImage("SSizeHoles.png")},
  {id: "MPage1", url: requireImage("MPage1.png")},
  {id: "MPage2", url: requireImage("MPage2.png")},
  {id: "MPage3", url: requireImage("MPage3.png")},
  {id: "Page1Holes", url: requireImage("Page1Holes.png")},
  {id: "Page2Holes", url: requireImage("Page2Holes.png")},
  {id: "Page3Holes", url: requireImage("Page3Holes.png")},
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin.png"),
    standardWidth: 64,
    standardHeight: 32,
  },
]

let script = () => {
  Generator.defineSelectInput("Size", ["Full Size", "Half Size", "1/4 Size"])
  let fsize = Generator.getSelectInputValue("Size") === "Full Size"
  let msize = Generator.getSelectInputValue("Size") === "Half Size"
  let ssize = Generator.getSelectInputValue("Size") === "1/4 Size"
  Generator.defineTextureInput(
    "Skin",
    {
      standardWidth: 64,
      standardHeight: 32,
      choices: [],
    },
  )
  if fsize {
    //Body
    Generator.usePage("Front")
    Generator.drawImage("FSFace", (0, 0))
    Generator.drawTexture("Skin", (16, 16, 16, 16), (10, 77, 576, 576), ())
    Generator.usePage("Left")
    Generator.drawImage("FSLeftSide", (0, 0))
    Generator.drawTexture("Skin", (32, 16, 16, 16), (10, 77, 576, 576), ~rotate=90.0, ())
    Generator.usePage("Right")
    Generator.drawImage("FSRightSide", (0, 0))
    Generator.drawTexture("Skin", (0, 16, 16, 16), (10, 77, 576, 576), ~rotate=90.0, ())
    Generator.usePage("Back")
    Generator.drawImage("FSBack", (0, 0))
    Generator.drawTexture("Skin", (48, 16, 16, 16), (10, 77, 576, 576), ())
    Generator.usePage("Top")
    Generator.drawImage("FSTop", (0, 0))
    Generator.drawTexture("Skin", (16, 0, 16, 16), (10, 77, 576, 576), ~rotate=-90.0, ())
    Generator.usePage("Bottom")
    Generator.drawImage("FSBottom", (0, 0))
    Generator.drawTexture(
      "Skin",
      (32, 0, 16, 16),
      (10, 70, 576, 576),
      ~rotate=-90.0,
      ~flip=#Vertical,
      (),
    )
    Generator.drawImage("FSHoles", (0, 0))
    //Tentacles1
    Generator.usePage("Tentacles 1")
    Generator.drawImage("FSTentacles1", (0, 0))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (113, 76, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (113 - 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (113 + 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (113 + 73 * 2, 76, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (113, 3, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (113, 76 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (47, 82))
    Generator.drawImage("FSHole1", (193, 82))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (456, 76, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (456 - 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (456, 3, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (456, 76 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (390, 82))
    //Tentacles2
    Generator.usePage("Tentacles 2")
    Generator.drawImage("FSTentacles2", (0, 0))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (337, 78, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (337 - 73, 78, 72, 504), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (337 + 73, 78, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (337 + 73 * 2, 78, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (337, 5, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (337, 78 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (271, 84))
    Generator.drawImage("FSHole1", (417, 84))
    Generator.drawTexture("Skin", (4, 2, 2, 14), (13, 56, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (13 + 73, 56, 72, 504), ())
    Generator.drawImage("FSHole1", (20, 62))
    //Tentacles3
    Generator.usePage("Tentacles 3")
    Generator.drawImage("FSTentacles1", (0, 0))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (113, 76, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (113 - 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (113 + 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (113 + 73 * 2, 76, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (113, 3, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (113, 76 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (47, 82))
    Generator.drawImage("FSHole1", (193, 82))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (456, 76, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (456 - 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (456, 3, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (456, 76 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (390, 82))
    //Tentacles4
    Generator.usePage("Tentacles 4")
    Generator.drawImage("FSTentacles2", (0, 0))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (337, 78, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (337 - 73, 78, 72, 504), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (337 + 73, 78, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (337 + 73 * 2, 78, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (337, 5, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (337, 78 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (271, 84))
    Generator.drawImage("FSHole1", (417, 84))
    Generator.drawTexture("Skin", (4, 2, 2, 14), (13, 56, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (13 + 73, 56, 72, 504), ())
    Generator.drawImage("FSHole1", (20, 62))
    //Tentacles5
    Generator.usePage("Tentacles 5")
    Generator.drawImage("FSTentacles1", (0, 0))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (113, 76, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (113 - 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (113 + 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (113 + 73 * 2, 76, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (113, 3, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (113, 76 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (47, 82))
    Generator.drawImage("FSHole1", (193, 82))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (456, 76, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (456 - 73, 76, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (456, 3, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (456, 76 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (390, 82))
    //Tentacles6
    Generator.usePage("Tentacles 6")
    Generator.drawImage("FSTentacles2", (0, 0))
    Generator.drawTexture("Skin", (2, 2, 2, 14), (337, 78, 72, 504), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (337 - 73, 78, 72, 504), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (337 + 73, 78, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (337 + 73 * 2, 78, 72, 504), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (337, 5, 72, 72), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (337, 78 + 505, 72, 72), ~flip=#Vertical, ())
    Generator.drawImage("FSHole1", (271, 84))
    Generator.drawImage("FSHole1", (417, 84))
    Generator.drawTexture("Skin", (4, 2, 2, 14), (13, 56, 72, 504), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (13 + 73, 56, 72, 504), ())
    Generator.drawImage("FSHole1", (20, 62))
    //Extra parts
    Generator.usePage("Some Extra parts")
    Generator.drawImage("FSBendablePart", (0, 0))
  }
  if ssize {
    //Body
    Generator.drawImage("SSize", (0, 0))
    Generator.drawTexture("Skin", (16, 16, 16, 16), (146, 146, 144, 144), ~rotate=90.0, ())

    Generator.drawTexture("Skin", (0, 16, 16, 16), (146, 1, 144, 144), ~rotate=90.0, ())

    Generator.drawTexture("Skin", (32, 16, 16, 16), (146, 146 + 145, 144, 144), ~rotate=90.0, ())

    Generator.drawTexture(
      "Skin",
      (48, 16, 16, 16),
      (146, 146 + 2 * 145, 144, 144),
      ~rotate=90.0,
      (),
    )

    Generator.drawTexture("Skin", (16, 0, 16, 16), (146 + 145, 146, 144, 144), ~rotate=90.0, ())

    Generator.drawTexture(
      "Skin",
      (32, 0, 16, 16),
      (1, 146, 144, 144),
      ~rotate=90.0,
      ~flip=#Vertical,
      (),
    )
    //Tentacles
    Generator.drawTexture("Skin", (2, 2, 2, 14), (525, 21, 18, 126), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (525 - 19, 21, 18, 126), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (525 + 19, 21, 18, 126), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (525 + 19 * 2, 21, 18, 126), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (525, 21 - 19, 18, 18), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (525, 21 + 127, 18, 18), ~flip=#Vertical, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (458, 178, 18, 126), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (458 - 19, 178, 18, 126), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (458 + 19, 178, 18, 126), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (458 + 19 * 2, 178, 18, 126), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (458, 178 - 19, 18, 18), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (458, 178 + 127, 18, 18), ~flip=#Vertical, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (341, 312, 18, 126), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (341 - 19, 312, 18, 126), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (341 + 19, 312, 18, 126), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (341 + 19 * 2, 312, 18, 126), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (341, 312 - 19, 18, 18), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (341, 312 + 127, 18, 18), ~flip=#Vertical, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (429, 355, 18, 126), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (429 - 19, 355, 18, 126), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (429 + 19, 355, 18, 126), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (429 + 19 * 2, 355, 18, 126), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (429, 355 - 19, 18, 18), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (429, 355 + 127, 18, 18), ~flip=#Vertical, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (517, 340, 18, 126), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (517 - 19, 340, 18, 126), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (517 + 19, 340, 18, 126), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (517 + 19 * 2, 340, 18, 126), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (517, 340 - 19, 18, 18), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (517, 340 + 127, 18, 18), ~flip=#Vertical, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (341, 484, 18, 126), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (341 - 19, 484, 18, 126), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (341 + 19, 484, 18, 126), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (341 + 19 * 2, 484, 18, 126), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (341, 484 - 19, 18, 18), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (341, 484 + 127, 18, 18), ~flip=#Vertical, ())

    Generator.drawImage("SSizeHoles", (0, 0))
  }
  if msize {
    Generator.usePage("Page 1")
    Generator.drawImage("MPage1", (0, 0))
    Generator.drawTexture("Skin", (16, 16, 16, 16), (293, 6, 288, 288), ~rotate=90.0, ())
    Generator.drawTexture(
      "Skin",
      (32, 0, 16, 16),
      (4, 6, 288, 288),
      ~rotate=90.0,
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture("Skin", (16, 0, 16, 16), (7, 382, 288, 288), ())
    Generator.drawTexture("Skin", (32, 16, 16, 16), (7 + 289, 382, 288, 288), ~rotate=-90.0, ())
    Generator.drawImage("Page1Holes", (0, 0))

    Generator.usePage("Page 2")
    Generator.drawImage("MPage2", (0, 0))
    Generator.drawTexture("Skin", (0, 16, 16, 16), (41, 8 + 289, 288, 288), ~rotate=90.0, ())
    Generator.drawTexture("Skin", (48, 16, 16, 16), (41, 8, 288, 288), ~rotate=90.0, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (438, 38, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (438 - 37, 38, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (438 + 37, 38, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (438 + 37 * 2, 38, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (438, 38 - 37, 36, 36), ())
    Generator.drawTexture(
      "Skin",
      (4, 0, 2, 2),
      (438, 38 + 126 * 2 + 1, 36, 36),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture("Skin", (2, 2, 2, 14), (439, 374, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (439 - 37, 374, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (439 + 37, 374, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (439 + 37 * 2, 374, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (439, 374 - 37, 36, 36), ())
    Generator.drawTexture(
      "Skin",
      (4, 0, 2, 2),
      (439, 374 + 126 * 2 + 1, 36, 36),
      ~flip=#Vertical,
      (),
    )
    Generator.drawImage("Page2Holes", (0, 0))

    Generator.usePage("Page 3")
    Generator.drawImage("MPage3", (0, 0))

    Generator.drawTexture("Skin", (2, 2, 2, 14), (62, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (62 - 37, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (62 + 37, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (62 + 37 * 2, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (62, 39 - 37, 36, 36), ())
    Generator.drawTexture("Skin", (4, 0, 2, 2), (62, 39 + 126 * 2 + 1, 36, 36), ~flip=#Vertical, ())

    Generator.drawTexture("Skin", (2, 2, 2, 14), (238, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (238 - 37, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (238 + 37, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (238 + 37 * 2, 39, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (238, 39 - 37, 36, 36), ())
    Generator.drawTexture(
      "Skin",
      (4, 0, 2, 2),
      (238, 39 + 126 * 2 + 1, 36, 36),
      ~flip=#Vertical,
      (),
    )

    Generator.drawTexture("Skin", (2, 2, 2, 14), (63, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (63 - 37, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (63 + 37, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (63 + 37 * 2, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (63, 375 - 37, 36, 36), ())
    Generator.drawTexture(
      "Skin",
      (4, 0, 2, 2),
      (63, 375 + 126 * 2 + 1, 36, 36),
      ~flip=#Vertical,
      (),
    )

    Generator.drawTexture("Skin", (2, 2, 2, 14), (239, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (0, 2, 2, 14), (239 - 37, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (4, 2, 2, 14), (239 + 37, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (6, 2, 2, 14), (239 + 37 * 2, 375, 36, 126 * 2), ())
    Generator.drawTexture("Skin", (2, 0, 2, 2), (239, 375 - 37, 36, 36), ())
    Generator.drawTexture(
      "Skin",
      (4, 0, 2, 2),
      (239, 375 + 126 * 2 + 1, 36, 36),
      ~flip=#Vertical,
      (),
    )
    Generator.drawImage("Page3Holes", (0, 0))
  }
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
}
