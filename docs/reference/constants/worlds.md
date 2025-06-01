# Class: `World`

- Extends [`KH2ValueConstant`][ref-kh2valueconstant]

This library defines a World class used to create a static list of all worlds
and their relevant data. It's unlikely that you will ever need to interface with
this class directly. It is used internally to create the public lookup table
found at `kh2lib.worlds`. The [full list of constants][ref-constants] can be accessed directly,
but it is generally not recommended unless you have a special use-case not covered
by the lookup tables or convenience methods.

## `World:new([options])`

- `options` {table}
  - `id` {integer} One-byte world ID (from game). Default: `-1`
  - `name` {string} Human-readable name of world. Default: `'UNKNOWN_WORLD'`
  - `short_name` {string} Abbreviated name of world. Default: `'UNKWN'`
- Returns: {World} newly-instantiated World

A subclass of {KH2ValueConstant} defining a World object.

All instances contain the built-in `KH2ValueConstant` properties and:

- `id` {integer} The game's ID for this world. Number between 0 and 255 (`0x00` to `0xFF`).
- `name` {string} The English name of the world.
- `short_name` {string} The English acronym or abbreviated name for the world.

## List of all worlds

The table below contains all of the worlds indexed as World objects in [`worlds.lua`][code-worlds].

IDs are listed in [hexadecimal format][1], but can be represented as simple integers as well
(e.g. `0x11 == 17`).

<!-- Auto-generated tables from build script -->
<!-- markdownlint-disable MD013 -->
<!-- #tables -->
|ID|NAME|SHORT_NAME|
|--|--|--|
|0x01|World of Darkness|WOD|
|0x02|Twilight Town|TT|
|0x03|Destiny Islands|DI|
|0x04|Hollow Bastion|HB|
|0x05|Beast's Castle|BC|
|0x06|Olympus Coliseum|OC|
|0x07|Agrabah|AG|
|0x08|The Land of Dragons|TLOD|
|0x09|100 Acre Wood|1AW|
|0x0A|Pride Lands|PL|
|0x0B|Atlantica|AT|
|0x0C|Disney Castle|DC|
|0x0D|Timeless River|TR|
|0x0E|Halloween Town|HT|
|0x0F|World Map|MAP|
|0x10|Port Royal|PR|
|0x11|Space Paranoids|SP|
|0x12|The World That Never Was|TWTNW|
<!-- #endtables -->

<!-- Reference links -->
[ref-constants]: ./README.md
[code-worlds]: /io_packages/kh2lib/constants/worlds.lua
[ref-kh2valueconstant]: ./kh2valueconstant.md
[1]: https://en.wikipedia.org/wiki/Hexadecimal#:~:text=Hexadecimal%20\(also%20known,ten%20to%20fifteen.&text=In%20programming%2C%20several%20notations%20denote%20hexadecimal%20numbers%2C%20usually%20involving%20a%20prefix.%20The%20prefix%200x%20is%20used%20in%20C%2C%20which%20would%20denote%20this%20value%20as%200x2C7.
