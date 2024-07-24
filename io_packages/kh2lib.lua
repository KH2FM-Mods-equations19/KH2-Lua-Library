-- Versioning both helps with troubleshooting and allows scripts to know what values they can expect.
-- In particular, this number should be incremented anytime new values are added to the library.
-- Maintainers should take care to not remove values that were in previous versions, for backwards compatibility.
-- Scripts can declare a requirement on a minimum version using `requireLibraryVersion(n)`.
KH2_LIBRARY_VERSION = 1

-- Constants for each game version - scripts can check this using `gameVersion`
KH2_VERSION_UNKNOWN = 0
KH2_VERSION_EMULATOR = 1
KH2_VERSION_EPIC = 2
KH2_VERSION_STEAM_GLOBAL = 3
KH2_VERSION_STEAM_JP = 4

local kh2lib = {}

-- Scripts can call `requireLibraryVersion` to declare which version of the library they expect.
-- As more things are added to the library, scripts will likely need this to know what values are available.
local function requireLibraryVersion(requiredVersion)
    if KH2_LIBRARY_VERSION < requiredVersion then
        kh2lib.print("*** This script requires KH2 Lua Library version " .. requiredVersion .. " and may not function properly!")
        kh2lib.canExecute = false
    end
end

-- Scripts can call `requirePCVersion` which will set `canExecute` to false if not one of the PC ports.
local function requirePCVersion()
    if not kh2lib.onPC then
        kh2lib.print("*** This script expects to run on one of the PC ports of the game and will not function on emulator!")
        kh2lib.canExecute = false
    end
end

-- Reads and returns the pointer value at the given address.
local function readPointer(address)
    if kh2lib.onPC then
        return ReadLong(address)
    else
        return ReadInt(address)
    end
end

local function checkVersion()
    -- Addresses and values used internally to check which version of the game is running
    local EpicGlobalAddress = 0x566A8E
    local SteamGlobalAddress = 0x56668E
    local SteamJPAddress = 0x56640E
    local EpicGlobalValue = 0xFF
    local SteamGlobalValue = 0xFF
    local SteamJPValue = 0xFF

    local gameVersion = KH2_VERSION_UNKNOWN
    local onPC = false
    local printFunction = print
    local vars = {}

    local baseVersionMessage = "KH2 Lua Library v" .. KH2_LIBRARY_VERSION .. " - "

    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then -- PCSX2
        gameVersion = KH2_VERSION_EMULATOR -- Set to which version of the game is detected
        kh2lib = require("KH2Emulator") -- Imports the library to be used in this script. Note how it only imports the file for the game version we detected.
        printFunction(baseVersionMessage .. "Detected PCSX2 version")
    elseif GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then -- PC
        if ReadByte(EpicGlobalAddress) == EpicGlobalValue then -- EGS Global
            gameVersion = KH2_VERSION_EPIC
            onPC = true
            printFunction = ConsolePrint -- (ConsolePrint is not compatible with emulator so only use when on PC versions)
            kh2lib = require("KH2EpicGlobal")
            printFunction(baseVersionMessage .. "Detected Epic Global version")
        elseif ReadByte(SteamGlobalAddress) == SteamGlobalValue then -- Steam Global
            gameVersion = KH2_VERSION_STEAM_GLOBAL
            onPC = true
            printFunction = ConsolePrint
            kh2lib = require("KH2SteamGlobal")
            printFunction(baseVersionMessage .. "Detected Steam Global version")
        elseif ReadByte(SteamJPAddress) == SteamJPValue then -- Steam JP
            gameVersion = KH2_VERSION_STEAM_JP
            onPC = true
            printFunction = ConsolePrint
            kh2lib = require("KH2SteamJP")
            printFunction(baseVersionMessage .. "Detected Steam JP version")
        else
            printFunction(baseVersionMessage .. "KH2 not detected")
        end
    else
        printFunction(baseVersionMessage .. "KH2 not detected")
    end

    kh2lib.gameVersion = gameVersion
    kh2lib.onPC = onPC
    kh2lib.canExecute = gameVersion ~= KH2_VERSION_UNKNOWN

    kh2lib.print = printFunction
    kh2lib.requireLibraryVersion = requireLibraryVersion
    kh2lib.requirePCVersion = requirePCVersion
    kh2lib.readPointer = readPointer

    return kh2lib
end

-- Return everything packaged up in a way that can be referenced by the script that imported this library
return checkVersion()
