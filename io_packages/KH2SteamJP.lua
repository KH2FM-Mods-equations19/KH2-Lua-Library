return	{
	-- Base Values ----------------------------------------------------------------
	Now = 0x0716008,			--Current Location
	Sve = 0x2A0B4C0,			--Saved Location
	Save = 0x09A8830,			--Save File
	Obj0Pointer = 0x2A23FB0,	--00objentry.bin Pointer Address
	Sys3Pointer = 0x2AE4DD0,	--03system.bin Pointer Address
	Btl0Pointer = 0x2AE4DD8,	--00battle.bin Pointer Address
	ARDPointer = 0x2A0E7A8,		--ARD Pointer Address
	Music = 0x0AB9CC4,			--Background Music
	Pause = 0x0ABA7F8,			--Ability to Pause
	React = 0x2A100E2,			--Reaction Command
	Cntrl = 0x2A16168,			--Sora Controllable
	Timer = 0x0ABA7D0,
	Songs = 0x0B64CF4,			--Atlantica Stuff
	GScre = 0x072A130,			--Gummi Score
	GMdal = 0x072A2C4,			--Gummi Medal
	GKill = 0x0AF60C6,			--Gummi Kills
	CamTyp = 0x0717CA8,			--Camera Type
	GamSpd = 0x0716424,			--Game Speed
	CutNow = 0x0B63F18,    		--Cutscene Timer
	CutLen = 0x0B63F34,    		--Cutscene Length
	CutSkp = 0x0B63F1C,    		--Cutscene Skip
	BtlTyp = 0x2A10384,    		--Battle Status (Out-of-Battle, Regular, Forced)
	BtlEnd = 0x2A0EC60,    		--End-of-Battle camera & signal
	TxtBox = 0x074CF20,    		--Last Displayed Textbox
	DemCln = 0x2A0E834,    		--Demyx Clone Status (might have to do with other mission status/signal?)
	Slot1    = 0x2A22518,  		--Unit Slot 1
	NextSlot = 0x278,
	Point1   = 0x2A0E9C8,
	NxtPoint = 0x50,
	Gauge1   = 0x2A0EAB8,
	NxtGauge = 0x48,
	Menu1    = 0x2A10090, 		--Menu 1 (main command menu)
	NextMenu = 0x8,
	MSN = 0x0BF2340,
	-- Inventory Items (Byte)---------Value = "Save" + Offset---------------------
	Potion = 0x09A8830 + 0x3580,
	HiPotion = 0x09A8830 + 0x3581,
	Ether = 0x09A8830 + 0x3582,
	Elixir = 0x09A8830 + 0x3583,
	MegaPotion = 0x09A8830 + 0x3584,
	MegaEther = 0x09A8830 + 0x3585,
	MegaElixir = 0x09A8830 + 0x3586,
	AbilityRing = 0x09A8830 + 0x3587,
	EngineersRing = 0x09A8830 + 0x3588,
	TechniciansRing = 0x09A8830 + 0x3589,
	ExpertsRing = 0x09A8830 + 0x358A,
	SardonyxRing = 0x09A8830 + 0x358B,
	TourmalineRing = 0x09A8830 + 0x358C,
	AquamarineRing = 0x09A8830 + 0x358D,
	GarnetRing = 0x09A8830 + 0x358E,
	DiamondRing = 0x09A8830 + 0x358F,
	SilverRing = 0x09A8830 + 0x3590,
	GoldRing = 0x09A8830 + 0x3591,
	PlatinumRing = 0x09A8830 + 0x3592,
	MythrilRing = 0x09A8830 + 0x3593,
	Fire = 0x09A8830 + 0x3594,
	Blizzard = 0x09A8830 + 0x3595,
	Thunder = 0x09A8830 + 0x3596,
	Cure = 0x09A8830 + 0x3597,
	TornPage = 0x09A8830 + 0x3598,
	OrichalcumRing = 0x09A8830 + 0x359A,
	MastersRing = 0x09A8830 + 0x359B,
	MoonAmulet = 0x09A8830 + 0x359C,
	StarCharm = 0x09A8830 + 0x359E,
	SkillRing = 0x09A8830 + 0x359F,
	SkillfulRing = 0x09A8830 + 0x35A0,
	KingdomKey = 0x09A8830 + 0x35A1,
	Oathkeeper = 0x09A8830 + 0x35A2,
	Oblivion = 0x09A8830 + 0x35A3,
	DetectionSaber = 0x09A8830 + 0x35A4,
	FrontierofUltima = 0x09A8830 + 0x35A5,
	SoldierEarring = 0x09A8830 + 0x35A6,
	FencerEarring = 0x09A8830 + 0x35A7,
	MageEarring = 0x09A8830 + 0x35A8,
	KnightsShield = 0x09A8830 + 0x35A9,
	DetectionShield = 0x09A8830 + 0x35AA,
	TesttheKing = 0x09A8830 + 0x35AB,
	SlayerEarring = 0x09A8830 + 0x35AC,
	CosmicRing = 0x09A8830 + 0x35AD,
	BattlefieldsofWar = 0x09A8830 + 0x35AE,
	SwordoftheAncestors = 0x09A8830 + 0x35AF,
	Medal = 0x09A8830 + 0x35B0,
	CosmicArts = 0x09A8830 + 0x35B1,
	ShadowArchive = 0x09A8830 + 0x35B2,
	BeastsClaw = 0x09A8830 + 0x35B3,
	BoneFist = 0x09A8830 + 0x35B4,
	ProudFang = 0x09A8830 + 0x35B5,
	SkillandCrossbones = 0x09A8830 + 0x35B6,
	ShadowArchivePlus = 0x09A8830 + 0x35B7,
	LuckyRing = 0x09A8830 + 0x35B8,
	FullBloom = 0x09A8830 + 0x35B9,
	DrawRing = 0x09A8830 + 0x35BA,
	FullBloomPlus = 0x09A8830 + 0x35BB,
	ElvenBandanna = 0x09A8830 + 0x35BC,
	DivineBandanna = 0x09A8830 + 0x35BD,
	PowerBand = 0x09A8830 + 0x35BE,
	Pureblood = 0x09A8830 + 0x35BF,
	Scimitar = 0x09A8830 + 0x35C0,
	WaytotheDawn = 0x09A8830 + 0x35C1,
	IdentityDisk = 0x09A8830 + 0x35C2,
	MagesStaff = 0x09A8830 + 0x35C3,
	BusterBand = 0x09A8830 + 0x35C6,
	ProtectBelt = 0x09A8830 + 0x35C7,
	KingdomKeyD = 0x09A8830 + 0x35C9,
	GaiaBelt = 0x09A8830 + 0x35CA,
	Magnet = 0x09A8830 + 0x35CF,
	Reflect = 0x09A8830 + 0x35D0,
	CosmicBelt = 0x09A8830 + 0x35D1,
	ShockCharm = 0x09A8830 + 0x35D2,
	ShockCharmPlus = 0x09A8830 + 0x35D3,
	GrandRibbon = 0x09A8830 + 0x35D4,
	FireBangle = 0x09A8830 + 0x35D7,
	FiraBangle = 0x09A8830 + 0x35D8,
	FiragaBangle = 0x09A8830 + 0x35D9,
	FiragunBangle = 0x09A8830 + 0x35DA,
	BlizzardArmlet = 0x09A8830 + 0x35DC,
	BlizzaraArmlet = 0x09A8830 + 0x35DD,
	BlizzagaArmlet = 0x09A8830 + 0x35DE,
	BlizzagunArmlet = 0x09A8830 + 0x35DF,
	Tent = 0x09A8830 + 0x35E1,
	ThunderTrinket = 0x09A8830 + 0x35E2,
	ThundaraTrinket = 0x09A8830 + 0x35E3,
	ThundagaTrinket = 0x09A8830 + 0x35E4,
	ThundagunTrinket = 0x09A8830 + 0x35E5,
	AdamantShield = 0x09A8830 + 0x35E6,
	ChainGear = 0x09A8830 + 0x35E7,
	OgreShield = 0x09A8830 + 0x35E8,
	FallingStar = 0x09A8830 + 0x35E9,
	Dreamcloud = 0x09A8830 + 0x35EA,
	KnightDefender = 0x09A8830 + 0x35EB,
	GenjiShield = 0x09A8830 + 0x35EC,
	AkashicRecord = 0x09A8830 + 0x35ED,
	NobodyGuard = 0x09A8830 + 0x35EE,
	HammerStaff = 0x09A8830 + 0x35EF,
	VictoryBell = 0x09A8830 + 0x35F0,
	MeteorStaff = 0x09A8830 + 0x35F1,
	CometStaff = 0x09A8830 + 0x35F2,
	LordsBroom = 0x09A8830 + 0x35F3,
	WisdomWand = 0x09A8830 + 0x35F4,
	RisingDragon = 0x09A8830 + 0x35F5,
	NobodyLance = 0x09A8830 + 0x35F6,
	ShamansRelic = 0x09A8830 + 0x35F7,
	ShadowAnklet = 0x09A8830 + 0x35F9,
	StaffofDetection = 0x09A8830 + 0x35FA,
	DarkAnklet = 0x09A8830 + 0x35FB,
	MidnightAnklet = 0x09A8830 + 0x35FC,
	ChaosAnklet = 0x09A8830 + 0x35FD,
	AbasChain = 0x09A8830 + 0x35FF,
	AegisChain = 0x09A8830 + 0x3600,
	Acrisius = 0x09A8830 + 0x3601,
	Ribbon = 0x09A8830 + 0x3602,
	ChampionBelt = 0x09A8830 + 0x3603,
	PetiteRibbon = 0x09A8830 + 0x3604,
	AcrisiusPlus = 0x09A8830 + 0x3605,
	CosmicChain = 0x09A8830 + 0x3606,
	BlazingShard = 0x09A8830 + 0x360F,
	BlazingStone = 0x09A8830 + 0x3610,
	BlazingGem = 0x09A8830 + 0x3611,
	BlazingCrystal = 0x09A8830 + 0x3612,
	LightningShard = 0x09A8830 + 0x3617,
	LightningStone = 0x09A8830 + 0x3618,
	LightningGem = 0x09A8830 + 0x3619,
	LightningCrystal = 0x09A8830 + 0x361A,
	PowerShard = 0x09A8830 + 0x361B,
	PowerStone = 0x09A8830 + 0x361C,
	PowerGem = 0x09A8830 + 0x361D,
	PowerCrystal = 0x09A8830 + 0x361E,
	LucidShard = 0x09A8830 + 0x361F,
	LucidStone = 0x09A8830 + 0x3620,
	LucidGem = 0x09A8830 + 0x3621,
	LucidCrystal = 0x09A8830 + 0x3622,
	DenseShard = 0x09A8830 + 0x3623,
	DenseStone = 0x09A8830 + 0x3624,
	DenseGem = 0x09A8830 + 0x3625,
	DenseCrystal = 0x09A8830 + 0x3626,
	TwilightShard = 0x09A8830 + 0x3627,
	TwilightStone = 0x09A8830 + 0x3628,
	TwilightGem = 0x09A8830 + 0x3629,
	TwilightCrystal = 0x09A8830 + 0x362A,
	MythrilShard = 0x09A8830 + 0x362B,
	MythrilStone = 0x09A8830 + 0x362C,
	MythrilGem = 0x09A8830 + 0x362D,
	MythrilCrystal = 0x09A8830 + 0x362E,
	BrightShard = 0x09A8830 + 0x362F,
	BrightStone = 0x09A8830 + 0x3630,
	BrightGem = 0x09A8830 + 0x3631,
	BrightCrystal = 0x09A8830 + 0x3632,
	EnergyShard = 0x09A8830 + 0x3633,
	EnergyStone = 0x09A8830 + 0x3634,
	EnergyGem = 0x09A8830 + 0x3635,
	EnergyCrystal = 0x09A8830 + 0x3636,
	SerenityShard = 0x09A8830 + 0x3637,
	SerenityStone = 0x09A8830 + 0x3638,
	SerenityGem = 0x09A8830 + 0x3639,
	SerenityCrystal = 0x09A8830 + 0x363A,
	OrichalcumPlus = 0x09A8830 + 0x363B,
	MunnyPouchOlette = 0x09A8830 + 0x363C,
	CrystalOrb = 0x09A8830 + 0x363D,
	SeifersTrophy = 0x09A8830 + 0x363E,
	TournamentPoster = 0x09A8830 + 0x363F,
	Poster = 0x09A8830 + 0x3640,
	Letter = 0x09A8830 + 0x3641,
	NaminesSketches = 0x09A8830 + 0x3642,
	MembershipCard = 0x09A8830 + 0x3643,
	OlympusStone = 0x09A8830 + 0x3644,
	AuronsStatue = 0x09A8830 + 0x3645,
	CursedMedallion = 0x09A8830 + 0x3646,
	Present = 0x09A8830 + 0x3647,
	DecoyPresents = 0x09A8830 + 0x3648,
	IceCream = 0x09A8830 + 0x3649,
	Picture = 0x09A8830 + 0x364A,
	Orichalcum = 0x09A8830 + 0x364B,
	FrostShard = 0x09A8830 + 0x364C,
	FrostStone = 0x09A8830 + 0x364D,
	FrostGem = 0x09A8830 + 0x364E,
	FrostCrystal = 0x09A8830 + 0x364F,
	MegaRecipe = 0x09A8830 + 0x3650,
	StruggleSword = 0x09A8830 + 0x3651, -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
	StarRecipe = 0x09A8830 + 0x3652,
	RecoveryRecipe = 0x09A8830 + 0x3653,
	SkillRecipe = 0x09A8830 + 0x3654,
	GuardRecipe = 0x09A8830 + 0x3655,
	RoadtoDiscovery = 0x09A8830 + 0x3661,
	StrengthBeyondStrength = 0x09A8830 + 0x3662,
	BookofShadows = 0x09A8830 + 0x3663,
	DriveRecovery = 0x09A8830 + 0x3664,
	HighDriveRecovery = 0x09A8830 + 0x3665,
	PowerBoost = 0x09A8830 + 0x3666,
	MagicBoost = 0x09A8830 + 0x3667,
	DefenseBoost = 0x09A8830 + 0x3668,
	APBoost = 0x09A8830 + 0x3669,
	DarkShard = 0x09A8830 + 0x366A,
	DarkStone = 0x09A8830 + 0x366B,
	DarkGem = 0x09A8830 + 0x366C,
	DarkCrystal = 0x09A8830 + 0x366D,
	CloakedThunder = 0x09A8830 + 0x366E,
	EternalBlossom = 0x09A8830 + 0x366F,
	RareDocument = 0x09A8830 + 0x3670,
	StyleRecipe = 0x09A8830 + 0x3676,
	MoonRecipe = 0x09A8830 + 0x3677,
	QueenRecipe = 0x09A8830 + 0x3678,
	KingRecipe = 0x09A8830 + 0x3679,
	UltimateRecipe = 0x09A8830 + 0x367A,
	StarSeeker = 0x09A8830 + 0x367B,
	HiddenDragon = 0x09A8830 + 0x367C,
	SavetheQueen = 0x09A8830 + 0x367D,
	SavetheKing = 0x09A8830 + 0x367E,
	HerosCrest = 0x09A8830 + 0x367F,
	Monochrome = 0x09A8830 + 0x3680,
	FollowtheWind = 0x09A8830 + 0x3681,
	CircleofLife = 0x09A8830 + 0x3682,
	PhotonDebugger = 0x09A8830 + 0x3683,
	GullWing = 0x09A8830 + 0x3684,
	RumblingRose = 0x09A8830 + 0x3685,
	GuardianSoul = 0x09A8830 + 0x3686,
	WishingLamp = 0x09A8830 + 0x3687,
	DecisivePumpkin = 0x09A8830 + 0x3688,
	SleepingLion = 0x09A8830 + 0x3689,
	SweetMemories = 0x09A8830 + 0x368A,
	MysteriousAbyss = 0x09A8830 + 0x368B,
	FatalCrest = 0x09A8830 + 0x368C,
	BondofFlame = 0x09A8830 + 0x368D,
	Fenrir = 0x09A8830 + 0x368E,
	UltimaWeapon = 0x09A8830 + 0x368F,
	StruggleWand = 0x09A8830 + 0x3690, -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
	StruggleHammer = 0x09A8830 + 0x3691, -- Struggle weapons require the value at 032DECE to have the bitmask 0x80 OFF in order to show up in inventory
	SavetheQueenPlus = 0x09A8830 + 0x3692,
	SavetheKingPlus = 0x09A8830 + 0x3693,
	PromiseCharm = 0x09A8830 + 0x3694,
	MunnyPouchMickey = 0x09A8830 + 0x3695,
	HadesCupTrophy = 0x09A8830 + 0x3696,
	TheStruggleTrophy = 0x09A8830 + 0x3697,
	TwoBecomeOne = 0x09A8830 + 0x3698,
	WinnersProof = 0x09A8830 + 0x3699,
	Centurion = 0x09A8830 + 0x369A,
	CenturionPlus = 0x09A8830 + 0x369B,
	PlainMushroom = 0x09A8830 + 0x369C,
	PlainMushroomPlus = 0x09A8830 + 0x369D,
	PreciousMushroom = 0x09A8830 + 0x369E,
	PreciousMushroomPlus = 0x09A8830 + 0x369F,
	PremiumMushroom = 0x09A8830 + 0x36A0,
	FrozenPride = 0x09A8830 + 0x36A1,
	FrozenPridePlus = 0x09A8830 + 0x36A2,
	JoyousMushroom = 0x09A8830 + 0x36A3,
	JoyousMushroomPlus = 0x09A8830 + 0x36A4,
	MajesticMushroom = 0x09A8830 + 0x36A5,
	MajesticMushroomPlus = 0x09A8830 + 0x36A6,
	UltimateMushroom = 0x09A8830 + 0x36A7,
	RemembranceShard = 0x09A8830 + 0x36A8,
	RemembranceStone = 0x09A8830 + 0x36A9,
	RemembranceGem = 0x09A8830 + 0x36AA,
	RemembranceCrystal = 0x09A8830 + 0x36AB,
	TranquilityShard = 0x09A8830 + 0x36AC,
	TranquilityStone = 0x09A8830 + 0x36AD,
	TranquilityGem = 0x09A8830 + 0x36AE,
	TranquilityCrystal = 0x09A8830 + 0x36AF,
	LostIllusion = 0x09A8830 + 0x36B0,
	ManifestIllusion = 0x09A8830 + 0x36B1,
	ProofofConnection = 0x09A8830 + 0x36B2,
	ProofofNonexistence = 0x09A8830 + 0x36B3,
	ProofofPeace = 0x09A8830 + 0x36B4,
	ExecutivesRing = 0x09A8830 + 0x36B5,
	ShamansRelicPlus = 0x09A8830 + 0x36B6,
	AkashicRecordPlus = 0x09A8830 + 0x36B7,
	-- Bitmask Inventory Items (Byte) -- Add the value of the items you want to add to inventory. ie: Having valor and wisdom form would be 0x6. Only wisdom form and baseball charm would be 0x12, etc ----
	Section1 = 0x09A8830 + 0x36C0, -- (1)Ukulele Charm, (2)Valor Form, (4)Wisdom Form, (8)Baseball Charm, (10)Final Form, (20)Anti Form, (40)Master Form, (80)Navigational Map
	Section2 = 0x09A8830 + 0x36C1, -- (1)Castle Map, (2)Basement Map, (4)Castle Walls Map, (20)The Interceptor Map, (40)Encampment Area Map, (80)Village Area Map
	Section3 = 0x09A8830 + 0x36C2, -- (1)Cornerstone Hill Map, (2)Windows of Time Map 2, (4)Lilliput Map, (8)Building Site Map, (10)Mickey's House Map, (20)Disney Castle Map, (40)Agrabah Map, (80)Cave of Wonders Map
	Section4 = 0x09A8830 + 0x36C3, -- (1)Ruins Map, (2)Undersea Kingdom Map, (4)Starry Hill Map, (8)100 Acre Wood Map, (10)Rabbit's Howse Map, (20)Piglet's Howse Map, (40)Kanga's Howse Map, (80)Spooky Cave Map
	Section5 = 0x09A8830 + 0x36C4, -- (1)Palace Map, (2)Coliseum Map, (4)Underworld Map, (8)Caverns Map, (10)Lamp Charm, (20)Feather Charm, (40)Report 1, (80)Report 2
	Section6 = 0x09A8830 + 0x36C5, -- (1)Report 3, (2)Report 4, (4)Report 5, (8)Report 6, (10)Report 7, (20)Report 8, (40)Report 9, (80)Report 10
	Section7 = 0x09A8830 + 0x36C6, -- (1)Report 11, (2)Report 12, (4)Report 13
	Section8 = 0x09A8830 + 0x36C7, -- (4)Halloween Town Map, (8)Naval Map, (10)Pride Rock Map, (20)Marketplace Map, (40)Pit Cell Area Map, (80)Twilight Town Map
	Section9 = 0x09A8830 + 0x36C8, -- (1)Dark City Map, (2)The Black Pearl Map, (4)Isla de Muerta Map, (8)Ship Graveyard Map, (10)Christmas Town Map, (20)Curly Hill Map, (40)Oasis Map, (80)Savannah Map
	Section10 = 0x09A8830 + 0x36C9, -- (1)Castle Perimeter Map, (2)The Great Maw Map, (4)I/O Tower Map, (8)Central Computer Core Map, (10)Solar Sailer Simulation Map, (20)Windows of Time Map, (40)Sunset Hill Map, (80)Mansion Map
	Section11 = 0x09A8830 + 0x36CA, -- (1)Tower Map, (2)DH Map, (4)Castle that Never Was Map, (8)Limit Form, (10)Dark Remembrance Map, (20)Depths of Remembrance Map, (80)Garden of Assemblage Map
}