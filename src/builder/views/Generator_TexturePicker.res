module TextureFrame = Generator_TextureFrame

let {
  px,
  makeBackgroundImage,
  makeBackgroundPosition,
  makeBackgroundSize,
  makeBorder,
  makeMargin,
} = module(Generator_TexturePickerUtils)

// https://tailwindcss.com/docs/background-color
let bgGray100 = "rgb(243 244 246)"
let bgGray200 = "rgb(229 231 235)"
let bgGray300 = "rgb(209 213 219)"
let bgGray400 = "rgb(156 163 175)"

let makeTileStyle = (textureDef: Generator.textureDef, x, y, width, height, scale, isHover) => {
  let borderSize = 4
  ReactDOM.Style.make(
    ~border=makeBorder(borderSize, "solid", isHover ? bgGray400 : bgGray200),
    ~margin=makeMargin(0, borderSize, borderSize, 0),
    ~backgroundImage=makeBackgroundImage(textureDef.url),
    ~backgroundPosition=makeBackgroundPosition(-x * scale, -y * scale),
    ~backgroundRepeat="no-repeat",
    ~backgroundSize=makeBackgroundSize(
      textureDef.standardWidth * scale,
      textureDef.standardHeight * scale,
    ),
    ~width={px(width * scale + borderSize * 2)},
    ~height={px(height * scale + borderSize * 2)},
    (),
  )->ReactDOMStyle.unsafeAddStyle({
    "imageRendering": "pixelated",
  })
}

module TileButton = {
  @react.component
  let make = (~title, ~texture, ~x, ~y, ~width, ~height, ~scale, ~onClick) => {
    let (isHover, setIsHover) = React.useState(_ => false)
    <button
      title
      style={makeTileStyle(texture, x, y, width, height, scale, isHover)}
      onClick
      onMouseEnter={_ => setIsHover(_ => true)}
      onMouseLeave={_ => setIsHover(_ => false)}
    />
  }
}

module Search = {
  @react.component
  let make = (~value, ~onChange, ~onClear) => {
    let onInputChange = e => {
      let target = ReactEvent.Form.target(e)
      let value = switch target["value"] {
      | None => None
      | Some(value) => Js.String2.length(value) === 0 ? None : Some(value)
      }
      onChange(value)
    }
    let value = switch value {
    | None => ""
    | Some(value) => value
    }
    <div className="relative flex items-center mb-4">
      <input
        className="border w-full p-2" placeholder="Search ..." value onChange={onInputChange}
      />
      <button className="absolute right-2" onClick={_ => onClear()}>
        {<Generator_Icon.X color=#Gray500 />}
      </button>
    </div>
  }
}

@react.component
let make = (
  ~texture: Generator.textureDef,
  ~frames: array<TextureFrame.frame>,
  ~onSelect: TextureFrame.frame => unit,
) => {
  let (search, setSearch) = React.useState(() => None)
  let framesFiltered = switch search {
  | None => frames
  | Some(search) =>
    Belt.Array.keep(frames, frame => {
      Js.String2.indexOf(frame.name, search) >= 0
    })
  }
  <div>
    <Search
      value=search
      onChange={value => {
        setSearch(_ => value)
      }}
      onClear={_ => {
        setSearch(_ => None)
      }}
    />
    <div className="overflow-y-auto h-60">
      {Belt.Array.map(framesFiltered, frame => {
        let {name, x, y, width, height, frameIndex} = frame
        let scale = 2
        <TileButton
          key={name ++ "_" ++ Belt.Int.toString(frameIndex)}
          title=name
          texture
          x
          y
          width
          height
          scale
          onClick={_ => {
            onSelect(frame)
          }}
        />
      })->React.array}
    </div>
  </div>
}
