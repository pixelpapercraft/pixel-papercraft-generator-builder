let checkSourceDirectory = sourceDirectory => {
  switch Fs.existsSync(sourceDirectory) {
  | false => Error("Source directory not found")
  | true => Ok(sourceDirectory)
  }
}

let makeTextures = (id, sourceDirectory, outputDirectory) => {
  let outputPrefix = "Texture"
  MakeTexturesUtil.makeTiledImages(~id, ~sourceDirectory, ~outputDirectory, ~outputPrefix)
  ->Promise.catch(error => {
    Js.log(error)
    Promise.resolve()
  })
  ->ignore
}

let showHelp = () => {
  Js.log("Usage: npm run make-textures <textureId> <sourceDir>")
}

let argv = Node.Process.argv
let textureId = Belt.Array.get(argv, 2)
let sourceDirectory = Belt.Array.get(argv, 3)
let outputDirectory = Path.resolve(Node2.__dirname, "../../../src/textures")

switch (textureId, sourceDirectory) {
| (Some(textureId), Some(sourceDirectory)) =>
  switch checkSourceDirectory(sourceDirectory) {
  | Error(reason) => Js.log(reason)
  | Ok(sourceDir) => makeTextures(textureId, sourceDir, outputDirectory)
  }
| _ => showHelp()
}
