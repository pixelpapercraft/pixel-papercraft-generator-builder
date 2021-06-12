type state = {generatorDef: Generator.generatorDef}

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  let (generatorDef, setGeneratorDef) = React.useState(_ => None)

  React.useEffect1(() => {
    let generatorDef = Generators.generators->Js.Array2.find(generator => generator.id == url.hash)
    setGeneratorDef(_ => generatorDef)
    None
  }, [url.hash])

  let onGeneratorChange = generatorId => {
    switch generatorId {
    | None => RescriptReactRouter.push("/")
    | Some(generatorId) => RescriptReactRouter.push("/#" ++ generatorId)
    }
  }

  <div className="p-4 pb-64">
    <div className="pb-8"> <GeneratorSelect onChange={onGeneratorChange} value={url.hash} /> </div>
    {switch generatorDef {
    | None => React.null
    | Some(generatorDef) => <GeneratorView generatorDef={generatorDef} />
    }}
  </div>
}

let default = make
