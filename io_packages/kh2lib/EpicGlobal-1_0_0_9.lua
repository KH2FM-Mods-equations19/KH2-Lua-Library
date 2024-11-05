local function _ShowAllItemsInShops()
    if ReadLong(0x2FAA22) == 0x43B70F0D74D68541 then --Epic Global 1.0.0.9
        WriteByte(0x2FAA26,0)
    elseif ReadLong(0x2FA682) == 0x43B70F0D74D68541 then --Epic JP 1.0.0.9
        WriteByte(0x2FA686,0)
    end
end

return {
    GameVersionString = "Epic Games Global 1.0.0.9",
    Now = 0x0716DF8,
    Sve = 0x2A0BF80,
    Save = 0x09A92F0,
    Obj0Pointer = 0x2A24A70,
    Sys3Pointer = 0x2AE5890,
    Btl0Pointer = 0x2AE5898,
    ARDPointer = 0x2A0F268,
    Music = 0x0ABA784,
    Pause = 0x0ABB2B8,
    React = 0x2A10BA2,
    Cntrl = 0x2A16C28,
    Timer = 0x0ABB290,
    Songs = 0x0B657B4,
    SongExcellentChainScore = 0x0B657B8,
    SwimThisWayScore = 0x0B657C4,
    GScre = 0x072AEB0,
    GMdal = 0x072B044,
    GKill = 0x0AF6B86,
    CamTyp = 0x0718A98,
    GamSpd = 0x0717214,
    CutNow = 0x0B649D8,
    CutLen = 0x0B649F4,
    CutSkp = 0x0B649DC,
    BtlTyp = 0x2A10E44,
    BtlEnd = 0x2A0F720,
    TxtBox = 0x074DCB0,
    DemCln = 0x2A0F2F4,
    Slot1    = 0x2A22FD8,
    NextSlot = 0x278,
    Point1   = 0x2A0F488,
    NxtPoint = 0x50,
    Gauge1   = 0x2A0F578,
    NxtGauge = 0x48,
    Menu1    = 0x2A10B50,
    NextMenu = 0x8,
    MSN = 0x0BF2C40,
    Input = 0x29FAD30,
    SoftReset = 0xABA69A,
    RNG = 0x753350,
    Spawns = 0x2AE57B8,
    Continue = 0x29FAFC0,
    SaveSelect = 0x2616D60,
    SveAddr = 0x9BA370,
    LoadingIndicator = 0x8EBFF0,
    CurrentOpenMenu = 0x743350,
    WriteLogic = 0x713438,
    HBBGM = 0x2A693FC,
    ARDEvent = 0x29C501E,
    GummiSkip = 0x9AD2E7,
    ShowAllItemsInShopsFunction = _ShowAllItemsInShops,
}