module Builder = Generator.Builder

module Textures = MinecraftBlock_Textures

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
    let faceTextureString = Generator.getStringInputValue(
      MinecraftBlock_Constants.currentBlockTextureId,
    )
    let faceTexture = faceTextureString->decodeFaceTexture
    let curentFaceTextures = Generator.getStringInputValue(faceId)->decodeFaceTextures
    let newFaceTextures = Js.Array2.concat(curentFaceTextures, [faceTexture])
    let newFaceTexturesString = encodeFaceTextures(newFaceTextures)
    Generator.setStringInputValue(faceId, newFaceTexturesString)
  })
}

let drawTexture = (
  face,
  (sx, sy, sw, sh),
  (dx, dy, dw, dh),
  ~flip: Generator_Texture.flip=#None,
  ~rotate: float=0.0,
  (),
) => {
  let {versionId, textureId, frame, rot, blend} = face
  switch Textures.findTextureFrameIndex(versionId, textureId, frame) {
  | None => ()
  | Some(index) => {
      // The texture image file is a column of texture images.
      // Each individual texture is 16 x 16.
      // So to locate a single texture, we use coordinates:
      // x = 0
      // y = index * 16
      // width = 16
      // height = 16
      let ix = index + sx
      let iy = index + sy
      let i = index
      //let size = 128
      //let source = (sx, index * 16 + sy, sw, sh)
      let source = switch rot {
      | 0 => (sx, iy, sw, sh)
      | 1 => (sy, i + 16 - (sw + sx), sh, sw)
      | 2 => (16 - (sw + sx), i + 16 - (sh + sy), sw, sh)
      | 3 => (16 - (sh + sy), ix, sh, sw)
      | _ => (sx, iy, sw, sh)
      }
      let destination = switch rot {
      | 0 => (dx, dy, dw, dh)
      | 1 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
      | 2 => (dx, dy, dw, dh)
      | 3 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
      | _ => (dx, dy, dw, dh)
      }
      //let destination = (dx, dy, dw, dh)
      let rot = (Belt.Float.toInt(rotate) + rot * 90)->Js.Int.toFloat
      Generator.drawTexture(
        versionId,
        source,
        destination,
        ~flip,
        ~rotate={rot},
        ~blend={blend},
        (),
      )
    }
  }
}

let draw = (
  faceId,
  source,
  destination,
  ~flip: Generator_Texture.flip=#None,
  ~rotate: float=0.0,
  (),
) => {
  let faceTexturesString = Generator.getStringInputValue(faceId)
  let faceTextures = decodeFaceTextures(faceTexturesString)
  faceTextures->Js.Array2.forEach(faceTexture => {
    drawTexture(faceTexture, source, destination, ~flip, ~rotate, ())
  })
}
