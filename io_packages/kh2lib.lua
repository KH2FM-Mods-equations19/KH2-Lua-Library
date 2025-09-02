-- Versioning both helps with troubleshooting and allows scripts to know what values they can expect.
-- In particular, this number should be incremented anytime new values are added to the library.
-- Library maintainers must take care to not remove values that were in previous versions, for backwards compatibility.
-- Scripts can declare a required version using `RequireKH2LibraryVersion(n)` where `n` is the expected minimum version.
KH2_LIBRARY_VERSION = 2

-- This represents the "full" version including any potential hotfix-type changes that wouldn't need to increment the
-- major version. It's meant for display purposes only to help with debugging/troubleshooting.
KH2_LIBRARY_DISPLAY_VERSION = "2.1"

-- Constants for each game version - scripts can check this using `GameVersion`
KH2_VERSION_UNKNOWN = 0x0000
KH2_VERSION_EMULATOR = 0x0100
KH2_VERSION_EPIC_1_0_0_9 = 0x0209
KH2_VERSION_STEAM_GLOBAL_1_0_0_9 = 0x0309
KH2_VERSION_STEAM_JP_1_0_0_9 = 0x0409
KH2_VERSION_EPIC_1_0_0_10 = 0x020A
KH2_VERSION_STEAM_1_0_0_10 = 0x030A

local kh2lib = {}

-- Scripts can call `RequireKH2LibraryVersion` to declare a minimum version of the library they expect.
-- If the actual version is too low, `CanExecute` will be set to false and a message is printed to the console.
function RequireKH2LibraryVersion(version)
    if KH2_LIBRARY_VERSION < version then
        local reqStr = tostring(version)
        local currStr = tostring(KH2_LIBRARY_VERSION)
        LogError("KH2 Lua Library v" .. reqStr .. " is required and your version is " .. currStr .. ", please update")
        kh2lib.CanExecute = false
    end
end

-- Scripts can call `RequirePCGameVersion` to declare that the script expects to run on PC ports only.
-- If not on a PC port, `CanExecute` will be set to false and a message is printed to the console.
function RequirePCGameVersion()
    if not kh2lib.OnPC then
        LogError("This script expects to run on one of the PC ports of the game and will not execute.")
        kh2lib.CanExecute = false
    end
end

-- Scripts can call `DenyGameVersions` to declare specific game version(s) that are known to not be compatible with the
-- script, perhaps due to not being able to find memory addresses for older game versions.
-- If the detected version is one of those, `CanExecute` will be set to false and a message is printed to the console.
function DenyGameVersions(...)
    local arg = {...}
    for _, version in pairs(arg) do
        if version == kh2lib.GameVersion then
            LogError("This script has declared that it will not run properly on the currently detected game version.")
            kh2lib.CanExecute = false
            return
        end
    end
end

-- Performs a bitwise `OR` of the value at a specified address using a specified mask and writes the updated byte.
-- This is usually used to set one or more bits in a byte to `1`.
function BitOr(address, mask)
    WriteByte(address, ReadByte(address) | mask)
end

-- Performs a bitwise `AND NOT` of the value at a specified address using a specified mask and writes the updated byte.
-- This is usually used to set one or more bits in a byte to `0`.
function BitNot(address, mask)
    WriteByte(address, ReadByte(address) & ~mask)
end

-- Reads and returns the pointer value at the given address.
function ReadPointer(address)
    if kh2lib.OnPC then
        return ReadLong(address)
    else
        return ReadInt(address)
    end
end

-- Logs a message to the console
function Log(message)
    ConsolePrint(tostring(message))
end

-- Logs a message to the console, with "MESSAGE: " prefix
function LogMessage(message)
    ConsolePrint(tostring(message), 0)
end

-- Logs a success message to the console
function LogSuccess(message)
    ConsolePrint(tostring(message), 1)
end

-- Logs a warning message to the console
function LogWarning(message)
    ConsolePrint(tostring(message), 2)
end

-- Logs an error message to the console
function LogError(message)
    ConsolePrint(tostring(message), 3)
end

local function _AddInventoryAddresses(table)
    local Save = table.Save

    -- Inventory Items (Byte)---------Value = "Save" + Offset---------------------
    table.Potion = Save + 0x3580
    table.HiPotion = Save + 0x3581
    table.Ether = Save + 0x3582
    table.Elixir = Save + 0x3583
    table.MegaPotion = Save + 0x3584
    table.MegaEther = Save + 0x3585
    table.MegaElixir = Save + 0x3586
    table.AbilityRing = Save + 0x3587
    table.EngineersRing = Save + 0x3588
    table.TechniciansRing = Save + 0x3589
    table.ExpertsRing = Save + 0x358A
    table.SardonyxRing = Save + 0x358B
    table.TourmalineRing = Save + 0x358C
    table.AquamarineRing = Save + 0x358D
    table.GarnetRing = Save + 0x358E
    table.DiamondRing = Save + 0x358F
    table.SilverRing = Save + 0x3590
    table.GoldRing = Save + 0x3591
    table.PlatinumRing = Save + 0x3592
    table.MythrilRing = Save + 0x3593
    table.Fire = Save + 0x3594
    table.Blizzard = Save + 0x3595
    table.Thunder = Save + 0x3596
    table.Cure = Save + 0x3597
    table.TornPage = Save + 0x3598
    table.OrichalcumRing = Save + 0x359A
    table.MastersRing = Save + 0x359B
    table.MoonAmulet = Save + 0x359C
    table.StarCharm = Save + 0x359E
    table.SkillRing = Save + 0x359F
    table.SkillfulRing = Save + 0x35A0
    table.KingdomKey = Save + 0x35A1
    table.Oathkeeper = Save + 0x35A2
    table.Oblivion = Save + 0x35A3
    table.DetectionSaber = Save + 0x35A4
    table.FrontierOfUltima = Save + 0x35A5
    table.SoldierEarring = Save + 0x35A6
    table.FencerEarring = Save + 0x35A7
    table.MageEarring = Save + 0x35A8
    table.KnightsShield = Save + 0x35A9
    table.DetectionShield = Save + 0x35AA
    table.TestTheKing = Save + 0x35AB
    table.SlayerEarring = Save + 0x35AC
    table.CosmicRing = Save + 0x35AD
    table.BattlefieldsOfWar = Save + 0x35AE
    table.SwordOfTheAncestor = Save + 0x35AF
    table.Medal = Save + 0x35B0
    table.CosmicArts = Save + 0x35B1
    table.ShadowArchive = Save + 0x35B2
    table.BeastsClaw = Save + 0x35B3
    table.BoneFist = Save + 0x35B4
    table.ProudFang = Save + 0x35B5
    table.SkillAndCrossbones = Save + 0x35B6
    table.ShadowArchivePlus = Save + 0x35B7
    table.LuckyRing = Save + 0x35B8
    table.FullBloom = Save + 0x35B9
    table.DrawRing = Save + 0x35BA
    table.FullBloomPlus = Save + 0x35BB
    table.ElvenBandanna = Save + 0x35BC
    table.DivineBandanna = Save + 0x35BD
    table.PowerBand = Save + 0x35BE
    table.Pureblood = Save + 0x35BF
    table.Scimitar = Save + 0x35C0
    table.WayToTheDawn = Save + 0x35C1
    table.IdentityDisk = Save + 0x35C2
    table.MagesStaff = Save + 0x35C3
    table.BusterBand = Save + 0x35C6
    table.ProtectBelt = Save + 0x35C7
    table.KingdomKeyD = Save + 0x35C9
    table.GaiaBelt = Save + 0x35CA
    table.Magnet = Save + 0x35CF
    table.Reflect = Save + 0x35D0
    table.CosmicBelt = Save + 0x35D1
    table.ShockCharm = Save + 0x35D2
    table.ShockCharmPlus = Save + 0x35D3
    table.GrandRibbon = Save + 0x35D4
    table.FireBangle = Save + 0x35D7
    table.FiraBangle = Save + 0x35D8
    table.FiragaBangle = Save + 0x35D9
    table.FiragunBangle = Save + 0x35DA
    table.BlizzardArmlet = Save + 0x35DC
    table.BlizzaraArmlet = Save + 0x35DD
    table.BlizzagaArmlet = Save + 0x35DE
    table.BlizzagunArmlet = Save + 0x35DF
    table.Tent = Save + 0x35E1
    table.ThunderTrinket = Save + 0x35E2
    table.ThundaraTrinket = Save + 0x35E3
    table.ThundagaTrinket = Save + 0x35E4
    table.ThundagunTrinket = Save + 0x35E5
    table.AdamantShield = Save + 0x35E6
    table.ChainGear = Save + 0x35E7
    table.OgreShield = Save + 0x35E8
    table.FallingStar = Save + 0x35E9
    table.Dreamcloud = Save + 0x35EA
    table.KnightDefender = Save + 0x35EB
    table.GenjiShield = Save + 0x35EC
    table.AkashicRecord = Save + 0x35ED
    table.NobodyGuard = Save + 0x35EE
    table.HammerStaff = Save + 0x35EF
    table.VictoryBell = Save + 0x35F0
    table.MeteorStaff = Save + 0x35F1
    table.CometStaff = Save + 0x35F2
    table.LordsBroom = Save + 0x35F3
    table.WisdomWand = Save + 0x35F4
    table.RisingDragon = Save + 0x35F5
    table.NobodyLance = Save + 0x35F6
    table.ShamansRelic = Save + 0x35F7
    table.ShadowAnklet = Save + 0x35F9
    table.StaffOfDetection = Save + 0x35FA
    table.DarkAnklet = Save + 0x35FB
    table.MidnightAnklet = Save + 0x35FC
    table.ChaosAnklet = Save + 0x35FD
    table.AbasChain = Save + 0x35FF
    table.AegisChain = Save + 0x3600
    table.Acrisius = Save + 0x3601
    table.Ribbon = Save + 0x3602
    table.ChampionBelt = Save + 0x3603
    table.PetiteRibbon = Save + 0x3604
    table.AcrisiusPlus = Save + 0x3605
    table.CosmicChain = Save + 0x3606
    table.BlazingShard = Save + 0x360F
    table.BlazingStone = Save + 0x3610
    table.BlazingGem = Save + 0x3611
    table.BlazingCrystal = Save + 0x3612
    table.LightningShard = Save + 0x3617
    table.LightningStone = Save + 0x3618
    table.LightningGem = Save + 0x3619
    table.LightningCrystal = Save + 0x361A
    table.PowerShard = Save + 0x361B
    table.PowerStone = Save + 0x361C
    table.PowerGem = Save + 0x361D
    table.PowerCrystal = Save + 0x361E
    table.LucidShard = Save + 0x361F
    table.LucidStone = Save + 0x3620
    table.LucidGem = Save + 0x3621
    table.LucidCrystal = Save + 0x3622
    table.DenseShard = Save + 0x3623
    table.DenseStone = Save + 0x3624
    table.DenseGem = Save + 0x3625
    table.DenseCrystal = Save + 0x3626
    table.TwilightShard = Save + 0x3627
    table.TwilightStone = Save + 0x3628
    table.TwilightGem = Save + 0x3629
    table.TwilightCrystal = Save + 0x362A
    table.MythrilShard = Save + 0x362B
    table.MythrilStone = Save + 0x362C
    table.MythrilGem = Save + 0x362D
    table.MythrilCrystal = Save + 0x362E
    table.BrightShard = Save + 0x362F
    table.BrightStone = Save + 0x3630
    table.BrightGem = Save + 0x3631
    table.BrightCrystal = Save + 0x3632
    table.EnergyShard = Save + 0x3633
    table.EnergyStone = Save + 0x3634
    table.EnergyGem = Save + 0x3635
    table.EnergyCrystal = Save + 0x3636
    table.SerenityShard = Save + 0x3637
    table.SerenityStone = Save + 0x3638
    table.SerenityGem = Save + 0x3639
    table.SerenityCrystal = Save + 0x363A
    table.OrichalcumPlus = Save + 0x363B
    table.MunnyPouchOlette = Save + 0x363C
    table.CrystalOrb = Save + 0x363D
    table.SeifersTrophy = Save + 0x363E
    table.TournamentPoster = Save + 0x363F
    table.Poster = Save + 0x3640
    table.Letter = Save + 0x3641
    table.NaminesSketches = Save + 0x3642
    table.MembershipCard = Save + 0x3643
    table.OlympusStone = Save + 0x3644
    table.AuronsStatue = Save + 0x3645
    table.CursedMedallion = Save + 0x3646
    table.Present = Save + 0x3647
    table.DecoyPresents = Save + 0x3648
    table.IceCream = Save + 0x3649
    table.Picture = Save + 0x364A
    table.Orichalcum = Save + 0x364B
    table.FrostShard = Save + 0x364C
    table.FrostStone = Save + 0x364D
    table.FrostGem = Save + 0x364E
    table.FrostCrystal = Save + 0x364F
    table.MegaRecipe = Save + 0x3650
    table.StruggleSword = Save + 0x3651 -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
    table.StarRecipe = Save + 0x3652
    table.RecoveryRecipe = Save + 0x3653
    table.SkillRecipe = Save + 0x3654
    table.GuardRecipe = Save + 0x3655
    table.Dummy13 = Save + 0x365D -- GoA uses this for Royal Summons
    table.Dummy16 = Save + 0x3660 -- GoA uses this for Gained Item Slot
    table.RoadToDiscovery = Save + 0x3661
    table.StrengthBeyondStrength = Save + 0x3662
    table.BookOfShadows = Save + 0x3663
    table.DriveRecovery = Save + 0x3664
    table.HighDriveRecovery = Save + 0x3665
    table.PowerBoost = Save + 0x3666
    table.MagicBoost = Save + 0x3667
    table.DefenseBoost = Save + 0x3668
    table.APBoost = Save + 0x3669
    table.DarkShard = Save + 0x366A
    table.DarkStone = Save + 0x366B
    table.DarkGem = Save + 0x366C
    table.DarkCrystal = Save + 0x366D
    table.CloakedThunder = Save + 0x366E
    table.EternalBlossom = Save + 0x366F
    table.RareDocument = Save + 0x3670
    table.Dummy23 = Save + 0x3671 -- GoA uses this for Maximum HP Increased
    table.Dummy24 = Save + 0x3672 -- GoA uses this for Maximum MP Increased
    table.Dummy25 = Save + 0x3673 -- GoA uses this for Drive Gauge Powered Up
    table.Dummy26 = Save + 0x3674 -- GoA uses this for Gained Armor Slot
    table.Dummy27 = Save + 0x3675 -- GoA uses this for Gained Accessory Slot
    table.StyleRecipe = Save + 0x3676
    table.MoonRecipe = Save + 0x3677
    table.QueenRecipe = Save + 0x3678
    table.KingRecipe = Save + 0x3679
    table.UltimateRecipe = Save + 0x367A
    table.StarSeeker = Save + 0x367B
    table.HiddenDragon = Save + 0x367C
    table.SaveTheQueen = Save + 0x367D
    table.SaveTheKing = Save + 0x367E
    table.HerosCrest = Save + 0x367F
    table.Monochrome = Save + 0x3680
    table.FollowTheWind = Save + 0x3681
    table.CircleOfLife = Save + 0x3682
    table.PhotonDebugger = Save + 0x3683
    table.GullWing = Save + 0x3684
    table.RumblingRose = Save + 0x3685
    table.GuardianSoul = Save + 0x3686
    table.WishingLamp = Save + 0x3687
    table.DecisivePumpkin = Save + 0x3688
    table.SleepingLion = Save + 0x3689
    table.SweetMemories = Save + 0x368A
    table.MysteriousAbyss = Save + 0x368B
    table.FatalCrest = Save + 0x368C
    table.BondOfFlame = Save + 0x368D
    table.Fenrir = Save + 0x368E
    table.UltimaWeapon = Save + 0x368F
    table.StruggleWand = Save + 0x3690 -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
    table.StruggleHammer = Save + 0x3691 -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
    table.SaveTheQueenPlus = Save + 0x3692
    table.SaveTheKingPlus = Save + 0x3693
    table.PromiseCharm = Save + 0x3694
    table.MunnyPouchMickey = Save + 0x3695
    table.HadesCupTrophy = Save + 0x3696
    table.TheStruggleTrophy = Save + 0x3697
    table.TwoBecomeOne = Save + 0x3698
    table.WinnersProof = Save + 0x3699
    table.Centurion = Save + 0x369A
    table.CenturionPlus = Save + 0x369B
    table.PlainMushroom = Save + 0x369C
    table.PlainMushroomPlus = Save + 0x369D
    table.PreciousMushroom = Save + 0x369E
    table.PreciousMushroomPlus = Save + 0x369F
    table.PremiumMushroom = Save + 0x36A0
    table.FrozenPride = Save + 0x36A1
    table.FrozenPridePlus = Save + 0x36A2
    table.JoyousMushroom = Save + 0x36A3
    table.JoyousMushroomPlus = Save + 0x36A4
    table.MajesticMushroom = Save + 0x36A5
    table.MajesticMushroomPlus = Save + 0x36A6
    table.UltimateMushroom = Save + 0x36A7
    table.RemembranceShard = Save + 0x36A8
    table.RemembranceStone = Save + 0x36A9
    table.RemembranceGem = Save + 0x36AA
    table.RemembranceCrystal = Save + 0x36AB
    table.TranquilityShard = Save + 0x36AC
    table.TranquilityStone = Save + 0x36AD
    table.TranquilityGem = Save + 0x36AE
    table.TranquilityCrystal = Save + 0x36AF
    table.LostIllusion = Save + 0x36B0
    table.ManifestIllusion = Save + 0x36B1
    table.ProofOfConnection = Save + 0x36B2
    table.ProofOfNonexistence = Save + 0x36B3
    table.ProofOfPeace = Save + 0x36B4
    table.ExecutivesRing = Save + 0x36B5
    table.ShamansRelicPlus = Save + 0x36B6
    table.AkashicRecordPlus = Save + 0x36B7
    -- Bitmask Inventory Items (Byte)
    -- Add the value of the items you want to add to inventory. ie: Having valor and wisdom form would be 0x6. Only wisdom form and baseball charm would be 0x12, etc ----
    table.ItemSet1 = Save + 0x36C0 -- (1)Ukulele Charm, (2)Valor Form, (4)Wisdom Form, (8)Baseball Charm, (10)Final Form, (20)Anti Form, (40)Master Form, (80)Navigational Map
    table.ItemSet2 = Save + 0x36C1 -- (1)Castle Map, (2)Basement Map, (4)Castle Walls Map, (20)The Interceptor Map, (40)Encampment Area Map, (80)Village Area Map
    table.ItemSet3 = Save + 0x36C2 -- (1)Cornerstone Hill Map, (2)Windows of Time Map 2, (4)Lilliput Map, (8)Building Site Map, (10)Mickey's House Map, (20)Disney Castle Map, (40)Agrabah Map, (80)Cave of Wonders Map
    table.ItemSet4 = Save + 0x36C3 -- (1)Ruins Map, (2)Undersea Kingdom Map, (4)Starry Hill Map, (8)100 Acre Wood Map, (10)Rabbit's Howse Map, (20)Piglet's Howse Map, (40)Kanga's Howse Map, (80)Spooky Cave Map
    table.ItemSet5 = Save + 0x36C4 -- (1)Palace Map, (2)Coliseum Map, (4)Underworld Map, (8)Caverns Map, (10)Lamp Charm, (20)Feather Charm, (40)Report 1, (80)Report 2
    table.ItemSet6 = Save + 0x36C5 -- (1)Report 3, (2)Report 4, (4)Report 5, (8)Report 6, (10)Report 7, (20)Report 8, (40)Report 9, (80)Report 10
    table.ItemSet7 = Save + 0x36C6 -- (1)Report 11, (2)Report 12, (4)Report 13
    table.ItemSet8 = Save + 0x36C7 -- (4)Halloween Town Map, (8)Naval Map, (10)Pride Rock Map, (20)Marketplace Map, (40)Pit Cell Area Map, (80)Twilight Town Map
    table.ItemSet9 = Save + 0x36C8 -- (1)Dark City Map, (2)The Black Pearl Map, (4)Isla de Muerta Map, (8)Ship Graveyard Map, (10)Christmas Town Map, (20)Curly Hill Map, (40)Oasis Map, (80)Savannah Map
    table.ItemSet10 = Save + 0x36C9 -- (1)Castle Perimeter Map, (2)The Great Maw Map, (4)I/O Tower Map, (8)Central Computer Core Map, (10)Solar Sailer Simulation Map, (20)Windows of Time Map, (40)Sunset Hill Map, (80)Mansion Map
    table.ItemSet11 = Save + 0x36CA -- (1)Tower Map, (2)DH Map, (4)Castle that Never Was Map, (8)Limit Form, (10)Dark Remembrance Map, (20)Depths of Remembrance Map, (80)Garden of Assemblage Map
end

local function _InitLibrary()
    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then
        kh2lib = require("kh2lib.Emulator")
        kh2lib.GameVersion = KH2_VERSION_EMULATOR
        kh2lib.OnPC = false
        kh2lib.CanExecute = true
    elseif GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then -- PC
        if ReadByte(0x566A8E) == 0xFF then
            kh2lib = require("kh2lib.EpicGlobal-1_0_0_9")
            kh2lib.GameVersion = KH2_VERSION_EPIC_1_0_0_9
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x56668E) == 0xFF then
            kh2lib = require("kh2lib.SteamGlobal-1_0_0_9")
            kh2lib.GameVersion = KH2_VERSION_STEAM_GLOBAL_1_0_0_9
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x56640E) == 0xFF then
            kh2lib = require("kh2lib.SteamJP-1_0_0_9")
            kh2lib.GameVersion = KH2_VERSION_STEAM_JP_1_0_0_9
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x660E44) == 106 then
            kh2lib = require("kh2lib.EpicShared-1_0_0_10")
            kh2lib.GameVersion = KH2_VERSION_EPIC_1_0_0_10
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x660EF4) == 106 then
            -- Steam Global
            kh2lib = require("kh2lib.SteamShared-1_0_0_10")
            kh2lib.GameVersion = KH2_VERSION_STEAM_1_0_0_10
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x660E74) == 106 then
            -- Steam JP (different address for detection but the other addresses are shared)
            kh2lib = require("kh2lib.SteamShared-1_0_0_10")
            kh2lib.GameVersion = KH2_VERSION_STEAM_1_0_0_10
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        else
            kh2lib.GameVersion = KH2_VERSION_UNKNOWN
            kh2lib.OnPC = true
            kh2lib.CanExecute = false
            LogError("KH2 Lua Library - KH2 PC detected, but is a version not currently supported")
        end
    else
        kh2lib.GameVersion = KH2_VERSION_UNKNOWN
        kh2lib.OnPC = false
        kh2lib.CanExecute = false
        LogError("KH2 Lua Library - KH2 not detected")
    end

    if kh2lib.CanExecute then
        _AddInventoryAddresses(kh2lib)
    end

    return kh2lib
end

-- Return everything packaged up in a way that can be referenced by the script that imported this library
return _InitLibrary()
