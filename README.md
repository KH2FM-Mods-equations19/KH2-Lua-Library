# KH2-Lua-Library

A library of Lua code that can be imported by Kingdom Hearts 2 Lua scripts.

## Library philosophy

One of the most apparent benefits to using a Lua Library for KH2 is that Lua scripts
correctly utilizing the library shouldn't have to be individually updated after the
game receives a patch.

For example, let's say we have memory addresses collected in the library for each game version
that is managed and updated by the community. After the game receives a patch, all the library
needs to do is update its collection of addresses and values. Once the library is updated,
all a user needs to do is get the updated library files and all Lua scripts should work again.

A well-organized/documented library also makes it easier for new developers to jump in and
make their own mods. Plus, all those mods would be immediately compatible with every version
of the game. You don't need to own every version of the game if the address/value you're
using is already in the library!

Including the library also won’t interfere with any mods that choose not to use it.

## Setup

The preferred method is to install this mod via OpenKH Mods Manager, which allows for easy
updating of the mod in the future. Enter `KH2FM-Mods-equations19/KH2-Lua-Library` into the
text box for `Add a new mod from GitHub` and then click `Install`.

If you do not use OpenKH Mods Manager, copy the entire `io_packages` folder into the
folder that contains your other Lua scripts.

## Developing mods with Lua Library

There are four different types of documentation in this project to help you develop your mods:

1. [Tutorials][tut-folder] provide in-depth guides on learning
how to develop mods using KH2 Lua Library.
2. [How-to guides][guide-folder] teach how to perform specific actions.
3. [Explanations][explain-folder] provide context to meta decisions about the project.
4. [Reference sheets][ref-folder] are technical descriptions of the classes,
tables, and modules in the project.

## Contributing

<!-- TODO: Add other ways to contribute, such as verification, documentation, etc. -->
Community participation is key to the success of a project such as this one.
If you have found memory addresses for KH2, please consider contributing them to the library.

## Acknowledgements

- TopazTK and Sirius902 for their work on [LuaBackend][1].
- Sonicshadowsilver2 and Num for addresses taken from the [Garden of Assemblage mod][2].
- Deathofall84, Denhonator, and contributors for addresses taken from [various scripts][3].

<!-- Reference links -->
[tut-folder]: /docs/tutorials/
[guide-folder]: /docs/how_to_guides/
[explain-folder]: /docs/explanations/
[ref-folder]: /docs/reference/
[1]: https://github.com/Sirius902/LuaBackend
[2]: https://github.com/KH2FM-Mods-Num/GoA-ROM-Edition
[3]: https://github.com/Denhonator/KHPCSpeedrunTools
