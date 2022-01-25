type imageWithInfo = {
  name: string,
  path: string,
  info: ImageInfo.t,
}

type imageWithCoordinates = {
  image: imageWithInfo,
  coordinates: (int, int),
}

type tileInfo = {
  name: string,
  x: int,
  y: int,
  width: int,
  height: int,
}

external asJson: 'a => Js.Json.t = "%identity"

let makeError: string => exn = %raw(`(reason) => new Error(reason)`)

let makeSafeFileName = (prefix: string, version: string) => {
  prefix ++ "_" ++ version->Js.String2.replaceByRe(%re(`/[-\.]/g`), "_")
}

let hasImageExtension = (path: string) => {
  path->Js.String2.endsWith(".png")
}

let toImageWithInfo = (path: string): imageWithInfo => {
  let {name} = Path.parse(path)
  let file = Fs.readFileSync(path)
  let info = ImageInfo.imageInfo(file)
  {name: name, path: path, info: info}
}

let isDirectory = (path: string): bool => {
  let stats = Fs.statSync(path)
  Fs.Stats.isDirectory(stats)
}

let isFile = (path: string): bool => {
  let stats = Fs.statSync(path)
  Fs.Stats.isFile(stats)
}

let isImageFile = (path: string) => {
  hasImageExtension(path) && isFile(path)
}

let readImagesInDirectory = (directoryPath: string) => {
  Fs.readdirSync(directoryPath)
  ->Js.Array2.map(fileName => directoryPath ++ "/" ++ fileName)
  ->Js.Array2.filter(filePath => isImageFile(filePath))
  ->Js.Array2.map(toImageWithInfo)
}

let sortImagesByHeight = (images: array<imageWithInfo>) => {
  images->Belt.SortArray.stableSortBy((image1, image2) => {
    image1.info.height - image2.info.height
  })
}

let calculateImagesWithCoordinates = (images: array<imageWithInfo>, canvasWidth: int) => {
  let imagesSorted = sortImagesByHeight(images)
  let nextx = ref(0)
  let nexty = ref(0)
  let rowHeight = ref(0)
  let canvasHeight = ref(0)

  let coordinates = Js.Dict.empty()

  imagesSorted->Belt.Array.forEach(sourceImage => {
    let {name, info} = sourceImage
    let {width, height} = info

    if width > canvasWidth {
      Js.log(
        `WARNING: ${name} has width ${Belt.Int.toString(
            width,
          )} greater than the canvas width ${Belt.Int.toString(canvasWidth)} and was not added`,
      )
    } else {
      let (x, y) = if nextx.contents + width > canvasWidth {
        let x = 0
        let y = nexty.contents + rowHeight.contents

        nextx.contents = x + width
        nexty.contents = y

        canvasHeight.contents = canvasHeight.contents + rowHeight.contents
        rowHeight.contents = height

        (x, y)
      } else {
        let x = nextx.contents
        let y = nexty.contents

        nextx.contents = x + width

        if height > rowHeight.contents {
          rowHeight.contents = height
        }

        (x, y)
      }

      Js.Dict.set(coordinates, name, (x, y, width, height))
    }
  })

  canvasHeight.contents = canvasHeight.contents + rowHeight.contents

  let imagesWithCoordinates = images->Belt.Array.reduce([], (acc, image) => {
    switch Js.Dict.get(coordinates, image.name) {
    | None => acc
    | Some((x, y, _, _)) => {
        let imageWithCoordinates = {
          image: image,
          coordinates: (x, y),
        }
        Belt.Array.concat(acc, [imageWithCoordinates])
      }
    }
  })

  (imagesWithCoordinates, canvasWidth, canvasHeight.contents)
}

let makeCanvas = (width: int, height: int) => {
  Promise.make((resolve, reject) => {
    Jimp.make(width, height, (error, canvas) => {
      let error = Js.Nullable.toOption(error)
      let canvas = Js.Nullable.toOption(canvas)
      switch (error, canvas) {
      | (None, None) => reject(. makeError("An error occurred creating the canvas"))
      | (Some(error), _) => reject(. error)
      | (_, Some(canvas)) => resolve(. canvas)
      }
    })
  })
}

let makeTiledImagesCanvas = (images: array<imageWithInfo>, canvasWidth: int) => {
  let (imagesWithCoordinates, canvasWidth, canvasHeight) = calculateImagesWithCoordinates(
    images,
    canvasWidth,
  )
  makeCanvas(canvasWidth, canvasHeight)
  ->Promise.then(canvas => {
    imagesWithCoordinates->Belt.Array.reduce(Promise.resolve(canvas), (
      acc,
      imageWithCoordinates,
    ) => {
      let {image, coordinates} = imageWithCoordinates
      let (x, y) = coordinates
      Jimp.read(image.path)->Promise.then(image => {
        acc->Promise.then(canvas => {
          let newCanvas = Jimp.blit(canvas, image, x, y)
          Promise.resolve(newCanvas)
        })
      })
    })
  })
  ->Promise.then(canvas => {
    Promise.resolve((imagesWithCoordinates, canvas, canvasWidth, canvasHeight))
  })
}

let writeTileImage = (~canvas: Jimp.t, ~tileImagePath: string) => {
  Jimp.writeAsync(canvas, tileImagePath)
}

let writeTileJson = (
  ~imagesWithCoordinates: array<imageWithCoordinates>,
  ~tileJsonPath: string,
) => {
  let tileInfos = Belt.Array.map(imagesWithCoordinates, imagesWithCoordinates => {
    let {image, coordinates} = imagesWithCoordinates
    let {name, info} = image
    let {width, height} = info
    let (x, y) = coordinates
    {name: name, x: x, y: y, width: width, height: height}
  })
  let json = Js.Json.stringifyWithSpace(asJson(tileInfos), 2)
  Fs.writeFileSync(tileJsonPath, json)
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

let writeTileReScript = (
  ~id: string,
  ~tileImagePath: string,
  ~tileInfos: array<tileInfo>,
  ~canvasWidth: int,
  ~canvasHeight: int,
  ~tileReScriptPath: string,
) => {
  let {base} = Path.parse(tileImagePath)
  let code = `
    // This is a generated file

    let texture: Generator.textureDef = {
      id: "${id}",
      url: Generator.requireImage("./${base}"),
      standardWidth: ${Belt.Int.toString(canvasWidth)},
      standardHeight: ${Belt.Int.toString(canvasHeight)},
    }

    let tiles = ${tileInfos->asJson->Js.Json.stringify}

    let data = (texture, tiles)
  `
  Fs.writeFileSync(tileReScriptPath, code)
  formatReScriptFile(tileReScriptPath)
}

let makeTiledImages = (
  ~id: string,
  ~sourceDirectory: string,
  ~outputDirectory: string,
  ~outputPrefix: string,
) => {
  let canvasWidth = 512

  let fileName = makeSafeFileName(outputPrefix, id)
  let basePath = outputDirectory ++ "/" ++ fileName
  let tileImagePath = basePath ++ ".png"
  let tileJsonPath = basePath ++ ".json"
  let tileReScriptPath = basePath ++ ".res"

  let images = readImagesInDirectory(sourceDirectory)

  makeTiledImagesCanvas(images, canvasWidth)->Promise.then(results => {
    let (imagesWithCoordinates, canvas, canvasWidth, canvasHeight) = results
    writeTileImage(~canvas, ~tileImagePath)->Promise.then(() => {
      writeTileJson(~imagesWithCoordinates, ~tileJsonPath)
      let tileInfos: array<tileInfo> = Belt.Array.map(
        imagesWithCoordinates,
        imageWithCoordinates => {
          let {image, coordinates} = imageWithCoordinates
          let (x, y) = coordinates
          let {name, info} = image
          let {width, height} = info
          {
            name: name,
            x: x,
            y: y,
            width: width,
            height: height,
          }
        },
      )
      writeTileReScript(
        ~id,
        ~tileImagePath,
        ~tileInfos,
        ~canvasWidth,
        ~canvasHeight,
        ~tileReScriptPath,
      )
    })
  })
}
