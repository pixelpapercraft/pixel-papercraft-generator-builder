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

let steve = TextureMap.MinecraftCharacterLegacy.steve
let alex = TextureMap.MinecraftCharacterLegacy.alex

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
  Generator.drawTextureLegacy(skin, steve.base.head.right, {x: ox, y: oy, w: 64, h: 64}, ()) // Right
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.front,
    {
      x: ox + 64,
      y: oy,
      w: 64,
      h: 64,
    },
    (),
  ) // Face
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.left,
    {
      x: ox + 128,
      y: oy,
      w: 64,
      h: 64,
    },
    (),
  ) // Left
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.back,
    {
      x: ox + 192,
      y: oy,
      w: 64,
      h: 64,
    },
    (),
  ) // Back
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.top,
    {
      x: ox + 64,
      y: oy - 64,
      w: 64,
      h: 64,
    },
    (),
  ) // Top

  // head overlay
  if showHeadOverlay {
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.right,
      {
        x: ox,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Right
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.front,
      {
        x: ox + 64,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Face
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.left,
      {
        x: ox + 128,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Left
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.back,
      {
        x: ox + 192,
        y: oy,
        w: 64,
        h: 64,
      },
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.top,
      {
        x: ox + 64,
        y: oy - 64,
        w: 64,
        h: 64,
      },
      (),
    )
  }

  //head flaps
  let ox = x + 49
  let oy = y + 26
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.right,
    {x: ox + 64, y: oy, w: 64, h: 64},
    ~rotateLegacy=90.0,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    skin,
    steve.base.head.left,
    {x: ox + 128, y: oy + 64, w: 64, h: 64},
    ~rotateLegacy=-90.0,
    (),
  ) // Left
  if showHeadOverlay {
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.right,
      {x: ox + 64, y: oy, w: 64, h: 64},
      ~rotateLegacy=90.0,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.head.left,
      {x: ox + 128, y: oy + 64, w: 64, h: 64},
      ~rotateLegacy=-90.0,
      (),
    )
  }

  // Body
  let ox = x + 49
  let oy = y + 154
  Generator.drawTextureLegacy(
    skin,
    steve.base.body.right,
    {
      x: ox,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    ~pixelate=true,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    skin,
    steve.base.body.front,
    {
      x: ox + 64,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    ~pixelate=true,
    (),
  ) // Front
  Generator.drawTextureLegacy(
    skin,
    steve.base.body.left,
    {
      x: ox + 128,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    ~pixelate=true,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    skin,
    steve.base.body.back,
    {
      x: ox + 192,
      y: oy,
      w: 64,
      h: bodyHeight,
    },
    ~pixelate=true,
    (),
  ) // Back

  // Body Overlay
  if showBodyOverlay {
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.body.right,
      {
        x: ox,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      ~pixelate=true,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.body.front,
      {
        x: ox + 64,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      ~pixelate=true,
      (),
    ) // Front
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.body.left,
      {
        x: ox + 128,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      ~pixelate=true,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.body.back,
      {
        x: ox + 192,
        y: oy,
        w: 64,
        h: bodyHeight,
      },
      ~pixelate=true,
      (),
    )
  }

  // Arms
  if alexModel {
    // right arm
    let ox = x + 49
    let oy = y + 10
    Generator.drawTextureLegacy(
      skin,
      alex.base.rightArm.left,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      alex.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        alex.overlay.rightArm.left,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        alex.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      )
    }

    //left arm
    let ox = x + 241
    let oy = y + 42
    Generator.drawTextureLegacy(
      skin,
      alex.base.leftArm.right,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      alex.base.leftArm.left,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        alex.overlay.leftArm.right,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        alex.overlay.leftArm.left,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      )
    }
  } else {
    // right arm
    let ox = x + 49
    let oy = y + 10
    Generator.drawTextureLegacy(
      skin,
      steve.base.rightArm.left,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      steve.base.rightArm.right,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        steve.overlay.rightArm.left,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        steve.overlay.rightArm.right,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=90.0,
        (),
      )
    }

    //left arm
    let ox = x + 241
    let oy = y + 42
    Generator.drawTextureLegacy(
      skin,
      steve.base.leftArm.right,
      {x: ox, y: oy, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      steve.base.leftArm.left,
      {x: ox, y: oy + 32, w: 32, h: 48},
      ~rotateLegacy=-90.0,
      (),
    ) // front

    if showArmOverlay {
      Generator.drawTextureLegacy(
        skin,
        steve.overlay.leftArm.right,
        {x: ox, y: oy, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      ) // Back
      Generator.drawTextureLegacy(
        skin,
        steve.overlay.leftArm.left,
        {x: ox, y: oy + 32, w: 32, h: 48},
        ~rotateLegacy=-90.0,
        (),
      )
    }
  }

  //legs
  let ox = x + 49
  let oy = y + 154

  // Right Leg
  Generator.drawTextureLegacy(
    skin,
    steve.base.rightLeg.front,
    {
      x: ox + 64,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    ~pixelate=true,
    (),
  ) // Front
  Generator.drawTextureLegacy(
    skin,
    steve.base.rightLeg.right,
    {
      x: ox,
      y: oy + bodyHeight,
      w: 64,
      h: legHeight,
    },
    ~pixelate=true,
    (),
  ) // Right
  Generator.drawTextureLegacy(
    skin,
    steve.base.rightLeg.back,
    {
      x: ox + 224,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    ~pixelate=true,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    skin,
    steve.base.rightLeg.bottom,
    {x: ox + 64, y: oy + 64, w: 32, h: 64},
    ~flip=#Vertical,
    ~pixelate=true,
    (),
  ) // Bottom

  // Left Leg
  Generator.drawTextureLegacy(
    skin,
    steve.base.leftLeg.front,
    {
      x: ox + 96,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    ~pixelate=true,
    (),
  ) // Front
  Generator.drawTextureLegacy(
    skin,
    steve.base.leftLeg.left,
    {
      x: ox + 128,
      y: oy + bodyHeight,
      w: 64,
      h: legHeight,
    },
    ~pixelate=true,
    (),
  ) // Left
  Generator.drawTextureLegacy(
    skin,
    steve.base.leftLeg.back,
    {
      x: ox + 192,
      y: oy + bodyHeight,
      w: 32,
      h: legHeight,
    },
    ~pixelate=true,
    (),
  ) // Back
  Generator.drawTextureLegacy(
    skin,
    steve.base.leftLeg.bottom,
    {x: ox + 96, y: oy + 64, w: 32, h: 64},
    ~flip=#Vertical,
    ~pixelate=true,
    (),
  ) // Bottom

  if showLegOverlay {
    // Right Leg
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.rightLeg.front,
      {
        x: ox + 64,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      ~pixelate=true,
      (),
    ) // Front
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.rightLeg.right,
      {
        x: ox,
        y: oy + bodyHeight,
        w: 64,
        h: legHeight,
      },
      ~pixelate=true,
      (),
    ) // Right
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.rightLeg.back,
      {
        x: ox + 224,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      ~pixelate=true,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.rightLeg.bottom,
      {x: ox + 64, y: oy + 64, w: 32, h: 64},
      ~flip=#Vertical,
      ~pixelate=true,
      (),
    ) // Bottom

    // Left
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.leftLeg.front,
      {
        x: ox + 96,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      ~pixelate=true,
      (),
    ) // Front
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.leftLeg.left,
      {
        x: ox + 128,
        y: oy + bodyHeight,
        w: 64,
        h: legHeight,
      },
      ~pixelate=true,
      (),
    ) // Left
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.leftLeg.back,
      {
        x: ox + 192,
        y: oy + bodyHeight,
        w: 32,
        h: legHeight,
      },
      ~pixelate=true,
      (),
    ) // Back
    Generator.drawTextureLegacy(
      skin,
      steve.overlay.leftLeg.bottom,
      {x: ox + 96, y: oy + 64, w: 32, h: 64},
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
