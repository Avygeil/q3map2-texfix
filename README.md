# q3map2-texfix

q3map2 2.5.17 fork which decompiles texture coordinates (patch ported from NetRadiant)

Most textures are now aligned properly after decompiling, except for some surfaces (especially if they have weird orientation/primitives). This still results in mostly accurate `.map`, which saves a lot of time since only a few surfaces have to be adjusted by hand.

The original q3map2 project files were cleaned up and remade as a Premake build script, which can be built independently without Radiant.

## Download

See the Releases tab in Github.

## Usage

In order to scale textures properly, some shader information has to be read from a "VFS" (Virtual File System). The VFS is set with the `-fs_basepath "path/to/vfs"` parameter.

You must set this parameter to a folder that contains shaders and shaderlist. You should be able to use the same folder as you use with Radiant. If you want to make a separate, clean base folder for decompiling, just start Radiant in a new folder that contains assets and it will automatically generate the files for you.

**The VFS parameter must be set to the folder that contains the base folder with shaders, not the base folder itself (contrary to what the name implies)!**

```shell
$ q3map2 -game ja -fs_basepath "path/to/vfs" -convert -format map "path/to/bsp"
```

## Compiling

Download dependencies and create project files in command prompt:

```shell
$ premake5 setup
$ premake5 vs2017
```

This creates project files for Visual Studio 2017. Type `premake5 --help` for a list of generators to use in place of `vs2017`.
