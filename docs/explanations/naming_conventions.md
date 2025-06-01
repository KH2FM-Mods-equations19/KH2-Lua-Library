
# Naming conventions

WIP

## Constants

By programming convention, named constants are (usually) in UPPER_SNAKE_CASE.
This applies to global constants such as `KH2_VERSION_UNKNOWN` as well as constants stored within
lookup tables, such as `kh2lib.worlds.THE_WORLD_THAT_NEVER_WAS`.

### Why are Room and Event keys different from World keys?

Unlike world keys, room keys are _not_ in upper snake case.
The reason for this difference is while it's convenient to reference worlds by name
directly (e.g. `kh2lib.worlds.AGRABAH`), it's not as convenient to reference _rooms_
by name directly. Many can be quite long or even contain unusable symbols for direct access
(e.g. `kh2lib.rooms.AGRABAH['The Cave of Wonders: Chasm of Challenges']`).
It is more common for this table to be used by passing variables as keys, rather than
direct access (e.g. `kh2lib.rooms.AGRABAH[room_id]`), but direct access is still
occasionaly useful (especially for warps), so the names are still included as keys.

The events lookup table uses the same accessors for worlds as the other two tables,
but only accepts room IDs and event IDs for their respective keys, not names.
Most event names are long and not known by the public, so they would require a manual search
anyways, and the most common use-case for this table is to check the current game event
against a target, which is simple to do with an ID lookup for both room and event.
Additionally, it's most likely that events will be used more for filtering and logging
purposes where comparing by ID rather than name is fine.

Example:

```lua
local event_name = kh2lib.events.AGRABAH[current_room][current_event]
if event_name then
    Log("I'm in an Agrabah event named " .. event_name)
end
```
