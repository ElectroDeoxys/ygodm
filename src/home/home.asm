PowerUpMonster::
	push af
	push bc
	push hl
	ld a, [wTempCardStatus]
	and CARD_LEVEL_MASK
	ld c, a
	swap c
	ld b, $00
	ld hl, .Levels
	add hl, bc
	ld a, [wTempCardStatus]
	and ~CARD_LEVEL_MASK
	or [hl]
	ld [wTempCardStatus], a
	pop hl
	pop bc
	pop af
	ret

.Levels:
	db LEVEL_0      ; LEVEL_MINUS_1
	db LEVEL_PLUS_1 ; LEVEL_0
	db LEVEL_PLUS_2 ; LEVEL_PLUS_1
	db LEVEL_PLUS_2 ; LEVEL_PLUS_2

PowerDownMonster::
	push af
	push bc
	push hl
	ld a, [wTempCardStatus]
	and CARD_LEVEL_MASK
	ld c, a
	swap c
	ld b, $00
	ld hl, .Levels
	add hl, bc
	ld a, [wTempCardStatus]
	and ~CARD_LEVEL_MASK
	or [hl]
	ld [wTempCardStatus], a
	pop hl
	pop bc
	pop af
	ret

.Levels:
	db LEVEL_MINUS_1 ; LEVEL_MINUS_1
	db LEVEL_MINUS_1 ; LEVEL_0
	db LEVEL_0       ; LEVEL_PLUS_1
	db LEVEL_PLUS_1  ; LEVEL_PLUS_2

SetDefaultCardLevel::
	push af
	ld a, [wTempCardStatus]
	and ~CARD_LEVEL_MASK
	or LEVEL_0
	ld [wTempCardStatus], a
	pop af
	ret

GetCardLevel::
	ld a, [wTempCardStatus]
	and CARD_LEVEL_MASK
	swap a
	ret

SetCardFaceUp::
	push af
	ld a, [wTempCardStatus]
	or CARDFLAG_FACE_UP
	ld [wTempCardStatus], a
	pop af
	ret

SetCardFaceDown::
	push af
	ld a, [wTempCardStatus]
	and ~CARDFLAG_FACE_UP
	ld [wTempCardStatus], a
	pop af
	ret

Func_21a9::
	push af
	ld a, [wTempCardStatus]
	or CARDFLAG_UNK3
	ld [wTempCardStatus], a
	pop af
	ret

Func_21b4::
	push af
	ld a, [wTempCardStatus]
	and ~CARDFLAG_UNK3
	ld [wTempCardStatus], a
	pop af
	ret

; unreferenced
Func_21bf:
	push af
	ld a, [wTempCardStatus]
	and $f8
	or $00
	ld [wTempCardStatus], a
	pop af
	ret

Func_21cc::
	push af
	ld a, [wTempCardStatus]
	and $f8
	or $01
	ld [wTempCardStatus], a
	pop af
	ret

Func_21d9::
	push af
	ld a, [wTempCardStatus]
	and $f8
	or $02
	ld [wTempCardStatus], a
	pop af
	ret

Func_21e6::
	push af
	ld a, [wTempCardStatus]
	and $f8
	or $03
	ld [wTempCardStatus], a
	pop af
	ret

Func_21f3::
	ld a, [wTempCardStatus]
	and $07
	ret

IsCardFaceDown::
	ld a, [wTempCardStatus]
	and CARDFLAG_FACE_UP
	jr z, .true
	ld a, FALSE
.true
	ret

Func_2203::
	ld a, [wTempCardStatus]
	and CARDFLAG_UNK3
	jr z, .true
	ld a, FALSE
.true
	ret

; unreferenced
Func_220d:
	ld a, [wTempCardStatus]
	and $10
	jr z, .asm_2216
	ld a, $01
.asm_2216
	ret

Func_2217::
	push af
	xor a
	ld [wced1], a
	ld [wced2], a
	ld [wced3], a
	ld [wced4 + 0], a
	ld [wced4 + 1], a
	ld [wced6], a
	ld [wced7], a
	ld [wced8], a
	ld [wced9], a
	ld [wceda], a
	ld [wcedb], a
	ld [wcedc], a
	ld [wcedd], a
	ld [wcede], a
	ld [wcedf + 0], a
	ld [wcedf + 1], a
	ld [wcee1], a
	ld [wcee2], a
	ld [wcee3], a
	ld [wcee4], a
	ld [wcee5], a
	ld [wcee6], a
	pop af
	ret

Func_225d::
	push af
	ld a, [wced1]
	or $01
	ld [wced1], a
	pop af
	ret

Func_2268::
	push af
	ld a, [wced1]
	and $fe
	ld [wced1], a
	pop af
	ret

Func_2273::
	push af
	ld a, [wcedc]
	or $01
	ld [wcedc], a
	pop af
	ret

Func_227e::
	push af
	ld a, [wcedc]
	and $fe
	ld [wcedc], a
	pop af
	ret

Func_2289::
	push af
	ld a, [wced1]
	or $02
	ld [wced1], a
	pop af
	ret

Func_2294::
	push af
	ld a, [wced1]
	and $fd
	ld [wced1], a
	pop af
	ret

Func_229f::
	push af
	ld a, [wcedc]
	or $02
	ld [wcedc], a
	pop af
	ret

Func_22aa::
	push af
	ld a, [wcedc]
	and $fd
	ld [wcedc], a
	pop af
	ret

Func_22b5::
	push af
	ld a, [wced1]
	or $04
	ld [wced1], a
	pop af
	ret

Func_22c0::
	push af
	ld a, [wced1]
	and $fb
	ld [wced1], a
	pop af
	ret

Func_22cb::
	push af
	ld a, [wcedc]
	or $04
	ld [wcedc], a
	pop af
	ret

Func_22d6::
	push af
	ld a, [wcedc]
	and $fb
	ld [wcedc], a
	pop af
	ret

; unreferenced
Func_22e1:
	push af
	ld a, [wced1]
	or $08
	ld [wced1], a
	pop af
	ret

; unreferenced
Func_22ec:
	push af
	ld a, [wced1]
	and $f7
	ld [wced1], a
	pop af
	ret

; unreferenced
Func_22f7:
	push af
	ld a, [wcedc]
	or $08
	ld [wcedc], a
	pop af
	ret

; unreferenced
Func_2302:
	push af
	ld a, [wcedc]
	and $f7
	ld [wcedc], a
	pop af
	ret

Func_230d::
	push af
	ld a, [wced1]
	or $10
	ld [wced1], a
	pop af
	ret

Func_2318::
	push af
	ld a, [wced1]
	and $ef
	ld [wced1], a
	pop af
	ret

Func_2323::
	push af
	ld a, [wcedc]
	or $10
	ld [wcedc], a
	pop af
	ret

Func_232e::
	push af
	ld a, [wcedc]
	and $ef
	ld [wcedc], a
	pop af
	ret

; unreferenced
Func_2339:
	push af
	xor a
	ld [wNPCDuelist], a
	pop af
	ret

SetNPCDuelist::
	ld [wNPCDuelist], a
	ret

Func_2344::
	push af
	add IN_THE_SHIP_DUELISTS
	ld [wNPCDuelist], a
	pop af
	ret

Func_234c::
	push af
	ld a, DUELIST_SIMON
	ld [wNPCDuelist], a
	pop af
	ret

Func_2354::
	push af
	ld a, DUELIST_MAXIMILLION
	ld [wNPCDuelist], a
	pop af
	ret

Func_235c::
	push af
	ld a, DUELIST_YAMI_YUGI
	ld [wNPCDuelist], a
	pop af
	ret

GetDuelistClass:
	push bc
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	ld hl, .Classes
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.Classes:
	table_width 1
	db DUELISTCLASS_1 ; DUELIST_WEEVIL
	db DUELISTCLASS_1 ; DUELIST_MAI
	db DUELISTCLASS_1 ; DUELIST_REX
	db DUELISTCLASS_1 ; DUELIST_MAKO
	db DUELISTCLASS_1 ; DUELIST_SETO_KAIBA
	db DUELISTCLASS_1 ; DUELIST_MOKUBA
	db DUELISTCLASS_1 ; DUELIST_PUPPETEER
	db DUELISTCLASS_1 ; DUELIST_PANIK
	db DUELISTCLASS_1 ; DUELIST_BANDIT_KEITH
	db DUELISTCLASS_0 ; DUELIST_YUGI
	db DUELISTCLASS_0 ; DUELIST_TRISTAN
	db DUELISTCLASS_0 ; DUELIST_JOEY
	db DUELISTCLASS_0 ; DUELIST_BAKURA
	db DUELISTCLASS_1 ; DUELIST_SIMON
	db DUELISTCLASS_2 ; DUELIST_MAXIMILLION
	db DUELISTCLASS_1 ; DUELIST_YAMI_YUGI
	assert_table_length NUM_DUELISTS

Func_2384::
	push af
	ld a, DUELSTATUS_0
	ld [wDuelStatus], a
	ld a, DUELSTATUS_0
	ld [wOtherDuelStatus], a
	pop af
	ret

Func_2391::
	push af
	ld a, [wDuelStatus]
	cp DUELSTATUS_0
	jr nz, .asm_239e
	ld a, DUELSTATUS_1
	ld [wDuelStatus], a
.asm_239e
	pop af
	ret

SetDuelStatus_PlayerLoss::
	push af
	ld a, DUELSTATUS_PLAYER_LOSS
	ld [wDuelStatus], a
	pop af
	ret

SetDuelStatus_PlayerWin::
	push af
	ld a, DUELSTATUS_PLAYER_WIN
	ld [wDuelStatus], a
	pop af
	ret

; returns TRUE if duel is still ongoing
; FALSE if a win condition has been reached
IsDuelOngoing::
	push bc
	ld a, [wGameMode]
	cp GAMEMODE_DUEL_AI_OPP
	jr nz, .link_opp

; ai opp
	ld c, TRUE
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_23c3
	ld c, FALSE
.asm_23c3
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_23cc
	ld c, FALSE
.asm_23cc
	jr .got_result

.link_opp
	ld c, TRUE
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_23d9
	ld c, FALSE
.asm_23d9
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_23e2
	ld c, FALSE
.asm_23e2
	ld a, [wOtherDuelStatus]
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_23eb
	ld c, FALSE
.asm_23eb
	ld a, [wOtherDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .got_result
	ld c, FALSE
.got_result
	ld a, c
	pop bc
	ret

DidPlayerLoseDuel::
	ld a, [wGameMode]
	cp GAMEMODE_DUEL_AI_OPP
	jr nz, .link_opp

; ai opp
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_2408
	xor a ; TRUE
	jr .asm_240a
.asm_2408
	ld a, FALSE
.asm_240a
	jr .done

.link_opp
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_2417
	ld a, FALSE
	jr .done
.asm_2417
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_2421
	xor a ; TRUE
	jr .done
.asm_2421
	ld a, [wOtherDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_242b
	xor a ; TRUE
	jr .done
.asm_242b
	ld a, [wOtherDuelStatus]
	; bug, this should be cp DUELSTATUS_PLAYER_LOSS
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .done
	ld a, FALSE
.done
	ret

; unreferenced
Func_2435:
	ld a, [wGameMode]
	cp GAMEMODE_DUEL_AI_OPP
	jr nz, .link_opp

; ai opp
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_2446
	xor a
	jr .asm_2448
.asm_2446
	ld a, $01
.asm_2448
	jr .asm_2472

.link_opp
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_2454
	xor a
	jr .asm_2472
.asm_2454
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_245f
	ld a, $01
	jr .asm_2472
.asm_245f
	ld a, [wOtherDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_246a
	ld a, $01
	jr .asm_2472
.asm_246a
	ld a, [wOtherDuelStatus]
	; bug, this should be cp DUELSTATUS_PLAYER_LOSS
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_2472
	xor a
.asm_2472
	ret

FadeIn::
	push af
	ldh a, [hConsole]
	cp CONSOLE_DMG
	jr nz, .asm_247f
	call DMGFadeIn
	jr .asm_2482
.asm_247f
	call SetDefaultPalettes
.asm_2482
	pop af
	ret

FadeOut::
	push af
	ldh a, [hConsole]
	cp CONSOLE_DMG
	jr nz, .asm_2490
	call DMGFadeOut
	jr .asm_2493
.asm_2490
	call SetBlackPalettes
.asm_2493
	pop af
	ret

SetDefaultPalettes:
	push af
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

; unreferenced
Func_24a0:
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

SetBlackPalettes:
	push af
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

DMGFadeIn:
	push af
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $90
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

DMGFadeOut:
	push af
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $90
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

Func_2536::
	push af
	ld a, $90
	ldh [rOBP0], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rOBP0], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $00
	ldh [rOBP0], a
	call DoFrame
	pop af
	ret

Func_255a::
	push af
	ld a, $e0
	ldh [rOBP0], a
	call DoFrame
	pop af
	ret

Func_2564::
	push af
	ld a, [wNPCCharacter]
	cp EXODIA
	jr z, .fade_in
; no fade in
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	jr .done
.fade_in
	call .ExodiaFadeIn
.done
	pop af
	ret

.ExodiaFadeIn:
	push af
	push bc

	ld a, $ff
	ldh [rBGP], a
	ld a, $ff
	ldh [rOBP0], a
	ld a, $ff
	ldh [rOBP1], a
	; wait 50 frames
	ld c, 50
.wait_1
	call DoFrame
	dec c
	jr nz, .wait_1

	ld a, $ab
	ldh [rBGP], a
	ld a, $ea
	ldh [rOBP0], a
	ld a, $ab
	ldh [rOBP1], a
	; wait 50 frames
	ld c, 50
.wait_2
	call DoFrame
	dec c
	jr nz, .wait_2

	ld a, $5b
	ldh [rBGP], a
	ld a, $e5
	ldh [rOBP0], a
	ld a, $5b
	ldh [rOBP1], a
	; wait 100 frames
	ld c, 100
.wait_3
	call DoFrame
	dec c
	jr nz, .wait_3

	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	; wait 100 frames
	ld c, 100
.wait_4
	call DoFrame
	dec c
	jr nz, .wait_4

	pop bc
	pop af
	ret

Func_25d4::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	ld c, $32
.asm_25e3
	call DoFrame
	dec c
	jr nz, .asm_25e3
	ld a, $06
	ldh [rBGP], a
	ld a, $90
	ldh [rOBP0], a
	ld a, $06
	ldh [rOBP1], a
	ld c, $32
.asm_25f7
	call DoFrame
	dec c
	jr nz, .asm_25f7
	ld a, $01
	ldh [rBGP], a
	ld a, $40
	ldh [rOBP0], a
	ld a, $01
	ldh [rOBP1], a
	ld c, $32
.asm_260b
	call DoFrame
	dec c
	jr nz, .asm_260b
	ld a, $00
	ldh [rBGP], a
	ld a, $00
	ldh [rOBP0], a
	ld a, $00
	ldh [rOBP1], a
	ld c, $64
.asm_261f
	call DoFrame
	dec c
	jr nz, .asm_261f
	pop af
	ret

; unreferenced
Func_2627:
	push af
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_2634
	call Func_2648
	jr .asm_2637
.asm_2634
	call Func_265b
.asm_2637
	pop af
	ret

Func_2639::
	ld [wcf19], a
	ret

; unreferenced
Func_263d:
	push af
	ld a, c
	ld [wcf1a + 0], a
	ld a, b
	ld [wcf1a + 1], a
	pop af
	ret

Func_2648:
	push af
	push bc
	ld a, [wcf1a + 0]
	ld c, a
	ld a, [wcf1a + 1]
	ld b, a
	farcall Func_5af2
	farcall GiveCard
	pop bc
	pop af
	ret

Func_265b:
	push af
	push bc
	ld a, [wcf19]
	farcall RemoveCardFromPlayerDeck
	pop bc
	pop af
	ret

GenerateStartingDeck::
	call GenerateStartingDeckMonsterCards
	call GenerateStartingDeckMagicCards
	call RandomlyGiveGaiaFierceKnightOrDarkMagician
	ret

GenerateStartingDeckMonsterCards:
	push af
	push bc
	push de
	push hl
	ld a, 0
	ld [wRandRangeStart], a
	ld a, 99
	ld [wRandRangeEnd], a
	ld e, $00
.asm_2680
	push de
	ld d, $00
	call RandomRange
	ld a, [wRandNum]
	ld e, a
	sla e
	ld hl, StartingDeckMonsterCards
	add hl, de
	pop de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, e
	farcall SetPlayerDeckIndex
	farcall AddCardToPlayerDeck
	farcall Func_5af2
	farcall SetCardAsSeen
	inc e
	ld a, e
	cp NUM_STARTING_DECK_MONSTERS
	jr nz, .asm_2680
	pop hl
	pop de
	pop bc
	pop af
	ret

StartingDeckMonsterCards:
	dw RYU_KISHIN
	dw MUSHROOM_MAN
	dw SHADOW_SPECTER
	dw SKULL_SERVANT
	dw MOUNTAIN_WARRIOR
	dw WATTKID
	dw SANGAN
	dw KURIBOH
	dw MAN_EATING_PLANT
	dw WINGS_OF_FLAME
	dw MASK_OF_DARKNESS
	dw TOMOZAURUS
	dw KAGENINGEN
	dw DARK_PLANT
	dw NEMURIKO
	dw WEATHER_CONTROL
	dw MYSTICAL_CAPTURE
	dw B_EYED_SIL_ZOMBIE
	dw TOAD_MASTER
	dw FLAME_MANIPULATOR
	dw NECROLANCER
	dw DJINN_THE_WATCHER
	dw BEWITCHING_PHANTOM
	dw MONSTER_EGG
	dw SHADOW_WHO_CONTROL
	dw MELTING_RED_SHADOW
	dw FIRE_REAPER
	dw LARVAS
	dw FIREGRASS
	dw MAN_EATER
	dw DIG_BEAK
	dw M_WARRIOR_1
	dw M_WARRIOR_2
	dw ANCIENT_JAR
	dw DARK_PRISONER
	dw HURRICAIL
	dw FIRE_EYE
	dw MONSTURTLE
	dw PHANTOM_DEWAN
	dw ARLOWNAY
	dw DARK_SHADE
	dw MASKED_CLOWN
	dw LUCKY_TRINKET
	dw GENIN
	dw EYEARMOR
	dw GATE_DEEG
	dw SYNCHAR
	dw FUSIONIST
	dw AKAKIEISU
	dw LALA_LI_OON
	dw KEY_MACE
	dw TURTLE_TIGER
	dw TERRA_THE_TERRIBLE
	dw DORON
	dw ARMA_KNIGHT
	dw MECH_MOLE_ZOMBIE
	dw HAPPY_LOVER
	dw PENGUIN_KNIGHT
	dw PETIT_DRAGON
	dw ARCHFIEND_MARMOT
	dw PHANTOM_GHOST
	dw DOROVER
	dw TWIN_LONG_RODS_1
	dw DROLL_BIRD
	dw PETIT_ANGEL
	dw WINGED_CLEAVER
	dw HINOTAMA_SOUL
	dw THUNDER_KID
	dw MEOTOKO
	dw KAGEMUSHA_BLUE
	dw FLAME_GHOST
	dw TWO_MOUTH_DARKRULER
	dw MIDNIGHT_FIEND
	dw SKULL_STALKER
	dw HITODENCHAK
	dw WOOD_REMAINS
	dw HOURGLASS_OF_LIFE
	dw MADJINN_GUNN
	dw HANIWA
	dw YASHINOKI
	dw VISHWAR_RANDI
	dw THE_DRDEK
	dw CANDLE_OF_FATE
	dw WATER_ELEMENT
	dw DISSOLVEROCK
	dw MEDA_BAT
	dw ROOT_WATER
	dw ANGELWITCH
	dw EMBRYONIC_BEAST
	dw ARCHFIEND_MIRROR
	dw SECTARIAN_SECRET
	dw MEGIRUS_LIGHT
	dw RAY_AND_TEMPERATURE
	dw KING_FOG
	dw MYSTICAL_SHEEP_2
	dw SERPENT_MARAUDER
	dw CHANGE_SLIME
	dw PSYCHIC_KAPPA
	dw DRAGON_ERSATZ_HEAD
	dw KURAMA

GenerateStartingDeckMagicCards:
	push af
	push bc
	push de
	push hl
	ld e, NUM_STARTING_DECK_MONSTERS
	ld hl, StartingDeckMagicCards
.asm_277d
	ld a, e
	cp DECK_SIZE
	jr nc, .break
	ld a, e
	farcall SetPlayerDeckIndex
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall AddCardToPlayerDeck
	farcall Func_5af2
	farcall SetCardAsSeen
	inc e
	jr .asm_277d
.break
	pop hl
	pop de
	pop bc
	pop af
	ret

StartingDeckMagicCards:
	table_width 2
	dw RAIGEKI
	dw SPARKS
	dw SPARKS
	dw HINOTAMA
	dw MOOYAN_CURRY
	dw RED_MEDICINE
	dw DARK_PIERCE_LIGHT
	assert_table_length DECK_SIZE - NUM_STARTING_DECK_MONSTERS

RandomlyGiveGaiaFierceKnightOrDarkMagician:
	push af
	push bc
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

	; if de == $103, give Gaia Fierce Knight
	ld a, d
	cp $01
	jr nz, .done
	ld a, e
	cp $03
	jr nz, .dark_magician_check
	; give a Gaia Fierce Knight card
	ld bc, GAIA_FIERCE_KNIGHT
	farcall Func_5af2
	farcall GiveCard
	jr .done

.dark_magician_check
	; if de == $10e, give Dark Magician
	ld a, e
	cp $0e
	jr nz, .done
	; give a Dark Magician card
	ld bc, DARK_MAGICIAN
	farcall Func_5af2
	farcall GiveCard
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

SetInitialWinAndDuelCounts::
	push af
	push bc
	push de
	push hl

	; total duels
	xor a
	ld hl, wDuelistDuelCounts
	ld de, .InitialDuelCounts
	ld c, NUM_DUELISTS + 1
.loop_1
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_1

	; wins
	ld hl, wDuelistWinCounts
	ld de, .InitialWinCounts
	ld c, NUM_DUELISTS + 1
.loop_2
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_2

	pop hl
	pop de
	pop bc
	pop af
	ret

.InitialDuelCounts:
	table_width 2
	dw $0 ; DUELIST_WEEVIL
	dw $0 ; DUELIST_MAI
	dw $0 ; DUELIST_REX
	dw $0 ; DUELIST_MAKO
	dw $0 ; DUELIST_SETO_KAIBA
	dw $0 ; DUELIST_MOKUBA
	dw $0 ; DUELIST_PUPPETEER
	dw $0 ; DUELIST_PANIK
	dw $0 ; DUELIST_BANDIT_KEITH
	dw $0 ; DUELIST_YUGI
	dw $0 ; DUELIST_TRISTAN
	dw $0 ; DUELIST_JOEY
	dw $0 ; DUELIST_BAKURA
	dw $0 ; DUELIST_SIMON
	dw $0 ; DUELIST_MAXIMILLION
	dw $0 ; DUELIST_YAMI_YUGI
	dw $0
	assert_table_length NUM_DUELISTS + 1

.InitialWinCounts:
	table_width 2
	dw $0 ; DUELIST_WEEVIL
	dw $0 ; DUELIST_MAI
	dw $0 ; DUELIST_REX
	dw $0 ; DUELIST_MAKO
	dw $0 ; DUELIST_SETO_KAIBA
	dw $0 ; DUELIST_MOKUBA
	dw $0 ; DUELIST_PUPPETEER
	dw $0 ; DUELIST_PANIK
	dw $0 ; DUELIST_BANDIT_KEITH
	dw $0 ; DUELIST_YUGI
	dw $0 ; DUELIST_TRISTAN
	dw $0 ; DUELIST_JOEY
	dw $0 ; DUELIST_BAKURA
	dw $0 ; DUELIST_SIMON
	dw $0 ; DUELIST_MAXIMILLION
	dw $0 ; DUELIST_YAMI_YUGI
	dw $0
	assert_table_length NUM_DUELISTS + 1

IncrementBCWithMaximum9999:
	push af
	ld a, c
	cp LOW($9999)
	jr nz, .not_maxed
	ld a, b
	cp HIGH($9999)
	jr z, .maxed
.not_maxed
	ld a, c
	add LOW($1)
	daa
	ld c, a
	ld a, b
	adc HIGH($1)
	daa
	ld b, a
.maxed
	pop af
	ret

Func_287e:
	push bc
	push de
	push hl
	ld e, FALSE
	ld b, $00
	ld c, a
	sla c
	ld hl, wDuelistWinCounts
	add hl, bc
	ld a, [hli]
	cp LOW($5)
	jr nc, .asm_2898
	ld a, [hl]
	cp HIGH($0)
	jr nz, .asm_2898
	ld e, TRUE
.asm_2898
	ld a, e
	pop hl
	pop de
	pop bc
	ret

Func_289d:
	push af
	push bc
	ld a, [wcf6e + 0]
	ld c, a
	ld a, [wcf6e + 1]
	ld b, a
	call IncrementBCWithMaximum9999
	ld a, c
	ld [wcf6e + 0], a
	ld a, b
	ld [wcf6e + 1], a
	pop bc
	pop af
	ret

Func_28b5:
	push af
	push bc
	ld a, [wcf90 + 0]
	ld c, a
	ld a, [wcf90 + 1]
	ld b, a
	call IncrementBCWithMaximum9999
	ld a, c
	ld [wcf90 + 0], a
	ld a, b
	ld [wcf90 + 1], a
	pop bc
	pop af
	ret

GetDuelistWinCount::
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, wDuelistWinCounts
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	pop af
	ret

IncrementDuelistDuelCount:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	sla c
	ld hl, wDuelistDuelCounts
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	call IncrementBCWithMaximum9999
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop bc
	pop af
	ret

IncrementDuelistWinCount:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	push af
	sla c
	ld hl, wDuelistWinCounts
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld d, b
	ld e, c
	call IncrementBCWithMaximum9999
	ld a, c
	ld [hli], a
	ld [hl], b
	pop af

	; did we just beat Maximillion?
	cp DUELIST_MAXIMILLION
	jr nz, .done
	; yes, is the win count at least 5?
	ld a, b
	cp HIGH($5)
	jr nz, .beat_campaign
	ld a, c
	cp LOW($5)
	jr c, .less_than_5
	; 5 or more, show credits
	ld a, $01
	ld [wBeatCampaign], a
.less_than_5
	jr .done
.beat_campaign
	ld a, $01
	ld [wBeatCampaign], a

.done
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2938::
	push af
	call Func_289d
	call DidPlayerLoseDuel
	cp TRUE
	jr z, .asm_2946
	call Func_28b5
.asm_2946
	pop af
	ret

IncrementDuelistDuelAndWinCounts::
	push af
	call IncrementDuelistDuelCount
	call DidPlayerLoseDuel
	cp TRUE
	jr z, .lost
	call IncrementDuelistWinCount
.lost
	pop af
	ret

Func_2958::
	push de
	ld e, $00
	call Func_2982
	cp $00
	jr z, .asm_297f
	ld e, $01
	call Func_29a2
	cp $00
	jr z, .asm_297f
	ld e, $02
	call Func_29c7
	cp $00
	jr z, .asm_297f
	ld e, $03
	call Func_29dc
	cp $00
	jr z, .asm_297f
	ld e, $04
.asm_297f
	ld a, e
	pop de
	ret

Func_2982:
	push bc
	push de
	push hl
	ld e, FALSE
	ld hl, .Duelists
	ld c, NUM_IN_THE_SHIP_DUELISTS
.asm_298c
	ld a, [hli]
	call Func_287e
	cp TRUE
	jr nz, .asm_2996
	ld e, TRUE
.asm_2996
	dec c
	jr nz, .asm_298c
	ld a, e
	pop hl
	pop de
	pop bc
	ret

.Duelists:
	db DUELIST_YUGI
	db DUELIST_TRISTAN
	db DUELIST_JOEY
	db DUELIST_BAKURA

Func_29a2:
	push bc
	push de
	push hl
	ld e, FALSE
	ld hl, .Duelists
	ld c, NUM_DUEL_KINGDOM_DUELISTS
.asm_29ac
	ld a, [hli]
	call Func_287e
	cp TRUE
	jr nz, .asm_29b6
	ld e, TRUE
.asm_29b6
	dec c
	jr nz, .asm_29ac
	ld a, e
	pop hl
	pop de
	pop bc
	ret

.Duelists:
	db DUELIST_WEEVIL
	db DUELIST_MAI
	db DUELIST_REX
	db DUELIST_MAKO
	db DUELIST_SETO_KAIBA
	db DUELIST_MOKUBA
	db DUELIST_PUPPETEER
	db DUELIST_PANIK
	db DUELIST_BANDIT_KEITH

Func_29c7:
	push bc
	push de
	push hl
	ld e, FALSE
	ld a, DUELIST_SIMON
	call Func_287e
	cp TRUE
	jr nz, .asm_29d7
	ld e, TRUE
.asm_29d7
	ld a, e
	pop hl
	pop de
	pop bc
	ret

Func_29dc:
	push bc
	push de
	push hl
	ld e, FALSE
	ld a, DUELIST_MAXIMILLION
	call Func_287e
	cp TRUE
	jr nz, .asm_29ec
	ld e, TRUE
.asm_29ec
	ld a, e
	pop hl
	pop de
	pop bc
	ret

PlaySound:
	push af
	push bc
	push de
	push hl
	farcall _PlaySound
	pop hl
	pop de
	pop bc
	pop af
	ret

StopMusic::
	push af
	ld a, MUSIC_NONE
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_MainMenu::
	push af
	ld a, MUSIC_MAIN_MENU
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_Duel1::
	push af
	ld a, MUSIC_DUEL1
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_Duel2:
	push af
	ld a, MUSIC_DUEL2
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_Duel3:
	push af
	ld a, MUSIC_DUEL3
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2a34:
	push af
	ld a, MUSIC_03
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2a3f::
	push af
	ld a, MUSIC_07
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2a4a:
	push af
	ld a, MUSIC_10
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_Campaign::
	push af
	ld a, MUSIC_CAMPAIGN
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_DuelPrep::
	push af
	ld a, MUSIC_DUEL_PREP
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_Battle::
	push af
	ld a, MUSIC_BATTLE
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_DuelWin::
	push af
	ld a, MUSIC_DUEL_WIN
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_DuelLoss::
	push af
	ld a, MUSIC_DUEL_LOSS
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayMusic_Tea::
	push af
	ld a, MUSIC_TEA
	call PlaySound
	call WaitForVBlank
	pop af
	ret

PlayDuelMusic::
	push af
	ld a, [wGameMode]
	cp GAMEMODE_DUEL_AI_OPP
	jr nz, .link_opp

; ai opp
	call GetDuelistClass
	cp DUELISTCLASS_0
	jr nz, .check_class_1
; class 0
	call PlayMusic_Duel1
	jr .got_music
.check_class_1
	cp DUELISTCLASS_1
	jr nz, .class_2
; class 1
	call PlayMusic_Duel2
	jr .got_music
.class_2
	call PlayMusic_Duel3
.got_music
	jr .done

.link_opp
	call PlayMusic_Duel1

.done
	pop af
	ret

PlayDialogueMusic::
	push af
	call GetDuelistClass
	cp DUELISTCLASS_0
	jr nz, .check_class_1
; class 0
	call Func_2a34
	jr .done
.check_class_1
	cp DUELISTCLASS_1
	jr nz, .class_2
; class 1
	call Func_2a3f
	jr .done
.class_2
	call Func_2a4a
.done
	pop af
	ret

Func_2ad9::
	push af
	ld a, SFX_9A
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2ae4::
	push af
	ld a, SFX_99
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2aef::
	push af
	ld a, SFX_98
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2afa::
	push af
	ld a, SFX_95
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b05::
	push af
	ld a, SFX_9B
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b10::
	push af
	ld a, SFX_96
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b1b::
	push af
	ld a, SFX_9C
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b26::
	push af
	ld a, SFX_9D
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b31::
	push af
	ld a, SFX_93
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b3c::
	push af
	ld a, SFX_9F
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b47::
	push af
	ld a, SFX_98
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b52::
	push af
	ld a, SFX_A2
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b5d::
	push af
	ld a, SFX_A3
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b68::
	push af
	ld a, SFX_94
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b73::
	push af
	ld a, SFX_92
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b7e::
	push af
	ld a, SFX_A1
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b89::
	push af
	ld a, MUSIC_EXODIA
	call PlaySound
	call WaitForVBlank
	pop af
	ret

Func_2b94::
	push af
	xor a
	ld [wcfbe], a
	ld [wcfbf], a
	pop af
	ret

; unreferenced
Func_2b9e:
	push af
	ld a, [wcfbe]
	or $01
	ld [wcfbe], a
	pop af
	ret

Func_2ba9::
	push af
	ld a, [wcfbe]
	and $fe
	ld [wcfbe], a
	pop af
	ret

Func_2bb4::
	push af
	ld a, [wcfbf]
	or $01
	ld [wcfbf], a
	pop af
	ret

Func_2bbf::
	push af
	ld a, [wcfbf]
	and $fe
	ld [wcfbf], a
	pop af
	ret

Func_2bca::
	ld a, [wcfbe]
	and $01
	jr z, .asm_2bd3
	ld a, $01
.asm_2bd3
	ret

Func_2bd4::
	ld a, [wcfbf]
	and $01
	jr z, .asm_2bdd
	ld a, $01
.asm_2bdd
	ret

Func_2bde::
	push af
	xor a
	ld [wcfc0], a
	ld [wcfc1], a
	pop af
	ret

Func_2be8::
	push af
	ld a, $04
	ld [wcfc1], a
	pop af
	ret

Func_2bf0::
	push af
	ld a, [wcfc0]
	cp $00
	jr z, .asm_2bfc
	dec a
	ld [wcfc0], a
.asm_2bfc
	pop af
	ret

Func_2bfe::
	push af
	ld a, [wcfc1]
	cp $00
	jr z, .asm_2c0a
	dec a
	ld [wcfc1], a
.asm_2c0a
	pop af
	ret

Func_2c0c::
	push bc
	push hl
	ld b, $00
	ld a, [wcfc0]
	ld c, a
	ld hl, Data_2c2c
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_2c1c::
	push bc
	push hl
	ld b, $00
	ld a, [wcfc1]
	ld c, a
	ld hl, Data_2c2c
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Data_2c2c:
	db $02, $01, $00, $00, $00

Func_2c31::
	push af
	call Func_2c0c
	cp $00
	jr nz, .asm_2c3f
	xor a
	farcall Func_1512c
	jr .asm_2c48
.asm_2c3f
	cp $01
	jr nz, .asm_2c48
	ld a, $01
	farcall Func_1512c
.asm_2c48
	pop af
	ret

Func_2c4a::
	push af
	push bc
	push de
	push hl
	xor a
	ld [wcfc2], a
	ld [wcfd6], a
	ld [wcfd7], a
	ld [wcfd8], a
	ld [wcfd9], a
	ld [wcfda], a
	ld [wcfdb], a
	ld [wcfdc], a
	ld [wcfdd], a
	ld [wcfde], a
	ld hl, wcfc4
	ld a, $ff
	ld c, LINE_LENGTH
.asm_2c74
	ld [hli], a
	dec c
	jr nz, .asm_2c74
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2c7d::
	push de
	push hl
	ld b, $00
	ld a, [wcfc3]
	ld c, a
	sla c
	ld hl, .data
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcfc2]
	cp $00
	jr nz, .asm_2c9d
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, [hl]
	call Func_2cc3
.asm_2c9d
	ld b, $00
	ld a, [wcfc2]
	ld c, a
	inc a
	ld [wcfc2], a
	ld hl, wcfc4
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [wcfc2]
	ld e, a
	ld a, [wTextLength]
	cp e
	jr nz, .asm_2cb9
	ld b, $01
.asm_2cb9
	ld a, c
	pop hl
	pop de
	ret

.data
	dw wcfd6
	dw wcfd9
	dw wcfdc

Func_2cc3:
	push af
	push bc
	push de
	push hl
	ld a, d
	farcall SetTextLoadMode
	farcall SetTextArg
	farcall LoadText
	ld hl, wcfc4
	ld de, wTextBuffer
	ld c, LINE_LENGTH
.asm_2cd9
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2cd9
	xor a
	ld [wcfc2], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2ce8::
	push af
	ld [wcfc3], a
	xor a
	ld [wcfc2], a
	pop af
	ret

Func_2cf2::
	push af
	ld a, c
	ld [wcfd6], a
	ld a, b
	ld [wcfd7], a
	ld a, e
	ld [wcfd8], a
	pop af
	ret

Func_2d01::
	push af
	ld a, c
	ld [wcfd9], a
	ld a, b
	ld [wcfda], a
	ld a, e
	ld [wcfdb], a
	pop af
	ret

Func_2d10::
	push af
	ld a, c
	ld [wcfdc], a
	ld a, b
	ld [wcfdd], a
	ld a, e
	ld [wcfde], a
	pop af
	ret

Func_2d1f:
	ld a, MUSIC_08
	ld [wcfef], a
	call Func_2d2e
	xor a
	ld [wcfef], a
	jp Func_f4002

Func_2d2e:
	di
	bankswitch BANK(_PlaySound)
	ei
	ld a, [wcfef]
	call _PlaySound
	di
	bankswitch BANK(Func_f4002)
	ei
	ret

VBlank16:
	call Func_f6e5d
	bankswitch BANK(UpdateAudio)
	call UpdateAudio
	di
	bankswitch BANK(Func_f4002)
	ei
	ld a, $01
	ld [wcfe2], a
	pop de
	pop bc
	pop hl
	pop af
	reti
