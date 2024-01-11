module Builder = Generator.Builder

module Textures = MinecraftDiorama_Textures

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

let drawTexture = (
  textureId,
  source,
  (dx, dy, dw, dh),
  rotate,
  ~flip: Generator_Texture.flip=#None,
  (),
) => {
  let destination = switch rotate {
  | 0 => (dx, dy, dw, dh)
  | 1 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
  | 2 => (dx, dy, dw, dh)
  | 3 => (dx + (dw - dh) / 2, dy - (dw - dh) / 2, dh, dw)
  | _ => (dx, dy, dw, dh)
  }
  let rotate = (rotate * 90)->Js.Int.toFloat
  Generator.drawTexture(textureId, source, destination, ~flip, ~rotate, ())
}

let draw = (destination, rotate, ~flip: Generator_Texture.flip=#None, ()) => {
  drawTexture("Fold", (0, 96, 128, 32), destination, rotate, ~flip, ())
}
