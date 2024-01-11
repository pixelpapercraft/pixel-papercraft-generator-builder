module TexturePicker = MinecraftDiorama_TexturePicker
module Textures = MinecraftDiorama_Textures
module Face = MinecraftDiorama_Face
module Tab = MinecraftDiorama_Tab
module Fold = MinecraftDiorama_Fold

type region = (int, int, int, int)
type face = (string, region)
type tab = (string, region, int)
type fold = (string, region, int)

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

  let draw = (ox: int, oy: int, size: int, cols: int, rows: int, editMode: string) => {
    let regions = Regions.make(ox, oy, size, cols, rows)

    Belt.Array.forEach(regions, face => {
      let (faceName, faceRegion) = face
      if editMode == "Blocks" {
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
          "TabsNorth" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * r, size, size / 4),
          2,
        )
      }
      let makeSouth = (c, r) => {
        (
          "TabsSouth" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * 3 / 4 + size * r, size, size / 4),
          0,
        )
      }
      let makeEast = (c, r) => {
        (
          "TabsEast" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * r, size / 4, size),
          1,
        )
      }
      let makeWest = (c, r) => {
        (
          "TabsWest" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
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

  let cycleTabValue = t => {
    let t = if t === 4 {
      0
    } else {
      t + 1
    }
    Belt.Int.toString(t)
  }

  let draw = (ox: int, oy: int, size: int, cols: int, rows: int, editMode: string) => {
    let regions = Regions.make(ox, oy, size, cols, rows)

    Belt.Array.forEach(regions, tab => {
      let (tabName, tabRegion, tabRot) = tab
      let tabValue =
        Generator.getSelectInputValue(tabName)->Belt.Int.fromString->Belt.Option.getWithDefault(0)
      if editMode == "Tabs" {
        Generator.defineRegionInput(tabRegion, () => {
          Generator.setSelectInputValue(tabName, cycleTabValue(tabValue))
        })
      }
      Tab.draw(tabRegion, tabRot, tabValue, ())
    })
  }
}
module Folds = {
  module Regions = {
    let make = (ox, oy, size, cols, rows): array<fold> => {
      let regions = ref([])
      let makeNorth = (c, r) => {
        (
          "FoldsNorth" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * r, size, size / 4),
          2,
        )
      }
      let makeSouth = (c, r) => {
        (
          "FoldsSouth" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * 3 / 4 + size * r, size, size / 4),
          0,
        )
      }
      let makeEast = (c, r) => {
        (
          "FoldsEast" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * c, oy + size * r, size / 4, size),
          1,
        )
      }
      let makeWest = (c, r) => {
        (
          "FoldsWest" ++ Belt.Int.toString(c) ++ " " ++ Belt.Int.toString(r),
          (ox + size * 3 / 4 + size * c, oy + size * r, size / 4, size),
          3,
        )
      }
      let makeFolds = (c, r) => {
        let north = makeNorth(c, r)
        let south = makeSouth(c, r)
        let east = makeEast(c, r)
        let west = makeWest(c, r)
        [north, south, east, west]
      }
      // folds on the grid
      for c in 0 to cols - 1 {
        for r in 0 to rows - 1 {
          let folds = makeFolds(c, r)
          regions := Belt.Array.concat(regions.contents, folds)
        }
      }
      // folds on the edge
      for c in 0 to cols - 1 {
        let folds = [makeSouth(c, -1)]
        regions := Belt.Array.concat(regions.contents, folds)
      }
      for r in 0 to rows - 1 {
        let folds = [makeWest(-1, r)]
        regions := Belt.Array.concat(regions.contents, folds)
      }
      for r in 0 to rows - 1 {
        let folds = [makeEast(cols, r)]
        regions := Belt.Array.concat(regions.contents, folds)
      }
      regions.contents
    }
  }

  let draw = (ox: int, oy: int, size: int, cols: int, rows: int, editMode: string) => {
    let regions = Regions.make(ox, oy, size, cols, rows)

    Belt.Array.forEach(regions, fold => {
      let (foldName, foldRegion, foldRot) = fold
      let foldValue = Generator.getBooleanInputValue(foldName)
      if editMode == "Folds" {
        Generator.defineRegionInput(foldRegion, () => {
          Generator.setBooleanInputValue(foldName, !foldValue)
        })
      }
      if foldValue {
        Fold.draw(foldRegion, foldRot, ())
      }
    })
  }
}
