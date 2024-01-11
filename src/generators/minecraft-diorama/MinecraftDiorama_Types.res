module TexturePicker = MinecraftDiorama_TexturePicker
module Textures = MinecraftDiorama_Textures
module Face = MinecraftDiorama_Face
module Tab = MinecraftDiorama_Tab

type region = (int, int, int, int)
type face = (string, region)
type tab = (string, region, int)

module Diorama = {
  module Regions = {
    let make = (ox, oy, size, cols, rows): array<face> => {
      let regions = ref([])
      for c in 0 to cols - 1 {
        for r in 0 to rows - 1 {
          let face = (
            "DioramaFace" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
            (ox + size * c, oy + size * r, size, size),
          )
          regions := Belt.Array.concat(regions.contents, [face])
        }
      }
      regions.contents
    }
  }

  let draw = (ox: int, oy: int, size: int, cols: int, rows: int, editTabs: bool) => {
    let regions = Regions.make(ox, oy, size, cols, rows)

    Belt.Array.forEach(regions, face => {
      let (faceName, faceRegion) = face
      if !editTabs {
        Face.defineInputRegion(faceName, faceRegion)
      }
      Face.draw(faceName, (0, 0, 16, 16), faceRegion, ())
    })
  }
}

module Tabs = {
  module Regions = {
    let make = (ox, oy, size, cols, rows): array<tab> => {
      let regions = ref([])
      let makeNorth = (c, r) => {
        (
          "TabsFaceNorth" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * r, size, size / 4),
          2,
        )
      }
      let makeSouth = (c, r) => {
        (
          "TabsFaceSouth" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * 3 / 4 + size * r, size, size / 4),
          0,
        )
      }
      let makeEast = (c, r) => {
        (
          "TabsFaceEast" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * r, size / 4, size),
          1,
        )
      }
      let makeWest = (c, r) => {
        (
          "TabsFaceWest" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * 3 / 4 + size * c, oy + size * r, size / 4, size),
          3,
        )
      }
      let makeTabs = (c, r) => {
        let north = makeNorth(c, r)
        let south = makeSouth(c, r)
        let east = makeEast(c, r)
        let west = makeWest(c, r)
        [north, south, east, west]
      }
      // tabs on the grid
      for c in 0 to cols - 1 {
        for r in 0 to rows - 1 {
          let tabs = makeTabs(c, r)
          regions := Belt.Array.concat(regions.contents, tabs)
        }
      }
      // tabs on the edge
      for c in 0 to cols - 1 {
        let tabs = [makeSouth(c, -1)]
        regions := Belt.Array.concat(regions.contents, tabs)
      }
      for r in 0 to rows - 1 {
        let tabs = [makeWest(-1, r)]
        regions := Belt.Array.concat(regions.contents, tabs)
      }
      for r in 0 to rows - 1 {
        let tabs = [makeEast(cols, r)]
        regions := Belt.Array.concat(regions.contents, tabs)
      }
      regions.contents
    }
  }

  let draw = (ox: int, oy: int, size: int, cols: int, rows: int, editTabs: bool) => {
    let regions = Regions.make(ox, oy, size, cols, rows)

    Belt.Array.forEach(regions, tab => {
      let (tabName, tabRegion, tabRot) = tab
      let tabValue = Generator.getBooleanInputValue(tabName)
      if editTabs {
        Generator.defineRegionInput(tabRegion, () => {
          Generator.setBooleanInputValue(tabName, !tabValue)
        })
      }

      //Face.draw(tabName, (0, 0, 16, 16), tabRegion, ())
      //Generator.drawTexture("Tab", (0, 0, 128, 128), tabRegion, ())
      if tabValue {
        Tab.draw(tabRegion, tabRot, ())
      }
    })
  }
}
