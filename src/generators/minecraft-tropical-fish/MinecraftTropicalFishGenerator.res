let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-tropical-fish"

let name = "Minecraft Tropical Fish"

let history = ["June 10 2022 Paper Dog - Initial script developed."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}
let images: array<Generator.imageDef> = [{id: "Foldpiece", url: requireImage("Foldpiece.png")}]

let textures: array<Generator.textureDef> = [
  {
    id: "Fold",
    url: requireTexture("fold"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Kob",
    url: requireTexture("pattern1"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Sunstreak",
    url: requireTexture("pattern2"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Snooper",
    url: requireTexture("pattern3"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Dasher",
    url: requireTexture("pattern4"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Brinely",
    url: requireTexture("pattern5"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Spotty",
    url: requireTexture("pattern6"),
    standardWidth: 32,
    standardHeight: 32,
  },
  {
    id: "Variant1",
    url: requireTexture("variant1"),
    standardWidth: 32,
    standardHeight: 32,
  },
]

module DrawVariant1 = {
  let drawBody = (ox, oy, k, color) => {
    Generator.drawTexture(
      "Variant1",
      (6, 6, 2, 3),
      (ox, oy, k * 2 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      "Variant1",
      (0, 6, 6, 3),
      (ox - k * 8 * 6, oy, k * 6 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      "Variant1",
      (8, 6, 6, 3),
      (ox + k * 8 * 2, oy, k * 6 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      "Variant1",
      (14, 6, 2, 3),
      (ox + k * 8 * 8 + 1, oy, k * 2 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      "Variant1",
      (6, 0, 2, 6),
      (ox, oy - k * 6 * 8, k * 2 * 8, k * 6 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      "Variant1",
      (8, 0, 2, 6),
      (ox, oy + k * 3 * 8, k * 2 * 8, k * 6 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
  }
  let drawPattern = (ox, oy, k, color, texture) => {
    Generator.drawTexture(
      texture,
      (6, 6, 2, 3),
      (ox, oy, k * 2 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (0, 6, 6, 3),
      (ox - k * 8 * 6, oy, k * 6 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (8, 6, 6, 3),
      (ox + k * 8 * 2, oy, k * 6 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (14, 6, 2, 3),
      (ox + k * 8 * 8 + 1, oy, k * 2 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (6, 0, 2, 6),
      (ox, oy - k * 6 * 8, k * 2 * 8, k * 6 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (8, 0, 2, 6),
      (ox, oy + k * 3 * 8, k * 2 * 8, k * 6 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
  }
  let drawFolds = (ox, oy, k) => {
    Generator.drawFoldLine((ox - k * 8 * 6 - 1, oy - 1), (ox + k * 8 * 10 + 2, oy - 1))
    Generator.drawFoldLine(
      (ox - k * 8 * 6 - 1, oy + k * 8 * 3),
      (ox + k * 8 * 10 + 2, oy + k * 8 * 3),
    )
    Generator.drawFoldLine((ox - 1, oy - k * 8 * 6 - 1), (ox - 1, oy + k * 8 * 9))
    Generator.drawFoldLine((ox + k * 8 * 2, oy - k * 8 * 6 - 1), (ox + k * 8 * 2, oy + k * 8 * 9))
    Generator.drawFoldLine((ox - 1, oy - k * 8 * 6 - 1), (ox + k * 8 * 2, oy - k * 8 * 6 - 1))
    Generator.drawFoldLine((ox - 1, oy + k * 8 * 9), (ox + k * 8 * 2, oy + k * 8 * 9))

    Generator.drawFoldLine((ox - k * 8 * 6 - 1, oy - 1), (ox - k * 8 * 6 - 1, oy + k * 8 * 3))
    Generator.drawFoldLine((ox + k * 8 * 10 + 2, oy + k * 8 * 3), (ox + k * 8 * 10 + 2, oy - 1))
    Generator.drawFoldLine((ox + k * 8 * 8 + 1, oy + k * 8 * 3), (ox + k * 8 * 8 + 1, oy - 1))
  }
  let drawAutoFolds = (ox, oy, k) => {
    let x = ox - k * 6 * 8
    let y = oy + 8 * k * 9 + 10

    Generator.fillBackgroundColorWithWhite()
    for i in 0 to 3 * k + k - 1 {
      for j in 0 to 2 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x + i * 8 + 4 + 8, y + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x + i * 8 - 1 + 8, y + j * 8 - 1))
        }
      }
    }
    for i in 0 to k - 1 {
      for j in 0 to 2 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x + i * 8 + 4 + 8 - k * 8 - 1, y + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x + i * 8 - 1 + 8 - k * 8 - 1, y + j * 8 - 1))
        }
      }
    }

    let x1 = ox - k * 6 * 8
    let y1 = oy + 8 * k * 9 + 10 + k * 8 * 3
    for i in 0 to 3 * k + k - 1 {
      for j in 0 to 2 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x1 + 8 + i * 8 + 4, y1 + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x1 + 8 + i * 8 - 1, y1 + j * 8))
        }
      }
    }
    for i in 0 to k - 1 {
      for j in 0 to 2 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(
          x1 + 8 + i * 8 + 4 - k * 8 - 1,
          y1 + j * 8 + 4,
        )
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x1 + 8 + i * 8 - 1 - k * 8 - 1, y1 + j * 8))
        }
      }
    }

    let x2 = ox - k * 6 * 8 + k * 8 * 5
    let y2 = y

    for i in 0 to 5 * k + k - 1 {
      for j in 0 to 2 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x2 + i * 8 + 4, y2 + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x2 + i * 8 - 1, y2 + j * 8 - 1))
        }
      }
    }
    for i in 0 to 5 * k + k - 1 {
      for j in 0 to k - 1 {
        let color = Generator.getCurrentPagePixelColor(
          x2 + i * 8 + 4,
          y2 + j * 8 + 4 + 3 * k * 8 + 1,
        )
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x2 + i * 8 - 1, y2 + j * 8 - 1 + 3 * k * 8 + 1))
        }
      }
    }
    let x3 = ox - k * 6 * 8 + k * 8 * 5
    let y3 = y + k * 3 * 8 + 1 + k * 8 * 2 + 2

    for i in 0 to 5 * k + k - 1 {
      for j in 0 to 2 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x3 + i * 8 + 4, y3 + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x3 + i * 8 - 1, y3 + j * 8 - 1))
        }
      }
    }
    for i in 0 to 5 * k + k - 1 {
      for j in 0 to k - 1 {
        let color = Generator.getCurrentPagePixelColor(x3 + i * 8 + 4, y3 + j * 8 + 4 - k * 8 - 1)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x3 + i * 8 - 1, y3 + j * 8 - 1 - k * 8 - 1))
        }
      }
    }

    let x4 = x + k * 8 * 5 + 8 * k * 8
    let y4 = y

    for i in 0 to 1 * k + k - 1 {
      for j in 0 to 1 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x4 + i * 8 + 4, y4 + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x4 + i * 8 - 1, y4 + j * 8 - 1))
        }
      }
    }
    for i in 0 to k - 1 {
      for j in 0 to 1 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(x4 + i * 8 + 4 - 8 * k - 1, y4 + j * 8 + 4)
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x4 + i * 8 - 1 - 8 * k - 1, y4 + j * 8 - 1))
        }
      }
    }

    for i in 0 to 1 * k + k - 1 {
      for j in 0 to 1 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(
          x4 + i * 8 + 4 - 8 * k - 1,
          y4 + j * 8 + 4 + k * 8 * 3,
        )
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage("Foldpiece", (x4 + i * 8 - 1 - 8 * k, y4 + j * 8 - 1 + k * 8 * 3))
        }
      }
    }
    for i in 0 to k - 1 {
      for j in 0 to 1 * k + k - 1 {
        let color = Generator.getCurrentPagePixelColor(
          x4 + i * 8 + 4 - 8 * k - 1 + k * 2 * 8 + 1,
          y4 + j * 8 + 4 + k * 8 * 3,
        )
        let color0 = Generator.getCurrentPagePixelColor(1, 1)
        if !(color == color0) {
          Generator.drawImage(
            "Foldpiece",
            (x4 + i * 8 - 1 - 8 * k + k * 2 * 8 + 1, y4 + j * 8 - 1 + k * 8 * 3),
          )
        }
      }
    }
  }
  let drawTailAndFins = (ox, oy, k, color, texture) => {
    Generator.drawTexture(
      texture,
      (28, 0, 4, 3),
      (ox + 8, oy, k * 4 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (28, 0, 4, 3),
      (ox + 8, oy + k * 3 * 8 + 1, k * 4 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(
      texture,
      (28, 0, 1, 3),
      (ox - k * 8 - 1 + 8, oy, k * 1 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (28, 0, 1, 3),
      (ox - k * 8 - 1 + 8, oy + k * 3 * 8 + 1, k * 1 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      ~flip=#Vertical,
      (),
    )

    Generator.drawTexture(
      texture,
      (16, 1, 6, 3),
      (ox + k * 8 * 5, oy, k * 6 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (16, 1, 6, 3),
      (ox + k * 8 * 5, oy + k * 3 * 8 + 1 + k * 8 * 2 + 2, k * 6 * 8, k * 3 * 8),
      ~blend=#MultiplyHex(color),
      ~flip=#Vertical,
      (),
    )

    Generator.drawTexture(
      texture,
      (16, 3, 6, 1),
      (ox + k * 8 * 5, oy + k * 3 * 8 + 1, k * 6 * 8, k * 1 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (16, 3, 6, 1),
      (ox + k * 8 * 5, oy + k * 4 * 8 + 2, k * 6 * 8, k * 1 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (2, 12, 2, 2),
      (ox + k * 8 * 5 + 8 * k * 8, oy, k * 2 * 8, k * 2 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (2, 12, 1, 2),
      (ox + k * 8 * 5 + 8 * k * 8 - k * 8 - 1, oy, k * 8, k * 2 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (2, 16, 2, 2),
      (ox + k * 8 * 5 + 8 * k * 7, oy + k * 8 * 3, k * 2 * 8, k * 2 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
    Generator.drawTexture(
      texture,
      (3, 16, 1, 2),
      (ox + k * 8 * 5 + 8 * k * 7 + 2 * k * 8 + 1, oy + k * 8 * 3, k * 8, k * 2 * 8),
      ~blend=#MultiplyHex(color),
      (),
    )
  }
}
let script = () => {
  Generator.defineRangeInput("Size", {min: 1, max: 4, step: 1, value: 1})
  let sizemultiplier = Generator.getRangeInputValue("Size")
  Generator.defineSelectInput(
    "Base Fish Color",
    [
      "White",
      "Red",
      "Purple",
      "Aqua",
      "Yellow",
      "Green",
      "Pink",
      "Black",
      "Grey",
      "Dark Cyan",
      "Dark Purple",
      "Dark Blue",
      "Brown",
      "Dark Green",
      "Dark Red",
    ],
  )
  Generator.defineSelectInput(
    "Pattern Fish Color",
    [
      "White",
      "Red",
      "Purple",
      "Aqua",
      "Yellow",
      "Green",
      "Pink",
      "Black",
      "Grey",
      "Dark Cyan",
      "Dark Purple",
      "Dark Blue",
      "Brown",
      "Dark Green",
      "Dark Red",
    ],
  )
  Generator.defineSelectInput(
    "Fish Type",
    ["Kob", "Sunstreak", "Snooper", "Dasher", "Brinely", "Spotty"],
  )
  let basefishColor = switch Generator.getSelectInputValue("Base Fish Color") {
  | "White" => "#FFFFF1"
  | "Red" => "e15b20"
  | "Purple" => "ab309d"
  | "Aqua" => "1c8cc5"
  | "Yellow" => "f3ac33"
  | "Green" => "5daa2f"
  | "Pink" => "d6618d"
  | "Black" => "363a3d"
  | "Grey" => "7c7c73"
  | "Dark Cyan" => "057886"
  | "Dark Purple" => "662399"
  | "Dark Blue" => "2d328d"
  | "Brown" => "623b23"
  | "Dark Green" => "4a5c2a"
  | "Dark Red" => "901b25"

  | _ => "B02E26"
  }
  let patternfishColor = switch Generator.getSelectInputValue("Pattern Fish Color") {
  | "White" => "#FFFFF1"
  | "Red" => "e15b20"
  | "Purple" => "ab309d"
  | "Aqua" => "1c8cc5"
  | "Yellow" => "f3ac33"
  | "Green" => "5daa2f"
  | "Pink" => "d6618d"
  | "Black" => "363a3d"
  | "Grey" => "7c7c73"
  | "Dark Cyan" => "057886"
  | "Dark Purple" => "662399"
  | "Dark Blue" => "2d328d"
  | "Brown" => "623b23"
  | "Dark Green" => "4a5c2a"
  | "Dark Red" => "901b25"

  | _ => "B02E26"
  }
  Generator.defineBooleanInput("Show Extra Folds(Use at the end because of lag)", false)
  let showExtraFolds = Generator.getBooleanInputValue(
    "Show Extra Folds(Use at the end because of lag)",
  )
  let ox = 30 + sizemultiplier * 6 * 8
  let oy = 30 + sizemultiplier * 6 * 8
  DrawVariant1.drawBody(ox, oy, sizemultiplier, basefishColor)
  DrawVariant1.drawPattern(
    ox,
    oy,
    sizemultiplier,
    patternfishColor,
    Generator.getSelectInputValue("Fish Type"),
  )
  DrawVariant1.drawTailAndFins(
    ox - sizemultiplier * 6 * 8,
    oy + 8 * sizemultiplier * 9 + 10,
    sizemultiplier,
    patternfishColor,
    "Variant1",
  )
  DrawVariant1.drawTailAndFins(
    ox - sizemultiplier * 6 * 8,
    oy + 8 * sizemultiplier * 9 + 10,
    sizemultiplier,
    basefishColor,
    Generator.getSelectInputValue("Fish Type"),
  )

  if showExtraFolds == true {
    DrawVariant1.drawAutoFolds(ox, oy, sizemultiplier)
  }
  DrawVariant1.drawTailAndFins(
    ox - sizemultiplier * 6 * 8,
    oy + 8 * sizemultiplier * 9 + 10,
    sizemultiplier,
    patternfishColor,
    "Variant1",
  )
  DrawVariant1.drawTailAndFins(
    ox - sizemultiplier * 6 * 8,
    oy + 8 * sizemultiplier * 9 + 10,
    sizemultiplier,
    basefishColor,
    Generator.getSelectInputValue("Fish Type"),
  )
  DrawVariant1.drawFolds(ox, oy, sizemultiplier)
  Generator.drawTexture(
    "Fold",
    (0, 0, 12, 12),
    (ox - 1, oy - 1, sizemultiplier * 2 * 12, sizemultiplier * 2 * 12),
    (),
  )
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
