# Minecraft Texture Maker

## Creating the texture files

Minecraft asset files can be obtained from https://mcasset.cloud/

Download the version you need and note the directory containing the assets you would like to make textures for.

For example, the Minecraft block textures are in the folder `assets\minecraft\textures\block` and item textures are in `assets\minecraft\textures\item`.

Next run the command:

```
npm run make-textures <TextureId> <SourceDirectory>
```

For example:

```
npm run make-textures minecraft-1.18.1-items ~/Downloads/InventivetalentDev-minecraft-assets-5a47090/assets/minecraft/textures/item
```

This will generate new files in the `src/textures` directory.
