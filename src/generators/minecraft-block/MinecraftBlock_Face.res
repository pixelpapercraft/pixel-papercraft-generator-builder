module Builder = Generator.Builder

module Textures = MinecraftBlock_Textures

module TexturePicker = Generator_TexturePicker

type versionId = string
type textureId = string
type frame = int
type rotation = int // 0 = 0°, 1 = 90°, 2 = 180°, 3 = 270°
type faceTexture = {
  versionId: string,
  textureId: string,
  frame: int,
  rot: int,
  blend: Generator_Texture.blend,
}
type faceTextures = array<faceTexture>

external asJson: 'a => Js.Json.t = "%identity"
external asFaceTexture: Js.Json.t => faceTexture = "%identity"
external asFaceTextures: Js.Json.t => faceTextures = "%identity"

let encodeFaceTexture = (faceTexture: faceTexture): string => {
  asJson(faceTexture)->Js.Json.stringify
}

let decodeFaceTexture = (s: string): faceTexture => {
  if Js.String2.length(s) === 0 {
    {versionId: "", textureId: "", frame: 0, rot: 0, blend: #None}
  } else {
    Js.Json.parseExn(s)->asFaceTexture
  }
}

let encodeFaceTextures = (faceTextures: faceTextures): string => {
  asJson(faceTextures)->Js.Json.stringify
}

let decodeFaceTextures = (s: string): faceTextures => {
  if Js.String2.length(s) === 0 {
    []
  } else {
    Js.Json.parseExn(s)->asFaceTextures
  }
}

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
        let selectedTextureFrames = Belt.Array.concat(selectedTextureFrames, [selectedTextureFrame])
        Generator.setStringInputValue(
          faceId,
          TexturePicker.SelectedTexture.encodeArray(selectedTextureFrames),
        )
      }
    | None => ()
    }
    /* let curentFaceTextures = Generator.getStringInputValue(faceId)->decodeFaceTextures
    let newFaceTextures = Js.Array2.concat(curentFaceTextures, [faceTexture])
    let newFaceTexturesString = encodeFaceTextures(newFaceTextures)
    Generator.setStringInputValue(faceId, newFaceTexturesString)*/
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
  let {textureDefId, frame, rotation, blend} = face // selectedTextureFrame
  // {id, name, rectangle, frameIndex, frameCount} = frame // Might only need rectangle anyways
  //switch Textures.findTextureFrameIndex(versionId, textureId, frame) {
  //| None => ()
  //| Some(index) => {
  // The texture image file is a column of texture images.
  // Each individual texture is 16 x 16.
  // So to locate a single texture, we use coordinates:
  // x = 0
  // y = index * 16
  // width = 16
  // height = 16
  let (tx, ty, tw, th) = frame.rectangle
  let ix = tx + sx
  let iy = ty + sy
  //let size = 128
  //let source = (sx, index * 16 + sy, sw, sh)
  let source = switch rotation {
  | Rot0 => (ix, iy, sw, sh) // Default positions
  | Rot90 => (tx + sy, ty + tw - (sw + sx), sh, sw) //(sy, i + 16 - (sw + sx), sh, sw) // ()
  | Rot180 => (tx + tw - (sw + sx), ty + th - (sh + sy), sw, sh) //(16 - (sw + sx), i + 16 - (sh + sy), sw, sh)
  | Rot270 => (tx + th - (sh + sy), ty + sx, sh, sw) //(16 - (sh + sy), ix, sh, sw)
  }
  let destination = switch rotation {
  | Rot0 => (dx, dy, dw, dh)
  | Rot90 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
  | Rot180 => (dx, dy, dw, dh)
  | Rot270 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
  }
  let rot = rotate +. TexturePicker.Rotation.toDegrees(rotation)
  Generator.drawTexture(textureDefId, source, destination, ~flip, ~rotate={rot}, ~blend={blend}, ())
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
