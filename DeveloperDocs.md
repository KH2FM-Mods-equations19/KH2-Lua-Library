# Developer Docs

## Importing the Library

Start with one of the template files included in this repository, or add these lines to your Lua script at the beginning
of your `_OnInit` function:

```lua
kh2libstatus, kh2lib = pcall(require, "kh2lib")

if not kh2libstatus then
    print("ERROR (My Script): KH2-Lua-Library mod is not installed")
    CanExecute = false
    return
end

RequireKH2LibraryVersion(1)
```

and, optionally:

```lua
RequirePCGameVersion()
```

The first line imports the KH2 Lua Library into your script, detects which game version is running, and assigns a table
of values to the name `kh2lib`. You can use an alternate name besides `kh2lib`, but `kh2lib` is recommended for
consistency between scripts using the library.

The next section prints out as meaningful of an error as possible for when the Lua Library is not found.

The next line informs the library that your script expects a KH2 Lua Library version of at least 1, since it depends
on values added in version 1. As newer versions of the library are released, scripts may declare that they require a
newer version of the library.

The final (optional) line informs the library that your script is only written for the PC ports of KH2 and should not be
allowed to execute when, say, on an emulator version of KH2.

If the library determines that your script should be allowed to execute based on all of the above criteria, the value of
`kh2lib.CanExecute` will be `true`. Scripts can check this value within their `_OnFrame` function or elsewhere and
should not run any other code if the value is `false`.

```lua
function _OnInit()
    kh2libstatus, kh2lib = pcall(require, "kh2lib")
    ...

    CanExecute = kh2lib.CanExecute
    if not CanExecute then
        return
    end
    
    -- (your code here)
end

function _OnFrame()
    if not CanExecute then
        return
    end

    -- (your code here)
end
```

There is an additional `DenyGameVersions` function that can be used to explicitly declare that your script is not
compatible with specific game versions. This is hopefully rare, but could happen, for instance, if a newer script is
written, and if it's not feasible to go back and find memory addresses for the older game versions.

For example, to prevent your script from running on 1.0.0.9 PC game versions:

```lua
function _OnInit()
    kh2libstatus, kh2lib = pcall(require, "kh2lib")
    ...
    DenyGameVersions(KH2_VERSION_EPIC_1_0_0_9, KH2_VERSION_STEAM_GLOBAL_1_0_0_9, KH2_VERSION_STEAM_JP_1_0_0_9)

    CanExecute = kh2lib.CanExecute
    ...
```

## Special Library Values

The library provides several special values in the `kh2lib` table that can be used by scripts:

- `kh2lib.CanExecute`
  - whether the script should be allowed to execute based on detected game version and required library version
- `kh2lib.GameVersion`
  - the version of the game that was detected upon importing the library
  - `KH2_VERSION_UNKNOWN`
  - `KH2_VERSION_EMULATOR`
  - `KH2_VERSION_EPIC_1_0_0_9`
  - `KH2_VERSION_STEAM_GLOBAL_1_0_0_9`
  - `KH2_VERSION_STEAM_JP_1_0_0_9`
  - `KH2_VERSION_EPIC_1_0_0_10`
  - `KH2_VERSION_STEAM_1_0_0_10`
- `kh2lib.OnPC`
  - whether the detected game version is one of the PC ports (effectively just a shortcut for checking that the game
    version is one of the known PC ports)

## Version-Specific Values

The library provides (in the `kh2lib` table) many game version-specific memory addresses and other values.

- See the `VersionTemplate.lua` file to see which values are provided, along with some documentation on each value
  where possible.

## Library Functions

The library provides some other common functions that can be used by scripts. These functions can be called directly
(they're not part of the `kh2lib` table at this time).

- `BitOr`
  - Performs a bitwise `OR` of the value at a specified address using a specified mask and writes the updated byte.
    This is usually used to set one or more bits in a byte to `1`.
- `BitNot`
  - Performs a bitwise `AND NOT` of the value at a specified address using a specified mask and writes the updated byte.
    This is usually used to set one or more bits in a byte to `0`.
- `ReadPointer`
  - Reads and returns a pointer value at a specified address, using the proper size per platform.
- `Log`
  - Logs a message to the console, using an appropriate print call per platform.
  - There are `LogMessage`, `LogSuccess`, `LogWarning`, and `LogError` variants that can use color to draw extra
    attention to the message.
