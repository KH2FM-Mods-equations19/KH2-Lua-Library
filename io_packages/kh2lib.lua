-- Versioning both helps with troubleshooting and allows scripts to know what values they can expect.
-- In particular, this number should be incremented anytime new values are added to the library.
-- Library maintainers must take care to not remove values that were in previous versions, for backwards compatibility.
-- Scripts can declare a required version using `RequireKH2LibraryVersion(n)` where `n` is the expected minimum version.
KH2_LIBRARY_VERSION = 3

-- This represents the "full" version including any potential hotfix-type changes that wouldn't need to increment the
-- major version. It's meant for display purposes only to help with debugging/troubleshooting.
KH2_LIBRARY_DISPLAY_VERSION = '3.0.0'

-- Constants for each game version - scripts can check this using `GameVersion`

-- Unknown game version
KH2_VERSION_UNKNOWN = 0x0000
-- PCSX2 emulator
KH2_VERSION_EMULATOR = 0x0100
-- Epic Games 1.0.0.9
KH2_VERSION_EPIC_1_0_0_9 = 0x0209
-- Steam Global 1.0.0.9
KH2_VERSION_STEAM_GLOBAL_1_0_0_9 = 0x0309
-- Steam JP 1.0.0.9
KH2_VERSION_STEAM_JP_1_0_0_9 = 0x0409
-- Epic Games 1.0.0.10
KH2_VERSION_EPIC_1_0_0_10 = 0x020A
-- Steam 1.0.0.10
KH2_VERSION_STEAM_1_0_0_10 = 0x030A

--- KH2 Lua Library (KH2Lib)
--- @class (exact) KH2Lib:LegacyKH2Lib
--- @field worlds WorldsLUT
--- @field rooms RoomsLUT
--- @field events EventsLUT
--- @field current table
--- @field private _constants table
local kh2lib = {}

--- Scripts can call `RequireKH2LibraryVersion` to declare a minimum version of the library they expect.
--- If the actual version is too low, `CanExecute` will be set to false and a message is printed to the console.
--- @param version integer required version
function RequireKH2LibraryVersion(version)
    if KH2_LIBRARY_VERSION < version then
        local reqStr = tostring(version)
        local currStr = tostring(KH2_LIBRARY_VERSION)
        LogError('KH2 Lua Library v' .. reqStr .. ' is required and your version is ' .. currStr .. ', please update')
        kh2lib.CanExecute = false
    end
end

--- Scripts can call `RequirePCGameVersion` to declare that the script expects to run on PC ports only.
--- If not on a PC port, `CanExecute` will be set to false and a message is printed to the console.
function RequirePCGameVersion()
    if not kh2lib.OnPC then
        LogError('This script expects to run on one of the PC ports of the game and will not execute.')
        kh2lib.CanExecute = false
    end
end

--- Scripts can call `DenyGameVersions` to declare specific game version(s) that are known to not be compatible with the
--- script, perhaps due to not being able to find memory addresses for older game versions.
--- If the detected version is one of those, `CanExecute` will be set to false and a message is printed to the console.
--- @param ... table list of required versions, as additional arguments
function DenyGameVersions(...)
    local arg = { ... }
    for _, version in pairs(arg) do
        if version == kh2lib.GameVersion then
            LogError('This script has declared that it will not run properly on the currently detected game version.')
            kh2lib.CanExecute = false
            return
        end
    end
end

--- Performs a bitwise `OR` of the value at a specified address using a specified mask and writes the updated byte.
--- This is usually used to set one or more bits in a byte to `1`.
--- @param address number
--- @param mask number
function BitOr(address, mask)
    WriteByte(address, ReadByte(address) | mask)
end

--- Performs a bitwise `AND NOT` of the value at a specified address using a specified mask and writes the updated byte.
--- This is usually used to set one or more bits in a byte to `0`.
--- @param address number
--- @param mask number
function BitNot(address, mask)
    WriteByte(address, ReadByte(address) & ~mask)
end

--- Reads and returns the pointer value at the given address.
--- @param address number
function ReadPointer(address)
    if kh2lib.OnPC then
        return ReadLong(address)
    else
        return ReadInt(address)
    end
end

--- Logs a message to the console
--- @param message any
function Log(message)
    ConsolePrint(tostring(message))
end

--- Logs a message to the console, with "MESSAGE: " prefix
--- @param message any
function LogMessage(message)
    ConsolePrint(tostring(message), 0)
end

--- Logs a success message to the console
--- @param message any
function LogSuccess(message)
    ConsolePrint(tostring(message), 1)
end

--- Logs a warning message to the console
--- @param message any
function LogWarning(message)
    ConsolePrint(tostring(message), 2)
end

--- Logs an error message to the console
--- @param message any
function LogError(message)
    ConsolePrint(tostring(message), 3)
end

--- @deprecated
local function _legacy_add_inventory_addresses()
    local Save = kh2lib.Save

    -- Inventory Items (Byte)---------Value = "Save" + Offset---------------------

    kh2lib.Potion = Save + 0x3580
    kh2lib.HiPotion = Save + 0x3581
    kh2lib.Ether = Save + 0x3582
    kh2lib.Elixir = Save + 0x3583
    kh2lib.MegaPotion = Save + 0x3584
    kh2lib.MegaEther = Save + 0x3585
    kh2lib.MegaElixir = Save + 0x3586
    kh2lib.AbilityRing = Save + 0x3587
    kh2lib.EngineersRing = Save + 0x3588
    kh2lib.TechniciansRing = Save + 0x3589
    kh2lib.ExpertsRing = Save + 0x358A
    kh2lib.SardonyxRing = Save + 0x358B
    kh2lib.TourmalineRing = Save + 0x358C
    kh2lib.AquamarineRing = Save + 0x358D
    kh2lib.GarnetRing = Save + 0x358E
    kh2lib.DiamondRing = Save + 0x358F
    kh2lib.SilverRing = Save + 0x3590
    kh2lib.GoldRing = Save + 0x3591
    kh2lib.PlatinumRing = Save + 0x3592
    kh2lib.MythrilRing = Save + 0x3593
    kh2lib.Fire = Save + 0x3594
    kh2lib.Blizzard = Save + 0x3595
    kh2lib.Thunder = Save + 0x3596
    kh2lib.Cure = Save + 0x3597
    kh2lib.TornPage = Save + 0x3598
    kh2lib.OrichalcumRing = Save + 0x359A
    kh2lib.MastersRing = Save + 0x359B
    kh2lib.MoonAmulet = Save + 0x359C
    kh2lib.StarCharm = Save + 0x359E
    kh2lib.SkillRing = Save + 0x359F
    kh2lib.SkillfulRing = Save + 0x35A0
    kh2lib.KingdomKey = Save + 0x35A1
    kh2lib.Oathkeeper = Save + 0x35A2
    kh2lib.Oblivion = Save + 0x35A3
    kh2lib.DetectionSaber = Save + 0x35A4
    kh2lib.FrontierOfUltima = Save + 0x35A5
    kh2lib.SoldierEarring = Save + 0x35A6
    kh2lib.FencerEarring = Save + 0x35A7
    kh2lib.MageEarring = Save + 0x35A8
    kh2lib.KnightsShield = Save + 0x35A9
    kh2lib.DetectionShield = Save + 0x35AA
    kh2lib.TestTheKing = Save + 0x35AB
    kh2lib.SlayerEarring = Save + 0x35AC
    kh2lib.CosmicRing = Save + 0x35AD
    kh2lib.BattlefieldsOfWar = Save + 0x35AE
    kh2lib.SwordOfTheAncestor = Save + 0x35AF
    kh2lib.Medal = Save + 0x35B0
    kh2lib.CosmicArts = Save + 0x35B1
    kh2lib.ShadowArchive = Save + 0x35B2
    kh2lib.BeastsClaw = Save + 0x35B3
    kh2lib.BoneFist = Save + 0x35B4
    kh2lib.ProudFang = Save + 0x35B5
    kh2lib.SkillAndCrossbones = Save + 0x35B6
    kh2lib.ShadowArchivePlus = Save + 0x35B7
    kh2lib.LuckyRing = Save + 0x35B8
    kh2lib.FullBloom = Save + 0x35B9
    kh2lib.DrawRing = Save + 0x35BA
    kh2lib.FullBloomPlus = Save + 0x35BB
    kh2lib.ElvenBandanna = Save + 0x35BC
    kh2lib.DivineBandanna = Save + 0x35BD
    kh2lib.PowerBand = Save + 0x35BE
    kh2lib.Pureblood = Save + 0x35BF
    kh2lib.Scimitar = Save + 0x35C0
    kh2lib.WayToTheDawn = Save + 0x35C1
    kh2lib.IdentityDisk = Save + 0x35C2
    kh2lib.MagesStaff = Save + 0x35C3
    kh2lib.BusterBand = Save + 0x35C6
    kh2lib.ProtectBelt = Save + 0x35C7
    kh2lib.KingdomKeyD = Save + 0x35C9
    kh2lib.GaiaBelt = Save + 0x35CA
    kh2lib.Magnet = Save + 0x35CF
    kh2lib.Reflect = Save + 0x35D0
    kh2lib.CosmicBelt = Save + 0x35D1
    kh2lib.ShockCharm = Save + 0x35D2
    kh2lib.ShockCharmPlus = Save + 0x35D3
    kh2lib.GrandRibbon = Save + 0x35D4
    kh2lib.FireBangle = Save + 0x35D7
    kh2lib.FiraBangle = Save + 0x35D8
    kh2lib.FiragaBangle = Save + 0x35D9
    kh2lib.FiragunBangle = Save + 0x35DA
    kh2lib.BlizzardArmlet = Save + 0x35DC
    kh2lib.BlizzaraArmlet = Save + 0x35DD
    kh2lib.BlizzagaArmlet = Save + 0x35DE
    kh2lib.BlizzagunArmlet = Save + 0x35DF
    kh2lib.Tent = Save + 0x35E1
    kh2lib.ThunderTrinket = Save + 0x35E2
    kh2lib.ThundaraTrinket = Save + 0x35E3
    kh2lib.ThundagaTrinket = Save + 0x35E4
    kh2lib.ThundagunTrinket = Save + 0x35E5
    kh2lib.AdamantShield = Save + 0x35E6
    kh2lib.ChainGear = Save + 0x35E7
    kh2lib.OgreShield = Save + 0x35E8
    kh2lib.FallingStar = Save + 0x35E9
    kh2lib.Dreamcloud = Save + 0x35EA
    kh2lib.KnightDefender = Save + 0x35EB
    kh2lib.GenjiShield = Save + 0x35EC
    kh2lib.AkashicRecord = Save + 0x35ED
    kh2lib.NobodyGuard = Save + 0x35EE
    kh2lib.HammerStaff = Save + 0x35EF
    kh2lib.VictoryBell = Save + 0x35F0
    kh2lib.MeteorStaff = Save + 0x35F1
    kh2lib.CometStaff = Save + 0x35F2
    kh2lib.LordsBroom = Save + 0x35F3
    kh2lib.WisdomWand = Save + 0x35F4
    kh2lib.RisingDragon = Save + 0x35F5
    kh2lib.NobodyLance = Save + 0x35F6
    kh2lib.ShamansRelic = Save + 0x35F7
    kh2lib.ShadowAnklet = Save + 0x35F9
    kh2lib.StaffOfDetection = Save + 0x35FA
    kh2lib.DarkAnklet = Save + 0x35FB
    kh2lib.MidnightAnklet = Save + 0x35FC
    kh2lib.ChaosAnklet = Save + 0x35FD
    kh2lib.AbasChain = Save + 0x35FF
    kh2lib.AegisChain = Save + 0x3600
    kh2lib.Acrisius = Save + 0x3601
    kh2lib.Ribbon = Save + 0x3602
    kh2lib.ChampionBelt = Save + 0x3603
    kh2lib.PetiteRibbon = Save + 0x3604
    kh2lib.AcrisiusPlus = Save + 0x3605
    kh2lib.CosmicChain = Save + 0x3606
    kh2lib.BlazingShard = Save + 0x360F
    kh2lib.BlazingStone = Save + 0x3610
    kh2lib.BlazingGem = Save + 0x3611
    kh2lib.BlazingCrystal = Save + 0x3612
    kh2lib.LightningShard = Save + 0x3617
    kh2lib.LightningStone = Save + 0x3618
    kh2lib.LightningGem = Save + 0x3619
    kh2lib.LightningCrystal = Save + 0x361A
    kh2lib.PowerShard = Save + 0x361B
    kh2lib.PowerStone = Save + 0x361C
    kh2lib.PowerGem = Save + 0x361D
    kh2lib.PowerCrystal = Save + 0x361E
    kh2lib.LucidShard = Save + 0x361F
    kh2lib.LucidStone = Save + 0x3620
    kh2lib.LucidGem = Save + 0x3621
    kh2lib.LucidCrystal = Save + 0x3622
    kh2lib.DenseShard = Save + 0x3623
    kh2lib.DenseStone = Save + 0x3624
    kh2lib.DenseGem = Save + 0x3625
    kh2lib.DenseCrystal = Save + 0x3626
    kh2lib.TwilightShard = Save + 0x3627
    kh2lib.TwilightStone = Save + 0x3628
    kh2lib.TwilightGem = Save + 0x3629
    kh2lib.TwilightCrystal = Save + 0x362A
    kh2lib.MythrilShard = Save + 0x362B
    kh2lib.MythrilStone = Save + 0x362C
    kh2lib.MythrilGem = Save + 0x362D
    kh2lib.MythrilCrystal = Save + 0x362E
    kh2lib.BrightShard = Save + 0x362F
    kh2lib.BrightStone = Save + 0x3630
    kh2lib.BrightGem = Save + 0x3631
    kh2lib.BrightCrystal = Save + 0x3632
    kh2lib.EnergyShard = Save + 0x3633
    kh2lib.EnergyStone = Save + 0x3634
    kh2lib.EnergyGem = Save + 0x3635
    kh2lib.EnergyCrystal = Save + 0x3636
    kh2lib.SerenityShard = Save + 0x3637
    kh2lib.SerenityStone = Save + 0x3638
    kh2lib.SerenityGem = Save + 0x3639
    kh2lib.SerenityCrystal = Save + 0x363A
    kh2lib.OrichalcumPlus = Save + 0x363B
    kh2lib.MunnyPouchOlette = Save + 0x363C
    kh2lib.CrystalOrb = Save + 0x363D
    kh2lib.SeifersTrophy = Save + 0x363E
    kh2lib.TournamentPoster = Save + 0x363F
    kh2lib.Poster = Save + 0x3640
    kh2lib.Letter = Save + 0x3641
    kh2lib.NaminesSketches = Save + 0x3642
    kh2lib.MembershipCard = Save + 0x3643
    kh2lib.OlympusStone = Save + 0x3644
    kh2lib.AuronsStatue = Save + 0x3645
    kh2lib.CursedMedallion = Save + 0x3646
    kh2lib.Present = Save + 0x3647
    kh2lib.DecoyPresents = Save + 0x3648
    kh2lib.IceCream = Save + 0x3649
    kh2lib.Picture = Save + 0x364A
    kh2lib.Orichalcum = Save + 0x364B
    kh2lib.FrostShard = Save + 0x364C
    kh2lib.FrostStone = Save + 0x364D
    kh2lib.FrostGem = Save + 0x364E
    kh2lib.FrostCrystal = Save + 0x364F
    kh2lib.MegaRecipe = Save + 0x3650
    -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
    kh2lib.StruggleSword = Save + 0x3651
    kh2lib.StarRecipe = Save + 0x3652
    kh2lib.RecoveryRecipe = Save + 0x3653
    kh2lib.SkillRecipe = Save + 0x3654
    kh2lib.GuardRecipe = Save + 0x3655
    kh2lib.Dummy13 = Save + 0x365D -- GoA uses this for Royal Summons
    kh2lib.Dummy16 = Save + 0x3660 -- GoA uses this for Gained Item Slot
    kh2lib.RoadToDiscovery = Save + 0x3661
    kh2lib.StrengthBeyondStrength = Save + 0x3662
    kh2lib.BookOfShadows = Save + 0x3663
    kh2lib.DriveRecovery = Save + 0x3664
    kh2lib.HighDriveRecovery = Save + 0x3665
    kh2lib.PowerBoost = Save + 0x3666
    kh2lib.MagicBoost = Save + 0x3667
    kh2lib.DefenseBoost = Save + 0x3668
    kh2lib.APBoost = Save + 0x3669
    kh2lib.DarkShard = Save + 0x366A
    kh2lib.DarkStone = Save + 0x366B
    kh2lib.DarkGem = Save + 0x366C
    kh2lib.DarkCrystal = Save + 0x366D
    kh2lib.CloakedThunder = Save + 0x366E
    kh2lib.EternalBlossom = Save + 0x366F
    kh2lib.RareDocument = Save + 0x3670
    kh2lib.Dummy23 = Save + 0x3671 -- GoA uses this for Maximum HP Increased
    kh2lib.Dummy24 = Save + 0x3672 -- GoA uses this for Maximum MP Increased
    kh2lib.Dummy25 = Save + 0x3673 -- GoA uses this for Drive Gauge Powered Up
    kh2lib.Dummy26 = Save + 0x3674 -- GoA uses this for Gained Armor Slot
    kh2lib.Dummy27 = Save + 0x3675 -- GoA uses this for Gained Accessory Slot
    kh2lib.StyleRecipe = Save + 0x3676
    kh2lib.MoonRecipe = Save + 0x3677
    kh2lib.QueenRecipe = Save + 0x3678
    kh2lib.KingRecipe = Save + 0x3679
    kh2lib.UltimateRecipe = Save + 0x367A
    kh2lib.StarSeeker = Save + 0x367B
    kh2lib.HiddenDragon = Save + 0x367C
    kh2lib.SaveTheQueen = Save + 0x367D
    kh2lib.SaveTheKing = Save + 0x367E
    kh2lib.HerosCrest = Save + 0x367F
    kh2lib.Monochrome = Save + 0x3680
    kh2lib.FollowTheWind = Save + 0x3681
    kh2lib.CircleOfLife = Save + 0x3682
    kh2lib.PhotonDebugger = Save + 0x3683
    kh2lib.GullWing = Save + 0x3684
    kh2lib.RumblingRose = Save + 0x3685
    kh2lib.GuardianSoul = Save + 0x3686
    kh2lib.WishingLamp = Save + 0x3687
    kh2lib.DecisivePumpkin = Save + 0x3688
    kh2lib.SleepingLion = Save + 0x3689
    kh2lib.SweetMemories = Save + 0x368A
    kh2lib.MysteriousAbyss = Save + 0x368B
    kh2lib.FatalCrest = Save + 0x368C
    kh2lib.BondOfFlame = Save + 0x368D
    kh2lib.Fenrir = Save + 0x368E
    kh2lib.UltimaWeapon = Save + 0x368F
    -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
    kh2lib.StruggleWand = Save + 0x3690
    -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
    kh2lib.StruggleHammer = Save + 0x3691
    kh2lib.SaveTheQueenPlus = Save + 0x3692
    kh2lib.SaveTheKingPlus = Save + 0x3693
    kh2lib.PromiseCharm = Save + 0x3694
    kh2lib.MunnyPouchMickey = Save + 0x3695
    kh2lib.HadesCupTrophy = Save + 0x3696
    kh2lib.TheStruggleTrophy = Save + 0x3697
    kh2lib.TwoBecomeOne = Save + 0x3698
    kh2lib.WinnersProof = Save + 0x3699
    kh2lib.Centurion = Save + 0x369A
    kh2lib.CenturionPlus = Save + 0x369B
    kh2lib.PlainMushroom = Save + 0x369C
    kh2lib.PlainMushroomPlus = Save + 0x369D
    kh2lib.PreciousMushroom = Save + 0x369E
    kh2lib.PreciousMushroomPlus = Save + 0x369F
    kh2lib.PremiumMushroom = Save + 0x36A0
    kh2lib.FrozenPride = Save + 0x36A1
    kh2lib.FrozenPridePlus = Save + 0x36A2
    kh2lib.JoyousMushroom = Save + 0x36A3
    kh2lib.JoyousMushroomPlus = Save + 0x36A4
    kh2lib.MajesticMushroom = Save + 0x36A5
    kh2lib.MajesticMushroomPlus = Save + 0x36A6
    kh2lib.UltimateMushroom = Save + 0x36A7
    kh2lib.RemembranceShard = Save + 0x36A8
    kh2lib.RemembranceStone = Save + 0x36A9
    kh2lib.RemembranceGem = Save + 0x36AA
    kh2lib.RemembranceCrystal = Save + 0x36AB
    kh2lib.TranquilityShard = Save + 0x36AC
    kh2lib.TranquilityStone = Save + 0x36AD
    kh2lib.TranquilityGem = Save + 0x36AE
    kh2lib.TranquilityCrystal = Save + 0x36AF
    kh2lib.LostIllusion = Save + 0x36B0
    kh2lib.ManifestIllusion = Save + 0x36B1
    kh2lib.ProofOfConnection = Save + 0x36B2
    kh2lib.ProofOfNonexistence = Save + 0x36B3
    kh2lib.ProofOfPeace = Save + 0x36B4
    kh2lib.ExecutivesRing = Save + 0x36B5
    kh2lib.ShamansRelicPlus = Save + 0x36B6
    kh2lib.AkashicRecordPlus = Save + 0x36B7

    -- Bitmask Inventory Items (Byte)
    -- Add the value of the items you want to add to inventory. ie: Having valor and wisdom form would be 0x6. Only wisdom form and baseball charm would be 0x12, etc ----

    -- (1)Ukulele Charm, (2)Valor Form, (4)Wisdom Form, (8)Baseball Charm, (10)Final Form, (20)Anti Form, (40)Master Form, (80)Navigational Map
    kh2lib.ItemSet1 = Save + 0x36C0
    -- (1)Castle Map, (2)Basement Map, (4)Castle Walls Map, (20)The Interceptor Map, (40)Encampment Area Map, (80)Village Area Map
    kh2lib.ItemSet2 = Save + 0x36C1
    -- (1)Cornerstone Hill Map, (2)Windows of Time Map 2, (4)Lilliput Map, (8)Building Site Map, (10)Mickey's House Map, (20)Disney Castle Map, (40)Agrabah Map, (80)Cave of Wonders Map
    kh2lib.ItemSet3 = Save + 0x36C2
    -- (1)Ruins Map, (2)Undersea Kingdom Map, (4)Starry Hill Map, (8)100 Acre Wood Map, (10)Rabbit's Howse Map, (20)Piglet's Howse Map, (40)Kanga's Howse Map, (80)Spooky Cave Map
    kh2lib.ItemSet4 = Save + 0x36C3
    -- (1)Palace Map, (2)Coliseum Map, (4)Underworld Map, (8)Caverns Map, (10)Lamp Charm, (20)Feather Charm, (40)Report 1, (80)Report 2
    kh2lib.ItemSet5 = Save + 0x36C4
    -- (1)Report 3, (2)Report 4, (4)Report 5, (8)Report 6, (10)Report 7, (20)Report 8, (40)Report 9, (80)Report 10
    kh2lib.ItemSet6 = Save + 0x36C5
    -- (1)Report 11, (2)Report 12, (4)Report 13
    kh2lib.ItemSet7 = Save + 0x36C6
    -- (4)Halloween Town Map, (8)Naval Map, (10)Pride Rock Map, (20)Marketplace Map, (40)Pit Cell Area Map, (80)Twilight Town Map
    kh2lib.ItemSet8 = Save + 0x36C7
    -- (1)Dark City Map, (2)The Black Pearl Map, (4)Isla de Muerta Map, (8)Ship Graveyard Map, (10)Christmas Town Map, (20)Curly Hill Map, (40)Oasis Map, (80)Savannah Map
    kh2lib.ItemSet9 = Save + 0x36C8
    -- (1)Castle Perimeter Map, (2)The Great Maw Map, (4)I/O Tower Map, (8)Central Computer Core Map, (10)Solar Sailer Simulation Map, (20)Windows of Time Map, (40)Sunset Hill Map, (80)Mansion Map
    kh2lib.ItemSet10 = Save + 0x36C9
    -- (1)Tower Map, (2)DH Map, (4)Castle that Never Was Map, (8)Limit Form, (10)Dark Remembrance Map, (20)Depths of Remembrance Map, (80)Garden of Assemblage Map
    kh2lib.ItemSet11 = Save + 0x36CA
end

--- Create lookup tables for converting constants from IDs to
--- names (and vice-versa) and attach them to the kh2lib table
local function add_lookup_tables()
    local status, luts = pcall(require, 'kh2lib.lookup_tables')
    if not status then
        LogError('Failed to create LUTs for kh2lib constants')
        return
    end

    kh2lib._constants = luts._constants
    kh2lib.worlds = luts.worlds
    kh2lib.rooms = luts.rooms
    kh2lib.events = luts.events
end

--- Attach a table `current` to the kh2lib table which provides
--- shortcuts to values at relevant game state memory addresses
local function add_game_state_table()
    --- Shortcut to get current values at common game state addresses
    --- @class GameState
    --- @field world integer # current world ID
    --- @field world_name string # current world name
    --- @field room integer # current room ID
    --- @field room_name string # current room name
    --- @field door integer # current door ID
    --- @field place integer # concatenation of room ID and world ID in hex
    --- @field place_name string # current world & room names, separated by hyphen
    --- @field location string # alias for place_name
    local game_state = {}

    --- @type metatable
    local mt = {
        --- Defines getters as syntactical sugar for member variables
        --- @param self GameState
        --- @param key 'world'
        --- |'world_name'
        --- |'room'
        --- |'room_name'
        --- |'event'
        --- |'event_name'
        --- |'door'
        --- |'place'
        --- |'place_name'
        --- |'location'
        --- @return integer|string|nil
        __index = function (self, key)
            local BASE_ADDRESS = kh2lib.Now
            local offsets = kh2lib._constants._offsets
            local worlds = kh2lib.worlds
            local rooms = kh2lib.rooms
            local events = kh2lib.events
            local world_id = ReadByte(BASE_ADDRESS + offsets.now.WORLD)
            local room_id = ReadByte(BASE_ADDRESS + offsets.now.ROOM)
            local event_id = ReadShort(BASE_ADDRESS + offsets.now.EVENT)

            -- Game is still in bootup sequence
            -- TODO: Probably handle this differently in the future so that
            -- title screen can actually be detected
            if world_id == 255 or world_id == 0 or room_id == 255 then return nil end

            -- read current area value from game before returning
            if key == 'world' then
                return world_id
            elseif key == 'world_name' then
                return worlds[world_id]
            elseif key == 'room' then
                return room_id
            elseif key == 'room_name' then
                return rooms[world_id][room_id]
            elseif key == 'event' then
                return event_id
            elseif key == 'event_name' then
                return events[world_id][room_id][event_id]
            elseif key == 'door' then
                return ReadShort(BASE_ADDRESS + offsets.now.DOOR)
            elseif key == 'place' then
                return ReadShort(BASE_ADDRESS + offsets.now.PLACE)
            elseif key == 'location' or key == 'place_name' then
                return self.world_name .. ' - ' .. self.room_name
            end

            return nil
        end,
    }
    setmetatable(game_state, mt)
    kh2lib.current = game_state
end

local function _InitLibrary()
    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == 'ENGINE' then
        kh2lib = require('kh2lib.addresses.Emulator')
        kh2lib.GameVersion = KH2_VERSION_EMULATOR
        kh2lib.OnPC = false
        kh2lib.CanExecute = true
    elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then -- PC
        if ReadByte(0x566A8E) == 0xFF then
            kh2lib = require('kh2lib.addresses.EpicGlobal-1_0_0_9')
            kh2lib.GameVersion = KH2_VERSION_EPIC_1_0_0_9
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x56668E) == 0xFF then
            kh2lib = require('kh2lib.addresses.SteamGlobal-1_0_0_9')
            kh2lib.GameVersion = KH2_VERSION_STEAM_GLOBAL_1_0_0_9
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x56640E) == 0xFF then
            kh2lib = require('kh2lib.addresses.SteamJP-1_0_0_9')
            kh2lib.GameVersion = KH2_VERSION_STEAM_JP_1_0_0_9
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x660E44) == 106 then
            kh2lib = require('kh2lib.addresses.EpicShared-1_0_0_10')
            kh2lib.GameVersion = KH2_VERSION_EPIC_1_0_0_10
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        elseif ReadByte(0x660EF4) == 106 then
            kh2lib = require('kh2lib.addresses.SteamShared-1_0_0_10')
            kh2lib.GameVersion = KH2_VERSION_STEAM_1_0_0_10
            kh2lib.OnPC = true
            kh2lib.CanExecute = true
        else
            kh2lib.GameVersion = KH2_VERSION_UNKNOWN
            kh2lib.OnPC = true
            kh2lib.CanExecute = false
            LogError('KH2 Lua Library - KH2 PC detected, but is a version not currently supported')
        end
    else
        kh2lib.GameVersion = KH2_VERSION_UNKNOWN
        kh2lib.OnPC = false
        kh2lib.CanExecute = false
        LogError('KH2 Lua Library - KH2 not detected')
    end

    -- Add convenience variables and methods
    if kh2lib.CanExecute then
        _legacy_add_inventory_addresses()
        add_lookup_tables()
        add_game_state_table()
    end

    return kh2lib
end

-- Return everything packaged up in a way that can be referenced by the script that imported this library
return _InitLibrary()
