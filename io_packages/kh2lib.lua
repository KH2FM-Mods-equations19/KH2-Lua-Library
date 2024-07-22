KH2_LIBRARY_VERSION = "0.0.1" -- Having a unique version every time any change is made helps with troubleshooting

-- Constants for each game version - scripts can check this using `gameVersion`
KH2_VERSION_UNKNOWN = 0
KH2_VERSION_EMULATOR = 1
KH2_VERSION_EPIC = 2
KH2_VERSION_STEAM_GLOBAL = 3
KH2_VERSION_STEAM_JP = 4

local function checkVersion()
    -- Addresses and values used internally to check which version of the game is running
    local EpicGlobalAddress = 0x566A8E
    local SteamGlobalAddress = 0x56668E
    local SteamJPAddress = 0x56640E
    local EpicGlobalValue = 0xFF
    local SteamGlobalValue = 0xFF
    local SteamJPValue = 0xFF

    local gameVersion = KH2_VERSION_UNKNOWN
    local printFunction = print
    local vars = {}

    local baseVersionMessage = "KH2 Lua Library " .. KH2_LIBRARY_VERSION .. " - "

    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then -- PCSX2
        gameVersion = KH2_VERSION_EMULATOR -- Set to which version of the game is detected
        vars = require("KH2Emulator") -- Imports the library to be used in this script. Note how it only imports the file for the game version we detected.
        printFunction(baseVersionMessage .. "Detected PCSX2 version")
    elseif GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then -- PC
        if ReadByte(EpicGlobalAddress) == EpicGlobalValue then -- EGS Global
            gameVersion = KH2_VERSION_EPIC
            printFunction = ConsolePrint -- (ConsolePrint is not compatible with emulator so only use when on PC versions)
            vars = require("KH2EpicGlobal")
            printFunction(baseVersionMessage .. "Detected Epic Global version")
        elseif ReadByte(SteamGlobalAddress) == SteamGlobalValue then -- Steam Global
            gameVersion = KH2_VERSION_STEAM_GLOBAL
            printFunction = ConsolePrint
            vars = require("KH2SteamGlobal")
            printFunction(baseVersionMessage .. "Detected Steam Global version")
        elseif ReadByte(SteamJPAddress) == SteamJPValue then -- Steam JP
            gameVersion = KH2_VERSION_STEAM_JP
            printFunction = ConsolePrint
            vars = require("KH2SteamJP")
            printFunction(baseVersionMessage .. "Detected Steam JP version")
        else
            printFunction(baseVersionMessage .. "KH2 not detected")
        end
    else
        printFunction(baseVersionMessage .. "KH2 not detected")
    end

    vars["gameVersion"] = gameVersion
    vars["canExecute"] = gameVersion ~= KH2_VERSION_UNKNOWN
     -- We could export other things too besides just addresses, if we have anything else common like functions
    vars["print"] = printFunction

    return vars
end

-- Return everything packaged up in a way that can be referenced by the script that imported this library
return checkVersion()
