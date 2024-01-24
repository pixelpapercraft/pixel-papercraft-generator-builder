module Markdown = Generator.Markdown
module TexturePicker = TexturePicker
module TextureVersions = TextureVersions

let id = "minecraft-item"

let name = "Minecraft Item"

let history = [
  "26 Jan 2022 lostminer - First release.",
  "05 Feb 2022 NinjolasNJM - Added fold lines and gap removal feature.",
  "Jan 2024 NinjolasNJM - Now uses the universal texture picker.",
]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
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
      url: Generator.requireImage("./textures/CenterFold.png"),
      standardWidth: 2,
      standardHeight: 128,
    },
  ],
)

let definitions = Belt.Array.concat(
  TextureVersions.blockDefinitions,
  TextureVersions.itemDefinitions,
)

let cycleTextureOffset = (t, tileWidth) => {
  let t = if t === tileWidth {
    0
  } else {
    t + 1
  }
  Belt.Int.toString(t)
}

let makeRegionId = (textureId, rectangle) => {
  let (tileX, tileY, _, _) = rectangle
  textureId ++ "-" ++ Js.Int.toString(tileX) ++ "-" ++ Js.Int.toString(tileY)
}

let getTileWidth = rectangle => {
  let (_, _, tileWidth, _) = rectangle
  tileWidth
}

let drawItem = (textureId, rectangle, x, y, size, showFolds) => {
  let tileWidth = getTileWidth(rectangle)
  let regionId = makeRegionId(textureId, rectangle)

  let textureOffset =
    Generator.getSelectInputValue(regionId)->Belt.Int.fromString->Belt.Option.getWithDefault(0)

  Generator.defineRegionInput((x, y, size, size), () => {
    Generator.setSelectInputValue(regionId, cycleTextureOffset(textureOffset, tileWidth))
  })

  let offset = textureOffset * size / tileWidth

  Generator.drawTexture(textureId, rectangle, (x + offset, y, size, size), ())
  Generator.drawTexture(
    textureId,
    rectangle,
    (x + size - offset, y, size, size),
    ~flip=#Horizontal,
    (),
  )
  if showFolds {
    Generator.drawTexture("CenterFold", (0, 0, 2, size), (x + size - 1, y, 2, size), ())
  }
}

let drawItems = (
  ~selectedTextureFrames: array<TexturePicker.SelectedTexture.t>,
  ~size: int,
  ~border: int,
  ~maxCols: int,
  ~maxRows: int,
  ~showFolds: bool,
) => {
  let maxItems = maxCols * maxRows

  // Draw the page backgrounds
  let addedCount = Belt.Array.length(selectedTextureFrames)
  let pageCount = addedCount > 0 ? (addedCount - 1) / maxItems + 1 : 0

  for page in 1 to pageCount {
    Generator.usePage("Page " ++ Belt.Int.toString(page))
    Generator.drawImage("Background", (0, 0))

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
      drawItem(textureDefId, frame.rectangle, x, y, size, showFolds)
      Generator.drawImage("Title", (0, 0))
    })
  }
}

let drawSmall = (
  selectedTextureFrames: array<TexturePicker.SelectedTexture.t>,
  showFolds: bool,
) => {
  drawItems(~selectedTextureFrames, ~size=16 * 2, ~border=25, ~maxCols=6, ~maxRows=13, ~showFolds)
}

let drawMedium = (
  selectedTextureFrames: array<TexturePicker.SelectedTexture.t>,
  showFolds: bool,
) => {
  drawItems(~selectedTextureFrames, ~size=16 * 4, ~border=15, ~maxCols=4, ~maxRows=10, ~showFolds)
}

let drawLarge = (
  selectedTextureFrames: array<TexturePicker.SelectedTexture.t>,
  showFolds: bool,
) => {
  drawItems(~selectedTextureFrames, ~size=16 * 7, ~border=20, ~maxCols=2, ~maxRows=6, ~showFolds)
}

let drawFullPage = (selectedTextureFrames: array<TexturePicker.SelectedTexture.t>) => {
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
  Generator.defineSelectInput("Version", TextureVersions.versionIds(definitions))
  let versionId = Generator.getSelectInputValue("Version")

  // Get the current selected version
  let textureVersion = TextureVersions.findVersion(versionId, definitions)

  // Show a drop down of sizes
  Generator.defineSelectInput("Size", sizes)
  let size = Generator.getSelectInputValue("Size")

  // Show the Texture Picker
  // When a texture is selected, we need to encode it into a string variable
  Generator.defineCustomStringInput("SelectedTextureFrame", (onChange: string => unit) => {
    <TexturePicker
      textureVersion
      onSelect={selectedTexture => {
        onChange(TexturePicker.SelectedTexture.encode(selectedTexture))
      }}
      enableRotation=false
      enableErase=false
    />
  })

  // Define the Show Folds Variable
  Generator.defineBooleanInput("Show Folds", true)

  let showFolds = Generator.getBooleanInputValue("Show Folds")

  // Decode the selected texture
  let selectedTextureFrame = TexturePicker.SelectedTexture.decode(
    Generator.getStringInputValue("SelectedTextureFrame"),
  )

  // Decode the added textures
  let selectedTextureFrames = TexturePicker.SelectedTexture.decodeArray(
    Generator.getStringInputValue("SelectedTextureFrames"),
  )

  // Show a button which adds the selected texture to the page
  Generator.defineButtonInput("Add Item", () => {
    switch selectedTextureFrame {
    | Some(selectedTextureFrame) => {
        let selectedTextureFrames = Belt.Array.concat(selectedTextureFrames, [selectedTextureFrame])
        Generator.setStringInputValue(
          "SelectedTextureFrames",
          TexturePicker.SelectedTexture.encodeArray(selectedTextureFrames),
        )
      }
    | None => ()
    }
  })

  // Show a button which allows the items to be cleared
  Generator.defineButtonInput("Clear", () => {
    Generator.setStringInputValue(
      "SelectedTextureFrames",
      TexturePicker.SelectedTexture.encodeArray([]),
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
  id,
  name,
  history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Markdown> {instructions} </Markdown>),
  images,
  textures,
  script,
}
