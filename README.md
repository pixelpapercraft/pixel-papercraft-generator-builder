# Pixel Papercraft Generator Builder

## Getting started

### First time setup

Install Node and Git.

Node is best installed using [Node Version Manager](https://github.com/nvm-sh/nvm).

The project currently requires the following Node and NPM versions:

```
"engines": {
  "node": ">=18",
  "npm": ">=9"
}
```

Install Node.

```sh
nvm install v18
```

To ensure you have the latest NPM:

```
npm i -g npm@latest
```

Install Git [from the official site](https://git-scm.com/downloads).

Clone this repository and install the dependencies:

```sh
cd <parent_folder_for_the_generator_builder>
git clone https://github.com/pixelpapercraft/pixel-papercraft-generator-builder generator-builder
cd generator-builder
npm install
```

### Set up ReScript and Visual Studio Code

Generators are developed using the [ReScript](https://rescript-lang.org/) programming language.

ReScript development is best done using [Visual Studio Code](https://code.visualstudio.com/).

After installing VSCode, then install the official ReScript extension `rescript-vscode` from the VSCode Extensions panel.

### Development

Ensure you are running the correct version of Node:

```
nvm use
```

In one terminal, start the ReScript compiler:

```
npm run res:watch
```

In another terminal, start the web server:

```
npm run dev
```

Then open your browser:

```
http://localhost:3000
```

## Example Generator

This is a quick example of what a simple generator script might look like.

This will be explained further in the sections below.

```res
// Unique id for the generator
let id = "face-generator"

// Name for the generator
let name = "Face Generator"

// Array of image URLs the generator may use
let images: array<Generator.imageDef> = [
  {
    id: "Background",
    url: Generator.require("./images/Background.png"),
  }
]

// Array of texture URLs the generator may use
let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: Generator.require("./textures/Skin.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]

// The generator script
let script = () => {
  Generator.drawImage("Background", (0, 0))

  let ox = 74
  let oy = 25
  Generator.drawTexture(
    "Skin",
    (16, 8, 8, 8),
    (ox + 128, oy + 64, 64, 64),
    ()
  )
}

// Export the generator details
let generator: Generator.generatorDef = {
  id: id,
  name: name,
  images: images,
  textures: textures,
  script: script,
}
```

## Developing generators

Code for generators is in the `src/generators` directory.

You can use any directory structure you like for each generator, but a recommended structure is:

```
/example
  /images
  /textures
  /Example.res
```

Each generator should export a property named `generator` that has the type `Generator.generatorDef`. For example:

```res
let generator: Generator.generatorDef = {
  id: id,
  name: name,
  history: history,
  thumbnail: Some(thumbnail),
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
```

These properties are:

| Property     | Description                                      |
| ------------ | ------------------------------------------------ |
| id           | Unique Id for the generator, used in the URL     |
| name         | Name for the generator                           |
| images       | Array of image URLs                              |
| textures     | Array of texture image URLs                      |
| script       | Generator script                                 |
| history      | Array of strings, used as the history of updates |
| thumbnail    | Thumbnail image                                  |
| video        | Video (optional)                                 |
| instructions | Instructions for the generator                   |

Lastly, add the generator to the `src/generators/Generators.res` file.

```res
let generators = [
  Example.generator,
]
```

## Contributing

To contribute to the project, you will need to do a few steps:

1. Create a "fork" of the generator project into your account.
2. Create a "branch" for a particular change you want to make.
3. Create a "pull request" to request for your branch to be added to the main generator project.

[Read more about proposing changes on Github](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests).

If you need help, ask in the #generator-help channel on Discord.

**Tip:** It's best to keep your branches and pull requests small. For example, create a separate branch and pull request for each generator. This helps to get the changes merged into the main project more quickly.

## Images vs Textures

**Images** are just simple images that can be drawn onto the pages. You cannot draw parts of images, you can only draw the whole image. This makes them very fast to draw. You will typically use images for things like backgrounds and folds.

**Textures** are used when you want to draw parts of an image onto the page and those parts may be scaled, flipped or rotated, etc. Textures are slow to draw because of the image processing needed.

## Generator Programming Guide

### Loading images

Images needed by the generator are specified as an array of `Generator.imageDef`.

Note that the `url` property of the images must be created with `Generator.require()`.

```res
let images: array<Generator.imageDef> = [
  {
    id: "Background",
    url: Generator.require("./images/Background.png"),
  },
  {
    id: "Folds",
    url: Generator.require("./images/Folds.png"),
  },
]
```

### Loading textures

Textures needed by the generator are specified as an array of `Generator.textureDef`.

Note that the `url` property of the textures must be created with `Generator.require()`.

Also note that textures must specify a `standardWidth` and `standardHeight`. This allows higher resolution versions of those textures to also work.

```res
let textures: array<Generator.textureDef> = [
  {
    id: "Skin",
    url: Generator.require("./textures/Skin.png"),
    standardWidth: 64,
    standardHeight: 64,
  },
]
```

### Writing the script

The script should be specified as the `script` property of the generator.

```res
let script = () => {
  Generator.drawImage("Background", (0, 0))
}
```

### Defining Inputs for Textures

Use the `defineTextureInput` function.

You must also specify some options:

- `standardWidth` and `standardHeight` - the default width and height of the texture. These are required so that higher resolution textures will work.
- `choices` - an array of texture names that may be selected instead of selecting a texture file. Specify an empty array `[]` if none required.

```res
Generator.defineTextureInput(
  "Skin",
  {
    standardWidth: 64,
    standardHeight: 64,
    choices: ["Steve", "Alex"]
  }
)
```

### Drawing images

Use the `Generator.drawImage()` function.

To draw an image at position `x` = `0` and `y` = `0`:

```res
Generator.drawImage("Background", (0, 0))
```

To draw an image at position `x` = `50` and `y` = `100`:

```res
Generator.drawImage("Background", (50, 100))
```

### Drawing textures

Drawing a texture means that you want to copy a rectangle from the texture onto the page.

To do this, you need to:

1. Identify the x, y coordinates plus width and height of a rectangle on the texture to copy
2. Identify the x, y coordinates plus width and height of a rectangle on the page to draw it into

For example, suppose we want to copy the face from the following texture onto the page.

![Texture with part of the image highlighted](./static/draw-texture-skin.png)

This is a rectangle (a square in this case) with the following coordinates and size:

```
x = 8
y = 8
width = 8
height = 8
```

In ReScript we will write these coordinates as:

```res
(8, 8, 8, 8)
```

Next, we need to identify the rectange on the page.

![Page with part of the image highlighted](./static/draw-texture-page.png)

It needs to draw onto the page as a bigger rectangle with the following coordinates and size:

```
x = 138
y = 89
width = 64
height = 64
```

In ReScript we write this as:

```res
(138, 89, 64, 64)
```

Also suppose the name of the texture is `Skin`, then to draw this texture onto the page we would write:

```res
Generator.drawTexture(
  "Skin",
  (8, 8, 8, 8),
  (138, 89, 64, 64),
  (),
);
```

### Rotating textures

When using `Generator.drawTexture()` you can rotate textures using the `~rotate` argument.

The `~rotate` argument can be any `float` value.

```res
Generator.drawTexture(
  "Skin",
  (8, 8, 8, 8),
  (138, 89, 64, 64),
  ~rotate=90.0,
  (),
);
```

### Flipping textures

When using `Generator.drawTexture()` you can flip textures using the `~flip` argument.

The `~flip` argument can be either `~flip=#Horizontal` or `~flip=#Vertical`.

```res
Generator.drawTexture(
  "Skin",
  (8, 8, 8, 8),
  (138, 89, 64, 64),
  ~flip=#Vertical,
  (),
);
```

### Pixelating textures

When drawing textures and the destination shape is different to the source shape it can cause the texture to sometimes appear squashed, which makes the texture look messy. In these cases you can apply a `pixelate` option to keep the result looking pixelated.

```res
Generator.drawTexture(
  "Skin",
  (8, 8, 8, 8), // Square shape
  (150, 150, 64, 256), // Rectangle shape
  ~pixelate=true,
  (),
);
```

### Blending colors

When using `Generator.drawTexture()` you can blend textures with a color using the `~blend` argument.

This is useful when adding a tint to certain blocks in Minecraft corresponding to a biome.

The `~blend` argument can be either:

- `#None` meaning no blend.
- `#MultiplyHex(string)` for a hex string, such as `#MultiplyHex("#90814D")`.
- `#MultiplyRGB(int, int, int)` for red, green and blue values from 0 to 255, such as `#MultiplyRGB(144, 129, 77)`.

```res
Generator.drawTexture(
  "Skin",
  (8, 8, 8, 8),
  (138, 89, 64, 64),
  ~blend=#MultiplyHex("#90814D"),
  (),
);
```

### Using multiple pages

By default the generator gives you one blank page to work with, however some designs may require more than one page.

To specify additional pages you can use the `Generator.usePage()` function. You just have to choose a name for each page, which can be any name you like.

```res
// Choose the first page
Generator.usePage("Head and Body");

// Draw images and textures here

// Choose the next page
Generator.usePage("Legs");

// Draw images and textures here
```

If each page doesn't have a specific purpose, just call them "Page 1", "Page 2", etc.

```res
// Choose the first page
Generator.usePage("Page 1");

// Draw images and textures here

// Then choose the next page
Generator.usePage("Page 2");

// Draw images and textures here
```

### Getting user input

It's sometimes useful to give your user some choices in your generator.

For example, some people want the fold lines, and others don't, or your generator might have list of weapons they can choose from.

#### Boolean inputs

Boolean inputs provide a `true` or `false` choice. They may be used to show or hide certain parts of your generator.

Use `Generator.defineBooleanInput()` to create boolean inputs.

```res
Generator.defineBooleanInput("Show Folds", true) // Initially true
Generator.defineBooleanInput("Show Labels", true) // Initially true
```

To use these values use `Generator.getBooleanInputValue()`

```res
let showFolds = Generator.getBooleanInputValue("Show Folds");
let showLabels = Generator.getBooleanInputValue("Show Labels");

if (showFolds) {
  Generator.drawImage("Folds", (0, 0));
}

if (showLabels) {
  Generator.drawImage("Labels", (0, 0));
}
```

#### Select inputs

Select variables let your user choose from a list of values that you provide.

Use `Generator.defineSelectInput()` to create select inputs.

```res
Generator.defineSelectInput("Weapon", ["None", "Sword", "Crossbow"])
```

To use these values use `Generator.getSelectInputValue()`

```res
let weapon = Generator.getSelectInputValue("Weapon");

if weapon === "Sword" {
  Generator.drawImage("Sword", (100, 100))
} else if weapon === "Crossbow" {
  Generator.drawImage("Crossbow", (100, 100))
}
```

Or an alternative syntax:

```res
let weapon = Generator.getSelectInputValue("Weapon");

switch weapon {
  | "Sword" => Generator.drawImage("Sword", (100, 100))
  | "Crossbow" => Generator.drawImage("Crossbow", (100, 100))
  | _ => () // All other values, do nothing
}
```

### Defining clickable regions

You can define clickable regions on your pages, and what actions should occur when a region is clicked.

Clickable regions are defined using the `Generator.defineRegionInput(region, onClick)` function.

For example, you could toggle a variable using a clickable region.

```res
// Define the input
Generator.defineBooleanInput("Show overlay", false)

// Get the input value
let showOverlay = Generator.getBooleanInputValue("Show overlay")

let region = (0, 0, 100, 100)
let onClick = () => {
  // Toggle the input value
  Generator.setBooleanInputValue("Show overlay", !showOverlay)
}

// Define the clickable region
Generator.defineRegionInput(region, onClick)
```

But this could be written more concisely as:

```res
Generator.defineBooleanInput("Show overlay", false)
let showOverlay = Generator.getBooleanInputValue("Show overlay")

Generator.defineRegionInput((0, 0, 100, 100), () => {
  Generator.setBooleanInputValue("Show overlay", !showOverlay)
})
```

### Providing instructions or comments

You can provide some text instructions and comments with your inputs using `Generator.defineText()`.

```res
Generator.defineText("Click body parts to change the texture.")
```

### Filling the background color

By default, the generator uses a transparent background. You can fill the background with `Generator.fillBackgroundColor()`.

```res
// Fill the background color with red
Generator.fillBackgroundColor("#ff0000")

// Fill the background color with white
Generator.fillBackgroundColorWithWhite()
```

Note: This does not overwrite any images of textures you've drawn. It just changes the background from transparent to the color you specify.

### Drawing lines

You can draw straight lines onto the generator canvas. The line color, width, dash pattern, and dash offset can all be customized, but the defaults will make a line that works well for standard tab lines.

```res
// Draw a simple black line starting at (0, 100) and ends at (50, 150)
Generator.drawLine((0, 100), (50, 150), ())

// Draw the same line, but red and with a 4 pixel width
Generator.drawLine((0, 100), (50, 150), ~color="#ff0000", ~width=4, ())
```

### Drawing fold lines

You can also draw standard fold lines with a simpler function:

```res
Generator.drawFoldLine((0, 100), (50, 150))
```

### Getting pixel colors

There are a few functions to get specific pixel colors:

- `Generator.getTexturePixelColor(textureName, x, y)`
- `Generator.getImagePixelColor(imageName, x, y)`
- `Generator.getCurrentPagePixelColor(x, y)`
- `Generator.getPagePixelColor(pageName, x, y)`

For example, using `Generator.getTexturePixelColor()`:

If you have a texture named `Colors` and you want to get the pixel color at position `(0, 0)` then you would call:

```res
let color = Generator.getTexturePixelColor("Colors", 0, 0)
```

This returns a [ReScript Option](https://rescript-lang.org/docs/manual/latest/api/belt/option) which may contain a tuple `(red, green, blue, alpha)`.

Each value of `red`, `green`, `blue` and `alpha` are integers from 0 to 255.

More complete example:

```res
let colorOpt = Generator.getTexturePixelColor("Colors", 0, 0)
let color = switch colorOpt {
| None => "Unknown"
| Some(color) => {
    let (r, g, b, a) = color
    let r = Belt.Int.toString(r)
    let g = Belt.Int.toString(g)
    let b = Belt.Int.toString(b)
    let a = Belt.Int.toString(a)
    `(${r}, ${g}, ${b}, ${a})`
  }
}
```
