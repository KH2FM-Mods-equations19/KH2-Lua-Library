# Constants

A "constant" to this library is a KH2 game property that has, at minimum, an ID and a name.
Examples of constants include every item in the game, every world, and every room.
They are grouped by type and exposed as part of the (currently private) `kh2lib._constants` table.

## Constants table (`kh2lib._constants`)

> [!CAUTION]
> Properties prefixed with an underscore (`_`) are considered "private" properties
> and may cause breaking changes. Use at your own risk. [Learn more.][explain-private]

### `kh2lib._constants._offsets`

- {table} Table of base address groups of offsets

Memory offsets, grouped by their common base address shortcuts (e.g. Now, Sve, Save, etc.).
See [full offsets reference][ref-offsets].

### `kh2lib._constants.worlds`

- {table} Array of all worlds.

Table of all World objects. See [full worlds reference][ref-worlds].

### `kh2lib._constants.rooms`

- {table} Array of all rooms.

Table of all Room objects. See [full rooms reference][ref-rooms].

### `kh2lib._constants.events`

- {table} Array of all events.

Table of all Event objects. See [full events reference][ref-events].

## Lookup tables

See [Lookup tables][ref-luts] in the main `kh2lib` reference.
This will likely be your primary method of interacting with constants.

## Constant types/classes

Besides [KH2ValueConstant][ref-kh2valueconstant], which should be considered a base class and not
instantiated directly, there are several classes of constants defined by the library.
You can view the reference sheet for each via the links below, which also include a full list of
game IDs and strings known by the library.

### Offsets

- [Offsets][ref-offsets]

Offsets are still a WIP and likely to frequently change.

### Location

- [Worlds][ref-worlds]
- [Rooms][ref-rooms]
- [Events][ref-events]

### Inventory

- WIP

<!-- Reference links -->
[ref-kh2valueconstant]: ./kh2valueconstant.md
[ref-offsets]: ./offsets.md
[ref-worlds]: ./worlds.md
[ref-rooms]: ./rooms.md
[ref-events]: ./events.md
[ref-luts]: /docs/reference/kh2lib.md#lookup-tables
[explain-private]: /docs/explanations/private_properties.md
