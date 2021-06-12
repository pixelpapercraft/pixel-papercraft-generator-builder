type doc
type imageType = [#JPEG | #PNG]
type orientation = [#portrait | #landscape]
type format = [#a4]
type unit_ = [#mm]

type makeOptions = {
  orientation: orientation,
  unit: unit_,
  format: format,
}

@module("jspdf") @new
external make: makeOptions => doc = "jsPDF"

@send
external addPage: (doc, format, orientation) => unit = "addPage"

@send
external addImage: (doc, string, imageType, int, int, int, int) => unit = "addImage"

@send
external save: (doc, string) => unit = "save"
