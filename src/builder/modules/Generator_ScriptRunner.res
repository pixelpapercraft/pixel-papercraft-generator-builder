module Builder = Generator_Builder

let run = (generatorDef: Builder.generatorDef, model: Builder.Model.t) => {
  Promise.make((resolve, _reject) => {
    Js.Global.setTimeout(() => {
      let model = {
        ...Builder.Model.make(),
        values: model.values,
      }
      Generator.setModel(model)
      generatorDef.script()
      resolve(. Generator.getModel())
    }, 1)->ignore
  })
}
