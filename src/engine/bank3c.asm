    dw BANK(@)

    farcall_table_start
    farfunc Func_f0004

Func_f0004:
	push af
	push bc
	push de
	push hl
	ld a, [wLoadedCardID + 0]
	ld c, a
	ld a, [wLoadedCardID + 1]
	ld b, a
	sla c
	rl b
	ld hl, CardDescriptions
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlbgcoord 1, 13
	call Func_1114
	ld c, LINE_LENGTH
.asm_f0023
	ld a, [de]
	inc de
	call ProcessChar
	push hl
	push bc
	ld bc, TILEMAP_WIDTH
	add hl, bc
	ld a, [wCharTile]
	ld [hl], a
	pop bc
	pop hl
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_f0023
	call Func_111c
	hlbgcoord 1, 15
	ld c, LINE_LENGTH
.asm_f0043
	ld a, [de]
	inc de
	call ProcessChar
	push hl
	push bc
	ld bc, TILEMAP_WIDTH
	add hl, bc
	ld a, [wCharTile]
	ld [hl], a
	pop bc
	pop hl
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_f0043
	pop hl
	pop de
	pop bc
	pop af
	ret

CardDescriptions:
	table_width 2
	dw BEyeWhiteDragonDescription ; B_EYE_WHITE_DRAGON
	dw MysticalElfDescription ; MYSTICAL_ELF
	dw HitotsuMeGiantDescription ; HITOTSU_ME_GIANT
	dw BabyDragonDescription ; BABY_DRAGON
	dw RyuKishinDescription ; RYU_KISHIN
	dw FeralImpDescription ; FERAL_IMP
	dw WingedDragon1Description ; WINGED_DRAGON_1
	dw MushroomManDescription ; MUSHROOM_MAN
	dw ShadowSpecterDescription ; SHADOW_SPECTER
	dw BlacklandDragonDescription ; BLACKLAND_DRAGON
	dw SwordArmDragonDescription ; SWORD_ARM_DRAGON
	dw SwampBattleguardDescription ; SWAMP_BATTLEGUARD
	dw TyhoneDescription ; TYHONE
	dw BattleSteerDescription ; BATTLE_STEER
	dw FlameSwordsmanDescription ; FLAME_SWORDSMAN
	dw TimeWizardDescription ; TIME_WIZARD
	dw RLegOfForbiddenDescription ; R_LEG_OF_FORBIDDEN
	dw LLegOfForbiddenDescription ; L_LEG_OF_FORBIDDEN
	dw RArmOfForbiddenDescription ; R_ARM_OF_FORBIDDEN
	dw LArmOfForbiddenDescription ; L_ARM_OF_FORBIDDEN
	dw ExodiaForbiddenDescription ; EXODIA_FORBIDDEN
	dw SummonedSkullDescription ; SUMMONED_SKULL
	dw WickedWormBeastDescription ; WICKED_WORM_BEAST
	dw SkullServantDescription ; SKULL_SERVANT
	dw HornImpDescription ; HORN_IMP
	dw BattleOxDescription ; BATTLE_OX
	dw BeaverWarriorDescription ; BEAVER_WARRIOR
	dw RockOgreGrotto1Description ; ROCK_OGRE_GROTTO1
	dw MountainWarriorDescription ; MOUNTAIN_WARRIOR
	dw ZombieWarriorDescription ; ZOMBIE_WARRIOR
	dw KoumoriDragonDescription ; KOUMORI_DRAGON
	dw TwoHeadedKingRexDescription ; TWO_HEADED_KING_REX
	dw JudgeManDescription ; JUDGE_MAN
	dw SaggiTheClownDescription ; SAGGI_THE_CLOWN
	dw DarkMagicianDescription ; DARK_MAGICIAN
	dw TheSnakeHairDescription ; THE_SNAKE_HAIR
	dw GaiaDragonChampDescription ; GAIA_DRAGON_CHAMP
	dw GaiaFierceKnightDescription ; GAIA_FIERCE_KNIGHT
	dw CurseOfDragonDescription ; CURSE_OF_DRAGON
	dw DragonPiperDescription ; DRAGON_PIPER
	dw CelticGuardianDescription ; CELTIC_GUARDIAN
	dw IllusionFacelessDescription ; ILLUSION_FACELESS
	dw KarbonalaWarriorDescription ; KARBONALA_WARRIOR
	dw RogueDollDescription ; ROGUE_DOLL
	dw WattkidDescription ; WATTKID
	dw GrifforeDescription ; GRIFFORE
	dw TorikeDescription ; TORIKE
	dw SanganDescription ; SANGAN
	dw BigInsectDescription ; BIG_INSECT
	dw BasicInsectDescription ; BASIC_INSECT
	dw ArmoredLizardDescription ; ARMORED_LIZARD
	dw HerculesBeetleDescription ; HERCULES_BEETLE
	dw KillerNeedleDescription ; KILLER_NEEDLE
	dw GokiboreDescription ; GOKIBORE
	dw GiantFleaDescription ; GIANT_FLEA
	dw LarvaeMothDescription ; LARVAE_MOTH
	dw GreatMothDescription ; GREAT_MOTH
	dw KuribohDescription ; KURIBOH
	dw MammothGraveyardDescription ; MAMMOTH_GRAVEYARD
	dw GreatWhiteDescription ; GREAT_WHITE
	dw WolfDescription ; WOLF
	dw HarpieLadyDescription ; HARPIE_LADY
	dw HarpieLadySisterDescription ; HARPIE_LADY_SISTER
	dw TigerAxeDescription ; TIGER_AXE
	dw SilverFangDescription ; SILVER_FANG
	dw KojikocyDescription ; KOJIKOCY
	dw PerfectGreatMothDescription ; PERFECT_GREAT_MOTH
	dw GaroozisDescription ; GAROOZIS
	dw ThousandDragonDescription ; THOUSAND_DRAGON
	dw FiendKrakenDescription ; FIEND_KRAKEN
	dw JellyfishDescription ; JELLYFISH
	dw CocoonEvolutionDescription ; COCOON_EVOLUTION
	dw KairyuShinDescription ; KAIRYU_SHIN
	dw SoldierOfStoneDescription ; SOLDIER_OF_STONE
	dw ManEatingPlantDescription ; MAN_EATING_PLANT
	dw KrokodilusDescription ; KROKODILUS
	dw GrapplerDescription ; GRAPPLER
	dw AxeRaiderDescription ; AXE_RAIDER
	dw MegazowlerDescription ; MEGAZOWLER
	dw UrabyDescription ; URABY
	dw CrawlingDragon2Description ; CRAWLING_DRAGON_2
	dw RedEyesBDragonDescription ; RED_EYES_B_DRAGON
	dw CastleOfDarkDescription ; CASTLE_OF_DARK
	dw ReaperOfTheCardDescription ; REAPER_OF_THE_CARD
	dw KingOfYamimakaiDescription ; KING_OF_YAMIMAKAI
	dw BaroxDescription ; BAROX
	dw DarkChimeraDescription ; DARK_CHIMERA
	dw MetalGuardianDescription ; METAL_GUARDIAN
	dw CatapultTurtleDescription ; CATAPULT_TURTLE
	dw GyakutennoMegamiDescription ; GYAKUTENNO_MEGAMI
	dw MysticHorsemanDescription ; MYSTIC_HORSEMAN
	dw RabidHorsemanDescription ; RABID_HORSEMAN
	dw ZankiDescription ; ZANKI
	dw CrawlingDragonDescription ; CRAWLING_DRAGON
	dw CrassClownDescription ; CRASS_CLOWN
	dw ArmoredZombieDescription ; ARMORED_ZOMBIE
	dw DragonZombieDescription ; DRAGON_ZOMBIE
	dw ClownZombieDescription ; CLOWN_ZOMBIE
	dw PumpkingTheKingDescription ; PUMPKING_THE_KING
	dw BattleWarriorDescription ; BATTLE_WARRIOR
	dw WingsOfFlameDescription ; WINGS_OF_FLAME
	dw MaskOfDarknessDescription ; MASK_OF_DARKNESS
	dw JobChangeMirrorDescription ; JOB_CHANGE_MIRROR
	dw CurtainOfDarkDescription ; CURTAIN_OF_DARK
	dw TomozaurusDescription ; TOMOZAURUS
	dw SpiritOfTheWindDescription ; SPIRIT_OF_THE_WIND
	dw KageningenDescription ; KAGENINGEN
	dw GraveyardAndHandDescription ; GRAVEYARD_AND_HAND
	dw GoddessThirdEyeDescription ; GODDESS_THIRD_EYE
	dw HeroOfTheEastDescription ; HERO_OF_THE_EAST
	dw DomaTheAngelDescription ; DOMA_THE_ANGEL
	dw ThatWhichFeedsDescription ; THAT_WHICH_FEEDS
	dw DarkGrayDescription ; DARK_GRAY
	dw WhiteMagicalHatDescription ; WHITE_MAGICAL_HAT
	dw KamionwizardDescription ; KAMIONWIZARD
	dw NightmareScorpionDescription ; NIGHTMARE_SCORPION
	dw SpiritOfTheBookDescription ; SPIRIT_OF_THE_BOOK
	dw SupporterShadowsDescription ; SUPPORTER_SHADOWS
	dw TrialOfNightmareDescription ; TRIAL_OF_NIGHTMARE
	dw DreamClownDescription ; DREAM_CLOWN
	dw SleepingLionDescription ; SLEEPING_LION
	dw YamatanoScrollDescription ; YAMATANO_SCROLL
	dw DarkPlantDescription ; DARK_PLANT
	dw AncientToolDescription ; ANCIENT_TOOL
	dw FaithBirdDescription ; FAITH_BIRD
	dw OrionTheBattleDescription ; ORION_THE_BATTLE
	dw AnsatsuDescription ; ANSATSU
	dw LamoonDescription ; LAMOON
	dw NemurikoDescription ; NEMURIKO
	dw WeatherControlDescription ; WEATHER_CONTROL
	dw OctoberserDescription ; OCTOBERSER
	dw The13thGraveDescription ; THE_13TH_GRAVE
	dw CharubinTheFireDescription ; CHARUBIN_THE_FIRE
	dw MysticalCaptureDescription ; MYSTICAL_CAPTURE
	dw FiendsHandDescription ; FIENDS_HAND
	dw WittyPhantomDescription ; WITTY_PHANTOM
	dw MysteryHandDescription ; MYSTERY_HAND
	dw DragonStatueDescription ; DRAGON_STATUE
	dw BEyedSilZombieDescription ; B_EYED_SIL_ZOMBIE
	dw ToadMasterDescription ; TOAD_MASTER
	dw SpikedSnailDescription ; SPIKED_SNAIL
	dw FlameManipulatorDescription ; FLAME_MANIPULATOR
	dw NecrolancerDescription ; NECROLANCER
	dw DjinnTheWatcherDescription ; DJINN_THE_WATCHER
	dw BewitchingPhantomDescription ; BEWITCHING_PHANTOM
	dw TempleOfSkullsDescription ; TEMPLE_OF_SKULLS
	dw MonsterEggDescription ; MONSTER_EGG
	dw ShadowWhoControlDescription ; SHADOW_WHO_CONTROL
	dw LordOfTheLampDescription ; LORD_OF_THE_LAMP
	dw AkihironDescription ; AKIHIRON
	dw RhaimundosRedDescription ; RHAIMUNDOS_RED
	dw MeltingRedShadowDescription ; MELTING_RED_SHADOW
	dw DokuroizoTheGrimDescription ; DOKUROIZO_THE_GRIM
	dw FireReaperDescription ; FIRE_REAPER
	dw LarvasDescription ; LARVAS
	dw HardArmorDescription ; HARD_ARMOR
	dw FiregrassDescription ; FIREGRASS
	dw ManEaterDescription ; MAN_EATER
	dw DigBeakDescription ; DIG_BEAK
	dw MWarrior1Description ; M_WARRIOR_1
	dw MWarrior2Description ; M_WARRIOR_2
	dw TaintedWisdomDescription ; TAINTED_WISDOM
	dw LisarkDescription ; LISARK
	dw LordOfZemiaDescription ; LORD_OF_ZEMIA
	dw TheJudgementHandDescription ; THE_JUDGEMENT_HAND
	dw MysteriousPuppetDescription ; MYSTERIOUS_PUPPET
	dw AncientJarDescription ; ANCIENT_JAR
	dw DarkfireDragonDescription ; DARKFIRE_DRAGON
	dw DarkKingAbyssDescription ; DARK_KING_ABYSS
	dw SpiritOfTheHarpDescription ; SPIRIT_OF_THE_HARP
	dw BigEyeDescription ; BIG_EYE
	dw ArmaillDescription ; ARMAILL
	dw DarkPrisonerDescription ; DARK_PRISONER
	dw HurricailDescription ; HURRICAIL
	dw AncientBrainDescription ; ANCIENT_BRAIN
	dw FireEyeDescription ; FIRE_EYE
	dw MonsturtleDescription ; MONSTURTLE
	dw ClawReacherDescription ; CLAW_REACHER
	dw PhantomDewanDescription ; PHANTOM_DEWAN
	dw ArlownayDescription ; ARLOWNAY
	dw DarkShadeDescription ; DARK_SHADE
	dw MaskedClownDescription ; MASKED_CLOWN
	dw LuckyTrinketDescription ; LUCKY_TRINKET
	dw GeninDescription ; GENIN
	dw EyearmorDescription ; EYEARMOR
	dw FiendReflection2Description ; FIEND_REFLECTION2
	dw GateDeegDescription ; GATE_DEEG
	dw SyncharDescription ; SYNCHAR
	dw FusionistDescription ; FUSIONIST
	dw AkakieisuDescription ; AKAKIEISU
	dw LalaLiOonDescription ; LALA_LI_OON
	dw KeyMaceDescription ; KEY_MACE
	dw TurtleTigerDescription ; TURTLE_TIGER
	dw TerraTheTerribleDescription ; TERRA_THE_TERRIBLE
	dw DoronDescription ; DORON
	dw ArmaKnightDescription ; ARMA_KNIGHT
	dw MechMoleZombieDescription ; MECH_MOLE_ZOMBIE
	dw HappyLoverDescription ; HAPPY_LOVER
	dw PenguinKnightDescription ; PENGUIN_KNIGHT
	dw PetitDragonDescription ; PETIT_DRAGON
	dw FrenziedPandaDescription ; FRENZIED_PANDA
	dw ArchfiendMarmotDescription ; ARCHFIEND_MARMOT
	dw PhantomGhostDescription ; PHANTOM_GHOST
	dw MabarrelDescription ; MABARREL
	dw DoroverDescription ; DOROVER
	dw TwinLongRods1Description ; TWIN_LONG_RODS_1
	dw DrollBirdDescription ; DROLL_BIRD
	dw PetitAngelDescription ; PETIT_ANGEL
	dw WingedCleaverDescription ; WINGED_CLEAVER
	dw HinotamaSoulDescription ; HINOTAMA_SOUL
	dw ThunderKidDescription ; THUNDER_KID
	dw MeotokoDescription ; MEOTOKO
	dw AquaMadoorDescription ; AQUA_MADOOR
	dw KagemushaBlueDescription ; KAGEMUSHA_BLUE
	dw FlameGhostDescription ; FLAME_GHOST
	dw DryadDescription ; DRYAD
	dw BSkullDragonDescription ; B_SKULL_DRAGON
	dw TwoMouthDarkrulerDescription ; TWO_MOUTH_DARKRULER
	dw SolitudeDescription ; SOLITUDE
	dw MaskedSorcererDescription ; MASKED_SORCERER
	dw KumootokoDescription ; KUMOOTOKO
	dw MidnightFiendDescription ; MIDNIGHT_FIEND
	dw RoarOceanSnakeDescription ; ROAR_OCEAN_SNAKE
	dw TrapMasterDescription ; TRAP_MASTER
	dw FiendSwordDescription ; FIEND_SWORD
	dw SkullStalkerDescription ; SKULL_STALKER
	dw HitodenchakDescription ; HITODENCHAK
	dw WoodRemainsDescription ; WOOD_REMAINS
	dw HourglassOfLifeDescription ; HOURGLASS_OF_LIFE
	dw RareFishDescription ; RARE_FISH
	dw WoodClownDescription ; WOOD_CLOWN
	dw MadjinnGunnDescription ; MADJINN_GUNN
	dw DarkTitanTerrorDescription ; DARK_TITAN_TERROR
	dw BeautifulHeadhuntDescription ; BEAUTIFUL_HEADHUNT
	dw WodanTheResidentDescription ; WODAN_THE_RESIDENT
	dw GuardianLabyrinthDescription ; GUARDIAN_LABYRINTH
	dw HaniwaDescription ; HANIWA
	dw YashinokiDescription ; YASHINOKI
	dw VishwarRandiDescription ; VISHWAR_RANDI
	dw TheDrdekDescription ; THE_DRDEK
	dw DAssailantDescription ; D_ASSAILANT
	dw CandleOfFateDescription ; CANDLE_OF_FATE
	dw WaterElementDescription ; WATER_ELEMENT
	dw DissolverockDescription ; DISSOLVEROCK
	dw MedaBatDescription ; MEDA_BAT
	dw OneWhoHuntsSoulDescription ; ONE_WHO_HUNTS_SOUL
	dw RootWaterDescription ; ROOT_WATER
	dw MasterAndExpertDescription ; MASTER_AND_EXPERT
	dw WaterOmoticsDescription ; WATER_OMOTICS
	dw HyoDescription ; HYO
	dw EnchantingMermaidDescription ; ENCHANTING_MERMAID
	dw Nekogal1Description ; NEKOGAL_1
	dw AngelwitchDescription ; ANGELWITCH
	dw EmbryonicBeastDescription ; EMBRYONIC_BEAST
	dw PreventRatDescription ; PREVENT_RAT
	dw DdWarriorDescription ; DD_WARRIOR
	dw StoneArmadillerDescription ; STONE_ARMADILLER
	dw BeastkingOfSwampDescription ; BEASTKING_OF_SWAMP
	dw AncientSorcererDescription ; ANCIENT_SORCERER
	dw LunarQueenElzaimDescription ; LUNAR_QUEEN_ELZAIM
	dw ArchfiendMirrorDescription ; ARCHFIEND_MIRROR
	dw SwordsmanOfAileDescription ; SWORDSMAN_OF_AILE
	dw RockOgreGrotto2Description ; ROCK_OGRE_GROTTO2
	dw WingEggElfDescription ; WING_EGG_ELF
	dw FuriousSeaKingDescription ; FURIOUS_SEA_KING
	dw PrincessTsurugiDescription ; PRINCESS_TSURUGI
	dw UnknownWarriorDescription ; UNKNOWN_WARRIOR
	dw SectarianSecretDescription ; SECTARIAN_SECRET
	dw VersagoDestroyerDescription ; VERSAGO_DESTROYER
	dw WethaDescription ; WETHA
	dw MegirusLightDescription ; MEGIRUS_LIGHT
	dw MavelusDescription ; MAVELUS
	dw AncientTreeDescription ; ANCIENT_TREE
	dw GreenPhantomKingDescription ; GREEN_PHANTOM_KING
	dw GroundAttackerDescription ; GROUND_ATTACKER
	dw RayAndTemperatureDescription ; RAY_AND_TEMPERATURE
	dw GorgonEggDescription ; GORGON_EGG
	dw PetitMothDescription ; PETIT_MOTH
	dw KingFogDescription ; KING_FOG
	dw ProtectorThroneDescription ; PROTECTOR_THRONE
	dw MysticClownDescription ; MYSTIC_CLOWN
	dw MysticalSheep2Description ; MYSTICAL_SHEEP_2
	dw HolograhDescription ; HOLOGRAH
	dw TaoTheChanterDescription ; TAO_THE_CHANTER
	dw SerpentMarauderDescription ; SERPENT_MARAUDER
	dw GatekeeperDescription ; GATEKEEPER
	dw OgreOfTheBlackDescription ; OGRE_OF_THE_BLACK
	dw DarkArtistDescription ; DARK_ARTIST
	dw ChangeSlimeDescription ; CHANGE_SLIME
	dw MoonEnvoyDescription ; MOON_ENVOY
	dw FireyarouDescription ; FIREYAROU
	dw PsychicKappaDescription ; PSYCHIC_KAPPA
	dw MasakiTheLegendDescription ; MASAKI_THE_LEGEND
	dw DragonessWickedDescription ; DRAGONESS_WICKED
	dw BioPlantDescription ; BIO_PLANT
	dw OneEyedShieldDescription ; ONE_EYED_SHIELD
	dw CyberSoldierDarkDescription ; CYBER_SOLDIER_DARK
	dw DragonErsatzHeadDescription ; DRAGON_ERSATZ_HEAD
	dw SonicMaidDescription ; SONIC_MAID
	dw KuramaDescription ; KURAMA
	dw LegendarySwordDescription ; LEGENDARY_SWORD
	dw SwordOfDarkDescription ; SWORD_OF_DARK
	dw DarkEnergyDescription ; DARK_ENERGY
	dw AxeOfDespairDescription ; AXE_OF_DESPAIR
	dw LazerCannonArmorDescription ; LAZER_CANNON_ARMOR
	dw InsectArmorLaserDescription ; INSECT_ARMOR_LASER
	dw ElfsLightDescription ; ELFS_LIGHT
	dw BeastFangsDescription ; BEAST_FANGS
	dw SteelShellDescription ; STEEL_SHELL
	dw VileGermsDescription ; VILE_GERMS
	dw BlackPendantDescription ; BLACK_PENDANT
	dw SilverBowAndArrowDescription ; SILVER_BOW_AND_ARROW
	dw HornOfLightDescription ; HORN_OF_LIGHT
	dw HornOfUnicornDescription ; HORN_OF_UNICORN
	dw DragonTreasureDescription ; DRAGON_TREASURE
	dw ElectroWhipDescription ; ELECTRO_WHIP
	dw CyberShieldDescription ; CYBER_SHIELD
	dw ElegantEgotistDescription ; ELEGANT_EGOTIST
	dw MysticalMoonDescription ; MYSTICAL_MOON
	dw StopDefenseDescription ; STOP_DEFENSE
	dw MalevolentNuzzlerDescription ; MALEVOLENT_NUZZLER
	dw VioletCrystalDescription ; VIOLET_CRYSTAL
	dw BookOfSecretArtDescription ; BOOK_OF_SECRET_ART
	dw InvigorationDescription ; INVIGORATION
	dw MachineConversionDescription ; MACHINE_CONVERSION
	dw RaiseBodyHeatDescription ; RAISE_BODY_HEAT
	dw FollowWindDescription ; FOLLOW_WIND
	dw PowerOfKaishinDescription ; POWER_OF_KAISHIN
	dw DragonCaptureJarDescription ; DRAGON_CAPTURE_JAR
	dw ForestDescription ; FOREST
	dw WastelandDescription ; WASTELAND
	dw MountainDescription ; MOUNTAIN
	dw SogenDescription ; SOGEN
	dw UmiDescription ; UMI
	dw YamiDescription ; YAMI
	dw DarkHoleDescription ; DARK_HOLE
	dw RaigekiDescription ; RAIGEKI
	dw MooyanCurryDescription ; MOOYAN_CURRY
	dw RedMedicineDescription ; RED_MEDICINE
	dw GoblinsRemedyDescription ; GOBLINS_REMEDY
	dw SoulOfThePureDescription ; SOUL_OF_THE_PURE
	dw DianKetoTheCureDescription ; DIAN_KETO_THE_CURE
	dw SparksDescription ; SPARKS
	dw HinotamaDescription ; HINOTAMA
	dw FinalFlameDescription ; FINAL_FLAME
	dw OokaziDescription ; OOKAZI
	dw TremendousFireDescription ; TREMENDOUS_FIRE
	dw SwordsRevealingDescription ; SWORDS_REVEALING
	dw SpellbindCircleDescription ; SPELLBIND_CIRCLE
	dw DarkPierceLightDescription ; DARK_PIERCE_LIGHT
	dw YaranzoDescription ; YARANZO
	dw KananTheSwordDescription ; KANAN_THE_SWORD
	dw TakriminosDescription ; TAKRIMINOS
	dw StuffedAnimalDescription ; STUFFED_ANIMAL
	dw MegasonicEyeDescription ; MEGASONIC_EYE
	dw SuperWarLionDescription ; SUPER_WAR_LION
	dw YamadronDescription ; YAMADRON
	dw SeiyaryuDescription ; SEIYARYU
	dw ThreeLeggedZombiesDescription ; THREE_LEGGED_ZOMBIES
	dw ZeraTheMantDescription ; ZERA_THE_MANT
	dw FlyingPenguinDescription ; FLYING_PENGUIN
	dw MillenniumShieldDescription ; MILLENNIUM_SHIELD
	dw FairysGiftDescription ; FAIRYS_GIFT
	dw BLusterSoldierDescription ; B_LUSTER_SOLDIER
	dw FiendsMirrorDescription ; FIENDS_MIRROR
	assert_table_length NUM_CARDS

BEyeWhiteDragonDescription:
	text "こうげき しゅびがさいこうの なか なかてにはいらない ちょうレアカ-ド"

MysticalElfDescription:
	text "かよわいエルフだが せいなるちからでみをまもり とてもしゅびがたかい  "

HitotsuMeGiantDescription:
	text "1つめの きょじん ふとい うでで なぐりかかぅてくる ようちゅうい  "

BabyDragonDescription:
	text "こどもドラゴンとあなどぅてはいけないうちにひめるちからは はかりしれない"

RyuKishinDescription:
	text "せきぞうとおもわせ やみのなかから こうげきをする にげあしもすばやい "

FeralImpDescription:
	text "いたずらずきの ちいさなあくま   くらやみからおそぅてくる きをつけろ"

WingedDragon1Description:
	text "やまのとりでをまもるりゅう てんくうからきゅうこうかして てきをこうげき"

MushroomManDescription:
	text "ジメジメしたところで ちからをはぅきかさから きんしをふりまき こうげき"

ShadowSpecterDescription:
	text "こうやにあらわれる けもののぼうれいかずがあつまると やぅかいなカ-ド "

BlacklandDragonDescription:
	text "くらやみの おくふかくにせいそくするドラゴン めはあまりよくない    "

SwordArmDragonDescription:
	text "ぜんしんに カタナのとげがついた  きょうりゅう とぅしんこうげきをする"

SwampBattleguardDescription:
	text "トゲつきこんぼうで あらゆるものを はかいする なぜ2ごうかはふめい  "

TyhoneDescription:
	text "くちからほうだんをうちだし とおくをこうげき やまでのほうげきはつよい "

BattleSteerDescription:
	text "もりにすむ うしのまじん つのを  つきだし とぅしんしてこうげき   "

FlameSwordsmanDescription:
	text "ほのおのちからを あわせもつ せんしほのおを はなつけんで こうげきする"

TimeWizardDescription:
	text "じかんをじゆうにあやつる まじゅつしどうみてもよわいが かなりやくにたつ"

RLegOfForbiddenDescription:
	text "ふういんされたみぎあし ふういんを とくと むげんのちからをえられる  "

LLegOfForbiddenDescription:
	text "ふういんされたひだりあし ふういんをとくと むげんのちからをえられる  "

RArmOfForbiddenDescription:
	text "ふういんされたみぎうで ふういんを とくと むげんのちからをえられる  "

LArmOfForbiddenDescription:
	text "ふういんされたひだりうで ふういんをとくと むげんのちからをえられる  "

ExodiaForbiddenDescription:
	text "くさりでしばられた うでとあしを  すべてあつめると ふういんがとける "

SummonedSkullDescription:
	text "やみのちからで こころをまどわす  あくまぞくでは かなりのレアカ-ド "

WickedWormBeastDescription:
	text "やみのちからで ミミズがモンスタ-かじめんから とつぜんあらわれこうげき"

SkullServantDescription:
	text "どこにでもでてくる ガイコツのおばけこうげきはよわいがあつまるとたいへん"

HornImpDescription:
	text "やみにすむ ちいさなオニ こうげきはいがいにつよい つのにはちゅうい  "

BattleOxDescription:
	text "すごいちからをもつ ウシのかいぶつ オノひとふりで なんでもなぎたおす "

BeaverWarriorDescription:
	text "からだはちいさいが そうげんでの  しゅびりょくは かなりつよい    "

RockOgreGrotto1Description:
	text "からだがいわのため しゅびはたかい ふというでの ひとふりにちゅうい  "

MountainWarriorDescription:
	text "あしばのわるいところでも ガンガン うごきまわる がんじょうなせんし  "

ZombieWarriorDescription:
	text "ガイコツせんし よわそうにみえるが すばやく するどいこうげきをくりだす"

KoumoriDragonDescription:
	text "きょうあくなドラゴン じゃあくな  ほのおをはき こころをじゃあくにする"

TwoHeadedKingRexDescription:
	text "きょうりゅうぞく さいきょうのレア カ-ド 2つのあたまでどうじこうげき"

JudgeManDescription:
	text "かちまけのない しょうぶが きらいなせんし こんぼうのこうげきはつよいぞ"

SaggiTheClownDescription:
	text "どこからともなくあらわれる どうけしふしぎなうごきで こうげきをかわす "

DarkMagicianDescription:
	text "まほうつかいとしては こうげきりょくしゅびりょくともに さいこうクラス "

TheSnakeHairDescription:
	text "どくへビの あたまをもつ モンスタ-めをあわせると いしにされてしまう "

GaiaDragonChampDescription:
	text "ドラゴンのスピ-ドに きしのちからがくわわり はげしいこうげきをしかける"

GaiaFierceKnightDescription:
	text "かぜよりも はやくはしるウマにのぅたきし とぅしんこうげきに ちゅうい "

CurseOfDragonDescription:
	text "じゃあくなドラゴン やみのちからを つかぅたこうげきは きょうりょくだ "

DragonPiperDescription:
	text "きみょうな もようが かかれたつぼ しゅびりょくは かなりのものがある "

CelticGuardianDescription:
	text "けんじゅつを まなんだエルフ    すばやいうごきで てきをほんろうする"

IllusionFacelessDescription:
	text "げんえいをみせ ひらりとこうげきを かわす まぼろしのレアカ-ド    "

KarbonalaWarriorDescription:
	text "みためは ふつうのせんしだが    つよい こうげきりょくを もぅている"

RogueDollDescription:
	text "せいなるちからを あやつるにんぎょうやみでのこうげきは きょうりょくだ "

WattkidDescription:
	text "かみなりこうげきは いがいとつよい あまくみると かんでんするぞ    "

GrifforeDescription:
	text "かたいからだで まもることがとくい はんぱなこうげきは はじきかえす  "

TorikeDescription:
	text "しゅびは みためほど たかくないが つのによるこうげきは きょうりょくだ"

SanganDescription:
	text "3つめの こがたあくま やみのなかでちからを はぅきすることができる  "

BigInsectDescription:
	text "みつりんにすむきょだいアり こうげきしゅびともに いがいとつよい    "

BasicInsectDescription:
	text "むれをなしてくらす こんちゅう   もりのなかは かれらの らくえんだ "

ArmoredLizardDescription:
	text "かたいからだのトカゲ おおきなくちでかみつかれたら ひとたまりもないぞ "

HerculesBeetleDescription:
	text "きょだいカブトムシ つのこうげきと かたいからだの まもりはきょうりょく"

KillerNeedleDescription:
	text "おおきなハチ いがいにつよいこうげきをする むれでおそわれると たいへん"

GokiboreDescription:
	text "まるいゴキブり ゴロゴロころがぅて こうげき しゅびが いがいとたかいぞ"

GiantFleaDescription:
	text "ちをすう きょだいノミ こうげきは かなりつよい ノミとあなどるときけん"

LarvaeMothDescription:
	text "ようちゅうのため かなりよわいが  せいちょうすると きょだいなガになる"

GreatMothDescription:
	text "きょだいなガ りんぷんをまきちらしてこうげき もりではかなりきょうりょく"

KuribohDescription:
	text "ちいさなあくま くらやみで いぅぱいでてくると とぅても じゃまだ   "

MammothGraveyardDescription:
	text "なかまの おはかをまもる マンモス はかあらしを ようしゃなく こうげき"

GreatWhiteDescription:
	text "きょだいな しろいサメ おおきな  くちでかみつかれたら のがれられない"

WolfDescription:
	text "いまでは あまりみかけない オオカミよくきくはなで えものをさがす   "

HarpieLadyDescription:
	text "ひとにはねのはえたけもの うつくしくかれいにまい するどくこうげきをする"

HarpieLadySisterDescription:
	text "チ-ムワ-クのよい さんしまい   やすむまもなく こうげきをしかける "

TigerAxeDescription:
	text "オノをてにしたじゅうせんし すばやいうごきから くりだすこうげきはつよい"

SilverFangDescription:
	text "はくぎんにかがやくオオカミ みためはうつくしいが せいかくはきょうぼう "

KojikocyDescription:
	text "ひとをかる きょうあくな かりうど いわをもくだく つよいちからをもつ "

PerfectGreatMothDescription:
	text "こんちゅうぞくさいきょうのモンスタ-グレ-トモスのさいしゅうけいたいだ!"

GaroozisDescription:
	text "りゅうのあたまをもつ じゅうせんし オノのこうげきは かなりきょうりょく"

ThousandDragonDescription:
	text "ドラゴンが いくせんねんもの    ときをへて せいちょうしたすがた  "

FiendKrakenDescription:
	text "うみにひそむきょだいイカ かいちゅうからとつぜんあらわれ こうげきをする"

JellyfishDescription:
	text "うみをただようクラゲ はんとうめいのからだで すがたをかくにんしにくい "

CocoonEvolutionDescription:
	text "ようちゅうをとりこみ せいちゅうに しんかさせることができる      "

KairyuShinDescription:
	text "うみのぬしとよばれる うみのドラゴンつなみをおこして すべてをのみこむ "

SoldierOfStoneDescription:
	text "がんせきのきょじんへい ふというでのこうげきは だいちをゆるがす    "

ManEatingPlantDescription:
	text "きれいなはなとおもわせ ちかづくひとをパクりとたべる にくしょくのはな "

KrokodilusDescription:
	text "ちえをもち さらにきょうぼうかした ワニ かたいうろこでこうげきをはじく"

GrapplerDescription:
	text "ずるがしこいへビ ふとくてながい  からだでしめつけるこうげきにちゅうい"

AxeRaiderDescription:
	text "オノをもつせんし かたてでオノを  ふりまわすこうげきは かなりつよい "

MegazowlerDescription:
	text "ぜんしんに つののはえたきょうりゅうとつげきこうげきは きょうれつだ  "

UrabyDescription:
	text "はしることが とくいなきょうりゅう するどいかぎづめで こうげきする  "

CrawlingDragon2Description:
	text "なんでも かみくだく くちをもつ  きょうりゅう そのこうげきはつよい "

RedEyesBDragonDescription:
	text "こうげきりょくは じょうきゅうレ<べ>ルまぼろしの ちょうレアカ-ドだ!  "

CastleOfDarkDescription:
	text "つねに やみをうみだし すべての  ものを おおいかくしてしまう    "

ReaperOfTheCardDescription:
	text "おおきなカマをふりかざし すべてを きりさく しゅびりょくはかなりたかい"

KingOfYamimakaiDescription:
	text "きょうだいな やみのちからをつかい まわりのものを すべてはかいする  "

BaroxDescription:
	text "くらやみのなかを とびまわり けむくじゃらの ながいうでで なぐりかかる"

DarkChimeraDescription:
	text "まかいに せいそくする モンスタ- やみのほのおをはき こうげきする  "

MetalGuardianDescription:
	text "まかいのたからを しゅごするあくま くらやみでのしゅびは そうとうかたい"

CatapultTurtleDescription:
	text "カタパルトから いろいろなものを  とばし こうらで こうげきをはじく "

GyakutennoMegamiDescription:
	text "せいなるちからで よわきものをまもりぎゃくてんのちからを あたえるめがみ"

MysticHorsemanDescription:
	text "ひととウマが ひとつになぅたばけものはしるのがはやく だれもおいつけない"

RabidHorsemanDescription:
	text "ウシとウマがいぅたいとなぅたばけものきょうりょくなこうげきをしかけてくる"

ZankiDescription:
	text "いぅきうちをこのむ いぅしゅんの  すきをついて いあいぬきでこうげき "

CrawlingDragonDescription:
	text "ちからがよわり そらをとべなくなぅたドラゴン しかしまだこうげきはつよい"

CrassClownDescription:
	text "やみのサ-カスでおどるピエロ その おどりをみていると ちからがぬける "

ArmoredZombieDescription:
	text "おんねんにより よみがえぅたむしゃ やみくもにふりまわすカタナにちゅうい"

DragonZombieDescription:
	text "まりょくにより よみがえぅたドラゴンはくいきはふれるものをふしょくさせる"

ClownZombieDescription:
	text "やみのちからで いきかえぅたピエロ フラフラとしたおどりでしへといざなう"

PumpkingTheKingDescription:
	text "おばけカボチャのおうさま しょくしゅをふぅておそぅてくる かなりてごわい"

BattleWarriorDescription:
	text "ぶきをいぅさいつかわず すでで   たたかいぬく かくとうせんし    "

WingsOfFlameDescription:
	text "あかぐろくもえるつばさ ぜんしんからほのおをふきだし こうげきする   "

MaskOfDarknessDescription:
	text "やみのまじゅつしがつくりあげたかめんめにみえない やみのちからでこうげき"

JobChangeMirrorDescription:
	text "あくまのかがみ こうげきをうけても われずに ダメ-ジをふせいでくれる "

CurtainOfDarkDescription:
	text "まじゅつしが つくりだしたカ-テン まほうつかいのちからが あがるという"

TomozaurusDescription:
	text "ちいさいが せいかくは きょうぼう なかまどうしで あらそいだす    "

SpiritOfTheWindDescription:
	text "きままに とびまわる かぜのせいれいきげんがわるいと あらしになる   "

KageningenDescription:
	text "じぅたいと かげにわかれて おそぅてくる ゆだんすると はさまれるぞ  "

GraveyardAndHandDescription:
	text "ししゃに さらなる ちからをあたえ いけるものを しへとさそう はかば "

GoddessThirdEyeDescription:
	text "ひたいにある かみのめで すべてを みとおすことができるめがみ     "

HeroOfTheEastDescription:
	text "はるかひがしのくにからきたといわれるサムライ てにするカタナはよくきれる"

DomaTheAngelDescription:
	text "しをつかさどるてんし こいつに   にらまれたら しからのがれられない "

ThatWhichFeedsDescription:
	text "あらゆるいきものの たましいをくい おのれのエネルギ-とするあくま   "

DarkGrayDescription:
	text "からだがはいいろのけもの あまり  みかけない きちょうないきもの   "

WhiteMagicalHatDescription:
	text "しろいタキシ-ド しろいシルクハットぜんしんが まぅしろなシ-フ    "

KamionwizardDescription:
	text "こんとんをあやつる まほうつかい  おおきなカマの こうげきはつよい  "

NightmareScorpionDescription:
	text "あくむをみせ うなされているあいだに3ぼんもある どくのしぅぽをさす  "

SpiritOfTheBookDescription:
	text "ほんのせいれい とてもたかいちえを もち たさいなこうげきをしかけてくる"

SupporterShadowsDescription:
	text "ものかげから こぅそりときょうりょくしてくれる かわいらしいこびと   "

TrialOfNightmareDescription:
	text "てきを かんおけにとじこめ じごくのつかいが グサりとはんけつをくだす "

DreamClownDescription:
	text "あまいおどりで えいえんにさめない ゆめのなかへ さそいこむ      "

SleepingLionDescription:
	text "ふだん ねむぅている もうじゅう  めをさますと てがつけられない   "

YamatanoScrollDescription:
	text "えまきのドラゴンが じぅたいかして こうげきする しゅびはかなりひくい "

DarkPlantDescription:
	text "おせんされたつちと やみのちからで そだてられたはな とてもきょうぼう "

AncientToolDescription:
	text "こだいぶんめいの いせきでみつかぅたはかいだけを もくてきとした きかい"

FaithBirdDescription:
	text "ひじょうに おのながいとり ぜんしんから せいなるひかりをはぅする   "

OrionTheBattleDescription:
	text "たたかいのかみ といわれているてんしそのたたかいをみたものはだれもいない"

AnsatsuDescription:
	text "やみのなかを おともたてず あいてにしのびよる あんさつせんもんのせんし"

LamoonDescription:
	text "つきにすむまほうつかい つきのもつ まりょくで あいてをみりょうする  "

NemurikoDescription:
	text "こどもだが すいまをあやつり 2どとさめることのない ねむりをさそう  "

WeatherControlDescription:
	text "てんきをじゆうにあやつれる やまの てんきがかわりやすいのはコイツのせい"

OctoberserDescription:
	text "サカナのあたま タコのあし とぅてもふしぎないきもの ヤりでこうげきする"

The13thGraveDescription:
	text "だれもいないはずの 13ばんめのはかから とつぜんあらわれたゾンビ   "

CharubinTheFireDescription:
	text "ほのおのなかでも びくともしない  かぅちゅうに みをつつんでいるきし "

MysticalCaptureDescription:
	text "せいなるちからで うごきをふうじる ことができる といわれているくさり "

FiendsHandDescription:
	text "こんとんのぬまから うでをのばし  いけるものを なかへとひきずりこむ "

WittyPhantomDescription:
	text "やみにとけこむ くろのタキシ-ドに みをつつんだ しをつかさどるあくま "

MysteryHandDescription:
	text "くうかんをゆがませ じげんのはざま からうでをのばし こうげきをしかける"

DragonStatueDescription:
	text "ドラゴンのたましいをもつ せきぞうのせんし じまんのけんでてきをきりさく"

BEyedSilZombieDescription:
	text "めからだす かいこうせんで あいてをゾンビにかえてしまうといわれている "

ToadMasterDescription:
	text "なんぜんねんもいきている カエルの せんにん おたまじゃくしでこうげき "

SpikedSnailDescription:
	text "やみのちからで しんかしたカタツムりてやあしがあり はやくうごける   "

FlameManipulatorDescription:
	text "ほのおのうみや ほのおのかべを   じざいにつくりだし こうげきする  "

NecrolancerDescription:
	text "すきなところへいけるという じくう りングからでてくる 1つめのまじん "

DjinnTheWatcherDescription:
	text "かぜをあやつり たつまきやとぅぷうをおこし しゅういのものをふきとばす "

BewitchingPhantomDescription:
	text "くろいマントをはおる キザなかいとうつえをふぅて あいてをみりょうする "

TempleOfSkullsDescription:
	text "ドクロとほねばかりの きみのわるい おてら ちかづくものをすいこむ   "

MonsterEggDescription:
	text "たまごのからに みをつつんだ なぞのせんし からをとばしてこうげきする "

ShadowWhoControlDescription:
	text "くらやみのなかに とけこむかげ   かなしばりで てきのうごきをふうじる"

LordOfTheLampDescription:
	text "まほうのランプからあらわれる まじんよびだしたものに ふくじゅうする  "

AkihironDescription:
	text "すいちゅうにひそんでいる えたいの しれないかぅこうをした ばけもの  "

RhaimundosRedDescription:
	text "あかき ほのおのけんを もぅたせんしほのおのそくばくで うごきをふうじる"

MeltingRedShadowDescription:
	text "からだをとかして あしもとのかげに もぐり てきのましたからこうげきする"

DokuroizoTheGrimDescription:
	text "じごくのいちげきで たましいを   うばおうとする しにがみ      "

FireReaperDescription:
	text "ほのおのやをてにするしにがみ その やにあたると ひだるまになるぞ   "

LarvasDescription:
	text "すばやくうごくとりのばけもの ほそくながいうでをからませ しめあげる  "

HardArmorDescription:
	text "こころのあるよろい かたいからだで ソルジャ-タックルをしかけてくる  "

FiregrassDescription:
	text "かざんのちかくに せいそくするくさ はなからかえんをふき こうげきする "

ManEaterDescription:
	text "ひとくいじんめんか どくのある   しょくしゅで こうげきしてくる   "

DigBeakDescription:
	text "へびのように ながいからだをまるめ かいてんしながら くちばしでこうげき"

MWarrior1Description:
	text "コンビプレ-がとくいなせんし つよいじりょくをはぅし だれもにげられない"

MWarrior2Description:
	text "コンビプレ-がとくいなせんし でんじコ-ティングされたよろいはがんじょう"

TaintedWisdomDescription:
	text "しょくしゅをつきさし のうさいぼうをみずからのものとする あくののうみそ"

LisarkDescription:
	text "サファイヤのめをもつけもの げんえいをみせ こんらんしたところをこうげき"

LordOfZemiaDescription:
	text "あいてをだまして はめつのみちへと いざなうことをとくいとするじゃしん "

TheJudgementHandDescription:
	text "かみがやどぅたてで さいごのしんぱんをくだし はげしいこうげきをくわえる"

MysteriousPuppetDescription:
	text "あいてを おもいどおりに あやつる にんぎょうつかい          "

AncientJarDescription:
	text "とてもこわれやすい おおむかしのつぼなかに なにかが ひそんでいるらしい"

DarkfireDragonDescription:
	text "まかいの しゃくねつの ほのおは  あらゆるものを いぅしゅんでけしさる"

DarkKingAbyssDescription:
	text "めいかいのおう かつて やみをすべてしはいするほどのちからがあぅたという"

SpiritOfTheHarpDescription:
	text "てんかいで ハ-プをかなでるせいれいそのねいろはまわりのこころをなごます"

BigEyeDescription:
	text "ぜんしん めだまだらけの ばけもの たくさんのめでさいみんじゅつをかける"

ArmaillDescription:
	text "つるぎじょうのおをもつかわぅたせんしりょうてとおで 3れんこうげきをする"

DarkPrisonerDescription:
	text "ひかりのはんしゃを たくみにあやつりじぶんのすがたを かくすことができる"

HurricailDescription:
	text "こうやで あれくるうたつまき    かぜのやいばで あいてをきりきざむ "

AncientBrainDescription:
	text "てんかいから ついほうされただてんしやみでのたたかいに すぐれている  "

FireEyeDescription:
	text "ほのおにつつまれためだま はねを  はばたかせ ほのおのかぜをおこす  "

MonsturtleDescription:
	text "とげのついた こうらをみにつけたカメとてもきょうぼうで ひとになつかない"

ClawReacherDescription:
	text "うでをじゆうにのばし するどいつめであいてをくしざしにすることができる "

PhantomDewanDescription:
	text "てきをのろい うごきをとめることが できるまほうつかい         "

ArlownayDescription:
	text "はなのなかのじょせいが どくかふん をまきちらす ちかづいてはいけない "

DarkShadeDescription:
	text "クりスタルから きょうれつなひかり をはぅして こうげきする      "

MaskedClownDescription:
	text "しのおどりをおどりながら てにする かまで てきをきりきざむせんし   "

LuckyTrinketDescription:
	text "ひょろひょろとしているが      せいなるちからに まもられている  "

GeninDescription:
	text "てじなのようなまほうで てきをたおすハトをだしてこうげきもする     "

EyearmorDescription:
	text "いろんなやつにへんしんして あいてをだましながらたたかうせんし     "

FiendReflection2Description:
	text "てにするかがみから なかまをよびだすことのできる とりのけもの     "

GateDeegDescription:
	text "おなかにじごくへつうじるとびらがありしょうかんもできるぶきみなモンスタ-"

SyncharDescription:
	text "うえにもしたにもあたまがある きもちわるいやつ くちからはレ-ザ-をはく"

FusionistDescription:
	text "てんしのようなはねと とてもながい しぅぽをもぅている ばけねこ    "

AkakieisuDescription:
	text "しののろいをかけてくる まほうつかいじゅもんをきくと きがとおくなる  "

LalaLiOonDescription:
	text "でんきをおびた くもがたのモンスタ-なんでもとかすきけんなあめをふらせる"

KeyMaceDescription:
	text "とてもちいさなてんし かわいらしさにまけ だれでもこころをひらいてしまう"

TurtleTigerDescription:
	text "こうらをもぅたトラ かたいこうらで みをまもり するどいきばでこうげき "

TerraTheTerribleDescription:
	text "ぬまちにすむ あくまのてさき みためほど つよくないが ゆだんはきんもつ"

DoronDescription:
	text "ドロロ-ンとぶんしんして はさみうちこうげきをしかけてくる ゆだんするな"

ArmaKnightDescription:
	text "おおむかしから うみをがいてきから まもぅている アンモナイトのせんし "

MechMoleZombieDescription:
	text "うでをロケットのように とばして  こうげきする アンデットモンスタ- "

HappyLoverDescription:
	text "あたまからハ-トビ-ムをだし てきをしあわせにする ちいさなてんし   "

PenguinKnightDescription:
	text "おおきなけんをもぅた<ぺ>ンギン はらですべりながら てきにむかぅてとつげき"

PetitDragonDescription:
	text "とてもちいさなドラゴン ちいさな  からだをいぅぱいにつかいこうげきする"

FrenziedPandaDescription:
	text "つねにふといたけをいぅぽんもぅておりせいかくはひじょうにきょうぼうである"

ArchfiendMarmotDescription:
	text "あくまのつのと つばさをもつビ-バ-どんぐりをなげつけて こうげきする "

PhantomGhostDescription:
	text "このよの じょうぶつできない れいがあつまぅてできた おんりょう    "

MabarrelDescription:
	text "たいほうのようなあくま めにみえないはやさで めだまのたまをはぅしゃする"

DoroverDescription:
	text "ドロドロした きもちわるいモンスタ-もうどくガスをはき こうげきをする "

TwinLongRods1Description:
	text "むちのようにながいうでで すこし  はなれたところでも こうげきできる "

DrollBirdDescription:
	text "くちばしがとてもおおきく おおごえでなき きのよわいあいてをおどろかせる"

PetitAngelDescription:
	text "ちょこまかうごき こうげきがなかなかあたらない とてもちいさなてんし  "

WingedCleaverDescription:
	text "かまのように はぅたつしたうでを  ふりまわし こうげきをしてくる   "

HinotamaSoulDescription:
	text "ものすごくあつい ほのおのかたまり そのからだで たいあたりしてくる  "

ThunderKidDescription:
	text "かみなりを からだのなかに ちくでんさせている なかせたときはきけん  "

MeotokoDescription:
	text "ひとつめのきょだいなかいぶつ めだまからビ-ムをはぅしゃしてこうげきする"

AquaMadoorDescription:
	text "みずをあやつるまほうつかい ぶあついみずのかべをつくり てきをおしつぶす"

KagemushaBlueDescription:
	text "シエンにつかえる かげむしゃ    するどいきれあじの めいとうをもつ "

FlameGhostDescription:
	text "からだをやかれ しんだもののぼうれいまわりのほのおは すべてをやきつくす"

DryadDescription:
	text "もりのせいれい くさきのちからを  かりて あいてのうごきをふうじる  "

BSkullDragonDescription:
	text "レアなあくまとドラゴンのゆうごうで うまれる ちょうレアなあくまりゅう "

TwoMouthDarkrulerDescription:
	text "くちが2つあるきょうりゅう つのに ちくでんし せなかのくちからほうでん"

SolitudeDescription:
	text "かはんしんがシカで たましいをすうという おおかまをもぅた けものせんし"

MaskedSorcererDescription:
	text "かめんをかぶり すがおをかくしているまどうし すがおをみたものはいない "

KumootokoDescription:
	text "きょだいクモが ちえをつけたすがた いとをはき うごきをふうじこめる  "

MidnightFiendDescription:
	text "しんやにあらわれる とりのばけもの よびだすにはいけにえがひつようという"

RoarOceanSnakeDescription:
	text "あらしにあらわれる おおうみへび  おおつなみをおこし すべてをのみこむ"

TrapMasterDescription:
	text "トラップをしかけるのがとくいなせんしそこなしのおとしあなが とくいわざ "

FiendSwordDescription:
	text "みにつけ のろいに うちかつことが できたものは ちからをえられるという"

SkullStalkerDescription:
	text "すばやくうごき あいてを はさみで とらえ どくばりをさす サソりせんし"

HitodenchakDescription:
	text "おせんされたみずで きょうぼうかしたヒトデ くちからようかいえきをはく "

WoodRemainsDescription:
	text "もりのぬしが たおれたあと あしき もののてにより よみがえぅたしかばね"

HourglassOfLifeDescription:
	text "いのちをつかさどるてんし いのちを みじかくするかわり ちからをあたえる"

RareFishDescription:
	text "けもののあたまをもつ めずらしい  さかな せいかくはとてもきょうぼう "

WoodClownDescription:
	text "いやなえみをうかべたあくま てにするカマで きようにこうげきをかわす  "

MadjinnGunnDescription:
	text "くちから たまをはぅしゃして    こうげきする せいぶつへいき    "

DarkTitanTerrorDescription:
	text "ゆめのなかに ひそむといわれるあくまねているあいだに いのちをうばう  "

BeautifulHeadhuntDescription:
	text "そのびぼうとはうらはらに カタナで かずおおくの くびをはねてきたおんな"

WodanTheResidentDescription:
	text "むかしから もりにすんでいるせんし もりのしょくぶつをあやつり こうげき"

GuardianLabyrinthDescription:
	text "めいかいへの いりぐちをまもるせんしきょかのないものは ようしゃなくきる"

HaniwaDescription:
	text "こだいおうの はかのなかにある   たからものをまもる つちにんぎょう "

YashinokiDescription:
	text "いしをもつヤシのき みをおとして  こうげき みのなかのミルクはおいしい"

VishwarRandiDescription:
	text "やみにつかえるおんなせんし あいてをちまつりにあげることがいきがい   "

TheDrdekDescription:
	text "めだまにあしのはえたばけもの たかくジャンプして かぎづめでこうげき  "

DAssailantDescription:
	text "サイコソ-ドとよばれる けんをもち まかいに くんりんする あんさつしゃ"

CandleOfFateDescription:
	text "ゆびさきの ほのおがきえたとき   あいてのうんめいが けぅていする  "

WaterElementDescription:
	text "みずにすんでいるせいれい まわりを きりでつつみこみ しかいをうばう  "

DissolverockDescription:
	text "マグマのなかから うまれたモンスタ-ものすごいねつでちかづくものはとける"

MedaBatDescription:
	text "こころのあしきものがつくぅためだまのあくま ダ-クボムで ばくはこうげき"

OneWhoHuntsSoulDescription:
	text "けんで きりつけられたものは    たましいを ぬかれてしまう     "

RootWaterDescription:
	text "うみにひそむはんぎょじん あんこくのおおつなみをおこして こうげきする "

MasterAndExpertDescription:
	text "けものつかいのたつじんと しゅじんにちゅうじつなけもの コンビはかんぺき"

WaterOmoticsDescription:
	text "かめから つぎつぎとあふれでるみずをりゅうにかえて こうげきしてくる  "

HyoDescription:
	text "ぜんしんが こおりでできているせんしふれるものをなんでもこおらせてしまう"

EnchantingMermaidDescription:
	text "うみをこうかいするものをゆうわくしておぼれさせる うつくしいにんぎょ  "

Nekogal1Description:
	text "ネコのようせい あいらしいすがたとはうらはらに すばやくてきをひぅかく "

AngelwitchDescription:
	text "てんしになるうんめいをせおぅていたがあこがれのまじょになぅたてんし   "

EmbryonicBeastDescription:
	text "かんぜんたいになれなかぅた みにくいあくま はらのあなはなんでもすいこむ"

PreventRatDescription:
	text "けがあつまり かたいかわのように  なぅている しゅびはかなりたかい  "

DdWarriorDescription:
	text "くうかんをきりさいてできた いじげんくうかんにあいてをとじこめる    "

StoneArmadillerDescription:
	text "からだが いしのようにかたい けで おおわれており まもりがかたい   "

BeastkingOfSwampDescription:
	text "あしもとをそこなしのぬまにかえて  あいてをジワジワとひきずりこむ   "

AncientSorcererDescription:
	text "かずおおくのつえをもち それぞれを つかいわけ たさいなこうげきをする "

LunarQueenElzaimDescription:
	text "つきをしゅごするきれいなめがみ つきあかりのカ-テンでこうげきをふせぐ "

ArchfiendMirrorDescription:
	text "かがみにうつるものにさいみんじゅつをかけ こうげきをよけるあくまのかがみ"

SwordsmanOfAileDescription:
	text "たびびとアイルにつきしたがうこびと トカゲにまたがり たたかうせんし  "

RockOgreGrotto2Description:
	text "がんせきが あつまぅてできたゴ-レムあいてをせきかして はかいする   "

WingEggElfDescription:
	text "たまごのからに みをつつむてんし  おおきなはねで こうげきをふせぐ  "

FuriousSeaKingDescription:
	text "いだいなうみのおう おわることのないおおつなみをよび てきをのみこむ  "

PrincessTsurugiDescription:
	text "おおくのつるぎをつかいこなすじょおうそのつるぎさばきは かなりのうでまえ"

UnknownWarriorDescription:
	text "すばやいうごきで しんくうをつくり だし あいてをきりきざむせんし   "

SectarianSecretDescription:
	text "やみをすうはいするまほうつかい まのてをよびだし くらやみへひきずりこむ"

VersagoDestroyerDescription:
	text "やみのなかからうまれた はかいのかみはかいのあらしをよびだして こうげき"

WethaDescription:
	text "あめをあやつるせいれい たいふうを よびだし さまざまなものをふきとばす"

MegirusLightDescription:
	text "ブキミなめから あしきひかりを   はなち あいてにダメ-ジをあたえる "

MavelusDescription:
	text "こうざんにすむ ひのとりのなかま  くちからほのおをはき まわりをやく "

AncientTreeDescription:
	text "ありとあらゆる ちしきをくしして  さまざまな こうげきをふせぐ    "

GreenPhantomKingDescription:
	text "あおあおとおいしげる きにかこまれてくらす もりをおさめる わかきおう "

GroundAttackerDescription:
	text "りくじょうせんとうロボット いまは ダメだが うみでもつかえたらしい  "

RayAndTemperatureDescription:
	text "なかのよい きたかぜとたいよう   かまいたちと ねつこうせんでこうげき"

GorgonEggDescription:
	text "ゴ-ゴンがうんだたまご おおきなめにうつぅたものがうまれるといわれている"

PetitMothDescription:
	text "せいちょうしたら どんなムシになるかわからない ちいさな ようちゅう  "

KingFogDescription:
	text "けむりのなかにひそむあくま まわりをけむりでおおい みえなくしてしまう "

ProtectorThroneDescription:
	text "おうがるすのあいだ おうざをがいてきからまもるおうひ しゅびはかたい  "

MysticClownDescription:
	text "くるぅたちからをつかい こうげきするそのぼうそうは だれにもとめられない"

MysticalSheep2Description:
	text "しぅぽのながいひつじ しぅぽをつかいさいみんじゅつをかけ すいまをさそう"

HolograhDescription:
	text "さまざまなげんそうをみせ そのスキをついて こうげきしてくるきかい   "

TaoTheChanterDescription:
	text "いんとようのちからを しんしょくさせゆがんだちからを うみだすまどうし "

SerpentMarauderDescription:
	text "めが1つしかないへビ れいきを   はきだし あいてをこおりづけにする "

GatekeeperDescription:
	text "いりぐちをまもるために つくられた きかい こわすのは たいへんだ   "

OgreOfTheBlackDescription:
	text "くろいかげに とりつかれたオ-ガ  すごいスピ-ドで とつげきしてくる "

DarkArtistDescription:
	text "あくのげいじゅつか つぎつぎとつくりだすオブジェで てきをおしつぶす  "

ChangeSlimeDescription:
	text "かたちをじゆうにかえ さまざまな  ものにへんしんするスライム     "

MoonEnvoyDescription:
	text "つきのめがみに つかえるせんし   みかづきのような ほこでこうげき  "

FireyarouDescription:
	text "ほのおにつつまれたまじん まわりの ほのおをじざいにあやつりこうげきする"

PsychicKappaDescription:
	text "いろいろな ちょうのうりょくをつかいこうげきのダメ-ジを ふせぐカッパ "

MasakiTheLegendDescription:
	text "ひゃくにんぎりを なしとげたと   いわれる でんせつのけんごう    "

DragonessWickedDescription:
	text "ドラゴンのそうびで ちからをえたきしそらから てきをなんどもきりつける "

BioPlantDescription:
	text "ちかけんきゅうじょでの じぅけんで だいしぅぱいして うまれたばけもの "

OneEyedShieldDescription:
	text "みにつけたたては みをまもるだけで なく とつげきにもつかえる     "

CyberSoldierDarkDescription:
	text "やみのちからでつくられた きかいへいくるぅたように てきをはかいする  "

DragonErsatzHeadDescription:
	text "もうひとつの あたまをもつドラゴン ふたつのくちで てきをかみくだく  "

SonicMaidDescription:
	text "おとをあつかうのが とくいなオトメ おんぷの かまをつかい こうげきする"

KuramaDescription:
	text "しぅぽが ながいとり そのしぅぽで くうちゅうから こうげきする    "

LegendarySwordDescription:
	text "せんしのもつ かくれたちからを ひきだせるけん やみのものにはつかえない"

SwordOfDarkDescription:
	text "あくにこころをうぅたせんしが やみのちからをえて パワ-アップできる  "

DarkEnergyDescription:
	text "あくまなど やみのモンスタ-は   60パ-セントパワ-アップするぞ! "

AxeOfDespairDescription:
	text "デ-モンや じゅうせんしなどは   つねにさいこうのちからをはぅきできる"

LazerCannonArmorDescription:
	text "こんちゅうなどに そうびさせると  きょうりょくなレ-ザ-をうてる   "

InsectArmorLaserDescription:
	text "しゃくねつの ほのおを ほうしゃするこんちゅうなどが そうびかのう   "

ElfsLightDescription:
	text "エルフたちが パワ-アップできる  せいれいのはなつ せいなるひかり  "

BeastFangsDescription:
	text "けものなど キバをもつものは パワ-アップして ちからをはぅきできる  "

SteelShellDescription:
	text "こうらパワ-でパワ-アップ こうらをもたないものには こうかがないという"

VileGermsDescription:
	text "あくまがつくる さいきんで もりの しょくぶつたちは パワ-アップだ! "

BlackPendantDescription:
	text "この<ぺ>ンダントをみにつけると やみのまほうつかいなどは パワ-アップする"

SilverBowAndArrowDescription:
	text "てんしなどが そうびすると パワ- アップできる ぎんのゆみや     "

HornOfLightDescription:
	text "つのをもつものが パワ-アップ   やみのモンスタ-には こうかがないぞ"

HornOfUnicornDescription:
	text "あたまに つのをもつ        やみのモンスタ-が パワ-アップだ!"

DragonTreasureDescription:
	text "どんなドラゴンでも パワ-アップ  できるという でんせつのたからもの "

ElectroWhipDescription:
	text "あいてをしびれさせるむち じょせい などが そうびするとパワ-アップだ!"

CyberShieldDescription:
	text "じょせいモンスタ-が みにつけると せいかくがかわぅてパワ-アップするぞ"

ElegantEgotistDescription:
	text "ハ-ピィ·レディにつかうと 3たいにぶんしんして こうげきをかけられるぞ"

MysticalMoonDescription:
	text "つきのひかりがもつまりょくで けものなどは パワ-アップしてきょうぼうか"

StopDefenseDescription:
	text "あいてのカ-ドを つねにこうげき  ひょうじにして しゅびにできなくする"

MalevolentNuzzlerDescription:
	text "じょせいや やみのモンスタ-が   あくまのちからでパワ-アップする  "

VioletCrystalDescription:
	text "すいしょうにひめられたまりょくによりアンデットなどは パワ-アップする "

BookOfSecretArtDescription:
	text "まほうつかいのちからを アップできるほん こころのあしきものはよめない "

InvigorationDescription:
	text "いかずち がんせき ほのお などの モンスタ-は パワ-アップするゾ! "

MachineConversionDescription:
	text "ありとあらゆるきかいを チュ-ン  アップしてくれる かいぞうこうじょう"

RaiseBodyHeatDescription:
	text "たいようからエネルギ-をきゅうしゅうきょうりゅうなどは パワ-アップ! "

FollowWindDescription:
	text "ちょうじゅうなど そらをとぶものは かぜのえんごをうけて パワ-アップ "

PowerOfKaishinDescription:
	text "みず さかな かいりゅうぞくなどは ポセイドンのちからで パワ-アップだ"

DragonCaptureJarDescription:
	text "フィ-ルドにいる すべてのドラゴン ぞくのモンスタ-をふういんしてしまう"

ForestDescription:
	text "こんちゅう けものがとくいとする  みどりいぅぱいのフィ-ルドにチェンジ"

WastelandDescription:
	text "きょうりゅう アンデットがつよくなるあれはてたフィ-ルドにチェンジだ! "

MountainDescription:
	text "ドラゴン ちょうじゅうがとくいとするだいさんみゃくにフィ-ルドチェンジ!"

SogenDescription:
	text "みわたすかぎりそうげんのフィ-ルドにチェンジ せんしたちがパワ-アップ!"

UmiDescription:
	text "フィ-ルドをおおうなばらにチェンジ みずのモンスタ-がパワ-アップだ! "

YamiDescription:
	text "あくま まほうつかいがとくいとする くらやみのフィ-ルドにチェンジ!  "

DarkHoleDescription:
	text "フィ-ルドにそんざいする すべての モンスタ-をようしゃなくすいこむ! "

RaigekiDescription:
	text "あいてのモンスタ-すべてに でんげきをくらわせ ぜんめつさせる!    "

MooyanCurryDescription:
	text "ライフポイントが200かいふく   とぅてもおいしい ビ-フカレ-だ  "

RedMedicineDescription:
	text "まほうつかいがちょうごうした ライフポイントを500かいふくできるくすり"

GoblinsRemedyDescription:
	text "ライフポイントを1000かいふく  するといわれる ゴブりンのもつくすり"

SoulOfThePureDescription:
	text "てんしがみずからきずつけあつめた ちライフポイントを2000かいふくする"

DianKetoTheCureDescription:
	text "どんなきずもいやしてくれる かみさまライフポイントが5000もかいふく!"

SparksDescription:
	text "ひのこをふらせて あいてのライフ  ポイントに200のダメ-ジをあたえる"

HinotamaDescription:
	text "ひのたまをなげつけ あいてのライフ ポイントに500のダメ-ジをあたえる"

FinalFlameDescription:
	text "ひあぶりのけいにかけ あいてのライフを1000ポイントげんしょうさせる "

OokaziDescription:
	text "1にちもえつづけるおおかじで あいてのライフポイントに2000のダメ-ジ"

TremendousFireDescription:
	text "あいてのライフポイントを5000も うばう しゃくねつじごくをはぅせい "

SwordsRevealingDescription:
	text "てきのモンスタ-が みえるようになりさらに てきは3タ-ンうごけない! "

SpellbindCircleDescription:
	text "ろくぼうせいの のろいで あいての モンスタ-は すべてパワ-ダウン  "

DarkPierceLightDescription:
	text "まばゆいひかりで フィ-ルドの   モンスタ-が すべてみえるようになる"

YaranzoDescription:
	text "たからばこの ふたをあけようとする とうぞくを はこからとびだしおそう "

KananTheSwordDescription:
	text "チョウようにまい ハチのようにさす けんとたてをてにした おんなせんし "

TakriminosDescription:
	text "からだにヒレをもち すいちゅうでも じゆうにうごける かいりゅうのなかま"

StuffedAnimalDescription:
	text "かわいらしいぬいぐるみ とおもわせ チャックのくちで ガブりとかみつく "

MegasonicEyeDescription:
	text "うちゅうのはてからやぅてきた さつじんマシン なぞのきんぞくでできている"

SuperWarLionDescription:
	text "とてもきょうぼうなライオン するどくのびたかぎづめで あいてをひきさく "

YamadronDescription:
	text "3つのあたまで つぎつぎほのおをはきあたりいちめんをほのおのうみにする!"

SeiyaryuDescription:
	text "せいなるほのおで あしきものをやきはらう しんせいなちからをもつドラゴン"

ThreeLeggedZombiesDescription:
	text "ほそぅちょと でぶぅちょの なかよしガイコツ2ふたりぐみ あるきにくそう"

ZeraTheMantDescription:
	text "おおきなからだと かぎづめでこうげきかなりつよい きょうあくなモンスタ-"

FlyingPenguinDescription:
	text "みみのようにもみえる あたまについたはねでそらをとぶ めずらしい<ぺ>ンギン"

MillenniumShieldDescription:
	text "せんねんアイテムのひとつ どんなに つよいこうげきでも ふせげるという "

FairysGiftDescription:
	text "だれもが しあわせになれるという  まほうをふりまきながら とびまわる "

BLusterSoldierDescription:
	text "ブル-アイズホワイトドラゴンとおなじのうりょくをもつ さいきょうのせんし"

FiendsMirrorDescription:
	text "あくのかがみ うつるものをすべてを かがみのなかのせかいへすいこむ"
