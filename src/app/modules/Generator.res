@val external require: string => string = "require"

type imageDef = Builder.imageDef
type textureDef = Builder.textureDef
type generatorDef = Builder.generatorDef

let model = ref(Builder.Model.make())

let setModel = newModel => {
  model := newModel
}

let getModel = () => model.contents

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

let defineBooleanInput = (id, initial) => {
  model := Builder.defineBooleanInput(model.contents, id, initial)
}

let setBooleanInputValue = (id, value) => {
  model := Builder.setBooleanInputValue(model.contents, id, value)
}

let getBooleanInputValue = (id: string) => {
  Builder.getBooleanInputValue(model.contents, id)
}

let defineSelectInput = (id, options) => {
  model := Builder.defineSelectInput(model.contents, id, options)
}

let setSelectInputValue = (id, value) => {
  model := Builder.setSelectInputValue(model.contents, id, value)
}

let getSelectInputValue = (id: string) => {
  Builder.getSelectInputValue(model.contents, id)
}

let defineTextureInput = (id: string, options) => {
  model := Builder.defineTextureInput(model.contents, id, options)
}

let usePage = id => {
  model := Builder.usePage(model.contents, id)
}

let drawTexture = (
  id: string,
  source: Builder.rectangle,
  dest: Builder.rectangle,
  ~flip: Builder.Texture.flip=#None,
  ~rotate: float=0.0,
  (),
) => {
  model := Builder.drawTexture(model.contents, id, source, dest, ~flip, ~rotate, ())
}

@deprecated("Use Generator.drawTexture")
let drawTextureLegacy = (
  id: string,
  source: Builder.rectangleLegacy,
  dest: Builder.rectangleLegacy,
  ~flip: Builder.Texture.flip=#None,
  ~rotate: float=0.0,
  (),
) => {
  drawTexture(
    id,
    (source.x, source.y, source.w, source.h),
    (dest.x, dest.y, dest.w, dest.h),
    ~flip,
    ~rotate,
    (),
  )
}

let drawImage = (id: string, position: Builder.position) => {
  model := Builder.drawImage(model.contents, id, position)
}
