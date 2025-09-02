function _OnInit()
    kh2libstatus, kh2lib = pcall(require, "kh2lib")
    if not kh2libstatus then
        ConsolePrint("KH2-Lua-Library mod is not installed or failed to initialize", 3)
        ConsolePrint(kh2lib, 3)
        CanExecute = false
        return
    end

    CanExecute = kh2lib.CanExecute
    if not CanExecute then
        return
    end

    Log("#####################################################")
    Log("# KH2 Lua Library, version " .. KH2_LIBRARY_DISPLAY_VERSION)
    Log("# Using addresses for " .. kh2lib.GameVersionString)
    Log("#####################################################")
end

function _OnFrame()

end
