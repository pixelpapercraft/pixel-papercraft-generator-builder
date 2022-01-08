%%raw(`
require('tailwindcss/tailwind.css');
`)

module GeneratorOptGroup = {
  open Generator_FormInput
  @react.component
  let make = (~label, ~generators) => {
    <OptGroup label={label}>
      {generators
      ->Js.Array2.map((generator: Generator.generatorDef) => {
        <Option key={generator.id} value={generator.id}> {React.string(generator.name)} </Option>
      })
      ->React.array}
    </OptGroup>
  }
}

module GeneratorSelect = {
  open Generator_FormInput

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
      <GeneratorOptGroup label="Characters" generators={Generators.character} />
      <GeneratorOptGroup label="Mob Characters" generators={Generators.mobCharacter} />
      <GeneratorOptGroup label="Mob" generators={Generators.mob} />
      <GeneratorOptGroup label="Blocks, Items and Accessories" generators={Generators.utility} />
      <GeneratorOptGroup label="Mod" generators={Generators.mod} />
      <GeneratorOptGroup label="Other" generators={Generators.other} />
      <GeneratorOptGroup label="In Development" generators={Generators.dev} />
      <GeneratorOptGroup label="Testing" generators={Generators.test} />
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
      let generatorDef = Generators.all->Js.Array2.find(generator => generator.id == url.hash)
      setGeneratorDef(_ => generatorDef)
      None
    }, [url.hash])

    let onGeneratorChange = generatorId => {
      switch generatorId {
      | None => RescriptReactRouter.push("/")
      | Some(generatorId) => RescriptReactRouter.push("/#" ++ generatorId)
      }
    }

    <div className="p-8 pb-64">
      <div className="pb-8">
        <GeneratorSelect onChange={onGeneratorChange} value={url.hash} />
      </div>
      {switch generatorDef {
      | None => React.null
      | Some(generatorDef) => <Generator_View generatorDef={generatorDef} />
      }}
    </div>
  }

  let default = make
}

let root = Dom2.Document.getElementById_UNSAFE(Dom2.Window.document, "root")
ReactDOM.render(<App />, root)
