-- TODO: Document each property and in what version they were added
-- in the /docs/reference files, then delete this file

local function _ShowAllItemsInShops()

end

return {
    -- User-friendly name of the game version
    GameVersionString = '',

    -- Lua Library Version 1 ----------------------------------------------------------------

    -- Current Location
    Now = 0x0000000,

    -- Saved Location
    Sve = 0x0000000,

    -- Save File
    Save = 0x0000000,

    -- 00objentry.bin Pointer Address
    Obj0Pointer = 0x0000000,

    -- 03system.bin Pointer Address
    Sys3Pointer = 0x0000000,

    -- 00battle.bin Pointer Address
    Btl0Pointer = 0x0000000,

    -- ARD Pointer Address
    ARDPointer = 0x0000000,

    -- Background Music
    Music = 0x0000000,

    -- Ability to Pause
    -- `0x00` = pause enabled
    -- `0x01` = paused
    -- `0x02` = pause disabled
    -- `0x03` = menu
    -- `0x04` = dying
    -- `0x05` = continue screen
    Pause = 0x0000000,

    -- Reaction Command
    React = 0x0000000,

    -- Sora Controllable
    Cntrl = 0x0000000,

    Timer = 0x0000000,

    -- Atlantica Stuff (number of points obtained in a song)
    Songs = 0x0000000,

    -- Highest number of "excellents" in a row (resets for each song)
    -- (This has usually been just Songs + 0x04)
    SongExcellentChainScore = 0x0000000,

    -- Notes needed to clear "Swim This Way" (starts at 5 and counts down to 0 or counts up for misses)
    -- (This has usually been just Songs + 0x10)
    SwimThisWayScore = 0x0000000,

    -- Gummi Score
    GScre = 0x0000000,

    -- Gummi Medal
    GMdal = 0x0000000,

    -- Gummi Kills
    GKill = 0x0000000,

    -- Camera Type
    CamTyp = 0x0000000,

    -- Game Speed
    GamSpd = 0x0000000,

    -- Cutscene Timer
    CutNow = 0x0000000,

    -- Cutscene Length
    CutLen = 0x0000000,

    -- Cutscene Skip
    CutSkp = 0x0000000,

    -- Battle Status (Out-of-Battle, Regular, Forced)
    BtlTyp = 0x0000000,

    -- End-of-Battle camera & signal
    BtlEnd = 0x0000000,

    -- Last Displayed Textbox
    TxtBox = 0x0000000,

    -- Demyx Clone Status (might have to do with other mission status/signal?)
    DemCln = 0x0000000,

    -- Unit Slot 1
    Slot1 = 0x0000000,

    NextSlot = 0x0000000,

    -- Hunny Slider HP (probably used by other minigames?)
    Point1 = 0x0000000,

    NxtPoint = 0x0000000,

    Gauge1 = 0x0000000,

    NxtGauge = 0x0000000,

    -- Menu 1 (main command menu)
    Menu1 = 0x0000000,

    NextMenu = 0x0000000,

    MSN = 0x0000000,

    Input = 0x0000000,

    SoftReset = 0x0000000,

    RNG = 0x0000000,

    Spawns = 0x0000000,

    Continue = 0x0000000,

    SaveSelect = 0x0000000,

    -- (Also known as autoSaveAddress in some scripts)
    SveAddr = 0x0000000,

    LoadingIndicator = 0x0000000,

    -- Currently open menu
    -- `0xFF` = none
    -- `0x01` = save
    -- `0x03` = load
    -- `0x05` = moogle
    -- `0x07` = item popup
    -- `0x08` = pause (cutscene/fight)
    -- `0x0A` = pause (normal)
    CurrentOpenMenu = 0x0000000,

    WriteLogic = 0x0000000,

    -- Lua Library Version 2 ----------------------------------------------------------------

    GummiSkip = 0x0000000,

    -- Show all items in shops (ASSEMBLY edit)
    -- (This is actually a function reference since various versions need to do different things)
    ShowAllItemsInShopsFunction = _ShowAllItemsInShops,

    -- Lua Library Version 3 ----------------------------------------------------------------

    -- See /docs/reference/constants/README.md
    _constants = {},
    worlds = {},
    rooms = {},
    events = {},
    current = {},

}
