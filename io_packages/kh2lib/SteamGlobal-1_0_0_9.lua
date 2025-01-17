local function _ShowAllItemsInShops()
    WriteByte(0x2FB566,0)
end

return {
    GameVersionString = "Steam Global 1.0.0.9",
    Now = 0x0717008,
    Sve = 0x2A0C4C0,
    Save = 0x09A9830,
    Obj0Pointer = 0x2A24FB0,
    Sys3Pointer = 0x2AE5DD0,
    Btl0Pointer = 0x2AE5DD8,
    ARDPointer = 0x2A0F7A8,
    Music = 0x0ABACC4,
    Pause = 0x0ABB7F8,
    React = 0x2A110E2,
    Cntrl = 0x2A17168,
    Timer = 0x0ABB7D0,
    Songs = 0x0B65CF4,
    SongExcellentChainScore = 0x0B65CF8,
    SwimThisWayScore = 0x0B65D04,
    GScre = 0x072B130,
    GMdal = 0x072B2C4,
    GKill = 0x0AF70C6,
    CamTyp = 0x0718CA8,
    GamSpd = 0x0717424,
    CutNow = 0x0B64F18,
    CutLen = 0x0B64F34,
    CutSkp = 0x0B64F1C,
    BtlTyp = 0x2A11384,
    BtlEnd = 0x2A0FC60,
    TxtBox = 0x074DF20,
    DemCln = 0x2A0F834,
    Slot1    = 0x2A23518,
    NextSlot = 0x278,
    Point1   = 0x2A0F9C8,
    NxtPoint = 0x50,
    Gauge1   = 0x2A0FAB8,
    NxtGauge = 0x48,
    Menu1    = 0x2A11090,
    NextMenu = 0x8,
    MSN = 0x0BF3340,
    Input = 0xBF3120,
    SoftReset = 0xABABDA,
    RNG = 0x7535C0,
    Spawns = 0x2AE5CF8,
    Continue = 0x29FB500,
    SaveSelect = 0x2617460,
    SveAddr = 0x9BA8B0,
    LoadingIndicator = 0x8EC540,
    CurrentOpenMenu = 0x7435D0,
    WriteLogic = 0x7134A0,
    HBBGM = 0x2A6993C,
    ARDEvent = 0x29C571E,
    GummiSkip = 0x9AD827,
    ShowAllItemsInShopsFunction = _ShowAllItemsInShops,
}
