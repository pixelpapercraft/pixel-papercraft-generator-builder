external fileAsString: Fs.file => string = "%identity"
external toJson: 'a => Js.Json.t = "%identity"

let getDirectories = dirPath => {
  Fs.readdirSync(dirPath)
  ->Js.Array2.map(dirName => (dirName, dirPath ++ "/" ++ dirName))
  ->Js.Array2.filter(((_, dirPath)) => Generator_Tiles.isDirectory(dirPath))
}

let makeTiledImages = (~sourceDirectory, ~tileDataOutputPath, ~tileImageOutputPath) => {
  let canvasWidth = 512
  Generator_Tiles.makeTiledImages(
    ~canvasWidth,
    ~sourceDirectory,
    ~tileDataOutputPath,
    ~tileImageOutputPath,
  )
}

let readTileData_UNSAFE = (path): array<Generator_Tiles.tileInfo> => {
  let json = Fs.readFileSync(path)
  Js.Json.deserializeUnsafe(fileAsString(json))
}

let printStdOutput = (stdout, stderr) => {
  switch Js.Nullable.toOption(stdout) {
  | Some(stdout) =>
    if Js.String2.length(stdout) > 0 {
      Js.log(stdout)
    }
  | None => ()
  }
  switch Js.Nullable.toOption(stderr) {
  | Some(stderr) =>
    if Js.String2.length(stderr) > 0 {
      Js.log(stderr)
    }
  | None => ()
  }
}

let formatReScriptFile = path => {
  Promise.make((resolve, reject) => {
    ChildProcess.exec("npx rescript format " ++ path, (. exn, stdout, stderr) => {
      switch Js.Nullable.toOption(exn) {
      | Some(exn) => reject(. exn)
      | None => {
          printStdOutput(stdout, stderr)
          resolve(. ignore())
        }
      }
    })
  })
}

let writeTileInfoReScriptFile = (
  id: string,
  fileName: string,
  tileInfos: array<Generator_Tiles.tileInfo>,
  canvasWidth: int,
  canvasHeight: int,
  path: string,
) => {
  let code = `
    // This is a generated file

    let texture: Generator.textureDef = {
      id: "${id}",
      url: Generator.requireImage("./${fileName}.png"),
      standardWidth: ${Belt.Int.toString(canvasWidth)},
      standardHeight: ${Belt.Int.toString(canvasHeight)},
    }

    let tiles = ${tileInfos->toJson->Js.Json.stringify}

    let data = (texture, tiles)
  `
  Fs.writeFileSync(path, code)
}

let texturesOriginalDir = Path.resolve(Node2.__dirname, "./textures-original")
let texturesDir = Path.resolve(Node2.__dirname, "./textures")

let dirPaths = getDirectories(texturesOriginalDir)

Belt.Array.forEach(dirPaths, ((dirName, dirPath)) => {
  let id = dirName
  let fileName = Generator_Tiles.makeSafeFileName("MinecratItem_Texture", id)
  let sourceDirectory = dirPath
  let tileImagePath = texturesDir ++ "/" ++ fileName ++ ".png"
  let tileJsonPath = texturesDir ++ "/" ++ fileName ++ ".json"
  let tileReScriptPath = texturesDir ++ "/" ++ fileName ++ ".res"
  makeTiledImages(
    ~sourceDirectory,
    ~tileDataOutputPath=tileJsonPath,
    ~tileImageOutputPath=tileImagePath,
  )
  ->Promise.then(((canvasWidth, canvasHeight)) => {
    let tileInfos = readTileData_UNSAFE(tileJsonPath)
    writeTileInfoReScriptFile(id, fileName, tileInfos, canvasWidth, canvasHeight, tileReScriptPath)
    formatReScriptFile(tileReScriptPath)
  })
  ->Promise.catch(error => {
    Js.log(error)
    Promise.resolve()
  })
  ->ignore
})
