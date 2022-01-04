# Minecraft Block Generator

- Created by lostminer
- NinjolasNJM - Added slab, stair, fence, door, trapdoor and snow
- 17 Jul 2021 denurls - Updated photo

## Creating the texture files

Minecraft asset files can be obtained from https://mcasset.cloud/

Recent versions of Minecraft block textures are in asset folder `assets\minecraft\textures\block`

Copy the directory containing the block textures into a the `textures-original` and rename it, such as

```
textures-original/minecraft-1.17.2
```

Then run the command:

```
npm run make-block-textures
```

This will generate files in the `textures` directory.

## Enabling the new textures in the Block Generator

Open the `MinecraftBlock_Textures.res` file.

Add the new texture data to the top of the file.

## Commit the changes

Commit the changes to the repo.

**IMPORTANT: Do not commit the original texture files to the repo, only commit the generated merged texture file**
