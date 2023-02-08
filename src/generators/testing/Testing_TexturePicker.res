module TextSelector = {
  @react.component
  let make = (~onChange) => {
    let onInputChange = e => {
      let target = ReactEvent.Form.target(e)
      let text = switch target["value"] {
      | None => None
      | Some(text) => text
      }
      switch text {
      | None => ()
      | Some(value) => onChange(Some(value))
      }
    }

    <div className="flex">
      <div>
        <span> {"#"->React.string} </span>
        <input
          className="border border-gray-300 rounded text-gray-600 h-8 px-5 mr-4 bg-white"
          onChange={onInputChange}
        />
      </div>
    </div>
  }
}

@react.component
let make = (~onChange: string => unit) => {
  let onTextChange = text => {
    onChange(
      switch text {
      | None => "No Text"
      | Some(v) => v
      },
    )
  }

  <div className="mb-4">
    <div className="font-bold"> {React.string("Text input")} </div>
    <div className="mb-2"> <TextSelector onChange={onTextChange} /> </div>
  </div>
}
