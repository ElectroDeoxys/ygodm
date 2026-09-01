	dw BANK(@)
	
	farcall_table_start
	farfunc Func_3400c
	farfunc ChoosePlayerAnteCard
	farfunc Func_36e34
	farfunc Func_3708e
	farfunc $70e6

Func_3400c:
	push af
	push bc
	call Func_23f7
	cp $00
	jr z, .asm_34024
	call Func_34027
	farcall Func_5af2
	farcall GiveCard
	farcall Func_b87e
	call Func_36e8e
.asm_34024
	pop bc
	pop af
	ret

Func_34027:
	push af
	push de
	push hl
	ld a, 0
	ld [wRandRangeStart], a
	ld a, LOW($7ff)
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld e, a
	ld a, 0
	ld [wRandRangeStart], a
	ld a, HIGH($7ff)
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld d, a
	; de = random number between [$0, $7ff]
	ld b, $00
	farcall Func_b724
	ld c, a
	sla c
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; find first number in frequency table
	; that is larger than sample number
	ld bc, 0
.loop_freqs
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Func_1d0f
	pop bc
	; larger?
	cp $00
	jr z, .got_card
	; no, increment card ID
	inc bc
	jr .loop_freqs
.got_card
	pop hl
	pop de
	pop af
	ret

.PtrTable:
	dw .Weevil      ; WEEVIL
	dw .Mai         ; MAI
	dw .Rex         ; REX
	dw .Mako        ; MAKO
	dw .YamiYugi    ; YAMI_YUGI
	dw .Yugi        ; YUGI
	dw .Tea         ; TEA
	dw .Joey        ; JOEY
	dw .SetoKaiba   ; SETO_KAIBA
	dw .Mokuba      ; MOKUBA
	dw .Tristan     ; TRISTAN
	dw .Bakura      ; BAKURA
	dw .Puppeteer   ; PUPPETEER
	dw .PaniK       ; PANIK
	dw .BanditKeith ; BANDIT_KEITH
	dw .Maximillion ; MAXIMILLION
	dw .Simon       ; SIMON

.Weevil:
	card_freq_table_start
	card_freq BIG_INSECT,           361 ; / 2048
	card_freq BASIC_INSECT,           2 ; / 2048
	card_freq HERCULES_BEETLE,       10 ; / 2048
	card_freq KILLER_NEEDLE,        407 ; / 2048
	card_freq GOKIBORE,             407 ; / 2048
	card_freq GIANT_FLEA,           154 ; / 2048
	card_freq NIGHTMARE_SCORPION,    33 ; / 2048
	card_freq SPIKED_SNAIL,          83 ; / 2048
	card_freq WINGED_CLEAVER,         1 ; / 2048
	card_freq KUMOOTOKO,            129 ; / 2048
	card_freq WOOD_CLOWN,            87 ; / 2048
	card_freq WODAN_THE_RESIDENT,   154 ; / 2048
	card_freq LAZER_CANNON_ARMOR,    10 ; / 2048
	card_freq INSECT_ARMOR_LASER,    10 ; / 2048
	card_freq FOREST,               100 ; / 2048
	card_freq RED_MEDICINE,          50 ; / 2048
	card_freq HINOTAMA,              50 ; / 2048
	card_freq_table_end

.Mai:
	card_freq_table_start
	card_freq TYHONE,                35 ; / 2048
	card_freq HARPIE_LADY,            9 ; / 2048
	card_freq SPIRIT_OF_THE_WIND,     2 ; / 2048
	card_freq GODDESS_THIRD_EYE,    103 ; / 2048
	card_freq SPIRIT_OF_THE_BOOK,     6 ; / 2048
	card_freq FAITH_BIRD,             6 ; / 2048
	card_freq LAMOON,                28 ; / 2048
	card_freq NEMURIKO,              43 ; / 2048
	card_freq SPIRIT_OF_THE_HARP,    30 ; / 2048
	card_freq ARLOWNAY,              10 ; / 2048
	card_freq FIEND_REFLECTION2,     87 ; / 2048
	card_freq KEY_MACE,               2 ; / 2048
	card_freq DROLL_BIRD,             1 ; / 2048
	card_freq PETIT_ANGEL,           13 ; / 2048
	card_freq DRYAD,                 34 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,    27 ; / 2048
	card_freq VISHWAR_RANDI,        102 ; / 2048
	card_freq WATER_ELEMENT,        102 ; / 2048
	card_freq WATER_OMOTICS,          5 ; / 2048
	card_freq ENCHANTING_MERMAID,   120 ; / 2048
	card_freq NEKOGAL_1,            174 ; / 2048
	card_freq ANGELWITCH,           102 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    98 ; / 2048
	card_freq PRINCESS_TSURUGI,     102 ; / 2048
	card_freq MAVELUS,               77 ; / 2048
	card_freq PROTECTOR_THRONE,      77 ; / 2048
	card_freq ONE_EYED_SHIELD,      105 ; / 2048
	card_freq SONIC_MAID,           120 ; / 2048
	card_freq KURAMA,                58 ; / 2048
	card_freq ELECTRO_WHIP,          10 ; / 2048
	card_freq CYBER_SHIELD,          10 ; / 2048
	card_freq ELEGANT_EGOTIST,       50 ; / 2048
	card_freq FOLLOW_WIND,          100 ; / 2048
	card_freq MOUNTAIN,             100 ; / 2048
	card_freq RED_MEDICINE,          50 ; / 2048
	card_freq HINOTAMA,              50 ; / 2048
	card_freq_table_end

.Rex:
	card_freq_table_start
	card_freq SWORD_ARM_DRAGON,      10 ; / 2048
	card_freq MEGAZOWLER,            10 ; / 2048
	card_freq URABY,                282 ; / 2048
	card_freq CRAWLING_DRAGON_2,     38 ; / 2048
	card_freq TOMOZAURUS,             2 ; / 2048
	card_freq RHAIMUNDOS_RED,       407 ; / 2048
	card_freq ANCIENT_JAR,            2 ; / 2048
	card_freq TWO_MOUTH_DARKRULER,  154 ; / 2048
	card_freq HANIWA,                 1 ; / 2048
	card_freq DISSOLVEROCK,         292 ; / 2048
	card_freq STONE_ARMADILLER,     269 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,    281 ; / 2048
	card_freq RAISE_BODY_HEAT,      100 ; / 2048
	card_freq WASTELAND,            100 ; / 2048
	card_freq RED_MEDICINE,          50 ; / 2048
	card_freq HINOTAMA,              50 ; / 2048
	card_freq_table_end

.Mako:
	card_freq_table_start
	card_freq FIEND_KRAKEN,         193 ; / 2048
	card_freq JELLYFISH,            175 ; / 2048
	card_freq KAIRYU_SHIN,           10 ; / 2048
	card_freq OCTOBERSER,            19 ; / 2048
	card_freq TOAD_MASTER,           92 ; / 2048
	card_freq AKIHIRON,               9 ; / 2048
	card_freq MELTING_RED_SHADOW,     2 ; / 2048
	card_freq MONSTURTLE,            19 ; / 2048
	card_freq TURTLE_TIGER,         148 ; / 2048
	card_freq ARMA_KNIGHT,          133 ; / 2048
	card_freq PENGUIN_KNIGHT,        24 ; / 2048
	card_freq DOROVER,               23 ; / 2048
	card_freq TWIN_LONG_RODS_1,      18 ; / 2048
	card_freq AQUA_MADOOR,          109 ; / 2048
	card_freq ROAR_OCEAN_SNAKE,       1 ; / 2048
	card_freq HITODENCHAK,            1 ; / 2048
	card_freq RARE_FISH,             82 ; / 2048
	card_freq WATER_ELEMENT,         18 ; / 2048
	card_freq ROOT_WATER,            23 ; / 2048
	card_freq WATER_OMOTICS,        132 ; / 2048
	card_freq HYO,                   50 ; / 2048
	card_freq ENCHANTING_MERMAID,   174 ; / 2048
	card_freq BEASTKING_OF_SWAMP,   112 ; / 2048
	card_freq FURIOUS_SEA_KING,       4 ; / 2048
	card_freq WETHA,                 75 ; / 2048
	card_freq CHANGE_SLIME,           1 ; / 2048
	card_freq PSYCHIC_KAPPA,          1 ; / 2048
	card_freq STEEL_SHELL,          100 ; / 2048
	card_freq POWER_OF_KAISHIN,     100 ; / 2048
	card_freq UMI,                  100 ; / 2048
	card_freq RED_MEDICINE,          50 ; / 2048
	card_freq HINOTAMA,              50 ; / 2048
	card_freq_table_end

.YamiYugi:
	card_freq_table_start
	card_freq MYSTICAL_ELF,          84 ; / 2048
	card_freq FERAL_IMP,             81 ; / 2048
	card_freq WINGED_DRAGON_1,      114 ; / 2048
	card_freq BLACKLAND_DRAGON,     185 ; / 2048
	card_freq SUMMONED_SKULL,        10 ; / 2048
	card_freq HORN_IMP,              34 ; / 2048
	card_freq BEAVER_WARRIOR,        59 ; / 2048
	card_freq ZOMBIE_WARRIOR,         9 ; / 2048
	card_freq KOUMORI_DRAGON,       234 ; / 2048
	card_freq DARK_MAGICIAN,          1 ; / 2048
	card_freq CELTIC_GUARDIAN,      113 ; / 2048
	card_freq GRIFFORE,              59 ; / 2048
	card_freq TORIKE,                 7 ; / 2048
	card_freq SANGAN,                 1 ; / 2048
	card_freq MAMMOTH_GRAVEYARD,      7 ; / 2048
	card_freq GREAT_WHITE,          325 ; / 2048
	card_freq SILVER_FANG,            7 ; / 2048
	card_freq SOLDIER_OF_STONE,     417 ; / 2048
	card_freq CATAPULT_TURTLE,      181 ; / 2048
	card_freq MYSTICAL_MOON,        100 ; / 2048
	card_freq FINAL_FLAME,           10 ; / 2048
	card_freq SWORDS_REVEALING,      10 ; / 2048
	card_freq_table_end

.Yugi:
	card_freq_table_start
	card_freq MYSTICAL_ELF,          50 ; / 2048
	card_freq MUSHROOM_MAN,          83 ; / 2048
	card_freq SHADOW_SPECTER,         2 ; / 2048
	card_freq TIME_WIZARD,           10 ; / 2048
	card_freq SKULL_SERVANT,          2 ; / 2048
	card_freq KURIBOH,                2 ; / 2048
	card_freq WHITE_MAGICAL_HAT,     56 ; / 2048
	card_freq SUPPORTER_SHADOWS,     21 ; / 2048
	card_freq YAMATANO_SCROLL,       43 ; / 2048
	card_freq NEMURIKO,              94 ; / 2048
	card_freq WEATHER_CONTROL,       11 ; / 2048
	card_freq MONSTER_EGG,           55 ; / 2048
	card_freq FIREGRASS,             54 ; / 2048
	card_freq M_WARRIOR_2,           46 ; / 2048
	card_freq LUCKY_TRINKET,         43 ; / 2048
	card_freq GENIN,                 55 ; / 2048
	card_freq FUSIONIST,             82 ; / 2048
	card_freq KEY_MACE,               1 ; / 2048
	card_freq HAPPY_LOVER,           69 ; / 2048
	card_freq PENGUIN_KNIGHT,        78 ; / 2048
	card_freq PETIT_DRAGON,          31 ; / 2048
	card_freq ARCHFIEND_MARMOT,       1 ; / 2048
	card_freq DROLL_BIRD,            14 ; / 2048
	card_freq PETIT_ANGEL,           55 ; / 2048
	card_freq THUNDER_KID,           54 ; / 2048
	card_freq HANIWA,                 2 ; / 2048
	card_freq WATER_ELEMENT,         82 ; / 2048
	card_freq ANGELWITCH,            82 ; / 2048
	card_freq EMBRYONIC_BEAST,       16 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    71 ; / 2048
	card_freq SWORDSMAN_OF_AILE,     53 ; / 2048
	card_freq WING_EGG_ELF,          34 ; / 2048
	card_freq WETHA,                 31 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   20 ; / 2048
	card_freq PROTECTOR_THRONE,      49 ; / 2048
	card_freq MYSTICAL_SHEEP_2,      82 ; / 2048
	card_freq CHANGE_SLIME,           1 ; / 2048
	card_freq ONE_EYED_SHIELD,       43 ; / 2048
	card_freq LEGENDARY_SWORD,       50 ; / 2048
	card_freq HORN_OF_UNICORN,      100 ; / 2048
	card_freq SOGEN,                 50 ; / 2048
	card_freq YAMI,                  50 ; / 2048
	card_freq DARK_HOLE,             20 ; / 2048
	card_freq MOOYAN_CURRY,          50 ; / 2048
	card_freq SPARKS,                50 ; / 2048
	card_freq DARK_PIERCE_LIGHT,    100 ; / 2048
	card_freq_table_end

.Tea:
.Joey:
	card_freq_table_start
	card_freq SHADOW_SPECTER,         2 ; / 2048
	card_freq SWAMP_BATTLEGUARD,      2 ; / 2048
	card_freq BATTLE_STEER,           2 ; / 2048
	card_freq TIME_WIZARD,           10 ; / 2048
	card_freq SKULL_SERVANT,          2 ; / 2048
	card_freq ROCK_OGRE_GROTTO1,     86 ; / 2048
	card_freq MOUNTAIN_WARRIOR,      22 ; / 2048
	card_freq KARBONALA_WARRIOR,      3 ; / 2048
	card_freq ARMORED_LIZARD,         3 ; / 2048
	card_freq KURIBOH,                2 ; / 2048
	card_freq WOLF,                  86 ; / 2048
	card_freq TIGER_AXE,             27 ; / 2048
	card_freq GAROOZIS,               2 ; / 2048
	card_freq AXE_RAIDER,             2 ; / 2048
	card_freq BATTLE_WARRIOR,        40 ; / 2048
	card_freq HERO_OF_THE_EAST,     109 ; / 2048
	card_freq SUPPORTER_SHADOWS,    128 ; / 2048
	card_freq DREAM_CLOWN,           81 ; / 2048
	card_freq CHARUBIN_THE_FIRE,    109 ; / 2048
	card_freq DRAGON_STATUE,        114 ; / 2048
	card_freq BEWITCHING_PHANTOM,    10 ; / 2048
	card_freq HARD_ARMOR,            10 ; / 2048
	card_freq M_WARRIOR_1,           76 ; / 2048
	card_freq MYSTERIOUS_PUPPET,     76 ; / 2048
	card_freq ARMAILL,               70 ; / 2048
	card_freq MASKED_CLOWN,           1 ; / 2048
	card_freq EYEARMOR,               1 ; / 2048
	card_freq ARMA_KNIGHT,          114 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,    20 ; / 2048
	card_freq DISSOLVEROCK,         109 ; / 2048
	card_freq PRINCESS_TSURUGI,      71 ; / 2048
	card_freq MOON_ENVOY,           109 ; / 2048
	card_freq MASAKI_THE_LEGEND,     98 ; / 2048
	card_freq SONIC_MAID,            81 ; / 2048
	card_freq LEGENDARY_SWORD,      100 ; / 2048
	card_freq MOUNTAIN,              50 ; / 2048
	card_freq SOGEN,                100 ; / 2048
	card_freq DARK_HOLE,             20 ; / 2048
	card_freq MOOYAN_CURRY,          50 ; / 2048
	card_freq SPARKS,                50 ; / 2048
	card_freq_table_end

.SetoKaiba:
	card_freq_table_start
	card_freq HITOTSU_ME_GIANT,      23 ; / 2048
	card_freq RYU_KISHIN,             2 ; / 2048
	card_freq WICKED_WORM_BEAST,     74 ; / 2048
	card_freq BATTLE_OX,             10 ; / 2048
	card_freq JUDGE_MAN,             10 ; / 2048
	card_freq SAGGI_THE_CLOWN,        3 ; / 2048
	card_freq GRAPPLER,              72 ; / 2048
	card_freq GYAKUTENNO_MEGAMI,     10 ; / 2048
	card_freq MYSTIC_HORSEMAN,       10 ; / 2048
	card_freq DOMA_THE_ANGEL,       158 ; / 2048
	card_freq KAMIONWIZARD,          61 ; / 2048
	card_freq ORION_THE_BATTLE,      77 ; / 2048
	card_freq WITTY_PHANTOM,        131 ; / 2048
	card_freq LISARK,                87 ; / 2048
	card_freq LORD_OF_ZEMIA,         53 ; / 2048
	card_freq THE_JUDGEMENT_HAND,    73 ; / 2048
	card_freq DARKFIRE_DRAGON,      150 ; / 2048
	card_freq TURTLE_TIGER,          29 ; / 2048
	card_freq FRENZIED_PANDA,        22 ; / 2048
	card_freq MABARREL,             123 ; / 2048
	card_freq ROAR_OCEAN_SNAKE,       2 ; / 2048
	card_freq FIEND_SWORD,           77 ; / 2048
	card_freq MASTER_AND_EXPERT,     22 ; / 2048
	card_freq MAVELUS,               47 ; / 2048
	card_freq GROUND_ATTACKER,      114 ; / 2048
	card_freq MYSTIC_CLOWN,         114 ; / 2048
	card_freq TAO_THE_CHANTER,       19 ; / 2048
	card_freq GATEKEEPER,           144 ; / 2048
	card_freq OGRE_OF_THE_BLACK,     60 ; / 2048
	card_freq FIREYAROU,             52 ; / 2048
	card_freq SONIC_MAID,            19 ; / 2048
	card_freq SWORD_OF_DARK,        100 ; / 2048
	card_freq MALEVOLENT_NUZZLER,   100 ; / 2048
	card_freq_table_end

.Mokuba:
	card_freq_table_start
	card_freq MUSHROOM_MAN,          25 ; / 2048
	card_freq SHADOW_SPECTER,         2 ; / 2048
	card_freq SKULL_SERVANT,          2 ; / 2048
	card_freq KURIBOH,                2 ; / 2048
	card_freq KOJIKOCY,              10 ; / 2048
	card_freq MAN_EATING_PLANT,      25 ; / 2048
	card_freq KROKODILUS,            10 ; / 2048
	card_freq MASK_OF_DARKNESS,      29 ; / 2048
	card_freq HERO_OF_THE_EAST,      19 ; / 2048
	card_freq DARK_GRAY,             42 ; / 2048
	card_freq WHITE_MAGICAL_HAT,     42 ; / 2048
	card_freq SUPPORTER_SHADOWS,     37 ; / 2048
	card_freq DREAM_CLOWN,           13 ; / 2048
	card_freq SLEEPING_LION,          8 ; / 2048
	card_freq YAMATANO_SCROLL,       26 ; / 2048
	card_freq DARK_PLANT,             1 ; / 2048
	card_freq NEMURIKO,              30 ; / 2048
	card_freq WEATHER_CONTROL,        1 ; / 2048
	card_freq CHARUBIN_THE_FIRE,     29 ; / 2048
	card_freq MYSTICAL_CAPTURE,      12 ; / 2048
	card_freq FIENDS_HAND,            1 ; / 2048
	card_freq MYSTERY_HAND,           1 ; / 2048
	card_freq NECROLANCER,           41 ; / 2048
	card_freq DJINN_THE_WATCHER,     24 ; / 2048
	card_freq BEWITCHING_PHANTOM,    12 ; / 2048
	card_freq MONSTER_EGG,           12 ; / 2048
	card_freq SHADOW_WHO_CONTROL,    30 ; / 2048
	card_freq FIRE_REAPER,            7 ; / 2048
	card_freq FIREGRASS,              9 ; / 2048
	card_freq MAN_EATER,             24 ; / 2048
	card_freq DIG_BEAK,               2 ; / 2048
	card_freq M_WARRIOR_1,           30 ; / 2048
	card_freq M_WARRIOR_2,           12 ; / 2048
	card_freq MYSTERIOUS_PUPPET,     18 ; / 2048
	card_freq ANCIENT_JAR,            1 ; / 2048
	card_freq ARMAILL,               24 ; / 2048
	card_freq DARK_PRISONER,         19 ; / 2048
	card_freq HURRICAIL,             25 ; / 2048
	card_freq FIRE_EYE,              24 ; / 2048
	card_freq PHANTOM_DEWAN,          9 ; / 2048
	card_freq ARLOWNAY,              10 ; / 2048
	card_freq MASKED_CLOWN,           1 ; / 2048
	card_freq LUCKY_TRINKET,          7 ; / 2048
	card_freq GENIN,                 12 ; / 2048
	card_freq EYEARMOR,               1 ; / 2048
	card_freq FUSIONIST,             44 ; / 2048
	card_freq LALA_LI_OON,            1 ; / 2048
	card_freq KEY_MACE,               1 ; / 2048
	card_freq DORON,                 32 ; / 2048
	card_freq ARMA_KNIGHT,           24 ; / 2048
	card_freq MECH_MOLE_ZOMBIE,       1 ; / 2048
	card_freq HAPPY_LOVER,           21 ; / 2048
	card_freq PENGUIN_KNIGHT,        49 ; / 2048
	card_freq PETIT_DRAGON,           3 ; / 2048
	card_freq ARCHFIEND_MARMOT,       1 ; / 2048
	card_freq PHANTOM_GHOST,          7 ; / 2048
	card_freq DROLL_BIRD,             1 ; / 2048
	card_freq PETIT_ANGEL,           12 ; / 2048
	card_freq HINOTAMA_SOUL,          1 ; / 2048
	card_freq THUNDER_KID,            9 ; / 2048
	card_freq MEOTOKO,                9 ; / 2048
	card_freq KAGEMUSHA_BLUE,        19 ; / 2048
	card_freq TRAP_MASTER,           18 ; / 2048
	card_freq SKULL_STALKER,         49 ; / 2048
	card_freq HOURGLASS_OF_LIFE,      9 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,     1 ; / 2048
	card_freq GUARDIAN_LABYRINTH,    24 ; / 2048
	card_freq HANIWA,                 1 ; / 2048
	card_freq YASHINOKI,             24 ; / 2048
	card_freq VISHWAR_RANDI,         44 ; / 2048
	card_freq THE_DRDEK,             18 ; / 2048
	card_freq CANDLE_OF_FATE,         1 ; / 2048
	card_freq WATER_ELEMENT,         44 ; / 2048
	card_freq NEKOGAL_1,             24 ; / 2048
	card_freq EMBRYONIC_BEAST,        1 ; / 2048
	card_freq PREVENT_RAT,            1 ; / 2048
	card_freq DD_WARRIOR,             7 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    36 ; / 2048
	card_freq SWORDSMAN_OF_AILE,     30 ; / 2048
	card_freq WING_EGG_ELF,          25 ; / 2048
	card_freq PRINCESS_TSURUGI,      44 ; / 2048
	card_freq UNKNOWN_WARRIOR,       30 ; / 2048
	card_freq SECTARIAN_SECRET,       7 ; / 2048
	card_freq WETHA,                 41 ; / 2048
	card_freq ANCIENT_TREE,          12 ; / 2048
	card_freq GREEN_PHANTOM_KING,    12 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   36 ; / 2048
	card_freq PROTECTOR_THRONE,      21 ; / 2048
	card_freq MYSTICAL_SHEEP_2,      44 ; / 2048
	card_freq SERPENT_MARAUDER,       9 ; / 2048
	card_freq CHANGE_SLIME,           1 ; / 2048
	card_freq MOON_ENVOY,            18 ; / 2048
	card_freq MASAKI_THE_LEGEND,     12 ; / 2048
	card_freq SONIC_MAID,            12 ; / 2048
	card_freq KURAMA,                36 ; / 2048
	card_freq HORN_OF_LIGHT,        100 ; / 2048
	card_freq INVIGORATION,         100 ; / 2048
	card_freq DARK_HOLE,            100 ; / 2048
	card_freq RED_MEDICINE,          50 ; / 2048
	card_freq HINOTAMA,              50 ; / 2048
	card_freq_table_end

.Tristan:
	card_freq_table_start
	card_freq MUSHROOM_MAN,         140 ; / 2048
	card_freq SHADOW_SPECTER,         2 ; / 2048
	card_freq SKULL_SERVANT,          2 ; / 2048
	card_freq KURIBOH,                2 ; / 2048
	card_freq MAN_EATING_PLANT,     140 ; / 2048
	card_freq KAGENINGEN,           140 ; / 2048
	card_freq SLEEPING_LION,         55 ; / 2048
	card_freq DARK_PLANT,             2 ; / 2048
	card_freq DJINN_THE_WATCHER,    140 ; / 2048
	card_freq LARVAS,               140 ; / 2048
	card_freq FIREGRASS,             86 ; / 2048
	card_freq MAN_EATER,            139 ; / 2048
	card_freq DIG_BEAK,              32 ; / 2048
	card_freq HURRICAIL,             59 ; / 2048
	card_freq ARLOWNAY,              10 ; / 2048
	card_freq FUSIONIST,            139 ; / 2048
	card_freq YASHINOKI,            139 ; / 2048
	card_freq NEKOGAL_1,             15 ; / 2048
	card_freq PREVENT_RAT,            1 ; / 2048
	card_freq STONE_ARMADILLER,      99 ; / 2048
	card_freq ANCIENT_TREE,          18 ; / 2048
	card_freq GREEN_PHANTOM_KING,     6 ; / 2048
	card_freq KURAMA,               172 ; / 2048
	card_freq VILE_GERMS,           100 ; / 2048
	card_freq SILVER_BOW_AND_ARROW, 100 ; / 2048
	card_freq FOREST,                50 ; / 2048
	card_freq DARK_HOLE,             20 ; / 2048
	card_freq MOOYAN_CURRY,          50 ; / 2048
	card_freq SPARKS,                50 ; / 2048
	card_freq_table_end

.Bakura:
	card_freq_table_start
	card_freq SHADOW_SPECTER,         4 ; / 2048
	card_freq SKULL_SERVANT,          2 ; / 2048
	card_freq KURIBOH,                2 ; / 2048
	card_freq WINGS_OF_FLAME,        77 ; / 2048
	card_freq MASK_OF_DARKNESS,      40 ; / 2048
	card_freq CURTAIN_OF_DARK,       34 ; / 2048
	card_freq DARK_GRAY,             34 ; / 2048
	card_freq DARK_PLANT,             2 ; / 2048
	card_freq FIENDS_HAND,           45 ; / 2048
	card_freq MYSTERY_HAND,           7 ; / 2048
	card_freq NECROLANCER,           33 ; / 2048
	card_freq DJINN_THE_WATCHER,     63 ; / 2048
	card_freq BEWITCHING_PHANTOM,    82 ; / 2048
	card_freq SHADOW_WHO_CONTROL,    57 ; / 2048
	card_freq FIRE_REAPER,           63 ; / 2048
	card_freq ANCIENT_JAR,            1 ; / 2048
	card_freq DARK_PRISONER,         44 ; / 2048
	card_freq HURRICAIL,             14 ; / 2048
	card_freq FIRE_EYE,              63 ; / 2048
	card_freq PHANTOM_DEWAN,         76 ; / 2048
	card_freq MASKED_CLOWN,          26 ; / 2048
	card_freq LUCKY_TRINKET,         63 ; / 2048
	card_freq GENIN,                 57 ; / 2048
	card_freq LALA_LI_OON,           44 ; / 2048
	card_freq DORON,                 44 ; / 2048
	card_freq MECH_MOLE_ZOMBIE,       4 ; / 2048
	card_freq PHANTOM_GHOST,         63 ; / 2048
	card_freq HINOTAMA_SOUL,         33 ; / 2048
	card_freq MEOTOKO,               76 ; / 2048
	card_freq KAGEMUSHA_BLUE,        44 ; / 2048
	card_freq TRAP_MASTER,           26 ; / 2048
	card_freq SKULL_STALKER,         14 ; / 2048
	card_freq HOURGLASS_OF_LIFE,     76 ; / 2048
	card_freq GUARDIAN_LABYRINTH,     1 ; / 2048
	card_freq VISHWAR_RANDI,         26 ; / 2048
	card_freq THE_DRDEK,             76 ; / 2048
	card_freq CANDLE_OF_FATE,        44 ; / 2048
	card_freq EMBRYONIC_BEAST,       33 ; / 2048
	card_freq DD_WARRIOR,             1 ; / 2048
	card_freq UNKNOWN_WARRIOR,       35 ; / 2048
	card_freq SECTARIAN_SECRET,      63 ; / 2048
	card_freq SERPENT_MARAUDER,      76 ; / 2048
	card_freq SWORD_OF_DARK,         50 ; / 2048
	card_freq YAMI,                 100 ; / 2048
	card_freq DARK_HOLE,             20 ; / 2048
	card_freq MOOYAN_CURRY,         100 ; / 2048
	card_freq RED_MEDICINE,          50 ; / 2048
	card_freq GOBLINS_REMEDY,        10 ; / 2048
	card_freq SPARKS,                50 ; / 2048
	card_freq_table_end

.Puppeteer:
	card_freq_table_start
	card_freq BATTLE_OX,             10 ; / 2048
	card_freq GRAPPLER,             104 ; / 2048
	card_freq THAT_WHICH_FEEDS,     111 ; / 2048
	card_freq LARVAS,                 2 ; / 2048
	card_freq LISARK,                89 ; / 2048
	card_freq MYSTERIOUS_PUPPET,     74 ; / 2048
	card_freq DARK_KING_ABYSS,       80 ; / 2048
	card_freq ANCIENT_BRAIN,         14 ; / 2048
	card_freq CLAW_REACHER,          16 ; / 2048
	card_freq DARK_SHADE,            27 ; / 2048
	card_freq FIEND_REFLECTION2,    104 ; / 2048
	card_freq AKAKIEISU,             16 ; / 2048
	card_freq TURTLE_TIGER,          74 ; / 2048
	card_freq FRENZIED_PANDA,       111 ; / 2048
	card_freq SOLITUDE,              48 ; / 2048
	card_freq GUARDIAN_LABYRINTH,    58 ; / 2048
	card_freq ONE_WHO_HUNTS_SOUL,    71 ; / 2048
	card_freq MASTER_AND_EXPERT,    110 ; / 2048
	card_freq DD_WARRIOR,           110 ; / 2048
	card_freq BEASTKING_OF_SWAMP,    41 ; / 2048
	card_freq ANCIENT_SORCERER,      73 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,     26 ; / 2048
	card_freq WING_EGG_ELF,           1 ; / 2048
	card_freq UNKNOWN_WARRIOR,       13 ; / 2048
	card_freq WETHA,                 19 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   26 ; / 2048
	card_freq KING_FOG,              19 ; / 2048
	card_freq TAO_THE_CHANTER,       92 ; / 2048
	card_freq MOON_ENVOY,            71 ; / 2048
	card_freq MASAKI_THE_LEGEND,     88 ; / 2048
	card_freq DRAGONESS_WICKED,      92 ; / 2048
	card_freq ONE_EYED_SHIELD,       13 ; / 2048
	card_freq DRAGON_ERSATZ_HEAD,     3 ; / 2048
	card_freq SONIC_MAID,            92 ; / 2048
	card_freq STOP_DEFENSE,         100 ; / 2048
	card_freq YAMI,                  50 ; / 2048
	card_freq_table_end

.PaniK:
	card_freq_table_start
	card_freq CASTLE_OF_DARK,        10 ; / 2048
	card_freq REAPER_OF_THE_CARD,   165 ; / 2048
	card_freq BAROX,                242 ; / 2048
	card_freq DARK_CHIMERA,         150 ; / 2048
	card_freq METAL_GUARDIAN,        10 ; / 2048
	card_freq JOB_CHANGE_MIRROR,     15 ; / 2048
	card_freq TAINTED_WISDOM,        95 ; / 2048
	card_freq BIG_EYE,               88 ; / 2048
	card_freq GATE_DEEG,              2 ; / 2048
	card_freq SYNCHAR,                2 ; / 2048
	card_freq TERRA_THE_TERRIBLE,   146 ; / 2048
	card_freq SOLITUDE,              25 ; / 2048
	card_freq MASKED_SORCERER,       42 ; / 2048
	card_freq MIDNIGHT_FIEND,         1 ; / 2048
	card_freq FIEND_SWORD,          151 ; / 2048
	card_freq MADJINN_GUNN,           1 ; / 2048
	card_freq MEDA_BAT,               1 ; / 2048
	card_freq DD_WARRIOR,            87 ; / 2048
	card_freq ARCHFIEND_MIRROR,       1 ; / 2048
	card_freq VERSAGO_DESTROYER,     33 ; / 2048
	card_freq MEGIRUS_LIGHT,          1 ; / 2048
	card_freq GORGON_EGG,             1 ; / 2048
	card_freq MYSTIC_CLOWN,         188 ; / 2048
	card_freq TAO_THE_CHANTER,       76 ; / 2048
	card_freq DARK_ARTIST,            6 ; / 2048
	card_freq DRAGONESS_WICKED,      76 ; / 2048
	card_freq BIO_PLANT,              3 ; / 2048
	card_freq CYBER_SOLDIER_DARK,   228 ; / 2048
	card_freq DRAGON_ERSATZ_HEAD,     2 ; / 2048
	card_freq DARK_ENERGY,          100 ; / 2048
	card_freq YAMI,                 100 ; / 2048
	card_freq_table_end

.BanditKeith:
	card_freq_table_start
	card_freq THE_SNAKE_HAIR,       170 ; / 2048
	card_freq ZANKI,                 78 ; / 2048
	card_freq CRAWLING_DRAGON,       78 ; / 2048
	card_freq CRASS_CLOWN,          221 ; / 2048
	card_freq ARMORED_ZOMBIE,        56 ; / 2048
	card_freq DRAGON_ZOMBIE,         23 ; / 2048
	card_freq CLOWN_ZOMBIE,         113 ; / 2048
	card_freq GRAVEYARD_AND_HAND,     2 ; / 2048
	card_freq ANCIENT_TOOL,          42 ; / 2048
	card_freq THE_13TH_GRAVE,       134 ; / 2048
	card_freq FIENDS_HAND,            1 ; / 2048
	card_freq B_EYED_SIL_ZOMBIE,      5 ; / 2048
	card_freq TEMPLE_OF_SKULLS,      61 ; / 2048
	card_freq DOKUROIZO_THE_GRIM,    41 ; / 2048
	card_freq FIRE_REAPER,            1 ; / 2048
	card_freq MECH_MOLE_ZOMBIE,       1 ; / 2048
	card_freq PHANTOM_GHOST,          1 ; / 2048
	card_freq FLAME_GHOST,           26 ; / 2048
	card_freq WOOD_REMAINS,          32 ; / 2048
	card_freq D_ASSAILANT,          197 ; / 2048
	card_freq DISSOLVEROCK,          16 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,     35 ; / 2048
	card_freq GROUND_ATTACKER,      169 ; / 2048
	card_freq HOLOGRAH,              61 ; / 2048
	card_freq GATEKEEPER,            67 ; / 2048
	card_freq CYBER_SOLDIER_DARK,   217 ; / 2048
	card_freq VIOLET_CRYSTAL,       100 ; / 2048
	card_freq MACHINE_CONVERSION,   100 ; / 2048
	card_freq_table_end

.Maximillion:
	card_freq_table_start
	card_freq DRAGON_PIPER,          10 ; / 2048
	card_freq ROGUE_DOLL,           195 ; / 2048
	card_freq WATTKID,                2 ; / 2048
	card_freq TRIAL_OF_NIGHTMARE,    40 ; / 2048
	card_freq ANSATSU,              245 ; / 2048
	card_freq LORD_OF_THE_LAMP,     121 ; / 2048
	card_freq AKIHIRON,             287 ; / 2048
	card_freq BIG_EYE,               14 ; / 2048
	card_freq FRENZIED_PANDA,        14 ; / 2048
	card_freq DRYAD,                 49 ; / 2048
	card_freq MASKED_SORCERER,        6 ; / 2048
	card_freq ROAR_OCEAN_SNAKE,      24 ; / 2048
	card_freq FIEND_SWORD,           86 ; / 2048
	card_freq DARK_TITAN_TERROR,     49 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,   169 ; / 2048
	card_freq WATER_OMOTICS,        120 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,      1 ; / 2048
	card_freq WING_EGG_ELF,           1 ; / 2048
	card_freq MAVELUS,               39 ; / 2048
	card_freq ANCIENT_TREE,           1 ; / 2048
	card_freq GREEN_PHANTOM_KING,     1 ; / 2048
	card_freq PROTECTOR_THRONE,       5 ; / 2048
	card_freq MYSTIC_CLOWN,         155 ; / 2048
	card_freq TAO_THE_CHANTER,       13 ; / 2048
	card_freq GATEKEEPER,           286 ; / 2048
	card_freq OGRE_OF_THE_BLACK,     49 ; / 2048
	card_freq FIREYAROU,             43 ; / 2048
	card_freq SONIC_MAID,            13 ; / 2048
	card_freq DRAGON_CAPTURE_JAR,    10 ; / 2048
	card_freq_table_end

.Simon:
	card_freq_table_start
	card_freq MYSTICAL_ELF,         153 ; / 2048
	card_freq TIME_WIZARD,           10 ; / 2048
	card_freq SUMMONED_SKULL,        10 ; / 2048
	card_freq SAGGI_THE_CLOWN,       18 ; / 2048
	card_freq ROGUE_DOLL,           206 ; / 2048
	card_freq CURTAIN_OF_DARK,        2 ; / 2048
	card_freq SPIRIT_OF_THE_WIND,   135 ; / 2048
	card_freq WHITE_MAGICAL_HAT,      9 ; / 2048
	card_freq KAMIONWIZARD,         205 ; / 2048
	card_freq LAMOON,               222 ; / 2048
	card_freq FLAME_MANIPULATOR,      5 ; / 2048
	card_freq AKAKIEISU,              9 ; / 2048
	card_freq AQUA_MADOOR,          152 ; / 2048
	card_freq DRYAD,                205 ; / 2048
	card_freq MASKED_SORCERER,       52 ; / 2048
	card_freq ANGELWITCH,             1 ; / 2048
	card_freq ANCIENT_SORCERER,      59 ; / 2048
	card_freq SECTARIAN_SECRET,       1 ; / 2048
	card_freq TAO_THE_CHANTER,       94 ; / 2048
	card_freq AXE_OF_DESPAIR,       100 ; / 2048
	card_freq ELFS_LIGHT,           100 ; / 2048
	card_freq BEAST_FANGS,          100 ; / 2048
	card_freq BLACK_PENDANT,        100 ; / 2048
	card_freq BOOK_OF_SECRET_ART,   100 ; / 2048
	card_freq_table_end

Func_36e34:
	push af
	push bc
	call Func_23f7
	cp $00
	jr nz, .asm_36e4e
	ld a, [$cfb8]
	farcall SetPlayerDeckIndex
	farcall GetPlayerDeckCard
	farcall Func_b894
	farcall Func_c630
	jr .asm_36e5a
.asm_36e4e
	call Func_36e5d
	farcall Func_5af2
	farcall GiveCard
	farcall Func_b894
.asm_36e5a
	pop bc
	pop af
	ret

Func_36e5d:
	push af
	ld a, [$cfbb]
	ld c, a
	ld a, [$cfbc]
	ld b, a
	pop af
	ret

ChoosePlayerAnteCard:
	push af
	push bc
	ld a, 0
	ld [wRandRangeStart], a
	ld a, DECK_SIZE - 1
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld [$cfb8], a
	farcall SetPlayerDeckIndex
	farcall GetPlayerDeckCard
	ld a, c
	ld [$cfb9], a
	ld a, b
	ld [$cfba], a
	pop bc
	pop af
	ret

Func_36e8e:
	push af
	push bc
	push de
	push hl
	call Func_36ebd
	ld a, b
	cp $01
	jr z, .asm_36eb8
	ld d, $00
	farcall Func_b724
	ld e, a
	sla e
	ld hl, $6f18
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	sla c
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	farcall Func_5af2
	farcall GiveCard
	farcall Func_b889
.asm_36eb8
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_36ebd:
	push af
	push de
	push hl
	ld b, $00
	ld a, [$ceef]
	ld c, a
	sla c
	ld hl, $cf70
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $6f02
	ld c, $00
.asm_36ed4
	push bc
	push de
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld de, rIE
	call CompareBCAndDE
	pop de
	pop bc
	cp $00
	jr nz, .asm_36eea
	ld b, $01
	jr .asm_36efe
.asm_36eea
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call CompareBCAndDE
	pop bc
	cp $00
	jr nz, .asm_36efb
	ld b, $00
	jr .asm_36efe
.asm_36efb
	inc c
	jr .asm_36ed4
.asm_36efe
	pop hl
	pop de
	pop af
	ret
; 0x36f02

SECTION "Bank 0d@708e", ROMX[$708e], BANK[$0d]

Func_3708e:
	push af
	ld a, $00
	ld [$cfdf], a
	ld a, $00
	ld [$cfe0], a
	pop af
	ret
; 0x3709b
