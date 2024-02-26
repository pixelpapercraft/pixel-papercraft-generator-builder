@val external process: 'a = "process"

let isDevEnvironment: bool = process["env"]["NODE_ENV"] == "development"

let character: array<Generator.generatorDef> = [
  MinecraftCharacterGenerator.generator,
  MinecraftActionFigureGenerator.generator,
  MinecraftUltimateBendableGenerator.generator,
  MinecraftCharacterMiniGenerator.generator,
  MinecraftActionFigureMiniGenerator.generator,
]

// Blocks, Items and Accessories
let utility: array<Generator.generatorDef> = [
  MinecraftBlockGenerator.generator,
  MinecraftItemGenerator.generator,
  MinecraftDioramaGenerator.generator,
  MinecraftArmorGenerator.generator,
  MinecraftCapeAndElytraGenerator.generator,
  MinecraftCharacterHeadsGenerator.generator,
  MinecraftMinecartGenerator.generator,
]

let mob: array<Generator.generatorDef> = [
  MinecraftCreeperGenerator.generator,
  MinecraftEndermanGenerator.generator,
  MinecraftGolemGenerator.generator,
  MinecraftHorseGenerator.generator,
  MinecraftPigGenerator.generator,
  MinecraftSpiderGenerator.generator,
  MinecraftPhantomGenerator.generator,
  MinecraftCatGenerator.generator,
  MinecraftVillagerGenerator.generator,
]

let mobCharacter: array<Generator.generatorDef> = [
  MinecraftCreeperCharacterGenerator.generator,
  MinecraftCatCharacterGenerator.generator,
  MinecraftCowCharacterGenerator.generator,
  MinecraftEndermanCharacterGenerator.generator,
  MinecraftGolemCharacterGenerator.generator,
  MinecraftPigCharacterGenerator.generator,
  MinecraftSquidCharacterGenerator.generator,
  MinecraftVillagerCharacterGenerator.generator,
  MinecraftWolfCharacterGenerator.generator,
  MinecraftAxolotlCharacterGenerator.generator,
  MinecraftAllayCharacterGenerator.generator,
  MinecraftBeeCharacterGenerator.generator,
]

let mod: array<Generator.generatorDef> = [
  MinecraftMutantCharacterGenerator.generator,
  DalekModDalekGenerator.generator,
]

let other: array<Generator.generatorDef> = [AmogusBendableGenerator.generator]

// Incomplete and in development
let dev: array<Generator.generatorDef> = isDevEnvironment
  ? [MinecraftWitherGenerator.generator]
  : []

let test: array<Generator.generatorDef> = isDevEnvironment
  ? [ExampleGenerator.generator, TestingGenerator.generator]
  : []

let all = Belt.Array.concatMany([character, utility, mob, mobCharacter, mod, other, dev, test])
