let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "biome"

let name = "Biome"

let images: array<Generator.imageDef> = [
  {id: "Background", url: requireImage("Background.png")},
  {id: "Folds", url: requireImage("Folds.png")},
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Skin.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]


let script = () => {
Generator.defineSelectInput("Diorama Size", [
        "2x2",
        "5x5",
        "8x8",
              
      ]);
Generator.defineSelectInput("Biome", [
        "Plains",
        "Desert",
        "Gravel Mountain",
        "Badlands",
        "Snow Plains",
        "Nether Wastes",
        "Soulsand walley",
        "Crimson Forest",
        "Warped Forest",
        "End",
        "Basalt Deltas",       
      ]);
let i = 0;
let smallDiorama = Generator.getSelectInputValue("Diorama Size") === "2x2";
let mediumDiorama = Generator.getSelectInputValue("Diorama Size") === "5x5";
let hugeDiorama = Generator.getSelectInputValue("Diorama Size") === "8x8";

let plains = Generator.getSelectInputValue("Biome") === "Plains";
let desert = Generator.getSelectInputValue("Biome") === "Desert";
let gravelm = Generator.getSelectInputValue("Biome") === "Gravel Mountain";
let badlands = Generator.getSelectInputValue("Biome") === "Badlands";
let snowplains = Generator.getSelectInputValue("Biome") === "Snow Plains";
let netherwastes = Generator.getSelectInputValue("Biome") === "Nether Wastes";
let soulsandwalley = Generator.getSelectInputValue("Biome") === "Soulsand walley";
let crimsonforest = Generator.getSelectInputValue("Biome") === "Crimson Forest";
let warpedforest = Generator.getSelectInputValue("Biome") === "Warped Forest";
let end = Generator.getSelectInputValue("Biome") === "End";
let basaltdeltas = Generator.getSelectInputValue("Biome") === "Basalt Deltas";
let d="Background";
let dioramaheightvalue = [1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1];
Generator.usePage("Planing");
let dioramablockname = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
let dioramablock1 = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
let dioramablock2 = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
let dioramablock3 = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
let dioramablock4 = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
let dioramablock5 = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
let dioramablock6 = ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1",];
Generator.drawImage(d, (0, 0))
for i in 1 to 64 {
    let i1 = dioramaheightvalue[i]
    if plains{ if i1===1 {dioramablockname[i] = "Grass"; dioramablock1[i] = "Grass"}
      if i1===2 {dioramablockname[i] = "Grass"
       dioramablock1[i] = "Dirt" 
       dioramablock2[i] = "Grass" }
      if i1===3 {dioramablockname[i] = "Grass" 
      dioramablock1[i] = "Dirt" 
      dioramablock2[i] = "Dirt" 
      dioramablock3[i] = "Grass"}
      if i1===4 {dioramablockname[i] = "Grass" 
      dioramablock1[i] = "Stone" 
      dioramablock2[i] = "Dirt" 
      dioramablock3[i] = "Dirt" 
      dioramablock4[i] = "Grass"}
      if i1===5 {dioramablockname[i] = "Grass" 
      dioramablock1[i] = "Stone" 
      dioramablock2[i] = "Stone" 
      dioramablock3[i] = "Dirt"
       dioramablock4[i] = "Dirt" 
       dioramablock5[i] = "Grass"}
      if i1===6 {dioramablockname[i] = "Grass"
       dioramablock1[i] = "Stone" 
       dioramablock2[i] = "Stone" 
       dioramablock3[i] = "Stone" 
       dioramablock4[i] = "Dirt" 
       dioramablock5[i] = "Dirt" 
       dioramablock6[i] = "Grass"}

    if desert{ if i1===1 {dioramablockname[i] = "Sand" 
    dioramablock1[i] = "Sand"}
      if i1===2 {dioramablockname[i] = "Sand" 
      dioramablock1[i] = "Sand" 
      dioramablock2[i] = "Sand" }
      if i1===3 {dioramablockname[i] = "Sand"
       dioramablock1[i] = "Sand" 
       dioramablock2[i] = "Sand" 
       dioramablock3[i] = "Sand"}
      if i1===4 {dioramablockname[i] = "Sand" 
      dioramablock1[i] = "Sandstone" 
      dioramablock2[i] = "Sand" 
      dioramablock3[i] = "Sand" 
      dioramablock4[i] = "Sand"}
      if i1===5 {dioramablockname[i] = "Sand" 
      dioramablock1[i] = "Sandstone" 
      dioramablock2[i] = "Sandstone" 
      dioramablock3[i] = "Sand" 
      dioramablock4[i] = "Sand" 
      dioramablock5[i] = "Sand"}
      if i1===6 {dioramablockname[i] = "Sand" 
      dioramablock1[i] = "Sandstone" 
      dioramablock2[i] = "Sandstone" 
      dioramablock3[i] = "Sandstone" 
      dioramablock4[i] = "Sand" 
      dioramablock5[i] = "Sand" 
      dioramablock6[i] = "Sand"}  
    
    if gravelm{ if i1===1 {dioramablockname[i] = "Gravel" 
    dioramablock1[i] = "Gravel"}
      if i1===2 {dioramablockname[i] = "Gravel" 
      dioramablock1[i] = "Gravel" 
      dioramablock2[i] = "Gravel" }
      if i1===3 {dioramablockname[i] = "Gravel" 
      dioramablock1[i] = "Gravel" 
      dioramablock2[i] = "Gravel" 
      dioramablock3[i] = "Gravel"}
      if i1===4 {dioramablockname[i] = "Gravel" 
      dioramablock1[i] = "Stone" 
      dioramablock2[i] = "Gravel" 
      dioramablock3[i] = "Gravel" 
      dioramablock4[i] = "Gravel"}
      if i1===5 {dioramablockname[i] = "Gravel" 
      dioramablock1[i] = "Stone" 
      dioramablock2[i] = "Stone" 
      dioramablock3[i] = "Gravel" 
      dioramablock4[i] = "Gravel" 
      dioramablock5[i] = "Gravel"}
      if i1===6 {dioramablockname[i] = "Gravel" 
      dioramablock1[i] = "Stone" 
      dioramablock2[i] = "Stone" 
      dioramablock3[i] = "Stone" 
      dioramablock4[i] = "Gravel" 
      dioramablock5[i] = "Gravel" 
      dioramablock6[i] = "Gravel"}  
    
    
}  
}    
}
}


  

}

  

  

 


let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: None,
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
