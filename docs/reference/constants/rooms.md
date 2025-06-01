# Class: `Room` <!-- omit in toc -->

- Extends [`KH2ValueConstant`][ref-kh2valueconstant]

This library defines a Room class used to create a static list of all rooms and their relevant data.
It's unlikely that you will ever need to interface with this class directly. It is used internally
to create the public lookup table found at `kh2lib.rooms`.
The [full list of constants][ref-constants] can be accessed directly,
but it is generally not recommended unless you have a special use-case not covered
by the lookup tables or convenience methods.

## `Room:new([options])` <!-- omit in toc -->

- `options` {table}
  - `id` {integer} One-byte room ID (from game). Default: `-1`
  - `world_id` {integer} One-byte world ID (from game). Default: `-1`
  - `name` {string} Human-readable name of world. Default: `'UNKNOWN_ROOM'`
- Returns: {Room} newly-instantiated Room

A subclass of {KH2ValueConstant} defining a Room object.
**Room IDs are not unique across worlds**, which is why the
world ID is also stored for each room and is required in the lookup table.

All instances contain the built-in `KH2ValueConstant` properties and:

- `id` {integer} The game's ID for this room. Number between 0 and 255 (`0x00` to `0xFF`).
- `world_id` {integer} The game's ID for the world containing this room.
Number between 0 and 255 (`0x00` to `0xFF`).
- `name` {string} The English name of the room.

## List of all rooms <!-- omit in toc -->

This section contains all of the rooms indexed as Room objects in [`rooms.lua`][code-rooms],
separated by world. It also serves as a handy reference for looking up the IDs and names
for individual rooms, in case you need to compare against one in your script.

IDs are listed in [hexadecimal format][1], but can be represented as simple integers as well
(e.g. `0x11 == 17`).

Jump to section:

- [World of Darkness](#world-of-darkness)
- [Twilight Town](#twilight-town)
- [Destiny Islands](#destiny-islands)
- [Hollow Bastion](#hollow-bastion)
- [Beast's Castle](#beasts-castle)
- [Olympus Coliseum](#olympus-coliseum)
- [Agrabah](#agrabah)
- [The Land of Dragons](#the-land-of-dragons)
- [100 Acre Wood](#100-acre-wood)
- [Pride Lands](#pride-lands)
- [Atlantica](#atlantica)
- [Disney Castle](#disney-castle)
- [Timeless River](#timeless-river)
- [Halloween Town](#halloween-town)
- [Port Royal](#port-royal)
- [Space Paranoids](#space-paranoids)
- [The World That Never Was](#the-world-that-never-was)

<!-- Auto-generated tables from build script -->
<!-- markdownlint-disable MD013 -->
<!-- #tables -->

### World of Darkness

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x01|The Dark Margin|
|0x01|0x01|Loop Demo|

### Twilight Town

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x02|The Empty Realm|
|0x01|0x02|Roxas's Room|
|0x02|0x02|The Usual Spot|
|0x03|0x02|Back Alley|
|0x04|0x02|Sandlot|
|0x05|0x02|Sandlot (Day 4)|
|0x06|0x02|Market Street: Station Heights|
|0x07|0x02|Market Street: Tram Common|
|0x08|0x02|Station Plaza|
|0x09|0x02|Central Station|
|0x0A|0x02|Sunset Terrace|
|0x0B|0x02|Sunset Station|
|0x0C|0x02|Sunset Hill|
|0x0D|0x02|The Woods|
|0x0E|0x02|The Old Mansion|
|0x0F|0x02|Mansion: Foyer|
|0x10|0x02|Mansion: Dining Room|
|0x11|0x02|Mansion: Library|
|0x12|0x02|Mansion: The White Room|
|0x13|0x02|Mansion: Basement Hall|
|0x14|0x02|Mansion: Basement Hall (Axel II)|
|0x15|0x02|Mansion: Computer Room|
|0x16|0x02|Mansion: Basement Corridor|
|0x17|0x02|Mansion: Pod Room|
|0x18|0x02|On the Train|
|0x19|0x02|The Tower|
|0x1A|0x02|Tower: Entryway|
|0x1B|0x02|Tower: Sorcerer's Loft|
|0x1C|0x02|Tower: Wardrobe|
|0x1D|0x02|Tower: Star Chamber|
|0x1E|0x02|Tower: Moon Chamber|
|0x1F|0x02|Tower: Wayward Stairs (Lower Level)|
|0x20|0x02|Station of Serenity|
|0x21|0x02|Station of Calling|
|0x22|0x02|Station of Awakening (Twilight Thorn)|
|0x23|0x02|The Mysterious Train|
|0x24|0x02|Tunnelway|
|0x25|0x02|Underground Concourse|
|0x26|0x02|Tower: Wayward Stairs (Middle Level)|
|0x27|0x02|Tower: Wayward Stairs (Upper Level)|
|0x28|0x02|Betwixt and Between|
|0x29|0x02|The Old Mansion (Nobodies Fight)|

### Destiny Islands

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x03|Beach|
|0x01|0x03|Main Island: Ocean's Road|
|0x02|0x03|Main Island: Shore|

### Hollow Bastion

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x04|Villain's Vale|
|0x01|0x04|The Dark Depths|
|0x02|0x04|The Great Maw|
|0x03|0x04|Crystal Fissure|
|0x04|0x04|Castle Gate|
|0x05|0x04|Ansem's Study|
|0x06|0x04|Postern|
|0x07|0x04|Restoration Site (Intact)|
|0x08|0x04|Bailey (Intact)|
|0x09|0x04|Borough|
|0x0A|0x04|Marketplace|
|0x0B|0x04|Corridors|
|0x0C|0x04|Heartless Manufactory|
|0x0D|0x04|Merlin's House|
|0x0E|0x04|Castle Oblivion|
|0x0F|0x04|Ansem's Study (Before Xehanort Takes Over)|
|0x10|0x04|Ravine Trail|
|0x11|0x04|The Great Maw (1,000 Heartless Battle Area)|
|0x12|0x04|Restoration Site (Destroyed)|
|0x13|0x04|Bailey (Destroyed)|
|0x14|0x04|Corridors (Heartless & Nobodies Fight)|
|0x15|0x04|Cavern of Remembrance: Depths|
|0x16|0x04|Cavern of Remembrance: Mining Area|
|0x17|0x04|Cavern of Remembrance: Engine Chamber|
|0x18|0x04|Cavern of Remembrance: Mineshaft|
|0x19|0x04|Transport to Remembrance|
|0x1A|0x04|Garden of Assemblage|
|0x1B|0x04|Underground Facility|
|0x20|0x04|The Old Mansion (Vexen)|
|0x21|0x04|Station of Remembrance|
|0x22|0x04|Destiny Islands|
|0x26|0x04|Station of Oblivion|

### Beast's Castle

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x05|Entrance Hall|
|0x01|0x05|Parlor|
|0x02|0x05|Belle's Room|
|0x03|0x05|Beast's Room|
|0x04|0x05|Ballroom (Light)|
|0x05|0x05|Ballroom (Dark)|
|0x06|0x05|Courtyard|
|0x07|0x05|The East Wing|
|0x08|0x05|The West Hall|
|0x09|0x05|The West Wing|
|0x0A|0x05|Dungeon|
|0x0B|0x05|Undercroft|
|0x0C|0x05|Secret Passage|
|0x0D|0x05|Bridge (Normal)|
|0x0E|0x05|Ballroom|
|0x0F|0x05|Bridge (Xaldin Battle Area)|

### Olympus Coliseum

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x06|The Coliseum|
|0x01|0x06|Coliseum Gates (Intact)|
|0x02|0x06|Coliseum Gates (Destroyed) (Day)|
|0x03|0x06|Underworld Entrance|
|0x04|0x06|Coliseum Foyer|
|0x05|0x06|Valley of the Dead|
|0x06|0x06|Hades' Chamber|
|0x07|0x06|Cave of the Dead: Entrance|
|0x08|0x06|Well of Capitivity|
|0x09|0x06|The Underdrome|
|0x0A|0x06|Cave of the Dead: Inner Chamber|
|0x0B|0x06|Underworld Caverns: Entrance|
|0x0C|0x06|The Lock|
|0x0D|0x06|Underdrome|
|0x0E|0x06|Coliseum Gates (Destroyed) (Night)|
|0x0F|0x06|Cave of the Dead: Passage|
|0x10|0x06|Underworld Caverns: The Lost Road|
|0x11|0x06|Underworld Caverns: Atrium|
|0x12|0x06|Coliseum Gates (Hydra)|
|0x13|0x06|Underdrome (Hades)|

### Agrabah

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x07|Agrabah|
|0x01|0x07|Bazaar|
|0x02|0x07|The Peddler's Shop (1st Visit)|
|0x03|0x07|The Palace|
|0x04|0x07|Vault|
|0x05|0x07|Above Agrabah|
|0x06|0x07|Palace Walls|
|0x07|0x07|The Cave of Wonders: Entrance|
|0x09|0x07|The Cave of Wonders: Stone Guardians|
|0x0A|0x07|The Cave of Wonders: Treasure Room|
|0x0B|0x07|Ruined Chamber|
|0x0C|0x07|The Cave of Wonders: Valley of Stone|
|0x0D|0x07|The Cave of Wonders: Chasm of Challenges|
|0x0E|0x07|Sandswept Ruins|
|0x0F|0x07|The Peddler's Shop (2nd Visit)|

### The Land of Dragons

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x08|Bamboo Grove|
|0x01|0x08|Encampment|
|0x02|0x08|Checkpoint|
|0x03|0x08|Mountain Trail|
|0x04|0x08|Village (Intact)|
|0x05|0x08|Village Cave|
|0x06|0x08|Ridge|
|0x07|0x08|Summit|
|0x08|0x08|Imperial Square|
|0x09|0x08|Palace Gate|
|0x0A|0x08|Antechamber|
|0x0B|0x08|Throne Room|
|0x0C|0x08|Village (Destroyed)|

### 100 Acre Wood

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x09|The Hundred Acre Wood|
|0x01|0x09|Starry Hill|
|0x02|0x09|Pooh Bear's House|
|0x03|0x09|Rabbit's House|
|0x04|0x09|Piglet's House|
|0x05|0x09|Kanga's House|
|0x06|0x09|A Windsday Tale|
|0x07|0x09|The Honey Hunt|
|0x08|0x09|Blossom Valley|
|0x09|0x09|The Spooky Cave|

### Pride Lands

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x0A|Pride Rock|
|0x01|0x0A|Stone Hollow|
|0x02|0x0A|The King's Den|
|0x03|0x0A|Wildebeest Valley (Present)|
|0x04|0x0A|The Savannah|
|0x05|0x0A|Elephant Graveyard|
|0x06|0x0A|Gorge|
|0x07|0x0A|Wastelands|
|0x08|0x0A|Jungle|
|0x09|0x0A|Oasis (Day)|
|0x0A|0x0A|Pride Rock (Lush)|
|0x0B|0x0A|Oasis (Night)|
|0x0C|0x0A|Overlook|
|0x0D|0x0A|Peak|
|0x0E|0x0A|Scar's Darkness|
|0x0F|0x0A|The Savannah (Groundshaker Battle Area)|
|0x10|0x0A|Wildebeest Valley (Past)|

### Atlantica

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x0B|Triton's Throne|
|0x01|0x0B|Ariel's Grotto|
|0x02|0x0B|Undersea Courtyard (Day)|
|0x03|0x0B|Undersea Courtyard (Dawn)|
|0x04|0x0B|The Palace: Performance Hall|
|0x05|0x0B|Sunken Ship|
|0x06|0x0B|The Shore (Day)|
|0x07|0x0B|The Shore (Night)|
|0x08|0x0B|The Shore (Dawn)|
|0x09|0x0B|Wrath of the Sea|
|0x0A|0x0B|Wedding Ship|

### Disney Castle

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x0C|Audience Chamber|
|0x01|0x0C|Library|
|0x02|0x0C|Colonnade|
|0x03|0x0C|Courtyard|
|0x04|0x0C|The Hall of the Cornerstone (Dark)|
|0x05|0x0C|The Hall of the Cornerstone (Light)|
|0x06|0x0C|Gummi Hangar|
|0x07|0x0C|Gathering Place|

### Timeless River

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x0D|Cornerstone Hill|
|0x01|0x0D|Pier|
|0x02|0x0D|Waterway|
|0x03|0x0D|Wharf|
|0x04|0x0D|Lilliput|
|0x05|0x0D|Building Site|
|0x06|0x0D|Scene of the Fire|
|0x07|0x0D|Mickey's House|
|0x08|0x0D|Villain's Vale (Monochrome)|

### Halloween Town

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x0E|Halloween Town Square|
|0x01|0x0E|Dr. Finkelstein's Lab|
|0x02|0x0E|Graveyard|
|0x03|0x0E|Curly Hill|
|0x04|0x0E|Hinterlands|
|0x05|0x0E|Yuletide Hill|
|0x06|0x0E|Candy Cane Lane|
|0x07|0x0E|Christmas Tree Plaza|
|0x08|0x0E|Santa's House|
|0x09|0x0E|Toy Factory: Shipping and Receiving|
|0x0A|0x0E|Toy Factory: The Wrapping Room|

### Port Royal

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x10|Rampart|
|0x01|0x10|Harbor|
|0x02|0x10|Town|
|0x03|0x10|The Interceptor|
|0x04|0x10|The Interceptor: Ship's Hold|
|0x05|0x10|The Black Pearl|
|0x06|0x10|The Black Pearl: Captain's Stateroom|
|0x07|0x10|The Interceptor|
|0x08|0x10|Isla de Muerta: Rock Face (1st Visit with The Interceptor)|
|0x09|0x10|Isla de Muerta: Cave Mouth|
|0x0A|0x10|Isla de Muerta: Treasure Heap|
|0x0B|0x10|Ship Graveyard: The Interceptor's Hold|
|0x0C|0x10|Isla de Muerta: Powder Store|
|0x0D|0x10|Isla de Muerta: Moonlight Nook|
|0x0E|0x10|Ship Graveyard: Seadrift Keep|
|0x0F|0x10|Ship Graveyard: Seadrift Row|
|0x10|0x10|Isla de Muerta: Rock Face (2nd Visit)|
|0x11|0x10|Isla de Muerta: Treasure Heap|
|0x12|0x10|The Black Pearl (to Port Royal)|
|0x13|0x10|The Black Pearl (to Isla de Muerta)|
|0x14|0x10|The Black Pearl (to Ship Graveyard)|
|0x15|0x10|The Interceptor (to Port Royal)|
|0x16|0x10|The Interceptor (to Isla de Muerta)|
|0x17|0x10|The Black Pearl: Captain's Stateroom|
|0x18|0x10|Harbor|
|0x19|0x10|Isla de Muerta: Rock Face (1st Visit with The Black Pearl)|

### Space Paranoids

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x11|Pit Cell|
|0x01|0x11|Canyon|
|0x02|0x11|Game Grid|
|0x03|0x11|Dataspace|
|0x04|0x11|I/O Tower: Hallway|
|0x05|0x11|I/O Tower: Communications Room|
|0x06|0x11|Simulation Hangar|
|0x07|0x11|Solar Sailer Simulation|
|0x08|0x11|Central Computer Mesa|
|0x09|0x11|Central Computer Core|
|0x0A|0x11|Solar Sailor Simulation (from I/O Tower)|
|0x0B|0x11|Solar Sailor Simulation (from Central Computer)|

### The World That Never Was

|ID|WORLD_ID|NAME|
|--|--|--|
|0x00|0x12|Where Nothing Gathers|
|0x01|0x12|Alley to Between|
|0x02|0x12|Fragment Crossing|
|0x03|0x12|Memory's Skyscraper|
|0x04|0x12|The Brink of Despair|
|0x05|0x12|The Soundless Prison|
|0x06|0x12|Nothing's Call|
|0x07|0x12|Crooked Ascension (Going Up)|
|0x08|0x12|Crooked Ascension (Going Down)|
|0x09|0x12|Twilight's View|
|0x0A|0x12|Hall of Empty Melodies (Lower Level)|
|0x0B|0x12|Hall of Empty Melodies (Upper Level)|
|0x0C|0x12|Naught's Skyway|
|0x0D|0x12|Proof of Existence|
|0x0E|0x12|Havoc's Divide|
|0x0F|0x12|Addled Impasse|
|0x10|0x12|Naught's Approach|
|0x11|0x12|Ruin and Creation's Passage|
|0x12|0x12|The Altar of Naught|
|0x13|0x12|Memory's Contortion|
|0x14|0x12|The World of Nothing (Xemnas II)|
|0x15|0x12|Station of Awakening (Roxas)|
|0x16|0x12|The World of Nothing (Dragon Xemnas)|
|0x17|0x12|The World of Nothing (Armor Xemnas II)|
|0x18|0x12|The World of Nothing (Armor Xemnas I)|
|0x19|0x12|The World of Nothing (Core)|
|0x1A|0x12|The World of Nothing (Cylinders)|
|0x1B|0x12|The World of Nothing (Part I)|
|0x1C|0x12|The World of Nothing (Part II)|
|0x1D|0x12|Altar of Naught (No Kingdom Hearts Moon)|
<!-- #endtables -->

<!-- Reference links -->
[ref-constants]: ./README.md
[code-rooms]: /io_packages/kh2lib/constants/rooms.lua
[ref-kh2valueconstant]: ./kh2valueconstant.md
[1]: https://en.wikipedia.org/wiki/Hexadecimal#:~:text=Hexadecimal%20\(also%20known,ten%20to%20fifteen.&text=In%20programming%2C%20several%20notations%20denote%20hexadecimal%20numbers%2C%20usually%20involving%20a%20prefix.%20The%20prefix%200x%20is%20used%20in%20C%2C%20which%20would%20denote%20this%20value%20as%200x2C7.
