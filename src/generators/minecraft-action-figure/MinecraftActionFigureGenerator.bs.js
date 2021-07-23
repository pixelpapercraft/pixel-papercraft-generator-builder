// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Generator = require("../../builder/modules/Generator.bs.js");

function requireImage(id) {
  return require("./images/" + id + ".png");
}

function requireTexture(id) {
  return require("./textures/" + id + ".png");
}

var id = "minecraft-action-figure";

var name = "Minecraft Action Figure";

var thumbnail = {
  url: require("./thumbnail/thumbnail.jpeg")
};

var imageIds = [
  "Backgroundalex",
  "Backgroundsteve",
  "Foldsalex",
  "Foldssteve",
  "Labels",
  "Notch"
];

function toImageDef(id) {
  return {
          id: id,
          url: requireImage(id)
        };
}

var images = imageIds.map(toImageDef);

var textures = [{
    id: "Skin",
    url: requireTexture("Skin64x64Steve"),
    standardWidth: 64,
    standardHeight: 64
  }];

function script(param) {
  Generator.defineSelectInput("Skin Model Type", [
        "Steve",
        "Alex"
      ]);
  Generator.defineTextureInput("Skin", {
        standardWidth: 64,
        standardHeight: 64,
        choices: []
      });
  Generator.defineBooleanInput("Hand Notches", false);
  Generator.defineBooleanInput("Show Folds", true);
  Generator.defineBooleanInput("Show Labels", true);
  var alexModel = Generator.getSelectInputValue("Skin Model Type") === "Alex";
  var handNotches = Generator.getBooleanInputValue("Hand Notches");
  var showFolds = Generator.getBooleanInputValue("Show Folds");
  var showLabels = Generator.getBooleanInputValue("Show Labels");
  var hideHelmet = Generator.getBooleanInputValue("Hide Helmet");
  var hideJacket = Generator.getBooleanInputValue("Hide Jacket");
  var hideLeftSleeve = Generator.getBooleanInputValue("Hide Left Sleeve");
  var hideRightSleeve = Generator.getBooleanInputValue("Hide Right Sleeve");
  var hideLeftPant = Generator.getBooleanInputValue("Hide Left Pant");
  var hideRightPant = Generator.getBooleanInputValue("Hide Right Pant");
  Generator.defineRegionInput([
        10,
        534,
        192,
        256
      ], (function (param) {
          return Generator.setBooleanInputValue("Hide Helmet", !hideHelmet);
        }));
  Generator.defineRegionInput([
        35,
        50,
        192,
        144
      ], (function (param) {
          return Generator.setBooleanInputValue("Hide Jacket", !hideJacket);
        }));
  Generator.defineRegionInput([
        265,
        211,
        128,
        160
      ], (function (param) {
          return Generator.setBooleanInputValue("Hide Left Sleeve", !hideLeftSleeve);
        }));
  Generator.defineRegionInput([
        425,
        587,
        128,
        160
      ], (function (param) {
          return Generator.setBooleanInputValue("Hide Right Sleeve", !hideRightSleeve);
        }));
  Generator.defineRegionInput([
        425,
        162,
        128,
        208
      ], (function (param) {
          return Generator.setBooleanInputValue("Hide Left Pant", !hideLeftPant);
        }));
  Generator.defineRegionInput([
        265,
        538,
        128,
        208
      ], (function (param) {
          return Generator.setBooleanInputValue("Hide Right Pant", !hideRightPant);
        }));
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 74,
        y: 790,
        w: 64,
        h: 64
      }, undefined, -90.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 74,
        y: 726,
        w: 64,
        h: 64
      }, undefined, -90.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 74,
        y: 662,
        w: 64,
        h: 64
      }, undefined, -90.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 74,
        y: 598,
        w: 64,
        h: 64
      }, undefined, -90.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 10,
        y: 726,
        w: 64,
        h: 64
      }, undefined, -90.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 138,
        y: 726,
        w: 64,
        h: 64
      }, "Vertical", -90.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 36,
        y: 414,
        w: 64,
        h: 96
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: 163,
        y: 380,
        w: 32,
        h: 130
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 4,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: 131,
        y: 380,
        w: 32,
        h: 130
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 16,
        w: 24,
        h: 16
      }, {
        x: 35,
        y: 50,
        w: 192,
        h: 128
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 20,
        w: 4,
        h: 4
      }, {
        x: 35,
        y: 178,
        w: 32,
        h: 32
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 52,
        w: 4,
        h: 4
      }, {
        x: 131,
        y: 178,
        w: 32,
        h: 32
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 16,
        w: 8,
        h: 4
      }, {
        x: 67,
        y: 178,
        w: 64,
        h: 32
      }, "Vertical", undefined, undefined);
  if (alexModel) {
    Generator.drawTextureLegacy("Skin", {
          x: 39,
          y: 48,
          w: 3,
          h: 4
        }, {
          x: 329,
          y: 338,
          w: 24,
          h: 32
        }, "Vertical", undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 48,
          w: 11,
          h: 16
        }, {
          x: 297,
          y: 211,
          w: 88,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 43,
          y: 52,
          w: 3,
          h: 12
        }, {
          x: 273,
          y: 243,
          w: 24,
          h: 96
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 52,
          w: 4,
          h: 4
        }, {
          x: 297,
          y: 121,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 52,
          w: 4,
          h: 4
        }, {
          x: 297,
          y: 86,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 47,
          y: 16,
          w: 3,
          h: 4
        }, {
          x: 465,
          y: 714,
          w: 24,
          h: 32
        }, "Vertical", undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 40,
          y: 16,
          w: 14,
          h: 16
        }, {
          x: 433,
          y: 587,
          w: 112,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 47,
          y: 20,
          w: 4,
          h: 4
        }, {
          x: 489,
          y: 496,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 47,
          y: 20,
          w: 4,
          h: 4
        }, {
          x: 489,
          y: 462,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
  } else {
    Generator.drawTextureLegacy("Skin", {
          x: 40,
          y: 48,
          w: 4,
          h: 4
        }, {
          x: 329,
          y: 338,
          w: 32,
          h: 32
        }, "Vertical", undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 48,
          w: 12,
          h: 16
        }, {
          x: 297,
          y: 211,
          w: 96,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 44,
          y: 52,
          w: 4,
          h: 12
        }, {
          x: 265,
          y: 243,
          w: 32,
          h: 96
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 52,
          w: 4,
          h: 4
        }, {
          x: 297,
          y: 121,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 52,
          w: 4,
          h: 4
        }, {
          x: 297,
          y: 86,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 48,
          y: 16,
          w: 4,
          h: 4
        }, {
          x: 457,
          y: 714,
          w: 32,
          h: 32
        }, "Vertical", undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 40,
          y: 16,
          w: 16,
          h: 16
        }, {
          x: 425,
          y: 587,
          w: 128,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 48,
          y: 20,
          w: 4,
          h: 4
        }, {
          x: 489,
          y: 496,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 48,
          y: 20,
          w: 4,
          h: 4
        }, {
          x: 489,
          y: 462,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
  }
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 48,
        w: 12,
        h: 16
      }, {
        x: 457,
        y: 210,
        w: 96,
        h: 128
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 52,
        w: 4,
        h: 8
      }, {
        x: 521,
        y: 210,
        w: 32,
        h: 64
      }, undefined, 180.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 52,
        w: 4,
        h: 12
      }, {
        x: 425,
        y: 242,
        w: 32,
        h: 96
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: 489,
        y: 338,
        w: 32,
        h: 32
      }, "Vertical", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 16,
        w: 16,
        h: 16
      }, {
        x: 265,
        y: 586,
        w: 128,
        h: 128
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 12,
        y: 20,
        w: 4,
        h: 8
      }, {
        x: 329,
        y: 586,
        w: 32,
        h: 64
      }, undefined, 180.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: 297,
        y: 714,
        w: 32,
        h: 32
      }, "Vertical", undefined, undefined);
  if (!hideHelmet) {
    Generator.drawTextureLegacy("Skin", {
          x: 32,
          y: 8,
          w: 8,
          h: 8
        }, {
          x: 74,
          y: 790,
          w: 64,
          h: 64
        }, undefined, -90.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 40,
          y: 8,
          w: 8,
          h: 8
        }, {
          x: 74,
          y: 726,
          w: 64,
          h: 64
        }, undefined, -90.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 48,
          y: 8,
          w: 8,
          h: 8
        }, {
          x: 74,
          y: 662,
          w: 64,
          h: 64
        }, undefined, -90.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 56,
          y: 8,
          w: 8,
          h: 8
        }, {
          x: 74,
          y: 598,
          w: 64,
          h: 64
        }, undefined, -90.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 40,
          y: 0,
          w: 8,
          h: 8
        }, {
          x: 10,
          y: 726,
          w: 64,
          h: 64
        }, undefined, -90.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 48,
          y: 0,
          w: 8,
          h: 8
        }, {
          x: 138,
          y: 726,
          w: 64,
          h: 64
        }, "Vertical", -90.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 48,
          y: 0,
          w: 8,
          h: 8
        }, {
          x: 36,
          y: 414,
          w: 64,
          h: 96
        }, undefined, undefined, undefined);
  }
  if (!hideJacket) {
    Generator.drawTextureLegacy("Skin", {
          x: 16,
          y: 32,
          w: 24,
          h: 16
        }, {
          x: 35,
          y: 50,
          w: 192,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 28,
          y: 32,
          w: 8,
          h: 4
        }, {
          x: 67,
          y: 178,
          w: 64,
          h: 32
        }, "Vertical", undefined, undefined);
  }
  if (alexModel) {
    if (!hideLeftSleeve) {
      Generator.drawTextureLegacy("Skin", {
            x: 55,
            y: 48,
            w: 3,
            h: 4
          }, {
            x: 329,
            y: 338,
            w: 24,
            h: 32
          }, "Vertical", undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 48,
            w: 11,
            h: 16
          }, {
            x: 297,
            y: 211,
            w: 88,
            h: 128
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 59,
            y: 52,
            w: 3,
            h: 12
          }, {
            x: 273,
            y: 243,
            w: 24,
            h: 96
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 52,
            w: 4,
            h: 4
          }, {
            x: 297,
            y: 121,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 52,
            w: 4,
            h: 4
          }, {
            x: 297,
            y: 86,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
    }
    if (!hideRightSleeve) {
      Generator.drawTextureLegacy("Skin", {
            x: 47,
            y: 32,
            w: 3,
            h: 4
          }, {
            x: 465,
            y: 714,
            w: 24,
            h: 32
          }, "Vertical", undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 40,
            y: 32,
            w: 14,
            h: 16
          }, {
            x: 433,
            y: 587,
            w: 112,
            h: 128
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 47,
            y: 36,
            w: 4,
            h: 4
          }, {
            x: 489,
            y: 496,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 47,
            y: 36,
            w: 4,
            h: 4
          }, {
            x: 489,
            y: 462,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
    }
    
  } else {
    if (!hideLeftSleeve) {
      Generator.drawTextureLegacy("Skin", {
            x: 56,
            y: 48,
            w: 4,
            h: 4
          }, {
            x: 329,
            y: 338,
            w: 32,
            h: 32
          }, "Vertical", undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 48,
            w: 12,
            h: 16
          }, {
            x: 297,
            y: 211,
            w: 96,
            h: 128
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 60,
            y: 52,
            w: 4,
            h: 12
          }, {
            x: 265,
            y: 243,
            w: 32,
            h: 96
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 52,
            w: 4,
            h: 4
          }, {
            x: 297,
            y: 121,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 52,
            w: 4,
            h: 4
          }, {
            x: 297,
            y: 86,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
    }
    if (!hideRightSleeve) {
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 32,
            w: 4,
            h: 4
          }, {
            x: 457,
            y: 714,
            w: 32,
            h: 32
          }, "Vertical", undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 40,
            y: 32,
            w: 16,
            h: 16
          }, {
            x: 425,
            y: 587,
            w: 128,
            h: 128
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 36,
            w: 4,
            h: 4
          }, {
            x: 489,
            y: 496,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
      Generator.drawTextureLegacy("Skin", {
            x: 48,
            y: 36,
            w: 4,
            h: 4
          }, {
            x: 489,
            y: 462,
            w: 32,
            h: 32
          }, undefined, undefined, undefined);
    }
    
  }
  if (!hideLeftPant) {
    Generator.drawTextureLegacy("Skin", {
          x: 4,
          y: 48,
          w: 4,
          h: 4
        }, {
          x: 163,
          y: 380,
          w: 32,
          h: 130
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 0,
          y: 48,
          w: 12,
          h: 16
        }, {
          x: 457,
          y: 210,
          w: 96,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 12,
          y: 52,
          w: 4,
          h: 8
        }, {
          x: 521,
          y: 210,
          w: 32,
          h: 64
        }, undefined, 180.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 12,
          y: 52,
          w: 4,
          h: 12
        }, {
          x: 425,
          y: 242,
          w: 32,
          h: 96
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 8,
          y: 48,
          w: 4,
          h: 4
        }, {
          x: 489,
          y: 338,
          w: 32,
          h: 32
        }, "Vertical", undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 8,
          y: 52,
          w: 4,
          h: 4
        }, {
          x: 131,
          y: 178,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
  }
  if (!hideRightPant) {
    Generator.drawTextureLegacy("Skin", {
          x: 4,
          y: 32,
          w: 4,
          h: 4
        }, {
          x: 131,
          y: 380,
          w: 32,
          h: 130
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 0,
          y: 32,
          w: 16,
          h: 16
        }, {
          x: 265,
          y: 586,
          w: 128,
          h: 128
        }, undefined, undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 12,
          y: 36,
          w: 4,
          h: 8
        }, {
          x: 329,
          y: 586,
          w: 32,
          h: 64
        }, undefined, 180.0, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 8,
          y: 32,
          w: 4,
          h: 4
        }, {
          x: 297,
          y: 714,
          w: 32,
          h: 32
        }, "Vertical", undefined, undefined);
    Generator.drawTextureLegacy("Skin", {
          x: 0,
          y: 36,
          w: 4,
          h: 4
        }, {
          x: 35,
          y: 178,
          w: 32,
          h: 32
        }, undefined, undefined, undefined);
  }
  if (alexModel) {
    Generator.drawImage("Backgroundalex", [
          0,
          0
        ]);
  } else {
    Generator.drawImage("Backgroundsteve", [
          0,
          0
        ]);
  }
  if (showFolds) {
    if (alexModel) {
      Generator.drawImage("Foldsalex", [
            0,
            0
          ]);
    } else {
      Generator.drawImage("Foldssteve", [
            0,
            0
          ]);
    }
  }
  if (handNotches) {
    if (alexModel) {
      Generator.drawImage("Notch", [
            341,
            307
          ]);
      Generator.drawImage("Notch", [
            285,
            307
          ]);
      Generator.drawImage("Notch", [
            477,
            683
          ]);
      Generator.drawImage("Notch", [
            533,
            683
          ]);
    } else {
      Generator.drawImage("Notch", [
            345,
            307
          ]);
      Generator.drawImage("Notch", [
            281,
            307
          ]);
      Generator.drawImage("Notch", [
            473,
            683
          ]);
      Generator.drawImage("Notch", [
            537,
            683
          ]);
    }
  }
  if (showLabels) {
    return Generator.drawImage("Labels", [
                0,
                0
              ]);
  }
  
}

var generator_thumbnail = thumbnail;

var generator = {
  id: id,
  name: name,
  thumbnail: generator_thumbnail,
  video: undefined,
  instructions: undefined,
  images: images,
  textures: textures,
  script: script
};

exports.requireImage = requireImage;
exports.requireTexture = requireTexture;
exports.id = id;
exports.name = name;
exports.thumbnail = thumbnail;
exports.imageIds = imageIds;
exports.toImageDef = toImageDef;
exports.images = images;
exports.textures = textures;
exports.script = script;
exports.generator = generator;
/* thumbnail Not a pure module */
