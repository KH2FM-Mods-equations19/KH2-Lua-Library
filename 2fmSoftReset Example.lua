local kh2lib = require("kh2lib")
kh2lib.requireLibraryVersion(1)

local canExecute = kh2lib.canExecute
local Input = kh2lib.Input
local SoftReset = kh2lib.SoftReset
local RNG = kh2lib.RNG
local Spawns = kh2lib.Spawns

function _OnInit()
    kh2lib.print("KH2 Soft Reset")
end

function _OnFrame()
	if not canExecute then
		return
	end

	if ReadInt(Input) == 247042 then
		WriteByte(SoftReset, 1)
		WriteInt(RNG, 0x00000001)
		WriteByte(Spawns, 0)
	end
end
