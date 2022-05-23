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

let drawFold = (c: (int, int)) => {
  let (x, y) = c
  Generator.drawImage("Fold", (x, y))
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
  Belt.Array.forEach(foldCoords.contents, c => drawFold(c))
}
