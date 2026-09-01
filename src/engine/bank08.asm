	dw BANK(@)

	farcall_table_start
	farfunc GenerateAIOpponentDeck

GenerateAIOpponentDeck:
	push af
	push bc
	push de
	push hl
	ld e, 0
.loop
	ld a, e
	cp DECK_SIZE
	jr nc, .done
	ld a, e
	farcall SetOppDuelDeckIndex
	call .GenerateCard
	farcall AddCardToOpponentDeck
	inc e
	jr .loop
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

; output:
; - bc = card ID
.GenerateCard:
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
	farcall ConvertNPCDuelistToCharacter
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
	call CompareBCAndDE
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
	card_freq BIG_INSECT,            41 ; / 2048
	card_freq BASIC_INSECT,         176 ; / 2048
	card_freq HERCULES_BEETLE,        2 ; / 2048
	card_freq KILLER_NEEDLE,        100 ; / 2048
	card_freq GOKIBORE,              47 ; / 2048
	card_freq GIANT_FLEA,             9 ; / 2048
	card_freq NIGHTMARE_SCORPION,   301 ; / 2048
	card_freq SPIKED_SNAIL,         252 ; / 2048
	card_freq WINGED_CLEAVER,       290 ; / 2048
	card_freq KUMOOTOKO,            231 ; / 2048
	card_freq WOOD_CLOWN,           268 ; / 2048
	card_freq WODAN_THE_RESIDENT,   231 ; / 2048
	card_freq PETIT_MOTH,           100 ; / 2048
	card_freq_table_end

.Mai:
	card_freq_table_start
	card_freq TYHONE,                 5 ; / 2048
	card_freq HARPIE_LADY,            2 ; / 2048
	card_freq HARPIE_LADY_SISTER,     2 ; / 2048
	card_freq SPIRIT_OF_THE_WIND,     2 ; / 2048
	card_freq GODDESS_THIRD_EYE,     13 ; / 2048
	card_freq SPIRIT_OF_THE_BOOK,     2 ; / 2048
	card_freq YAMATANO_SCROLL,       90 ; / 2048
	card_freq FAITH_BIRD,             2 ; / 2048
	card_freq LAMOON,                 4 ; / 2048
	card_freq NEMURIKO,             110 ; / 2048
	card_freq DJINN_THE_WATCHER,    112 ; / 2048
	card_freq LARVAS,                90 ; / 2048
	card_freq SPIRIT_OF_THE_HARP,    53 ; / 2048
	card_freq HURRICAIL,             83 ; / 2048
	card_freq ARLOWNAY,              90 ; / 2048
	card_freq FIEND_REFLECTION2,     12 ; / 2048
	card_freq KEY_MACE,              36 ; / 2048
	card_freq PETIT_DRAGON,         109 ; / 2048
	card_freq DROLL_BIRD,            97 ; / 2048
	card_freq PETIT_ANGEL,          109 ; / 2048
	card_freq DRYAD,                  4 ; / 2048
	card_freq HOURGLASS_OF_LIFE,    116 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,     3 ; / 2048
	card_freq VISHWAR_RANDI,         89 ; / 2048
	card_freq WATER_ELEMENT,         89 ; / 2048
	card_freq WATER_OMOTICS,          1 ; / 2048
	card_freq ENCHANTING_MERMAID,    17 ; / 2048
	card_freq NEKOGAL_1,             30 ; / 2048
	card_freq ANGELWITCH,            89 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    90 ; / 2048
	card_freq WING_EGG_ELF,          74 ; / 2048
	card_freq PRINCESS_TSURUGI,      89 ; / 2048
	card_freq MAVELUS,               10 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   42 ; / 2048
	card_freq PROTECTOR_THRONE,      58 ; / 2048
	card_freq MOON_ENVOY,            24 ; / 2048
	card_freq ONE_EYED_SHIELD,       79 ; / 2048
	card_freq SONIC_MAID,            17 ; / 2048
	card_freq KURAMA,               104 ; / 2048
	card_freq_table_end

.Rex:
	card_freq_table_start
	card_freq SWORD_ARM_DRAGON,       2 ; / 2048
	card_freq ROCK_OGRE_GROTTO1,    261 ; / 2048
	card_freq TWO_HEADED_KING_REX,    7 ; / 2048
	card_freq ARMORED_LIZARD,        13 ; / 2048
	card_freq MEGAZOWLER,             2 ; / 2048
	card_freq URABY,                 54 ; / 2048
	card_freq CRAWLING_DRAGON_2,      6 ; / 2048
	card_freq RED_EYES_B_DRAGON,      1 ; / 2048
	card_freq TOMOZAURUS,           123 ; / 2048
	card_freq SLEEPING_LION,        178 ; / 2048
	card_freq RHAIMUNDOS_RED,        64 ; / 2048
	card_freq ANCIENT_JAR,           55 ; / 2048
	card_freq TWO_MOUTH_DARKRULER,  292 ; / 2048
	card_freq HANIWA,               140 ; / 2048
	card_freq DISSOLVEROCK,         265 ; / 2048
	card_freq PREVENT_RAT,           96 ; / 2048
	card_freq STONE_ARMADILLER,     260 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,    229 ; / 2048
	card_freq_table_end

.Mako:
	card_freq_table_start
	card_freq FIEND_KRAKEN,           7 ; / 2048
	card_freq JELLYFISH,              6 ; / 2048
	card_freq KAIRYU_SHIN,            2 ; / 2048
	card_freq OCTOBERSER,             2 ; / 2048
	card_freq TOAD_MASTER,           60 ; / 2048
	card_freq AKIHIRON,               1 ; / 2048
	card_freq MELTING_RED_SHADOW,   128 ; / 2048
	card_freq MONSTURTLE,           128 ; / 2048
	card_freq LUCKY_TRINKET,        158 ; / 2048
	card_freq TURTLE_TIGER,          32 ; / 2048
	card_freq DORON,                136 ; / 2048
	card_freq ARMA_KNIGHT,           43 ; / 2048
	card_freq PENGUIN_KNIGHT,       118 ; / 2048
	card_freq DOROVER,              118 ; / 2048
	card_freq TWIN_LONG_RODS_1,     128 ; / 2048
	card_freq AQUA_MADOOR,            4 ; / 2048
	card_freq ROAR_OCEAN_SNAKE,       1 ; / 2048
	card_freq HITODENCHAK,          156 ; / 2048
	card_freq RARE_FISH,              1 ; / 2048
	card_freq WATER_ELEMENT,        128 ; / 2048
	card_freq ROOT_WATER,           118 ; / 2048
	card_freq WATER_OMOTICS,          1 ; / 2048
	card_freq HYO,                  105 ; / 2048
	card_freq ENCHANTING_MERMAID,    25 ; / 2048
	card_freq BEASTKING_OF_SWAMP,    51 ; / 2048
	card_freq FURIOUS_SEA_KING,     156 ; / 2048
	card_freq WETHA,                 71 ; / 2048
	card_freq CHANGE_SLIME,          51 ; / 2048
	card_freq PSYCHIC_KAPPA,        113 ; / 2048
	card_freq_table_end

.YamiYugi:
	card_freq_table_start
	card_freq MYSTICAL_ELF,          41 ; / 2048
	card_freq FERAL_IMP,             55 ; / 2048
	card_freq WINGED_DRAGON_1,       65 ; / 2048
	card_freq BLACKLAND_DRAGON,      71 ; / 2048
	card_freq SWAMP_BATTLEGUARD,    202 ; / 2048
	card_freq BATTLE_STEER,         182 ; / 2048
	card_freq FLAME_SWORDSMAN,      210 ; / 2048
	card_freq SUMMONED_SKULL,       112 ; / 2048
	card_freq HORN_IMP,              32 ; / 2048
	card_freq BEAVER_WARRIOR,        43 ; / 2048
	card_freq ZOMBIE_WARRIOR,        15 ; / 2048
	card_freq KOUMORI_DRAGON,        93 ; / 2048
	card_freq DARK_MAGICIAN,         28 ; / 2048
	card_freq GAIA_DRAGON_CHAMP,     19 ; / 2048
	card_freq GAIA_FIERCE_KNIGHT,    64 ; / 2048
	card_freq CURSE_OF_DRAGON,      190 ; / 2048
	card_freq CELTIC_GUARDIAN,       64 ; / 2048
	card_freq GRIFFORE,              43 ; / 2048
	card_freq TORIKE,                12 ; / 2048
	card_freq SANGAN,                 2 ; / 2048
	card_freq MAMMOTH_GRAVEYARD,     13 ; / 2048
	card_freq GREAT_WHITE,           96 ; / 2048
	card_freq SILVER_FANG,           13 ; / 2048
	card_freq GAROOZIS,             201 ; / 2048
	card_freq SOLDIER_OF_STONE,     117 ; / 2048
	card_freq CATAPULT_TURTLE,       64 ; / 2048
	card_freq B_SKULL_DRAGON,         1 ; / 2048
	card_freq_table_end

.Yugi:
	card_freq_table_start
	card_freq MYSTICAL_ELF,           2 ; / 2048
	card_freq MUSHROOM_MAN,          12 ; / 2048
	card_freq SHADOW_SPECTER,       105 ; / 2048
	card_freq TIME_WIZARD,          151 ; / 2048
	card_freq SKULL_SERVANT,         14 ; / 2048
	card_freq KURIBOH,               14 ; / 2048
	card_freq WINGS_OF_FLAME,        36 ; / 2048
	card_freq CURTAIN_OF_DARK,      118 ; / 2048
	card_freq KAGENINGEN,            12 ; / 2048
	card_freq DARK_PLANT,            36 ; / 2048
	card_freq NEMURIKO,               5 ; / 2048
	card_freq WEATHER_CONTROL,      127 ; / 2048
	card_freq FIENDS_HAND,           95 ; / 2048
	card_freq BEWITCHING_PHANTOM,    20 ; / 2048
	card_freq FIREGRASS,             35 ; / 2048
	card_freq MAN_EATER,             11 ; / 2048
	card_freq LUCKY_TRINKET,         58 ; / 2048
	card_freq LALA_LI_OON,           95 ; / 2048
	card_freq KEY_MACE,              72 ; / 2048
	card_freq HAPPY_LOVER,           26 ; / 2048
	card_freq PETIT_DRAGON,          72 ; / 2048
	card_freq ARCHFIEND_MARMOT,     126 ; / 2048
	card_freq DROLL_BIRD,           117 ; / 2048
	card_freq PETIT_ANGEL,           50 ; / 2048
	card_freq HINOTAMA_SOUL,        117 ; / 2048
	card_freq THUNDER_KID,           35 ; / 2048
	card_freq MEOTOKO,               35 ; / 2048
	card_freq HANIWA,               159 ; / 2048
	card_freq YASHINOKI,             11 ; / 2048
	card_freq CANDLE_OF_FATE,        95 ; / 2048
	card_freq EMBRYONIC_BEAST,      114 ; / 2048
	card_freq CHANGE_SLIME,          72 ; / 2048
	card_freq KURAMA,                 1 ; / 2048
	card_freq_table_end

.Tea:
	dw $01
	dw $02
	dw $03
	dw $04
	dw $0a
	dw $0f
	dw $14
	dw $19
	dw $1e
	dw $23
	dw $28
	dw $2d
	dw $32
	dw $37
	dw $3c
	dw $41
	dw $46
	dw $4b
	dw $50
	dw $55
	dw $5a
	dw $63

.Joey:
	card_freq_table_start
	card_freq BABY_DRAGON,            1 ; / 2048
	card_freq MUSHROOM_MAN,          57 ; / 2048
	card_freq TIME_WIZARD,           70 ; / 2048
	card_freq SKULL_SERVANT,          4 ; / 2048
	card_freq KURIBOH,                4 ; / 2048
	card_freq THOUSAND_DRAGON,        1 ; / 2048
	card_freq RED_EYES_B_DRAGON,      1 ; / 2048
	card_freq WINGS_OF_FLAME,        98 ; / 2048
	card_freq CURTAIN_OF_DARK,      116 ; / 2048
	card_freq DARK_PLANT,             9 ; / 2048
	card_freq FIENDS_HAND,          121 ; / 2048
	card_freq BEWITCHING_PHANTOM,    85 ; / 2048
	card_freq FIRE_REAPER,          103 ; / 2048
	card_freq MAN_EATER,             56 ; / 2048
	card_freq FIRE_EYE,              56 ; / 2048
	card_freq PHANTOM_DEWAN,         97 ; / 2048
	card_freq MASKED_CLOWN,         102 ; / 2048
	card_freq EYEARMOR,             115 ; / 2048
	card_freq LALA_LI_OON,          120 ; / 2048
	card_freq PHANTOM_GHOST,        102 ; / 2048
	card_freq HINOTAMA_SOUL,        115 ; / 2048
	card_freq MEOTOKO,               97 ; / 2048
	card_freq KAGEMUSHA_BLUE,        74 ; / 2048
	card_freq HOURGLASS_OF_LIFE,     97 ; / 2048
	card_freq CANDLE_OF_FATE,       120 ; / 2048
	card_freq SECTARIAN_SECRET,     102 ; / 2048
	card_freq SERPENT_MARAUDER,      97 ; / 2048
	card_freq KURAMA,                28 ; / 2048
	card_freq_table_end

.SetoKaiba:
	card_freq_table_start
	card_freq B_EYE_WHITE_DRAGON,    25 ; / 2048
	card_freq HITOTSU_ME_GIANT,      40 ; / 2048
	card_freq RYU_KISHIN,            15 ; / 2048
	card_freq SWAMP_BATTLEGUARD,     32 ; / 2048
	card_freq BATTLE_STEER,          37 ; / 2048
	card_freq WICKED_WORM_BEAST,     43 ; / 2048
	card_freq BATTLE_OX,             45 ; / 2048
	card_freq JUDGE_MAN,             10 ; / 2048
	card_freq SAGGI_THE_CLOWN,       15 ; / 2048
	card_freq KARBONALA_WARRIOR,     54 ; / 2048
	card_freq ARMORED_LIZARD,        54 ; / 2048
	card_freq WOLF,                  34 ; / 2048
	card_freq TIGER_AXE,             49 ; / 2048
	card_freq KOJIKOCY,              54 ; / 2048
	card_freq GRAPPLER,              52 ; / 2048
	card_freq AXE_RAIDER,            45 ; / 2048
	card_freq GYAKUTENNO_MEGAMI,     19 ; / 2048
	card_freq MYSTIC_HORSEMAN,       55 ; / 2048
	card_freq RABID_HORSEMAN,        13 ; / 2048
	card_freq BATTLE_WARRIOR,         6 ; / 2048
	card_freq HERO_OF_THE_EAST,      31 ; / 2048
	card_freq DOMA_THE_ANGEL,        48 ; / 2048
	card_freq KAMIONWIZARD,          48 ; / 2048
	card_freq SUPPORTER_SHADOWS,     23 ; / 2048
	card_freq DREAM_CLOWN,           36 ; / 2048
	card_freq ORION_THE_BATTLE,      31 ; / 2048
	card_freq CHARUBIN_THE_FIRE,     26 ; / 2048
	card_freq WITTY_PHANTOM,         55 ; / 2048
	card_freq DRAGON_STATUE,         28 ; / 2048
	card_freq M_WARRIOR_1,           14 ; / 2048
	card_freq M_WARRIOR_2,            2 ; / 2048
	card_freq LISARK,                52 ; / 2048
	card_freq LORD_OF_ZEMIA,         46 ; / 2048
	card_freq THE_JUDGEMENT_HAND,    42 ; / 2048
	card_freq DARKFIRE_DRAGON,       54 ; / 2048
	card_freq ARMAILL,               13 ; / 2048
	card_freq TURTLE_TIGER,          36 ; / 2048
	card_freq ARMA_KNIGHT,           28 ; / 2048
	card_freq FRENZIED_PANDA,        39 ; / 2048
	card_freq MABARREL,              41 ; / 2048
	card_freq ROAR_OCEAN_SNAKE,       6 ; / 2048
	card_freq FIEND_SWORD,           44 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,    44 ; / 2048
	card_freq MASTER_AND_EXPERT,     39 ; / 2048
	card_freq PREVENT_RAT,           24 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    10 ; / 2048
	card_freq SWORDSMAN_OF_AILE,     17 ; / 2048
	card_freq WING_EGG_ELF,           7 ; / 2048
	card_freq PRINCESS_TSURUGI,      10 ; / 2048
	card_freq MAVELUS,               43 ; / 2048
	card_freq GROUND_ATTACKER,       51 ; / 2048
	card_freq PROTECTOR_THRONE,      23 ; / 2048
	card_freq MYSTIC_CLOWN,          51 ; / 2048
	card_freq TAO_THE_CHANTER,       36 ; / 2048
	card_freq GATEKEEPER,            46 ; / 2048
	card_freq OGRE_OF_THE_BLACK,     48 ; / 2048
	card_freq MOON_ENVOY,            31 ; / 2048
	card_freq FIREYAROU,             46 ; / 2048
	card_freq MASAKI_THE_LEGEND,     33 ; / 2048
	card_freq ONE_EYED_SHIELD,       13 ; / 2048
	card_freq SONIC_MAID,            36 ; / 2048
	card_freq_table_end

.Mokuba:
	card_freq_table_start
	card_freq MUSHROOM_MAN,          27 ; / 2048
	card_freq SHADOW_SPECTER,        23 ; / 2048
	card_freq SKULL_SERVANT,          5 ; / 2048
	card_freq ARMORED_LIZARD,         2 ; / 2048
	card_freq KURIBOH,                5 ; / 2048
	card_freq WOLF,                   2 ; / 2048
	card_freq KOJIKOCY,               2 ; / 2048
	card_freq MAN_EATING_PLANT,      27 ; / 2048
	card_freq KROKODILUS,             2 ; / 2048
	card_freq AXE_RAIDER,             2 ; / 2048
	card_freq BATTLE_WARRIOR,        23 ; / 2048
	card_freq MASK_OF_DARKNESS,      24 ; / 2048
	card_freq HERO_OF_THE_EAST,       2 ; / 2048
	card_freq DARK_GRAY,             15 ; / 2048
	card_freq WHITE_MAGICAL_HAT,      7 ; / 2048
	card_freq SUPPORTER_SHADOWS,      2 ; / 2048
	card_freq DREAM_CLOWN,            2 ; / 2048
	card_freq SLEEPING_LION,         18 ; / 2048
	card_freq YAMATANO_SCROLL,       25 ; / 2048
	card_freq DARK_PLANT,             9 ; / 2048
	card_freq NEMURIKO,              23 ; / 2048
	card_freq WEATHER_CONTROL,       39 ; / 2048
	card_freq CHARUBIN_THE_FIRE,      2 ; / 2048
	card_freq MYSTICAL_CAPTURE,      35 ; / 2048
	card_freq FIENDS_HAND,           43 ; / 2048
	card_freq MYSTERY_HAND,          35 ; / 2048
	card_freq DRAGON_STATUE,          2 ; / 2048
	card_freq NECROLANCER,           15 ; / 2048
	card_freq DJINN_THE_WATCHER,     27 ; / 2048
	card_freq BEWITCHING_PHANTOM,    35 ; / 2048
	card_freq MONSTER_EGG,           35 ; / 2048
	card_freq SHADOW_WHO_CONTROL,    23 ; / 2048
	card_freq FIRE_REAPER,           38 ; / 2048
	card_freq LARVAS,                12 ; / 2048
	card_freq FIREGRASS,             37 ; / 2048
	card_freq MAN_EATER,             26 ; / 2048
	card_freq DIG_BEAK,              37 ; / 2048
	card_freq M_WARRIOR_1,           13 ; / 2048
	card_freq M_WARRIOR_2,           30 ; / 2048
	card_freq MYSTERIOUS_PUPPET,      1 ; / 2048
	card_freq ANCIENT_JAR,           12 ; / 2048
	card_freq ARMAILL,               17 ; / 2048
	card_freq DARK_PRISONER,         30 ; / 2048
	card_freq HURRICAIL,             23 ; / 2048
	card_freq FIRE_EYE,              26 ; / 2048
	card_freq PHANTOM_DEWAN,         37 ; / 2048
	card_freq ARLOWNAY,              12 ; / 2048
	card_freq MASKED_CLOWN,          38 ; / 2048
	card_freq LUCKY_TRINKET,         38 ; / 2048
	card_freq GENIN,                 34 ; / 2048
	card_freq EYEARMOR,              41 ; / 2048
	card_freq FUSIONIST,             12 ; / 2048
	card_freq LALA_LI_OON,           42 ; / 2048
	card_freq KEY_MACE,              14 ; / 2048
	card_freq DORON,                 20 ; / 2048
	card_freq ARMA_KNIGHT,            1 ; / 2048
	card_freq MECH_MOLE_ZOMBIE,      30 ; / 2048
	card_freq HAPPY_LOVER,           29 ; / 2048
	card_freq PENGUIN_KNIGHT,         8 ; / 2048
	card_freq PETIT_DRAGON,          41 ; / 2048
	card_freq ARCHFIEND_MARMOT,      26 ; / 2048
	card_freq PHANTOM_GHOST,         38 ; / 2048
	card_freq DROLL_BIRD,            41 ; / 2048
	card_freq PETIT_ANGEL,           34 ; / 2048
	card_freq HINOTAMA_SOUL,         41 ; / 2048
	card_freq THUNDER_KID,           37 ; / 2048
	card_freq MEOTOKO,               37 ; / 2048
	card_freq KAGEMUSHA_BLUE,        30 ; / 2048
	card_freq TRAP_MASTER,           26 ; / 2048
	card_freq SKULL_STALKER,          8 ; / 2048
	card_freq HOURGLASS_OF_LIFE,     37 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,     1 ; / 2048
	card_freq GUARDIAN_LABYRINTH,     1 ; / 2048
	card_freq HANIWA,                34 ; / 2048
	card_freq YASHINOKI,             26 ; / 2048
	card_freq VISHWAR_RANDI,         12 ; / 2048
	card_freq THE_DRDEK,             30 ; / 2048
	card_freq CANDLE_OF_FATE,        42 ; / 2048
	card_freq WATER_ELEMENT,         12 ; / 2048
	card_freq NEKOGAL_1,              1 ; / 2048
	card_freq EMBRYONIC_BEAST,       38 ; / 2048
	card_freq PREVENT_RAT,           17 ; / 2048
	card_freq DD_WARRIOR,             1 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    15 ; / 2048
	card_freq SWORDSMAN_OF_AILE,      9 ; / 2048
	card_freq WING_EGG_ELF,          20 ; / 2048
	card_freq PRINCESS_TSURUGI,      12 ; / 2048
	card_freq UNKNOWN_WARRIOR,       13 ; / 2048
	card_freq SECTARIAN_SECRET,      38 ; / 2048
	card_freq WETHA,                  2 ; / 2048
	card_freq ANCIENT_TREE,          21 ; / 2048
	card_freq GREEN_PHANTOM_KING,    17 ; / 2048
	card_freq RAY_AND_TEMPERATURE,    1 ; / 2048
	card_freq PROTECTOR_THRONE,       9 ; / 2048
	card_freq MYSTICAL_SHEEP_2,      12 ; / 2048
	card_freq SERPENT_MARAUDER,      37 ; / 2048
	card_freq CHANGE_SLIME,          14 ; / 2048
	card_freq MOON_ENVOY,             1 ; / 2048
	card_freq MASAKI_THE_LEGEND,      1 ; / 2048
	card_freq SONIC_MAID,             1 ; / 2048
	card_freq KURAMA,                18 ; / 2048
	card_freq_table_end

.Tristan:
	card_freq_table_start
	card_freq SKULL_SERVANT,        683 ; / 2048
	card_freq KURIBOH,              683 ; / 2048
	card_freq DARK_PLANT,           682 ; / 2048
	card_freq_table_end

.Bakura:
	card_freq_table_start
	card_freq MUSHROOM_MAN,           2 ; / 2048
	card_freq SKULL_SERVANT,        119 ; / 2048
	card_freq KURIBOH,              118 ; / 2048
	card_freq CURTAIN_OF_DARK,       15 ; / 2048
	card_freq DARK_PLANT,           437 ; / 2048
	card_freq MYSTERY_HAND,         207 ; / 2048
	card_freq ANCIENT_JAR,          594 ; / 2048
	card_freq MASKED_CLOWN,         104 ; / 2048
	card_freq MECH_MOLE_ZOMBIE,     437 ; / 2048
	card_freq HINOTAMA_SOUL,         15 ; / 2048
	card_freq_table_end

.Puppeteer:
	card_freq_table_start
	card_freq BATTLE_OX,              2 ; / 2048
	card_freq MOUNTAIN_WARRIOR,      28 ; / 2048
	card_freq GRAPPLER,               5 ; / 2048
	card_freq MASK_OF_DARKNESS,      36 ; / 2048
	card_freq CURTAIN_OF_DARK,        9 ; / 2048
	card_freq GRAVEYARD_AND_HAND,    36 ; / 2048
	card_freq THAT_WHICH_FEEDS,      19 ; / 2048
	card_freq DARK_GRAY,             48 ; / 2048
	card_freq WHITE_MAGICAL_HAT,     48 ; / 2048
	card_freq DREAM_CLOWN,           24 ; / 2048
	card_freq CHARUBIN_THE_FIRE,     39 ; / 2048
	card_freq FIENDS_HAND,           12 ; / 2048
	card_freq DRAGON_STATUE,         36 ; / 2048
	card_freq NECROLANCER,           48 ; / 2048
	card_freq BEWITCHING_PHANTOM,    27 ; / 2048
	card_freq SHADOW_WHO_CONTROL,    41 ; / 2048
	card_freq FIRE_REAPER,           19 ; / 2048
	card_freq LARVAS,                49 ; / 2048
	card_freq HARD_ARMOR,            19 ; / 2048
	card_freq MAN_EATER,             36 ; / 2048
	card_freq M_WARRIOR_1,           41 ; / 2048
	card_freq M_WARRIOR_2,           20 ; / 2048
	card_freq LISARK,                 4 ; / 2048
	card_freq MYSTERIOUS_PUPPET,     26 ; / 2048
	card_freq DARK_KING_ABYSS,       28 ; / 2048
	card_freq DARK_PRISONER,         28 ; / 2048
	card_freq ANCIENT_BRAIN,         48 ; / 2048
	card_freq FIRE_EYE,              36 ; / 2048
	card_freq CLAW_REACHER,          49 ; / 2048
	card_freq PHANTOM_DEWAN,         23 ; / 2048
	card_freq DARK_SHADE,            45 ; / 2048
	card_freq GENIN,                 24 ; / 2048
	card_freq FIEND_REFLECTION2,     17 ; / 2048
	card_freq AKAKIEISU,             49 ; / 2048
	card_freq TURTLE_TIGER,          26 ; / 2048
	card_freq DORON,                 39 ; / 2048
	card_freq FRENZIED_PANDA,        18 ; / 2048
	card_freq PHANTOM_GHOST,         18 ; / 2048
	card_freq MEOTOKO,               22 ; / 2048
	card_freq KAGEMUSHA_BLUE,        27 ; / 2048
	card_freq SOLITUDE,              38 ; / 2048
	card_freq TRAP_MASTER,           23 ; / 2048
	card_freq SKULL_STALKER,         53 ; / 2048
	card_freq MADJINN_GUNN,          18 ; / 2048
	card_freq GUARDIAN_LABYRINTH,    35 ; / 2048
	card_freq THE_DRDEK,             31 ; / 2048
	card_freq ONE_WHO_HUNTS_SOUL,    31 ; / 2048
	card_freq MASTER_AND_EXPERT,     18 ; / 2048
	card_freq DD_WARRIOR,            18 ; / 2048
	card_freq BEASTKING_OF_SWAMP,    40 ; / 2048
	card_freq ANCIENT_SORCERER,      31 ; / 2048
	card_freq SWORDSMAN_OF_AILE,     40 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,     31 ; / 2048
	card_freq WING_EGG_ELF,          28 ; / 2048
	card_freq UNKNOWN_WARRIOR,       40 ; / 2048
	card_freq WETHA,                 47 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   44 ; / 2048
	card_freq KING_FOG,              47 ; / 2048
	card_freq MYSTICAL_SHEEP_2,      48 ; / 2048
	card_freq TAO_THE_CHANTER,       23 ; / 2048
	card_freq MOON_ENVOY,            31 ; / 2048
	card_freq MASAKI_THE_LEGEND,     26 ; / 2048
	card_freq DRAGONESS_WICKED,      23 ; / 2048
	card_freq ONE_EYED_SHIELD,       35 ; / 2048
	card_freq DRAGON_ERSATZ_HEAD,    57 ; / 2048
	card_freq SONIC_MAID,            23 ; / 2048
	card_freq_table_end

.PaniK:
	card_freq_table_start
	card_freq MOUNTAIN_WARRIOR,      38 ; / 2048
	card_freq CASTLE_OF_DARK,        52 ; / 2048
	card_freq REAPER_OF_THE_CARD,     9 ; / 2048
	card_freq KING_OF_YAMIMAKAI,      2 ; / 2048
	card_freq BAROX,                 12 ; / 2048
	card_freq DARK_CHIMERA,           2 ; / 2048
	card_freq METAL_GUARDIAN,        38 ; / 2048
	card_freq JOB_CHANGE_MIRROR,     79 ; / 2048
	card_freq DREAM_CLOWN,           79 ; / 2048
	card_freq HARD_ARMOR,            24 ; / 2048
	card_freq TAINTED_WISDOM,        73 ; / 2048
	card_freq BIG_EYE,               75 ; / 2048
	card_freq GENIN,                 30 ; / 2048
	card_freq GATE_DEEG,             40 ; / 2048
	card_freq SYNCHAR,               69 ; / 2048
	card_freq TERRA_THE_TERRIBLE,    54 ; / 2048
	card_freq SOLITUDE,              98 ; / 2048
	card_freq MASKED_SORCERER,       82 ; / 2048
	card_freq MIDNIGHT_FIEND,        46 ; / 2048
	card_freq FIEND_SWORD,           50 ; / 2048
	card_freq MADJINN_GUNN,          22 ; / 2048
	card_freq GUARDIAN_LABYRINTH,    93 ; / 2048
	card_freq MEDA_BAT,              37 ; / 2048
	card_freq DD_WARRIOR,            74 ; / 2048
	card_freq ARCHFIEND_MIRROR,      27 ; / 2048
	card_freq SWORDSMAN_OF_AILE,     78 ; / 2048
	card_freq VERSAGO_DESTROYER,     93 ; / 2048
	card_freq MEGIRUS_LIGHT,         67 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   99 ; / 2048
	card_freq GORGON_EGG,            30 ; / 2048
	card_freq MYSTIC_CLOWN,          25 ; / 2048
	card_freq MYSTICAL_SHEEP_2,      74 ; / 2048
	card_freq TAO_THE_CHANTER,       78 ; / 2048
	card_freq DARK_ARTIST,           56 ; / 2048
	card_freq DRAGONESS_WICKED,      78 ; / 2048
	card_freq BIO_PLANT,             55 ; / 2048
	card_freq CYBER_SOLDIER_DARK,    22 ; / 2048
	card_freq DRAGON_ERSATZ_HEAD,    88 ; / 2048
	card_freq_table_end

.BanditKeith:
	card_freq_table_start
	card_freq SWAMP_BATTLEGUARD,      3 ; / 2048
	card_freq BATTLE_STEER,           9 ; / 2048
	card_freq MOUNTAIN_WARRIOR,       6 ; / 2048
	card_freq THE_SNAKE_HAIR,        48 ; / 2048
	card_freq WOLF,                  73 ; / 2048
	card_freq TIGER_AXE,             87 ; / 2048
	card_freq KOJIKOCY,              48 ; / 2048
	card_freq AXE_RAIDER,            25 ; / 2048
	card_freq ZANKI,                 19 ; / 2048
	card_freq CRAWLING_DRAGON,       19 ; / 2048
	card_freq CRASS_CLOWN,           65 ; / 2048
	card_freq ARMORED_ZOMBIE,        17 ; / 2048
	card_freq DRAGON_ZOMBIE,         10 ; / 2048
	card_freq CLOWN_ZOMBIE,          35 ; / 2048
	card_freq PUMPKING_THE_KING,      2 ; / 2048
	card_freq BATTLE_WARRIOR,        10 ; / 2048
	card_freq GRAVEYARD_AND_HAND,     7 ; / 2048
	card_freq HERO_OF_THE_EAST,      75 ; / 2048
	card_freq WHITE_MAGICAL_HAT,     36 ; / 2048
	card_freq DREAM_CLOWN,           81 ; / 2048
	card_freq SLEEPING_LION,         48 ; / 2048
	card_freq ANCIENT_TOOL,           9 ; / 2048
	card_freq THE_13TH_GRAVE,        80 ; / 2048
	card_freq CHARUBIN_THE_FIRE,     59 ; / 2048
	card_freq FIENDS_HAND,            1 ; / 2048
	card_freq DRAGON_STATUE,         67 ; / 2048
	card_freq B_EYED_SIL_ZOMBIE,     18 ; / 2048
	card_freq TEMPLE_OF_SKULLS,      53 ; / 2048
	card_freq DOKUROIZO_THE_GRIM,    47 ; / 2048
	card_freq FIRE_REAPER,            1 ; / 2048
	card_freq M_WARRIOR_1,           29 ; / 2048
	card_freq M_WARRIOR_2,            2 ; / 2048
	card_freq MYSTERIOUS_PUPPET,     71 ; / 2048
	card_freq ARMAILL,               28 ; / 2048
	card_freq ARMA_KNIGHT,           67 ; / 2048
	card_freq MECH_MOLE_ZOMBIE,       1 ; / 2048
	card_freq PHANTOM_GHOST,          1 ; / 2048
	card_freq FLAME_GHOST,           40 ; / 2048
	card_freq TRAP_MASTER,            5 ; / 2048
	card_freq WOOD_REMAINS,          46 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,    51 ; / 2048
	card_freq D_ASSAILANT,           92 ; / 2048
	card_freq DISSOLVEROCK,          32 ; / 2048
	card_freq PREVENT_RAT,           44 ; / 2048
	card_freq STONE_ARMADILLER,      31 ; / 2048
	card_freq LUNAR_QUEEN_ELZAIM,    19 ; / 2048
	card_freq SWORDSMAN_OF_AILE,     38 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,     35 ; / 2048
	card_freq WING_EGG_ELF,          13 ; / 2048
	card_freq GROUND_ATTACKER,       58 ; / 2048
	card_freq RAY_AND_TEMPERATURE,   53 ; / 2048
	card_freq MYSTICAL_SHEEP_2,      18 ; / 2048
	card_freq HOLOGRAH,              53 ; / 2048
	card_freq GATEKEEPER,            16 ; / 2048
	card_freq MASAKI_THE_LEGEND,     80 ; / 2048
	card_freq CYBER_SOLDIER_DARK,    67 ; / 2048
	card_freq_table_end

.Maximillion:
	card_freq_table_start
	card_freq SWAMP_BATTLEGUARD,     73 ; / 2048
	card_freq BATTLE_STEER,          90 ; / 2048
	card_freq MOUNTAIN_WARRIOR,       2 ; / 2048
	card_freq DRAGON_PIPER,           3 ; / 2048
	card_freq ILLUSION_FACELESS,     62 ; / 2048
	card_freq ROGUE_DOLL,           104 ; / 2048
	card_freq WATTKID,                3 ; / 2048
	card_freq WOLF,                  23 ; / 2048
	card_freq TIGER_AXE,             62 ; / 2048
	card_freq KOJIKOCY,             125 ; / 2048
	card_freq AXE_RAIDER,           108 ; / 2048
	card_freq BATTLE_WARRIOR,         2 ; / 2048
	card_freq HERO_OF_THE_EAST,      12 ; / 2048
	card_freq WHITE_MAGICAL_HAT,      3 ; / 2048
	card_freq SUPPORTER_SHADOWS,      5 ; / 2048
	card_freq TRIAL_OF_NIGHTMARE,    48 ; / 2048
	card_freq DREAM_CLOWN,           24 ; / 2048
	card_freq SLEEPING_LION,         20 ; / 2048
	card_freq ANSATSU,              110 ; / 2048
	card_freq CHARUBIN_THE_FIRE,      8 ; / 2048
	card_freq DRAGON_STATUE,          9 ; / 2048
	card_freq LORD_OF_THE_LAMP,     103 ; / 2048
	card_freq AKIHIRON,             110 ; / 2048
	card_freq M_WARRIOR_1,            2 ; / 2048
	card_freq M_WARRIOR_2,            1 ; / 2048
	card_freq BIG_EYE,               27 ; / 2048
	card_freq FRENZIED_PANDA,        27 ; / 2048
	card_freq DRYAD,                 61 ; / 2048
	card_freq MASKED_SORCERER,       13 ; / 2048
	card_freq ROAR_OCEAN_SNAKE,       4 ; / 2048
	card_freq FIEND_SWORD,           69 ; / 2048
	card_freq DARK_TITAN_TERROR,     61 ; / 2048
	card_freq BEAUTIFUL_HEADHUNT,    82 ; / 2048
	card_freq WATER_OMOTICS,        103 ; / 2048
	card_freq SWORDSMAN_OF_AILE,      4 ; / 2048
	card_freq ROCK_OGRE_GROTTO2,      4 ; / 2048
	card_freq WING_EGG_ELF,           1 ; / 2048
	card_freq MAVELUS,               48 ; / 2048
	card_freq ANCIENT_TREE,           4 ; / 2048
	card_freq GREEN_PHANTOM_KING,     4 ; / 2048
	card_freq PROTECTOR_THRONE,      12 ; / 2048
	card_freq MYSTIC_CLOWN,         101 ; / 2048
	card_freq TAO_THE_CHANTER,       24 ; / 2048
	card_freq GATEKEEPER,           124 ; / 2048
	card_freq OGRE_OF_THE_BLACK,     61 ; / 2048
	card_freq MOON_ENVOY,            11 ; / 2048
	card_freq FIREYAROU,             53 ; / 2048
	card_freq MASAKI_THE_LEGEND,     14 ; / 2048
	card_freq SONIC_MAID,            24 ; / 2048
	card_freq_table_end

.Simon:
	card_freq_table_start
	card_freq MYSTICAL_ELF,         115 ; / 2048
	card_freq SAGGI_THE_CLOWN,       69 ; / 2048
	card_freq DARK_MAGICIAN,          2 ; / 2048
	card_freq ILLUSION_FACELESS,    131 ; / 2048
	card_freq ROGUE_DOLL,           162 ; / 2048
	card_freq CURTAIN_OF_DARK,        4 ; / 2048
	card_freq SPIRIT_OF_THE_WIND,    96 ; / 2048
	card_freq WHITE_MAGICAL_HAT,     74 ; / 2048
	card_freq KAMIONWIZARD,         208 ; / 2048
	card_freq LAMOON,               191 ; / 2048
	card_freq FLAME_MANIPULATOR,     71 ; / 2048
	card_freq AKAKIEISU,             83 ; / 2048
	card_freq AQUA_MADOOR,          153 ; / 2048
	card_freq DRYAD,                208 ; / 2048
	card_freq MASKED_SORCERER,      121 ; / 2048
	card_freq ANGELWITCH,            44 ; / 2048
	card_freq ANCIENT_SORCERER,     143 ; / 2048
	card_freq SECTARIAN_SECRET,       7 ; / 2048
	card_freq TAO_THE_CHANTER,      166 ; / 2048
	card_freq_table_end
