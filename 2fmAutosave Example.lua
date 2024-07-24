local kh2lib = require("kh2lib")
kh2lib.requireLibraryVersion(1)
kh2lib.requirePCVersion()

local save1 = kh2lib.Save
local continue = kh2lib.Continue
local saveselect = kh2lib.SaveSelect
local sveAddr = kh2lib.SveAddr
local inputAddr = kh2lib.Input
local LoadingIndicator = kh2lib.LoadingIndicator
local loadmenu = kh2lib.LoadMenu
local writeLogic = kh2lib.WriteLogic

local canExecute = kh2lib.canExecute

local prevBlack = 0
local prevContinue = 0
local blacklist = {"es01", "bb05", "eh20", "eh22", "eh23", "eh24", "eh25", "eh26", "eh27", "eh28", "eh29"}
local blacklisted = false

function _OnInit()
    kh2lib.print("KH2 Auto Save 2.0.0 (Library Testing Edition)")
end

function _OnFrame()
    if not canExecute then
        return
    end

	SVE = ReadString(sveAddr, 4)
	for i = 1, 11 do
		if SVE ~= blacklist[i] then
		blacklisted = false
		end
	end
	for i = 1, 11 do
		if SVE == blacklist[i] then
		blacklisted = true
		end
	end
	if canExecute then
		local input = ReadInt(inputAddr)
		if input & 8192 == 8192 and ReadByte(loadmenu) == 0x03 then
			WriteFloat(LoadingIndicator, 90)
		end
		if (input & 8192 == 8192 and ReadInt(saveselect) == 0 and ReadInt(save1+0xC) ~= prevSave) then 
			local f = io.open("KH2autosave.dat", "rb")
			if f ~= nil then
				WriteString(save1, f:read("*a"))
				f:close()
				kh2lib.print("Loaded autosave")
			end
		end
		if ReadInt(continue+0xC) ~= prevContinue and ReadByte(writeLogic) == 0 and blacklisted == false then
			local f = io.open("KH2autosave.dat", "wb")
			f:write(ReadString(continue, 0x10FC0))
			f:close()
			kh2lib.print("Wrote autosave")
		end
		prevInput = input
		prevSave = ReadInt(save1+0xC)
		prevContinue = ReadInt(continue+0xC)
	end
end
