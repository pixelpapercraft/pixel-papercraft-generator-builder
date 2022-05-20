module Builder = Generator_Builder

let getTexturePixelAlpha = (texture: string, x: int, y: int) =>
  switch Generator.getTexturePixelColor(texture, x, y) {
  | None => 0
  | Some(color) => {
      let (_, _, _, a) = color
      a
    }
  }
let isPixelTransparent = (texture: string, x: int, y: int) => {
  getTexturePixelAlpha(texture, x, y) == 0
}

let drawFoldPixel = ((x, y, w, h), ~axis: bool) => {
  let v = axis ? x : y
  if mod(v - 1, 4) <= 1 && mod(v - 1, 4) > -1 {
    Generator.drawImage("Fold", (x + w, y + h))
  }
}

let drawTextureWithFolds = (
  id: string,
  source: Builder.rectangle,
  dest: Builder.rectangle,
  ~flip: Builder.Texture.flip=#None,
  ~blend: Builder.Texture.blend=#None,
  ~rotateLegacy: float=0.0,
  ~rotate: float=0.0,
  ~pixelate: bool=false,
  (),
) => {
  Generator.drawTexture(id, source, dest, ~flip, ~rotate, ~rotateLegacy, ~blend, ~pixelate, ())

  // Draw Folds
  let (sx, sy, sw, sh) = source
  let (dx, dy, dw, dh) = dest

  let empty = (w: int, h: int) => isPixelTransparent(id, w, h)
  let ch = dh / sh
  let cw = dw / sw

  /* for every pixel in the destination width
        for every pixel in the destination height
            if the corresponding source pixel on the current destination pixel is empty
                if the corresponding source pixel for the destination pixel to the left or right of the current destination pixel is empty, and the left or right is not the edge
                    draw fold pixel at the current destination space
 */

  for w in sx * cw to dw - 1 {
    for h in sy * ch to dh - 1 {
      // Inside Edges
      if empty(w / cw, h / ch) {
        if (
          (!empty((w - 1) / cw, h / ch) && w - 1 >= sx) ||
            (!empty((w + 1) / cw, h / ch) && w + 1 <= dw - 1)
        ) {
          drawFoldPixel((w - sx * cw, h - sy * ch, dx, dy), ~axis=false)
        }
        if (
          (!empty(w / cw, (h - 1) / ch) && h - 1 <= dh - 1) ||
            (!empty(w / cw, (h + 1) / ch) && h + 1 >= sy)
        ) {
          drawFoldPixel((w - sx * cw, h - sy * ch, dx, dy), ~axis=true)
        }
      }
      // Outside Edges
      if !empty(w / cw, h / ch) {
        if w == dw - 1 {
          drawFoldPixel((w + 1 - sx * cw, h - sy * ch, dx, dy), ~axis=false) // w + 1
        }
        if w == sx * cw {
          drawFoldPixel((w - 1 - sx * cw, h - sy * ch, dx, dy), ~axis=false) // w - 1
        }
        if h == dh - 1 {
          drawFoldPixel((w - sx * cw, h + 1 - sy * ch, dx, dy), ~axis=true) // h + 1
        }
        if h == sy * ch {
          drawFoldPixel((w - sx * cw, h - 1 - sy * ch, dx, dy), ~axis=true) // h - 1
        }
      }
    }
  }
}

let drawFolds = (texture: string, x: int, y: int) => {
  let empty = (w: int, h: int) => isPixelTransparent(texture, w, h)
  for w in 0 to 15 {
    for h in 0 to 15 {
      if empty(w, h) && !empty(w, h - 1) && h - 1 <= 15 {
        Generator.drawTexture("Fold", (0, 0, 8, 1), (x + w * 8, y + h * 8, 8, 1), ()) // Top Folds
      }
      if empty(w, h) && !empty(w, h + 1) && h + 1 >= 0 {
        Generator.drawTexture(
          "Fold",
          (0, 0, 8, 1),
          (x + w * 8, y + (h + 1) * 8, 8, 1),
          ~rotate=180.0,
          (),
        ) // Bottom Folds
      }
      if empty(w, h) && !empty(w - 1, h) && w - 1 >= 0 {
        Generator.drawTexture(
          "Fold",
          (0, 0, 8, 1),
          (x - 4 + w * 8, y + 4 + h * 8, 8, 1),
          ~rotate=-90.0,
          (),
        ) // Left Folds
      }
      if empty(w, h) && !empty(w + 1, h) && w + 1 <= 15 {
        Generator.drawTexture(
          "Fold",
          (0, 0, 8, 1),
          (x + 4 + w * 8, y + 4 + h * 8, 8, 1),
          ~rotate=90.0,
          (),
        ) // Right Folds
      }

      // Outside Edges
      if !empty(w, h) && h >= 15 {
        Generator.drawTexture("Fold", (0, 0, 8, 8), (x + w * 8, y + (h + 1) * 8, 8, 8), ()) // Top Folds
      }
      if !empty(w, h) && h <= 0 {
        Generator.drawTexture(
          "Fold",
          (0, 0, 8, 8),
          (x + w * 8, y + (h - 1) * 8, 8, 8),
          ~rotate=180.0,
          (),
        ) // Bottom Folds
      }
      if !empty(w, h) && w >= 15 {
        Generator.drawTexture(
          "Fold",
          (0, 0, 8, 8),
          (x + (w + 1) * 8, y + h * 8, 8, 8),
          ~rotate=-90.0,
          (),
        ) // Left Folds
      }
      if !empty(w, h) && w <= 0 {
        Generator.drawTexture(
          "Fold",
          (0, 0, 8, 8),
          (x + (w - 1) * 8, y + h * 8, 8, 8),
          ~rotate=90.0,
          (),
        ) // Right Folds
      }
    }
  }
}
