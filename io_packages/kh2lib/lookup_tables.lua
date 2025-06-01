-- Creates a string reference to the current directory, which is needed for relative imports
local BASE_PATH = (...):match('(.-)[^%.]+$')

-- Constants

local OFFSETS = require(BASE_PATH .. 'constants.offsets')
--- @module 'constants.worlds'
local WORLDS = require(BASE_PATH .. 'constants.worlds')
--- @module 'constants.rooms'
local ROOMS = require(BASE_PATH .. 'constants.rooms')
--- @module 'constants.events'
local EVENTS = require(BASE_PATH .. 'constants.events')

--- @alias WorldId integer
--- @alias WorldName string
--- @alias RoomId integer
--- @alias RoomName string
--- @alias EventId integer
--- @alias EventName string

--- Convert string to valid key name in UPPER_SNAKE_CASE
--- @param str string
--- @return string
local function upper_snake_case(str)
    return str:gsub(' ', '_'):gsub("'", ''):upper()
end

--- Create lookup table for worlds to convert between IDs and names (bi-directional)
--- @return {[WorldId]: WorldName}|{[WorldName]: WorldId}
local function create_worlds_lut()
    local lut = {}
    for _, world in ipairs(WORLDS) do
        local id = world.id
        local name = world.name
        local short_name = world.short_name
        local key_name = upper_snake_case(name)

        lut[id] = name
        lut[key_name] = id
        lut[short_name] = id
    end

    return lut
end

--- Create lookup table for rooms to convert between IDs and names (bi-directional)
--- @return {[WorldId|WorldName]: {[RoomId]: RoomName}}|{[WorldId|WorldName]: {[RoomName]: RoomId}}
local function create_rooms_lut()
    local lut = {}
    for _, room in ipairs(ROOMS) do
        local world = WORLDS[room.world_id]
        local world_id = world.id
        local world_name = upper_snake_case(world.name)
        local world_abbr = world.short_name
        local id = room.id
        local name = room.name

        if not lut[world_id] then
            lut[world_id] = {}
            lut[world_name] = {}
            lut[world_abbr] = {}
        end

        lut[world_id][id] = name
        lut[world_id][name] = id
        lut[world_name][id] = name
        lut[world_name][name] = id
        lut[world_abbr][id] = name
        lut[world_abbr][name] = id
    end

    return lut
end

--- Create lookup table for events to get names from IDs (uni-directional)
--- @return {[WorldId|WorldName]: {[RoomId]: {[EventId]: EventName}}}
local function create_events_lut()
    local lut = {}
    for _, event in ipairs(EVENTS) do
        local world = WORLDS[event.world_id]
        local world_id = world.id
        local world_name = upper_snake_case(world.name)
        local world_abbr = world.short_name
        local room = event.room_id
        local id = event.id
        local name = event.name

        if not lut[world_id] then
            lut[world_id] = {}
            lut[world_name] = {}
            lut[world_abbr] = {}
        end

        if not lut[world_id][room] then
            lut[world_id][room] = {}
            lut[world_name][room] = {}
            lut[world_abbr][room] = {}
        end

        lut[world_id][room][id] = name
        lut[world_name][room][id] = name
        lut[world_abbr][room][id] = name
    end

    return lut
end

--- Add some additional world aliases to a lookup table
--- @param table table Table keys for each world
local function add_world_aliases_to_table(table)
    table.SIMULATED_TWILIGHT_TOWN = table.TWILIGHT_TOWN
    table.STT = table.SIMULATED_TWILIGHT_TOWN
    table.RADIANT_GARDEN = table.HOLLOW_BASTION
    table.RG = table.RADIANT_GARDEN
    table.LAND_OF_DRAGONS = table.THE_LAND_OF_DRAGONS
    table.LOD = table.LAND_OF_DRAGONS
    table.HUNDRED_ACRE_WOOD = table['100_ACRE_WOOD']
    table.HAW = table.HUNDRED_ACRE_WOOD
    table.ATL = table.ATLANTICA
    table.WORLD_THAT_NEVER_WAS = table.THE_WORLD_THAT_NEVER_WAS
    table.WTNW = table.WORLD_THAT_NEVER_WAS
end

local lut_worlds = create_worlds_lut()
add_world_aliases_to_table(lut_worlds)

local lut_rooms = create_rooms_lut()
add_world_aliases_to_table(lut_rooms)

local lut_events = create_events_lut()
add_world_aliases_to_table(lut_events)

return {
    --- Lookup table for converting between world IDs and names
    --- @class WorldsLUT
    --- @field [WorldId] WorldName
    --- @field [WorldName] WorldId
    worlds = lut_worlds,

    --- Lookup table for converting between room IDs and names
    --- @class RoomsLUT
    --- @field [WorldId] {[RoomId]: RoomName}|{[RoomName]: RoomId}
    --- @field [WorldName] {[RoomId]: RoomName}|{[RoomName]: RoomId}
    rooms = lut_rooms,

    --- Lookup table for converting event IDs to names
    --- @class EventsLUT
    --- @field [WorldId] {[RoomId]: {[EventId]: EventName}}
    --- @field [WorldName] {[RoomId]: {[EventId]: EventName}}
    events = lut_events,

    _constants = {
        _offsets = OFFSETS,
        worlds = WORLDS,
        rooms = ROOMS,
        events = EVENTS,
    },
}
