module TexturePicker = MinecraftDiorama_TexturePicker
module Textures = MinecraftDiorama_Textures
module Face = MinecraftDiorama_Face

type region = (int, int, int, int)
type face = (string, region)

module Diorama = {
  module Regions = {
    let make = (ox, oy, size, cols, rows): array<face> => {
      let regions = ref([])
      for c in 0 to cols - 1 {
        for r in 0 to rows - 1 {
          let face = (
            "DioramaFace" ++ Belt.Int.toString(c) ++ Belt.Int.toString(r),
            (ox + size * c, oy + size * r, size, size),
          )
          regions := Belt.Array.concat(regions.contents, [face])
        }
      }
      regions.contents
    }
  }

  let draw = (ox: int, oy: int, size: int, cols: int, rows: int) => {
    let regions = Regions.make(ox, oy, size, cols, rows)

    Belt.Array.forEach(regions, face => {
      let (faceName, faceRegion) = face
      Face.defineInputRegion(faceName, faceRegion)
      Face.draw(faceName, (0, 0, 16, 16), faceRegion, ())
    })
    //Generator.drawImage("Tabs-Diorama", (ox - 32, oy - 1))

    //if showFolds {
    //  Generator.drawImage("Folds-Diorama", (ox - 32, oy - 1))
    //}
  }
}
