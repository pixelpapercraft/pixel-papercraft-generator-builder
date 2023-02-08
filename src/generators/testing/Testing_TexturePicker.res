module Builder = Generator.Builder

module Icon = Generator_Icon
module Textures = Testing_Textures
module Face = Testing_Face
module Tints = Testing_Tints

type useState<'a> = ('a, ('a => 'a) => unit)

module TintSelector = {
  type selectedTint = NoTint | CustomTint | HexTint(string)

  let makeOptions = tints => {
    tints
    ->Belt.Array.mapWithIndex((index1, {biomes, color}: Tints.tint) => {
      biomes->Belt.Array.mapWithIndex((index2, biome) => {
        let key = Js.Int.toString(index1) ++ "-" ++ Js.Int.toString(index2)
        <option key={key} value={color}> {biome->React.string} </option>
      })
    })
    ->Belt.Array.concatMany
    ->React.array
  }

  @react.component
  let make = (~onChange) => {
    let (selectedTint, setSelectedTint) = React.useState(() => NoTint)
    let (customTint, setCustomTint) = React.useState(() => None)

    let onSelectChange = e => {
      let target = ReactEvent.Form.target(e)
      let tint = switch target["value"] {
      | None => NoTint
      | Some(value) =>
        switch value {
        | "None" => NoTint
        | "Custom" => CustomTint
        | _ => HexTint(value)
        }
      }
      setSelectedTint(_ => tint)
      switch tint {
      | NoTint => onChange(None)
      | CustomTint => onChange(None)
      | HexTint(value) => onChange(Some(value))
      }
    }

    let onInputChange = e => {
      let target = ReactEvent.Form.target(e)
      let tint = switch target["value"] {
      | None => None
      | Some(tint) => tint
      }
      setCustomTint(_ => tint)
      switch tint {
      | None => ()
      | Some(value) => onChange(Some(value))
      }
    }

    let color = switch selectedTint {
    | NoTint => None
    | CustomTint => customTint
    | HexTint(color) => Some(color)
    }

    <div className="flex">
      <select
        placeholder="Tint"
        onChange={onSelectChange}
        className="border border-gray-300 rounded text-gray-600 h-8 pl-5 pr-10 mr-4 bg-white hover:border-gray-400 focus:outline-none appearance-none">
        <option value="None"> {"No tint"->React.string} </option>
        <option value="Custom"> {"Custom tint"->React.string} </option>
        <optgroup key="grass" label="Grass"> {makeOptions(Tints.tints.grass)} </optgroup>
        <optgroup key="foliage" label="Foliage"> {makeOptions(Tints.tints.foliage)} </optgroup>
        <optgroup key="water" label="Water"> {makeOptions(Tints.tints.water)} </optgroup>
      </select>
      {switch selectedTint {
      | CustomTint =>
        <div>
          <span> {"#"->React.string} </span>
          <input
            className="border border-gray-300 rounded text-gray-600 h-8 px-5 mr-4 bg-white"
            onChange={onInputChange}
          />
        </div>
      | _ => React.null
      }}
      {switch color {
      | None => React.null
      | Some(color) =>
        <div>
          <div className="border w-8 h-8" style={ReactDOM.Style.make(~backgroundColor=color, ())} />
        </div>
      }}
    </div>
  }
}

let getBlend = tint => {
  switch tint {
  | None => #None
  | Some(tint) => #MultiplyHex(tint)
  }
}

@react.component
let make = (~onChange: string => unit) => {
  let onTintChange = tint => {
    Js.Console.log("onTintChange just ran")
    onChange(
      switch tint {
      | None => "No Text"
      | Some(v) => v
      },
    )
  }

  <div className="mb-4">
    <div className="font-bold"> {React.string("Block Texture")} </div>
    <div className="mb-2"> <TintSelector onChange={onTintChange} /> </div>
  </div>
}
