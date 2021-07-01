open FormInput

module TextureInput = {
  @react.component
  let make = (
    ~id: string,
    ~textures: Js.Dict.t<Builder.Texture.t>,
    ~choices: array<string>,
    ~onChange: option<Dom2.Image.t> => unit,
  ) => {
    let (name, setName) = React.useState(() => None)

    let onInputChange = e => {
      let target = ReactEvent.Form.target(e)
      let files: option<array<Dom2.File.t>> = target["files"]
      switch files {
      | None => ()
      | Some(files) => {
          let file = files[0]
          let fileReader = Dom2.FileReader.make()
          fileReader->Dom2.FileReader.setOnLoad(e => {
            let target = ReactEvent.Form.target(e)
            let result: option<string> = target["result"]
            switch result {
            | None => ()
            | Some(result) => {
                setName(_ => Some(file.name))
                Builder.ImageFactory.makeFromUrl(result)
                ->Promise.thenResolve(image => onChange(Some(image)))
                ->ignore
              }
            }
          })
          fileReader->Dom2.FileReader.readAsDataUrl(file)
        }
      }
    }

    let onChoiceChange = e => {
      let target = ReactEvent.Form.target(e)
      let value = target["value"]
      let texture = Js.Dict.get(textures, value)
      switch texture {
      | None => onChange(None)
      | Some(texture) => onChange(Some(texture.image))
      }
    }

    <div className="mb-4">
      <div className="font-bold"> {React.string(id)} </div>
      <div className="flex items-center">
        {Js.Array2.length(choices) > 0
          ? <div>
              <select onChange={onChoiceChange} className="p-2">
                <option value=""> {React.string("None")} </option>
                {choices
                ->Js.Array2.map(choice => {
                  <option key={choice} value={choice}> {React.string(choice)} </option>
                })
                ->React.array}
              </select>
              <span className="px-2"> {React.string("or")} </span>
            </div>
          : React.null}
        <div className="overflow-hidden relative w-48">
          <button
            className="bg-blue-500 rounded text-white py-1 px-4 w-full inline-flex items-center">
            <Icon.Upload /> <span className="ml-2"> {React.string("Choose file")} </span>
          </button>
          <input
            className="cursor-pointer absolute block opacity-0 top-0 bottom-0 left-0 right-0"
            type_="file"
            onChange={onInputChange}
          />
        </div>
        <div className="ml-3">
          {switch name {
          | None => React.null
          | Some(name) => React.string(name)
          }}
        </div>
      </div>
    </div>
  }
}

module BooleanInput = {
  @react.component
  let make = (~id, ~checked, ~onChange) => {
    let onInputChange = _ => onChange(!checked)
    <div className="mb-4">
      <div className="flex flex-col">
        {switch checked {
        | false =>
          <label className="mt-3 inline-flex items-center cursor-pointer">
            <span className="relative">
              <span className="block w-10 h-6 bg-gray-300 rounded-full shadow-inner" />
              <span
                className="absolute block w-4 h-4 mt-1 ml-1 bg-white rounded-full inset-y-0 left-0 focus-within:shadow-outline transition-transform duration-50 ease-in-out">
                <input
                  type_="checkbox" className="absolute opacity-0 w-0 h-0" onChange={onInputChange}
                />
              </span>
            </span>
            <span className="ml-3"> {React.string(id)} </span>
          </label>
        | true =>
          <label className="mt-3 inline-flex items-center cursor-pointer">
            <span className="relative">
              <span className="block w-10 h-6 bg-gray-300 rounded-full shadow-inner" />
              <span
                className="absolute block w-4 h-4 mt-1 ml-1 rounded-full inset-y-0 left-0 focus-within:shadow-outline transition-transform duration-50 ease-in-out bg-blue-500 transform translate-x-full">
                <input
                  type_="checkbox" className="absolute opacity-0 w-0 h-0" onChange={onInputChange}
                />
              </span>
            </span>
            <span className="ml-3"> {React.string(id)} </span>
          </label>
        }}
      </div>
    </div>
  }
}

module SelectInput = {
  @react.component
  let make = (~id, ~options, ~value, ~onChange) => {
    let onSelectChange = (e: ReactEvent.Form.t) => {
      let target = ReactEvent.Form.target(e)
      let value: option<string> = target["value"]
      switch value {
      | None => ()
      | Some(value) => onChange(value)
      }
    }
    <div className="mb-4">
      <div className="font-bold"> {React.string(id)} </div>
      <Select value={value} onChange={onSelectChange}>
        {Js.Array2.map(options, option => {
          <Option key={option} value={option}> {React.string(option)} </Option>
        })->React.array}
      </Select>
    </div>
  }
}

@react.component
let make = (~model: Builder.Model.t, ~onChange) => {
  let onTextureChange = (
    id: string,
    standardWidth: int,
    standardHeight: int,
    image: option<Builder.Image.t>,
  ) => {
    switch image {
    | None => {
        let model = Builder.clearTexture(model, id)
        onChange(model)
      }
    | Some(image) => {
        let texture = Builder.Texture.make(image, standardWidth, standardHeight)
        let model = Builder.addTexture(model, id, texture)
        onChange(model)
      }
    }
  }

  let onStringInputChange = (id: string, value: string) => {
    let model = Builder.setStringInputValue(model, id, value)
    onChange(model)
  }

  let onBooleanInputChange = (id: string, isChecked) => {
    let model = Builder.setBooleanInputValue(model, id, isChecked)
    onChange(model)
  }

  let onSelectInputChange = (id: string, value) => {
    let model = Builder.setSelectInputValue(model, id, value)
    onChange(model)
  }

  <div className="bg-gray-100 p-4 mb-8 rounded">
    {Js.Array2.map(model.inputs, variable => {
      switch variable {
      | RegionInput(_, _, _) => React.null
      | CustomStringInput(id, f) => <div key={id}> {f(onStringInputChange(id))} </div>
      | TextureInput(id, {standardWidth, standardHeight, choices}) =>
        <TextureInput
          key={id}
          id={id}
          choices={choices}
          textures={model.values.textures}
          onChange={onTextureChange(id, standardWidth, standardHeight)}
        />
      | BooleanInput(id) => {
          let checked = Builder.getBooleanInputValue(model, id)
          <BooleanInput key={id} id={id} onChange={onBooleanInputChange(id)} checked={checked} />
        }
      | SelectInput(id, options) => {
          let value = Builder.getSelectInputValue(model, id)
          <SelectInput
            key={id} id={id} options={options} value onChange={onSelectInputChange(id)}
          />
        }
      | RangeInput(_, _) => React.null
      }
    })->React.array}
  </div>
}
