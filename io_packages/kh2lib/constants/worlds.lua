-- Creates a string reference to the current directory, which is needed for relative imports
local BASE_PATH = (...):match('(.-)[^%.]+$')
local KH2ValueConstant = require(BASE_PATH .. 'base_class')

--- KH2 World
--- @class World:KH2ValueConstant
--- @field id integer # 1-byte world ID (from game)
--- @field name string # human-readable name of world
--- @field short_name string # abbreviated name of world
local World = KH2ValueConstant:new{ id = -1, name = 'UNKNOWN_WORLD', short_name = 'UNKWN' }

--- @param o {id: integer, name: string, short_name: string} # options table
--- @return World # newly instantiated World
function World:new(o)
    local mt = World:super_mt()
    mt.__name = 'World'
    setmetatable(o, mt)
    return o
end

--- References to all of the worlds defined by the game
--- @type World[]
local worlds = {
    World:new{ id = 0x01, name = 'World of Darkness', short_name = 'WOD' },
    World:new{ id = 0x02, name = 'Twilight Town', short_name = 'TT' },
    World:new{ id = 0x03, name = 'Destiny Islands', short_name = 'DI' },
    World:new{ id = 0x04, name = 'Hollow Bastion', short_name = 'HB' },
    World:new{ id = 0x05, name = "Beast's Castle", short_name = 'BC' },
    World:new{ id = 0x06, name = 'Olympus Coliseum', short_name = 'OC' },
    World:new{ id = 0x07, name = 'Agrabah', short_name = 'AG' },
    World:new{ id = 0x08, name = 'The Land of Dragons', short_name = 'TLOD' },
    World:new{ id = 0x09, name = '100 Acre Wood', short_name = '1AW' },
    World:new{ id = 0x0A, name = 'Pride Lands', short_name = 'PL' },
    World:new{ id = 0x0B, name = 'Atlantica', short_name = 'AT' },
    World:new{ id = 0x0C, name = 'Disney Castle', short_name = 'DC' },
    World:new{ id = 0x0D, name = 'Timeless River', short_name = 'TR' },
    World:new{ id = 0x0E, name = 'Halloween Town', short_name = 'HT' },
    World:new{ id = 0x0F, name = 'World Map', short_name = 'MAP' },
    World:new{ id = 0x10, name = 'Port Royal', short_name = 'PR' },
    World:new{ id = 0x11, name = 'Space Paranoids', short_name = 'SP' },
    World:new{ id = 0x12, name = 'The World That Never Was', short_name = 'TWTNW' },
}

return worlds
