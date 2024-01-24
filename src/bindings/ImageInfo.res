type t = {
  @as("type") type_: string,
  format: string,
  mimeType: string,
  width: int,
  height: int,
}
@module external imageInfo: Fs.file => t = "imageinfo"
