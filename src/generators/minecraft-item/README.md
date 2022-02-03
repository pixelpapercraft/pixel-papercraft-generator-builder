# Minecraft Item Generator

## Creating the texture files

Follow the directions to create texture files in `tools/make-textures/README.md`.

## Enabling the new textures in the Item Generator

Open the `MinecraftItem_TextureVersions.res` file.

Add the new texture data to the top of the file.

Specify:

1. The texture data, and
2. The size of the texture tiles

```res
let definitions = [
  (Texture_minecraft_1_7_10.data, 16),
  (Texture_minecraft_1_13_2.data, 16),
  (Texture_minecraft_1_18_1.data, 16),
]
```

## Commit the changes

Commit the changes to the repo.
