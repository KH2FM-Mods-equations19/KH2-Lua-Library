# Using KH2 Lua Library (`kh2lib`) in your mod

Start with one of the [template files][templates] included in this repository,
or add these lines to the beginning of your Lua script:

```lua
local kh2lib_status, kh2lib, can_execute
local LIBRARY_VERSION = 1

function _OnInit()
    -- Define these variables as local variables at the top of your file
    kh2lib_status, kh2lib = pcall(require, 'kh2lib')

    if not kh2lib_status then
        ConsolePrint("KH2-Lua-Library mod is not installed", 3)
        can_execute = false
        return
    end

    RequireKH2LibraryVersion(LIBRARY_VERSION)
    -- Optional
    RequirePCGameVersion()
end
```

The first line imports the KH2 Lua Library into your script, detects which game version is running,
and assigns a table of values to the name `kh2lib`. You can use an alternate name besides `kh2lib`,
but `kh2lib` is recommended for consistency between scripts using the library.

The next section prints out a meaningful error when the Lua Library is not found.

The next line informs the library that your script expects a KH2 Lua Library version of at least 1,
since it depends on values added in version 1. As newer versions of the library are released,
scripts may declare that they require a newer version of the library.

The final (optional) line informs the library that your script is only written for the PC ports
of KH2 and should not be allowed to execute when, say, on an emulator version of KH2.

If the library determines that your script should be allowed to execute based on all
of the above criteria, the value of `kh2lib.CanExecute` will be `true`. Scripts can check this
value within their `_OnFrame` function or elsewhere and should not run any other code
if the value is `false`.

```lua
function _OnInit()
    kh2libstatus, kh2lib = pcall(require, "kh2lib")
    ...
    can_execute = kh2lib.CanExecute
    if not can_execute then
        return
    end
    
    -- (your code here)
end

function _OnFrame()
    if not can_execute then
        return
    end

    -- (your code here)
end
```

There is an additional `DenyGameVersions` function that can be used to explicitly declare
that your script is not compatible with specific game versions. This is hopefully rare,
but could happen, for instance, if a newer script is written, and if it's not feasible to go back
and find memory addresses for the older game versions.

For example, to prevent your script from running on 1.0.0.9 PC game versions:

```lua
function _OnInit()
    kh2libstatus, kh2lib = pcall(require, "kh2lib")
    ...
    DenyGameVersions(
        -- These are global variables added by kh2lib
        KH2_VERSION_EPIC_1_0_0_9,
        KH2_VERSION_STEAM_GLOBAL_1_0_0_9,
        KH2_VERSION_STEAM_JP_1_0_0_9
    )

    can_execute = kh2lib.CanExecute
    ...
```

<!-- Reference links -->
[templates]: /templates/
