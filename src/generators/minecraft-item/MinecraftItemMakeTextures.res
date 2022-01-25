external fileAsString: Fs.file => string = "%identity"
external toJson: 'a => Js.Json.t = "%identity"

let getDirectories = dirPath => {
  Fs.readdirSync(dirPath)
  ->Js.Array2.map(dirName => (dirName, dirPath ++ "/" ++ dirName))
  ->Js.Array2.filter(((_, dirPath)) => Generator_Tiles.isDirectory(dirPath))
}

let texturesOriginalDir = Path.resolve(Node2.__dirname, "./textures-original")
let texturesDir = Path.resolve(Node2.__dirname, "./textures")

let dirPaths = getDirectories(texturesOriginalDir)

Belt.Array.forEach(dirPaths, ((dirName, dirPath)) => {
  let id = dirName
  let sourceDirectory = dirPath
  let outputDirectory = texturesDir
  let outputPrefix = "MinecraftItem_Texture"
  let canvasWidth = 512
  Generator_Tiles.makeTiledImages2(
    ~id,
    ~canvasWidth,
    ~sourceDirectory,
    ~outputDirectory,
    ~outputPrefix,
  )
  ->Promise.catch(error => {
    Js.log(error)
    Promise.resolve()
  })
  ->ignore
})
