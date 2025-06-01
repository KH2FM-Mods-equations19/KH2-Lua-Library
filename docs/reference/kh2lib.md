# KH2 Lua Library (KH2Lib) <!-- omit in toc -->

This is a technical reference sheet for the myriad tables, variables,
and methods exposed by the `kh2lib` library.
For guides on how to perform certain actions, check out [How-to guides][guide-folder].
For in-depth tutorials on building a KH2 lua mod, see [Tutorials][tut-folder].

## Table of contents <!-- omit in toc -->

- [Library and game versions](#library-and-game-versions)
  - [`kh2lib.CanExecute`](#kh2libcanexecute)
  - [`kh2lib.GameVersion`](#kh2libgameversion)
  - [`kh2lib.OnPC`](#kh2libonpc)
  - [`RequireKH2LibraryVersion(version)`](#requirekh2libraryversionversion)
  - [`RequirePCGameVersion()`](#requirepcgameversion)
  - [`DenyGameVersions(version1[, version2, ...])`](#denygameversionsversion1-version2-)
- [Memory addresses](#memory-addresses)
- [Functions](#functions)
  - [`BitOr(address, mask)`](#bitoraddress-mask)
  - [`BitNot()`](#bitnot)
  - [`ReadPointer(address)`](#readpointeraddress)
  - [`Log(message)`, `LogWarning(message)`, `LogError(message)`](#logmessage-logwarningmessage-logerrormessage)
- [Lookup tables](#lookup-tables)
  - [`kh2lib.worlds`](#kh2libworlds)
  - [`kh2lib.rooms`](#kh2librooms)
  - [`kh2lib.events`](#kh2libevents)
- [Game state](#game-state)
  - [`kh2lib.current`](#kh2libcurrent)

## Library and game versions

The library provides several special variables in the `kh2lib` table
that can be used by scripts to determine the current runtime environment.
Most variables and methods in this section will be used by scripts at most once,
in the `_OnInit()` function, with the exception of `CanExecute`,
which should also be checked on every frame before performing actions.

### `kh2lib.CanExecute`

- {boolean} Whether the script should be allowed to execute based on
detected game version and required library version.

> [!IMPORTANT]
> You should **always** check `CanExecute` before performing an action,
> to avoid errors or unexpected results.

### `kh2lib.GameVersion`

- {integer} The version of the game that was detected upon importing the library.

The values listed below are the names of **global variables** injected
by the library, not strings, and not properties in the `kh2lib` table.
They correspond to the appropriate integer values.

Possible values:

- `KH2_VERSION_UNKNOWN` Used when no compatible version is detected
- `KH2_VERSION_EMULATOR` PCSX2 emulator
- `KH2_VERSION_EPIC_1_0_0_9` Epic Games v1.0.0.9
- `KH2_VERSION_STEAM_GLOBAL_1_0_0_9` Steam Global v1.0.0.9
- `KH2_VERSION_STEAM_JP_1_0_0_9` Steam JP v1.0.0.9
- `KH2_VERSION_EPIC_1_0_0_10` Epic Games v1.0.0.10
- `KH2_VERSION_STEAM_1_0_0_10` Steam v1.0.0.10

### `kh2lib.OnPC`

- {boolean} Convenience property to check whether the detected game version
is one of the PC ports.

### `RequireKH2LibraryVersion(version)`

- `version` {integer} Required minimum version

Declare a minimum version of the library for this script. If the detected version is too low,
`kh2lib.CanExecute` is set to false and a message is printed to the console.

### `RequirePCGameVersion()`

Declare that the script expects to run on PC ports only. If not on a PC port,
`kh2lib.CanExecute` is set to false and a message is printed to the console.

### `DenyGameVersions(version1[, version2, ...])`

- `args` {integer[]} List of versions (accepts any number of arguments)

Declare specific game version(s) that are known to not be compatible with the script.
This is most commonly caused by not being able to find memory addresses for older game versions.
If the detected version matches one of the provided arguments,
`kh2lib.CanExecute` is set to false and a message is printed to the console.

#### Examples <!-- omit in toc -->

```lua
-- Deny emulator version and first Steam global version
DenyGameVersions(KH2_VERSION_EMULATOR, KH2_VERSION_STEAM_GLOBAL_1_0_0_9)
```

## Memory addresses

The library provides access to many memory addresses and other values,
adjusted for the current game version.
A few of the most common are listed below, as an example.
For a full list of exposed addresses, see [Addresses][ref-addresses].

- `kh2lib.Now` {integer} Current location data
- `kh2lib.Save` {integer} Save file data
- `kh2lib.Obj0Pointer` {integer} Pointer address for `00objentry.bin`
- `kh2lib.Sys3Pointer` {integer} Pointer address for `03system.bin`
- `kh2lib.Btl0Pointer` {integer} Pointer address for `00battle.bin`

[Full addresses reference][ref-addresses]

## Functions

The library provides some other common functions as **global variables** that can be used
by scripts. You do not access these via the `kh2lib` table (at this time).

### `BitOr(address, mask)`

- `address` {integer} Memory address
- `mask` {integer} Bitmask to apply on value at `address`

Performs a bitwise `OR` of the value at a specified address using a specified mask and writes
the updated byte. This is usually used to set one or more bits in a byte to `1`.

### `BitNot()`

- `address` {integer} Memory address
- `mask` {integer} Inverse of bitmask to apply on value at `address`

Performs a bitwise `AND NOT` of the value at a specified address using a specified mask
and writes the updated byte. This is usually used to set one or more bits in a byte to `0`.

### `ReadPointer(address)`

- `address` {integer} Memory address containing pointer

Reads and returns a pointer value at a specified address, using the proper size per platform.

### `Log(message)`, `LogWarning(message)`, `LogError(message)`

- `message` {string} Message to log to console

Logs a message to the console, using an appropriate print call per platform.
The `LogWarning` and `LogError` variants print the message in a corresponding color.

## Lookup tables

> [!WARNING]
> This part of the library is still a work in progress.
> While exposed variables should continue to be reliable in future versions,
> there may be incorrect or incomplete values within the lists of constants.

The library includes a list of constants, their corresponding game IDs, and their memory addresses.
The full list of available constants can be found at [Constants][ref-constants].
Below is a reference of provided lookup tables for converting between IDs and human-readable strings.

### `kh2lib.worlds`

- {table} worlds table
  - `key` {integer|string} ID, name, or short name of world
  - `value` {string|integer} Name or ID of world represented by `key`

Converts between integer world IDs and English names (in both directions).
This table (and all other lookup tables indexed by world) contains an index for every world's ID,
English name (in upper SNAKE_CASE), and short name (in upper SNAKE_CASE),
as defined in the [full list of world objects][ref-worlds].
Additionally, some aliases for common alternate names and abbreviations are provided:

- `SIMULATED_TWILIGHT_TOWN`, `STT` :arrow_right: `TWILIGHT_TOWN`
- `RADIANT_GARDEN`, `RG` :arrow_right: `HOLLOW_BASTION`
- `LAND_OF_DRAGONS`, `LOD` :arrow_right: `THE_LAND_OF_DRAGONS`
- `HUNDRED_ACRE_WOOD`, `HAW` :arrow_right: `100_ACRE_WOOD`
- `ATL` :arrow_right: `ATLANTICA`
- `WORLD_THAT_NEVER_WAS`, `WTNW` :arrow_right: `THE_WORLD_THAT_NEVER_WAS`

#### Examples <!-- omit in toc -->

```lua
Log(kh2lib.worlds[0x04])           -- Hollow Bastion
Log(kh2lib.worlds.HOLLOW_BASTION)  -- 4
Log(kh2lib.worlds.HB)              -- 4 (alias for HOLLOW_BASTION)
Log(kh2lib.worlds.RADIANT_GARDEN)  -- 4 (alias for HOLLOW_BASTION)
Log(kh2lib.worlds[8])              -- The Land of Dragons
Log(kh2lib.worlds.LAND_OF_DRAGONS) -- 8 (alias for THE_LAND_OF_DRAGONS)
```

### `kh2lib.rooms`

- {table} worlds table
  - `key1` {integer|string} ID, name, or short name of world
  - `value1` {table} rooms table
    - `key2` {integer|string} ID or name of room within the given world
    - `value2` {string|integer} Name or ID of room represented by `key2`

Converts between integer room IDs and English names (in both directions).
This is a 2-dimensional table, with the first key referencing a world
(see [`kh2lib.worlds`](#kh2libworlds)) and the second key referencing a room within that world.

Room keys are **_not_** in upper SNAKE_CASE. [Learn more.][explain-naming]

For a full list of rooms, see the full [rooms reference][ref-rooms].

#### Examples <!-- omit in toc -->

```lua
Log(kh2lib.rooms[0x04][0x06])               -- Postern
Log(kh2lib.rooms.HOLLOW_BASTION['Postern']) -- 6
Log(kh2lib.rooms.LOD[0x0C])                 -- Village (Destroyed)
```

### `kh2lib.events`

- {table} worlds table
  - `key1` {integer|string} ID, name, or short name of world
  - `value1` {table} rooms table
    - `key2` {integer|string} ID or name of room within the given world
    - `value2` {table} events table
      - `key3` {integer} ID of event within the given room and world
      - `value3` {string} Name of event represented by `key3`

Converts between integer event IDs and English names, **in that direction only**.
This is a 3-dimensional table, with the first key referencing a world
(see [`kh2lib.worlds`](#kh2libworlds)), the second key referencing a room within that world
(by room ID only), and the third key referencing an event within that room.

Room and Event keys are accessed by **_ID only_** in the events table. [Learn more.][explain-naming]

For a full list of events, see the full [events reference][ref-events].

#### Examples <!-- omit in toc -->

```lua
Log(kh2lib.events[0x04][0x06][0x0001])  -- Looking for Leon
Log(kh2lib.events.HOLLOW_BASTION[6][1]) -- Looking for Leon
Log(kh2lib.events.LOD[0x0C][0xA])       -- The Village With No-One In It
```

## Game state

> [!WARNING]
> This part of the library is still a work in progress.
> While exposed variables should continue to be reliable in future versions,
> more may be added to further simplify common actions a script might take.

Some values in the game's memory are accessed so commonly
that the library provides shortcut references to them.

### `kh2lib.current`

- `world` {integer} Current world ID. Equivalent to `ReadByte(kh2lib.Now + 0x00)`.
- `world_name` {string} Current world name.
- `room` {integer} Current room ID. Equivalent to `ReadByte(kh2lib.Now + 0x01)`.
- `room_name` {string} Current room name.
- `event` {integer} Current event ID. Equivalent to `ReadShort(kh2lib.Now + 0x08)`.
- `event_name` {string} Current event name.
- `door` {integer} Current door (spawn) ID.
- `place` {integer} Concatenation of current room ID & world ID, as bytes.
Equivalent to `ReadShort(kh2lib.Now + 0x01)`.
- `place_name` {string} Current world & room names, separated by a hyphen.
- `location` {string} Alias for `place_name`.

Table that provides convenience methods (as property getters)
to get information about the current game state.
Currently, this only includes information accessed via the `kh2lib.Now` memory address,
but more information is planned to be added in the future.

#### Examples <!-- omit in toc -->

```lua
-- Assume the player is currently in a cutscene in the Secret Passage in Beast's Castle
Log(kh2lib.current.world)                    -- 5
Log(kh2lib.current.world_name)               -- Beast's Castle
Log(kh2lib.current.room)                     -- 12
Log(kh2lib.current.room_name)                -- Secret Passage
Log(kh2lib.current.event)                    -- 1
Log(kh2lib.current.event_name)               -- The Dark Lanterns
string.format('02X%x', kh2lib.current.place) -- 0x0C05
Log(kh2lib.current.place_name)               -- Beast's Castle - Secret Passage
Log(kh2lib.current.location)                 -- Beast's Castle - Secret Passage
```

<!-- Reference links -->
[guide-folder]: /docs/how_to_guides/
[tut-folder]: /docs/tutorials/
[ref-addresses]: ./addresses/README.md
[ref-constants]: ./constants/README.md
[ref-worlds]: ./constants/worlds.md
[ref-rooms]: ./constants/rooms.md
[ref-events]: ./constants/events.md
[explain-naming]: /docs/explanations/naming_convention.md
