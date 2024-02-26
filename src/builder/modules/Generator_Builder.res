open Dom2

type textureDef = {
  id: string,
  url: string,
  standardWidth: int,
  standardHeight: int,
}

type imageDef = {
  id: string,
  url: string,
}

type thumnbnailDef = {url: string}

type videoDef = {url: string}

type instructionsDef = React.element

type generatorDef = {
  id: string,
  name: string,
  history: array<string>,
  thumbnail: option<thumnbnailDef>,
  video: option<videoDef>,
  instructions: option<instructionsDef>,
  images: array<imageDef>,
  textures: array<textureDef>,
  script: unit => unit,
}

type position = (int, int)

type rectangleLegacy = {
  x: int,
  y: int,
  w: int,
  h: int,
}

type rectangle = (int, int, int, int)

type cuboid = {
  top: rectangle,
  bottom: rectangle,
  front: rectangle,
  right: rectangle,
  left: rectangle,
  back: rectangle,
}

let makeCuboid = ((x, y): position, (w, h, l)): cuboid => {
  top: (x + l, y, w, l),
  bottom: (x + l + w, y, w, l),
  front: (x + l, y + l, w, h),
  right: (x, y + l, l, h),
  left: (x + l + w, y + l, l, h),
  back: (x + l * 2 + w, y + l, w, h),
}

module Input = {
  type rangeArgs = {
    min: int,
    max: int,
    value: int,
    step: int,
  }

  type textureArgs = {
    standardWidth: int,
    standardHeight: int,
    choices: array<string>,
  }

  type id = string
  type pageId = string

  type t =
    | Text(id, string)
    | CustomStringInput(id, (string => unit) => React.element)
    | RegionInput(pageId, (int, int, int, int), unit => unit)
    | SkinInput(id, textureArgs)
    | TextureInput(id, textureArgs)
    | TextInput(id)
    | BooleanInput(id)
    | SelectInput(id, array<string>)
    | RangeInput(id, rangeArgs)
    | ButtonInput(id, unit => unit)
}

module Model = {
  module Variable = {
    type t = [#Integer(int) | #String(string) | #Float(float) | #Boolean(bool)]

    let toString = (value: t) => {
      switch value {
      | #String(value) => Some(value)
      | _ => None
      }
    }

    let toInteger = (value: t) => {
      switch value {
      | #Integer(value) => Some(value)
      | _ => None
      }
    }

    let toFloat = (value: t) => {
      switch value {
      | #Float(value) => Some(value)
      | _ => None
      }
    }

    let toBoolean = (value: t) => {
      switch value {
      | #Boolean(value) => Some(value)
      | _ => None
      }
    }
  }

  type pageRegion = {
    pageId: string,
    region: (int, int, int, int),
  }

  type values = {
    images: Js.Dict.t<Generator_ImageWithCanvas.t>,
    textures: Js.Dict.t<Generator_Texture.t>,
    booleans: Js.Dict.t<bool>,
    selects: Js.Dict.t<string>,
    ranges: Js.Dict.t<int>,
    strings: Js.Dict.t<string>,
    variables: Js.Dict.t<Variable.t>,
  }

  type t = {
    inputs: array<Input.t>,
    pages: array<Generator_Page.t>,
    currentPage: option<Generator_Page.t>,
    values: values,
  }

  let make = () => {
    inputs: [],
    pages: [],
    currentPage: None,
    values: {
      images: Js.Dict.empty(),
      textures: Js.Dict.empty(),
      booleans: Js.Dict.empty(),
      selects: Js.Dict.empty(),
      ranges: Js.Dict.empty(),
      strings: Js.Dict.empty(),
      variables: Js.Dict.empty(),
    },
  }
}

let findPage = (model: Model.t, id) => model.pages->Js.Array2.find(page => page.id === id)

let getCanvasWithContextPixelColor = (canvasWithContext: Generator_CanvasWithContext.t, x, y) => {
  let {width, height, contextWithAlpha} = canvasWithContext
  let data = Dom2.Context2d.getImageData(contextWithAlpha, 0, 0, width, height).data
  let pixelIndex = y * width + x
  let arrayIndex = pixelIndex * 4
  let r = Belt.Array.get(data, arrayIndex)
  let g = Belt.Array.get(data, arrayIndex + 1)
  let b = Belt.Array.get(data, arrayIndex + 2)
  let a = Belt.Array.get(data, arrayIndex + 3)
  switch (r, g, b, a) {
  | (Some(r), Some(g), Some(b), Some(a)) => Some((r, g, b, a))
  | _ => None
  }
}

let getTexturePixelColor = (model: Model.t, textureId, x, y) => {
  let texture = Js.Dict.get(model.values.textures, textureId)
  switch texture {
  | None => None
  | Some(texture) => getCanvasWithContextPixelColor(texture.imageWithCanvas.canvasWithContext, x, y)
  }
}

let getImagePixelColor = (model: Model.t, imageId, x, y) => {
  let imageWithCanvas = Js.Dict.get(model.values.images, imageId)
  switch imageWithCanvas {
  | None => None
  | Some(imageWithCanvas) => getCanvasWithContextPixelColor(imageWithCanvas.canvasWithContext, x, y)
  }
}

let getPagePixelColor = (model: Model.t, pageId, x, y) => {
  let page = findPage(model, pageId)
  switch page {
  | None => None
  | Some(page) => getCanvasWithContextPixelColor(page.canvasWithContext, x, y)
  }
}

let getCurrentPagePixelColor = (model: Model.t, x, y) => {
  switch model.currentPage {
  | None => None
  | Some(page) => getCanvasWithContextPixelColor(page.canvasWithContext, x, y)
  }
}

let setVariable = (model: Model.t, id: string, value: Model.Variable.t) => {
  let variables = Js.Dict.fromArray(Js.Dict.entries(model.values.variables))
  Js.Dict.set(variables, id, value)
  {
    ...model,
    values: {
      ...model.values,
      variables,
    },
  }
}

let getVariable = (model: Model.t, id: string) => {
  Js.Dict.get(model.values.variables, id)
}

let getVariableMap = (model: Model.t, id: string, fn) => {
  switch getVariable(model, id) {
  | None => None
  | Some(value) => fn(value)
  }
}

let setStringVariable = (model: Model.t, id: string, value: string) => {
  setVariable(model, id, #String(value))
}

let getStringVariable = (model: Model.t, id: string): option<string> => {
  getVariableMap(model, id, Model.Variable.toString)
}

let setIntegerVariable = (model: Model.t, id: string, value: int) => {
  setVariable(model, id, #Integer(value))
}

let getFloatVariable = (model: Model.t, id: string): option<float> => {
  getVariableMap(model, id, Model.Variable.toFloat)
}

let setFloatVariable = (model: Model.t, id: string, value: float) => {
  setVariable(model, id, #Float(value))
}

let getIntegerVariable = (model: Model.t, id: string): option<int> => {
  getVariableMap(model, id, Model.Variable.toInteger)
}

let setBooleanVariable = (model: Model.t, id: string, value: bool) => {
  setVariable(model, id, #Boolean(value))
}

let getBooleanVariable = (model: Model.t, id: string): option<bool> => {
  getVariableMap(model, id, Model.Variable.toBoolean)
}

let hasInput = (model: Model.t, idToFind: string) => {
  Js.Array2.find(model.inputs, input => {
    let id = switch input {
    | Text(id, _) => id
    | RegionInput(_, _, _) => ""
    | CustomStringInput(id, _) => id
    | SkinInput(id, _) => id
    | TextureInput(id, _) => id
    | TextInput(id) => id
    | BooleanInput(id) => id
    | SelectInput(id, _) => id
    | RangeInput(id, _) => id
    | ButtonInput(id, _) => id
    }
    id === idToFind
  })
}

let clearStringInputValues = (model: Model.t) => {
  {
    ...model,
    values: {
      ...model.values,
      strings: Js.Dict.empty(),
    },
  }
}

let setStringInputValue = (model: Model.t, id: string, value: string) => {
  let strings = Js.Dict.fromArray(Js.Dict.entries(model.values.strings))
  Js.Dict.set(strings, id, value)
  {
    ...model,
    values: {
      ...model.values,
      strings,
    },
  }
}

let getStringInputValue = (model: Model.t, id: string) => {
  let value = Js.Dict.get(model.values.strings, id)
  switch value {
  | None => ""
  | Some(value) => value
  }
}

let clearBooleanInputValues = (model: Model.t) => {
  {
    ...model,
    values: {
      ...model.values,
      booleans: Js.Dict.empty(),
    },
  }
}

let setBooleanInputValue = (model: Model.t, id: string, value: bool) => {
  let booleans = Js.Dict.fromArray(Js.Dict.entries(model.values.booleans))
  Js.Dict.set(booleans, id, value)
  {
    ...model,
    values: {
      ...model.values,
      booleans,
    },
  }
}

let getBooleanInputValue = (model: Model.t, id: string) => {
  let value = Js.Dict.get(model.values.booleans, id)
  switch value {
  | None => false
  | Some(value) => value
  }
}

let getBooleanInputValueWithDefault = (model: Model.t, id: string, default: bool) => {
  let value = Js.Dict.get(model.values.booleans, id)
  switch value {
  | None => default
  | Some(value) => value
  }
}

let clearSelectInputValues = (model: Model.t) => {
  {
    ...model,
    values: {
      ...model.values,
      selects: Js.Dict.empty(),
    },
  }
}

let setSelectInputValue = (model: Model.t, id: string, value: string) => {
  let selects = Js.Dict.fromArray(Js.Dict.entries(model.values.selects))
  Js.Dict.set(selects, id, value)
  {
    ...model,
    values: {
      ...model.values,
      selects,
    },
  }
}

let getSelectInputValue = (model: Model.t, id: string) => {
  let value = Js.Dict.get(model.values.selects, id)
  switch value {
  | None => ""
  | Some(value) => value
  }
}

let setRangeInputValue = (model: Model.t, id: string, value: int) => {
  let ranges = Js.Dict.fromArray(Js.Dict.entries(model.values.ranges))
  Js.Dict.set(ranges, id, value)
  {
    ...model,
    values: {
      ...model.values,
      ranges,
    },
  }
}

let getRangeInputValue = (model: Model.t, id: string): int => {
  let value = Js.Dict.get(model.values.ranges, id)
  switch value {
  | None => 0
  | Some(value) => value
  }
}

let hasBooleanValue = (model: Model.t, id: string) => {
  switch Js.Dict.get(model.values.booleans, id) {
  | None => false
  | Some(_) => true
  }
}

let hasSelectValue = (model: Model.t, id: string) => {
  switch Js.Dict.get(model.values.selects, id) {
  | None => false
  | Some(_) => true
  }
}

let hasRangeValue = (model: Model.t, id: string) => {
  switch Js.Dict.get(model.values.ranges, id) {
  | None => false
  | Some(_) => true
  }
}

let usePage = (model: Model.t, id: string, isLandscape: bool) => {
  let page = findPage(model, id)
  switch page {
  | Some(page) => {
      ...model,
      currentPage: Some(page),
    }
  | None => {
      let page = Generator_Page.make(id, isLandscape)
      let pages = Js.Array2.concat(model.pages, [page])
      {
        ...model,
        pages,
        currentPage: Some(page),
      }
    }
  }
}

let getDefaultPageId = () => "Page"

let getCurrentPageId = (model: Model.t) => {
  switch model.currentPage {
  | None => getDefaultPageId()
  | Some(page) => page.id
  }
}

let ensureCurrentPage = (model: Model.t) => {
  switch model.currentPage {
  | None => usePage(model, getDefaultPageId(), false)
  | Some(_) => model
  }
}

let defineRegionInput = (model: Model.t, region: (int, int, int, int), callback) => {
  let pageId = getCurrentPageId(model)
  let inputs = Js.Array2.concat(model.inputs, [Input.RegionInput(pageId, region, callback)])
  {...model, inputs}
}

let defineCustomStringInput = (
  model: Model.t,
  id: string,
  fn: (string => unit) => React.element,
) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.CustomStringInput(id, fn)])
  {...model, inputs}
}

let defineBooleanInput = (model: Model.t, id: string, initial: bool) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.BooleanInput(id)])
  let newModel = {...model, inputs}
  if !hasBooleanValue(model, id) {
    setBooleanInputValue(newModel, id, initial)
  } else {
    newModel
  }
}

let defineButtonInput = (model: Model.t, id: string, onClick) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.ButtonInput(id, onClick)])
  let newModel = {...model, inputs}
  newModel
}

let defineSelectInput = (model: Model.t, id: string, options: array<string>) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.SelectInput(id, options)])
  let newModel = {...model, inputs}
  if !hasSelectValue(model, id) {
    let value = Belt.Option.getWithDefault(options[0], "")
    setSelectInputValue(newModel, id, value)
  } else {
    newModel
  }
}

let defineRangeInput = (model: Model.t, id: string, rangeArgs: Input.rangeArgs) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.RangeInput(id, rangeArgs)])
  let newModel = {...model, inputs}
  if !hasRangeValue(model, id) {
    setRangeInputValue(newModel, id, rangeArgs.value)
  } else {
    newModel
  }
}

let defineSkinInput = (model: Model.t, id, options) => {
  let input = Input.SkinInput(id, options)
  let inputs = Js.Array2.concat(model.inputs, [input])
  {
    ...model,
    inputs,
  }
}

let defineTextureInput = (model: Model.t, id, options) => {
  let input = Input.TextureInput(id, options)
  let inputs = Js.Array2.concat(model.inputs, [input])
  {
    ...model,
    inputs,
  }
}

let defineTextInput = (model: Model.t, id) => {
  let input = Input.TextInput(id)
  let inputs = Js.Array2.concat(model.inputs, [input])
  {
    ...model,
    inputs,
  }
}

let defineText = (model: Model.t, text: string) => {
  let isText = input =>
    switch input {
    | Input.Text(_) => true
    | _ => false
    }
  let textCount = model.inputs->Js.Array2.filter(isText)->Js.Array2.length
  let id = "text-" ++ Js.Int.toString(textCount + 1)
  let input = Input.Text(id, text)
  let inputs = Js.Array2.concat(model.inputs, [input])
  {
    ...model,
    inputs,
  }
}

let fillBackgroundColor = (model: Model.t, color: string) => {
  switch model.currentPage {
  | None => model
  | Some(currentPage) => {
      let currentPage = findPage(model, currentPage.id)
      switch currentPage {
      | None => model
      | Some(currentPage) => {
          let {width, height} = currentPage.canvasWithContext
          let newCanvas = Generator_CanvasWithContext.make(width, height)
          let previousFillStyle = newCanvas.context->Context2d.getFillStyle
          newCanvas.context->Context2d.setFillStyle(color)
          newCanvas.context->Context2d.fillRect(0, 0, width, height)
          newCanvas.context->Context2d.drawCanvasXY(currentPage.canvasWithContext.canvas, 0, 0)
          newCanvas.context->Context2d.setFillStyle(previousFillStyle)

          let newCurrentPage = {
            ...currentPage,
            canvasWithContext: newCanvas,
          }

          let newPages = Belt.Array.map(model.pages, page => {
            page.id === newCurrentPage.id ? newCurrentPage : page
          })

          let newModel = {
            ...model,
            pages: newPages,
            currentPage: Some(newCurrentPage),
          }

          newModel
        }
      }
    }
  }
}

let fillRect = (model: Model.t, dest: rectangle, color: string) => {
  let (x, y, w, h) = dest

  switch model.currentPage {
  | None => model
  | Some(currentPage) => {
      let context = currentPage.canvasWithContext.context
      context->Context2d.setFillStyle(color)
      context->Context2d.fillRect(x, y, w, h)

      model
    }
  }
}

let getOffset = ((x1, y1): position, (x2, y2): position, isLandscape: bool) => {
  let x1 = Belt.Int.toFloat(x1)
  let y1 = Belt.Int.toFloat(y1)
  let x2 = Belt.Int.toFloat(x2)
  let y2 = Belt.Int.toFloat(y2)

  let w = x2 -. x1
  let h = y2 -. y1

  /* When a line is drawn and its start and end coords are integer values, the
  resulting line is drawn in between to rows of pixels, resulting in a line
  that is two pixels wide and half transparent. To fix this, the line's start
  and end positions need to be offset 0.5 pixels in the direction normal to the
  line. The following code gets the angle of the line, and gets the components
  for a translation in the direction perpendicular to the angle using vector
  resolution: https://physics.info/vector-components/summary.shtml This results
  in a fully opaque line with the correct width if the line is vertical or
  horizontal, but antialiasing may still affect lines at other angles.

  The angle should be 3 pi / 2 radians if the angle is 270 degrees, but with 
  the ternary making it pi / 2 regardless of sign the rectangle lines functions
  are much easier to do, for some reason. Maybe later, this could be replaced 
  with something using the absolute value of the angle?
 */
  let angle = if isLandscape {
    /* Adjust the angle calculation for landscape mode */
    Js.Math.atan2(~y=-.h, ~x=-.w, ())
  } else {
    Js.Math.atan2(~y=h, ~x=w, ())
  }

  let ox = Js.Math.sin(angle) *. 0.5
  let oy = Js.Math.cos(angle) *. 0.5

  (ox, oy)
}
let adjustPosition = ((x, y): position, w: int) => {
  (w - y, x)
}

/* By default canvas2d is always antialiased and can't be turned off by a setting, but this filter will eliminate transparent pixels, effectively making it appear aliased */
let addAliasingFilter = canvas => {
  canvas->Context2d.filter(
    "url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxmaWx0ZXIgaWQ9ImZpbHRlciIgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgY29sb3ItaW50ZXJwb2xhdGlvbi1maWx0ZXJzPSJzUkdCIj48ZmVDb21wb25lbnRUcmFuc2Zlcj48ZmVGdW5jUiB0eXBlPSJpZGVudGl0eSIvPjxmZUZ1bmNHIHR5cGU9ImlkZW50aXR5Ii8+PGZlRnVuY0IgdHlwZT0iaWRlbnRpdHkiLz48ZmVGdW5jQSB0eXBlPSJkaXNjcmV0ZSIgdGFibGVWYWx1ZXM9IjAgMSIvPjwvZmVDb21wb25lbnRUcmFuc2Zlcj48L2ZpbHRlcj48L3N2Zz4=#filter)",
  )
}

let drawLine = (
  model: Model.t,
  (x1, y1): position,
  (x2, y2): position,
  ~color: string,
  ~width: int,
  ~pattern: array<int>,
  ~offset: int,
) => {
  let model = ensureCurrentPage(model)
  let currentPage = model.currentPage
  switch currentPage {
  | None => model
  | Some(page) => {
      let ((x1, y1), (x2, y2)) = page.isLandscape
        ? (
            adjustPosition((x1, y1), page.canvasWithContext.width),
            adjustPosition((x2, y2), page.canvasWithContext.width),
          )
        : ((x1, y1), (x2, y2))

      let (ox, oy) = getOffset((x1, y1), (x2, y2), page.isLandscape)

      let context = page.canvasWithContext.context
      context->addAliasingFilter
      context->Context2d.beginPath
      context->Context2d.strokeStyle(color)
      context->Context2d.lineWidth(width)
      context->Context2d.setLineDash(pattern)
      context->Context2d.lineDashOffset(offset)
      context->Context2d.moveTo(Belt.Int.toFloat(x1) +. ox, Belt.Int.toFloat(y1) +. oy)
      context->Context2d.lineTo(Belt.Int.toFloat(x2) +. ox, Belt.Int.toFloat(y2) +. oy)
      context->Context2d.stroke
      context->Context2d.filter("none")

      model
    }
  }
}

let drawPath = (
  model: Model.t,
  points: array<position>,
  ~color: string,
  ~width: int,
  ~pattern: array<int>,
  ~offset: int,
  ~close: bool,
) => {
  switch model.currentPage {
  | None => model
  | Some(page) => {
      let context = page.canvasWithContext.context
      context->Context2d.beginPath
      context->Context2d.strokeStyle(color)
      context->Context2d.lineWidth(width)
      context->Context2d.setLineDash(pattern)
      context->Context2d.lineDashOffset(offset)
      for i in 1 to Js.Array.length(points) - 1 {
        let (x, y) = switch points[i] {
        | None => (0, 0)
        | Some(a, b) => (a, b)
        }
        let (x0, y0) = switch points[i - 1] {
        | None => (0, 0)
        | Some(a, b) => (a, b)
        }
        let (ox, oy) = getOffset((x, y), (x0, y0), page.isLandscape)
        context->Context2d.moveTo(Belt.Int.toFloat(x0) +. ox, Belt.Int.toFloat(y0) +. oy)
        context->Context2d.lineTo(Belt.Int.toFloat(x) +. ox, Belt.Int.toFloat(y) +. oy)
      }
      if close {
        let (x, y) = switch points[Js.Array.length(points) - 1] {
        | None => (0, 0)
        | Some(a, b) => (a, b)
        }
        let (x0, y0) = switch points[0] {
        | None => (0, 0)
        | Some(a, b) => (a, b)
        }
        let (ox, oy) = getOffset((x, y), (x0, y0), page.isLandscape)
        context->Context2d.moveTo(Belt.Int.toFloat(x0) +. ox, Belt.Int.toFloat(y0) +. oy)
        context->Context2d.lineTo(Belt.Int.toFloat(x) +. ox, Belt.Int.toFloat(y) +. oy)
      }
      context->Context2d.stroke

      model
    }
  }
}

let drawImage = (model: Model.t, id: string, (x, y): position) => {
  let model = ensureCurrentPage(model)
  let currentPage = model.currentPage
  let image = Js.Dict.get(model.values.images, id)
  switch (currentPage, image) {
  | (Some(page), Some(imageWithCanvas)) =>
    Context2d.drawImageXY(page.canvasWithContext.context, imageWithCanvas.image, x, y)
  | _ => ()
  }
  model
}

let addImage = (model: Model.t, id: string, image: Image.t) => {
  let imageWithCanvas = Generator_ImageWithCanvas.makeFromImage(image)
  let images = Js.Dict.fromArray(Js.Dict.entries(model.values.images))
  Js.Dict.set(images, id, imageWithCanvas)
  {
    ...model,
    values: {
      ...model.values,
      images,
    },
  }
}

let addTexture = (model: Model.t, id: string, texture: Generator_Texture.t) => {
  let textures = Js.Dict.fromArray(Js.Dict.entries(model.values.textures))
  Js.Dict.set(textures, id, texture)
  {
    ...model,
    values: {
      ...model.values,
      textures,
    },
  }
}

let clearTexture = (model: Model.t, id: string) => {
  let entries =
    Js.Dict.entries(model.values.textures)->Js.Array2.filter(((textureId, _)) => textureId !== id)
  let textures = Js.Dict.fromArray(entries)
  {
    ...model,
    values: {
      ...model.values,
      textures,
    },
  }
}

let drawTexture = (
  model: Model.t,
  id: string,
  (sx, sy, sw, sh): rectangle,
  (dx, dy, dw, dh): rectangle,
  ~flip: Generator_Texture.flip,
  ~rotate: Generator_Texture.rotate,
  ~blend: Generator_Texture.blend,
  ~pixelate: bool,
  (),
) => {
  let model = ensureCurrentPage(model)
  let currentPage = model.currentPage
  let texture = Js.Dict.get(model.values.textures, id)
  switch (currentPage, texture) {
  | (Some(page), Some(texture)) =>
    let (dx, dy, dw, dh) = page.isLandscape
    //? (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
    //: (dx, dy, dw, dh)
      ? {
          (page.canvasWithContext.width - (dy - (dw - dh) / 2 + dw), dx + (dw - dh) / 2, dw, dh)
        }
      : (dx, dy, dw, dh)
    let rotate = page.isLandscape
      ? {
          switch rotate {
          | #None => #Center(90.0)
          | #Center(angle) => #Center(angle +. 90.0)
          | #Corner(angle) => #Corner(angle +. 90.0)
          }
        }
      : rotate

    Generator_Texture.draw(
      texture,
      page,
      sx,
      sy,
      sw,
      sh,
      dx,
      dy,
      dw,
      dh,
      ~flip,
      ~rotate,
      ~blend,
      ~pixelate,
      (),
    )
  | _ => ()
  }
  model
}

let hasImage = (model: Model.t, id: string) => {
  let image = Js.Dict.get(model.values.images, id)
  switch image {
  | None => false
  | Some(_) => true
  }
}

let hasTexture = (model: Model.t, id: string) => {
  let texture = Js.Dict.get(model.values.textures, id)
  switch texture {
  | None => false
  | Some(_) => true
  }
}

let drawText = (model: Model.t, text: string, position: position, size: int) => {
  let model = ensureCurrentPage(model)
  switch model.currentPage {
  | None => ()
  | Some(page) => {
      let (x, y) = position
      let (x, y) = page.isLandscape ? (page.canvasWithContext.width - y, x) : (x, y)
      page.canvasWithContext.context->addAliasingFilter
      page.canvasWithContext.context->Context2d.save
      if page.isLandscape {
        page.canvasWithContext.context->Context2d.translate(Belt.Int.toFloat(x + y), 5.0)
        page.canvasWithContext.context->Context2d.rotate(Js.Math._PI /. 2.0)
      }
      let font = Belt.Int.toString(size * 10) ++ "px Mojangles"
      page.canvasWithContext.context->Context2d.font(font)

      page.canvasWithContext.context->Context2d.fillText(text, x, y)
      page.canvasWithContext.context->Context2d.restore
      page.canvasWithContext.context->addAliasingFilter
    }
  }
  model
}
