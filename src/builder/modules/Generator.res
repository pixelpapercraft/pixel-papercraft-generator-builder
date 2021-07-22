@val external requireImage: string => string = "require"

type imageDef = Builder.imageDef
type textureDef = Builder.textureDef
type generatorDef = Builder.generatorDef
type thumnbnailDef = Builder.thumnbnailDef
type videoDef = Builder.videoDef
type instructionsDef = Builder.instructionsDef

module Markup = {
  module H2 = {
    @react.component
    let make = (~children) => {
      <h2 className="mb-4 text-2xl font-bold"> {children} </h2>
    }
  }

  module H3 = {
    @react.component
    let make = (~children) => {
      <h3 className="mb-4 font-bold"> {children} </h3>
    }
  }

  module LI = {
    @react.component
    let make = (~children) => {
      <li> {children} </li>
    }
  }

  module UL = {
    @react.component
    let make = (~children) => {
      <ul className="mb-4 ml-4 list-disc"> {children} </ul>
    }
  }

  module OL = {
    @react.component
    let make = (~children) => {
      <ol className="mb-4 ml-4 list-decimal"> {children} </ol>
    }
  }

  module P = {
    @react.component
    let make = (~children) => {
      <p className="mb-4"> {children} </p>
    }
  }

  module A = {
    @react.component
    let make = (~href, ~children) => {
      <a className="text-green-600 font-medium hover:underline" href={href}> {children} </a>
    }
  }
}

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

let defineButtonInput = (id, onClick) => {
  model := Builder.defineButtonInput(model.contents, id, onClick)
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

let defineRangeInput = (id: string, options) => {
  model := Builder.defineRangeInput(model.contents, id, options)
}

let getRangeInputValue = (id: string) => {
  Builder.getRangeInputValue(model.contents, id)
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

let drawTexture = (
  id: string,
  source: Builder.rectangle,
  dest: Builder.rectangle,
  ~flip: Builder.Texture.flip=#None,
  ~rotateLegacy: float=0.0,
  ~rotate: float=0.0,
  (),
) => {
  let rotate = if rotateLegacy !== 0.0 {
    #Corner(rotateLegacy)
  } else if rotate !== 0.0 {
    #Center(rotate)
  } else {
    #None
  }
  model := Builder.drawTexture(model.contents, id, source, dest, ~flip, ~rotate, ())
}

@deprecated("Use Generator.drawTexture")
let drawTextureLegacy = (
  id: string,
  source: Builder.rectangleLegacy,
  dest: Builder.rectangleLegacy,
  ~flip: Builder.Texture.flip=#None,
  ~rotateLegacy: float=0.0,
  (),
) => {
  drawTexture(
    id,
    (source.x, source.y, source.w, source.h),
    (dest.x, dest.y, dest.w, dest.h),
    ~flip,
    ~rotateLegacy,
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
