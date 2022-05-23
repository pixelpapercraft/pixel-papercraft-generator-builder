module Builder = Generator_Builder

let getCurrentPagePixelAlpha = (x: int, y: int) =>
  switch Generator.getCurrentPagePixelColor(x, y) {
  | None => 0
  | Some(color) => {
      let (_, _, _, a) = color
      a
    }
  }
let isCurrentPagePixelTransparent = (x: int, y: int) => {
  getCurrentPagePixelAlpha(x, y) < 255
}

let getTexturePixelAlpha = (texture: string, x: int, y: int) =>
  switch Generator.getTexturePixelColor(texture, x, y) {
  | None => 0
  | Some(color) => {
      let (_, _, _, a) = color
      a
    }
  }
let isTexturePixelTransparent = (texture: string, x: int, y: int) => {
  getTexturePixelAlpha(texture, x, y) == 0
}

let getImagePixelAlpha = (image: string, x: int, y: int) =>
  switch Generator.getImagePixelColor(image, x, y) {
  | None => 0
  | Some(color) => {
      let (_, _, _, a) = color
      a
    }
  }

let drawFoldPixel = ((x, y, w, h), ~axis: bool) => {
  let v = axis ? x : y
  if mod(v - 1, 4) <= 1 && mod(v - 1, 4) > -1 {
    Generator.drawImage("Fold", (x + w, y + h))
  }
}

let drawFold = (x: int, y: int) => {
  Generator.drawImage("Fold", (x, y))
}

let drawFold1 = (c: (int, int)) => {
  let (x, y) = c
  Generator.drawImage("Fold", (x, y))
}

let drawTextureWithFolds = (
  id: string,
  source: Builder.rectangle,
  dest: Builder.rectangle,
  ~flip: Generator_Texture.flip=#None,
  ~blend: Generator_Texture.blend=#None,
  ~rotateLegacy: float=0.0,
  ~rotate: float=0.0,
  ~pixelate: bool=false,
  (),
) => {
  Generator.drawTexture(id, source, dest, ~flip, ~rotate, ~rotateLegacy, ~blend, ~pixelate, ())

  // Draw Folds
  let (sx, sy, sw, sh) = source
  let (dx, dy, dw, dh) = dest

  let empty = (w: int, h: int) => isTexturePixelTransparent(id, w, h)
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

let drawFolds1 = dest => {
  // from x to w, from y to h:
  // if the current pixel is transparent, but any of its nieghbors are not, then draw a fold line at that pixel.
  // Could have variations for the outside edges and for the dotted line, but is overall both very costly,
  // and fails when the fold line is drawn unless the line is made to be slightly transparent, which may or may not ultimately be feasible.

  let (dx, dy, dw, dh) = dest

  let empty = (x: int, y: int) => isCurrentPagePixelTransparent(x, y)

  for w in dx to dx + dw - 1 {
    for h in dy to dy + dh - 1 {
      // Inside Edges
      if empty(w, h) {
        if !empty(w - 1, h) || !empty(w + 1, h) {
          drawFold(w, h)
        }
        if !empty(w, h - 1) || !empty(w, h + 1) {
          drawFold(w, h)
        }
      }
    }
  }
}

let drawFolds = dest => {
  // Idea: If pixel is opaque, then check all points around it and draw on empty points.
  // Saves from having two stages for inside and outside folds, but may require a different solution for
  // fold lines making pixels opaque.

  // Try this: save every point that passes, and after that draw fold lines.
  let (dx, dy, dw, dh) = dest

  let empty = (x: int, y: int) => isCurrentPagePixelTransparent(x, y)

  let foldCoords = ref([])
  //let foldCoords = {
  for w in dx to dx + dw - 1 {
    for h in dy to dy + dh - 1 {
      let stages = [(w - 1, h), (w + 1, h), (w, h - 1), (w, h + 1)]
      if !empty(w, h) {
        for i in 0 to 3 {
          let (cw, ch) = stages[i]
          if empty(cw, ch) {
            foldCoords := Belt.Array.concat(foldCoords.contents, [(cw, ch)])
          }
        }
      }
    }
  }
  //}

  // Draw folds
  Belt.Array.forEach(foldCoords.contents, c => drawFold1(c))
}

/* let drawFolds = dest => {
  // from x to w, from y to h:
  // check if a point is the start of an edge. If it is, then save it in an array.
  // Draw lines between every point pair.
  // This may avoid issues with fold limes already having been drawn, and be easily adaptable to any line drawing functions that are added.

  let (dx, dy, dw, dh) = dest

  let empty = (x: int, y: int) => isCurrentPagePixelTransparent(x, y)

  let endCoords = list{}

  for w in dx to dx + dw - 1 {
    for h in dy to dy + dh - 1 {
      // Inside Edges
      if empty(w, h) {
        if !empty(w - 1, h) || !empty(w + 1, h) {
          let endCoords = 
        }
        if !empty(w, h - 1) || !empty(w, h + 1) {
          drawFold(w, h)
        }
      }
    }
  }
} */
