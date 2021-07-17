#Images
This folder contains the sprite sheet files for backgrounds, folds, and labels.
The root folder contains the sprite sheets and the separated folder contain the images that were used to create the sprite sheets.
DO NOT try to edit the images from the sprite files. Instead follow the procedure below after modifying the specific image.

##To generate a sprite sheet and JSON
  - Go to [ZeroSprites.com](http://zerosprites.com/)
  - Drag all the images in one of the folders to the site
  - Set padding to 0 pixels and optimize to true
  - Press the Pack buton
  - Save the image that is generated
  - Copy the CSS and use [this converter I made](http://codepen.io/TepigMC/pen/MYXGew) to convert the CSS into JSON that the generator can use
  - Now you can use `Generator.drawSprite()` and `Generator.drawSpriteSized()`

###CSS Before:
```css
    .sprites { background: url(sprites.png) no-repeat; } <-- Remove this line
    .body { width: 312px; height: 304px; background-position: 0 0; }
    .boot { width: 152px; height: 104px; background-position: -160px -312px; }
    .head-advanced { width: 296px; height: 176px; background-position: -320px -200px; }
    ...
```

###JSON After:
```javascript
    var bgSprites = {
      body: { w:312, h:304, x:0, y:0 },
      boot: { w:152, h:104, x:176, y:408 },
      headAdvanced: { w:296, h:176, x:320, y:200 },
      ...
    };
```