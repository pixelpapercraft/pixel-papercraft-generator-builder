module Builder = Generator.Builder

module TexturePicker = Generator_TexturePicker

let defineInputRegion = (faceId, region) => {
  Generator.defineRegionInput(region, () => {
    let selectedTextureFrame = TexturePicker.SelectedTexture.decode(
      Generator.getStringInputValue("SelectedTextureFrame"),
    )
    let selectedTextureFrames = TexturePicker.SelectedTexture.decodeArray(
      Generator.getStringInputValue(faceId),
    )
    switch selectedTextureFrame {
    | Some(selectedTextureFrame) => {
        //if textureDefId = "" erase
        let newTextureFrames = if selectedTextureFrame.textureDefId == "" {
          let _ = Js.Array2.pop(selectedTextureFrames)
          selectedTextureFrames
        } else {
          Belt.Array.concat(selectedTextureFrames, [selectedTextureFrame])
        }
        Generator.setStringInputValue(
          faceId,
          TexturePicker.SelectedTexture.encodeArray(newTextureFrames),
        )
      }
    | None => ()
    }
  })
}

let drawTexture = (
  face: TexturePicker.SelectedTexture.t,
  (sx, sy, sw, sh),
  (dx, dy, dw, dh),
  ~flip: Generator_Texture.flip=#None,
  ~rotate: float=0.0,
  (),
) => {
  let {textureDefId, frame, rotation, flip: textureFlip, blend} = face // selectedTextureFrame
  let (tx, ty, tw, th) = frame.rectangle
  let ix = tx + sx
  let iy = ty + sy

  let (newFlip, rotation) = TexturePicker.Flip.next(flip, textureFlip, rotation)

  let source = switch rotation {
  | Rot0 => (ix, iy, sw, sh) // Default positions
  | Rot90 => (tx + sy, ty + tw - (sw + sx), sh, sw)
  | Rot180 => (tx + tw - (sw + sx), ty + th - (sh + sy), sw, sh)
  | Rot270 => (tx + th - (sh + sy), ty + sx, sh, sw)
  }
  let destination = switch rotation {
  | Rot0 => (dx, dy, dw, dh)
  | Rot90 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
  | Rot180 => (dx, dy, dw, dh)
  | Rot270 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
  }
  let rot = rotate +. TexturePicker.Rotation.toDegrees(rotation)
  Generator.drawTexture(
    textureDefId,
    source,
    destination,
    ~flip={newFlip},
    ~rotate={rot},
    ~blend={blend},
    (),
  )
}

let draw = (
  faceId,
  source,
  destination,
  ~flip: Generator_Texture.flip=#None,
  ~rotate: float=0.0,
  (),
) => {
  let selectedTextureFrames = TexturePicker.SelectedTexture.decodeArray(
    Generator.getStringInputValue(faceId),
  )
  selectedTextureFrames->Js.Array2.forEach(selectedTextureFrame => {
    drawTexture(selectedTextureFrame, source, destination, ~flip, ~rotate, ())
  })
}
