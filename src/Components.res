type generatorGroup = {label: string, generators: array<Generator.generatorDef>}

let generatorGroups = [
  {label: "Characters", generators: Generators.character},
  {label: "Blocks, Items and Accessories", generators: Generators.utility},
  {label: "Mobs", generators: Generators.mob},
  {label: "Mob Characters", generators: Generators.mobCharacter},
  {label: "Mods", generators: Generators.mod},
  {label: "Other", generators: Generators.other},
  //{label: "Development", generators: Generators.dev},
  //{label: "Testing", generators: Generators.test},
]

module Heading = {
  @react.component
  let make = (~children) => {
    <h1 className="text-2xl font-bold mb-2"> {children} </h1>
  }
}

module GeneratorList = {
  @react.component
  let make = () => {
    Belt.Array.map(generatorGroups, generatorGroup => {
      let {label, generators} = generatorGroup
      <div key={label} className="mb-8">
        <Heading> {label->React.string} </Heading>
        <div>
          {Belt.Array.map(generators, generator => {
            let {id, name, thumbnail} = generator
            let url = `#${id}`
            <div key={id}>
              <a className="flex items-center p-2 hover:bg-gray-100 rounded" href=url>
                {switch thumbnail {
                | None => <div className="w-20 h-20 bg-gray-200 mr-2" />
                | Some(thumbnail) => <img className="w-20 h-20 mr-2" src=thumbnail.url />
                }}
                <span> {name->React.string} </span>
              </a>
            </div>
          })->React.array}
        </div>
      </div>
    })->React.array
  }
}

module BackLink = {
  @react.component
  let make = () => {
    <a href="#" className="text-green-600 hover:underline mb-4 block">
      {`← Back to generator list`->React.string}
    </a>
  }
}

module ListView = {
  @react.component
  let make = () => {
    <GeneratorList />
  }
}

module GeneratorView = {
  @react.component
  let make = (~generatorDef: Generator.generatorDef) => {
    <>
      <Heading> {generatorDef.name->React.string} </Heading>
      <BackLink />
      <Generator_View generatorDef={generatorDef} />
    </>
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

    <div className="p-8 pb-64">
      {switch generatorDef {
      | None => <ListView />
      | Some(generatorDef) => <GeneratorView generatorDef />
      }}
    </div>
  }
}
