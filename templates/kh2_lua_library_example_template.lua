LUA_NAME = '' -- Your mod's name

local kh2lib_status, kh2lib, can_execute

function _OnInit()
    kh2lib_status, kh2lib = pcall(require, 'kh2lib')
    if not kh2lib_status then
        ConsolePrint('KH2-Lua-Library mod is not installed', 3)
        can_execute = false
        return
    end

    Log('My Script 1.0.0')
    RequireKH2LibraryVersion(1)
    -- RequirePCGameVersion()

    can_execute = kh2lib.CanExecute
    if not can_execute then
        return
    end

    -- (your code here)
end

function _OnFrame()
    if not can_execute then
        return
    end

    -- (your code here)
end
