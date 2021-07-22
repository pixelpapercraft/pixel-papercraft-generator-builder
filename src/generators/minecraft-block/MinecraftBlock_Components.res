module Textures = MinecraftBlock_Textures
module Face = MinecraftBlock_Face

type useState<'a> = ('a, ('a => 'a) => unit)

module TexturePicker = {
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
    ~textureDef,
    ~textureFrame: option<Textures.textureFrame>,
    ~rotation,
  ) => {
    let size = 128
    let borderSize = 1
    let width = size + borderSize * 2
    let height = size + borderSize * 2
    let base = ReactDOM.Style.make(
      ~width=px(width),
      ~height=px(height),
      ~border=`${px(borderSize)} solid white`,
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

  @react.component
  let make = (~versionId: string, ~onChange: string => unit) => {
    let (selectedTextureFrame, setSelectedTextureFrame): useState<
      option<Textures.textureFrame>,
    > = React.useState(() => None)
    let (rotation, setRotation) = React.useState(() => 0)

    let textureFrames = Textures.findTextureFrames(versionId)
    let textureDef = Textures.findTextureDef(versionId)

    let textureIsSelected = (textureId, frame) => {
      switch selectedTextureFrame {
      | None => false
      | Some(selectedTextureFrame) =>
        textureId == selectedTextureFrame.textureId && frame == selectedTextureFrame.frame
      }
    }

    switch (textureDef, textureFrames) {
    | (Some(textureDef), Some(textureFrames)) => {
        let (search, setSearch) = React.useState(() => None)
        let onSearchChange = e => {
          let target = ReactEvent.Form.target(e)
          let value = switch target["value"] {
          | None => None
          | Some(value) => Js.String2.length(value) === 0 ? None : Some(value)
          }
          setSearch(_ => value)
        }

        let textures = switch search {
        | None => textureFrames
        | Some(search) =>
          textureFrames->Js.Array2.filter(({textureId}) =>
            Js.String2.indexOf(textureId, search) >= 0
          )
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
              }
              onChange(Face.encodeFaceTexture(faceTexture))
            }
          }
        }

        <div className="mb-4">
          <div className="font-bold"> {React.string("Block Texture")} </div>
          <div>
            <input className="p-2 mb-2 w-full" placeholder="Search" onChange={onSearchChange} />
          </div>
          <div className="flex w-full">
            <div className="w-full">
              <div className="h-44 overflow-y-scroll">
                {textures
                ->Js.Array2.map(textureFrame => {
                  let {textureId, frame} = textureFrame

                  let key = textureId ++ ":" ++ Js.Int.toString(frame)

                  let onClick = _ => {
                    setSelectedTextureFrame(_ => Some(textureFrame))
                    setRotation(_ => 0)
                    let faceTexture: Face.faceTexture = {
                      versionId: versionId,
                      textureId: textureId,
                      frame: frame,
                      rot: 0,
                    }
                    onChange(Face.encodeFaceTexture(faceTexture))
                  }

                  <GridTile
                    key={key}
                    textureDef={textureDef}
                    textureFrame={textureFrame}
                    isSelected={textureIsSelected(textureId, frame)}
                    onClick={onClick}
                  />
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
        </div>
      }
    | _ => React.null
    }
  }
}
