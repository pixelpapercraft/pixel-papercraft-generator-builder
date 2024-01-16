module TextureVersions = TextureVersions
module TexturePicker = Generator_TexturePicker

module SelectedTexture = TexturePicker.SelectedTexture
module Rotation = TexturePicker.Rotation

@react.component
let make = (
  ~textureVersion: option<TextureVersions.textureVersion>,
  ~onSelect: TexturePicker.SelectedTexture.t => unit,
  ~enableRotation: bool,
  ~enableErase: bool,
) => {
  switch textureVersion {
  | None => React.null
  | Some(textureVersion) => {
      let {textureDef, frames} = textureVersion
      <div className="mb-4">
        <TexturePicker textureDef frames onSelect enableRotation enableErase />
      </div>
    }
  }
}
