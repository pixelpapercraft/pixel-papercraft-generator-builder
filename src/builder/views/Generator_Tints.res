// https://minecraft.fandom.com/wiki/Tint
// If you're reading this, here's a reminder to move this into a more sensible area, like having it be per generator somehow
type tint = {
  biomes: array<string>,
  color: string,
}

let grassTints = [
  {biomes: ["Badlands"], color: "#90814D"},
  {biomes: ["Desert"], color: "#BFB755"},
  {biomes: ["Jungle"], color: "#59C93C"},
  {biomes: ["Jungle Edge"], color: "#64C73F"},
  {biomes: ["Forest"], color: "#79C05A"},
  {biomes: ["Birch Forest"], color: "#88BB67"},
  {biomes: ["Dark Forest"], color: "#507A32"},
  {biomes: ["Swamp"], color: "#6A7039"},
  {biomes: ["Swamp (Cold)"], color: "#4C763C"},
  {biomes: ["Plains"], color: "#91BD59"},
  {biomes: ["Ocean"], color: "#8EB971"},
  {biomes: ["Mushroom Fields"], color: "#55C93F"},
  {biomes: ["Mountains"], color: "#8AB689"},
  {biomes: ["Snowy Beach"], color: "#83B593"},
  {biomes: ["Giant Tree Taiga"], color: "#86B87F"},
  {biomes: ["Taiga"], color: "#86B783"},
  {biomes: ["Snowy Tundra"], color: "#80B497"},
]

let foliageTints = [
  {biomes: ["Badlands"], color: "#9E814D"},
  {biomes: ["Desert"], color: "#AEA42A"},
  {biomes: ["Jungle"], color: "#30BB0B"},
  {biomes: ["Jungle Edge"], color: "#3EB80F"},
  {biomes: ["Forest"], color: "#59AE30"},
  {biomes: ["Birch Forest"], color: "#6BA941"},
  {biomes: ["Swamp"], color: "#6A7039"},
  {biomes: ["Plains"], color: "#77AB2F"},
  {biomes: ["Ocean"], color: "#71A74D"},
  {biomes: ["Mushroom Fields"], color: "#2BBB0F"},
  {biomes: ["Mountains"], color: "#6DA36B"},
  {biomes: ["Snowy Beach"], color: "#64A278"},
  {biomes: ["Giant Tree Taiga"], color: "#68A55F"},
  {biomes: ["Taiga"], color: "#68A464"},
  {biomes: ["Snowy Tundra"], color: "#60A17B"},
]

let waterTints = [
  {biomes: ["Most biomes"], color: "#3F76E4"},
  {biomes: ["Cold Ocean"], color: "#3D57D6"},
  {biomes: ["Frozen Ocean"], color: "#3938C9"},
  {biomes: ["Lukewarm Ocean"], color: "#45ADF2"},
  {biomes: ["Swamp"], color: "#617B64"},
  {biomes: ["Warm Ocean"], color: "#43D5EE"},
]

type tints = {
  grass: array<tint>,
  foliage: array<tint>,
  water: array<tint>,
}

let tints: tints = {
  grass: grassTints,
  foliage: foliageTints,
  water: waterTints,
}
