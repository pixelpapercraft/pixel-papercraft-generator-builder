let requireImage = id => Generator.requireImage("./images/" ++ id ++ ".png")
let requireTexture = id => Generator.requireImage("./textures/" ++ id ++ ".png")

let id = "minecraft-character-mini"

let name = "Minecraft Character Mini"

let thumbnail: Generator.thumnbnailDef = {
  url: Generator.requireImage("./thumbnail/v2-thumbnail-256.jpeg"),
}

let images: array<Generator.imageDef> = [
  {
    id: "Skin Overlay",
    url: requireImage("skin-overlay"),
  },
  {
    id: "Skin Background",
    url: requireImage("skin-background"),
  },
]

let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: requireTexture("Steve"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

let steve = TextureMap.MinecraftCharacter.steve
let alex = TextureMap.MinecraftCharacter.alex

type options = {
  skin: string,
  x: int,
  y: int,
  alexModel: bool,
  showHeadOverlay: bool,
  showBodyOverlay: bool,
  showArmOverlay: bool,
  showLegOverlay: bool,
  bodyHeight: int,
}

let drawMini = (options: options) => {
  let skin = options.skin
  let x = options.x
  let y = options.y
  let alexModel = options.alexModel
  let showHeadOverlay = options.showHeadOverlay
  let showBodyOverlay = options.showBodyOverlay
  let showArmOverlay = options.showArmOverlay
  let showLegOverlay = options.showLegOverlay
  let bodyHeight = options.bodyHeight
  let legHeight = 64 - bodyHeight

  // Skin background
  Generator.drawImage("Skin Background", (x, y))

  // Head
  let ox = x + 49
  let oy = y + 90
  Generator.drawTexture(skin, steve.base.head.right, (ox, oy, 64, 64), ())
  Generator.drawTexture(skin, steve.base.head.front, (ox + 64, oy, 64, 64), ())
  Generator.drawTexture(skin, steve.base.head.left, (ox + 128, oy, 64, 64), ())
  Generator.drawTexture(skin, steve.base.head.back, (ox + 192, oy, 64, 64), ())
  Generator.drawTexture(skin, steve.base.head.top, (ox + 64, oy - 64, 64, 64), ())

  // head overlay
  if showHeadOverlay {
    Generator.drawTexture(skin, steve.overlay.head.right, (ox, oy, 64, 64), ())
    Generator.drawTexture(skin, steve.overlay.head.front, (ox + 64, oy, 64, 64), ())
    Generator.drawTexture(skin, steve.overlay.head.left, (ox + 128, oy, 64, 64), ())
    Generator.drawTexture(skin, steve.overlay.head.back, (ox + 192, oy, 64, 64), ())
    Generator.drawTexture(skin, steve.overlay.head.top, (ox + 64, oy - 64, 64, 64), ())
  }

  //head flaps
  let ox = x + 49
  let oy = y + 26
  Generator.drawTexture(skin, steve.base.head.right, (ox, oy, 64, 64), ~rotate=90.0, ())
  Generator.drawTexture(skin, steve.base.head.left, (ox + 128, oy, 64, 64), ~rotate=-90.0, ())
  if showHeadOverlay {
    Generator.drawTexture(skin, steve.overlay.head.right, (ox, oy, 64, 64), ~rotate=90.0, ())
    Generator.drawTexture(skin, steve.overlay.head.left, (ox + 128, oy, 64, 64), ~rotate=-90.0, ())
  }

  // Body
  let ox = x + 49
  let oy = y + 154
  Generator.drawTexture(skin, steve.base.body.right, (ox, oy, 64, bodyHeight), ~pixelate=true, ())
  Generator.drawTexture(
    skin,
    steve.base.body.front,
    (ox + 64, oy, 64, bodyHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.body.left,
    (ox + 128, oy, 64, bodyHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.body.back,
    (ox + 192, oy, 64, bodyHeight),
    ~pixelate=true,
    (),
  )

  // Body Overlay
  if showBodyOverlay {
    Generator.drawTexture(
      skin,
      steve.overlay.body.right,
      (ox, oy, 64, bodyHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.body.front,
      (ox + 64, oy, 64, bodyHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.body.left,
      (ox + 128, oy, 64, bodyHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.body.back,
      (ox + 192, oy, 64, bodyHeight),
      ~pixelate=true,
      (),
    )
  }

  // Arms
  if alexModel {
    let ox = x + 49
    let oy = y + 10
    Generator.drawTexture(
      skin,
      alex.base.rightArm.left,
      (ox, oy, 32, 48),
      ~rotate=90.0,
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      alex.base.rightArm.right,
      (ox, oy + 32, 32, 48),
      ~rotate=90.0,
      ~pixelate=true,
      (),
    )

    if showArmOverlay {
      Generator.drawTexture(
        skin,
        alex.overlay.rightArm.left,
        (ox, oy, 32, 48),
        ~rotate=90.0,
        ~pixelate=true,
        (),
      )
      Generator.drawTexture(
        skin,
        alex.overlay.rightArm.right,
        (ox, oy + 32, 32, 48),
        ~rotate=90.0,
        ~pixelate=true,
        (),
      )
    }

    let ox = x + 241
    let oy = y + 42
    Generator.drawTexture(
      skin,
      alex.base.leftArm.right,
      (ox, oy, 32, 48),
      ~rotate=-90.0,
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      alex.base.leftArm.left,
      (ox, oy + 32, 32, 48),
      ~rotate=-90.0,
      ~pixelate=true,
      (),
    )

    if showArmOverlay {
      Generator.drawTexture(
        skin,
        alex.overlay.leftArm.right,
        (ox, oy, 32, 48),
        ~rotate=-90.0,
        ~pixelate=true,
        (),
      )
      Generator.drawTexture(
        skin,
        alex.overlay.leftArm.left,
        (ox, oy + 32, 32, 48),
        ~rotate=-90.0,
        ~pixelate=true,
        (),
      )
    }
  } else {
    let ox = x + 9
    let oy = y + 2
    Generator.drawTexture(
      skin,
      steve.base.rightArm.left,
      (ox, oy, 32, 48),
      ~rotate=90.0,
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.base.rightArm.right,
      (ox, oy + 32, 32, 48),
      ~rotate=90.0,
      ~pixelate=true,
      (),
    )

    if showArmOverlay {
      Generator.drawTexture(
        skin,
        steve.overlay.rightArm.left,
        (ox, oy, 32, 48),
        ~rotate=90.0,
        ~pixelate=true,
        (),
      )
      Generator.drawTexture(
        skin,
        steve.overlay.rightArm.right,
        (ox, oy + 32, 32, 48),
        ~rotate=90.0,
        ~pixelate=true,
        (),
      )
    }

    let ox = x + 249
    let oy = y + 2
    Generator.drawTexture(
      skin,
      steve.base.leftArm.right,
      (ox, oy, 32, 48),
      ~rotate=-90.0,
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.base.leftArm.left,
      (ox, oy + 32, 32, 48),
      ~rotate=-90.0,
      ~pixelate=true,
      (),
    )

    if showArmOverlay {
      Generator.drawTexture(
        skin,
        steve.overlay.leftArm.right,
        (ox, oy, 32, 48),
        ~rotate=-90.0,
        ~pixelate=true,
        (),
      )
      Generator.drawTexture(
        skin,
        steve.overlay.leftArm.left,
        (ox, oy + 32, 32, 48),
        ~rotate=-90.0,
        ~pixelate=true,
        (),
      )
    }
  }

  //legs
  let ox = x + 49
  let oy = y + 154

  // Right Leg
  Generator.drawTexture(
    skin,
    steve.base.rightLeg.front,
    (ox + 64, oy + bodyHeight, 32, legHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.rightLeg.right,
    (ox, oy + bodyHeight, 64, legHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.rightLeg.back,
    (ox + 224, oy + bodyHeight, 32, legHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.rightLeg.bottom,
    (ox + 64, oy + 64, 32, 64),
    ~flip=#Vertical,
    ~pixelate=true,
    (),
  )

  // Left Leg
  Generator.drawTexture(
    skin,
    steve.base.leftLeg.front,
    (ox + 96, oy + bodyHeight, 32, legHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.leftLeg.left,
    (ox + 128, oy + bodyHeight, 64, legHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.leftLeg.back,
    (ox + 192, oy + bodyHeight, 32, legHeight),
    ~pixelate=true,
    (),
  )
  Generator.drawTexture(
    skin,
    steve.base.leftLeg.bottom,
    (ox + 96, oy + 64, 32, 64),
    ~flip=#Vertical,
    ~pixelate=true,
    (),
  )

  if showLegOverlay {
    // Right Leg
    Generator.drawTexture(
      skin,
      steve.overlay.rightLeg.front,
      (ox + 64, oy + bodyHeight, 32, legHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.rightLeg.right,
      (ox, oy + bodyHeight, 64, legHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.rightLeg.back,
      (ox + 224, oy + bodyHeight, 32, legHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.rightLeg.bottom,
      (ox + 64, oy + 64, 32, 64),
      ~flip=#Vertical,
      ~pixelate=true,
      (),
    )

    // Left
    Generator.drawTexture(
      skin,
      steve.overlay.leftLeg.front,
      (ox + 96, oy + bodyHeight, 32, legHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.leftLeg.left,
      (ox + 128, oy + bodyHeight, 64, legHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.leftLeg.back,
      (ox + 192, oy + bodyHeight, 32, legHeight),
      ~pixelate=true,
      (),
    )
    Generator.drawTexture(
      skin,
      steve.overlay.leftLeg.bottom,
      (ox + 96, oy + 64, 32, 64),
      ~flip=#Vertical,
      ~pixelate=true,
      (),
    )
  }

  // Draw the fold and cut lines
  Generator.drawImage("Skin Overlay", (x, y))
}

let script = () => {
  // Define the user inputs
  Generator.defineTextureInput("Skin 1", {standardWidth: 64, standardHeight: 64, choices: []})
  Generator.defineTextureInput("Skin 2", {standardWidth: 64, standardHeight: 64, choices: []})

  let showSkin1 = Generator.hasTexture("Skin 1")
  let showSkin2 = Generator.hasTexture("Skin 2")

  if showSkin1 {
    Generator.defineSelectInput("Skin 1 Model Type", ["Steve", "Alex"])
    let modelType1 = Generator.getSelectInputValue("Skin 1 Model Type")

    Generator.defineBooleanInput("Skin 1 Head Overlay", true)
    Generator.defineBooleanInput("Skin 1 Body Overlay", true)
    Generator.defineBooleanInput("Skin 1 Arm Overlay", true)
    Generator.defineBooleanInput("Skin 1 Leg Overlay", true)
    Generator.defineRangeInput(
      "Skin 1 Body Height",
      {
        min: 0,
        max: 64,
        value: 32,
        step: 1,
      },
    )

    let alexModel1 = modelType1 === "Alex"
    let showSkin1HeadOverlay = Generator.getBooleanInputValue("Skin 1 Head Overlay")
    let showSkin1BodyOverlay = Generator.getBooleanInputValue("Skin 1 Body Overlay")
    let showSkin1ArmOverlay = Generator.getBooleanInputValue("Skin 1 Arm Overlay")
    let showSkin1LegOverlay = Generator.getBooleanInputValue("Skin 1 Leg Overlay")
    let skin1BodyHeight = Generator.getRangeInputValue("Skin 1 Body Height")

    let skin1Options = {
      skin: "Skin 1",
      x: 151,
      y: 108,
      alexModel: alexModel1,
      showHeadOverlay: showSkin1HeadOverlay,
      showBodyOverlay: showSkin1BodyOverlay,
      showArmOverlay: showSkin1ArmOverlay,
      showLegOverlay: showSkin1LegOverlay,
      bodyHeight: skin1BodyHeight,
    }

    drawMini(skin1Options)
  }

  if showSkin2 {
    Generator.defineSelectInput("Skin 2 Model Type", ["Steve", "Alex"])
    let modelType2 = Generator.getSelectInputValue("Skin 2 Model Type")

    Generator.defineBooleanInput("Skin 2 Head Overlay", true)
    Generator.defineBooleanInput("Skin 2 Body Overlay", true)
    Generator.defineBooleanInput("Skin 2 Arm Overlay", true)
    Generator.defineBooleanInput("Skin 2 Leg Overlay", true)
    Generator.defineRangeInput(
      "Skin 2 Body Height",
      {
        min: 0,
        max: 64,
        value: 32,
        step: 1,
      },
    )

    let alexModel2 = modelType2 === "Alex"
    let showSkin2HeadOverlay = Generator.getBooleanInputValue("Skin 2 Head Overlay")
    let showSkin2BodyOverlay = Generator.getBooleanInputValue("Skin 2 Body Overlay")
    let showSkin2ArmOverlay = Generator.getBooleanInputValue("Skin 2 Arm Overlay")
    let showSkin2LegOverlay = Generator.getBooleanInputValue("Skin 2 Leg Overlay")
    let skin2BodyHeight = +Generator.getRangeInputValue("Skin 2 Body Height")
    let skin2Options = {
      skin: "Skin 2",
      x: 151,
      y: 453,
      alexModel: alexModel2,
      showHeadOverlay: showSkin2HeadOverlay,
      showBodyOverlay: showSkin2BodyOverlay,
      showArmOverlay: showSkin2ArmOverlay,
      showLegOverlay: showSkin2LegOverlay,
      bodyHeight: skin2BodyHeight,
    }

    drawMini(skin2Options)
  }
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: None,
  images: images,
  textures: textures,
  script: script,
}
