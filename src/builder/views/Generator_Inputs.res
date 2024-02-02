module FormInput = Generator_FormInput
module Builder = Generator_Builder
module Icon = Generator_Icon
module Buttons = Generator_Buttons

module TextInput = {
  @react.component
  let make = (~id, ~onChange) => {
    let (inputValue, setInputValue) = React.useState(() => "")

    let onTextChange = e => {
      let target = ReactEvent.Form.target(e)
      let text = switch target["value"] {
      | None => None
      | Some(text) => text
      }
      switch text {
      | None => ()
      | Some(value) => setInputValue(value)
      }
    }

    let updateValue = () => {
      onChange(Some(inputValue))
    }
    let onKeyUp = e => {
      let keyCode = ReactEvent.Keyboard.which(e)
      if keyCode === 13 {
        updateValue()
      }
    }

    <div className="mb-4">
      <div className="font-bold"> {React.string(id)} </div>
      <div className="flex">
        <div>
          <input
            className="border border-gray-300 rounded text-gray-600 h-8 px-5 mr-2 bg-white"
            onChange={onTextChange}
            onKeyUp={onKeyUp}
          />
        </div>
        <div className="mb-4">
          <Buttons.Button
            key={id} onClick={_ => updateValue()} state=#Ready size=#Small color=#Blue>
            {React.string("Enter")}
          </Buttons.Button>
        </div>
      </div>
    </div>
  }
}

module TextureInput = {
  @react.component
  let make = (
    ~id: string,
    ~textures: Js.Dict.t<Generator_Texture.t>,
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
          switch file {
          | None => ()
          | Some(file) => {
              let fileReader = Dom2.FileReader.make()
              fileReader->Dom2.FileReader.setOnLoad(e => {
                let target = ReactEvent.Form.target(e)
                let result: option<string> = target["result"]
                switch result {
                | None => ()
                | Some(result) => {
                    setName(_ => Some(file.name))
                    Generator_ImageFactory.makeFromUrl(result)
                    ->Promise.thenResolve(image => onChange(Some(image)))
                    ->ignore
                  }
                }
              })
              fileReader->Dom2.FileReader.readAsDataUrl(file)
            }
          }
        }
      }
    }

    let onChoiceChange = e => {
      let target = ReactEvent.Form.target(e)
      let value = target["value"]
      let texture = Js.Dict.get(textures, value)
      switch texture {
      | None => onChange(None)
      | Some(texture) => onChange(Some(texture.imageWithCanvas.image))
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
        <div className="overflow-hidden relative w-36">
          <button
            className="bg-blue-500 hover:bg-blue-400 rounded text-white py-1 px-4 w-full inline-flex items-center">
            <Icon.Upload />
            <span className="ml-2"> {React.string("Choose file")} </span>
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

module SkinInput = {
  @react.component
  let make = (
    ~id: string,
    ~textures: Js.Dict.t<Generator_Texture.t>,
    ~choices: array<string>,
    ~onChange: option<Dom2.Image.t> => unit,
  ) => {
    let (name, setName) = React.useState(() => None)
    let (inputValue, setInputValue) = React.useState(() => "")

    let onInputChange = e => {
      let target = ReactEvent.Form.target(e)
      let files: option<array<Dom2.File.t>> = target["files"]
      switch files {
      | None => ()
      | Some(files) => {
          let file = files[0]
          switch file {
          | None => ()
          | Some(file) => {
              let fileReader = Dom2.FileReader.make()
              fileReader->Dom2.FileReader.setOnLoad(e => {
                let target = ReactEvent.Form.target(e)
                let result: option<string> = target["result"]
                switch result {
                | None => ()
                | Some(result) => {
                    setName(_ => Some(file.name))
                    Generator_ImageFactory.makeFromUrl(result)
                    ->Promise.thenResolve(image => onChange(Some(image)))
                    ->ignore
                  }
                }
              })
              fileReader->Dom2.FileReader.readAsDataUrl(file)
            }
          }
        }
      }
    }

    let onChoiceChange = e => {
      let target = ReactEvent.Form.target(e)
      let value = target["value"]
      let texture = Js.Dict.get(textures, value)
      switch texture {
      | None => onChange(None)
      | Some(texture) => onChange(Some(texture.imageWithCanvas.image))
      }
    }

    let onTextChange = e => {
      let target = ReactEvent.Form.target(e)
      let text = switch target["value"] {
      | None => None
      | Some(text) => text
      }

      switch text {
      | None => ()
      | Some(value) => setInputValue(value)
      }
    }

    let updateValue = () => {
      Generator_MinecraftSkinApi.getSkinImage(inputValue)
      ->Promise.thenResolve(image => onChange(Some(image)))
      ->ignore
    }

    let onKeyUp = e => {
      let keyCode = ReactEvent.Keyboard.which(e)
      if keyCode === 13 {
        updateValue()
      }
    }

    <div className="mb-4">
      <div className="font-bold"> {React.string(id)} </div>
      <div className="flex flex-wrap items-center">
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
        <div className="overflow-hidden relative w-36">
          <button
            className="bg-green-600 hover:bg-green-500 rounded text-white py-1 px-4 w-full inline-flex items-center">
            <Icon.Upload />
            <span className="ml-2"> {React.string("Choose file")} </span>
          </button>
          <input
            className="cursor-pointer absolute block opacity-0 top-0 bottom-0 left-0 right-0"
            type_="file"
            onChange={onInputChange}
          />
        </div>
        <div>
          <span className="px-2"> {React.string("or")} </span>
        </div>
        <div>
          {switch name {
          | None => React.null
          | Some(name) => React.string(name)
          }}
          <div>
            <div className="flex flex-wrap items-center">
              <div>
                <input
                  className="border border-gray-300 rounded text-gray-600 h-8 px-5 mr-2 bg-white"
                  placeholder="Enter Username..."
                  onChange={onTextChange}
                  onKeyUp={onKeyUp}
                />
              </div>
              <div>
                <Buttons.Button
                  key={id} onClick={_ => updateValue()} state=#Ready size=#Small color=#Green>
                  {React.string("Enter")}
                </Buttons.Button>
              </div>
            </div>
          </div>
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
      <FormInput.Select value={value} onChange={onSelectChange}>
        {Js.Array2.map(options, option => {
          <FormInput.Option key={option} value={option}> {React.string(option)} </FormInput.Option>
        })->React.array}
      </FormInput.Select>
    </div>
  }
}

module RangeInput = {
  @react.component
  let make = (~id, ~min, ~max, ~step, ~value, ~onChange) => {
    let onRangeChange = (e: ReactEvent.Form.t) => {
      let target = ReactEvent.Form.target(e)
      let value: option<string> = target["value"]
      switch value {
      | None => ()
      | Some(value) => {
          let value = Belt.Int.fromString(value)
          switch value {
          | None => ()
          | Some(value) => onChange(value)
          }
        }
      }
    }
    <div className="mb-4">
      <div className="font-bold"> {React.string(id)} </div>
      <input
        type_="range"
        min={min->Js.Int.toString}
        max={max->Js.Int.toString}
        value={value->Js.Int.toString}
        step={step->Js.Int.toFloat}
        onChange={onRangeChange}
      />
    </div>
  }
}

module ButtonInput = {
  @react.component
  let make = (~onClick, ~id) => {
    <div className="mb-4">
      <Buttons.Button key={id} onClick={_ => onClick()} state=#Ready size=#Small color=#Blue>
        {React.string(id)}
      </Buttons.Button>
    </div>
  }
}

module Text = {
  @react.component
  let make = (~text) => {
    <div className="mb-4">
      <p> {React.string(text)} </p>
    </div>
  }
}

@react.component
let make = (~model: Builder.Model.t, ~onChange) => {
  let onTextureChange = (
    id: string,
    standardWidth: int,
    standardHeight: int,
    image: option<Dom2.Image.t>,
  ) => {
    switch image {
    | None => {
        let model = Builder.clearTexture(model, id)
        onChange(model)
      }
    | Some(image) => {
        let texture = Generator_Texture.make(image, standardWidth, standardHeight)
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

  let onRangeInputChange = (id: string, value) => {
    let model = Builder.setRangeInputValue(model, id, value)
    onChange(model)
  }

  let onButtonInputClick = () => {
    onChange(Generator.getModel())
  }

  let onTextInputChange = (id: string, value) => {
    let text = switch value {
    | None => "None"
    | Some(v) => v
    }
    let model = Builder.setStringInputValue(model, id, text)
    onChange(model)
  }

  if Js.Array2.length(model.inputs) > 0 {
    <div className="bg-gray-100 p-4 mb-8 rounded">
      {Js.Array2.map(model.inputs, input => {
        switch input {
        | Text(id, text) => <Text key={id} text={text} />
        | RegionInput(_, _, _) => React.null
        | CustomStringInput(id, f) => <div key={id}> {f(onStringInputChange(id))} </div>
        | SkinInput(id, {standardWidth, standardHeight, choices}) =>
          <SkinInput
            key={id}
            id={id}
            choices={choices}
            textures={model.values.textures}
            onChange={onTextureChange(id, standardWidth, standardHeight)}
          />
        | TextureInput(id, {standardWidth, standardHeight, choices}) =>
          <TextureInput
            key={id}
            id={id}
            choices={choices}
            textures={model.values.textures}
            onChange={onTextureChange(id, standardWidth, standardHeight)}
          />
        | TextInput(id) => <TextInput key={id} id={id} onChange={onTextInputChange(id)} />
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
        | ButtonInput(id, onClick) =>
          <ButtonInput
            key={id}
            id={id}
            onClick={() => {
              onClick()
              onButtonInputClick()
            }}
          />
        | RangeInput(id, options) => {
            let value = Builder.getRangeInputValue(model, id)
            <RangeInput
              key={id}
              id={id}
              min={options.min}
              max={options.max}
              step={options.step}
              value
              onChange={onRangeInputChange(id)}
            />
          }
        }
      })->React.array}
    </div>
  } else {
    React.null
  }
}
