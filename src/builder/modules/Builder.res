open Dom2

type textureDef = {id: string, url: string, standardWidth: int, standardHeight: int}
type imageDef = {id: string, url: string}
type thumnbnailDef = {url: string}
type videoDef = {url: string}
type generatorDef = {
  id: string,
  name: string,
  thumbnail: option<thumnbnailDef>,
  video: option<videoDef>,
  images: array<imageDef>,
  textures: array<textureDef>,
  script: unit => unit,
}

type position = (int, int)
type rectangleLegacy = {x: int, y: int, w: int, h: int}
type rectangle = (int, int, int, int)

module CanvasFactory = {
  let make = (width, height) => {
    let canvas = Document.createCanvasElement(Document.document)
    Canvas.setWidth(canvas, width)
    Canvas.setHeight(canvas, height)
    canvas
  }
}

module ImageFactory = {
  let makeFromUrl = url => {
    Promise.make((resolve, reject) => {
      let image = Image.make()
      Image.setOnLoad(image, () => resolve(. image))
      Image.setOnError(image, error => reject(. error))
      Image.setSrc(image, url)
    })
  }
}

module Page = {
  type t = {
    id: string,
    width: int,
    height: int,
    canvas: Canvas.t,
    context: Context2d.t,
  }

  let make = (id: string) => {
    let canvas = Document.createCanvasElement(Document.document)
    Canvas.setWidth(canvas, PageSize.A4.px.width)
    Canvas.setHeight(canvas, PageSize.A4.px.height)
    let context = Canvas.getContext2d(canvas)
    {
      id: id,
      width: Canvas.getWidth(canvas),
      height: Canvas.getHeight(canvas),
      canvas: canvas,
      context: context,
    }
  }
}

module Texture = {
  type t = {
    image: Image.t,
    width: int,
    height: int,
    standardWidth: int,
    standardHeight: int,
    canvas: Canvas.t,
    context: Context2d.t,
  }

  let make = (image, standardWidth, standardHeight): t => {
    let width = Image.getWidth(image)
    let height = Image.getHeight(image)
    let canvas = Document.createCanvasElement(Document.document)
    let context = Canvas.getContext2d(canvas)
    Canvas.setWidth(canvas, width)
    Canvas.setHeight(canvas, height)
    Context2d.drawImageXY(context, image, 0, 0)
    let texture = {
      image: image,
      width: Image.getWidth(image),
      height: Image.getHeight(image),
      standardWidth: standardWidth,
      standardHeight: standardHeight,
      canvas: canvas,
      context: context,
    }
    texture
  }

  let makeFromUrl = (url, standardWidth, standardHeight) =>
    ImageFactory.makeFromUrl(url)->Promise.thenResolve(image =>
      make(image, standardWidth, standardHeight)
    )

  type flip = [#None | #Horizontal | #Vertical]
  type rotate = [#None | #Corner(float) | #Center(float)]

  type drawNearestNeighborOptions = {rotate: rotate, flip: flip}

  let drawNearestNeighbor = (
    texture: t,
    page: Page.t,
    sx,
    sy,
    sw,
    sh,
    dx,
    dy,
    dw,
    dh,
    options: drawNearestNeighborOptions,
  ) => {
    let imageData = Context2d.getImageData(texture.context, sx, sy, sw, sh)
    let pix = imageData.data

    let tempCanvas = CanvasFactory.make(dw, dh)
    let tempContext = Canvas.getContext2d(tempCanvas)

    let deltax = Belt.Int.toFloat(dw) /. Belt.Int.toFloat(sw)
    let deltay = Belt.Int.toFloat(dh) /. Belt.Int.toFloat(sh)

    let pixw = Js.Math.floor(deltax)
    let pixh = Js.Math.floor(deltay)

    let pixw = Belt.Int.toFloat(pixw) < deltax ? pixw + 1 : pixw
    let pixh = Belt.Int.toFloat(pixh) < deltay ? pixh + 1 : pixh

    for y in 0 to sh - 1 {
      for x in 0 to sw - 1 {
        let tx = Belt.Int.toFloat(x) *. deltax
        let ty = Belt.Int.toFloat(y) *. deltay

        // Source pixel
        let i = (y * sw + x) * 4
        let r = pix[i + 0]
        let g = pix[i + 1]
        let b = pix[i + 2]
        let a = Belt.Int.toFloat(pix[i + 3]) /. 255.0

        Context2d.setFillStyleRGBA(tempContext, r, g, b, a)
        Context2d.fillRect(tempContext, Js.Math.floor(tx), Js.Math.floor(ty), pixw, pixh)
      }
    }

    let context = page.context

    // Save the current state of the page
    Context2d.save(context)

    // Move to the destination coordinate
    Context2d.translate(context, dx, dy)

    switch options.rotate {
    | #None => ()
    | #Corner(degrees) => {
        let radians = degrees *. Js.Math._PI /. 180.0
        Context2d.rotate(context, radians)
      }
    | #Center(degrees) => {
        let radians = degrees *. Js.Math._PI /. 180.0
        Context2d.translate(context, dw / 2, dh / 2)
        Context2d.rotate(context, radians)
        Context2d.translate(context, -dw / 2, -dh / 2)
      }
    }

    switch options.flip {
    | #None => ()
    | #Horizontal => {
        Context2d.translate(context, dw, 0)
        Context2d.scale(context, -1, 1)
      }
    | #Vertical => {
        Context2d.translate(context, 0, dh)
        Context2d.scale(context, 1, -1)
      }
    }

    Context2d.drawCanvasXY(context, tempCanvas, 0, 0)

    Context2d.restore(context)
  }

  let draw = (
    texture: t,
    page: Page.t,
    sx,
    sy,
    sw,
    sh,
    dx,
    dy,
    dw,
    dh,
    ~flip: flip,
    ~rotate: rotate,
    (),
  ) => {
    let sourceScaleX = Belt.Int.toFloat(texture.width) /. Belt.Int.toFloat(texture.standardWidth)
    let sourceScaleY = Belt.Int.toFloat(texture.height) /. Belt.Int.toFloat(texture.standardHeight)

    let sx = Js.Math.floor(Belt.Int.toFloat(sx) *. sourceScaleX)
    let sy = Js.Math.floor(Belt.Int.toFloat(sy) *. sourceScaleY)
    let sw = Js.Math.floor(Belt.Int.toFloat(sw) *. sourceScaleX)
    let sh = Js.Math.floor(Belt.Int.toFloat(sh) *. sourceScaleY)

    drawNearestNeighbor(texture, page, sx, sy, sw, sh, dx, dy, dw, dh, {rotate: rotate, flip: flip})
  }
}

module Image = {
  type t = Dom.htmlImageElement

  let draw = (image: t, page: Page.t, x: int, y: int) => {
    let context = Canvas.getContext2d(page.canvas)
    Context2d.drawImageXY(context, image, x, y)
  }
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
    | TextureInput(id, textureArgs)
    | BooleanInput(id)
    | SelectInput(id, array<string>)
    | RangeInput(id, rangeArgs)
}

module Model = {
  type pageRegion = {
    pageId: string,
    region: (int, int, int, int),
  }

  type values = {
    images: Js.Dict.t<Image.t>,
    textures: Js.Dict.t<Texture.t>,
    booleans: Js.Dict.t<bool>,
    selects: Js.Dict.t<string>,
    ranges: Js.Dict.t<int>,
    strings: Js.Dict.t<string>,
  }

  type t = {
    inputs: array<Input.t>,
    pages: array<Page.t>,
    currentPage: option<Page.t>,
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
    },
  }
}

let hasInput = (model: Model.t, idToFind: string) => {
  Js.Array2.find(model.inputs, input => {
    let id = switch input {
    | Text(id, _) => id
    | RegionInput(_, _, _) => ""
    | CustomStringInput(id, _) => id
    | TextureInput(id, _) => id
    | BooleanInput(id) => id
    | SelectInput(id, _) => id
    | RangeInput(id, _) => id
    }
    id === idToFind
  })
}

let setStringInputValue = (model: Model.t, id: string, value: string) => {
  let strings = Js.Dict.fromArray(Js.Dict.entries(model.values.strings))
  Js.Dict.set(strings, id, value)
  {
    ...model,
    values: {
      ...model.values,
      strings: strings,
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

let setBooleanInputValue = (model: Model.t, id: string, value: bool) => {
  let booleans = Js.Dict.fromArray(Js.Dict.entries(model.values.booleans))
  Js.Dict.set(booleans, id, value)
  {
    ...model,
    values: {
      ...model.values,
      booleans: booleans,
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

let setSelectInputValue = (model: Model.t, id: string, value: string) => {
  let selects = Js.Dict.fromArray(Js.Dict.entries(model.values.selects))
  Js.Dict.set(selects, id, value)
  {
    ...model,
    values: {
      ...model.values,
      selects: selects,
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

let findPage = (model: Model.t, id) => model.pages->Js.Array2.find(page => page.id === id)

let usePage = (model: Model.t, id) => {
  let page = findPage(model, id)
  switch page {
  | Some(_) => model
  | None => {
      let page = Page.make(id)
      let pages = Js.Array2.concat(model.pages, [page])
      {
        ...model,
        pages: pages,
        currentPage: Some(page),
      }
    }
  }
}

let getDefaultPageId = () => "Page"

let getCurrentDefinedPageId = (model: Model.t) => {
  let length = Js.Array2.length(model.pages)
  if length > 0 {
    model.pages[length - 1].id
  } else {
    getDefaultPageId()
  }
}

let ensureCurrentPage = (model: Model.t) => {
  switch model.currentPage {
  | None => usePage(model, getDefaultPageId())
  | Some(_) => model
  }
}

let defineRegionInput = (model: Model.t, region: (int, int, int, int), callback) => {
  let pageId = getCurrentDefinedPageId(model)
  let inputs = Js.Array2.concat(model.inputs, [Input.RegionInput(pageId, region, callback)])
  {...model, inputs: inputs}
}

let defineCustomStringInput = (
  model: Model.t,
  id: string,
  fn: (string => unit) => React.element,
) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.CustomStringInput(id, fn)])
  {...model, inputs: inputs}
}

let defineBooleanInput = (model: Model.t, id: string, initial: bool) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.BooleanInput(id)])
  let newModel = {...model, inputs: inputs}
  if !hasBooleanValue(model, id) {
    setBooleanInputValue(newModel, id, initial)
  } else {
    newModel
  }
}

let defineSelectInput = (model: Model.t, id: string, options: array<string>) => {
  let inputs = Js.Array2.concat(model.inputs, [Input.SelectInput(id, options)])
  let newModel = {...model, inputs: inputs}
  if !hasSelectValue(model, id) {
    let value = Js.Array2.length(options) > 0 ? options[0] : ""
    setSelectInputValue(newModel, id, value)
  } else {
    newModel
  }
}

let defineTextureInput = (model: Model.t, id, options) => {
  let input = Input.TextureInput(id, options)
  let inputs = Js.Array2.concat(model.inputs, [input])
  {
    ...model,
    inputs: inputs,
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
    inputs: inputs,
  }
}

let drawImage = (model: Model.t, id: string, (x, y): position) => {
  let model = ensureCurrentPage(model)
  let currentPage = model.currentPage
  let image = Js.Dict.get(model.values.images, id)
  switch (currentPage, image) {
  | (Some(page), Some(image)) => Image.draw(image, page, x, y)
  | _ => ()
  }
  model
}

let addImage = (model: Model.t, id: string, image: Image.t) => {
  let images = Js.Dict.fromArray(Js.Dict.entries(model.values.images))
  Js.Dict.set(images, id, image)
  {
    ...model,
    values: {
      ...model.values,
      images: images,
    },
  }
}

let addTexture = (model: Model.t, id: string, texture: Texture.t) => {
  let textures = Js.Dict.fromArray(Js.Dict.entries(model.values.textures))
  Js.Dict.set(textures, id, texture)
  {
    ...model,
    values: {
      ...model.values,
      textures: textures,
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
      textures: textures,
    },
  }
}

let drawTexture = (
  model: Model.t,
  id: string,
  (sx, sy, sw, sh): rectangle,
  (dx, dy, dw, dh): rectangle,
  ~flip: Texture.flip,
  ~rotate: Texture.rotate,
  (),
) => {
  let model = ensureCurrentPage(model)
  let currentPage = model.currentPage
  let texture = Js.Dict.get(model.values.textures, id)
  switch (currentPage, texture) {
  | (Some(page), Some(texture)) =>
    Texture.draw(texture, page, sx, sy, sw, sh, dx, dy, dw, dh, ~flip, ~rotate, ())
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
