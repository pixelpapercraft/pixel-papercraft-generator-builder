let character: array<Generator.generatorDef> = [
  MinecraftCharacterGenerator.generator,
  MinecraftActionFigureGenerator.generator,
  MinecraftUltimateBendableGenerator.generator,
]

let mobCharacter: array<Generator.generatorDef> = [
  MinecraftCreeperCharacterGenerator.generator,
  MinecraftCatCharacterGenerator.generator,
  MinecraftCowCharacterGenerator.generator,
  MinecraftEndermanCharacterGenerator.generator,
  MinecraftGolemCharacterGenerator.generator,
  MinecraftPigCharacterGenerator.generator,
]

let mob: array<Generator.generatorDef> = [
  MinecraftCreeperGenerator.generator,
  MinecraftEndermanGenerator.generator,
  MinecraftGolemGenerator.generator,
  MinecraftHorseGenerator.generator,
]

// Blocks, Items and Accessories
let utility: array<Generator.generatorDef> = [
  MinecraftBlockGenerator.generator,
  MinecraftCapeAndElytraGenerator.generator,
  MinecraftCharacterHeadsGenerator.generator,
]

let mod: array<Generator.generatorDef> = []

let other: array<Generator.generatorDef> = []

let dev: array<Generator.generatorDef> = [ExampleGenerator.generator, DemoGenerator.generator]

let all = Belt.Array.concatMany([character, mobCharacter, mob, utility, mod, other, dev])
