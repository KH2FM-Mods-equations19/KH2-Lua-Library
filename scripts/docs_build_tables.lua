-- THIS SCRIPT MUST BE RUN FROM THE ROOT DIRECTORY OF THE PROJECT!

-- We can't use kh2lib because CanExecute would be false and the LUTs wouldn't get added
local worlds = require('io_packages.kh2lib.constants.worlds')
local rooms = require('io_packages.kh2lib.constants.rooms')
local events = require('io_packages.kh2lib.constants.events')

-- Source files (reference docs)
local WORLDS_REF_PATH = 'docs/reference/constants/worlds.md'
local ROOMS_REF_PATH = 'docs/reference/constants/rooms.md'
local EVENTS_REF_PATH = 'docs/reference/constants/events.md'

-- Lua tables do not preserve key order and we need to print in a specific order
local WORLDS_COLUMN_ORDER = { 'id', 'name', 'short_name' }
local ROOMS_KEY_ORDER = { 'id', 'world_id', 'name' }
local EVENTS_KEY_ORDER = { 'id', 'battle_id', 'map_id', 'room_id', 'world_id', 'name' }

-- Declare special formatting requirements for certain keys
local WORLDS_FORMAT = { id = '0x%02X', name = '%s', short_name = '%s' }
local ROOMS_FORMAT = { id = '0x%02X', world_id = '0x%02X', name = '%s' }
local EVENTS_FORMAT = {
    id = '0x%04X',
    battle_id = '0x%04X',
    map_id = '0x%04X',
    room_id = '0x%02X',
    world_id = '0x%02X',
    name = '%s',
}

-- #region HELPER FUNCTIONS

--- Construct a markdown table header
--- @param table table table with named keys
--- @return string # markdown table header
local function md_table_header(table)
    local header = '|'
    local divider = '|'
    for _, key in ipairs(table) do
        header = header .. key:upper() .. '|'
        divider = divider .. '--|'
    end

    return header .. '\n' .. divider .. '\n'
end

--- Construct a markdown table row from a given table's values
--- @param table table table to print
--- @param order table order in which to print values (by key name)
--- @param formats table string.format() pattern for each value
--- @return string # markdown table row
local function md_table_row(table, order, formats)
    local values = '|'
    for _, key in ipairs(order) do
        local value = table[key]
        local pattern = formats[key]
        values = values .. string.format(pattern, value) .. '|'
    end

    return values .. '\n'
end

--- Searches for world with given ID and returns the English name
--- @param id integer world ID
--- @return string # name of world
local function get_world_name_by_id(id)
    for _, world in ipairs(worlds) do
        if world.id == id then
            return world.name
        end
    end

    error('World not found with id ' .. id)
end

--- Construct a markdown table from an array of constants
--- @param constants table table of constants
--- @param key_order table order in which to print keys/values
--- @param formats table string.format() pattern for each value
--- @return string # markdown string
local function table_to_md(constants, key_order, formats)
    local result_table = {}
    table.insert(result_table, md_table_header(key_order))

    for _, entry in ipairs(constants) do
        table.insert(result_table, md_table_row(entry, key_order, formats))
    end

    return table.concat(result_table)
end

--- Print an array of constants to a markdown file, separating them by world
--- @param constants table table of constants to print
--- @param key_order table order in which to print keys/values
--- @param formats table string.format() pattern for each value
--- @return string # markdown string
local function table_to_md_by_world(constants, key_order, formats)
    local result_table = {}
    local prev_world

    for _, entry in ipairs(constants) do
        local world = get_world_name_by_id(entry.world_id)
        if world ~= prev_world then
            table.insert(result_table, '\n### ' .. world .. '\n\n')
            table.insert(result_table, md_table_header(key_order))
            prev_world = world
        end

        table.insert(result_table, md_table_row(entry, key_order, formats))
    end

    return table.concat(result_table)
end

--- Insert markdown tables into reference doc file
--- @param md string markdown string to insert
--- @param file_path string path of reference file
local function overwrite_reference(md, file_path)
    local file = assert(io.open(file_path, 'r'))
    local startPattern = '<!%-%- #tables %-%->'
    local endPattern = '<!%-%- #endtables %-%->'
    local lines = {}
    local seeking = 'start'

    -- read the original file and insert new content
    for line in file:lines('L') do
        if seeking == 'start' and string.find(line, startPattern) then
            table.insert(lines, line)
            table.insert(lines, md)
            seeking = 'end'
        elseif seeking == 'end' and string.find(line, endPattern) then
            seeking = 'done'
        end

        -- omit the original lines between the search patterns
        if seeking ~= 'end' then
            table.insert(lines, line)
        end
    end
    file:close()

    -- overwrite the entire file with the newly constructed content
    file = assert(io.open(file_path, 'w'))
    file:write(table.concat(lines))
    file:close()
end

-- #endregion

-- #region MAIN

local worlds_md = table_to_md(worlds, WORLDS_COLUMN_ORDER, WORLDS_FORMAT)
overwrite_reference(worlds_md, WORLDS_REF_PATH)

local rooms_md = table_to_md_by_world(rooms, ROOMS_KEY_ORDER, ROOMS_FORMAT)
overwrite_reference(rooms_md, ROOMS_REF_PATH)

local events_md = table_to_md_by_world(events, EVENTS_KEY_ORDER, EVENTS_FORMAT)
overwrite_reference(events_md, EVENTS_REF_PATH)

-- #endregion
