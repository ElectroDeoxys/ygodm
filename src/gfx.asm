SECTION "Gfx 1", ROMX, BANK[$10]

	dw BANK(@)

Func_40002::
	push af
	push hl
	ld a, d
	cp $00
	jr nz, .asm_40016
	sla c
	rl b
	ld hl, PtrTable_40028
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	jr .done
.asm_40016
	cp $01
	jr nz, .done
	sla c
	rl b
	ld hl, PtrTable_43e84
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
.done
	pop hl
	pop af
	ret

PtrTable_40028:
	dw BEyeWhiteDragonGfx    ; B_EYE_WHITE_DRAGON
	dw MysticalElfGfx        ; MYSTICAL_ELF
	dw HitotsuMeGiantGfx     ; HITOTSU_ME_GIANT
	dw BabyDragonGfx         ; BABY_DRAGON
	dw RyuKishinGfx          ; RYU_KISHIN
	dw FeralImpGfx           ; FERAL_IMP
	dw WingedDragon1Gfx      ; WINGED_DRAGON_1
	dw MushroomManGfx        ; MUSHROOM_MAN
	dw ShadowSpecterGfx      ; SHADOW_SPECTER
	dw BlacklandDragonGfx    ; BLACKLAND_DRAGON
	dw SwordArmDragonGfx     ; SWORD_ARM_DRAGON
	dw SwampBattleguardGfx   ; SWAMP_BATTLEGUARD
	dw TyhoneGfx             ; TYHONE
	dw BattleSteerGfx        ; BATTLE_STEER
	dw FlameSwordsmanGfx     ; FLAME_SWORDSMAN
	dw TimeWizardGfx         ; TIME_WIZARD
	dw RLegOfForbiddenGfx    ; R_LEG_OF_FORBIDDEN
	dw LLegOfForbiddenGfx    ; L_LEG_OF_FORBIDDEN
	dw RArmOfForbiddenGfx    ; R_ARM_OF_FORBIDDEN
	dw LArmOfForbiddenGfx    ; L_ARM_OF_FORBIDDEN
	dw ExodiaForbiddenGfx    ; EXODIA_FORBIDDEN
	dw SummonedSkullGfx      ; SUMMONED_SKULL
	dw WickedWormBeastGfx    ; WICKED_WORM_BEAST
	dw SkullServantGfx       ; SKULL_SERVANT
	dw HornImpGfx            ; HORN_IMP
	dw BattleOxGfx           ; BATTLE_OX
	dw BeaverWarriorGfx      ; BEAVER_WARRIOR
	dw RockOgreGrotto1Gfx    ; ROCK_OGRE_GROTTO1
	dw MountainWarriorGfx    ; MOUNTAIN_WARRIOR
	dw ZombieWarriorGfx      ; ZOMBIE_WARRIOR
	dw KoumoriDragonGfx      ; KOUMORI_DRAGON
	dw TwoHeadedKingRexGfx   ; TWO_HEADED_KING_REX
	dw JudgeManGfx           ; JUDGE_MAN
	dw SaggiTheClownGfx      ; SAGGI_THE_CLOWN
	dw DarkMagicianGfx       ; DARK_MAGICIAN
	dw TheSnakeHairGfx       ; THE_SNAKE_HAIR
	dw GaiaDragonChampGfx    ; GAIA_DRAGON_CHAMP
	dw GaiaFierceKnightGfx   ; GAIA_FIERCE_KNIGHT
	dw CurseOfDragonGfx      ; CURSE_OF_DRAGON
	dw DragonPiperGfx        ; DRAGON_PIPER
	dw CelticGuardianGfx     ; CELTIC_GUARDIAN
	dw IllusionFacelessGfx   ; ILLUSION_FACELESS
	dw KarbonalaWarriorGfx   ; KARBONALA_WARRIOR
	dw RogueDollGfx          ; ROGUE_DOLL
	dw WattkidGfx            ; WATTKID
	dw GrifforeGfx           ; GRIFFORE
	dw TorikeGfx             ; TORIKE
	dw SanganGfx             ; SANGAN
	dw BigInsectGfx          ; BIG_INSECT
	dw BasicInsectGfx        ; BASIC_INSECT
	dw ArmoredLizardGfx      ; ARMORED_LIZARD
	dw HerculesBeetleGfx     ; HERCULES_BEETLE
	dw KillerNeedleGfx       ; KILLER_NEEDLE
	dw GokiboreGfx           ; GOKIBORE
	dw GiantFleaGfx          ; GIANT_FLEA
	dw LarvaeMothGfx         ; LARVAE_MOTH
	dw GreatMothGfx          ; GREAT_MOTH
	dw KuribohGfx            ; KURIBOH
	dw MammothGraveyardGfx   ; MAMMOTH_GRAVEYARD
	dw GreatWhiteGfx         ; GREAT_WHITE
	dw WolfGfx               ; WOLF
	dw HarpieLadyGfx         ; HARPIE_LADY
	dw HarpieLadySisterGfx   ; HARPIE_LADY_SISTER
	dw TigerAxeGfx           ; TIGER_AXE
	dw SilverFangGfx         ; SILVER_FANG
	dw KojikocyGfx           ; KOJIKOCY
	dw PerfectGreatMothGfx   ; PERFECT_GREAT_MOTH
	dw GaroozisGfx           ; GAROOZIS
	dw ThousandDragonGfx     ; THOUSAND_DRAGON
	dw FiendKrakenGfx        ; FIEND_KRAKEN
	dw JellyfishGfx          ; JELLYFISH
	dw CocoonEvolutionGfx    ; COCOON_EVOLUTION
	dw KairyuShinGfx         ; KAIRYU_SHIN
	dw SoldierOfStoneGfx     ; SOLDIER_OF_STONE
	dw ManEatingPlantGfx     ; MAN_EATING_PLANT
	dw KrokodilusGfx         ; KROKODILUS
	dw GrapplerGfx           ; GRAPPLER
	dw AxeRaiderGfx          ; AXE_RAIDER
	dw MegazowlerGfx         ; MEGAZOWLER
	dw UrabyGfx              ; URABY
	dw CrawlingDragon2Gfx    ; CRAWLING_DRAGON_2
	dw RedEyesBDragonGfx     ; RED_EYES_B_DRAGON
	dw CastleOfDarkGfx       ; CASTLE_OF_DARK
	dw ReaperOfTheCardGfx    ; REAPER_OF_THE_CARD
	dw KingOfYamimakaiGfx    ; KING_OF_YAMIMAKAI
	dw BaroxGfx              ; BAROX
	dw DarkChimeraGfx        ; DARK_CHIMERA
	dw MetalGuardianGfx      ; METAL_GUARDIAN
	dw CatapultTurtleGfx     ; CATAPULT_TURTLE
	dw GyakutennoMegamiGfx   ; GYAKUTENNO_MEGAMI
	dw MysticHorsemanGfx     ; MYSTIC_HORSEMAN
	dw RabidHorsemanGfx      ; RABID_HORSEMAN
	dw ZankiGfx              ; ZANKI
	dw CrawlingDragonGfx     ; CRAWLING_DRAGON
	dw CrassClownGfx         ; CRASS_CLOWN
	dw ArmoredZombieGfx      ; ARMORED_ZOMBIE
	dw DragonZombieGfx       ; DRAGON_ZOMBIE
	dw ClownZombieGfx        ; CLOWN_ZOMBIE
	dw PumpkingTheKingGfx    ; PUMPKING_THE_KING
	dw BattleWarriorGfx      ; BATTLE_WARRIOR
	dw WingsOfFlameGfx       ; WINGS_OF_FLAME
	dw MaskOfDarknessGfx     ; MASK_OF_DARKNESS
	dw JobChangeMirrorGfx    ; JOB_CHANGE_MIRROR
	dw CurtainOfDarkGfx      ; CURTAIN_OF_DARK
	dw TomozaurusGfx         ; TOMOZAURUS
	dw SpiritOfTheWindGfx    ; SPIRIT_OF_THE_WIND
	dw KageningenGfx         ; KAGENINGEN
	dw GraveyardAndHandGfx   ; GRAVEYARD_AND_HAND
	dw GoddessThirdEyeGfx    ; GODDESS_THIRD_EYE
	dw HeroOfTheEastGfx      ; HERO_OF_THE_EAST
	dw DomaTheAngelGfx       ; DOMA_THE_ANGEL
	dw ThatWhichFeedsGfx     ; THAT_WHICH_FEEDS
	dw DarkGrayGfx           ; DARK_GRAY
	dw WhiteMagicalHatGfx    ; WHITE_MAGICAL_HAT
	dw KamionwizardGfx       ; KAMIONWIZARD
	dw NightmareScorpionGfx  ; NIGHTMARE_SCORPION
	dw SpiritOfTheBookGfx    ; SPIRIT_OF_THE_BOOK
	dw SupporterShadowsGfx   ; SUPPORTER_SHADOWS
	dw TrialOfNightmareGfx   ; TRIAL_OF_NIGHTMARE
	dw DreamClownGfx         ; DREAM_CLOWN
	dw SleepingLionGfx       ; SLEEPING_LION
	dw YamatanoScrollGfx     ; YAMATANO_SCROLL
	dw DarkPlantGfx          ; DARK_PLANT
	dw AncientToolGfx        ; ANCIENT_TOOL
	dw FaithBirdGfx          ; FAITH_BIRD
	dw OrionTheBattleGfx     ; ORION_THE_BATTLE
	dw AnsatsuGfx            ; ANSATSU
	dw LamoonGfx             ; LAMOON
	dw NemurikoGfx           ; NEMURIKO
	dw WeatherControlGfx     ; WEATHER_CONTROL
	dw OctoberserGfx         ; OCTOBERSER
	dw The13thGraveGfx       ; THE_13TH_GRAVE
	dw CharubinTheFireGfx    ; CHARUBIN_THE_FIRE
	dw MysticalCaptureGfx    ; MYSTICAL_CAPTURE
	dw FiendsHandGfx         ; FIENDS_HAND
	dw WittyPhantomGfx       ; WITTY_PHANTOM
	dw MysteryHandGfx        ; MYSTERY_HAND
	dw DragonStatueGfx       ; DRAGON_STATUE
	dw BEyedSilZombieGfx     ; B_EYED_SIL_ZOMBIE
	dw ToadMasterGfx         ; TOAD_MASTER
	dw SpikedSnailGfx        ; SPIKED_SNAIL
	dw FlameManipulatorGfx   ; FLAME_MANIPULATOR
	dw NecrolancerGfx        ; NECROLANCER
	dw DjinnTheWatcherGfx    ; DJINN_THE_WATCHER
	dw BewitchingPhantomGfx  ; BEWITCHING_PHANTOM
	dw TempleOfSkullsGfx     ; TEMPLE_OF_SKULLS
	dw MonsterEggGfx         ; MONSTER_EGG
	dw ShadowWhoControlGfx   ; SHADOW_WHO_CONTROL
	dw LordOfTheLampGfx      ; LORD_OF_THE_LAMP
	dw AkihironGfx           ; AKIHIRON
	dw RhaimundosRedGfx      ; RHAIMUNDOS_RED
	dw MeltingRedShadowGfx   ; MELTING_RED_SHADOW
	dw DokuroizoTheGrimGfx   ; DOKUROIZO_THE_GRIM
	dw FireReaperGfx         ; FIRE_REAPER
	dw LarvasGfx             ; LARVAS
	dw HardArmorGfx          ; HARD_ARMOR
	dw FiregrassGfx          ; FIREGRASS
	dw ManEaterGfx           ; MAN_EATER
	dw DigBeakGfx            ; DIG_BEAK
	dw MWarrior1Gfx          ; M_WARRIOR_1
	dw MWarrior2Gfx          ; M_WARRIOR_2
	dw TaintedWisdomGfx      ; TAINTED_WISDOM
	dw LisarkGfx             ; LISARK
	dw LordOfZemiaGfx        ; LORD_OF_ZEMIA
	dw TheJudgementHandGfx   ; THE_JUDGEMENT_HAND
	dw MysteriousPuppetGfx   ; MYSTERIOUS_PUPPET
	dw AncientJarGfx         ; ANCIENT_JAR
	dw DarkfireDragonGfx     ; DARKFIRE_DRAGON
	dw DarkKingAbyssGfx      ; DARK_KING_ABYSS
	dw SpiritOfTheHarpGfx    ; SPIRIT_OF_THE_HARP
	dw BigEyeGfx             ; BIG_EYE
	dw ArmaillGfx            ; ARMAILL
	dw DarkPrisonerGfx       ; DARK_PRISONER
	dw HurricailGfx          ; HURRICAIL
	dw AncientBrainGfx       ; ANCIENT_BRAIN
	dw FireEyeGfx            ; FIRE_EYE
	dw MonsturtleGfx         ; MONSTURTLE
	dw ClawReacherGfx        ; CLAW_REACHER
	dw PhantomDewanGfx       ; PHANTOM_DEWAN
	dw ArlownayGfx           ; ARLOWNAY
	dw DarkShadeGfx          ; DARK_SHADE
	dw MaskedClownGfx        ; MASKED_CLOWN
	dw LuckyTrinketGfx       ; LUCKY_TRINKET
	dw GeninGfx              ; GENIN
	dw EyearmorGfx           ; EYEARMOR
	dw FiendReflection2Gfx   ; FIEND_REFLECTION2
	dw GateDeegGfx           ; GATE_DEEG
	dw SyncharGfx            ; SYNCHAR
	dw FusionistGfx          ; FUSIONIST
	dw AkakieisuGfx          ; AKAKIEISU
	dw LalaLiOonGfx          ; LALA_LI_OON
	dw KeyMaceGfx            ; KEY_MACE
	dw TurtleTigerGfx        ; TURTLE_TIGER
	dw TerraTheTerribleGfx   ; TERRA_THE_TERRIBLE
	dw DoronGfx              ; DORON
	dw ArmaKnightGfx      ; ARMA_KNIGHT
	dw MechMoleZombieGfx         ; MECH_MOLE_ZOMBIE
	dw HappyLoverGfx     ; HAPPY_LOVER
	dw PenguinKnightGfx         ; PENGUIN_KNIGHT
	dw PetitDragonGfx        ; PETIT_DRAGON
	dw FrenziedPandaGfx      ; FRENZIED_PANDA
	dw ArchfiendMarmotGfx    ; ARCHFIEND_MARMOT
	dw PhantomGhostGfx       ; PHANTOM_GHOST
	dw MabarrelGfx           ; MABARREL
	dw DoroverGfx            ; DOROVER
	dw TwinLongRods1Gfx      ; TWIN_LONG_RODS_1
	dw DrollBirdGfx          ; DROLL_BIRD
	dw PetitAngelGfx         ; PETIT_ANGEL
	dw WingedCleaverGfx      ; WINGED_CLEAVER
	dw HinotamaSoulGfx       ; HINOTAMA_SOUL
	dw ThunderKidGfx         ; THUNDER_KID
	dw MeotokoGfx            ; MEOTOKO
	dw AquaMadoorGfx         ; AQUA_MADOOR
	dw KagemushaBlueGfx      ; KAGEMUSHA_BLUE
	dw FlameGhostGfx         ; FLAME_GHOST
	dw DryadGfx              ; DRYAD
	dw BSkullDragonGfx       ; B_SKULL_DRAGON
	dw TwoMouthDarkrulerGfx  ; TWO_MOUTH_DARKRULER
	dw SolitudeGfx           ; SOLITUDE
	dw MaskedSorcererGfx     ; MASKED_SORCERER
	dw KumootokoGfx          ; KUMOOTOKO
	dw MidnightFiendGfx      ; MIDNIGHT_FIEND
	dw RoarOceanSnakeGfx     ; ROAR_OCEAN_SNAKE
	dw TrapMasterGfx         ; TRAP_MASTER
	dw FiendSwordGfx         ; FIEND_SWORD
	dw SkullStalkerGfx       ; SKULL_STALKER
	dw HitodenchakGfx        ; HITODENCHAK
	dw WoodRemainsGfx        ; WOOD_REMAINS
	dw HourglassOfLifeGfx    ; HOURGLASS_OF_LIFE
	dw RareFishGfx           ; RARE_FISH
	dw WoodClownGfx          ; WOOD_CLOWN
	dw MadjinnGunnGfx        ; MADJINN_GUNN
	dw DarkTitanTerrorGfx    ; DARK_TITAN_TERROR
	dw BeautifulHeadhuntGfx  ; BEAUTIFUL_HEADHUNT
	dw WodanTheResidentGfx   ; WODAN_THE_RESIDENT
	dw GuardianLabyrinthGfx  ; GUARDIAN_LABYRINTH
	dw HaniwaGfx             ; HANIWA
	dw YashinokiGfx          ; YASHINOKI
	dw VishwarRandiGfx       ; VISHWAR_RANDI
	dw TheDrdekGfx           ; THE_DRDEK
	dw DAssailantGfx         ; D_ASSAILANT
	dw CandleOfFateGfx       ; CANDLE_OF_FATE
	dw WaterElementGfx       ; WATER_ELEMENT
	dw DissolverockGfx       ; DISSOLVEROCK
	dw MedaBatGfx            ; MEDA_BAT
	dw OneWhoHuntsSoulGfx    ; ONE_WHO_HUNTS_SOUL
	dw RootWaterGfx          ; ROOT_WATER
	dw MasterAndExpertGfx    ; MASTER_AND_EXPERT
	dw WaterOmoticsGfx       ; WATER_OMOTICS
	dw HyoGfx                ; HYO
	dw EnchantingMermaidGfx  ; ENCHANTING_MERMAID
	dw Nekogal1Gfx           ; NEKOGAL_1
	dw AngelwitchGfx         ; ANGELWITCH
	dw EmbryonicBeastGfx     ; EMBRYONIC_BEAST
	dw PreventRatGfx         ; PREVENT_RAT
	dw DdWarriorGfx          ; DD_WARRIOR
	dw StoneArmadillerGfx    ; STONE_ARMADILLER
	dw BeastkingOfSwampGfx   ; BEASTKING_OF_SWAMP
	dw AncientSorcererGfx    ; ANCIENT_SORCERER
	dw LunarQueenElzaimGfx   ; LUNAR_QUEEN_ELZAIM
	dw ArchfiendMirrorGfx    ; ARCHFIEND_MIRROR
	dw SwordsmanOfAileGfx    ; SWORDSMAN_OF_AILE
	dw RockOgreGrotto2Gfx    ; ROCK_OGRE_GROTTO2
	dw WingEggElfGfx         ; WING_EGG_ELF
	dw FuriousSeaKingGfx     ; FURIOUS_SEA_KING
	dw PrincessTsurugiGfx    ; PRINCESS_TSURUGI
	dw UnknownWarriorGfx     ; UNKNOWN_WARRIOR
	dw SectarianSecretGfx    ; SECTARIAN_SECRET
	dw VersagoDestroyerGfx   ; VERSAGO_DESTROYER
	dw WethaGfx              ; WETHA
	dw MegirusLightGfx       ; MEGIRUS_LIGHT
	dw MavelusGfx            ; MAVELUS
	dw AncientTreeGfx        ; ANCIENT_TREE
	dw GreenPhantomKingGfx   ; GREEN_PHANTOM_KING
	dw GroundAttackerGfx     ; GROUND_ATTACKER
	dw RayAndTemperatureGfx  ; RAY_AND_TEMPERATURE
	dw GorgonEggGfx          ; GORGON_EGG
	dw PetitMothGfx          ; PETIT_MOTH
	dw KingFogGfx            ; KING_FOG
	dw ProtectorThroneGfx    ; PROTECTOR_THRONE
	dw MysticClownGfx        ; MYSTIC_CLOWN
	dw MysticalSheep2Gfx     ; MYSTICAL_SHEEP_2
	dw HolograhGfx           ; HOLOGRAH
	dw TaoTheChanterGfx      ; TAO_THE_CHANTER
	dw SerpentMarauderGfx    ; SERPENT_MARAUDER
	dw GatekeeperGfx         ; GATEKEEPER
	dw OgreOfTheBlackGfx     ; OGRE_OF_THE_BLACK
	dw DarkArtistGfx         ; DARK_ARTIST
	dw ChangeSlimeGfx        ; CHANGE_SLIME
	dw MoonEnvoyGfx          ; MOON_ENVOY
	dw FireyarouGfx          ; FIREYAROU
	dw PsychicKappaGfx       ; PSYCHIC_KAPPA
	dw MasakiTheLegendGfx    ; MASAKI_THE_LEGEND
	dw DragonessWickedGfx    ; DRAGONESS_WICKED
	dw BioPlantGfx           ; BIO_PLANT
	dw OneEyedShieldGfx      ; ONE_EYED_SHIELD
	dw CyberSoldierDarkGfx   ; CYBER_SOLDIER_DARK
	dw DragonErsatzHeadGfx   ; DRAGON_ERSATZ_HEAD
	dw SonicMaidGfx          ; SONIC_MAID
	dw KuramaGfx             ; KURAMA
	dw LegendarySwordGfx     ; LEGENDARY_SWORD
	dw SwordOfDarkGfx        ; SWORD_OF_DARK
	dw DarkEnergyGfx         ; DARK_ENERGY
	dw AxeOfDespairGfx       ; AXE_OF_DESPAIR
	dw LazerCannonArmorGfx   ; LAZER_CANNON_ARMOR
	dw InsectArmorLaserGfx   ; INSECT_ARMOR_LASER
	dw ElfsLightGfx          ; ELFS_LIGHT
	dw BeastFangsGfx         ; BEAST_FANGS
	dw SteelShellGfx         ; STEEL_SHELL
	dw VileGermsGfx          ; VILE_GERMS
	dw BlackPendantGfx       ; BLACK_PENDANT
	dw SilverBowAndArrowGfx  ; SILVER_BOW_AND_ARROW
	dw HornOfLightGfx        ; HORN_OF_LIGHT
	dw HornOfUnicornGfx      ; HORN_OF_UNICORN
	dw DragonTreasureGfx     ; DRAGON_TREASURE
	dw ElectroWhipGfx        ; ELECTRO_WHIP
	dw CyberShieldGfx        ; CYBER_SHIELD
	dw ElegantEgotistGfx     ; ELEGANT_EGOTIST
	dw MysticalMoonGfx       ; MYSTICAL_MOON
	dw StopDefenseGfx        ; STOP_DEFENSE
	dw MalevolentNuzzlerGfx  ; MALEVOLENT_NUZZLER
	dw VioletCrystalGfx      ; VIOLET_CRYSTAL
	dw BookOfSecretArtGfx    ; BOOK_OF_SECRET_ART
	dw InvigorationGfx       ; INVIGORATION
	dw MachineConversionGfx  ; MACHINE_CONVERSION
	dw RaiseBodyHeatGfx      ; RAISE_BODY_HEAT
	dw FollowWindGfx         ; FOLLOW_WIND
	dw PowerOfKaishinGfx     ; POWER_OF_KAISHIN
	dw DragonCaptureJarGfx   ; DRAGON_CAPTURE_JAR
	dw ForestGfx             ; FOREST
	dw WastelandGfx          ; WASTELAND
	dw MountainGfx           ; MOUNTAIN
	dw SogenGfx              ; SOGEN
	dw UmiGfx                ; UMI
	dw YamiGfx               ; YAMI
	dw DarkHoleGfx           ; DARK_HOLE
	dw RaigekiGfx            ; RAIGEKI
	dw MooyanCurryGfx        ; MOOYAN_CURRY
	dw RedMedicineGfx        ; RED_MEDICINE
	dw GoblinsRemedyGfx      ; GOBLINS_REMEDY
	dw SoulOfThePureGfx      ; SOUL_OF_THE_PURE
	dw DianKetoTheCureGfx    ; DIAN_KETO_THE_CURE
	dw SparksGfx             ; SPARKS
	dw HinotamaGfx           ; HINOTAMA
	dw FinalFlameGfx         ; FINAL_FLAME
	dw OokaziGfx             ; OOKAZI
	dw TremendousFireGfx     ; TREMENDOUS_FIRE
	dw SwordsRevealingGfx    ; SWORDS_REVEALING
	dw SpellbindCircleGfx    ; SPELLBIND_CIRCLE
	dw DarkPierceLightGfx    ; DARK_PIERCE_LIGHT
	dw YaranzoGfx            ; YARANZO
	dw KananTheSwordGfx      ; KANAN_THE_SWORD
	dw TakriminosGfx         ; TAKRIMINOS
	dw StuffedAnimalGfx      ; STUFFED_ANIMAL
	dw MegasonicEyeGfx       ; MEGASONIC_EYE
	dw SuperWarLionGfx       ; SUPER_WAR_LION
	dw YamadronGfx           ; YAMADRON
	dw SeiyaryuGfx           ; SEIYARYU
	dw ThreeLeggedZombiesGfx ; THREE_LEGGED_ZOMBIES
	dw ZeraTheMantGfx        ; ZERA_THE_MANT
	dw FlyingPenguinGfx      ; FLYING_PENGUIN
	dw MillenniumShieldGfx   ; MILLENNIUM_SHIELD
	dw FairysGiftGfx         ; FAIRYS_GIFT
	dw BLusterSoldierGfx     ; B_LUSTER_SOLDIER
	dw FiendsMirrorGfx       ; FIENDS_MIRROR
	dw InvalidCardGfx        ; INVALID_CARD

BEyeWhiteDragonGfx::    INCBIN "gfx/cards/b_eye_white_dragon.2bpp.lz"
MysticalElfGfx::        INCBIN "gfx/cards/mystical_elf.2bpp.lz"
HitotsuMeGiantGfx::     INCBIN "gfx/cards/hitotsu_me_giant.2bpp.lz"
BabyDragonGfx::         INCBIN "gfx/cards/baby_dragon.2bpp.lz"
RyuKishinGfx::          INCBIN "gfx/cards/ryu_kishin.2bpp.lz"
FeralImpGfx::           INCBIN "gfx/cards/feral_imp.2bpp.lz"
WingedDragon1Gfx::      INCBIN "gfx/cards/winged_dragon_1.2bpp.lz"
MushroomManGfx::        INCBIN "gfx/cards/mushroom_man.2bpp.lz"
ShadowSpecterGfx::      INCBIN "gfx/cards/shadow_specter.2bpp.lz"
BlacklandDragonGfx::    INCBIN "gfx/cards/blackland_dragon.2bpp.lz"
SwordArmDragonGfx::     INCBIN "gfx/cards/sword_arm_dragon.2bpp.lz"
SwampBattleguardGfx::   INCBIN "gfx/cards/swamp_battleguard.2bpp.lz"
TyhoneGfx::             INCBIN "gfx/cards/tyhone.2bpp.lz"

PtrTable_43e84:
	dw WeevilGfx      ; WEEVIL
	dw MaiGfx         ; MAI
	dw RexGfx         ; REX
	dw MakoGfx        ; MAKO
	dw YamiYugiGfx    ; YAMI_YUGI
	dw YugiGfx        ; YUGI
	dw TeaGfx         ; TEA
	dw JoeyGfx        ; JOEY
	dw SetoKaibaGfx   ; SETO_KAIBA
	dw MokubaGfx      ; MOKUBA
	dw TristanGfx     ; TRISTAN
	dw BakuraGfx      ; BAKURA
	dw PuppeteerGfx   ; PUPPETEER
	dw PanikGfx       ; PANIK
	dw BanditKeithGfx ; BANDIT_KEITH
	dw MaximillionGfx ; MAXIMILLION
	dw SimonGfx       ; SIMON
	dw ExodiaGfx      ; EXODIA

SECTION "Gfx 2", ROMX, BANK[$11]
	dw BANK(@)
BattleSteerGfx::        INCBIN "gfx/cards/battle_steer.2bpp.lz"
FlameSwordsmanGfx::     INCBIN "gfx/cards/flame_swordsman.2bpp.lz"
TimeWizardGfx::         INCBIN "gfx/cards/time_wizard.2bpp.lz"
RLegOfForbiddenGfx::    INCBIN "gfx/cards/r_leg_of_forbidden.2bpp.lz"
LLegOfForbiddenGfx::    INCBIN "gfx/cards/l_leg_of_forbidden.2bpp.lz"
RArmOfForbiddenGfx::    INCBIN "gfx/cards/r_arm_of_forbidden.2bpp.lz"
LArmOfForbiddenGfx::    INCBIN "gfx/cards/l_arm_of_forbidden.2bpp.lz"
ExodiaForbiddenGfx::    INCBIN "gfx/cards/exodia_forbidden.2bpp.lz"
SummonedSkullGfx::      INCBIN "gfx/cards/summoned_skull.2bpp.lz"
WickedWormBeastGfx::    INCBIN "gfx/cards/wicked_worm_beast.2bpp.lz"
SkullServantGfx::       INCBIN "gfx/cards/skull_servant.2bpp.lz"
HornImpGfx::            INCBIN "gfx/cards/horn_imp.2bpp.lz"
BattleOxGfx::           INCBIN "gfx/cards/battle_ox.2bpp.lz"
BeaverWarriorGfx::      INCBIN "gfx/cards/beaver_warrior.2bpp.lz"

SECTION "Gfx 3", ROMX, BANK[$12]
	dw BANK(@)
RockOgreGrotto1Gfx::    INCBIN "gfx/cards/rock_ogre_grotto1.2bpp.lz"
MountainWarriorGfx::    INCBIN "gfx/cards/mountain_warrior.2bpp.lz"
ZombieWarriorGfx::      INCBIN "gfx/cards/zombie_warrior.2bpp.lz"
KoumoriDragonGfx::      INCBIN "gfx/cards/koumori_dragon.2bpp.lz"
TwoHeadedKingRexGfx::   INCBIN "gfx/cards/two_headed_king_rex.2bpp.lz"
JudgeManGfx::           INCBIN "gfx/cards/judge_man.2bpp.lz"
SaggiTheClownGfx::      INCBIN "gfx/cards/saggi_the_clown.2bpp.lz"
DarkMagicianGfx::       INCBIN "gfx/cards/dark_magician.2bpp.lz"
TheSnakeHairGfx::       INCBIN "gfx/cards/the_snake_hair.2bpp.lz"
GaiaDragonChampGfx::    INCBIN "gfx/cards/gaia_dragon_champ.2bpp.lz"
GaiaFierceKnightGfx::   INCBIN "gfx/cards/gaia_fierce_knight.2bpp.lz"
CurseOfDragonGfx::      INCBIN "gfx/cards/curse_of_dragon.2bpp.lz"
DragonPiperGfx::        INCBIN "gfx/cards/dragon_piper.2bpp.lz"

SECTION "Gfx 4", ROMX, BANK[$13]
	dw BANK(@)
CelticGuardianGfx::     INCBIN "gfx/cards/celtic_guardian.2bpp.lz"
IllusionFacelessGfx::   INCBIN "gfx/cards/illusion_faceless.2bpp.lz"
KarbonalaWarriorGfx::   INCBIN "gfx/cards/karbonala_warrior.2bpp.lz"
RogueDollGfx::          INCBIN "gfx/cards/rogue_doll.2bpp.lz"
WattkidGfx::            INCBIN "gfx/cards/wattkid.2bpp.lz"
GrifforeGfx::           INCBIN "gfx/cards/griffore.2bpp.lz"
TorikeGfx::             INCBIN "gfx/cards/torike.2bpp.lz"
SanganGfx::             INCBIN "gfx/cards/sangan.2bpp.lz"
BigInsectGfx::          INCBIN "gfx/cards/big_insect.2bpp.lz"
BasicInsectGfx::        INCBIN "gfx/cards/basic_insect.2bpp.lz"
ArmoredLizardGfx::      INCBIN "gfx/cards/armored_lizard.2bpp.lz"
HerculesBeetleGfx::     INCBIN "gfx/cards/hercules_beetle.2bpp.lz"
KillerNeedleGfx::       INCBIN "gfx/cards/killer_needle.2bpp.lz"

SECTION "Gfx 5", ROMX, BANK[$14]
	dw BANK(@)
GokiboreGfx::           INCBIN "gfx/cards/gokibore.2bpp.lz"
GiantFleaGfx::          INCBIN "gfx/cards/giant_flea.2bpp.lz"
LarvaeMothGfx::         INCBIN "gfx/cards/larvae_moth.2bpp.lz"
GreatMothGfx::          INCBIN "gfx/cards/great_moth.2bpp.lz"
KuribohGfx::            INCBIN "gfx/cards/kuriboh.2bpp.lz"
MammothGraveyardGfx::   INCBIN "gfx/cards/mammoth_graveyard.2bpp.lz"
GreatWhiteGfx::         INCBIN "gfx/cards/great_white.2bpp.lz"
WolfGfx::               INCBIN "gfx/cards/wolf.2bpp.lz"
HarpieLadyGfx::         INCBIN "gfx/cards/harpie_lady.2bpp.lz"
HarpieLadySisterGfx::   INCBIN "gfx/cards/harpie_lady_sister.2bpp.lz"
TigerAxeGfx::           INCBIN "gfx/cards/tiger_axe.2bpp.lz"
SilverFangGfx::         INCBIN "gfx/cards/silver_fang.2bpp.lz"
KojikocyGfx::           INCBIN "gfx/cards/kojikocy.2bpp.lz"

SECTION "Gfx 6", ROMX, BANK[$15]
	dw BANK(@)
PerfectGreatMothGfx::   INCBIN "gfx/cards/perfect_great_moth.2bpp.lz"
GaroozisGfx::           INCBIN "gfx/cards/garoozis.2bpp.lz"
ThousandDragonGfx::     INCBIN "gfx/cards/thousand_dragon.2bpp.lz"
FiendKrakenGfx::        INCBIN "gfx/cards/fiend_kraken.2bpp.lz"
JellyfishGfx::          INCBIN "gfx/cards/jellyfish.2bpp.lz"
CocoonEvolutionGfx::    INCBIN "gfx/cards/cocoon_evolution.2bpp.lz"
KairyuShinGfx::         INCBIN "gfx/cards/kairyu_shin.2bpp.lz"
SoldierOfStoneGfx::     INCBIN "gfx/cards/soldier_of_stone.2bpp.lz"
ManEatingPlantGfx::     INCBIN "gfx/cards/man_eating_plant.2bpp.lz"
KrokodilusGfx::         INCBIN "gfx/cards/krokodilus.2bpp.lz"
GrapplerGfx::           INCBIN "gfx/cards/grappler.2bpp.lz"
AxeRaiderGfx::          INCBIN "gfx/cards/axe_raider.2bpp.lz"
MegazowlerGfx::         INCBIN "gfx/cards/megazowler.2bpp.lz"

SECTION "Gfx 7", ROMX, BANK[$16]
	dw BANK(@)
UrabyGfx::              INCBIN "gfx/cards/uraby.2bpp.lz"
CrawlingDragon2Gfx::    INCBIN "gfx/cards/crawling_dragon_2.2bpp.lz"
RedEyesBDragonGfx::     INCBIN "gfx/cards/red_eyes_b_dragon.2bpp.lz"
CastleOfDarkGfx::       INCBIN "gfx/cards/castle_of_dark.2bpp.lz"
ReaperOfTheCardGfx::    INCBIN "gfx/cards/reaper_of_the_card.2bpp.lz"
KingOfYamimakaiGfx::    INCBIN "gfx/cards/king_of_yamimakai.2bpp.lz"
BaroxGfx::              INCBIN "gfx/cards/barox.2bpp.lz"
DarkChimeraGfx::        INCBIN "gfx/cards/dark_chimera.2bpp.lz"
MetalGuardianGfx::      INCBIN "gfx/cards/metal_guardian.2bpp.lz"
CatapultTurtleGfx::     INCBIN "gfx/cards/catapult_turtle.2bpp.lz"
GyakutennoMegamiGfx::   INCBIN "gfx/cards/gyakutenno_megami.2bpp.lz"
MysticHorsemanGfx::     INCBIN "gfx/cards/mystic_horseman.2bpp.lz"
RabidHorsemanGfx::      INCBIN "gfx/cards/rabid_horseman.2bpp.lz"

SECTION "Gfx 8", ROMX, BANK[$17]
	dw BANK(@)
ZankiGfx::              INCBIN "gfx/cards/zanki.2bpp.lz"
CrawlingDragonGfx::     INCBIN "gfx/cards/crawling_dragon.2bpp.lz"
CrassClownGfx::         INCBIN "gfx/cards/crass_clown.2bpp.lz"
ArmoredZombieGfx::      INCBIN "gfx/cards/armored_zombie.2bpp.lz"
DragonZombieGfx::       INCBIN "gfx/cards/dragon_zombie.2bpp.lz"
ClownZombieGfx::        INCBIN "gfx/cards/clown_zombie.2bpp.lz"
PumpkingTheKingGfx::    INCBIN "gfx/cards/pumpking_the_king.2bpp.lz"
BattleWarriorGfx::      INCBIN "gfx/cards/battle_warrior.2bpp.lz"
WingsOfFlameGfx::       INCBIN "gfx/cards/wings_of_flame.2bpp.lz"
MaskOfDarknessGfx::     INCBIN "gfx/cards/mask_of_darkness.2bpp.lz"
JobChangeMirrorGfx::    INCBIN "gfx/cards/job_change_mirror.2bpp.lz"
CurtainOfDarkGfx::      INCBIN "gfx/cards/curtain_of_dark.2bpp.lz"
TomozaurusGfx::         INCBIN "gfx/cards/tomozaurus.2bpp.lz"

SECTION "Gfx 9", ROMX, BANK[$18]
	dw BANK(@)
SpiritOfTheWindGfx::    INCBIN "gfx/cards/spirit_of_the_wind.2bpp.lz"
KageningenGfx::         INCBIN "gfx/cards/kageningen.2bpp.lz"
GraveyardAndHandGfx::   INCBIN "gfx/cards/graveyard_and_hand.2bpp.lz"
GoddessThirdEyeGfx::    INCBIN "gfx/cards/goddess_third_eye.2bpp.lz"
HeroOfTheEastGfx::      INCBIN "gfx/cards/hero_of_the_east.2bpp.lz"
DomaTheAngelGfx::       INCBIN "gfx/cards/doma_the_angel.2bpp.lz"
ThatWhichFeedsGfx::     INCBIN "gfx/cards/that_which_feeds.2bpp.lz"
DarkGrayGfx::           INCBIN "gfx/cards/dark_gray.2bpp.lz"
WhiteMagicalHatGfx::    INCBIN "gfx/cards/white_magical_hat.2bpp.lz"
KamionwizardGfx::       INCBIN "gfx/cards/kamionwizard.2bpp.lz"
NightmareScorpionGfx::  INCBIN "gfx/cards/nightmare_scorpion.2bpp.lz"
SpiritOfTheBookGfx::    INCBIN "gfx/cards/spirit_of_the_book.2bpp.lz"
SupporterShadowsGfx::   INCBIN "gfx/cards/supporter_shadows.2bpp.lz"

SECTION "Gfx 10", ROMX, BANK[$19]
	dw BANK(@)
TrialOfNightmareGfx::   INCBIN "gfx/cards/trial_of_nightmare.2bpp.lz"
DreamClownGfx::         INCBIN "gfx/cards/dream_clown.2bpp.lz"
SleepingLionGfx::       INCBIN "gfx/cards/sleeping_lion.2bpp.lz"
YamatanoScrollGfx::     INCBIN "gfx/cards/yamatano_scroll.2bpp.lz"
DarkPlantGfx::          INCBIN "gfx/cards/dark_plant.2bpp.lz"
AncientToolGfx::        INCBIN "gfx/cards/ancient_tool.2bpp.lz"
FaithBirdGfx::          INCBIN "gfx/cards/faith_bird.2bpp.lz"
OrionTheBattleGfx::     INCBIN "gfx/cards/orion_the_battle.2bpp.lz"
AnsatsuGfx::            INCBIN "gfx/cards/ansatsu.2bpp.lz"
LamoonGfx::             INCBIN "gfx/cards/lamoon.2bpp.lz"
NemurikoGfx::           INCBIN "gfx/cards/nemuriko.2bpp.lz"
WeatherControlGfx::     INCBIN "gfx/cards/weather_control.2bpp.lz"
OctoberserGfx::         INCBIN "gfx/cards/octoberser.2bpp.lz"

SECTION "Gfx 11", ROMX, BANK[$1a]
	dw BANK(@)
The13thGraveGfx::       INCBIN "gfx/cards/the_13th_grave.2bpp.lz"
CharubinTheFireGfx::    INCBIN "gfx/cards/charubin_the_fire.2bpp.lz"
MysticalCaptureGfx::    INCBIN "gfx/cards/mystical_capture.2bpp.lz"
FiendsHandGfx::         INCBIN "gfx/cards/fiends_hand.2bpp.lz"
WittyPhantomGfx::       INCBIN "gfx/cards/witty_phantom.2bpp.lz"
MysteryHandGfx::        INCBIN "gfx/cards/mystery_hand.2bpp.lz"
DragonStatueGfx::       INCBIN "gfx/cards/dragon_statue.2bpp.lz"
BEyedSilZombieGfx::     INCBIN "gfx/cards/b_eyed_sil_zombie.2bpp.lz"
ToadMasterGfx::         INCBIN "gfx/cards/toad_master.2bpp.lz"
SpikedSnailGfx::        INCBIN "gfx/cards/spiked_snail.2bpp.lz"
FlameManipulatorGfx::   INCBIN "gfx/cards/flame_manipulator.2bpp.lz"
NecrolancerGfx::        INCBIN "gfx/cards/necrolancer.2bpp.lz"
DjinnTheWatcherGfx::    INCBIN "gfx/cards/djinn_the_watcher.2bpp.lz"

SECTION "Gfx 12", ROMX, BANK[$1b]
	dw BANK(@)
BewitchingPhantomGfx::  INCBIN "gfx/cards/bewitching_phantom.2bpp.lz"
TempleOfSkullsGfx::     INCBIN "gfx/cards/temple_of_skulls.2bpp.lz"
MonsterEggGfx::         INCBIN "gfx/cards/monster_egg.2bpp.lz"
ShadowWhoControlGfx::   INCBIN "gfx/cards/shadow_who_control.2bpp.lz"
LordOfTheLampGfx::      INCBIN "gfx/cards/lord_of_the_lamp.2bpp.lz"
AkihironGfx::           INCBIN "gfx/cards/akihiron.2bpp.lz"
RhaimundosRedGfx::      INCBIN "gfx/cards/rhaimundos_red.2bpp.lz"
MeltingRedShadowGfx::   INCBIN "gfx/cards/melting_red_shadow.2bpp.lz"
DokuroizoTheGrimGfx::   INCBIN "gfx/cards/dokuroizo_the_grim.2bpp.lz"
FireReaperGfx::         INCBIN "gfx/cards/fire_reaper.2bpp.lz"
LarvasGfx::             INCBIN "gfx/cards/larvas.2bpp.lz"
HardArmorGfx::          INCBIN "gfx/cards/hard_armor.2bpp.lz"
FiregrassGfx::          INCBIN "gfx/cards/firegrass.2bpp.lz"

SECTION "Gfx 13", ROMX, BANK[$1c]
	dw BANK(@)
ManEaterGfx::           INCBIN "gfx/cards/man_eater.2bpp.lz"
DigBeakGfx::            INCBIN "gfx/cards/dig_beak.2bpp.lz"
MWarrior1Gfx::          INCBIN "gfx/cards/m_warrior_1.2bpp.lz"
MWarrior2Gfx::          INCBIN "gfx/cards/m_warrior_2.2bpp.lz"
TaintedWisdomGfx::      INCBIN "gfx/cards/tainted_wisdom.2bpp.lz"
LisarkGfx::             INCBIN "gfx/cards/lisark.2bpp.lz"
LordOfZemiaGfx::        INCBIN "gfx/cards/lord_of_zemia.2bpp.lz"
TheJudgementHandGfx::   INCBIN "gfx/cards/the_judgement_hand.2bpp.lz"
MysteriousPuppetGfx::   INCBIN "gfx/cards/mysterious_puppet.2bpp.lz"
AncientJarGfx::         INCBIN "gfx/cards/ancient_jar.2bpp.lz"
DarkfireDragonGfx::     INCBIN "gfx/cards/darkfire_dragon.2bpp.lz"
DarkKingAbyssGfx::      INCBIN "gfx/cards/dark_king_abyss.2bpp.lz"
SpiritOfTheHarpGfx::    INCBIN "gfx/cards/spirit_of_the_harp.2bpp.lz"

SECTION "Gfx 14", ROMX, BANK[$1d]
	dw BANK(@)
BigEyeGfx::             INCBIN "gfx/cards/big_eye.2bpp.lz"
ArmaillGfx::            INCBIN "gfx/cards/armaill.2bpp.lz"
DarkPrisonerGfx::       INCBIN "gfx/cards/dark_prisoner.2bpp.lz"
HurricailGfx::          INCBIN "gfx/cards/hurricail.2bpp.lz"
AncientBrainGfx::       INCBIN "gfx/cards/ancient_brain.2bpp.lz"
FireEyeGfx::            INCBIN "gfx/cards/fire_eye.2bpp.lz"
MonsturtleGfx::         INCBIN "gfx/cards/monsturtle.2bpp.lz"
ClawReacherGfx::        INCBIN "gfx/cards/claw_reacher.2bpp.lz"
PhantomDewanGfx::       INCBIN "gfx/cards/phantom_dewan.2bpp.lz"
ArlownayGfx::           INCBIN "gfx/cards/arlownay.2bpp.lz"
DarkShadeGfx::          INCBIN "gfx/cards/dark_shade.2bpp.lz"
MaskedClownGfx::        INCBIN "gfx/cards/masked_clown.2bpp.lz"
LuckyTrinketGfx::       INCBIN "gfx/cards/lucky_trinket.2bpp.lz"

SECTION "Gfx 15", ROMX, BANK[$1e]
	dw BANK(@)
GeninGfx::              INCBIN "gfx/cards/genin.2bpp.lz"
EyearmorGfx::           INCBIN "gfx/cards/eyearmor.2bpp.lz"
FiendReflection2Gfx::   INCBIN "gfx/cards/fiend_reflection2.2bpp.lz"
GateDeegGfx::           INCBIN "gfx/cards/gate_deeg.2bpp.lz"
SyncharGfx::            INCBIN "gfx/cards/synchar.2bpp.lz"
FusionistGfx::          INCBIN "gfx/cards/fusionist.2bpp.lz"
AkakieisuGfx::          INCBIN "gfx/cards/akakieisu.2bpp.lz"
LalaLiOonGfx::          INCBIN "gfx/cards/lala_li_oon.2bpp.lz"
KeyMaceGfx::            INCBIN "gfx/cards/key_mace.2bpp.lz"
TurtleTigerGfx::        INCBIN "gfx/cards/turtle_tiger.2bpp.lz"
TerraTheTerribleGfx::   INCBIN "gfx/cards/terra_the_terrible.2bpp.lz"
DoronGfx::              INCBIN "gfx/cards/doron.2bpp.lz"
PenguinKnightGfx::      INCBIN "gfx/cards/penguin_knight.2bpp.lz"

SECTION "Gfx 16", ROMX, BANK[$1f]
	dw BANK(@)
ArmaKnightGfx::         INCBIN "gfx/cards/arma_knight.2bpp.lz"
MechMoleZombieGfx::     INCBIN "gfx/cards/mech_mole_zombie.2bpp.lz"
HappyLoverGfx::         INCBIN "gfx/cards/happy_lover.2bpp.lz"
PetitDragonGfx::        INCBIN "gfx/cards/petit_dragon.2bpp.lz"
FrenziedPandaGfx::      INCBIN "gfx/cards/frenzied_panda.2bpp.lz"
ArchfiendMarmotGfx::    INCBIN "gfx/cards/archfiend_marmot.2bpp.lz"
PhantomGhostGfx::       INCBIN "gfx/cards/phantom_ghost.2bpp.lz"
MabarrelGfx::           INCBIN "gfx/cards/mabarrel.2bpp.lz"
DoroverGfx::            INCBIN "gfx/cards/dorover.2bpp.lz"
TwinLongRods1Gfx::      INCBIN "gfx/cards/twin_long_rods_1.2bpp.lz"
DrollBirdGfx::          INCBIN "gfx/cards/droll_bird.2bpp.lz"
PetitAngelGfx::         INCBIN "gfx/cards/petit_angel.2bpp.lz"
WingedCleaverGfx::      INCBIN "gfx/cards/winged_cleaver.2bpp.lz"

SECTION "Gfx 17", ROMX, BANK[$21]
	dw BANK(@)
HinotamaSoulGfx::       INCBIN "gfx/cards/hinotama_soul.2bpp.lz"
ThunderKidGfx::         INCBIN "gfx/cards/thunder_kid.2bpp.lz"
MeotokoGfx::            INCBIN "gfx/cards/meotoko.2bpp.lz"
AquaMadoorGfx::         INCBIN "gfx/cards/aqua_madoor.2bpp.lz"
KagemushaBlueGfx::      INCBIN "gfx/cards/kagemusha_blue.2bpp.lz"
FlameGhostGfx::         INCBIN "gfx/cards/flame_ghost.2bpp.lz"
DryadGfx::              INCBIN "gfx/cards/dryad.2bpp.lz"
BSkullDragonGfx::       INCBIN "gfx/cards/b_skull_dragon.2bpp.lz"
TwoMouthDarkrulerGfx::  INCBIN "gfx/cards/two_mouth_darkruler.2bpp.lz"
SolitudeGfx::           INCBIN "gfx/cards/solitude.2bpp.lz"
MaskedSorcererGfx::     INCBIN "gfx/cards/masked_sorcerer.2bpp.lz"
KumootokoGfx::          INCBIN "gfx/cards/kumootoko.2bpp.lz"
MidnightFiendGfx::      INCBIN "gfx/cards/midnight_fiend.2bpp.lz"

SECTION "Gfx 18", ROMX, BANK[$22]
	dw BANK(@)
RoarOceanSnakeGfx::     INCBIN "gfx/cards/roar_ocean_snake.2bpp.lz"
TrapMasterGfx::         INCBIN "gfx/cards/trap_master.2bpp.lz"
FiendSwordGfx::         INCBIN "gfx/cards/fiend_sword.2bpp.lz"
SkullStalkerGfx::       INCBIN "gfx/cards/skull_stalker.2bpp.lz"
HitodenchakGfx::        INCBIN "gfx/cards/hitodenchak.2bpp.lz"
WoodRemainsGfx::        INCBIN "gfx/cards/wood_remains.2bpp.lz"
HourglassOfLifeGfx::    INCBIN "gfx/cards/hourglass_of_life.2bpp.lz"
RareFishGfx::           INCBIN "gfx/cards/rare_fish.2bpp.lz"
WoodClownGfx::          INCBIN "gfx/cards/wood_clown.2bpp.lz"
MadjinnGunnGfx::        INCBIN "gfx/cards/madjinn_gunn.2bpp.lz"
DarkTitanTerrorGfx::    INCBIN "gfx/cards/dark_titan_terror.2bpp.lz"
BeautifulHeadhuntGfx::  INCBIN "gfx/cards/beautiful_headhunt.2bpp.lz"
WodanTheResidentGfx::   INCBIN "gfx/cards/wodan_the_resident.2bpp.lz"

SECTION "Gfx 19", ROMX, BANK[$23]
	dw BANK(@)
GuardianLabyrinthGfx::  INCBIN "gfx/cards/guardian_labyrinth.2bpp.lz"
HaniwaGfx::             INCBIN "gfx/cards/haniwa.2bpp.lz"
YashinokiGfx::          INCBIN "gfx/cards/yashinoki.2bpp.lz"
VishwarRandiGfx::       INCBIN "gfx/cards/vishwar_randi.2bpp.lz"
TheDrdekGfx::           INCBIN "gfx/cards/the_drdek.2bpp.lz"
DAssailantGfx::         INCBIN "gfx/cards/d_assailant.2bpp.lz"
CandleOfFateGfx::       INCBIN "gfx/cards/candle_of_fate.2bpp.lz"
WaterElementGfx::       INCBIN "gfx/cards/water_element.2bpp.lz"
DissolverockGfx::       INCBIN "gfx/cards/dissolverock.2bpp.lz"
MedaBatGfx::            INCBIN "gfx/cards/meda_bat.2bpp.lz"
OneWhoHuntsSoulGfx::    INCBIN "gfx/cards/one_who_hunts_soul.2bpp.lz"
RootWaterGfx::          INCBIN "gfx/cards/root_water.2bpp.lz"
MasterAndExpertGfx::    INCBIN "gfx/cards/master_and_expert.2bpp.lz"

SECTION "Gfx 20", ROMX, BANK[$24]
	dw BANK(@)
WaterOmoticsGfx::       INCBIN "gfx/cards/water_omotics.2bpp.lz"
HyoGfx::                INCBIN "gfx/cards/hyo.2bpp.lz"
EnchantingMermaidGfx::  INCBIN "gfx/cards/enchanting_mermaid.2bpp.lz"
Nekogal1Gfx::           INCBIN "gfx/cards/nekogal_1.2bpp.lz"
AngelwitchGfx::         INCBIN "gfx/cards/angelwitch.2bpp.lz"
EmbryonicBeastGfx::     INCBIN "gfx/cards/embryonic_beast.2bpp.lz"
PreventRatGfx::         INCBIN "gfx/cards/prevent_rat.2bpp.lz"
DdWarriorGfx::          INCBIN "gfx/cards/dd_warrior.2bpp.lz"
StoneArmadillerGfx::    INCBIN "gfx/cards/stone_armadiller.2bpp.lz"
BeastkingOfSwampGfx::   INCBIN "gfx/cards/beastking_of_swamp.2bpp.lz"
AncientSorcererGfx::    INCBIN "gfx/cards/ancient_sorcerer.2bpp.lz"
LunarQueenElzaimGfx::   INCBIN "gfx/cards/lunar_queen_elzaim.2bpp.lz"
ArchfiendMirrorGfx::    INCBIN "gfx/cards/archfiend_mirror.2bpp.lz"

SECTION "Gfx 21", ROMX, BANK[$25]
	dw BANK(@)
SwordsmanOfAileGfx::    INCBIN "gfx/cards/swordsman_of_aile.2bpp.lz"
RockOgreGrotto2Gfx::    INCBIN "gfx/cards/rock_ogre_grotto2.2bpp.lz"
WingEggElfGfx::         INCBIN "gfx/cards/wing_egg_elf.2bpp.lz"
FuriousSeaKingGfx::     INCBIN "gfx/cards/furious_sea_king.2bpp.lz"
PrincessTsurugiGfx::    INCBIN "gfx/cards/princess_tsurugi.2bpp.lz"
UnknownWarriorGfx::     INCBIN "gfx/cards/unknown_warrior.2bpp.lz"
SectarianSecretGfx::    INCBIN "gfx/cards/sectarian_secret.2bpp.lz"
VersagoDestroyerGfx::   INCBIN "gfx/cards/versago_destroyer.2bpp.lz"
WethaGfx::              INCBIN "gfx/cards/wetha.2bpp.lz"
MegirusLightGfx::       INCBIN "gfx/cards/megirus_light.2bpp.lz"
MavelusGfx::            INCBIN "gfx/cards/mavelus.2bpp.lz"
AncientTreeGfx::        INCBIN "gfx/cards/ancient_tree.2bpp.lz"
GreenPhantomKingGfx::   INCBIN "gfx/cards/green_phantom_king.2bpp.lz"

SECTION "Gfx 22", ROMX, BANK[$26]
	dw BANK(@)
GroundAttackerGfx::     INCBIN "gfx/cards/ground_attacker.2bpp.lz"
RayAndTemperatureGfx::  INCBIN "gfx/cards/ray_and_temperature.2bpp.lz"
GorgonEggGfx::          INCBIN "gfx/cards/gorgon_egg.2bpp.lz"
PetitMothGfx::          INCBIN "gfx/cards/petit_moth.2bpp.lz"
KingFogGfx::            INCBIN "gfx/cards/king_fog.2bpp.lz"
ProtectorThroneGfx::    INCBIN "gfx/cards/protector_throne.2bpp.lz"
MysticClownGfx::        INCBIN "gfx/cards/mystic_clown.2bpp.lz"
MysticalSheep2Gfx::     INCBIN "gfx/cards/mystical_sheep_2.2bpp.lz"
HolograhGfx::           INCBIN "gfx/cards/holograh.2bpp.lz"
TaoTheChanterGfx::      INCBIN "gfx/cards/tao_the_chanter.2bpp.lz"
SerpentMarauderGfx::    INCBIN "gfx/cards/serpent_marauder.2bpp.lz"
GatekeeperGfx::         INCBIN "gfx/cards/gatekeeper.2bpp.lz"
OgreOfTheBlackGfx::     INCBIN "gfx/cards/ogre_of_the_black.2bpp.lz"

SECTION "Gfx 23", ROMX, BANK[$27]
	dw BANK(@)
DarkArtistGfx::         INCBIN "gfx/cards/dark_artist.2bpp.lz"
ChangeSlimeGfx::        INCBIN "gfx/cards/change_slime.2bpp.lz"
MoonEnvoyGfx::          INCBIN "gfx/cards/moon_envoy.2bpp.lz"
FireyarouGfx::          INCBIN "gfx/cards/fireyarou.2bpp.lz"
PsychicKappaGfx::       INCBIN "gfx/cards/psychic_kappa.2bpp.lz"
MasakiTheLegendGfx::    INCBIN "gfx/cards/masaki_the_legend.2bpp.lz"
DragonessWickedGfx::    INCBIN "gfx/cards/dragoness_wicked.2bpp.lz"
BioPlantGfx::           INCBIN "gfx/cards/bio_plant.2bpp.lz"
OneEyedShieldGfx::      INCBIN "gfx/cards/one_eyed_shield.2bpp.lz"
CyberSoldierDarkGfx::   INCBIN "gfx/cards/cyber_soldier_dark.2bpp.lz"
DragonErsatzHeadGfx::   INCBIN "gfx/cards/dragon_ersatz_head.2bpp.lz"
SonicMaidGfx::          INCBIN "gfx/cards/sonic_maid.2bpp.lz"
KuramaGfx::             INCBIN "gfx/cards/kurama.2bpp.lz"

SECTION "Gfx 24", ROMX, BANK[$28]
	dw BANK(@)
LegendarySwordGfx::     INCBIN "gfx/cards/legendary_sword.2bpp.lz"
SwordOfDarkGfx::        INCBIN "gfx/cards/sword_of_dark.2bpp.lz"
DarkEnergyGfx::         INCBIN "gfx/cards/dark_energy.2bpp.lz"
AxeOfDespairGfx::       INCBIN "gfx/cards/axe_of_despair.2bpp.lz"
LazerCannonArmorGfx::   INCBIN "gfx/cards/lazer_cannon_armor.2bpp.lz"
InsectArmorLaserGfx::   INCBIN "gfx/cards/insect_armor_laser.2bpp.lz"
ElfsLightGfx::          INCBIN "gfx/cards/elfs_light.2bpp.lz"
BeastFangsGfx::         INCBIN "gfx/cards/beast_fangs.2bpp.lz"
SteelShellGfx::         INCBIN "gfx/cards/steel_shell.2bpp.lz"
VileGermsGfx::          INCBIN "gfx/cards/vile_germs.2bpp.lz"
BlackPendantGfx::       INCBIN "gfx/cards/black_pendant.2bpp.lz"
SilverBowAndArrowGfx::  INCBIN "gfx/cards/silver_bow_and_arrow.2bpp.lz"
HornOfLightGfx::        INCBIN "gfx/cards/horn_of_light.2bpp.lz"

SECTION "Gfx 25", ROMX, BANK[$29]
	dw BANK(@)
HornOfUnicornGfx::      INCBIN "gfx/cards/horn_of_unicorn.2bpp.lz"
DragonTreasureGfx::     INCBIN "gfx/cards/dragon_treasure.2bpp.lz"
ElectroWhipGfx::        INCBIN "gfx/cards/electro_whip.2bpp.lz"
CyberShieldGfx::        INCBIN "gfx/cards/cyber_shield.2bpp.lz"
ElegantEgotistGfx::     INCBIN "gfx/cards/elegant_egotist.2bpp.lz"
MysticalMoonGfx::       INCBIN "gfx/cards/mystical_moon.2bpp.lz"
StopDefenseGfx::        INCBIN "gfx/cards/stop_defense.2bpp.lz"
MalevolentNuzzlerGfx::  INCBIN "gfx/cards/malevolent_nuzzler.2bpp.lz"
VioletCrystalGfx::      INCBIN "gfx/cards/violet_crystal.2bpp.lz"
BookOfSecretArtGfx::    INCBIN "gfx/cards/book_of_secret_art.2bpp.lz"
InvigorationGfx::       INCBIN "gfx/cards/invigoration.2bpp.lz"
MachineConversionGfx::  INCBIN "gfx/cards/machine_conversion.2bpp.lz"
RaiseBodyHeatGfx::      INCBIN "gfx/cards/raise_body_heat.2bpp.lz"

SECTION "Gfx 26", ROMX, BANK[$2a]
	dw BANK(@)
FollowWindGfx::         INCBIN "gfx/cards/follow_wind.2bpp.lz"
PowerOfKaishinGfx::     INCBIN "gfx/cards/power_of_kaishin.2bpp.lz"
DragonCaptureJarGfx::   INCBIN "gfx/cards/dragon_capture_jar.2bpp.lz"
ForestGfx::             INCBIN "gfx/cards/forest.2bpp.lz"
WastelandGfx::          INCBIN "gfx/cards/wasteland.2bpp.lz"
MountainGfx::           INCBIN "gfx/cards/mountain.2bpp.lz"
SogenGfx::              INCBIN "gfx/cards/sogen.2bpp.lz"
UmiGfx::                INCBIN "gfx/cards/umi.2bpp.lz"
YamiGfx::               INCBIN "gfx/cards/yami.2bpp.lz"
DarkHoleGfx::           INCBIN "gfx/cards/dark_hole.2bpp.lz"
RaigekiGfx::            INCBIN "gfx/cards/raigeki.2bpp.lz"
MooyanCurryGfx::        INCBIN "gfx/cards/mooyan_curry.2bpp.lz"
RedMedicineGfx::        INCBIN "gfx/cards/red_medicine.2bpp.lz"

SECTION "Gfx 27", ROMX, BANK[$2b]
	dw BANK(@)
GoblinsRemedyGfx::      INCBIN "gfx/cards/goblins_remedy.2bpp.lz"
SoulOfThePureGfx::      INCBIN "gfx/cards/soul_of_the_pure.2bpp.lz"
DianKetoTheCureGfx::    INCBIN "gfx/cards/dian_keto_the_cure.2bpp.lz"
SparksGfx::             INCBIN "gfx/cards/sparks.2bpp.lz"
HinotamaGfx::           INCBIN "gfx/cards/hinotama.2bpp.lz"
FinalFlameGfx::         INCBIN "gfx/cards/final_flame.2bpp.lz"
OokaziGfx::             INCBIN "gfx/cards/ookazi.2bpp.lz"
TremendousFireGfx::     INCBIN "gfx/cards/tremendous_fire.2bpp.lz"
SwordsRevealingGfx::    INCBIN "gfx/cards/swords_revealing.2bpp.lz"
SpellbindCircleGfx::    INCBIN "gfx/cards/spellbind_circle.2bpp.lz"
DarkPierceLightGfx::    INCBIN "gfx/cards/dark_pierce_light.2bpp.lz"
YaranzoGfx::            INCBIN "gfx/cards/yaranzo.2bpp.lz"
KananTheSwordGfx::      INCBIN "gfx/cards/kanan_the_sword.2bpp.lz"

SECTION "Gfx 28", ROMX, BANK[$2c]
	dw BANK(@)
TakriminosGfx::         INCBIN "gfx/cards/takriminos.2bpp.lz"
StuffedAnimalGfx::      INCBIN "gfx/cards/stuffed_animal.2bpp.lz"
MegasonicEyeGfx::       INCBIN "gfx/cards/megasonic_eye.2bpp.lz"
SuperWarLionGfx::       INCBIN "gfx/cards/super_war_lion.2bpp.lz"
YamadronGfx::           INCBIN "gfx/cards/yamadron.2bpp.lz"
SeiyaryuGfx::           INCBIN "gfx/cards/seiyaryu.2bpp.lz"
ThreeLeggedZombiesGfx:: INCBIN "gfx/cards/three_legged_zombies.2bpp.lz"
ZeraTheMantGfx::        INCBIN "gfx/cards/zera_the_mant.2bpp.lz"
FlyingPenguinGfx::      INCBIN "gfx/cards/flying_penguin.2bpp.lz"
MillenniumShieldGfx::   INCBIN "gfx/cards/millennium_shield.2bpp.lz"
FairysGiftGfx::         INCBIN "gfx/cards/fairys_gift.2bpp.lz"
BLusterSoldierGfx::     INCBIN "gfx/cards/b_luster_soldier.2bpp.lz"
FiendsMirrorGfx::       INCBIN "gfx/cards/fiends_mirror.2bpp.lz"
InvalidCardGfx::        INCBIN "gfx/cards/invalid_card.2bpp.lz"

SECTION "Gfx 29", ROMX, BANK[$2e]
	dw BANK(@)
WeevilGfx::             INCBIN "gfx/characters/weevil.2bpp.lz"
MaiGfx::                INCBIN "gfx/characters/mai.2bpp.lz"
RexGfx::                INCBIN "gfx/characters/rex.2bpp.lz"
MakoGfx::               INCBIN "gfx/characters/mako.2bpp.lz"
YamiYugiGfx::           INCBIN "gfx/characters/yami_yugi.2bpp.lz"
YugiGfx::               INCBIN "gfx/characters/yugi.2bpp.lz"

SECTION "Gfx 30", ROMX, BANK[$2f]
	dw BANK(@)
TeaGfx::                INCBIN "gfx/characters/tea.2bpp.lz"
JoeyGfx::               INCBIN "gfx/characters/joey.2bpp.lz"
SetoKaibaGfx::          INCBIN "gfx/characters/seto_kaiba.2bpp.lz"
MokubaGfx::             INCBIN "gfx/characters/mokuba.2bpp.lz"
TristanGfx::            INCBIN "gfx/characters/tristan.2bpp.lz"
BakuraGfx::             INCBIN "gfx/characters/bakura.2bpp.lz"

SECTION "Gfx 31", ROMX, BANK[$30]
	dw BANK(@)
PuppeteerGfx::          INCBIN "gfx/characters/puppeteer.2bpp.lz"
PanikGfx::              INCBIN "gfx/characters/panik.2bpp.lz"
BanditKeithGfx::        INCBIN "gfx/characters/bandit_keith.2bpp.lz"
MaximillionGfx::        INCBIN "gfx/characters/maximillion.2bpp.lz"
SimonGfx::              INCBIN "gfx/characters/simon.2bpp.lz"
ExodiaGfx::             INCBIN "gfx/characters/exodia.2bpp.lz"
