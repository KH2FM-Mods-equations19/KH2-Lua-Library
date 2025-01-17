LUAGUI_NAME = "KH2 Lua Library Example Commented"
LUAGUI_AUTH = "Alios"
LUAGUI_DESC = "An example Lua script for learning how to use the KH2 Lua Library"

function _OnInit() -- Runs during game initialization, only once
    kh2libstatus, kh2lib = pcall(require, "kh2lib") -- Imports the KH2 Lua Library, detects game version, and populates the `kh2lib` table
    if not kh2libstatus then -- Checks if there was an error loading the library
        print("ERROR (Example Script): KH2-Lua-Library mod is not installed") -- Try to report as meaningful of an error as possible
        CanExecute = false -- Definitely can't execute if the library is missing
        return
    end

    Log("Example script 1.0.0") -- Using Log() will use an appropriate console print call per platform
    RequireKH2LibraryVersion(1) -- Declares the minimum version of the library required by this script
    RequirePCGameVersion() -- Declares that this script was only written for the PC ports of KH2 (optional)

    CanExecute = kh2lib.CanExecute -- The library sets this to false if any conditions declared above were not met
    if not CanExecute then
        return
    end

    -- Can do this if desired to reduce noise in code later, or can reference these as `kh2lib.whatever` as needed
    -- (either way should work)
    Now = kh2lib.Now
    Save = kh2lib.Save
end

function _OnFrame() -- Runs once per frame, game will wait for code to finish before proceeding to next frame
    -- Only allows code to run if required conditions were met
    if not CanExecute then
        return
    end

    -- (Space Paranoids Post-Story Save code pulled from GoA Lua):
    local PrevPlace = ReadShort(Now + 0x30)
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
