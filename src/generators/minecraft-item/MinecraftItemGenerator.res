module Markdown = Generator.Markdown
module TexturePicker = MinecraftItem_TexturePicker
module TextureVersions = MinecraftItem_TextureVersions

let id = "minecraft-item"

let name = "Minecraft Item"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-256.jpeg"),
}

let instructions = `
## Item Sizes

The generator supports four standard sizes:

* **Medium** - Good for general items (400% scale)
* **Large** - Good for weapons and tools (700% scale)
* **Small** - Good for blocks as items (200% scale)
* **Full Page** - For fun large size items
`

let images: array<Generator.imageDef> = [
  {id: "Background", url: Generator.requireImage("./images/Background.png")},
  {id: "Title", url: Generator.requireImage("./images/Title.png")},
]

let textures: array<Generator.textureDef> = Js.Array.concat(
  TextureVersions.allTextureDefs,
  [
    {
      id: "CenterFold",
      url: Generator.requireImage("./item-textures/CenterFold.png"),
      standardWidth: 2,
      standardHeight: 128,
    },
  ],
)

let drawItem = (id, rectangle, x, y, size, showFolds) => {
  // Define the Texture Offset Variable
  let textureOffset =
    Generator.getSelectInputValue("Texture Offset" ++ Js.Int.toString(x) ++ Js.Int.toString(y))
    ->Belt.Int.fromString
    ->Belt.Option.getWithDefault(0)
  let cycleTextureOffset = t => {
    let t = if t === 16 {
      0
    } else {
      t + 1
    }
    Belt.Int.toString(t)
  }
  Generator.defineRegionInput((x, y, size, size), () => {
    Generator.setSelectInputValue(
      "Texture Offset" ++ Js.Int.toString(x) ++ Js.Int.toString(y),
      cycleTextureOffset(textureOffset),
    )
  })

  let offset = textureOffset * size / 16

  Generator.drawTexture(id, rectangle, (x + offset, y, size, size), ())
  Generator.drawTexture(id, rectangle, (x + size - offset, y, size, size), ~flip=#Horizontal, ())
  if showFolds {
    Generator.drawTexture("CenterFold", (0, 0, 2, size), (x + size - 1, y, 2, size), ())
  }
}

let drawItems = (
  ~selectedTextureFrames: array<TextureVersions.selectedTextureFrame>,
  ~size: int,
  ~border: int,
  ~maxCols: int,
  ~maxRows: int,
  ~folds: bool,
) => {
  let maxItems = maxCols * maxRows

  // Draw the page backgrounds
  let addedCount = Belt.Array.length(selectedTextureFrames)
  let pageCount = addedCount > 0 ? (addedCount - 1) / maxItems + 1 : 0

  for page in 1 to pageCount {
    Generator.usePage("Page " ++ Belt.Int.toString(page))
    Generator.drawImage("Background", (0, 0))
  }

  // Draw the added textures
  Belt.Array.forEachWithIndex(selectedTextureFrames, (index, selectedTextureFrame) => {
    let {textureDefId, frame} = selectedTextureFrame

    let page = index / maxItems + 1
    let pageId = "Page " ++ Belt.Int.toString(page)

    let col = mod(index, maxCols)
    let row = mod(index / maxCols, maxRows)

    let x = col * size * 2
    let x = col > 0 ? x + border * col : x
    let x = border + x

    let y = row * size
    let y = row > 0 ? y + border * row : y
    let y = border + y

    Generator.usePage(pageId)
    drawItem(textureDefId, frame.rectangle, x, y, size, folds)
    Generator.drawImage("Title", (0, 0))
  })
}

let drawSmall = (
  selectedTextureFrames: array<TextureVersions.selectedTextureFrame>,
  showFolds: bool,
) => {
  drawItems(
    ~selectedTextureFrames,
    ~size=16 * 2,
    ~border=25,
    ~maxCols=6,
    ~maxRows=13,
    ~folds=showFolds,
  )
}

let drawMedium = (
  selectedTextureFrames: array<TextureVersions.selectedTextureFrame>,
  showFolds: bool,
) => {
  drawItems(
    ~selectedTextureFrames,
    ~size=16 * 4,
    ~border=15,
    ~maxCols=4,
    ~maxRows=10,
    ~folds=showFolds,
  )
}

let drawLarge = (
  selectedTextureFrames: array<TextureVersions.selectedTextureFrame>,
  showFolds: bool,
) => {
  drawItems(
    ~selectedTextureFrames,
    ~size=16 * 7,
    ~border=20,
    ~maxCols=2,
    ~maxRows=6,
    ~folds=showFolds,
  )
}

let drawFullPage = (selectedTextureFrames: array<TextureVersions.selectedTextureFrame>) => {
  let size = 16 * 8 * 4
  let border = 30

  // Draw the page backgrounds
  let addedCount = Belt.Array.length(selectedTextureFrames)
  let pageCount = addedCount * 2

  for page in 1 to pageCount {
    Generator.usePage("Page " ++ Belt.Int.toString(page))
    Generator.drawImage("Background", (0, 0))
  }

  // Draw the added textures
  Belt.Array.forEachWithIndex(selectedTextureFrames, (index, selectedTextureFrame) => {
    let {textureDefId, frame} = selectedTextureFrame

    let x = border
    let y = border

    let page1 = index * 2 + 1
    let page1Id = "Page " ++ Belt.Int.toString(page1)

    let page2 = index * 2 + 2
    let page2Id = "Page " ++ Belt.Int.toString(page2)

    Generator.usePage(page1Id)
    Generator.drawTexture(textureDefId, frame.rectangle, (x, y, size, size), ())
    Generator.drawImage("Title", (0, 0))

    Generator.usePage(page2Id)
    Generator.drawTexture(textureDefId, frame.rectangle, (x, y, size, size), ~flip=#Horizontal, ())
    Generator.drawImage("Title", (0, 0))
  })
}

let sizeSmall = "Small (200%)"
let sizeMedium = "Medium (400%)"
let sizeLarge = "Large (700%)"
let sizeFullPage = "Full Page"

let sizes = [sizeMedium, sizeLarge, sizeSmall, sizeFullPage]

let script = () => {
  // Show a drop down of different texture versions
  Generator.defineSelectInput("Version", TextureVersions.versionIds)
  let versionId = Generator.getSelectInputValue("Version")

  // Get the current selected version
  let textureVersion = TextureVersions.findVersion(versionId)

  // Show a drop down of sizes
  Generator.defineSelectInput("Size", sizes)
  let size = Generator.getSelectInputValue("Size")

  // Show the Texture Picker
  // When a texture is selected, we need to encode it into a string variable
  Generator.defineCustomStringInput("SelectedTextureFrame", (onChange: string => unit) => {
    <TexturePicker
      textureVersion
      onSelect={frame => {
        onChange(Generator_TextureFrame.encodeFrame(frame))
      }}
    />
  })

  // Define the Show Folds Variable
  Generator.defineBooleanInput("Show Folds", true)

  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Decode the selected texture
  let selectedTextureFrame = Generator_TextureFrame.decodeFrame(
    Generator.getStringInputValue("SelectedTextureFrame"),
  )

  // Decode the added textures
  let selectedTextureFrames = TextureVersions.decodeSelectedTextureFrames(
    Generator.getStringInputValue("SelectedTextureFrames"),
  )

  // Show a button which adds the selected texture to the page
  Generator.defineButtonInput("Add Item", () => {
    switch (textureVersion, selectedTextureFrame) {
    | (Some(textureVersion), Some(selectedTextureFrame)) => {
        let textureToAdd: TextureVersions.selectedTextureFrame = {
          textureDefId: textureVersion.textureDef.id,
          frame: selectedTextureFrame,
        }
        let selectedTextureFrames = Belt.Array.concat(selectedTextureFrames, [textureToAdd])
        Generator.setStringInputValue(
          "SelectedTextureFrames",
          TextureVersions.encodeSelectedTextureFrames(selectedTextureFrames),
        )
      }
    | _ => ()
    }
  })

  // Show a button which allows the items to be cleared
  Generator.defineButtonInput("Clear", () => {
    Generator.setStringInputValue(
      "SelectedTextureFrames",
      TextureVersions.encodeSelectedTextureFrames([]),
    )
  })

  // Show a blank page initially
  if Belt.Array.length(selectedTextureFrames) === 0 {
    Generator.usePage("Page 1")
    Generator.drawImage("Background", (0, 0))
    Generator.drawImage("Title", (0, 0))
  }

  if size === sizeSmall {
    drawSmall(selectedTextureFrames, showFolds)
  } else if size === sizeMedium {
    drawMedium(selectedTextureFrames, showFolds)
  } else if size === sizeLarge {
    drawLarge(selectedTextureFrames, showFolds)
  } else if size === sizeFullPage {
    drawFullPage(selectedTextureFrames)
  } else {
    drawMedium(selectedTextureFrames, showFolds)
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Markdown> {instructions} </Markdown>),
  images: images,
  textures: textures,
  script: script,
}
