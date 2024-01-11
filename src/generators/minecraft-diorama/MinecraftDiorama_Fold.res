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

let drawFoldLine = ((dx, dy, dw, dh), rotate) => {
  let destination = switch rotate {
  | 0 => (dx, dy + dh - 1, dx + dw, dy + dh - 1)
  | 1 => (dx, dy, dx, dy + dh)
  | 2 => (dx, dy, dx + dw, dy)
  | 3 => (dx + dw - 1, dy, dx + dw - 1, dy + dh)
  | _ => (dx, dy, dw, dh)
  }
  let (x1, y1, x2, y2) = destination
  Generator.drawLine((x1, y1), (x2, y2), ~color="#a1a1a1", ~width=1, ~pattern=[2, 2], ~offset=3, ())
}

let draw = (destination, rotate) => {
  drawFoldLine(destination, rotate)
}
