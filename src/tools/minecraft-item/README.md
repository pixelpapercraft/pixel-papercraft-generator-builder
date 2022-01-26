# Minecraft Item Generator

## Creating the texture files

Minecraft asset files can be obtained from https://mcasset.cloud/

Recent versions of Minecraft block textures are in asset folder `assets\minecraft\textures\block`

Copy the directory containing the block textures into a the `item-textures-original` directory and rename it to a useful name, such as

```
item-textures-original/minecraft-1.18.1
```

Then run the command:

```
npm run make-item-textures
```

This will generate new files in the `generators/minecraft-item/item-textures` directory.

## Enabling the new textures in the Item Generator

Open the `MinecraftItem_TextureVersions.res` file.

Add the new texture data to the top of the file.

Specify:

1. The texture data, and
2. The size of the texture tiles

```res
let definitions = [
  (MinecraftItem_Texture_minecraft_1_7_10.data, 16),
  (MinecraftItem_Texture_minecraft_1_13_2.data, 16),
  (MinecraftItem_Texture_minecraft_1_18_1.data, 16),
]
```

## Commit the changes

Commit the changes to the repo.

**IMPORTANT: Do not commit the original texture files to the repo, only commit the generated merged texture file**

There is an entry in the `.gitignore` file to ignore the `item-textures-original` directory.
