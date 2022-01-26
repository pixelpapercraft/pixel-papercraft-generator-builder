module TextureFrame = Generator_TextureFrame

let px = n => Js.Int.toString(n) ++ "px"
let deg = n => Js.Int.toString(n) ++ "deg"
let makeBackgroundImage = url => "url(" ++ url ++ ")"
let makeBackgroundPosition = (x, y) => px(x) ++ " " ++ px(y)
let makeBackgroundSize = (x, y) => px(x) ++ " " ++ px(y)
let makeBorder = (size, style, color) => px(size) ++ " " ++ style ++ " " ++ color
let makeMargin = (t, r, b, l) => px(t) ++ " " ++ px(r) ++ " " ++ px(b) ++ " " ++ px(l)
let makePadding = (t, r, b, l) => px(t) ++ " " ++ px(r) ++ " " ++ px(b) ++ " " ++ px(l)

// https://tailwindcss.com/docs/background-color
let bgGray100 = "rgb(243 244 246)"
let bgGray200 = "rgb(229 231 235)"
let bgGray300 = "rgb(209 213 219)"
let bgGray400 = "rgb(156 163 175)"

let borderSize = 4

let makeTileBaseStyle = (isSelected, tileSize) => {
  let borderColor = isSelected ? bgGray400 : bgGray200
  ReactDOM.Style.make(
    ~border=makeBorder(borderSize, "solid", borderColor),
    ~width={px(tileSize + borderSize * 2)},
    ~height={px(tileSize + borderSize * 2)},
    (),
  )
}

let makeTileStyle = (
  textureDef: Generator.textureDef,
  frame: TextureFrame.frame,
  isSelected,
  isHover,
  tileSize,
) => {
  let {x, y, width, height} = frame
  let widthScale = Belt.Int.toFloat(tileSize) /. Belt.Int.toFloat(width)
  let heightScale = Belt.Int.toFloat(tileSize) /. Belt.Int.toFloat(height)

  let baseStyle = makeTileBaseStyle(isSelected || isHover, tileSize)

  let backgroundStyle = ReactDOM.Style.make(
    ~margin=makeMargin(0, borderSize, borderSize, 0),
    ~backgroundImage=makeBackgroundImage(textureDef.url),
    ~backgroundPosition=makeBackgroundPosition(
      -Belt.Float.toInt(Belt.Int.toFloat(x) *. widthScale),
      -Belt.Float.toInt(Belt.Int.toFloat(y) *. heightScale),
    ),
    ~backgroundRepeat="no-repeat",
    ~backgroundSize=makeBackgroundSize(
      Belt.Float.toInt(Belt.Int.toFloat(textureDef.standardWidth) *. widthScale),
      Belt.Float.toInt(Belt.Int.toFloat(textureDef.standardHeight) *. heightScale),
    ),
    (),
  )->ReactDOMStyle.unsafeAddStyle({
    "imageRendering": "pixelated",
  })

  ReactDOM.Style.combine(baseStyle, backgroundStyle)
}

module TileButton = {
  @react.component
  let make = (~textureDef, ~frame: TextureFrame.frame, ~isSelected, ~onClick) => {
    let (isHover, setIsHover) = React.useState(_ => false)
    let title =
      frame.frameCount > 1
        ? frame.name ++ "(Frame " ++ Belt.Int.toString(frame.frameIndex + 1) ++ ")"
        : frame.name
    <button
      title
      style={makeTileStyle(textureDef, frame, isSelected, isHover, 32)}
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

module Preview = {
  @react.component
  let make = (~textureDef: Generator.textureDef, ~frame: option<TextureFrame.frame>) => {
    <div className="p-2 flex justify-center">
      {switch frame {
      | None => <div style={makeTileBaseStyle(false, 128)} />
      | Some(frame) =>
        <div>
          <div style={makeTileStyle(textureDef, frame, false, false, 128)} />
          <div className="text-center text-gray-500"> {frame.name->React.string} </div>
        </div>
      }}
    </div>
  }
}

@react.component
let make = (
  ~textureDef: Generator.textureDef,
  ~frames: array<TextureFrame.frame>,
  ~onSelect: TextureFrame.frame => unit,
) => {
  let (search, setSearch) = React.useState(() => None)
  let (selectedFrame, setSelectedFrame) = React.useState(() => None)
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
    <div className="flex items-center">
      <div className="overflow-y-auto h-60 w-full">
        {Belt.Array.map(framesFiltered, frame => {
          let isSelected = Belt.Option.mapWithDefault(selectedFrame, false, (
            selectedFrame: TextureFrame.frame,
          ) => frame.id === selectedFrame.id)
          <TileButton
            key=frame.id
            textureDef
            frame
            isSelected
            onClick={_ => {
              setSelectedFrame(_ => Some(frame))
              onSelect(frame)
            }}
          />
        })->React.array}
      </div>
      <div className="hidden sm:block  w-[200px] overflow-hidden">
        <Preview textureDef frame=selectedFrame />
      </div>
    </div>
  </div>
}
