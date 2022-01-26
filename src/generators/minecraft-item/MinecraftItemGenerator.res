module TexturePicker = MinecraftItem_TexturePicker
module TextureVersions = MinecraftItem_TextureVersions

let id = "minecraft-item"

let name = "Minecraft Item"

let images: array<Generator.imageDef> = [
  {id: "Background", url: Generator.requireImage("./images/Background.png")},
]

let textures: array<Generator.textureDef> = TextureVersions.allTextureDefs

let drawItem = (id, rectangle, x, y, size) => {
  Generator.drawTexture(id, rectangle, (x, y, size, size), ())
  Generator.drawTexture(id, rectangle, (x + size, y, size, size), ~flip=#Horizontal, ())
}

let drawSmall = (selectedTextureFrames: array<TextureVersions.selectedTextureFrame>) => {
  let size = 16 * 8

  let border = 25
  let maxCols = 2
  let maxRows = 5
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
    drawItem(textureDefId, frame.rectangle, x, y, size)
  })
}

let drawMedium = (selectedTextureFrames: array<TextureVersions.selectedTextureFrame>) => {
  let size = 16 * 8 * 2

  let border = 20
  let maxCols = 1
  let maxRows = 3
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
    drawItem(textureDefId, frame.rectangle, x, y, size)
  })
}

let drawLarge = (selectedTextureFrames: array<TextureVersions.selectedTextureFrame>) => {
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

    Generator.usePage(page2Id)
    Generator.drawTexture(textureDefId, frame.rectangle, (x, y, size, size), ~flip=#Horizontal, ())
  })
}

let script = () => {
  // Show a drop down of different texture versions
  Generator.defineSelectInput("Version", TextureVersions.versionIds)
  let versionId = Generator.getSelectInputValue("Version")

  // Get the current selected version
  let textureVersion = TextureVersions.findVersion(versionId)

  // Show a drop down of sizes
  Generator.defineSelectInput("Size", ["Small", "Medium", "Large"])
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

  switch size {
  | "Small" => drawSmall(selectedTextureFrames)
  | "Medium" => drawMedium(selectedTextureFrames)
  | "Large" => drawLarge(selectedTextureFrames)
  | _ => drawSmall(selectedTextureFrames)
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
