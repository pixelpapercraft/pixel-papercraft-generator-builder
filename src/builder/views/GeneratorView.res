@react.component
let make = (~generatorDef: Builder.generatorDef) => {
  let (model, setModel) = React.useState(_ => None)

  React.useEffect1(() => {
    ResourceLoader.loadResources(generatorDef)
    ->Promise.thenResolve(results => {
      switch results {
      | Error(exn) => Js.log(exn)
      | Ok(imageTuples, textureTuples) => {
          let model = Builder.Model.make()
          let model =
            imageTuples->Js.Array2.reduce(
              (acc, (id, image)) => Builder.addImage(acc, id, image),
              model,
            )
          let model =
            textureTuples->Js.Array2.reduce(
              (acc, (id, texture)) => Builder.addTexture(acc, id, texture),
              model,
            )
          ScriptRunner.run(generatorDef, model)
          ->Promise.thenResolve(model => {
            setModel(_ => Some(model))
          })
          ->ignore
        }
      }
    })
    ->ignore

    None
  }, [generatorDef])

  let runScript = model => {
    ScriptRunner.run(generatorDef, model)
    ->Promise.thenResolve(model => {
      setModel(_ => Some(model))
    })
    ->ignore
  }

  let onInputsChange = model => {
    runScript(model)
  }

  let onPagesInputsChange = () => {
    runScript(Generator.getModel())
  }

  <div>
    {switch model {
    | None => React.null
    | Some(model) =>
      <div>
        <Inputs model={model} onChange={onInputsChange} />
        <Pages generatorDef={generatorDef} model={model} onChange={onPagesInputsChange} />
      </div>
    }}
  </div>
}

let default = make
