module TexturePicker = MinecraftDiorama_TexturePicker
module Textures = MinecraftDiorama_Textures
module Face = MinecraftDiorama_Face

type region = (int, int, int, int)

module Diorama = {
  module Regions = {
    type faces = {
      top: region,
      bottom: region,
      right: region,
      front: region,
      left: region,
      back: region,
    }

    let size = 128

    let make = (ox, oy): faces => {
      top: (ox + size, oy + 0, size, size),
      bottom: (ox + size, oy + size * 2, size, size),
      right: (ox, oy + size, size, size),
      front: (ox + size, oy + size, size, size),
      left: (ox + size * 2, oy + size, size, size),
      back: (ox + size * 3, oy + size, size, size),
    }
  }

  let draw = (ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("DioramaFaceTop", regions.top)
    Face.defineInputRegion("DioramaFaceBottom", regions.bottom)
    Face.defineInputRegion("DioramaFaceRight", regions.right)
    Face.defineInputRegion("DioramaFaceFront", regions.front)
    Face.defineInputRegion("DioramaFaceLeft", regions.left)
    Face.defineInputRegion("DioramaFaceBack", regions.back)

    Face.draw("DioramaFaceTop", (0, 0, 16, 16), regions.top, ())
    Face.draw("DioramaFaceBottom", (0, 0, 16, 16), regions.bottom, ())
    Face.draw("DioramaFaceRight", (0, 0, 16, 16), regions.right, ())
    Face.draw("DioramaFaceFront", (0, 0, 16, 16), regions.front, ())
    Face.draw("DioramaFaceLeft", (0, 0, 16, 16), regions.left, ())
    Face.draw("DioramaFaceBack", (0, 0, 16, 16), regions.back, ())

    Generator.drawImage("Tabs-Diorama", (ox - 32, oy - 1))

    if showFolds {
      Generator.drawImage("Folds-Diorama", (ox - 32, oy - 1))
    }
  }
}

module Free = {
  module Regions = {
    type faces = {
      a1: region,
      a2: region,
      a3: region,
      a4: region,
      b1: region,
      b2: region,
      b3: region,
      b4: region,
      c1: region,
      c2: region,
      c3: region,
      c4: region,
      d1: region,
      d2: region,
      d3: region,
      d4: region,
      e1: region,
      e2: region,
      e3: region,
      e4: region,
      f1: region,
      f2: region,
      f3: region,
      f4: region,
    }

    let size = 128

    let make = (ox, oy): faces => {
      a1: (ox + size * 0, oy + size * 0, size, size),
      a2: (ox + size * 1, oy + size * 0, size, size),
      a3: (ox + size * 2, oy + size * 0, size, size),
      a4: (ox + size * 3, oy + size * 0, size, size),
      b1: (ox + size * 0, oy + size * 1, size, size),
      b2: (ox + size * 1, oy + size * 1, size, size),
      b3: (ox + size * 2, oy + size * 1, size, size),
      b4: (ox + size * 3, oy + size * 1, size, size),
      c1: (ox + size * 0, oy + size * 2, size, size),
      c2: (ox + size * 1, oy + size * 2, size, size),
      c3: (ox + size * 2, oy + size * 2, size, size),
      c4: (ox + size * 3, oy + size * 2, size, size),
      d1: (ox + size * 0, oy + size * 3, size, size),
      d2: (ox + size * 1, oy + size * 3, size, size),
      d3: (ox + size * 2, oy + size * 3, size, size),
      d4: (ox + size * 3, oy + size * 3, size, size),
      e1: (ox + size * 0, oy + size * 4, size, size),
      e2: (ox + size * 1, oy + size * 4, size, size),
      e3: (ox + size * 2, oy + size * 4, size, size),
      e4: (ox + size * 3, oy + size * 4, size, size),
      f1: (ox + size * 0, oy + size * 5, size, size),
      f2: (ox + size * 1, oy + size * 5, size, size),
      f3: (ox + size * 2, oy + size * 5, size, size),
      f4: (ox + size * 3, oy + size * 5, size, size),
    }
  }

  let draw = (ox: int, oy: int, showFolds: bool) => {
    let regions = Regions.make(ox, oy)

    Face.defineInputRegion("FreeFaceA1", regions.a1)
    Face.defineInputRegion("FreeFaceA2", regions.a2)
    Face.defineInputRegion("FreeFaceA3", regions.a3)
    Face.defineInputRegion("FreeFaceA4", regions.a4)
    Face.defineInputRegion("FreeFaceB1", regions.b1)
    Face.defineInputRegion("FreeFaceB2", regions.b2)
    Face.defineInputRegion("FreeFaceB3", regions.b3)
    Face.defineInputRegion("FreeFaceB4", regions.b4)
    Face.defineInputRegion("FreeFaceC1", regions.c1)
    Face.defineInputRegion("FreeFaceC2", regions.c2)
    Face.defineInputRegion("FreeFaceC3", regions.c3)
    Face.defineInputRegion("FreeFaceC4", regions.c4)
    Face.defineInputRegion("FreeFaceD1", regions.d1)
    Face.defineInputRegion("FreeFaceD2", regions.d2)
    Face.defineInputRegion("FreeFaceD3", regions.d3)
    Face.defineInputRegion("FreeFaceD4", regions.d4)
    Face.defineInputRegion("FreeFaceE1", regions.e1)
    Face.defineInputRegion("FreeFaceE2", regions.e2)
    Face.defineInputRegion("FreeFaceE3", regions.e3)
    Face.defineInputRegion("FreeFaceE4", regions.e4)
    Face.defineInputRegion("FreeFaceF1", regions.f1)
    Face.defineInputRegion("FreeFaceF2", regions.f2)
    Face.defineInputRegion("FreeFaceF3", regions.f3)
    Face.defineInputRegion("FreeFaceF4", regions.f4)

    Face.draw("FreeFaceA1", (0, 0, 16, 16), regions.a1, ())
    Face.draw("FreeFaceA2", (0, 0, 16, 16), regions.a2, ())
    Face.draw("FreeFaceA3", (0, 0, 16, 16), regions.a3, ())
    Face.draw("FreeFaceA4", (0, 0, 16, 16), regions.a4, ())
    Face.draw("FreeFaceB1", (0, 0, 16, 16), regions.b1, ())
    Face.draw("FreeFaceB2", (0, 0, 16, 16), regions.b2, ())
    Face.draw("FreeFaceB3", (0, 0, 16, 16), regions.b3, ())
    Face.draw("FreeFaceB4", (0, 0, 16, 16), regions.b4, ())
    Face.draw("FreeFaceC1", (0, 0, 16, 16), regions.c1, ())
    Face.draw("FreeFaceC2", (0, 0, 16, 16), regions.c2, ())
    Face.draw("FreeFaceC3", (0, 0, 16, 16), regions.c3, ())
    Face.draw("FreeFaceC4", (0, 0, 16, 16), regions.c4, ())
    Face.draw("FreeFaceD1", (0, 0, 16, 16), regions.d1, ())
    Face.draw("FreeFaceD2", (0, 0, 16, 16), regions.d2, ())
    Face.draw("FreeFaceD3", (0, 0, 16, 16), regions.d3, ())
    Face.draw("FreeFaceD4", (0, 0, 16, 16), regions.d4, ())
    Face.draw("FreeFaceE1", (0, 0, 16, 16), regions.e1, ())
    Face.draw("FreeFaceE2", (0, 0, 16, 16), regions.e2, ())
    Face.draw("FreeFaceE3", (0, 0, 16, 16), regions.e3, ())
    Face.draw("FreeFaceE4", (0, 0, 16, 16), regions.e4, ())
    Face.draw("FreeFaceF1", (0, 0, 16, 16), regions.f1, ())
    Face.draw("FreeFaceF2", (0, 0, 16, 16), regions.f2, ())
    Face.draw("FreeFaceF3", (0, 0, 16, 16), regions.f3, ())
    Face.draw("FreeFaceF4", (0, 0, 16, 16), regions.f4, ())
    //Generator.drawImage("Tabs-Diorama", (ox - 32, oy - 1))

    //if showFolds {
    //  Generator.drawImage("Folds-Diorama", (ox - 32, oy - 1))
    //}
  }
}
