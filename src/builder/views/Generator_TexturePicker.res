module TextureFrame = Generator_TextureFrame
module Icon = Generator_Icon
module Tints = Generator_Tints

external asJson: 'a => Js.Json.t = "%identity"

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

  let isValidTint = tint => {
    switch Generator_Texture.hexToRGB(tint) {
    | None => false
    | Some(_) => true
    }
  }

  let normalizeTint = tint => {
    let tint = Js.String2.trim(tint)
    if Js.String2.length(tint) === 0 {
      None
    } else {
      let tint = if Js.String2.startsWith(tint, "#") {
        tint
      } else {
        "#" ++ tint
      }
      if isValidTint(tint) {
        Some(tint)
      } else {
        None
      }
    }
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
      | Some(tint) => normalizeTint(tint)
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

module Rotation = {
  type t = Rot0 | Rot90 | Rot180 | Rot270

  let next = (rotation: t): t => {
    switch rotation {
    | Rot0 => Rot90
    | Rot90 => Rot180
    | Rot180 => Rot270
    | Rot270 => Rot0
    }
  }

  let toDegrees = (rotation: t) => {
    switch rotation {
    | Rot0 => 0.0
    | Rot90 => 90.0
    | Rot180 => 180.0
    | Rot270 => 270.0
    }
  }
}

module Flip = {
  type t = Generator_Texture.flip

  let next = (current: t, flip: t, rotation: Rotation.t) => {
    switch (current, flip) {
    | (#None, #None) => (#None, rotation)
    | (#None, #Vertical) => (#Vertical, rotation)
    | (#None, #Horizontal) => (#Horizontal, rotation)
    | (#Vertical, #None) => (#Vertical, rotation)
    | (#Vertical, #Vertical) => (#None, rotation)
    | (#Vertical, #Horizontal) => (#None, rotation->Rotation.next->Rotation.next)
    | (#Horizontal, #None) => (#Horizontal, rotation)
    | (#Horizontal, #Vertical) => (#None, rotation->Rotation.next->Rotation.next)
    | (#Horizontal, #Horizontal) => (#None, rotation)
    }
  } // It needs to access rotation! (for 180 degrees) COnsult block generator and/or drawCuboid(?)
  let toTransform = (flip: t) => {
    switch flip {
    | #Horizontal => "scaleX(-1)"
    | #Vertical => "scaleY(-1)"
    | #None => ""
    }
  }

  let toString = (flip: t) => {
    switch flip {
    | #Horizontal => "#Horizontal"
    | #Vertical => "#Vertical"
    | #None => "#None"
    }
  }
}

module SelectedTexture = {
  type t = {
    textureDefId: string,
    frame: TextureFrame.frame,
    rotation: Rotation.t,
    flip: Generator_Texture.flip,
    blend: Generator_Texture.blend,
  }

  external asSelectedTexture: Js.Json.t => t = "%identity"
  external asSelectedTextureArray: Js.Json.t => array<t> = "%identity"

  let encode = (selectedTexture: t) => {
    selectedTexture->asJson->Js.Json.serializeExn
  }

  let decode = (json: string) => {
    if Js.String2.length(json) > 0 {
      Some(json->Js.Json.deserializeUnsafe->asSelectedTexture)
    } else {
      None
    }
  }

  let encodeArray = (selectedTextures: array<t>) => {
    selectedTextures->asJson->Js.Json.serializeExn
  }

  let decodeArray = (json: string) => {
    if Js.String2.length(json) > 0 {
      json->Js.Json.deserializeUnsafe->asSelectedTextureArray
    } else {
      []
    }
  }
}

let px = n => Js.Int.toString(n) ++ "px"
let deg = n => Js.Float.toString(n) ++ "deg"
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
  let (x, y, width, height) = frame.rectangle
  let widthScale = Belt.Int.toFloat(tileSize) /. Belt.Int.toFloat(width)
  let heightScale = Belt.Int.toFloat(tileSize) /. Belt.Int.toFloat(height)

  let baseStyle = makeTileBaseStyle(isSelected || isHover, tileSize)

  let backgroundStyle = ReactDOM.Style.make(
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

let getBlend = tint => {
  switch tint {
  | None => #None
  | Some(tint) => #MultiplyHex(tint)
  }
}

module TileButton = {
  @react.component
  let make = (~textureDef, ~frame: TextureFrame.frame, ~isSelected, ~onClick) => {
    let (isHover, setIsHover) = React.useState(_ => false)
    let label = TextureFrame.makeFrameLabel(frame)
    let tileStyle = makeTileStyle(textureDef, frame, isSelected, isHover, 32)
    let buttonStyle = ReactDOM.Style.make(~margin=makeMargin(0, borderSize, borderSize, 0), ())
    let style = ReactDOM.Style.combine(tileStyle, buttonStyle)
    <button
      title={label}
      style
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
  let make = (
    ~textureDef: Generator.textureDef,
    ~frame: option<TextureFrame.frame>,
    ~rotation: Rotation.t,
    ~flip: Generator_Texture.flip,
  ) => {
    <div className="flex flex-col items-center" style={ReactDOM.Style.make(~width="148px", ())}>
      {switch frame {
      | None => {
          let frame: TextureFrame.frame = {
            id: "",
            name: "Erase",
            rectangle: (0, 0, 0, 0),
            frameIndex: 0,
            frameCount: 0,
          }
          <>
            <div style={makeTileBaseStyle(false, 128)} />
            <div className="text-center text-gray-500 p-2 pt-0">
              {TextureFrame.makeFrameLabel(frame)->React.string}
            </div>
          </>
        }
      | Some(frame) => {
          let rotationDegrees = Rotation.toDegrees(rotation)
          let flipTransform = Flip.toTransform(flip)
          let tileStyle = makeTileStyle(textureDef, frame, false, false, 128)
          let transformStyle = ReactDOM.Style.make(
            ~transform=`rotate(${deg(rotationDegrees)}) ${flipTransform}`,
            (),
          )
          let style = ReactDOM.Style.combine(tileStyle, transformStyle)

          <>
            <div style />
            <div className="text-center text-gray-500 p-2 pt-0">
              {TextureFrame.makeFrameLabel(frame)->React.string}
            </div>
          </>
        }
      }}
    </div>
  }
}

module RotationButton = {
  @react.component
  let make = (~onClick) => {
    let icon = <Icon.ArrowsCircle color=#White />
    <button
      className="bg-blue-500 hover:bg-blue-400 rounded  
    flex items-center justify-center w-10 h-10"
      onClick>
      {icon}
    </button>
  }
}

module EraseButton = {
  @react.component
  let make = (~onClick) => {
    let icon = <Icon.Erase color=#White />
    <button
      className="bg-red-500 hover:bg-red-400 rounded  
       flex items-center justify-center w-10 h-10"
      onClick>
      {icon}
    </button>
  }
}

module FlipHorizontalButton = {
  @react.component
  let make = (~onClick) => {
    let icon = <Icon.ArrowsHorizontal color=#White />
    <button
      className="bg-green-600 hover:bg-green-500 rounded  
       flex items-center justify-center w-10 h-10"
      onClick>
      {icon}
    </button>
  }
}

module FlipVerticalButton = {
  @react.component
  let make = (~onClick) => {
    let icon = <Icon.ArrowsVertical color=#White />
    <button
      className="bg-green-600 hover:bg-green-500 rounded  
       flex items-center justify-center w-10 h-10"
      onClick>
      {icon}
    </button>
  }
}

@react.component
let make = (
  ~textureDef: Generator.textureDef,
  ~frames: array<TextureFrame.frame>,
  ~onSelect: SelectedTexture.t => unit,
  ~enableRotation: bool=true,
  ~enableErase: bool=true,
) => {
  let (search, setSearch) = React.useState(() => None)
  let (selectedFrame, setSelectedFrame) = React.useState(() => None)
  let (rotation, setRotation) = React.useState(() => Rotation.Rot0)
  let (flip, setFlip) = React.useState(() => #None)
  let (tint, setTint) = React.useState(() => None)

  let framesFiltered = switch search {
  | None => frames
  | Some(search) =>
    Belt.Array.keep(frames, frame => {
      Js.String2.indexOf(frame.name, search) >= 0
    })
  }

  let onRotateClick = () => {
    let nextRotation = Rotation.next(rotation)
    setRotation(_ => nextRotation)
    /* let toString = "Rotate: (" ++ Flip.toString(flip) ++ ", " ++ Belt.Float.toString(Rotation.toDegrees(nextRotation)) ++ ")"
     Js.Console.log(toString) */
    switch selectedFrame {
    | None => ()
    | Some(frame) => {
        let selectedTexture: SelectedTexture.t = {
          textureDefId: textureDef.id,
          frame,
          rotation: nextRotation,
          flip,
          blend: getBlend(tint),
        }
        onSelect(selectedTexture)
      }
    }
  }
  let onFlipClick = (~vertical: bool=false) => {
    let (nextFlip, nextRotation) = Flip.next(vertical ? #Vertical : #Horizontal, flip, rotation)
    setFlip(_ => nextFlip)
    setRotation(_ => nextRotation)
    /* let toString = "Flip: (" ++ Flip.toString(nextFlip) ++ ", " ++ Belt.Float.toString(Rotation.toDegrees(nextRotation)) ++ ")"
     Js.Console.log(toString) */
    switch selectedFrame {
    | None => ()
    | Some(frame) => {
        let selectedTexture: SelectedTexture.t = {
          textureDefId: textureDef.id,
          frame,
          rotation: nextRotation,
          flip: nextFlip,
          blend: getBlend(tint),
        }
        onSelect(selectedTexture)
      }
    }
  }

  let onEraseClick = () => {
    setRotation(_ => Rot0)
    setSelectedFrame(_ => None)
    switch selectedFrame {
    | None => ()
    | Some(frame) => {
        let selectedTexture: SelectedTexture.t = {
          textureDefId: "",
          frame,
          rotation: Rot0,
          flip,
          blend: getBlend(tint),
        }
        onSelect(selectedTexture)
      }
    }
  }

  let onTintChange = tint => {
    setTint(_ => tint)
    switch selectedFrame {
    | None => ()
    | Some(frame) => {
        let selectedTexture: SelectedTexture.t = {
          textureDefId: textureDef.id,
          frame,
          rotation,
          flip,
          blend: getBlend(tint),
        }
        onSelect(selectedTexture)
      }
    }
  }

  let onSelectClick = (frame: TextureFrame.frame) => {
    setRotation(_ => Rot0)
    setFlip(_ => #None)
    setSelectedFrame(_ => Some(frame))
    let selectedTexture: SelectedTexture.t = {
      textureDefId: textureDef.id,
      frame,
      rotation: Rot0,
      flip: #None,
      blend: getBlend(tint),
    }
    onSelect(selectedTexture)
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
    <div className="flex xitems-center">
      <div className="overflow-y-auto h-80 w-full">
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
              onSelectClick(frame)
            }}
          />
        })->React.array}
      </div>
      <div className="ml-4">
        <Preview textureDef frame=selectedFrame rotation flip />
        <div className="flex justify-around">
          {enableRotation ? <RotationButton onClick={_ => onRotateClick()} /> : React.null}
          {enableErase ? <EraseButton onClick={_ => onEraseClick()} /> : React.null}
        </div>
        <div className="flex justify-around mt-4">
          {enableRotation
            ? <FlipHorizontalButton onClick={_ => onFlipClick(~vertical=false)} />
            : React.null}
          {enableRotation
            ? <FlipVerticalButton onClick={_ => onFlipClick(~vertical=true)} />
            : React.null}
        </div>
      </div>
    </div>
    <div className="mb-2 mt-4">
      <TintSelector onChange={onTintChange} />
    </div>
  </div>
}
