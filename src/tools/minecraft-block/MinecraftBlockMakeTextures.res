module Node = {
  @val
  external __dirname: string = "__dirname"
}

module Fs = {
  module Stats = {
    type t
    @send external isDirectory: t => bool = "isDirectory"
  }

  type file
  @module("fs") external readdirSync: string => array<string> = "readdirSync"
  @module("fs") external writeFileSync: (string, string) => unit = "writeFileSync"
  @module("fs") external readFileSync: string => file = "readFileSync"
  @module("fs") external statSync: string => Stats.t = "statSync"

  type rmdirOptions = {recursive: bool}
  @module("fs") external rmdirSync: (string, rmdirOptions) => unit = "rmdirSync"
  @module("fs") external mkdirSync: string => unit = "mkdirSync"
}

module Path = {
  type parseResult = {base: string, ext: string, name: string}
  @module("path") external parse: string => parseResult = "parse"
  @module("path") external resolve: (string, string) => string = "resolve"
}

module ImageInfo = {
  type t = {
    @as("type") type_: string,
    format: [#PNG],
    mimeType: string,
    width: int,
    height: int,
  }
  @module external imageInfo: Fs.file => t = "imageinfo"
}

module MergeImg = {
  type instance
  type mergeOptions = {direction: [#vertical | #horizontal]}

  @module external merge: (array<string>, mergeOptions) => Promise.t<instance> = "merge-img"

  type writeCallback = Js.Nullable.t<exn> => unit
  @send external write: (instance, string, writeCallback) => unit = "write"
}

module ChildProcess = {
  type execCallback = (. Js.Nullable.t<exn>, Js.Nullable.t<string>, Js.Nullable.t<string>) => unit
  @module("child_process")
  external exec: (string, execCallback) => unit = "exec"
}

type imageWithInfo = {
  path: string,
  info: ImageInfo.t,
}

let toImageWithInfo = (path: string): option<imageWithInfo> => {
  let isPNG = path->Js.String2.endsWith(".png")
  if isPNG {
    let file = Fs.readFileSync(path)
    let info = ImageInfo.imageInfo(file)
    if info.format === #PNG && info.width === 16 && mod(info.height, 16) === 0 {
      Some({path, info})
    } else {
      None
    }
  } else {
    None
  }
}

let toValidImage = (acc: array<imageWithInfo>, image: option<imageWithInfo>) => {
  switch image {
  | None => acc
  | Some(image) => Js.Array2.concat(acc, [image])
  }
}

let isDirectory = (path: string): bool => {
  let stats = Fs.statSync(path)
  Fs.Stats.isDirectory(stats)
}

type texture = {
  id: string,
  filePath: string,
  frames: int,
  index: int,
}

type version = {id: string, textures: array<texture>}

let texturesOriginalDir = Path.resolve(Node.__dirname, "./block-textures-original")
let texturesDir = Path.resolve(Node.__dirname, "../../generators/minecraft-block/block-textures")

let dataFile = Path.resolve(Node.__dirname, texturesDir ++ "/MinecraftBlock_TextureData.res")

let dirPaths =
  Fs.readdirSync(texturesOriginalDir)
  ->Js.Array2.map(dirName => (dirName, texturesOriginalDir ++ "/" ++ dirName))
  ->Js.Array2.filter(((_, dirPath)) => isDirectory(dirPath))

let makeVersions = () => {
  dirPaths->Js.Array2.map(((dirName, dirPath)) => {
    let fileNames = Fs.readdirSync(dirPath)
    let textures =
      fileNames
      ->Js.Array2.map(fileName => dirPath ++ "/" ++ fileName)
      ->Js.Array2.map(toImageWithInfo)
      ->Js.Array2.reduce(toValidImage, [])
      ->Js.Array2.reduce((acc, image) => {
        let result = Path.parse(image.path)
        let textureCount = Js.Array2.length(acc)
        let lastTexture = textureCount > 0 ? acc[textureCount - 1] : None
        let index = switch lastTexture {
        | None => 0
        | Some(lastTexture) => lastTexture.index + lastTexture.frames * 16
        }
        let texture = {
          id: result.name,
          filePath: dirPath ++ "/" ++ result.base,
          frames: image.info.height / 16,
          index,
        }
        Js.Array2.concat(acc, [texture])
      }, [])
    let version = {
      id: dirName,
      textures,
    }
    version
  })
}

// let cleanOutput = () => {
//   Fs.rmdirSync(texturesDir, {recursive: true})
//   Fs.mkdirSync(texturesDir)
// }

let makeMergedTextureImages = (versions: array<version>) => {
  versions
  ->Js.Array2.map(({id, textures}) => {
    let outPath = texturesDir ++ "/" ++ id ++ ".png"
    let filePaths = textures->Js.Array2.map(({filePath}) => filePath)
    MergeImg.merge(filePaths, {direction: #vertical})->Promise.thenResolve(result => {
      Promise.make(
        (resolve, reject) => {
          result->MergeImg.write(
            outPath,
            error => {
              switch Js.Nullable.toOption(error) {
              | None => resolve(. ignore())
              | Some(exn) => reject(. exn)
              }
            },
          )
        },
      )
    })
  })
  ->Promise.all
  ->Promise.thenResolve(_ => ())
}

external toJson: 'a => Js.Json.t = "%identity"

// let makeDataFile = (versions: array<version>) => {
//   let versionsData = versions->Js.Array2.map(({id, textures}) => {
//     let textures =
//       textures->Js.Array2.map(({id, frames, index}) => {"id": id, "frames": frames, "index": index})
//     {"id": id, "textures": textures}
//   })

//   let texturesData =
//     versionsData
//     ->Js.Array2.map(versionData => {
//       let standardWidth = 16
//       let standardHeight = versionData["textures"]->Js.Array2.reduce((acc, texture) => {
//         acc + texture["frames"] * 16
//       }, 0)
//       {
//         "id": versionData["id"],
//         "url": versionData["id"] ++ ".png",
//         "standardWidth": standardWidth,
//         "standardHeight": standardHeight,
//       }
//     })
//     ->Js.Array2.map(textureData => {
//       `
//     {
//       id: "${textureData["id"]}",
//       url: Generator.requireImage("./${textureData["url"]}"),
//       standardWidth: ${textureData["standardWidth"]->Js.Int.toString},
//       standardHeight: ${textureData["standardHeight"]->Js.Int.toString},
//     }
//     `
//     })
//     ->Js.Array2.joinWith(",")

//   let texturesCode = `
//     let textures: array<Generator.textureDef> = [
//       ${texturesData}
//     ]
//   `

//   let code = `
//     // This is a generated file

//     ${texturesCode}

//     let versions = ${versionsData->toJson->Js.Json.stringify}
//   `
//   Fs.writeFileSync(dataFile, code)
//   Promise.make((resolve, reject) => {
//     ChildProcess.exec("npx rescript format " ++ dataFile, (. exn, stdout, stderr) => {
//       switch Js.Nullable.toOption(exn) {
//       | Some(exn) => reject(. exn)
//       | None => {
//           switch Js.Nullable.toOption(stdout) {
//           | Some(stdout) => Js.log(stdout)
//           | None => ()
//           }
//           switch Js.Nullable.toOption(stderr) {
//           | Some(stderr) => Js.log(stderr)
//           | None => ()
//           }
//           resolve(. ignore())
//         }
//       }
//     })
//     resolve(. ignore())
//   })
// }

let makeVersionFileName = (version: version) => {
  version.id->Js.String2.replaceByRe(%re(`/[-\.]/g`), "_")
}

let makeDataFile = (version: version) => {
  let {id, textures} = version
  let textures =
    textures->Js.Array2.map(({id, frames, index}) => {"id": id, "frames": frames, "index": index})
  let versionData = {"id": id, "textures": textures}

  let standardWidth = 16
  let standardHeight = versionData["textures"]->Js.Array2.reduce((acc, texture) => {
    acc + texture["frames"] * 16
  }, 0)

  let textureData = {
    "id": versionData["id"],
    "url": versionData["id"] ++ ".png",
    "standardWidth": standardWidth,
    "standardHeight": standardHeight,
  }

  let textureData = `
    {
      id: "${textureData["id"]}",
      url: Generator.requireImage("./${textureData["url"]}"),
      standardWidth: ${textureData["standardWidth"]->Js.Int.toString},
      standardHeight: ${textureData["standardHeight"]->Js.Int.toString},
    }
  `

  let code = `
    // This is a generated file

    let texture: Generator.textureDef = ${textureData}

    let version = ${versionData->toJson->Js.Json.stringify}

    let data = (texture, version)
  `

  let versionFileName = makeVersionFileName(version)
  Js.log(makeVersionFileName(version))
  let fileName = `MinecraftBlock_Texture_${versionFileName}.res`

  let dataFile = Path.resolve(Node.__dirname, texturesDir ++ `/${fileName}`)

  Fs.writeFileSync(dataFile, code)
  Promise.make((resolve, reject) => {
    ChildProcess.exec("npx rescript format " ++ dataFile, (. exn, stdout, stderr) => {
      switch Js.Nullable.toOption(exn) {
      | Some(exn) => reject(. exn)
      | None => {
          switch Js.Nullable.toOption(stdout) {
          | Some(stdout) => Js.log(stdout)
          | None => ()
          }
          switch Js.Nullable.toOption(stderr) {
          | Some(stderr) => Js.log(stderr)
          | None => ()
          }
          resolve(. ignore())
        }
      }
    })
    resolve(. ignore())
  })
}

let makeDataFiles = (versions: array<version>) => {
  versions->Belt.Array.map(makeDataFile)->Promise.all->Promise.then(_ => Promise.resolve())
}

// We're currently not keeping the original files,
// so don't delete the generated output
// cleanOutput()

let versions = makeVersions()

makeMergedTextureImages(versions)
->Promise.then(_ => makeDataFiles(versions))
->Promise.catch(exn => {
  Js.log(exn)
  Promise.resolve()
})
->ignore
