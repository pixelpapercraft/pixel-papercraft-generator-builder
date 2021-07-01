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
