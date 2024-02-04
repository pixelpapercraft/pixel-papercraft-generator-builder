let requireTexture = id => Generator.requireImage("./" ++ id ++ ".png")
let skins: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Mini 1",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 1",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Skin 2",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Head 1",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Steve",
    url: requireTexture("SkinSteve64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Alex",
    url: requireTexture("SkinAlex64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Debug",
    url: requireTexture("SkinSteveReference64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Debug- Steve",
    url: requireTexture("SkinSteveReference64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Debug- Alex",
    url: requireTexture("SkinAlexReference64x64"),
    standardWidth: 64,
    standardHeight: 64,
  },
]
