LUAGUI_NAME = "KH2 Lua Library Example Commented"
LUAGUI_AUTH = "Alios"
LUAGUI_DESC = "An example Lua script for learning how to use the KH2 Lua Library"

local kh2lib = require("kh2lib") -- Detects game version and populates the kh2lib table
kh2lib.requireLibraryVersion(1) -- Declares the minimum version of the library required by this script

-- Local slots for things we want to use frequently
-- TODO: Maybe premature optimization, but for something done on every frame could be warranted?
local canExecute = kh2lib.canExecute
local Now = kh2lib.Now
local Save = kh2lib.Save

function _OnInit() -- Runs during game initialization, only once
    kh2lib.print("Example script 1.0.0") -- Using kh2lib.print() will use an appropriate print call per platform
end

function _OnFrame() -- Runs once per frame, game will wait for code to finish before proceeding to next frame
    if not canExecute then -- Only allows code to run if a game version is detected
        return
    end

    -- (Space Paranoids Post-Story Save code pulled from GoA Lua):
	PrevPlace = ReadShort(Now + 0x30)
	if ReadByte(Save + 0x1EBE) > 0 then
		if PrevPlace == 0x0011 then
			WriteByte(Save + 0x1EBE, 1)
		elseif PrevPlace == 0x0511 then
			WriteByte(Save + 0x1EBE, 2)
		elseif PrevPlace == 0x0811 then
			WriteByte(Save + 0x1EBE, 3)
		end
	end
end
