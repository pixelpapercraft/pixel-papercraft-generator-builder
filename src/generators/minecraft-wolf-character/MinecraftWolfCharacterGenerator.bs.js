// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Generator = require("../../builder/modules/Generator.bs.js");
var TextureMap = require("../TextureMap.bs.js");

function requireImage(id) {
  return require("./images/" + id + ".png");
}

function requireTexture(id) {
  return require("./textures/" + id + ".png");
}

var id = "minecraft-wolf-character";

var name = "Minecraft Wolf Character";

var thumbnail = {
  url: require("./thumbnail/thumbnail.jpeg")
};

var images = [
  {
    id: "Background",
    url: requireImage("Background")
  },
  {
    id: "Folds",
    url: requireImage("Folds")
  },
  {
    id: "Red Eyes",
    url: requireImage("RedEye2")
  }
];

var textures = [{
    id: "Skin",
    url: requireTexture("Skin"),
    standardWidth: 64,
    standardHeight: 64
  }];

var steve = TextureMap.MinecraftCharacterLegacy.steve;

function script(param) {
  Generator.defineTextureInput("Skin", {
        standardWidth: 64,
        standardHeight: 64,
        choices: []
      });
  Generator.defineBooleanInput("Show Folds", true);
  Generator.defineBooleanInput("Show Red Eyes", false);
  var showFolds = Generator.getBooleanInputValue("Show Folds");
  var showRedEyes = Generator.getBooleanInputValue("Show Red Eyes");
  Generator.drawImage("Background", [
        0,
        0
      ]);
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 341,
        y: 344,
        w: 32,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 373,
        y: 392,
        w: 48,
        h: 32
      }, "Vertical", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 421,
        y: 344,
        w: 32,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 453,
        y: 344,
        w: 48,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 373,
        y: 312,
        w: 48,
        h: 32
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 373,
        y: 344,
        w: 48,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 20,
        w: 16,
        h: 12
      }, {
        x: 85,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 4,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: 101,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: 101,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  var oa = 87;
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 52,
        w: 16,
        h: 12
      }, {
        x: oa + 85 | 0,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa + 101 | 0,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa + 101 | 0,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  var oa$1 = oa + 87 | 0;
  Generator.drawTextureLegacy("Skin", {
        x: 40,
        y: 20,
        w: 16,
        h: 12
      }, {
        x: oa$1 + 85 | 0,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 44,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: oa$1 + 101 | 0,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 48,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: oa$1 + 101 | 0,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  var oa$2 = oa$1 + 87 | 0;
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 52,
        w: 16,
        h: 12
      }, {
        x: oa$2 + 85 | 0,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 36,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa$2 + 101 | 0,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 40,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa$2 + 101 | 0,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: 479,
        y: 549,
        w: 16,
        h: 16
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 4,
        y: 16,
        w: 4,
        h: 4
      }, {
        x: 407,
        y: 534,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  for(var m = 0; m <= 3; ++m){
    var oj$p = 0 + (m << 4) | 0;
    Generator.drawTextureLegacy("Skin", {
          x: 4,
          y: 20,
          w: 4,
          h: 12
        }, {
          x: 423,
          y: 582 - oj$p | 0,
          w: 16,
          h: 56
        }, undefined, 270.0, undefined);
  }
  Generator.drawTextureLegacy("Skin", {
        x: 10,
        y: 13,
        w: 4,
        h: 3
      }, {
        x: 416,
        y: 232,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 10,
        y: 13,
        w: 1,
        h: 3
      }, {
        x: 392,
        y: 232,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 10,
        y: 13,
        w: 4,
        h: 1
      }, {
        x: 416,
        y: 208,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 10,
        y: 15,
        w: 4,
        h: 1
      }, {
        x: 416,
        y: 256,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 13,
        y: 13,
        w: 1,
        h: 3
      }, {
        x: 440,
        y: 232,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 20,
        w: 8,
        h: 4
      }, {
        x: 141,
        y: 254,
        w: 64,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 20,
        w: 4,
        h: 4
      }, {
        x: 85,
        y: 254,
        w: 56,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 20,
        w: 4,
        h: 4
      }, {
        x: 205,
        y: 254,
        w: 56,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 20,
        w: 8,
        h: 4
      }, {
        x: 261,
        y: 254,
        w: 64,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 20,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 246,
        w: 64,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 20,
        w: 4,
        h: 1
      }, {
        x: 141,
        y: 254,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 20,
        w: 4,
        h: 1
      }, {
        x: 197,
        y: 254,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 20,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 198,
        w: 64,
        h: 8
      }, "Horizontal", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 25,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 302,
        w: 64,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 25,
        w: 4,
        h: 1
      }, {
        x: 141,
        y: 357,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 25,
        w: 4,
        h: 1
      }, {
        x: 197,
        y: 357,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 25,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 349,
        w: 64,
        h: 8
      }, "Horizontal", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 24,
        w: 8,
        h: 8
      }, {
        x: 163,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 24,
        w: 4,
        h: 8
      }, {
        x: 115,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 24,
        w: 4,
        h: 8
      }, {
        x: 211,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 24,
        w: 8,
        h: 8
      }, {
        x: 259,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 16,
        w: 8,
        h: 4
      }, {
        x: 163,
        y: 499,
        w: 48,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 22,
        y: 17,
        w: 2,
        h: 2
      }, {
        x: 371,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 17,
        w: 2,
        h: 2
      }, {
        x: 395,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 21,
        y: 17,
        w: 1,
        h: 2
      }, {
        x: 363,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 26,
        y: 17,
        w: 1,
        h: 2
      }, {
        x: 387,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 22,
        y: 16,
        w: 2,
        h: 1
      }, {
        x: 371,
        y: 451,
        w: 16,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 22,
        y: 17,
        w: 2,
        h: 2
      }, {
        x: 444,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 17,
        w: 2,
        h: 2
      }, {
        x: 468,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 21,
        y: 17,
        w: 1,
        h: 2
      }, {
        x: 436,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 26,
        y: 17,
        w: 1,
        h: 2
      }, {
        x: 460,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 16,
        w: 2,
        h: 1
      }, {
        x: 444,
        y: 451,
        w: 16,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 341,
        y: 344,
        w: 32,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 48,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 373,
        y: 392,
        w: 48,
        h: 32
      }, "Vertical", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 48,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 421,
        y: 344,
        w: 32,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 52,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 453,
        y: 344,
        w: 48,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 40,
        y: 0,
        w: 8,
        h: 8
      }, {
        x: 373,
        y: 312,
        w: 48,
        h: 32
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 40,
        y: 8,
        w: 8,
        h: 8
      }, {
        x: 373,
        y: 344,
        w: 48,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 36,
        w: 16,
        h: 12
      }, {
        x: 85,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 4,
        y: 32,
        w: 4,
        h: 4
      }, {
        x: 101,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 32,
        w: 4,
        h: 4
      }, {
        x: 101,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  var oa$3 = 87;
  Generator.drawTextureLegacy("Skin", {
        x: 0,
        y: 52,
        w: 16,
        h: 12
      }, {
        x: oa$3 + 85 | 0,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 4,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa$3 + 101 | 0,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa$3 + 101 | 0,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  var oa$4 = oa$3 + 87 | 0;
  Generator.drawTextureLegacy("Skin", {
        x: 40,
        y: 36,
        w: 16,
        h: 12
      }, {
        x: oa$4 + 85 | 0,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 44,
        y: 32,
        w: 4,
        h: 4
      }, {
        x: oa$4 + 101 | 0,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 48,
        y: 32,
        w: 4,
        h: 4
      }, {
        x: oa$4 + 101 | 0,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  var oa$5 = oa$4 + 87 | 0;
  Generator.drawTextureLegacy("Skin", {
        x: 48,
        y: 52,
        w: 16,
        h: 12
      }, {
        x: oa$5 + 85 | 0,
        y: 591,
        w: 64,
        h: 56
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 52,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa$5 + 101 | 0,
        y: 575,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 56,
        y: 48,
        w: 4,
        h: 4
      }, {
        x: oa$5 + 101 | 0,
        y: 647,
        w: 16,
        h: 16
      }, "Vertical", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 8,
        y: 32,
        w: 4,
        h: 4
      }, {
        x: 479,
        y: 549,
        w: 16,
        h: 16
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 4,
        y: 32,
        w: 4,
        h: 4
      }, {
        x: 407,
        y: 534,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  for(var m$1 = 0; m$1 <= 3; ++m$1){
    var oj$p$1 = 0 + (m$1 << 4) | 0;
    Generator.drawTextureLegacy("Skin", {
          x: 4,
          y: 36,
          w: 4,
          h: 12
        }, {
          x: 423,
          y: 582 - oj$p$1 | 0,
          w: 16,
          h: 56
        }, undefined, 270.0, undefined);
  }
  Generator.drawTextureLegacy("Skin", {
        x: 42,
        y: 13,
        w: 4,
        h: 3
      }, {
        x: 416,
        y: 232,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 42,
        y: 13,
        w: 1,
        h: 3
      }, {
        x: 392,
        y: 232,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 42,
        y: 13,
        w: 4,
        h: 1
      }, {
        x: 416,
        y: 208,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 42,
        y: 15,
        w: 4,
        h: 1
      }, {
        x: 416,
        y: 256,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 42,
        y: 13,
        w: 1,
        h: 3
      }, {
        x: 440,
        y: 232,
        w: 24,
        h: 24
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 36,
        w: 8,
        h: 4
      }, {
        x: 141,
        y: 254,
        w: 64,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 36,
        w: 4,
        h: 4
      }, {
        x: 85,
        y: 254,
        w: 56,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 36,
        w: 4,
        h: 4
      }, {
        x: 205,
        y: 254,
        w: 56,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 36,
        w: 8,
        h: 4
      }, {
        x: 261,
        y: 254,
        w: 64,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 36,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 246,
        w: 64,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 36,
        w: 4,
        h: 1
      }, {
        x: 141,
        y: 254,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 36,
        w: 4,
        h: 1
      }, {
        x: 197,
        y: 254,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 36,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 198,
        w: 64,
        h: 8
      }, "Horizontal", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 41,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 302,
        w: 64,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 41,
        w: 4,
        h: 1
      }, {
        x: 141,
        y: 357,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 41,
        w: 4,
        h: 1
      }, {
        x: 197,
        y: 357,
        w: 56,
        h: 8
      }, undefined, 270.0, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 41,
        w: 8,
        h: 1
      }, {
        x: 141,
        y: 349,
        w: 64,
        h: 8
      }, "Horizontal", undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 20,
        y: 40,
        w: 8,
        h: 8
      }, {
        x: 163,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 16,
        y: 40,
        w: 4,
        h: 8
      }, {
        x: 115,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 40,
        w: 4,
        h: 8
      }, {
        x: 211,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 32,
        y: 40,
        w: 8,
        h: 8
      }, {
        x: 259,
        y: 427,
        w: 48,
        h: 72
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 28,
        y: 32,
        w: 8,
        h: 4
      }, {
        x: 163,
        y: 499,
        w: 48,
        h: 48
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 22,
        y: 33,
        w: 2,
        h: 2
      }, {
        x: 371,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 33,
        w: 2,
        h: 2
      }, {
        x: 395,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 21,
        y: 33,
        w: 1,
        h: 2
      }, {
        x: 363,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 26,
        y: 33,
        w: 1,
        h: 2
      }, {
        x: 387,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 22,
        y: 32,
        w: 2,
        h: 1
      }, {
        x: 371,
        y: 451,
        w: 16,
        h: 8
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 22,
        y: 33,
        w: 2,
        h: 2
      }, {
        x: 444,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 33,
        w: 2,
        h: 2
      }, {
        x: 468,
        y: 459,
        w: 16,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 21,
        y: 33,
        w: 1,
        h: 2
      }, {
        x: 436,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 26,
        y: 33,
        w: 1,
        h: 2
      }, {
        x: 460,
        y: 459,
        w: 8,
        h: 16
      }, undefined, undefined, undefined);
  Generator.drawTextureLegacy("Skin", {
        x: 24,
        y: 32,
        w: 2,
        h: 1
      }, {
        x: 444,
        y: 451,
        w: 16,
        h: 8
      }, undefined, undefined, undefined);
  if (showFolds) {
    Generator.drawImage("Folds", [
          0,
          0
        ]);
  }
  if (showRedEyes) {
    return Generator.drawImage("Red Eyes", [
                373,
                344
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
exports.images = images;
exports.textures = textures;
exports.steve = steve;
exports.script = script;
exports.generator = generator;
/* thumbnail Not a pure module */