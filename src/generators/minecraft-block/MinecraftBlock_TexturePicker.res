module Builder = Generator.Builder

module Icon = Generator_Icon
module Textures = MinecraftBlock_Textures
module Face = MinecraftBlock_Face
module Tints = MinecraftBlock_Tints

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

let px = n => `${Js.Int.toString(n)}px`
let deg = n => `${Js.Int.toString(n)}deg`

let makeTileStyle = (
  ~textureDef: Generator.textureDef,
  ~frameIndex: int,
  ~size,
  ~width,
  ~height,
) => {
  let y = frameIndex / Textures.textureSize * -size
  ReactDOM.Style.make(
    ~backgroundImage={`url(${textureDef.url})`},
    ~backgroundPosition={`0px ${px(y)}`},
    ~backgroundRepeat="no-repeat",
    ~backgroundSize="cover",
    ~width={px(width)},
    ~height={px(height)},
    (),
  )->ReactDOMStyle.unsafeAddStyle({"imageRendering": "pixelated"})
}

let makePreviewTileStyle = (
  ~textureDef: Generator.textureDef,
  ~textureFrame: option<Textures.textureFrame>,
  ~rotation,
) => {
  let size = 128
  let width = size
  let height = size
  let base = ReactDOM.Style.make(
    ~width=px(width),
    ~height=px(height),
    ~backgroundColor="white",
    ~transform=`rotate(${deg(rotation * 90)})`,
    (),
  )
  switch textureFrame {
  | None => base
  | Some({frameIndex}) =>
    base->ReactDOM.Style.combine(makeTileStyle(~textureDef, ~frameIndex, ~size, ~width, ~height))
  }
}

let makeGridTileStyle = (~textureDef, frameIndex) => {
  let size = 32
  let borderSize = 4
  let width = size + borderSize * 2
  let height = width
  makeTileStyle(~textureDef, ~frameIndex, ~size, ~width, ~height)->ReactDOM.Style.combine(
    ReactDOM.Style.make(
      ~display="inline-block",
      ~borderWidth=px(borderSize),
      ~marginRight=px(6),
      ~marginBottom=px(6),
      (),
    ),
  )
}

let makeGridTileClassName = isSelected => {
  // Note: borderWidth is handled in makeGridTileStyle
  let borderDefault = "border-gray-300 hover:border-gray-400"
  let borderSelected = "border-blue-600"
  isSelected ? borderSelected : borderDefault
}

module GridTile = {
  @react.component
  let make = (~textureDef, ~textureFrame: Textures.textureFrame, ~isSelected, ~onClick) => {
    let {versionId, textureId, frame, frameIndex} = textureFrame
    let className = makeGridTileClassName(isSelected)
    let style = makeGridTileStyle(~textureDef, frameIndex)
    let title =
      Textures.findTextureFrameCount(versionId, textureId) > 1
        ? `${textureId} (Frame ${Js.Int.toString(frame)})`
        : textureId
    <button className={className} style={style} title={title} onClick={_ => onClick()}>
      <span dangerouslySetInnerHTML={"__html": "&nbsp;"} />
    </button>
  }
}

module PreviewTile = {
  @react.component
  let make = (~textureDef, ~textureFrame: option<Textures.textureFrame>, ~rotation) => {
    let style = makePreviewTileStyle(~textureDef, ~textureFrame, ~rotation)
    <div style={style} />
  }
}

type textureSingle = {
  textureId: string,
  textureFrame: Textures.textureFrame,
}

type textureMultiple = {
  textureId: string,
  textureFrames: array<Textures.textureFrame>,
}

type textureGroup = TextureSingle(textureSingle) | TextureMultiple(textureMultiple)

let getBlend = tint => {
  switch tint {
  | None => #None
  | Some(tint) => #MultiplyHex(tint)
  }
}

module GridTileSingle = {
  @react.component
  let make = (
    ~textureDef: Generator.textureDef,
    ~textureSingle: textureSingle,
    ~textureIsSelected: (string, int) => bool,
    ~onClick,
  ) => {
    let {textureId, textureFrame} = textureSingle
    let onClick = _ => {
      onClick(textureFrame)
    }
    let isSelected = textureIsSelected(textureId, textureFrame.frame)
    let key = textureId ++ ":" ++ Js.Int.toString(textureFrame.frame)
    <GridTile
      key={key}
      textureDef
      textureFrame
      isSelected
      onClick={_ => {
        onClick(textureFrame)
      }}
    />
  }
}

module GridTileMultiple = {
  @react.component
  let make = (
    ~textureDef: Generator.textureDef,
    ~textureMultiple: textureMultiple,
    ~textureIsSelected: (string, int) => bool,
    ~onClick: Textures.textureFrame => unit,
  ) => {
    // Mutiple frame grouping is supported, but it feels a bit weird to use
    // so keeping it turned off for now.
    let (isExpanded, setIsExpanded) = React.useState(_ => true)
    let {textureId, textureFrames} = textureMultiple
    if isExpanded {
      <>
        {textureFrames
        ->Belt.Array.map(textureFrame => {
          let isSelected = textureIsSelected(textureId, textureFrame.frame)
          let key = textureId ++ ":" ++ Js.Int.toString(textureFrame.frame)
          <GridTile
            key={key}
            textureDef
            textureFrame
            isSelected
            onClick={_ => {
              onClick(textureFrame)
            }}
          />
        })
        ->React.array}
      </>
    } else {
      let textureFrame = textureFrames->Belt.Array.getUnsafe(0)
      let isSelected = textureIsSelected(textureId, textureFrame.frame)
      let key = textureId ++ ":" ++ Js.Int.toString(textureFrame.frame)
      <>
        <GridTile
          key={key}
          textureDef
          textureFrame
          isSelected
          onClick={_ => {
            onClick(textureFrame)
          }}
        />
        <button
          className="border border-transparent hover:bg-gray-200 inline-flex items-center justify-center"
          style={ReactDOM.Style.make(
            ~width="40px",
            ~height="40px",
            ~marginRight="6px",
            ~marginBottom="6px",
            ~borderWidth="4px",
            (),
          )}
          onClick={_ => {
            setIsExpanded(_ => !isExpanded)
          }}>
          <Icon.ChevronDoubleRight size=#Small color=#Gray500 />
        </button>
      </>
    }
  }
}

@react.component
let make = (~versionId: string, ~onChange: string => unit) => {
  let (selectedTextureFrame, setSelectedTextureFrame): useState<
    option<Textures.textureFrame>,
  > = React.useState(() => None)
  let (rotation, setRotation) = React.useState(() => 0)
  let (search, setSearch) = React.useState(() => None)
  let (tint, setTint) = React.useState(() => None)

  let textureFrames = Textures.findTextureFrames(versionId)
  let textureDef = Textures.findTextureDef(versionId)

  let textureIsSelected = (textureId: string, frame: int) => {
    switch selectedTextureFrame {
    | None => false
    | Some(selectedTextureFrame) =>
      textureId == selectedTextureFrame.textureId && frame == selectedTextureFrame.frame
    }
  }

  switch (textureDef, textureFrames) {
  | (Some(textureDef), Some(textureFrames)) => {
      let onSearchChange = e => {
        let target = ReactEvent.Form.target(e)
        let value = switch target["value"] {
        | None => None
        | Some(value) => Js.String2.length(value) === 0 ? None : Some(value)
        }
        setSearch(_ => value)
      }

      let textureIds =
        textureFrames
        ->Belt.Array.reduce([], (acc, frame) => {
          let found = acc->Belt.Array.some(textureId => textureId === frame.textureId)
          found ? acc : Belt.Array.concat(acc, [frame.textureId])
        })
        ->Belt.SortArray.stableSortBy((textureId1, textureId2) =>
          Js.String2.localeCompare(textureId1, textureId2)->Belt.Float.toInt
        )

      let groups = textureIds->Belt.Array.reduce([], (acc, textureId) => {
        let frames = textureFrames->Belt.Array.keep(frame => frame.textureId === textureId)
        let frameCount = Belt.Array.length(frames)
        if frameCount === 0 {
          acc
        } else if frameCount === 1 {
          let frame = frames->Belt.Array.getUnsafe(0)
          let group = TextureSingle({textureId: textureId, textureFrame: frame})
          Belt.Array.concat(acc, [group])
        } else {
          let group = TextureMultiple({textureId: textureId, textureFrames: frames})
          Belt.Array.concat(acc, [group])
        }
      })

      let groups = switch search {
      | None => groups
      | Some(search) =>
        groups->Belt.Array.keep(group => {
          let textureId = switch group {
          | TextureSingle({textureId}) => textureId
          | TextureMultiple({textureId}) => textureId
          }
          Js.String2.indexOf(textureId, search) >= 0
        })
      }

      let onRotate = _ => {
        // 0 = 0°
        // 1 = 90°
        // 2 = 180°
        // 3 = 270°
        let rotation = rotation + 1
        let rotation = rotation > 3 ? 0 : rotation
        setRotation(_ => rotation)
        switch selectedTextureFrame {
        | None => ()
        | Some({versionId, textureId, frame}) => {
            let faceTexture: Face.faceTexture = {
              versionId: versionId,
              textureId: textureId,
              frame: frame,
              rot: rotation,
              blend: getBlend(tint),
            }
            onChange(Face.encodeFaceTexture(faceTexture))
          }
        }
      }

      let onTintChange = tint => {
        setTint(_ => tint)
        switch selectedTextureFrame {
        | None => ()
        | Some({versionId, textureId, frame}) => {
            let faceTexture: Face.faceTexture = {
              versionId: versionId,
              textureId: textureId,
              frame: frame,
              rot: rotation,
              blend: getBlend(tint),
            }
            onChange(Face.encodeFaceTexture(faceTexture))
          }
        }
      }

      let onClickGridTile = (textureFrame: Textures.textureFrame) => {
        setSelectedTextureFrame(_ => Some(textureFrame))
        setRotation(_ => 0)
        let faceTexture: Face.faceTexture = {
          versionId: textureFrame.versionId,
          textureId: textureFrame.textureId,
          frame: textureFrame.frame,
          rot: 0,
          blend: getBlend(tint),
        }
        onChange(Face.encodeFaceTexture(faceTexture))
      }

      <div className="mb-4">
        <div className="font-bold"> {React.string("Block Texture")} </div>
        <div>
          <input className="p-2 mb-2 w-full" placeholder="Search" onChange={onSearchChange} />
        </div>
        <div className="flex w-full">
          <div className="w-full">
            <div className="h-44 overflow-y-scroll">
              {groups
              ->Belt.Array.map(group => {
                switch group {
                | TextureSingle(textureSingle) =>
                  <GridTileSingle
                    key={textureSingle.textureId}
                    textureSingle
                    textureDef
                    textureIsSelected
                    onClick=onClickGridTile
                  />
                | TextureMultiple(textureMultiple) =>
                  <GridTileMultiple
                    key={textureMultiple.textureId}
                    textureMultiple
                    textureDef
                    textureIsSelected
                    onClick=onClickGridTile
                  />
                }
              })
              ->React.array}
            </div>
          </div>
          <div className="flex flex-col w-40 items-center px-8">
            <PreviewTile
              textureDef={textureDef} textureFrame={selectedTextureFrame} rotation={rotation}
            />
            <div>
              <button
                className="bg-blue-500 rounded text-white my-4 py-1 px-4 text-center"
                onClick={onRotate}>
                {React.string("Rotate")}
              </button>
            </div>
          </div>
        </div>
        <div className="mb-2"> <TintSelector onChange={onTintChange} /> </div>
      </div>
    }
  | _ => React.null
  }
}
