module Builder = Generator_Builder
module PageSize = Generator_PageSize
module Markdown = Generator_Markdown

@val external requireImage: string => string = "require"

type imageDef = Builder.imageDef
type textureDef = Builder.textureDef
type generatorDef = Builder.generatorDef
type thumnbnailDef = Builder.thumnbnailDef
type videoDef = Builder.videoDef
type instructionsDef = Builder.instructionsDef

let model = ref(Builder.Model.make())

let setModel = newModel => {
  model := newModel
}

let getModel = () => model.contents

let setStringVariable = (id, value) => {
  model := Builder.setStringVariable(model.contents, id, value)
}

let getStringVariable = id => {
  Builder.getStringVariable(model.contents, id)
}

let setIntegerVariable = (id, value) => {
  model := Builder.setIntegerVariable(model.contents, id, value)
}

let getIntegerVariable = id => {
  Builder.getIntegerVariable(model.contents, id)
}

let setFloatVariable = (id, value) => {
  model := Builder.setFloatVariable(model.contents, id, value)
}

let getFloatVariable = id => {
  Builder.getFloatVariable(model.contents, id)
}

let setBooleanVariable = (id, value) => {
  model := Builder.setBooleanVariable(model.contents, id, value)
}

let getBooleanVariable = id => {
  Builder.getBooleanVariable(model.contents, id)
}

let getPagePixelColor = (id, x, y) => {
  Builder.getPagePixelColor(model.contents, id, x, y)
}

let getCurrentPagePixelColor = (x, y) => {
  Builder.getCurrentPagePixelColor(model.contents, x, y)
}

let getTexturePixelColor = (id, x, y) => {
  Builder.getTexturePixelColor(model.contents, id, x, y)
}

let getImagePixelColor = (id, x, y) => {
  Builder.getImagePixelColor(model.contents, id, x, y)
}

let clearStringInputValues = () => {
  model := Builder.clearStringInputValues(model.contents)
}

let defineButtonInput = (id, onClick) => {
  model := Builder.defineButtonInput(model.contents, id, onClick)
}

let defineRegionInput = (region, callback) => {
  model := Builder.defineRegionInput(model.contents, region, callback)
}

let defineCustomStringInput = (id, fn) => {
  model := Builder.defineCustomStringInput(model.contents, id, fn)
}

let getStringInputValue = (id: string) => {
  Builder.getStringInputValue(model.contents, id)
}

let setStringInputValue = (id: string, value: string) => {
  model := Builder.setStringInputValue(model.contents, id, value)
}

let getBooleanInputValue = (id: string) => {
  Builder.getBooleanInputValue(model.contents, id)
}

let setBooleanInputValue = (id, value) => {
  model := Builder.setBooleanInputValue(model.contents, id, value)
}

let defineBooleanInput = (id, initial) => {
  model := Builder.defineBooleanInput(model.contents, id, initial)
}

let defineAndGetBooleanInput = (id, initial) => {
  defineBooleanInput(id, initial)
  getBooleanInputValue(id)
}

let getBooleanInputValueWithDefault = (id: string, default: bool) => {
  Builder.getBooleanInputValueWithDefault(model.contents, id, default)
}

let setSelectInputValue = (id, value) => {
  model := Builder.setSelectInputValue(model.contents, id, value)
}

let getSelectInputValue = (id: string) => {
  Builder.getSelectInputValue(model.contents, id)
}

let defineSelectInput = (id, options) => {
  model := Builder.defineSelectInput(model.contents, id, options)
}

let defineAndGetSelectInput = (id, options) => {
  defineSelectInput(id, options)
  getSelectInputValue(id)
}

let getRangeInputValue = (id: string) => {
  Builder.getRangeInputValue(model.contents, id)
}

let defineRangeInput = (id: string, options) => {
  model := Builder.defineRangeInput(model.contents, id, options)
}

let defineAndGetRangeInput = (id: string, options) => {
  defineRangeInput(id, options)
  getRangeInputValue(id)
}

let defineTextureInput = (id: string, options) => {
  model := Builder.defineTextureInput(model.contents, id, options)
}

let defineText = (text: string) => {
  model := Builder.defineText(model.contents, text)
}

let usePage = id => {
  model := Builder.usePage(model.contents, id)
}

let fillBackgroundColor = (color: string) => {
  model := Generator_Builder.fillBackgroundColor(model.contents, color)
}

let fillBackgroundColorWithWhite = () => {
  model := Generator_Builder.fillBackgroundColor(model.contents, "#ffffff")
}

let fillRect = (dest: Builder.rectangle, color: string) => {
  model := Generator_Builder.fillRect(model.contents, dest, color)
}

let drawLine = (
  from: Builder.position,
  to: Builder.position,
  ~color: string="#000000",
  ~width: int=1,
  /* ~pattern: array<int>=[],
   ~offset: int=0, */
  (),
) => {
  model :=
    Generator_Builder.drawLine(model.contents, from, to, ~color, ~width, ~pattern=[], ~offset=0)
}

let drawFoldLine = (from: Builder.position, to: Builder.position) => {
  model :=
    Generator_Builder.drawLine(
      model.contents,
      from,
      to,
      ~color="#7b7b7b",
      ~width=1,
      ~pattern=[2, 2],
      ~offset=3,
    )
}

let drawTexture = (
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
  let rotate = if rotateLegacy !== 0.0 {
    #Corner(rotateLegacy)
  } else if rotate !== 0.0 {
    #Center(rotate)
  } else {
    #None
  }
  model :=
    Builder.drawTexture(model.contents, id, source, dest, ~flip, ~rotate, ~blend, ~pixelate, ())
}

@deprecated("Use Generator.drawTexture")
let drawTextureLegacy = (
  id: string,
  source: Builder.rectangleLegacy,
  dest: Builder.rectangleLegacy,
  ~flip: Generator_Texture.flip=#None,
  ~rotateLegacy: float=0.0,
  ~pixelate: bool=false,
  (),
) => {
  drawTexture(
    id,
    (source.x, source.y, source.w, source.h),
    (dest.x, dest.y, dest.w, dest.h),
    ~flip,
    ~rotateLegacy,
    ~pixelate,
    (),
  )
}

let drawImage = (id: string, position: Builder.position) => {
  model := Builder.drawImage(model.contents, id, position)
}

let hasImage = (id: string) => {
  Builder.hasImage(model.contents, id)
}

let hasTexture = (id: string) => {
  Builder.hasTexture(model.contents, id)
}

let drawText = (text: string, position: Builder.position, size: int) => {
  model := Generator_Builder.drawText(model.contents, text, position, size)
}

module Point = {
  type t = (float, float)

  let toIntPoint = ((x, y): t) => {
    (x->Js.Math.round->Belt.Int.fromFloat, y->Js.Math.round->Belt.Int.fromFloat)
  }

  let translate = ((x, y): t, dx, dy) => {
    (x +. dx, y +. dy)
  }
}

module Angle = {
  let toRadians = degrees => {
    degrees *. (Js.Math._PI /. 180.0)
  }
}

module Orientation = {
  type t = [#North | #South | #East | #West]
}

// Normal
//
//        p3   p4
//    +---+-----+---+        ---
//    |  /       \  |         |
//    | /         \ |         | Actual tab height
//    |/           \|         |
//    +-------------+        ---
//    p1           p4
//
//
// Overflow
//
//     +---------+      ---
//     |         |       |
//     |         |       | Rectangle tab height
//     |         |       |
//     | p2 X p3 |       |    ---
//     |   / \   |       |     |
//     |  /   \  |       |     | Actual tab height
//     | /     \ |       |     |
//     |/       \|       |     |
//     +----+----+      ---   ---
//     p1        p4
//
let drawTab = (
  rectangle: Builder.rectangle,
  orientation: Orientation.t,
  ~showFoldLine: bool=true,
  ~tabAngle: float=45.0,
  (),
) => {
  let (x, y, w, h) = rectangle

  let x = Belt.Int.toFloat(x)
  let y = Belt.Int.toFloat(y)
  let w = Belt.Int.toFloat(w)
  let h = Belt.Int.toFloat(h)

  let tabAngleRad = Angle.toRadians(tabAngle)

  switch orientation {
  | #North => {
      //
      //    p2 ______ p3
      //      /|    |\
      //     / |    | \
      // p1 +--|----|--+ p4
      //

      let maxInset = w /. 2.0
      let inset = h /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, h)
      }

      let p1 = (0.0, h)
      let p2 = (0.0 +. inset, h -. tabHeight)
      let p3 = (w -. inset, h -. tabHeight)
      let p4 = (w, h)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      drawLine(p2, p1, ())
      drawLine(p2, p3, ())
      drawLine(p4, p3, ())

      if showFoldLine {
        drawFoldLine(p4, p1)
      }
    }
  | #East => {
      //
      //  p1
      //   +
      //   | ⟍
      //   |   ⟍  p2
      //   |     |
      //   |     |
      //   |    ⟋ p3
      //   |  ⟋
      //   +
      //  p4
      //

      let maxInset = h /. 2.0
      let inset = w /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, w)
      }

      let p1 = (0.0, 0.0)
      let p2 = (tabHeight, 0.0 +. inset)
      let p3 = (tabHeight, h -. inset)
      let p4 = (0.0, h)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      drawLine(p1, p2, ())
      drawLine(p3, p2, ())
      drawLine(p3, p4, ())

      if showFoldLine {
        drawFoldLine(p1, p4)
      }
    }
  | #South => {
      //
      // p4 +----------+ p1
      //     \         /
      //      \      /
      //    p3 +----+ p2
      //

      let maxInset = w /. 2.0
      let inset = h /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, h)
      }

      let p1 = (w, 0.0)
      let p2 = (w -. inset, tabHeight)
      let p3 = (0.0 +. inset, tabHeight)
      let p4 = (0.0, 0.0)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      drawLine(p2, p1, ())
      drawLine(p2, p3, ())
      drawLine(p4, p3, ())

      if showFoldLine {
        drawFoldLine(p4, p1)
      }
    }
  | #West => {
      //
      //       p4
      //         +
      //       / |
      //  p3 /   |
      //    |    |
      //    |    |
      //  p2 \   |
      //       \ |
      //         +
      //        p1
      //

      let maxInset = h /. 2.0
      let inset = w /. Js.Math.tan(tabAngleRad)

      let (inset, tabHeight) = if inset > maxInset {
        (maxInset, Js.Math.tan(tabAngleRad) *. maxInset)
      } else {
        (inset, w)
      }

      let p1 = (w, h)
      let p2 = (w -. tabHeight, h -. inset)
      let p3 = (w -. tabHeight, 0.0 +. inset)
      let p4 = (w, 0.0)

      let p1 = p1->Point.translate(x, y)->Point.toIntPoint
      let p2 = p2->Point.translate(x, y)->Point.toIntPoint
      let p3 = p3->Point.translate(x, y)->Point.toIntPoint
      let p4 = p4->Point.translate(x, y)->Point.toIntPoint

      drawLine(p1, p2, ())
      drawLine(p3, p2, ())
      drawLine(p3, p4, ())

      if showFoldLine {
        drawFoldLine(p1, p4)
      }
    }
  }
}
