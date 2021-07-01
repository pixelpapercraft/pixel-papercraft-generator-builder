open Dom2.Document

%%raw(`
require('tailwindcss/tailwind.css');
`)

module GeneratorSelect = {
  open FormInput

  @react.component
  let make = (~onChange, ~value) => {
    let onSelectChange = e => {
      let target = ReactEvent.Form.target(e)
      let id: option<string> = target["value"]
      let id = switch id {
      | None => None
      | Some(id) => id == "" ? None : Some(id)
      }
      onChange(id)
    }
    <Select onChange={onSelectChange} value={value} size=#Large>
      <Option key="" value=""> {React.string("Select generator")} </Option>
      {Generators.generators
      ->Js.Array2.map(generator => {
        <Option key={generator.id} value={generator.id}> {React.string(generator.name)} </Option>
      })
      ->React.array}
    </Select>
  }
}

module App = {
  type state = {generatorDef: Generator.generatorDef}

  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    let (generatorDef, setGeneratorDef) = React.useState(_ => None)

    React.useEffect1(() => {
      let generatorDef =
        Generators.generators->Js.Array2.find(generator => generator.id == url.hash)
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
      <div className="pb-8">
        <GeneratorSelect onChange={onGeneratorChange} value={url.hash} />
      </div>
      {switch generatorDef {
      | None => React.null
      | Some(generatorDef) => <GeneratorView generatorDef={generatorDef} />
      }}
    </div>
  }

  let default = make
}

let root = getElementById_UNSAFE(document, "root")
ReactDOM.render(<App />, root)
