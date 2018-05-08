# q3map2-texfix

q3map2 2.5.17 fork which decompiles texture coordinates (patch ported from NetRadiant)

Most textures are now aligned properly after decompiling, except for some surfaces (especially if they have weird orientation/primitives). This still results in mostly accurate `.map`, which saves a lot of time since only a few surfaces have to be adjusted by hand.

The original q3map2 project files were cleaned up and remade as a Premake build script, which can be built independently without Radiant.

## Download

See the Releases tab in Github.

## Usage

Since some shader information has to be read, make sure you use a VFS with shaders and shaderlist as the `-fs_basepath` parameter. Running Radiant in a new folder that contains your assets should generate the necessary files.

Other than that, the command is the same. Example for Jedi Academy:

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
