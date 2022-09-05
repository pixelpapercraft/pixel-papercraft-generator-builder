let requireImage = fileName => Generator.requireImage("./images/" ++ fileName)
let requireTexture = fileName => Generator.requireImage("./textures/" ++ fileName)

let id = "minecraft-villager"

let name = "Minecraft Villager"

let history = ["19 May 2022 PaperDoggy - Initial script developed."]

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/thumbnail-v2-256.jpeg"),
}
let video: Generator.videoDef = {url: "https://www.youtube.com/embed/jcO0fe-pj9k?rel=0"}
let images: array<Generator.imageDef> = [
  {id: "Villager", url: requireImage("Villager.png")},
  {id: "ZombieVillager", url: requireImage("ZombieVillager.png")},
  {id: "FarmerHat", url: requireImage("farmerhat.png")},
  {id: "ShepherdHat", url: requireImage("shepherdhat.png")},
  {id: "FishermanHat", url: requireImage("fishermanhat.png")},
]

let textures: array<Generator.textureDef> = [
  {
    id: "Desert",
    url: requireTexture("desert.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Plains",
    url: requireTexture("plains.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Taiga",
    url: requireTexture("taiga.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Snow",
    url: requireTexture("snow.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Savanna",
    url: requireTexture("savanna.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Jungle",
    url: requireTexture("jungle.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Swamp",
    url: requireTexture("swamp.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "DesertZombie",
    url: requireTexture("desertzombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "PlainsZombie",
    url: requireTexture("plainszombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "TaigaZombie",
    url: requireTexture("taigazombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "SnowZombie",
    url: requireTexture("snowzombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "SavannaZombie",
    url: requireTexture("savannazombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "JungleZombie",
    url: requireTexture("junglezombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "SwampZombie",
    url: requireTexture("swampzombie.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Armorer",
    url: requireTexture("armorer.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Butcher",
    url: requireTexture("butcher.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Cartographer",
    url: requireTexture("cartographer.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Cleric",
    url: requireTexture("cleric.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Farmer",
    url: requireTexture("farmer.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Fisherman",
    url: requireTexture("fisherman.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Fletcher",
    url: requireTexture("fletcher.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Leatherworker",
    url: requireTexture("leatherworker.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Librarian",
    url: requireTexture("librarian.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Mason",
    url: requireTexture("mason.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Nitwit",
    url: requireTexture("nitwit.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Shepherd",
    url: requireTexture("shepherd.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Toolsmith",
    url: requireTexture("toolsmith.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "Weaponsmith",
    url: requireTexture("weaponsmith.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieArmorer",
    url: requireTexture("zombiearmorer.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieButcher",
    url: requireTexture("zombiebutcher.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieCartographer",
    url: requireTexture("zombiecartographer.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieCleric",
    url: requireTexture("zombiecleric.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieFarmer",
    url: requireTexture("zombiefarmer.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieFisherman",
    url: requireTexture("zombiefisherman.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieFletcher",
    url: requireTexture("zombiefletcher.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieLeatherworker",
    url: requireTexture("zombieleatherworker.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieLibrarian",
    url: requireTexture("zombielibrarian.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieMason",
    url: requireTexture("zombiemason.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieNitwit",
    url: requireTexture("zombienitwit.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieShepherd",
    url: requireTexture("zombieshepherd.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieToolsmith",
    url: requireTexture("zombietoolsmith.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
  {
    id: "ZombieWeaponsmith",
    url: requireTexture("zombieweaponsmith.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

module Drawing = {
  let drawHatOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (8, 0, 8, 8), (ox, oy - 65, 64, 64), ())
    Generator.drawTexture(texture, (8, 8, 8, 10), (ox, oy, 64, 80), ())
    Generator.drawTexture(texture, (0, 8, 8, 10), (ox - 65, oy, 64, 80), ())
    Generator.drawTexture(texture, (16, 8, 8, 10), (ox + 65, oy, 64, 80), ())
    Generator.drawTexture(texture, (24, 8, 8, 10), (ox + 130, oy, 64, 80), ())

    Generator.drawTexture(texture, (8 + 32, 0, 8, 8), (ox, oy - 65, 64, 64), ())
    Generator.drawTexture(texture, (8 + 32, 8, 8, 10), (ox, oy, 64, 80), ())
    Generator.drawTexture(texture, (0 + 32, 8, 8, 10), (ox - 65, oy, 64, 80), ())
    Generator.drawTexture(texture, (16 + 32, 8, 8, 10), (ox + 65, oy, 64, 80), ())
    Generator.drawTexture(texture, (24 + 32, 8, 8, 10), (ox + 130, oy, 64, 80), ())
  }
  let drawClothes = (ox, oy, texture) => {
    Generator.drawTexture(texture, (6, 38, 8, 6), (ox, oy - 53, 68, 52), ())
    Generator.drawTexture(texture, (6, 44, 8, 22), (ox, oy, 68, 176), ())
    Generator.drawTexture(texture, (0, 44, 6, 22), (ox - 53, oy, 52, 176), ())
    Generator.drawTexture(texture, (14, 44, 6, 22), (ox + 69, oy, 52, 176), ())
    Generator.drawTexture(texture, (20, 44, 8, 22), (ox + 69 + 53, oy, 68, 176), ())
  }
  let drawBodyOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (22, 26 - 6, 8, 6), (ox, oy - 49, 64, 48), ())
    Generator.drawTexture(
      texture,
      (22 + 8, 26 - 6, 8, 6),
      (ox, oy + 97, 64, 48),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(texture, (22, 26, 8, 12), (ox, oy, 64, 96), ())
    Generator.drawTexture(texture, (22 - 6, 26, 6, 12), (ox - 49, oy, 48, 96), ())
    Generator.drawTexture(texture, (22 + 8, 26, 6, 12), (ox + 65, oy, 48, 96), ())
    Generator.drawTexture(texture, (22 + 14, 26, 8, 12), (ox + 65 + 49, oy, 64, 96), ())
  }
  let drawLeftLegOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (4, 26 - 4, 4, 4), (ox, oy - 33, 32, 32), ())
    Generator.drawTexture(
      texture,
      (4 + 4, 26 - 4, 4, 4),
      (ox, oy + 97, 32, 32),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(texture, (4, 26, 4, 12), (ox, oy, 32, 96), ())
    Generator.drawTexture(texture, (4 - 4, 26, 4, 12), (ox - 33, oy, 32, 96), ())
    Generator.drawTexture(texture, (4 + 4, 26, 4, 12), (ox + 33, oy, 32, 96), ())
    Generator.drawTexture(texture, (4 + 8, 26, 4, 12), (ox + 33 + 33, oy, 32, 96), ())
  }
  let drawRightLegOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (4, 26 - 4, 4, 4), (ox, oy - 33, 32, 32), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (4 + 4, 26 - 4, 4, 4), (ox, oy + 97, 32, 32), ~rotate=180.0, ())
    Generator.drawTexture(texture, (4, 26, 4, 12), (ox, oy, 32, 96), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (4 + 4, 26, 4, 12), (ox - 33, oy, 32, 96), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (4 - 4, 26, 4, 12), (ox + 33, oy, 32, 96), ~flip=#Horizontal, ())
    Generator.drawTexture(
      texture,
      (4 + 8, 26, 4, 12),
      (ox - 33 - 33, oy, 32, 96),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawLeftArmOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (48, 26 - 4, 4, 4), (ox, oy - 33, 32, 32), ())
    Generator.drawTexture(
      texture,
      (48 + 4, 26 - 4, 4, 4),
      (ox, oy + 65, 32, 32),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(texture, (48, 26, 4, 8), (ox, oy, 32, 64), ())
    Generator.drawTexture(texture, (48 - 4, 26, 4, 8), (ox - 33, oy, 32, 64), ())
    Generator.drawTexture(texture, (48 + 4, 26, 4, 8), (ox + 33, oy, 32, 64), ())
    Generator.drawTexture(texture, (48 + 8, 26, 4, 8), (ox + 33 + 33, oy, 32, 64), ())
  }
  let drawRightArmOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (48, 26 - 4, 4, 4), (ox, oy - 33, 32, 32), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (48 + 4, 26 - 4, 4, 4), (ox, oy + 65, 32, 32), ~rotate=180.0, ())
    Generator.drawTexture(texture, (48, 26, 4, 8), (ox, oy, 32, 64), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (48 + 4, 26, 4, 8), (ox - 33, oy, 32, 64), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (48 - 4, 26, 4, 8), (ox + 33, oy, 32, 64), ~flip=#Horizontal, ())
    Generator.drawTexture(
      texture,
      (48 + 8, 26, 4, 8),
      (ox - 33 - 33, oy, 32, 64),
      ~flip=#Horizontal,
      (),
    )
  }
  let drawMiddleArmOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (44, 42 - 4, 8, 4), (ox, oy - 33, 64, 32), ())
    Generator.drawTexture(
      texture,
      (44 + 8, 42 - 4, 8, 4),
      (ox, oy + 33, 64, 32),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(texture, (44, 42, 8, 4), (ox, oy, 64, 32), ())
    Generator.drawTexture(texture, (44 - 4, 42, 4, 4), (ox - 33, oy, 32, 32), ())
    Generator.drawTexture(texture, (44 + 8, 42, 4, 4), (ox + 65, oy, 32, 32), ())
    Generator.drawTexture(texture, (44 + 12, 42, 8, 4), (ox + 33 + 65, oy, 64, 32), ())
  }
  let drawZombieLeftArmOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (48, 26 - 4, 4, 4), (ox, oy - 33, 32, 32), ())
    Generator.drawTexture(
      texture,
      (48 + 4, 26 - 4, 4, 4),
      (ox, oy + 97, 32, 32),
      ~flip=#Vertical,
      (),
    )
    Generator.drawTexture(texture, (48, 26, 4, 12), (ox, oy, 32, 96), ())
    Generator.drawTexture(texture, (48 - 4, 26, 4, 12), (ox - 33, oy, 32, 96), ())
    Generator.drawTexture(texture, (48 + 4, 26, 4, 12), (ox + 33, oy, 32, 96), ())
    Generator.drawTexture(texture, (48 + 8, 26, 4, 12), (ox + 33 + 33, oy, 32, 96), ())
  }
  let drawZombieRightArmOverlay = (ox, oy, texture) => {
    Generator.drawTexture(texture, (48, 26 - 4, 4, 4), (ox, oy - 33, 32, 32), ~flip=#Horizontal, ())
    Generator.drawTexture(texture, (48 + 4, 26 - 4, 4, 4), (ox, oy + 97, 32, 32), ~rotate=180.0, ())
    Generator.drawTexture(texture, (48, 26, 4, 12), (ox, oy, 32, 96), ~flip=#Horizontal, ())
    Generator.drawTexture(
      texture,
      (48 + 4, 26, 4, 12),
      (ox - 33, oy, 32, 96),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      (48 - 4, 26, 4, 12),
      (ox + 33, oy, 32, 96),
      ~flip=#Horizontal,
      (),
    )
    Generator.drawTexture(
      texture,
      (48 + 8, 26, 4, 12),
      (ox - 33 - 33, oy, 32, 96),
      ~flip=#Horizontal,
      (),
    )
  }
}
let script = () => {
  Generator.defineSelectInput("Type", ["Normal", "Zombie"])
  Generator.defineSelectInput(
    "Biome",
    ["Plains", "Desert", "Jungle", "Savanna", "Snow", "Swamp", "Taiga"],
  )
  Generator.defineSelectInput(
    "Profession",
    [
      "None",
      "Armorer",
      "Butcher",
      "Cartographer",
      "Cleric",
      "Farmer",
      "Fisherman",
      "Fletcher",
      "Leatherworker",
      "Librarian",
      "Mason",
      "Nitwit",
      "Shepherd",
      "Toolsmith",
      "Weaponsmith",
    ],
  )
  let villagertype = Generator.getSelectInputValue("Type") === "Normal"
  let zombietype = Generator.getSelectInputValue("Type") === "Zombie"
  let professionArmorer = Generator.getSelectInputValue("Profession") === "Armorer"
  let professionButcher = Generator.getSelectInputValue("Profession") === "Butcher"
  let professionCartographer = Generator.getSelectInputValue("Profession") === "Cartographer"
  let professionCleric = Generator.getSelectInputValue("Profession") === "Cleric"
  let professionFarmer = Generator.getSelectInputValue("Profession") === "Farmer"
  let professionFisherman = Generator.getSelectInputValue("Profession") === "Fisherman"
  let professionFletcher = Generator.getSelectInputValue("Profession") === "Fletcher"
  let professionLeatherworker = Generator.getSelectInputValue("Profession") === "Leatherworker"
  let professionLibrarian = Generator.getSelectInputValue("Profession") === "Librarian"
  let professionMason = Generator.getSelectInputValue("Profession") === "Mason"
  let professionNitwit = Generator.getSelectInputValue("Profession") === "Nitwit"
  let professionShepherd = Generator.getSelectInputValue("Profession") === "Shepherd"
  let professionToolsmith = Generator.getSelectInputValue("Profession") === "Toolsmith"
  let professionWeaponsmith = Generator.getSelectInputValue("Profession") === "Weaponsmith"

  let plains = Generator.getSelectInputValue("Biome") === "Plains"
  let desert = Generator.getSelectInputValue("Biome") === "Desert"
  let jungle = Generator.getSelectInputValue("Biome") === "Jungle"
  let savanna = Generator.getSelectInputValue("Biome") === "Savanna"
  let snow = Generator.getSelectInputValue("Biome") === "Snow"
  let swamp = Generator.getSelectInputValue("Biome") === "Swamp"
  let taiga = Generator.getSelectInputValue("Biome") === "Taiga"
  if villagertype {
    Generator.drawImage("Villager", (0, 0))

    //Biome Overlay
    if (
      !(
        professionButcher ||
        professionFarmer ||
        professionFisherman ||
        professionFletcher ||
        professionLibrarian ||
        professionShepherd
      )
    ) {
      if plains {
        Drawing.drawHatOverlay(82, 83, "Plains")
      }
      if desert {
        Drawing.drawHatOverlay(82, 83, "Desert")
      }
      if jungle {
        Drawing.drawHatOverlay(82, 83, "Jungle")
      }
      if savanna {
        Drawing.drawHatOverlay(82, 83, "Savanna")
      }
      if snow {
        Drawing.drawHatOverlay(82, 83, "Snow")
      }
      if swamp {
        Drawing.drawHatOverlay(82, 83, "Swamp")
      }
      if taiga {
        Drawing.drawHatOverlay(82, 83, "Taiga")
      }
    }
    if plains {
      Drawing.drawClothes(330, 550, "Plains")
      Drawing.drawBodyOverlay(361, 216, "Plains")
      Drawing.drawLeftLegOverlay(62, 290, "Plains")
      Drawing.drawRightLegOverlay(267, 370, "Plains")
      Drawing.drawLeftArmOverlay(56, 476, "Plains")
      Drawing.drawRightArmOverlay(517, 379, "Plains")
      Drawing.drawMiddleArmOverlay(46, 643, "Plains")
    }
    if desert {
      Drawing.drawClothes(330, 550, "Desert")
      Drawing.drawBodyOverlay(361, 216, "Desert")
      Drawing.drawLeftLegOverlay(62, 290, "Desert")
      Drawing.drawRightLegOverlay(267, 370, "Desert")
      Drawing.drawLeftArmOverlay(56, 476, "Desert")
      Drawing.drawRightArmOverlay(517, 379, "Desert")
      Drawing.drawMiddleArmOverlay(46, 643, "Desert")
    }
    if jungle {
      Drawing.drawClothes(330, 550, "Jungle")
      Drawing.drawBodyOverlay(361, 216, "Jungle")
      Drawing.drawLeftLegOverlay(62, 290, "Jungle")
      Drawing.drawRightLegOverlay(267, 370, "Jungle")
      Drawing.drawLeftArmOverlay(56, 476, "Jungle")
      Drawing.drawRightArmOverlay(517, 379, "Jungle")
      Drawing.drawMiddleArmOverlay(46, 643, "Jungle")
    }
    if savanna {
      Drawing.drawClothes(330, 550, "Savanna")
      Drawing.drawBodyOverlay(361, 216, "Savanna")
      Drawing.drawLeftLegOverlay(62, 290, "Savanna")
      Drawing.drawRightLegOverlay(267, 370, "Savanna")
      Drawing.drawLeftArmOverlay(56, 476, "Savanna")
      Drawing.drawRightArmOverlay(517, 379, "Savanna")
      Drawing.drawMiddleArmOverlay(46, 643, "Savanna")
    }
    if snow {
      Drawing.drawClothes(330, 550, "Snow")
      Drawing.drawBodyOverlay(361, 216, "Snow")
      Drawing.drawLeftLegOverlay(62, 290, "Snow")
      Drawing.drawRightLegOverlay(267, 370, "Snow")
      Drawing.drawLeftArmOverlay(56, 476, "Snow")
      Drawing.drawRightArmOverlay(517, 379, "Snow")
      Drawing.drawMiddleArmOverlay(46, 643, "Snow")
    }
    if swamp {
      Drawing.drawClothes(330, 550, "Swamp")
      Drawing.drawBodyOverlay(361, 216, "Swamp")
      Drawing.drawLeftLegOverlay(62, 290, "Swamp")
      Drawing.drawRightLegOverlay(267, 370, "Swamp")
      Drawing.drawLeftArmOverlay(56, 476, "Swamp")
      Drawing.drawRightArmOverlay(517, 379, "Swamp")
      Drawing.drawMiddleArmOverlay(46, 643, "Swamp")
    }
    if taiga {
      Drawing.drawClothes(330, 550, "Taiga")
      Drawing.drawBodyOverlay(361, 216, "Taiga")
      Drawing.drawLeftLegOverlay(62, 290, "Taiga")
      Drawing.drawRightLegOverlay(267, 370, "Taiga")
      Drawing.drawLeftArmOverlay(56, 476, "Taiga")
      Drawing.drawRightArmOverlay(517, 379, "Taiga")
      Drawing.drawMiddleArmOverlay(46, 643, "Taiga")
    }

    //Profession Overlay
    if professionArmorer {
      Drawing.drawHatOverlay(82, 83, "Armorer")
      Drawing.drawClothes(330, 550, "Armorer")
      Drawing.drawLeftArmOverlay(56, 476, "Armorer")
      Drawing.drawRightArmOverlay(517, 379, "Armorer")
      Drawing.drawMiddleArmOverlay(46, 643, "Armorer")
    }
    if professionButcher {
      Drawing.drawHatOverlay(82, 83, "Buther")
      Drawing.drawClothes(330, 550, "Butcher")
      Drawing.drawLeftArmOverlay(56, 476, "Butcher")
      Drawing.drawRightArmOverlay(517, 379, "Butcher")
      Drawing.drawMiddleArmOverlay(46, 643, "Butcher")
    }
    if professionCartographer {
      Drawing.drawHatOverlay(82, 83, "Cartographer")
      Drawing.drawClothes(330, 550, "Cartographer")
      Drawing.drawLeftArmOverlay(56, 476, "Cartographer")
      Drawing.drawRightArmOverlay(517, 379, "Cartographer")
      Drawing.drawMiddleArmOverlay(46, 643, "Cartographer")
    }
    if professionCleric {
      Drawing.drawHatOverlay(82, 83, "Cleric")
      Drawing.drawClothes(330, 550, "Cleric")
      Drawing.drawLeftArmOverlay(56, 476, "Cleric")
      Drawing.drawRightArmOverlay(517, 379, "Cleric")
      Drawing.drawMiddleArmOverlay(46, 643, "Cleric")
    }
    if professionFarmer {
      Drawing.drawHatOverlay(82, 83, "Farmer")
      Drawing.drawClothes(330, 550, "Farmer")
      Drawing.drawLeftArmOverlay(56, 476, "Farmer")
      Drawing.drawRightArmOverlay(517, 379, "Farmer")
      Drawing.drawMiddleArmOverlay(46, 643, "Farmer")
      Generator.drawImage("FarmerHat", (316, 12))
    }
    if professionFisherman {
      Drawing.drawHatOverlay(82, 83, "Fisherman")
      Drawing.drawClothes(330, 550, "Fisherman")
      Drawing.drawLeftLegOverlay(62, 290, "Fisherman")
      Drawing.drawRightLegOverlay(267, 370, "Fisherman")
      Drawing.drawLeftArmOverlay(56, 476, "Fisherman")
      Drawing.drawRightArmOverlay(517, 379, "Fisherman")
      Drawing.drawMiddleArmOverlay(46, 643, "Fisherman")
      Generator.drawImage("FishermanHat", (316, 12))
    }
    if professionFletcher {
      Drawing.drawHatOverlay(82, 83, "Fletcher")
      Drawing.drawClothes(330, 550, "Fletcher")
      Drawing.drawLeftArmOverlay(56, 476, "Fletcher")
      Drawing.drawRightArmOverlay(517, 379, "Fletcher")
      Drawing.drawMiddleArmOverlay(46, 643, "Fletcher")
    }
    if professionLeatherworker {
      Drawing.drawHatOverlay(82, 83, "Leatherworker")
      Drawing.drawClothes(330, 550, "Leatherworker")
      Drawing.drawLeftArmOverlay(56, 476, "Leatherworker")
      Drawing.drawRightArmOverlay(517, 379, "Leatherworker")
      Drawing.drawMiddleArmOverlay(46, 643, "Leatherworker")
    }
    if professionLibrarian {
      Drawing.drawHatOverlay(82, 83, "Librarian")
      Drawing.drawClothes(330, 550, "Librarian")
      Drawing.drawLeftArmOverlay(56, 476, "Librarian")
      Drawing.drawRightArmOverlay(517, 379, "Librarian")
      Drawing.drawMiddleArmOverlay(46, 643, "Library")
    }
    if professionMason {
      Drawing.drawHatOverlay(82, 83, "Mason")
      Drawing.drawClothes(330, 550, "Mason")
      Drawing.drawLeftArmOverlay(56, 476, "Mason")
      Drawing.drawRightArmOverlay(517, 379, "Mason")
      Drawing.drawMiddleArmOverlay(46, 643, "Mason")
    }
    if professionNitwit {
      Drawing.drawHatOverlay(82, 83, "Nitwit")
      Drawing.drawClothes(330, 550, "Nitwit")
      Drawing.drawLeftArmOverlay(56, 476, "Nitwit")
      Drawing.drawRightArmOverlay(517, 379, "Nitwit")
      Drawing.drawMiddleArmOverlay(46, 643, "Nitwit")
    }
    if professionShepherd {
      Drawing.drawHatOverlay(82, 83, "Shepherd")
      Drawing.drawClothes(330, 550, "Shepherd")
      Drawing.drawLeftArmOverlay(56, 476, "Shepherd")
      Drawing.drawRightArmOverlay(517, 379, "Shepherd")
      Drawing.drawMiddleArmOverlay(46, 643, "Shepherd")
      Generator.drawImage("ShepherdHat", (316, 12))
    }
    if professionToolsmith {
      Drawing.drawHatOverlay(82, 83, "Toolsmith")
      Drawing.drawClothes(330, 550, "Toolsmith")
      Drawing.drawLeftArmOverlay(56, 476, "Toolsmith")
      Drawing.drawRightArmOverlay(517, 379, "Toolsmith")
      Drawing.drawMiddleArmOverlay(46, 643, "Toolsmith")
    }
    if professionWeaponsmith {
      Drawing.drawHatOverlay(82, 83, "Weaponsmith")
      Drawing.drawClothes(330, 550, "Weaponsmith")
      Drawing.drawLeftArmOverlay(56, 476, "Weaponsmith")
      Drawing.drawRightArmOverlay(517, 379, "Weaponsmith")
      Drawing.drawMiddleArmOverlay(46, 643, "Weaponsmith")
    }
  }
  if zombietype {
    Generator.drawImage("ZombieVillager", (0, 0))

    //Biome Overlay
    if (
      !(
        professionButcher ||
        professionFarmer ||
        professionFisherman ||
        professionFletcher ||
        professionLibrarian ||
        professionShepherd
      )
    ) {
      if plains {
        Drawing.drawHatOverlay(82, 83, "PlainsZombie")
      }
      if desert {
        Drawing.drawHatOverlay(82, 83, "DesertZombie")
      }
      if jungle {
        Drawing.drawHatOverlay(82, 83, "JungleZombie")
      }
      if savanna {
        Drawing.drawHatOverlay(82, 83, "SavannaZombie")
      }
      if snow {
        Drawing.drawHatOverlay(82, 83, "SnowZombie")
      }
      if swamp {
        Drawing.drawHatOverlay(82, 83, "SwampZombie")
      }
      if taiga {
        Drawing.drawHatOverlay(82, 83, "TaigaZombie")
      }
    }
    if plains {
      Drawing.drawClothes(330, 550, "PlainsZombie")
      Drawing.drawBodyOverlay(361, 216, "PlainsZombie")
      Drawing.drawLeftLegOverlay(62, 290, "PlainsZombie")
      Drawing.drawRightLegOverlay(267, 370, "PlainsZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "PlainsZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "PlainsZombie")
    }
    if desert {
      Drawing.drawClothes(330, 550, "DesertZombie")
      Drawing.drawBodyOverlay(361, 216, "DesertZombie")
      Drawing.drawLeftLegOverlay(62, 290, "DesertZombie")
      Drawing.drawRightLegOverlay(267, 370, "DesertZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "DesertZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "DesertZombie")
    }
    if jungle {
      Drawing.drawClothes(330, 550, "JungleZombie")
      Drawing.drawBodyOverlay(361, 216, "JungleZombie")
      Drawing.drawLeftLegOverlay(62, 290, "JungleZombie")
      Drawing.drawRightLegOverlay(267, 370, "JungleZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "JungleZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "JungleZombie")
    }
    if savanna {
      Drawing.drawClothes(330, 550, "SavannaZombie")
      Drawing.drawBodyOverlay(361, 216, "SavannaZombie")
      Drawing.drawLeftLegOverlay(62, 290, "SavannaZombie")
      Drawing.drawRightLegOverlay(267, 370, "SavannaZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "SavannaZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "SavannaZombie")
    }
    if snow {
      Drawing.drawClothes(330, 550, "SnowZombie")
      Drawing.drawBodyOverlay(361, 216, "SnowZombie")
      Drawing.drawLeftLegOverlay(62, 290, "SnowZombie")
      Drawing.drawRightLegOverlay(267, 370, "SnowZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "SnowZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "SnowZombie")
    }
    if swamp {
      Drawing.drawClothes(330, 550, "SwampZombie")
      Drawing.drawBodyOverlay(361, 216, "SwampZombie")
      Drawing.drawLeftLegOverlay(62, 290, "SwampZombie")
      Drawing.drawRightLegOverlay(267, 370, "SwampZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "SwampZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "SwampZombie")
    }
    if taiga {
      Drawing.drawClothes(330, 550, "TaigaZombie")
      Drawing.drawBodyOverlay(361, 216, "TaigaZombie")
      Drawing.drawLeftLegOverlay(62, 290, "TaigaZombie")
      Drawing.drawRightLegOverlay(267, 370, "TaigaZombie")
      Drawing.drawZombieLeftArmOverlay(56, 476, "TaigaZombie")
      Drawing.drawZombieRightArmOverlay(517, 379, "TaigaZombie")
    }

    //Profession Overlay
    if professionArmorer {
      Drawing.drawHatOverlay(82, 83, "ZombieArmorer")
      Drawing.drawClothes(330, 550, "ZombieArmorer")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieArmorer")
      Drawing.drawRightArmOverlay(517, 379, "ZombieArmorer")
    }
    if professionButcher {
      Drawing.drawHatOverlay(82, 83, "ZombieButher")
      Drawing.drawClothes(330, 550, "ZombieButcher")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieButcher")
      Drawing.drawRightArmOverlay(517, 379, "ZombieButcher")
    }
    if professionCartographer {
      Drawing.drawHatOverlay(82, 83, "ZombieCartographer")
      Drawing.drawClothes(330, 550, "ZombieCartographer")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieCartographer")
      Drawing.drawRightArmOverlay(517, 379, "ZombieCartographer")
    }
    if professionCleric {
      Drawing.drawHatOverlay(82, 83, "ZombieCleric")
      Drawing.drawClothes(330, 550, "ZombieCleric")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieCleric")
      Drawing.drawRightArmOverlay(517, 379, "ZombieCleric")
    }
    if professionFarmer {
      Drawing.drawHatOverlay(82, 83, "ZombieFarmer")
      Drawing.drawClothes(330, 550, "ZombieFarmer")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieFarmer")
      Drawing.drawRightArmOverlay(517, 379, "ZombieFarmer")

      Generator.drawImage("FarmerHat", (316, 12))
    }
    if professionFisherman {
      Drawing.drawHatOverlay(82, 83, "ZombieFisherman")
      Drawing.drawClothes(330, 550, "ZombieFisherman")
      Drawing.drawLeftLegOverlay(62, 290, "ZombieFisherman")
      Drawing.drawRightLegOverlay(267, 370, "ZombieFisherman")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieFisherman")
      Drawing.drawRightArmOverlay(517, 379, "ZombieFisherman")
      Generator.drawImage("FishermanHat", (316, 12))
    }
    if professionFletcher {
      Drawing.drawHatOverlay(82, 83, "ZombieFletcher")
      Drawing.drawClothes(330, 550, "ZombieFletcher")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieFletcher")
      Drawing.drawRightArmOverlay(517, 379, "ZombieFletcher")
    }
    if professionLeatherworker {
      Drawing.drawHatOverlay(82, 83, "ZombieLeatherworker")
      Drawing.drawClothes(330, 550, "ZombieLeatherworker")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieLeatherworker")
      Drawing.drawRightArmOverlay(517, 379, "ZombieLeatherworker")
    }
    if professionLibrarian {
      Drawing.drawHatOverlay(82, 83, "ZombieLibrarian")
      Drawing.drawClothes(330, 550, "ZombieLibrarian")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieLibrarian")
      Drawing.drawRightArmOverlay(517, 379, "ZombieLibrarian")
    }
    if professionMason {
      Drawing.drawHatOverlay(82, 83, "ZombieMason")
      Drawing.drawClothes(330, 550, "ZombieMason")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieMason")
      Drawing.drawRightArmOverlay(517, 379, "ZombieMason")
    }
    if professionNitwit {
      Drawing.drawHatOverlay(82, 83, "ZombieNitwit")
      Drawing.drawClothes(330, 550, "ZombieNitwit")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieNitwit")
      Drawing.drawRightArmOverlay(517, 379, "ZombieNitwit")
    }
    if professionShepherd {
      Drawing.drawHatOverlay(82, 83, "ZombieShepherd")
      Drawing.drawClothes(330, 550, "ZombieShepherd")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieShepherd")
      Drawing.drawRightArmOverlay(517, 379, "ZombieShepherd")

      Generator.drawImage("ShepherdHat", (316, 12))
    }
    if professionToolsmith {
      Drawing.drawHatOverlay(82, 83, "ZombieToolsmith")
      Drawing.drawClothes(330, 550, "ZombieToolsmith")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieToolsmith")
      Drawing.drawRightArmOverlay(517, 379, "ZombieToolsmith")
    }
    if professionWeaponsmith {
      Drawing.drawHatOverlay(82, 83, "ZombieWeaponsmith")
      Drawing.drawClothes(330, 550, "ZombieWeaponsmith")
      Drawing.drawLeftArmOverlay(56, 476, "ZombieWeaponsmith")
      Drawing.drawRightArmOverlay(517, 379, "ZombieWeaponsmith")
    }
  }
}

let generator: Generator.generatorDef = {
  id,
  name,
  thumbnail: Some(thumbnail),
  video: Some(video),
  instructions: None,
  images,
  textures,
  script,
  history,
}
