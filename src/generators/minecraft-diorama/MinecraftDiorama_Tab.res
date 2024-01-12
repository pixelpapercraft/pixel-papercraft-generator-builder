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

let drawTab = ((dx, dy, dw, dh), rotate, tabType, ()) => {
  let destination = switch rotate {
  | 0 => (dx, dy, dw, dh)
  | 1 => (dx, dy, dw, dh)
  | 2 => (dx, dy, dw, dh)
  | 3 => (dx, dy, dw, dh)
  | _ => (dx, dy, dw, dh)
  }
  let orientation = switch rotate {
  | 0 => #North
  | 1 => #East
  | 2 => #South
  | 3 => #West
  | _ => #North
  }

  Generator.drawTab(destination, orientation, ~tabType, ~showFoldLine=false, ())
}

let draw = (destination, rotate, tabType) => {
  drawTab(destination, rotate, tabType)
}
