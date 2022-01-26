external fileAsString: Fs.file => string = "%identity"
external toJson: 'a => Js.Json.t = "%identity"

let getDirectories = dirPath => {
  Fs.readdirSync(dirPath)
  ->Js.Array2.map(dirName => (dirName, dirPath ++ "/" ++ dirName))
  ->Js.Array2.filter(((_, dirPath)) => Generator_TextureMaker.isDirectory(dirPath))
}

let texturesOriginalDir = Path.resolve(Node2.__dirname, "./item-textures-original")
let texturesDir = Path.resolve(Node2.__dirname, "../../generators/minecraft-item/item-textures")

let dirPaths = getDirectories(texturesOriginalDir)

Belt.Array.forEach(dirPaths, ((dirName, dirPath)) => {
  let id = dirName
  let sourceDirectory = dirPath
  let outputDirectory = texturesDir
  let outputPrefix = "MinecraftItem_Texture"
  Generator_TextureMaker.makeTiledImages(~id, ~sourceDirectory, ~outputDirectory, ~outputPrefix)
  ->Promise.catch(error => {
    Js.log(error)
    Promise.resolve()
  })
  ->ignore
})
