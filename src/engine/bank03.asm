	dw BANK(@)

	farcall_table_start
	farfunc $406c ; $03
	farfunc $40b9 ; $05
	farfunc $425e ; $07
	farfunc $452e ; $09
	farfunc ClearPlayerDeck ; $0b
	farfunc GetPlayerDeckCardCount ; $0d
	farfunc $4786 ; $0f
	farfunc Func_cbe9 ; $11
	farfunc Func_cb87 ; $13
	farfunc Func_e7eb ; $15
	farfunc Func_cc4c ; $17
	farfunc Func_e84e ; $19
	farfunc $4618 ; $1b
	farfunc $4664 ; $1d
	farfunc $675b ; $1f
	farfunc $67a7 ; $21
	farfunc GetPlayerDeckCard ; $23
	farfunc Func_c630 ; $25
	farfunc $6747 ; $27
	farfunc $6773 ; $29
	farfunc $4d55 ; $2b
	farfunc Func_d249 ; $2d
	farfunc SetupDuel ; $2f
	farfunc Func_cefb ; $31
	farfunc Func_cfe1 ; $33
	farfunc $53ec ; $35
	farfunc Func_cd9a ; $37
	farfunc Func_e6be ; $39
	farfunc Func_e49c ; $3b
	farfunc Func_e4fb ; $3d
	farfunc Func_ee30 ; $3f
	farfunc AIOppDrawInitialHand ; $41
	farfunc Func_e1f2 ; $43
	farfunc $5e81 ; $45
	farfunc Func_e285 ; $47
	farfunc Func_d974 ; $49
	farfunc PlayerHasAnyHandCards ; $4b
	farfunc Func_e2b2 ; $4d
	farfunc Func_eebf ; $4f
	farfunc Func_ef1d ; $51
	farfunc Func_c1bc ; $53
	farfunc Func_c1f1 ; $55
	farfunc Func_e407 ; $57
	farfunc Func_c772 ; $59
	farfunc Func_c142 ; $5b
	farfunc SetOppDuelDeckIndex ; $5d
	farfunc AddCardToOpponentDeck ; $5f
	farfunc SetPlayerDeckIndex ; $61
	farfunc AddCardToPlayerDeck ; $63
	farfunc $43e3 ; $65
	farfunc Func_fa96 ; $67
	farfunc Func_d014 ; $69
	farfunc Func_e711 ; $6b

SECTION "Bank 3@406c", ROMX[$406c], BANK[$3]

SetInitialPlayerLP:
	push af
	ld a, LOW(INITIAL_LP)
	ld [wPlayerLP + 0], a
	ld a, HIGH(INITIAL_LP)
	ld [wPlayerLP + 1], a
	ld a, $00
	ld [$cab2], a
	pop af
	ret
; 0xc07e

SECTION "Bank 3@40b9", ROMX[$40b9], BANK[$3]

SetInitialOpponentLP:
	push af
	ld a, LOW(INITIAL_LP)
	ld [wOppLP + 0], a
	ld a, HIGH(INITIAL_LP)
	ld [wOppLP + 1], a
	ld a, $00
	ld [$cab5], a
	pop af
	ret
; 0xc0cb

SECTION "Bank 3@4106", ROMX[$4106], BANK[$3]

Func_c106:
	push af
	ld a, $00
	ld [$cad1], a
	pop af
	ret
; 0xc10e

SECTION "Bank 3@4142", ROMX[$4142], BANK[$3]

Func_c142:
	call Func_c152
	call Func_c187
	call Func_c1bc
	call Func_c1f1
	call Func_c24d
	ret

Func_c152:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_12
	call SetPendingVBlankMode
	bcbgcoord 10, 16
	ld d, $00
	ld e, $05
.asm_c162
	call AddWordToVBlankStruct
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	inc d
	dec e
	jr nz, .asm_c162
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c187:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_12
	call SetPendingVBlankMode
	bcbgcoord 10, 14
	ld d, $00
	ld e, $05
.asm_c197
	call AddWordToVBlankStruct
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	inc d
	dec e
	jr nz, .asm_c197
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c1bc:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_12
	call SetPendingVBlankMode
	bcbgcoord 10, 2
	ld d, $04
	ld e, $05
.asm_c1cc
	call AddWordToVBlankStruct
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_OPP_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	dec d
	dec e
	jr nz, .asm_c1cc
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c1f1:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_12
	call SetPendingVBlankMode
	bcbgcoord 10, 0
	ld d, $04
	ld e, $05
.asm_c201
	call AddWordToVBlankStruct
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_OPP_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	dec d
	dec e
	jr nz, .asm_c201
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c226:
	push af
	cp $d0
	jr z, .asm_c23f
	call AddByteToVBlankStruct
	add $02
	call AddByteToVBlankStruct
	sub $01
	call AddByteToVBlankStruct
	add $02
	call AddByteToVBlankStruct
	jr .asm_c24b
.asm_c23f
	call AddByteToVBlankStruct
	call AddByteToVBlankStruct
	call AddByteToVBlankStruct
	call AddByteToVBlankStruct
.asm_c24b
	pop af
	ret

Func_c24d:
	push af
	ld a, VBLANK_0E
	call SetPendingVBlankMode
	call Func_d58c
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_c25e:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $428a
	call Func_10d9
	farcall Func_803e
	farcall Func_28776
	call Func_c294
	call Func_c2c9
	call Func_c316
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	call Func_2ae4
	pop hl
	pop af
	ret
; 0xc28a

SECTION "Bank 3@4294", ROMX[$4294], BANK[$3]

Func_c294:
	call ClearOAM
	call Func_c52e
	call Func_c2a1
	call Func_1225
	ret

Func_c2a1:
	push af
	push bc
	push de
	push hl
	ld de, $42b9
	ld hl, vTiles0
	ld c, $10
.asm_c2ad
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_c2ad
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xc2b9

SECTION "Bank 3@42c9", ROMX[$42c9], BANK[$3]

Func_c2c9:
	push af
	push bc
	push hl
	hlbgcoord 12, 1
	ld a, $00
	farcall Func_42d0
	ld a, [$cc56]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	farcall Func_42c5
	farcall Func_42ec
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	inc hl
	ld a, [$cc57]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	farcall Func_42c5
	farcall Func_42ec
	inc hl
	ld a, [$cabc]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_c316:
	push af
	push bc
	push de
	push hl
	call Func_c5b2
	ld a, [$cc58]
	ld [$cc51], a
	ld d, $05
	ld a, [$cc56]
	ld c, a
	ld a, [$cc57]
	cp c
	jr nz, .asm_c334
	ld a, [$cc55]
	ld d, a
	inc d
.asm_c334
	ld e, $00
.asm_c336
	ld a, e
	cp d
	jr nc, .asm_c34c
	ld a, l
	call Func_c351
	call Func_c397
	inc e
	ld a, [$cc51]
	add $01
	ld [$cc51], a
	jr .asm_c336
.asm_c34c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c351:
	push af
	push bc
	push de
	push hl
	ld d, $00
	swap e
	sla e
	sla e
	rl d
	hlbgcoord 2, 3
	add hl, de
	ld a, $00
	farcall Func_42d0
	ld a, [$cc51]
	call SetPlayerDeckIndex
	call GetPlayerDeckCard
	ld a, c
	add $01
	ld [$cadc], a
	ld a, b
	adc $00
	ld [$cadd], a
	call Func_142c
	farcall Func_42c5
	farcall Func_42ec
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c397:
	push af
	push bc
	push de
	push hl
	ld d, $00
	swap e
	sla e
	sla e
	rl d
	hlbgcoord 6, 2
	add hl, de
	ld a, [$cc51]
	call SetPlayerDeckIndex
	call GetPlayerDeckCard
	call Func_1508
	call Func_111c
	ld de, $cab9
	ld c, $08
.asm_c3bd
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_c3bd
	ld de, $18
	add hl, de
	ld de, $cab9
	ld c, $08
.asm_c3d2
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	ld [hli], a
	dec c
	jr nz, .asm_c3d2
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c3e3:
	push af
	ld a, $00
	ld [$cc52], a
	ld a, $00
	ld [$cc53], a
	ld a, $00
	ld [$cc54], a
	ld a, $04
	ld [$cc55], a
	ld a, $00
	ld [$cc56], a
	ld a, $00
	ld [$cc57], a
	call Func_c407
	pop af
	ret

Func_c407:
	push af
	push bc
	push de
	call GetPlayerDeckCardCount
	dec a
	ld d, a
	ld b, $05
	call DDividedByB
	ld a, d
	ld [$cc57], a
	ld a, e
	ld [$cc55], a
	pop de
	pop bc
	pop af
	ret
; 0xc420

SECTION "Bank 3@452e", ROMX[$452e], BANK[$3]

Func_c52e:
	push af
	push bc
	push de
	push hl
	ld a, [$cc52]
	cp $00
	jr nz, .asm_c559
	ld c, $00
	ld a, $ff
	ld d, $10
	call Func_123c
	ld c, $01
	ld a, $ff
	ld d, $10
	call Func_123c
	ld bc, $2
	ld a, [$cc53]
	call Func_c59c
	ld d, $10
	call Func_123c
.asm_c559
	ld a, [$cc52]
	cp $01
	jr nz, .asm_c597
	ld c, $00
	ld a, $ff
	ld d, $10
	call Func_123c
	ld bc, $1
	ld a, [$cc54]
	cp $02
	jr z, .asm_c57f
	add $05
	call Func_c59c
	ld d, $10
	call Func_123c
	jr .asm_c589
.asm_c57f
	ld a, $05
	call Func_c59c
	ld d, $65
	call Func_123c
.asm_c589
	ld bc, $102
	ld a, [$cc53]
	call Func_c59c
	ld d, $10
	call Func_123c
.asm_c597
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c59c:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $45a9
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0xc5a9

SECTION "Bank 3@45b2", ROMX[$45b2], BANK[$3]

Func_c5b2:
	push af
	push bc
	push de
	push hl
	ld a, [$cc56]
	ld e, a
	ld b, $05
	call BTimesE
	ld a, l
	ld [$cc58], a
	ld a, h
	ld [$cc59], a
	pop hl
	pop de
	pop bc
	pop af
	ret

ClearPlayerDeck:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [wPlayerDeckIndex], a
	ld hl, wPlayerDeck
	ld c, DECK_SIZE
.loop
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld a, HIGH(INVALID_CARD)
	ld [hli], a
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

SetPlayerDeckIndex::
	ld [wPlayerDeckIndex], a
	ret

AddCardToPlayerDeck::
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wPlayerDeckIndex]
	ld e, a
	sla e
	ld hl, wPlayerDeck
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop de
	pop bc
	pop af
	ret

GetPlayerDeckCard:
	push af
	push hl
	ld b, $00
	ld a, [wPlayerDeckIndex]
	ld c, a
	sla c
	ld hl, wPlayerDeck
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	pop af
	ret
; 0xc618

SECTION "Bank 3@4630", ROMX[$4630], BANK[$3]

Func_c630:
	push af
	push bc
	push de
	push hl
	ld a, [wPlayerDeckIndex]
	ld l, a
	ld d, $00
	ld e, $00
.asm_c63c
	ld a, e
	call SetPlayerDeckIndex
	call GetPlayerDeckCard
	ld a, e
	cp l
	jr z, .asm_c64f
	ld a, d
	call SetPlayerDeckIndex
	call AddCardToPlayerDeck
	inc d
.asm_c64f
	inc e
	ld a, e
	cp $28
	jr c, .asm_c63c
	ld a, d
	call SetPlayerDeckIndex
	ld bc, $16d
	call AddCardToPlayerDeck
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xc664

SECTION "Bank 3@468a", ROMX[$468a], BANK[$3]

; outputs in a the total number of
; cards in wPlayerDeck
GetPlayerDeckCardCount:
	push bc
	push hl
	ld hl, wPlayerDeck
	ld c, 0
.loop_cards
	ld a, [hli]
	cp LOW(INVALID_CARD)
	jr nz, .valid
	ld a, [hli]
	cp HIGH(INVALID_CARD)
	jr z, .done
	jr .next
.valid
	inc hl
.next
	inc c
	ld a, c
	cp DECK_SIZE
	jr c, .loop_cards
.done
	ld a, c
	pop hl
	pop bc
	ret

Func_c6a8:
	call GetPlayerDeckCardCount
	cp $28
	jr nz, .asm_c6b2
	xor a
	jr .asm_c6b4
.asm_c6b2
	ld a, $01
.asm_c6b4
	ret
; 0xc6b5

SECTION "Bank 3@46cf", ROMX[$46cf], BANK[$3]

SetOppDuelDeckIndex:
	ld [wOppDuelDeckIndex], a
	ret

ResetOppDuelDeckIndex:
	push af
	xor a
	ld [wOppDuelDeckIndex], a
	pop af
	ret

Func_c6da:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wOppDuelDeckIndex]
	ld c, a
	sla c
	ld hl, wOppDuelDeck
	add hl, bc
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld [hl], HIGH(INVALID_CARD)
	pop hl
	pop bc
	pop af
	ret

GetOppDuelDeckCard:
	push af
	push hl
	ld b, $00
	ld a, [wOppDuelDeckIndex]
	ld c, a
	sla c
	ld hl, wOppDuelDeck
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	pop hl
	pop af
	ret

IncrementOppDuelDeckIndex:
	push af
	ld a, [wOppDuelDeckIndex]
	cp DECK_SIZE
	jr nc, .asm_c713
	inc a
	ld [wOppDuelDeckIndex], a
.asm_c713
	pop af
	ret

; input:
; - bc = card ID
AddCardToOpponentDeck:
	push af
	push hl
	push bc
	ld b, $00
	ld a, [wOppDuelDeckIndex]
	ld c, a
	sla c
	ld hl, wOppDuelDeck
	add hl, bc
	pop bc
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop af
	ret

AIOppDrawCard:
	push af
	push bc
	ld b, a
	call Func_d833
	cp $00
	jr z, .asm_c75b
	ld a, [wOppDuelDeckIndex]
	cp DECK_SIZE
	jr nc, .asm_c75b
	ld c, CARD_LOCATION_OPP_HAND
	call SetCardLocationAndIndex
	call GetOppDuelDeckCard
	call Func_c6da
	call IncrementOppDuelDeckIndex
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_21cc
	call Func_217e
	call Func_1caa
.asm_c75b
	pop bc
	pop af
	ret

AIOppDrawInitialHand:
	push af
	push bc
	call ResetOppDuelDeckIndex
	ld b, $00
	ld c, HAND_SIZE
.loop
	ld a, b
	call AIOppDrawCard
	inc b
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret

Func_c772:
	push af
	push bc
	ld b, $00
	ld c, HAND_SIZE
.loop
	ld a, b
	call AIOppDrawCard
	inc b
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret
; 0xc783

SECTION "Bank 3@4786", ROMX[$4786], BANK[$3]

Func_c786:
	push af
	push bc
	push de
	push hl
	call Func_c7b3
	ld b, $00
	ld c, a
	ld hl, $47a5
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $479c
	push bc
	jp hl
; 0xc79c

SECTION "Bank 3@47b3", ROMX[$47b3], BANK[$3]

Func_c7b3:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_c7cc
	ld c, $08
.asm_c7c1
	dec c
	rlca
	jr nc, .asm_c7c1
	ld b, $00
	ld hl, $47e5
	add hl, bc
	ld d, [hl]
.asm_c7cc
	ld a, [wcaa7]
	and $f0
	jr z, .asm_c7e0
	ld c, $08
.asm_c7d5
	dec c
	rlca
	jr nc, .asm_c7d5
	ld b, $00
	ld hl, $47e5
	add hl, bc
	ld d, [hl]
.asm_c7e0
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0xc7e5

SECTION "Bank 03@4b87", ROMX[$4b87], BANK[$03]

Func_cb87:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $4baa
	call Func_10d9
	farcall Func_803e
	farcall Func_28b5a
	call Func_cbb4
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0xcbaa

SECTION "Bank 3@4bb4", ROMX[$4bb4], BANK[$3]

Func_cbb4:
	call ClearOAM
	call Func_cc1e
	call Func_cbc1
	call Func_1225
	ret

Func_cbc1:
	push af
	push bc
	push de
	push hl
	ld de, $4bd9
	ld hl, vTiles0
	ld c, $10
.asm_cbcd
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_cbcd
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xcbd9

SECTION "Bank 03@4be9", ROMX[$4be9], BANK[$03]

Func_cbe9:
	push af
	ld a, $00
	ld [wccfd], a
	pop af
	ret

Func_cbf1:
	ret
; 0xcbf2

SECTION "Bank 3@4bf6", ROMX[$4bf6], BANK[$3]

Func_cbf6:
	push af
	ld a, [wccfd]
	cp $02
	jr z, .asm_cc08
	ld a, [wccfd]
	inc a
	ld [wccfd], a
	call Func_2aef
.asm_cc08
	pop af
	ret

Func_cc0a:
	push af
	ld a, [wccfd]
	cp $00
	jr z, .asm_cc1c
	ld a, [wccfd]
	dec a
	ld [wccfd], a
	call Func_2aef
.asm_cc1c
	pop af
	ret

Func_cc1e:
	push af
	push bc
	push de
	push hl
	ld bc, $2
	ld a, [wccfd]
	call Func_cc35
	ld d, $20
	call Func_123c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_cc35:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $4c42
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0xcc42

SECTION "Bank 03@4c4c", ROMX[$4c4c], BANK[$03]

Func_cc4c:
	push bc
	push de
	push hl
	ld e, $00
.loop
	call Func_cc76
	ld b, $00
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	cp $01
	jr nz, .loop
	ld a, e
	pop hl
	pop de
	pop bc
	ret

.Jumptable:
	dw Func_ccb0
	dw Func_ccbd
	dw Func_cd2a
	dw Func_cd2f
	dw Func_cd42

Func_cc76:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_cc8f
	ld c, $08
.asm_cc84
	dec c
	rlca
	jr nc, .asm_cc84
	ld b, $00
	ld hl, $4ca8
	add hl, bc
	ld d, [hl]
.asm_cc8f
	ld a, [wcaa7]
	and $c0
	jr z, .asm_cca3
	ld c, $08
.asm_cc98
	dec c
	rlca
	jr nc, .asm_cc98
	ld b, $00
	ld hl, $4ca8
	add hl, bc
	ld d, [hl]
.asm_cca3
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0xcca8

SECTION "Bank 3@4cb0", ROMX[$4cb0], BANK[$3]

Func_ccb0:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_ccbd:
	push bc
	ld a, $04
	call SetPendingVBlankMode
	call Func_cbf1
	call Func_cc1e
	call RequestVBlankMode
	call WaitForVBlank
	ld a, [wccfd]
	cp $00
	jr nz, .asm_cce8
	farcall Func_56e0
	farcall Func_551f
	farcall Func_5c86
	farcall Func_104f5
	call Func_cb87
	xor a
	jr .asm_cd28
.asm_cce8
	cp $01
	jr nz, .asm_ccfe
	call Func_c3e3
	call Func_c25e
	call Func_c786
	farcall Func_104f5
	call Func_cb87
	xor a
	jr .asm_cd28
.asm_ccfe
	ld c, $01
	call Func_c6a8
	cp $00
	jr nz, .asm_cd1f
	ld a, [$ce00]
	cp $02
	jr nz, .asm_cd1d
	call Func_24f
	cp $00
	jr z, .asm_cd1d
	call Func_2afa
	farcall Func_150ad
	ld c, $00
.asm_cd1d
	jr .asm_cd27
.asm_cd1f
	call Func_2afa
	farcall Func_150bd
	ld c, $00
.asm_cd27
	ld a, c
.asm_cd28
	pop bc
	ret

Func_cd2a:
	ld e, $01
	ld a, $01
	ret

Func_cd2f:
	ld a, $04
	call SetPendingVBlankMode
	call Func_cc0a
	call Func_cc1e
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_cd42:
	ld a, $04
	call SetPendingVBlankMode
	call Func_cbf6
	call Func_cc1e
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_cd55:
	push af
	ld a, $00
	ld [wcd5e], a
	ld a, CARD_LOCATION_PLAYER_HAND
	ld [wcd5f], a
	ld a, $00
	ld [$cd60], a
	ld a, $02
	ld [$cd61], a
	call Func_cd72
	call Func_cefb
	pop af
	ret

Func_cd72:
	push af
	ld a, $00
	ld [$cd5c], a
	pop af
	ret
; 0xcd7a

SECTION "Bank 3@4d82", ROMX[$4d82], BANK[$3]

Func_cd82:
	push af
	ld a, $02
	ld [$cd5c], a
	pop af
	ret

Func_cd8a:
	push af
	ld a, $03
	ld [$cd5c], a
	pop af
	ret

Func_cd92:
	push af
	ld a, $04
	ld [$cd5c], a
	pop af
	ret

Func_cd9a:
	push af
	push bc
	ld a, [wcd5e]
	ld b, a
	ld a, [wcd5f]
	ld c, a
	call Func_cfe1
	call SetCardLocationAndIndex
	call Func_1c92
	farcall Func_24024
	pop bc
	pop af
	ret

SECTION "Bank 3@4db3", ROMX[$4db3], BANK[$3]

Func_cdb3:
	push bc
	ld b, $01
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_cdc2
	call Func_cff6
	jr .asm_cdd5
.asm_cdc2
	ld a, [wcd5e]
	cp $04
	jr z, .asm_cdd2
	inc a
	ld [wcd5e], a
	ld b, $00
	call Func_2b47
.asm_cdd2
	call Func_cd9a
.asm_cdd5
	ld a, b
	pop bc
	ret

Func_cdd8:
	push bc
	ld b, $01
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_cde7
	call Func_cff6
	jr .asm_cdfa
.asm_cde7
	ld a, [wcd5e]
	cp $00
	jr z, .asm_cdf7
	dec a
	ld [wcd5e], a
	ld b, $00
	call Func_2b47
.asm_cdf7
	call Func_cd9a
.asm_cdfa
	ld a, b
	pop bc
	ret

Func_cdfd:
	push bc
	ld b, $01
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_ce0c
	call Func_cff6
	jr .asm_ce1f
.asm_ce0c
	ld a, [wcd5f]
	cp $03
	jr z, .asm_ce1c
	inc a
	ld [wcd5f], a
	ld b, $00
	call Func_2b47
.asm_ce1c
	call Func_cd9a
.asm_ce1f
	ld a, b
	pop bc
	ret

Func_ce22:
	push bc
	ld b, $01
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_ce31
	call Func_cff6
	jr .asm_ce44
.asm_ce31
	ld a, [wcd5f]
	cp $00
	jr z, .asm_ce41
	dec a
	ld [wcd5f], a
	ld b, $00
	call Func_2b47
.asm_ce41
	call Func_cd9a
.asm_ce44
	ld a, b
	pop bc
	ret

Func_ce47:
	push af
	push bc
	ld a, [$cd62]
	cp $01
	jr nz, .asm_ce66
	ld a, $00
	ld [wcd5e], a
	ld a, $03
	ld [wcd5f], a
	ld a, $00
	ld [$cd60], a
	ld a, $03
	ld [$cd61], a
	jr .asm_ced0
.asm_ce66
	ld a, [$cd5c]
	cp $00
	jr nz, .asm_ce77
	ld a, $02
	ld [wcd5e], a
	ld a, $03
	ld [wcd5f], a
.asm_ce77
	ld a, [$cd5c]
	cp $01
	jr nz, .asm_ce95
	ld a, [wcd5e]
	ld [$cd60], a
	ld a, [wcd5f]
	ld [$cd61], a
	call Func_da8f
	ld [wcd5e], a
	ld a, $02
	ld [wcd5f], a
.asm_ce95
	ld a, [$cd5c]
	cp $02
	jr nz, .asm_ceac
	call Func_dabc
	cp $00
	jr nz, .asm_cea7
	ld a, b
	ld [wcd5e], a
.asm_cea7
	ld a, $02
	ld [wcd5f], a
.asm_ceac
	ld a, [$cd5c]
	cp $04
	jr nz, .asm_ced0
	ld a, [wcd5e]
	ld [$cd60], a
	ld a, [wcd5f]
	ld [$cd61], a
	ld c, $01
	call Func_daf3
	ld b, a
	call Func_cfe1
	ld a, b
	ld [wcd5e], a
	ld a, c
	ld [wcd5f], a
.asm_ced0
	pop bc
	pop af
	ret

Func_ced3:
	push af
	ld a, [$cd5c]
	cp $01
	jr nz, .asm_cee9
	ld a, [$cd60]
	ld [wcd5e], a
	ld a, [$cd61]
	ld [wcd5f], a
	jr .asm_cef9
.asm_cee9
	cp $04
	jr nz, .asm_cef9
	ld a, [$cd60]
	ld [wcd5e], a
	ld a, [$cd61]
	ld [wcd5f], a
.asm_cef9
	pop af
	ret

Func_cefb:
	push af
	ld a, [$cd5c]
	cp $00
	jr nz, .asm_cf09
	call Func_cf93
	call Func_cf45
.asm_cf09
	ld a, [$cd5c]
	cp $01
	jr nz, .asm_cf19
	call Func_cf93
	call Func_cf45
	call Func_cf5e
.asm_cf19
	ld a, [$cd5c]
	cp $02
	jr nz, .asm_cf26
	call Func_cf93
	call Func_cf45
.asm_cf26
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_cf33
	call Func_cf93
	call Func_cf77
.asm_cf33
	ld a, [$cd5c]
	cp $04
	jr nz, .asm_cf43
	call Func_cf93
	call Func_cf45
	call Func_cf5e
.asm_cf43
	pop af
	ret

Func_cf45:
	push af
	push bc
	push de
	ld a, [wcd5e]
	ld b, a
	ld a, [wcd5f]
	ld c, a
	call Func_cfbe
	ld d, $50
	ld e, $00
	call Func_12d9
	pop de
	pop bc
	pop af
	ret

Func_cf5e:
	push af
	push bc
	push de
	ld a, [$cd60]
	ld b, a
	ld a, [$cd61]
	ld c, a
	call Func_cfbe
	ld d, $54
	ld e, $08
	call Func_12d9
	pop de
	pop bc
	pop af
	ret

Func_cf77:
	push af
	push bc
	push de
	ld bc, $580a
	ld d, $77
	call Func_d8ee
	cp $02
	jr nz, .asm_cf8a
	ld a, $7e
	jr .asm_cf8c
.asm_cf8a
	ld a, $8e
.asm_cf8c
	call Func_123c
	pop de
	pop bc
	pop af
	ret

Func_cf93:
	push af
	push bc
	push de
	ld a, $ff
	ld b, a
	ld a, $ff
	ld c, a
	ld d, $50
	ld e, $00
	call Func_12d9
	ld a, $ff
	ld b, a
	ld a, $ff
	ld c, a
	ld d, $54
	ld e, $08
	call Func_12d9
	ld bc, $580a
	ld d, $ff
	ld a, $ff
	call Func_123c
	pop de
	pop bc
	pop af
	ret

Func_cfbe:
	push af
	push de
	push hl
	push bc
	ld a, b
	ld c, a
	ld b, $00
	ld hl, $4fdc
	add hl, bc
	ld e, [hl]
	pop bc
	ld b, $00
	ld hl, $4fd8
	add hl, bc
	ld c, [hl]
	ld b, e
	pop hl
	pop de
	pop af
	ret

SECTION "Bank 3@4fe1", ROMX[$4fe1], BANK[$3]

Func_cfe1:
	push af
	ld a, c
	cp CARD_LOCATION_OPP_HAND
	jr nz, .asm_cfeb
	ld a, HAND_SIZE - 1
	sub b
	ld b, a
.asm_cfeb
	ld a, c
	cp CARD_LOCATION_OPP_FIELD
	jr nz, .asm_cff4
	ld a, FIELD_SIZE - 1
	sub b
	ld b, a
.asm_cff4
	pop af
	ret

Func_cff6:
	push af
	call Func_2bca
	cp $00
	jr nz, .asm_d00f
	call Func_2b3c
	call Func_d900
	call Func_cefb
	call Func_c187
	call Func_f86
	jr .asm_d012
.asm_d00f
	call Func_2afa
.asm_d012
	pop af
	ret

Func_d014:
	push af
	push bc
	push de
	push hl
	xor a
	ld [$cd62], a

	farcall HandleExodiaWinCondition
	call IsDuelOngoing
	cp FALSE
	jr z, .asm_d059

	farcall HandleEmptyHandWinCondition
	call IsDuelOngoing
	cp FALSE
	jr z, .asm_d059

	farcall Func_1500c
	call Func_d06c
.asm_d036
	call Func_d095
	ld b, $00
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	call IsDuelOngoing
	cp FALSE
	jr z, .asm_d056
	ld a, [$cd62]
	cp $01
	jr nz, .asm_d036
.asm_d056
	call Func_d085
.asm_d059
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_d0cf
	dw Func_d0dc
	dw Func_d0f0
	dw Func_d100
	dw Func_d110
	dw Func_d120
	dw Func_d130

Func_d06c:
	call HandlePlayerPetitMothEvolution
	call Func_2c31
	call Func_da60
	call Func_cd55
	call Func_c142
	call Func_cd9a
	call Func_d3ec
	call EnableObjects
	ret

Func_d085:
	call Func_2ba9
	call Func_2bf0
	call Func_cd55
	call Func_d953
	call Func_d213
	ret

Func_d095:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and PAD_A | PAD_B | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	jr z, .asm_d0ae
	ld c, $08
.asm_d0a3
	dec c
	rlca
	jr nc, .asm_d0a3
	ld b, $00
	ld hl, $50c7
	add hl, bc
	ld d, [hl]
.asm_d0ae
	ld a, [wJoypadDown]
	and PAD_CTRL_PAD
	jr z, .asm_d0c2
	ld c, $08
.asm_d0b7
	dec c
	rlca
	jr nc, .asm_d0b7
	ld b, $00
	ld hl, $50c7
	add hl, bc
	ld d, [hl]
.asm_d0c2
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0xd0c7

SECTION "Bank 3@50cf", ROMX[$50cf], BANK[$3]

Func_d0cf:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_d0dc:
	push bc
	push hl
	call Func_d2b8
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	pop hl
	pop bc
	ret

Func_d0f0:
	call Func_d2e9
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_d100:
	call Func_d3bf
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_d110:
	call Func_d3b0
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_d120:
	call Func_d3ce
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_d130:
	call Func_d3dd
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

ClearPlayerDuelDeck:
	push af
	push bc
	push hl
	ld a, $00
	ld [wPlayerDuelDeckIndex], a
	ld hl, wPlayerDuelDeck
	ld c, DECK_SIZE
.asm_d14d
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld a, HIGH(INVALID_CARD)
	ld [hli], a
	dec c
	jr nz, .asm_d14d
	pop hl
	pop bc
	pop af
	ret

SetPlayerDuelDeckIndex:
	ld [wPlayerDuelDeckIndex], a
	ret

ResetPlayerDuelDeckIndex:
	push af
	xor a
	ld [wPlayerDuelDeckIndex], a
	pop af
	ret

Func_d165:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wPlayerDuelDeckIndex]
	ld c, a
	sla c
	ld hl, wPlayerDuelDeck
	add hl, bc
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld [hl], HIGH(INVALID_CARD)
	pop hl
	pop bc
	pop af
	ret

GetPlayerDuelDeckCard:
	push af
	push hl
	ld b, $00
	ld a, [wPlayerDuelDeckIndex]
	ld c, a
	sla c
	ld hl, wPlayerDuelDeck
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop hl
	pop af
	ret

IncrementPlayerDuelDeckIndex:
	push af
	ld a, [wPlayerDuelDeckIndex]
	cp DECK_SIZE
	jr nc, .asm_d19d
	inc a
	ld [wPlayerDuelDeckIndex], a
.asm_d19d
	pop af
	ret

AddCardToPlayerDuelDeck:
	push af
	push hl
	push bc
	ld b, $00
	ld a, [wPlayerDuelDeckIndex]
	ld c, a
	sla c
	ld hl, wPlayerDuelDeck
	add hl, bc
	pop bc
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop af
	ret
; 0xd1b5

SECTION "Bank 3@51cc", ROMX[$51cc], BANK[$3]

PlayerDrawCard:
	push af
	push bc
	ld b, a
	call Func_d813
	cp $00
	jr z, .asm_d1fc
	ld a, [wPlayerDuelDeckIndex]
	cp DECK_SIZE
	jr nc, .asm_d1fc
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetCardLocationAndIndex
	call GetPlayerDuelDeckCard
	call Func_d165
	call IncrementPlayerDuelDeckIndex
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_21cc
	call Func_217e
	call Func_1caa
.asm_d1fc
	pop bc
	pop af
	ret

PlayerDrawInitialHand:
	push af
	push bc
	call ResetPlayerDuelDeckIndex
	ld b, $00
	ld c, HAND_SIZE
.loop
	ld a, b
	call PlayerDrawCard
	inc b
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret

Func_d213:
	push af
	push bc
	ld b, $00
	ld c, HAND_SIZE
.loop
	ld a, b
	call PlayerDrawCard
	inc b
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret

SetupDuel:
	call Func_2384
	farcall Func_b85d
	call Func_1c28
	call SetInitialPlayerLP
	call SetInitialOpponentLP
	call CreatePlayerDuelDeck
	farcall ChoosePlayerAnteCard
	call PlayerDrawInitialHand
	call Func_c106
	call Func_2b94
	call Func_2bde
	call Func_cd55
	ret

Func_d249:
	push af
	call Func_1f5f
	call SetupDuel
	call Func_cd55
	call Func_12d2
	call Func_db96
	cp $00
	jr nz, .asm_d262
	call Func_d267
	jr .asm_d265
.asm_d262
	farcall Func_150ad
.asm_d265
	pop af
	ret

Func_d267:
	call Func_29fd
	farcall Func_4068
	call Func_2a13
.asm_d270
	ld a, [$cdff]
	cp $01
	jr nz, .asm_d290
	call Func_d014
	call IsDuelOngoing
	cp FALSE
	jr nz, .asm_d28b
	call Func_2391
	call Func_db63
	jr .asm_d2a8
	jr .asm_d28e
.asm_d28b
	farcall Func_1509a
.asm_d28e
	jr .asm_d293
.asm_d290
	farcall Func_15032
.asm_d293
	call Func_2391
	call Func_db63
	call IsDuelOngoing
	cp FALSE
	jr z, .asm_d2a8
	call Func_1f81
	call Func_c142
	jr .asm_d270
.asm_d2a8
	call Func_2938
	farcall Func_36e34
	farcall Func_11196
	farcall Func_104f5
	farcall Func_b57d
	ret

Func_d2b8:
	push af
	ld a, [$cd5c]
	cp $00
	jr nz, .asm_d2c5
	call Func_d6ae
	jr .asm_d2e7
.asm_d2c5
	cp $01
	jr nz, .asm_d2ce
	call Func_d6c1
	jr .asm_d2e7
.asm_d2ce
	cp $02
	jr nz, .asm_d2d7
	call Func_d707
	jr .asm_d2e7
.asm_d2d7
	cp $03
	jr nz, .asm_d2e0
	call Func_d733
	jr .asm_d2e7
.asm_d2e0
	cp $04
	jr nz, .asm_d2e7
	call Func_d7cd
.asm_d2e7
	pop af
	ret

Func_d2e9:
	push af
	ld a, [$cd5c]
	cp $00
	jr nz, .asm_d309
	call Func_d366
	cp $00
	jr nz, .asm_d307
	farcall $03, $05
	farcall $05, $05
	farcall $03, $01
	call Func_d3ec
	call EnableObjects
.asm_d307
	jr .asm_d364
.asm_d309
	cp $01
	jr nz, .asm_d318
	call Func_2b31
	call Func_ced3
	call Func_f0f7
	jr .asm_d364
.asm_d318
	cp $02
	jr nz, .asm_d342
	call Func_cd9a
	ld a, [wLoadedCardID]
	ld c, a
	ld a, [$cd10]
	ld b, a
	call IsValidCard
	call Func_d366
	cp $00
	jr nz, .asm_d340
	farcall $03, $05
	farcall $05, $05
	farcall $03, $01
	call Func_d3ec
	call EnableObjects
.asm_d340
	jr .asm_d364
.asm_d342
	cp $03
	jr nz, .asm_d354
	call Func_2b31
	call Func_ced3
	call Func_f104
	farcall $15, $04
	jr .asm_d364
.asm_d354
	cp $04
	jr nz, .asm_d364
	call Func_2b31
	call Func_ced3
	call Func_f10b
	farcall $15, $04
.asm_d364
	pop af
	ret

Func_d366:
	push bc
	push de
	call Func_cd9a
	ld a, [wLoadedCardID]
	ld c, a
	ld a, [$cd10]
	ld b, a
	call IsValidCard
	cp $00
	jr z, .asm_d37e
	ld a, $01
	jr .asm_d3ad
.asm_d37e
	ld e, $01
	ld a, [$cd12]
	ld c, a
	ld a, [$cd11]
	ld b, a
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, c
	cp $01
	jr nz, .asm_d39e
	call Func_21f9
	cp $01
	jr nz, .asm_d39c
	ld e, $00
.asm_d39c
	jr .asm_d3ac
.asm_d39e
	cp $02
	jr nz, .asm_d3a6
	ld e, $00
	jr .asm_d3ac
.asm_d3a6
	cp $03
	jr nz, .asm_d3ac
	ld e, $00
.asm_d3ac
	ld a, e
.asm_d3ad
	pop de
	pop bc
	ret

Func_d3b0:
	push af
	push bc
	call Func_cdb3
	cp $00
	jr nz, .asm_d3bc
	call Func_d3ec
.asm_d3bc
	pop bc
	pop af
	ret

Func_d3bf:
	push af
	push bc
	call Func_cdd8
	cp $00
	jr nz, .asm_d3cb
	call Func_d3ec
.asm_d3cb
	pop bc
	pop af
	ret

Func_d3ce:
	push af
	push bc
	call Func_ce22
	cp $00
	jr nz, .asm_d3da
	call Func_d3ec
.asm_d3da
	pop bc
	pop af
	ret

Func_d3dd:
	push af
	push bc
	call Func_cdfd
	cp $00
	jr nz, .asm_d3e9
	call Func_d3ec
.asm_d3e9
	pop bc
	pop af
	ret

Func_d3ec:
	push af
	push bc
	call Func_d447
	cp $00
	jr z, .asm_d3fc
	ld b, HIGH(INVALID_CARD)
	ld c, LOW(INVALID_CARD)
	farcall LoadCardData
.asm_d3fc
	call Func_cefb
	ld a, VBLANK_0A
	call SetPendingVBlankMode
	farcall Func_6022
	call RequestVBlankMode
	call WaitForVBlank
	ld a, VBLANK_0E
	call SetPendingVBlankMode
	call Func_d47b
	call RequestVBlankMode
	call WaitForVBlank
	call Func_1c0a
	farcall LoadCardGfx
	ld bc, $6030
	call Func_1c1d
	ld bc, NULL
	call Func_1c12
	farcall Func_5ffb
	call RequestVBlankMode
	call WaitForVBlank
	ld a, VBLANK_0A
	call SetPendingVBlankMode
	farcall Func_5ffb
	call RequestVBlankMode
	call WaitForVBlank
	pop bc
	pop af
	ret

Func_d447:
	push bc
	push de
	ld e, $01
	ld a, [$cd12]
	ld c, a
	ld a, [$cd11]
	ld b, a
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, c
	cp $01
	jr nz, .asm_d469
	call Func_21f9
	cp $01
	jr nz, .asm_d467
	ld e, $00
.asm_d467
	jr .asm_d477
.asm_d469
	cp $02
	jr nz, .asm_d471
	ld e, $00
	jr .asm_d477
.asm_d471
	cp $03
	jr nz, .asm_d477
	ld e, $00
.asm_d477
	ld a, e
	pop de
	pop bc
	ret

Func_d47b:
	call Func_d48e
	call Func_d4d7
	call Func_d50e
	call PrintDuelistsLP
	call Func_d58c
	call Func_d5db
	ret

Func_d48e:
	push af
	push bc
	push de
	push hl
	call Func_1114
	ld a, [wLoadedCardID + 0]
	ld c, a
	ld a, [wLoadedCardID + 1]
	ld b, a
	call Func_1508
	bcbgcoord 1, 6
	call AddWordToVBlankStruct
	ld de, $cab9
	ld c, $08
.asm_d4ab
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d4ab
	bcbgcoord 1, 7
	call AddWordToVBlankStruct
	ld de, $cab9
	ld c, $08
.asm_d4c4
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d4c4
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d4d7:
	push af
	push bc
	push de
	push hl
	ld a, $00
	farcall Func_42d0
	ld a, [wLoadedCardAtk + 0]
	ld c, a
	ld a, [wLoadedCardAtk + 1]
	ld b, a
	farcall Func_42c5
	farcall Func_42ec
	ld a, b
	cp $ff
	jr nz, .asm_d4f6
	farcall Func_5313
.asm_d4f6
	bcbgcoord 5, 8
	call AddWordToVBlankStruct
	ld de, $cab9
	ld c, $04
.asm_d501
	ld a, [de]
	inc de
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d501
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d50e:
	push af
	push bc
	push de
	push hl
	ld a, $00
	farcall Func_42d0
	ld a, [wLoadedCardDef + 0]
	ld c, a
	ld a, [wLoadedCardDef + 1]
	ld b, a
	farcall Func_42c5
	farcall Func_42ec
	ld a, b
	cp $ff
	jr nz, .asm_d52d
	farcall Func_5313
.asm_d52d
	bcbgcoord 5, 9
	call AddWordToVBlankStruct
	ld de, $cab9
	ld c, $04
.asm_d538
	ld a, [de]
	inc de
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d538
	pop hl
	pop de
	pop bc
	pop af
	ret

PrintDuelistsLP:
	push af
	push bc
	push hl
	ld a, [wPlayerLP + 0]
	ld c, a
	ld a, [wPlayerLP + 1]
	ld b, a
	farcall Func_42c5
	farcall Func_42ec
	bcbgcoord 5, 16
	call AddWordToVBlankStruct
	ld hl, $cab9
	ld c, $04
.asm_d561
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d561
	ld a, [wOppLP + 0]
	ld c, a
	ld a, [wOppLP + 1]
	ld b, a
	farcall Func_42c5
	farcall Func_42ec
	bcbgcoord 5, 1
	call AddWordToVBlankStruct
	ld hl, $cab9
	ld c, $04
.asm_d581
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d581
	pop hl
	pop bc
	pop af
	ret

Func_d58c:
	push af
	push bc
	push de
	push hl
	call Func_1114
	ld b, $00
	ld a, [$cad1]
	ld c, a
	farcall Func_42c5
	ld a, $02
	farcall Func_42d0
	farcall Func_42ec
	bcbgcoord 1, 3
	call AddWordToVBlankStruct
	ld de, $cab9
	ld c, $08
.asm_d5af
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d5af
	bcbgcoord 1, 4
	call AddWordToVBlankStruct
	ld de, $cab9
	ld c, $08
.asm_d5c8
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d5c8
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d5db:
	push af
	push bc
	push de
	push hl
	bcbgcoord 1, 11
	call AddWordToVBlankStruct
	ld a, [wLoadedCardID + 0]
	ld c, a
	ld a, [wLoadedCardID + 1]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_d60e
	call Func_218b
	ld b, $00
	ld c, a
	sla c
	ld hl, $561f
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $08
.asm_d605
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d605
	jr .asm_d61a
.asm_d60e
	ld hl, $5647
	ld c, $08
.asm_d613
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_d613
.asm_d61a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xd61f

SECTION "Bank 3@564f", ROMX[$564f], BANK[$3]

Func_d64f:
	push de
	ld e, $01
	ld a, [wcd5f]
	cp $03
	jr nz, .asm_d665
	ld a, [wcd5e]
	call Func_d813
	cp $00
	jr nz, .asm_d665
	ld e, $00
.asm_d665
	ld a, e
	pop de
	ret

Func_d668:
	push de
	ld e, $01
	ld a, [wcd5f]
	cp $02
	jr nz, .asm_d674
	ld e, $00
.asm_d674
	ld a, e
	pop de
	ret

Func_d677:
	push de
	ld e, $01
	ld a, [wcd5f]
	cp $02
	jr nz, .asm_d68a
	call Func_d880
	cp $00
	jr nz, .asm_d68a
	ld e, $00
.asm_d68a
	ld a, e
	pop de
	ret

Func_d68d:
	push bc
	push de
	ld e, $01
	ld a, [wcd5f]
	cp $01
	jr nz, .asm_d6aa
	ld a, [wcd5e]
	ld b, a
	ld c, $01
	call Func_cfe1
	call Func_d8cf
	cp $00
	jr nz, .asm_d6aa
	ld e, $00
.asm_d6aa
	ld a, e
	pop de
	pop bc
	ret

Func_d6ae:
	push af
	call Func_d64f
	cp $00
	jr nz, .asm_d6bf
	farcall ClearFusionCards
	call Func_ef49
	call Func_f118
.asm_d6bf
	pop af
	ret

Func_d6c1:
	push af
	call Func_d668
	cp $00
	jr nz, .asm_d6d2
	call Func_ef64
	call Func_f125
	call Func_d804
.asm_d6d2
	pop af
	ret

Func_d6d4:
	push af
	push bc
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall SetMaterial1Card
	ld a, [$cd60]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall SetMaterial2Card
	pop bc
	pop af
	ret

Func_d707:
	push af
	call Func_d677
	cp $00
	jr nz, .asm_d71d
	call Func_2b68
	call Func_d71f
	call Func_f138
	ld a, $00
	farcall Func_10741
.asm_d71d
	pop af
	ret

Func_d71f:
	push af
	push bc
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_21d9
	call Func_1c7a
	pop bc
	pop af
	ret

Func_d733:
	push af
	push bc
	call Func_2217
	call Func_e1f2
	call Func_cefb
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21f3
	cp $02
	jr nz, .asm_d759
	call Func_2b68
	call Func_d777
	jr .asm_d771
.asm_d759
	call Func_2b68
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21a9
	call Func_1c7a
	call Func_f15c
.asm_d771
	call Func_d804
	pop bc
	pop af
	ret

Func_d777:
	push af
	push bc
	call Func_2c0c
	cp $00
	jr nz, .asm_d79a
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21a9
	call Func_da4a
	call Func_1c7a
	call Func_f16f
	jr .asm_d7ca
.asm_d79a
	ld a, [wcd5e]
	ld b, a
	ld c, $02
	call Func_e200
	call Func_d8b3
	cp $00
	jr nz, .asm_d7af
	call Func_f13f
	jr .asm_d7ca
.asm_d7af
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21a9
	call Func_da4a
	call Func_1c7a
	call Func_f152
	call Func_e2f8
.asm_d7ca
	pop bc
	pop af
	ret

Func_d7cd:
	push af
	call Func_d68d
	cp $00
	jr nz, .asm_d802
	farcall Func_108f0
	ld a, [wcd5e]
	ld b, a
	ld c, $01
	call Func_e228
	ld a, [$cd60]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21a9
	call Func_da4a
	call Func_1c7a
	call Func_f182
	call Func_2b68
	call Func_e2f8
	call Func_d804
.asm_d802
	pop af
	ret

Func_d804:
	push af
	call Func_d921
	cp $00
	jr z, .asm_d811
	ld a, $01
	ld [$cd62], a
.asm_d811
	pop af
	ret

Func_d813:
	push bc
	ld b, a
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	ld c, $01
	cp TRUE
	jr nz, .asm_d830
	ld c, $00
.asm_d830
	ld a, c
	pop bc
	ret

Func_d833:
	push bc
	ld b, a
	ld c, CARD_LOCATION_OPP_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	ld c, $01
	cp TRUE
	jr nz, .asm_d850
	ld c, $00
.asm_d850
	ld a, c
	pop bc
	ret

; returns TRUE if player has any cards in hand
PlayerHasAnyHandCards:
	push bc
	push de
	ld b, 0
	ld e, FALSE
.loop_hand
	ld a, b
	cp HAND_SIZE
	jr nc, .done
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .false
	ld e, TRUE
.false
	inc b
	jr .loop_hand
.done
	ld a, e
	pop de
	pop bc
	ret

SECTION "Bank 3@5880", ROMX[$5880], BANK[$3]

Func_d880:
	push bc
	push de
	push hl
	ld e, $01
	ld a, [wcd5f]
	cp $02
	jr nz, .asm_d8aa
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_2203
	cp $00
	jr nz, .asm_d8aa
	call Func_21f3
	ld b, $00
	ld c, a
	ld hl, $58af
	add hl, bc
	ld e, [hl]
.asm_d8aa
	ld a, e
	pop hl
	pop de
	pop bc
	ret
; 0xd8af

SECTION "Bank 3@58b3", ROMX[$58b3], BANK[$3]

Func_d8b3:
	push bc
	push de
	ld e, $01
	ld d, $00
.asm_d8b9
	ld b, d
	ld c, $01
	call Func_d8cf
	cp $00
	jr nz, .asm_d8c5
	ld e, $00
.asm_d8c5
	inc d
	ld a, d
	cp $05
	jr nz, .asm_d8b9
	ld a, e
	pop de
	pop bc
	ret

Func_d8cf:
	push bc
	push de
	ld e, CARD_LOCATION_OPP_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_d8ea
	ld e, $00
.asm_d8ea
	ld a, e
	pop de
	pop bc
	ret

Func_d8ee:
	push bc
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21f3
	pop bc
	ret

Func_d900:
	push af
	push bc
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_d91e
	call Func_d8ee
	cp $02
	jr nz, .asm_d918
	call Func_21e6
	call Func_1c7a
	jr .asm_d91e
.asm_d918
	call Func_21d9
	call Func_1c7a
.asm_d91e
	pop bc
	pop af
	ret

Func_d921:
	push bc
	push de
	ld b, $00
	ld e, $01
.asm_d927
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_d948
	call Func_2203
	cp $00
	jr nz, .asm_d948
	ld e, $00
.asm_d948
	pop bc
	inc b
	ld a, b
	cp $05
	jr nz, .asm_d927
	ld a, e
	pop de
	pop bc
	ret

Func_d953:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld c, CARD_LOCATION_PLAYER_FIELD
	ld d, $00
.asm_d95d
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21b4
	call Func_1c7a
	inc b
	ld a, b
	cp $05
	jr c, .asm_d95d
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d974:
	push de
	push hl
	add sp, $fb
	ld a, $02
	ld [$cf01], a
	ld hl, sp+$00
	ld a, $00
	ld [hli], a
	ld [hl], $00
	ld hl, sp+$02
	ld [hl], $02
	ld hl, sp+$04
	ld [hl], $00
	call Func_dabc
	cp $00
	jr nz, .asm_d994
	ld [hl], b
.asm_d994
	ld c, $02
	ld b, $00
.asm_d998
	ld a, b
	cp $05
	jr nc, .asm_d9c1
	ld hl, sp+$03
	ld [hl], b
	push bc
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_d9bd
	ld hl, sp+$02
	ld d, h
	ld e, l
	call Func_d9ce
.asm_d9bd
	pop bc
	inc b
	jr .asm_d998
.asm_d9c1
	ld hl, sp+$04
	ld b, [hl]
	ld c, $02
	ld hl, sp+$02
	ld a, [hl]
	add sp, $05
	pop hl
	pop de
	ret

Func_d9ce:
	push af
	push bc
	push hl
	call Func_da29
	push de
	ld h, d
	ld l, e
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call CompareBCAndDE
	pop de
	cp $02
	jr z, .asm_da25
	ld hl, $2
	add hl, de
	ld a, [hl]
	cp $02
	jr nz, .asm_d9ed
	ld [hl], $01
.asm_d9ed
	push de
	push bc
	ld a, $01
	ld c, a
	ld a, [$cef7]
	ld b, a
	call SetCardLocationAndIndex
	call Func_1c92
	farcall Func_24024
	pop bc
	ld a, [wLoadedCardAtk + 0]
	ld e, a
	ld a, [wLoadedCardAtk + 1]
	ld d, a
	call CompareBCAndDE
	pop de
	cp $02
	jr nz, .asm_da25
	ld h, d
	ld l, e
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, $3
	add hl, de
	ld a, [hl]
	ld hl, $4
	add hl, de
	ld [hl], a
	ld hl, $2
	add hl, de
	ld [hl], $00
.asm_da25
	pop hl
	pop bc
	pop af
	ret

Func_da29:
	push af
	push hl
	farcall Func_24024
	call Func_21f3
	cp $02
	jr nz, .asm_da3f
	ld a, [wLoadedCardAtk + 0]
	ld c, a
	ld a, [wLoadedCardAtk + 1]
	ld b, a
	jr .asm_da47
.asm_da3f
	ld a, [wLoadedCardDef + 0]
	ld c, a
	ld a, [wLoadedCardDef + 1]
	ld b, a
.asm_da47
	pop hl
	pop af
	ret

Func_da4a:
	push af
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall Func_5af2
	farcall SetCardAsSeen
	call Func_2193
	pop bc
	pop af
	ret

Func_da60:
	push af
	push bc
	push hl
	lb bc, 0, CARD_LOCATION_OPP_FIELD
.loop_field
	ld a, b
	cp FIELD_SIZE
	jr nc, .done
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21f3
	cp $02
	jr nz, .next
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall Func_5af2
	farcall SetCardAsSeen
	pop bc
.next
	inc b
	jr .loop_field
.done
	pop hl
	pop bc
	pop af
	ret

Func_da8f:
	push bc
	push hl
	ld bc, $2
.asm_da94
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .asm_dab1
	inc b
	ld a, b
	cp $05
	jr c, .asm_da94
.asm_dab1
	ld a, b
	cp $05
	jr nz, .asm_dab8
	ld b, $00
.asm_dab8
	ld a, b
	pop hl
	pop bc
	ret

Func_dabc:
	push hl
	ld b, $00
	ld c, $02
.asm_dac1
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .asm_dadf
	call Func_2203
	cp $00
	jr z, .asm_dae5
.asm_dadf
	inc b
	ld a, b
	cp $05
	jr nz, .asm_dac1
.asm_dae5
	ld a, b
	cp $05
	jr nz, .asm_daf0
	ld b, $00
	ld a, $01
	jr .asm_daf1
.asm_daf0
	xor a
.asm_daf1
	pop hl
	ret

Func_daf3:
	push bc
	push hl
	ld b, $04
	ld c, $01
.asm_daf9
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr z, .asm_db16
	dec b
	ld a, b
	cp $ff
	jr nz, .asm_daf9
.asm_db16
	ld a, b
	cp $ff
	jr nz, .asm_db1d
	ld b, $04
.asm_db1d
	ld a, b
	pop hl
	pop bc
	ret
; 0xdb21

SECTION "Bank 3@5b63", ROMX[$5b63], BANK[$3]

Func_db63:
	push af
	ld a, [$cdff]
	cp $01
	jr nz, .asm_db7d
	ld a, $02
	ld [$cdfd], a
	ld a, $00
	ld [$cdfe], a
	call Func_dbf9
	call Func_1e70
	jr .asm_db91
.asm_db7d
	ld a, $04
	ld [$cdfd], a
	ld a, $00
	ld [$cdfe], a
	call Func_1e70
	call Func_dc5b
	cp $00
	jr nz, .asm_db7d
.asm_db91
	call Func_dbe7
	pop af
	ret

Func_db96:
	ld a, $01
	ld [$cdfd], a
	ld a, $00
	ld [$cdfe], a
	ld a, [$cdff]
	cp $01
	jr nz, .asm_dbbb
	call Func_dc14
	call Func_1e70
	call Func_318
	call Func_1e70
	call Func_dc9e
	call Func_305
	jr .asm_dbcd
.asm_dbbb
	call Func_1e70
	call Func_dc9e
	call Func_305
	call Func_dc14
	call Func_1e70
	call Func_318
.asm_dbcd
	call Func_dbe7
	ret

Func_dbd1:
	push af
	ld a, $04
	ld [$cdfd], a
	ld a, $00
	ld [$cdfe], a
	call Func_dc25
	call Func_1e70
	call Func_dbe7
	pop af
	ret

Func_dbe7:
	push bc
	ld a, [$cdfe]
	ld c, a
	ld a, [$cdfd]
	cp c
	jr nz, .asm_dbf5
	xor a
	jr .asm_dbf7
.asm_dbf5
	ld a, $01
.asm_dbf7
	pop bc
	ret

Func_dbf9:
	push af
	call Func_1fe6
	call Func_dda8
	ld a, $03
	call Func_dc2f
	ld a, $02
	call Func_dc2f
	ld a, $01
	call Func_dc2f
	call Func_dcdc
	pop af
	ret

Func_dc14:
	push af
	call Func_1fe6
	call Func_dda8
	call Func_dd5a
	ld a, $03
	call Func_dc2f
	pop af
	ret

Func_dc25:
	call Func_1fe6
	call Func_dda8
	call Func_ddbb
	ret

Func_dc2f:
	push af
	push bc
	push de
	ld e, a
	ld d, $00
	ld c, $05
.asm_dc37
	push bc
	ld b, d
	ld c, e
	call SetCardLocationAndIndex
	pop bc
	call Func_1c92
	ld a, [wTempCardID + 0]
	call Func_200e
	ld a, [wTempCardID + 1]
	call Func_200e
	ld a, [$cdf4]
	call Func_200e
	inc d
	dec c
	jr nz, .asm_dc37
	pop de
	pop bc
	pop af
	ret

Func_dc5b:
	push bc
	call Func_ddb1
	ld a, [$cdfe]
	cp $02
	jr nz, .asm_dc6d
	call Func_dc89
	ld c, $00
	jr .asm_dc86
.asm_dc6d
	call Func_de01
	call Func_e39e
	ld a, $00
	ld [$cdfe], a
	call Func_1e70
	call Func_ddb1
	call Func_dc89
	call Func_e3ab
	ld c, $01
.asm_dc86
	ld a, c
	pop bc
	ret

Func_dc89:
	push af
	ld a, $00
	call Func_dcb0
	ld a, $01
	call Func_dcb0
	ld a, $02
	call Func_dcb0
	call Func_dd1b
	pop af
	ret

Func_dc9e:
	push af
	call Func_ddb1
	cp $00
	jr nz, .asm_dcae
	call Func_dd81
	ld a, $00
	call Func_dcb0
.asm_dcae
	pop af
	ret

Func_dcb0:
	push af
	push bc
	push de
	ld e, a
	ld d, $00
	ld c, $05
.asm_dcb8
	call Func_2051
	ld [wTempCardID + 0], a
	call Func_2051
	ld [wTempCardID + 1], a
	call Func_2051
	ld [$cdf4], a
	push bc
	ld b, d
	ld c, e
	call SetCardLocationAndIndex
	pop bc
	call Func_1c7a
	inc d
	dec c
	jr nz, .asm_dcb8
	pop de
	pop bc
	pop af
	ret

Func_dcdc:
	push af
	ld a, [wPlayerLP + 0]
	call Func_200e
	ld a, [wPlayerLP + 1]
	call Func_200e
	ld a, [wOppLP + 0]
	call Func_200e
	ld a, [wOppLP + 1]
	call Func_200e
	ld a, [$cad1]
	call Func_200e
	ld a, [$cf02]
	call Func_200e
	ld a, [$cfbe]
	call Func_200e
	ld a, [$cfbf]
	call Func_200e
	ld a, [$cfc0]
	call Func_200e
	ld a, [$cfc1]
	call Func_200e
	pop af
	ret

Func_dd1b:
	push af
	call Func_2051
	ld [wOppLP + 0], a
	call Func_2051
	ld [wOppLP + 1], a
	call Func_2051
	ld [wPlayerLP + 0], a
	call Func_2051
	ld [wPlayerLP + 1], a
	call Func_2051
	ld [$cad1], a
	call Func_2051
	ld [$cf03], a
	call Func_2051
	ld [$cfbf], a
	call Func_2051
	ld [$cfbe], a
	call Func_2051
	ld [$cfc1], a
	call Func_2051
	ld [$cfc0], a
	pop af
	ret

Func_dd5a:
	push af
	ld a, [$cfb9]
	call Func_200e
	ld a, [$cfba]
	call Func_200e
	ld a, [$cfaf]
	call Func_200e
	ld a, [$cfb0]
	call Func_200e
	ld a, [$cfb1]
	call Func_200e
	ld a, [$cfb2]
	call Func_200e
	pop af
	ret

Func_dd81:
	push af
	call Func_2051
	ld [$cfbb], a
	call Func_2051
	ld [$cfbc], a
	call Func_2051
	ld [$cfb3], a
	call Func_2051
	ld [$cfb4], a
	call Func_2051
	ld [$cfb5], a
	call Func_2051
	ld [$cfb6], a
	pop af
	ret

Func_dda8:
	push af
	ld a, [$cdfd]
	call Func_200e
	pop af
	ret

Func_ddb1:
	call Func_2051
	ld [$cdfe], a
	call Func_dbe7
	ret

Func_ddbb:
	push af
	push de
	push hl
	ld hl, $5dd3
.asm_ddc1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	cp $ff
	jr z, .asm_ddcf
	ld a, [de]
	call Func_200e
	jr .asm_ddc1
.asm_ddcf
	pop hl
	pop de
	pop af
	ret
; 0xddd3

SECTION "Bank 3@5e01", ROMX[$5e01], BANK[$3]

Func_de01:
	push af
	push de
	push hl
	ld hl, $5e19
.asm_de07
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	cp $ff
	jr z, .asm_de15
	call Func_2051
	ld [de], a
	jr .asm_de07
.asm_de15
	pop hl
	pop de
	pop af
	ret
; 0xde19

SECTION "Bank 3@5e81", ROMX[$5e81], BANK[$3]

Func_de81:
	push af
	push bc
	push hl
	ld a, $00
	ld [$ce12], a
	ld b, $00
	ld a, [$ce01]
	ld c, a
	sla c
	ld hl, $5ea7
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0xde9d

SECTION "Bank 3@608a", ROMX[$608a], BANK[$3]

Func_e08a:
	ld [$ce01], a
	ret

Func_e08e:
	push af
	ld a, [wPlayerLP + 0]
	ld [$ce06], a
	ld [$ced4], a
	ld a, [wPlayerLP + 1]
	ld [$ce07], a
	ld [$ced5], a
	pop af
	ret

Func_e0a3:
	push af
	ld a, [wOppLP + 0]
	ld [$ce08], a
	ld [$cedf], a
	ld a, [wOppLP + 1]
	ld [$ce09], a
	ld [$cee0], a
	pop af
	ret

Func_e0b8:
	push af
	push bc
	farcall Func_24024
	ld a, [wLoadedCardAtk + 0]
	ld [$ce0a], a
	ld a, [wLoadedCardAtk + 1]
	ld [$ce0b], a
	ld a, [wLoadedCardDef + 0]
	ld [$ce0c], a
	ld a, [wLoadedCardDef + 1]
	ld [$ce0d], a
	pop bc
	pop af
	ret

Func_e0d8:
	push af
	push bc
	farcall Func_24024
	ld a, [wLoadedCardAtk + 0]
	ld [$ce0e], a
	ld a, [wLoadedCardAtk + 1]
	ld [$ce0f], a
	ld a, [wLoadedCardDef + 0]
	ld [$ce10], a
	ld a, [wLoadedCardDef + 1]
	ld [$ce11], a
	pop bc
	pop af
	ret
; 0xe0f8

SECTION "Bank 3@61f2", ROMX[$61f2], BANK[$3]

Func_e1f2:
	push af
	ld a, $00
	call Func_e08a
	call Func_e08e
	call Func_e0a3
	pop af
	ret

Func_e200:
	push af
	call Func_cfe1
	ld a, b
	ld [$ce13], a
	ld a, c
	ld [$ce14], a
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld [$ce02], a
	ld a, [wTempCardID + 1]
	ld [$ce03], a
	call Func_e0b8
	ld a, $04
	call Func_e08a
	pop af
	ret

Func_e228:
	push af
	push bc
	call Func_cfe1
	ld a, b
	ld [$ce15], a
	ld a, c
	ld [$ce16], a
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_da4a
	call Func_1c7a
	ld a, [wTempCardID + 0]
	ld [$ce04], a
	ld a, [wTempCardID + 1]
	ld [$ce05], a
	call Func_e0d8
	call Func_21f3
	call Func_e259
	pop bc
	pop af
	ret

Func_e259:
	push af
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $626b
	add hl, bc
	ld a, [hl]
	call Func_e08a
	pop hl
	pop bc
	pop af
	ret
; 0xe26b

SECTION "Bank 3@626f", ROMX[$626f], BANK[$3]

Func_e26f:
	push af
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $6281
	add hl, bc
	ld a, [hl]
	call Func_e08a
	pop hl
	pop bc
	pop af
	ret
; 0xe281

SECTION "Bank 3@6285", ROMX[$6285], BANK[$3]

Func_e285:
	push af
	push bc
	ld a, b
	ld [$ce15], a
	ld a, c
	ld [$ce16], a
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_da4a
	call Func_1c7a
	ld a, [wTempCardID + 0]
	ld [$ce04], a
	ld a, [wTempCardID + 1]
	ld [$ce05], a
	call Func_e0d8
	ld a, $06
	call Func_e08a
	pop bc
	pop af
	ret

Func_e2b2:
	push af
	ld a, b
	ld [$ce13], a
	ld a, c
	ld [$ce14], a
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld [$ce02], a
	ld a, [wTempCardID + 1]
	ld [$ce03], a
	call Func_e0b8
	call Func_21f3
	call Func_e26f
	pop af
	ret
; 0xe2d8

SECTION "Bank 3@62f8", ROMX[$62f8], BANK[$3]

Func_e2f8:
	push af
	ld a, [$ce00]
	cp $02
	jr nz, .asm_e305
	call Func_e352
	jr .asm_e308
.asm_e305
	call Func_e30a
.asm_e308
	pop af
	ret

Func_e30a:
	push af
	push bc
	call Func_2c0c
	cp $00
	jr nz, .asm_e31e
	call Func_c142
	call Func_d3ec
	call EnableObjects
	jr .asm_e34f
.asm_e31e
	ld a, [$cf02]
	cp $00
	jr z, .asm_e346
	call Func_de81
	call Func_e3bc
	call Func_f86
	call Func_f86
	call Func_f86
	call Func_29fd
	farcall Func_191c5
	call Func_2a6b
	farcall Func_19272
	farcall Func_4068
	call Func_2a97
.asm_e346
	call Func_c142
	call Func_d3ec
	call EnableObjects
.asm_e34f
	pop bc
	pop af
	ret

Func_e352:
	push af
	push bc
	call Func_2c0c
	cp $00
	jr nz, .asm_e366
	call Func_c142
	call Func_d3ec
	call EnableObjects
	jr .asm_e39b
.asm_e366
	ld a, [$cf02]
	cp $00
	jr z, .asm_e38b
	call Func_de81
	call Func_e3bc
	call Func_dbd1
	call Func_29fd
	farcall Func_191c5
	call Func_2a6b
	farcall Func_19272
	call Func_db63
	farcall Func_4068
	call Func_2a97
.asm_e38b
	ld a, [$cdff]
	cp $01
	jr nz, .asm_e39b
	call Func_c142
	call Func_d3ec
	call EnableObjects
.asm_e39b
	pop bc
	pop af
	ret

Func_e39e:
	call Func_29fd
	farcall Func_191c5
	call Func_2a6b
	farcall Func_19272
	ret

Func_e3ab:
	farcall Func_4068
	call Func_2a97
	ret
; 0xe3b2

SECTION "Bank 3@63bc", ROMX[$63bc], BANK[$3]

Func_e3bc:
	push af
	ld a, [$ce12]
	and $01
	jr z, .asm_e3d2
	ld a, [$ce13]
	ld b, a
	ld a, [$ce14]
	ld c, a
	call SetCardLocationAndIndex
	call Func_1c65
.asm_e3d2
	ld a, [$ce12]
	and $02
	jr z, .asm_e3e7
	ld a, [$ce15]
	ld b, a
	ld a, [$ce16]
	ld c, a
	call SetCardLocationAndIndex
	call Func_1c65
.asm_e3e7
	ld a, [$ce12]
	and $04
	jr z, .asm_e3f6
	call Func_23a0
	ld a, $01
	ld [$cd62], a
.asm_e3f6
	ld a, [$ce12]
	and $08
	jr z, .asm_e405
	call Func_23a8
	ld a, $01
	ld [$cd62], a
.asm_e405
	pop af
	ret

Func_e407:
	push af
	call Func_2c1c
	cp $00
	jr z, .asm_e445
	ld a, [$cf02]
	cp $00
	jr z, .asm_e43f
	call Func_de81
	call Func_e3bc
	call Func_f86
	call Func_f86
	call Func_f86
	call Func_29fd
	farcall Func_191c5
	call Func_2a6b
	farcall Func_19272
	farcall Func_4068
	call Func_2a97
	ld c, $64
.asm_e439
	call WaitForVBlank
	dec c
	jr nz, .asm_e439
.asm_e43f
	call Func_c142
	call EnableObjects
.asm_e445
	pop af
	ret

; fills wPlayerDuelDeck with cards
; from wPlayerDeck in a random order
CreatePlayerDuelDeck:
	push af
	push bc
	push de
	push hl

	call ClearPlayerDuelDeck

	ld a, 0
	ld [wRandRangeStart], a
	ld a, DECK_SIZE - 1
	ld [wRandRangeEnd], a

	ld e, DECK_SIZE
.loop
	ld a, e
	dec a
	call SetPlayerDeckIndex
	call RandomRange
	ld a, [wRandNum]
	ld d, a
	; d = random deck index
	call .GetFirstEmptySlot
	call GetPlayerDeckCard
	call AddCardToPlayerDuelDeck
	dec e
	jr nz, .loop

	call Func_2639

	pop hl
	pop de
	pop bc
	pop af
	ret

.GetFirstEmptySlot:
	push af
	push bc
	push de
	push hl
	ld e, a
.loop_find_slot
	; find first slot to place card
	ld a, e
	call SetPlayerDuelDeckIndex
	call GetPlayerDuelDeckCard
	call IsValidCard
	cp FALSE
	jr z, .got_slot
	inc e
	ld a, e
	cp DECK_SIZE
	jr nz, .next
	; wrap around to start
	ld e, 0
.next
	jr .loop_find_slot
.got_slot
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_e49c:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $64bc
	call Func_10d9
	farcall DrawMainMenu
	call Func_e4c6
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0xe4bc

SECTION "Bank 3@64c6", ROMX[$64c6], BANK[$3]

Func_e4c6:
	call ClearOAM
	call Func_e6e9
	call Func_e4d3
	call Func_1225
	ret

Func_e4d3:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_e4ea
	ld hl, vTiles0
	ld c, TILE_SIZE
.loop_copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_e4ea: INCBIN "gfx/gfx_e4ea.2bpp"
; 0xe4fa

SECTION "Bank 3@64fb", ROMX[$64fb], BANK[$3]

Func_e4fb:
	push af
	push bc
	push de
	push hl
	ld e, $00
.loop
	call Random
	call Func_e52e
	call Func_e626
	ld b, $00
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	cp $01
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_e568
	dw Func_e575
	dw Func_e5f3
	dw Func_e606
	dw $6619
	dw $65cf

Func_e52e:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and PAD_A | PAD_B | PAD_SELECT | PAD_START | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	jr z, .no_keys
	ld c, $08
.asm_e53c
	dec c
	rlca
	jr nc, .asm_e53c
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.no_keys
	ld a, [wcaa7]
	and $c0
	jr z, .asm_e55b
	ld c, $08
.asm_e550
	dec c
	rlca
	jr nc, .asm_e550
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_e55b
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $0a, $00, $08, $00, $00, $04, $06

Func_e568:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_e575:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_e6e9
	call RequestVBlankMode
	call WaitForVBlank
	ld a, [$cea0]
	cp $00
	jr nz, .asm_e598
	call Func_1fa8
	farcall Func_10047
	call Func_e6be
	call Func_e49c
	jr .done
.asm_e598
	cp $01
	jr nz, .asm_e5aa
	call Func_1fb0
	farcall Func_10140
	call Func_e6be
	call Func_e49c
	jr .done
.asm_e5aa
	cp $02
	jr nz, .asm_e5bc
	call Func_1fb8
	farcall Func_1018d
	call Func_e6be
	call Func_e49c
	jr .done
.asm_e5bc
	cp $03
	jr nz, .done
	call Func_1fc0
	farcall Func_10919
	call Func_e6be
	call Func_e49c
.done
	ld a, $01
	ret
; 0xe5cf

SECTION "Bank 3@65f3", ROMX[$65f3], BANK[$3]

Func_e5f3:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_e6d8
	call Func_e6e9
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret
; 0xe606

SECTION "Bank 3@6606", ROMX[$6606], BANK[$3]

Func_e606:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_e6c7
	call Func_e6e9
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret
; 0xe619

SECTION "Bank 3@6626", ROMX[$6626], BANK[$3]

Func_e626:
	push af
	push bc
	push hl
	ld a, [wJoypadPressed]
	cp NONE
	jr z, .done
	ld a, e
	cp $00
	jr nz, .asm_e64c
	ld a, [wJoypadPressed]
	cp PAD_UP
	jr nz, .asm_e63e
	ld e, $01
.asm_e63e
	cp PAD_DOWN
	jr nz, .asm_e644
	ld e, $08
.asm_e644
	cp PAD_LEFT
	jr nz, .asm_e64a
	ld e, $13
.asm_e64a
	jr .asm_e661
.asm_e64c
	ld d, $00
	ld hl, .ButtonCombination1
	add hl, de
	ld a, [wJoypadPressed]
	cp [hl]
	jr nz, .reset
	ld hl, $66a4
	add hl, de
	ld e, [hl]
	jr .asm_e661
.reset
	ld e, $00
.asm_e661
	ld a, e
	cp $81
	jr nz, .asm_e672
	ld a, $22
	ld [$b7f1], a
	call Func_2b7e
	ld e, $00
	jr .done
.asm_e672
	ld a, e
	cp $82
	jr nz, .done
	ldh a, [$ffde]
	cp $03
	jr nz, .asm_e681
	ld a, $02
	ldh [$ffde], a
.asm_e681
	call Func_2b26
	ld e, $00
.done
	pop hl
	pop bc
	pop af
	ret

.ButtonCombination1:
	db PAD_UP, PAD_DOWN, PAD_B, PAD_DOWN, PAD_DOWN, PAD_B | PAD_UP, PAD_B, PAD_DOWN
.ButtonCombination2:
	db PAD_UP, PAD_B, PAD_DOWN, PAD_DOWN, PAD_RIGHT, PAD_UP, PAD_UP, PAD_UP, PAD_UP, PAD_B | PAD_DOWN, PAD_LEFT
.ButtonCombination3:
	db PAD_B, PAD_B, PAD_B, PAD_UP, PAD_B, PAD_B, PAD_B | PAD_RIGHT
; 0xe68a

SECTION "Bank 03@66be", ROMX[$66be], BANK[$03]

Func_e6be:
	push af
	xor a
	ld [$cea0], a
	pop af
	ret
; 0xe6c5

SECTION "Bank 3@66c7", ROMX[$66c7], BANK[$3]

Func_e6c7:
	push af
	ld a, [$cea0]
	cp $03
	jr z, .asm_e6d6
	ld a, [$cea0]
	inc a
	ld [$cea0], a
.asm_e6d6
	pop af
	ret

Func_e6d8:
	push af
	ld a, [$cea0]
	cp $00
	jr z, .asm_e6e7
	ld a, [$cea0]
	dec a
	ld [$cea0], a
.asm_e6e7
	pop af
	ret

Func_e6e9:
	push af
	push bc
	push de
	push hl
	lb bc, $00, $2
	ld a, [$cea0]
	call Func_e700
	ld d, 96 ; x
	call Func_123c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_e700:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $670d
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0xe70d

SECTION "Bank 3@6711", ROMX[$6711], BANK[$3]

Func_e711:
	push af
	push bc
	push hl
	ld a, $00
	ld [$cea4], a
	ld hl, $cea5
	ld c, $05
.asm_e71e
	ld a, $6d
	ld [hli], a
	ld a, $01
	ld [hli], a
	dec c
	jr nz, .asm_e71e
	pop hl
	pop bc
	pop af
	ret
; 0xe72b

SECTION "Bank 3@67eb", ROMX[$67eb], BANK[$3]

Func_e7eb:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $680e
	call Func_10d9
	farcall Func_803e
	farcall Func_28e0c
	call Func_e818
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0xe80e

SECTION "Bank 3@6818", ROMX[$6818], BANK[$3]

Func_e818:
	call ClearOAM
	call Func_cc1e
	call Func_e825
	call Func_1225
	ret

Func_e825:
	push af
	push bc
	push de
	push hl
	ld de, $683d
	ld hl, vTiles0
	ld c, $10
.asm_e831
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_e831
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xe83d

SECTION "Bank 3@684e", ROMX[$684e], BANK[$3]

Func_e84e:
	push bc
	push de
	push hl
	ld e, $00
	call Func_e87f
	ld b, $00
	ld c, a
	ld hl, $6875
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0xe865

SECTION "Bank 3@687f", ROMX[$687f], BANK[$3]

Func_e87f:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_e898
	ld c, $08
.asm_e88d
	dec c
	rlca
	jr nc, .asm_e88d
	ld b, $00
	ld hl, $68b1
	add hl, bc
	ld d, [hl]
.asm_e898
	ld a, [wcaa7]
	and $c0
	jr z, .asm_e8ac
	ld c, $08
.asm_e8a1
	dec c
	rlca
	jr nc, .asm_e8a1
	ld b, $00
	ld hl, $68b1
	add hl, bc
	ld d, [hl]
.asm_e8ac
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0xe8b1

SECTION "Bank 3@6e30", ROMX[$6e30], BANK[$3]

Func_ee30:
	push hl
	ld a, $03
	ld [$cdfd], a
	ld a, $00
	ld [$cdfe], a
	call Func_1f5f
	ld a, [$cdff]
	cp $01
	jr nz, .asm_ee56
	call Func_ee6a
	call Func_1e70
	call Func_1f81
	call Func_1e70
	call Func_ee83
	jr .asm_ee65
.asm_ee56
	call Func_1e70
	call Func_ee83
	call Func_1f81
	call Func_ee6a
	call Func_1e70
.asm_ee65
	call Func_dbe7
	pop hl
	ret

Func_ee6a:
	push af
	push bc
	push hl
	call Func_207c
	call Func_dda8
	ld hl, $cea5
	ld c, $0a
.asm_ee78
	ld a, [hli]
	call Func_200e
	dec c
	jr nz, .asm_ee78
	pop hl
	pop bc
	pop af
	ret

Func_ee83:
	push af
	call Func_207c
	call Func_ddb1
	cp $00
	jr nz, .asm_ee91
	farcall Func_1420c
.asm_ee91
	pop af
	ret
; 0xee93

SECTION "Bank 3@6ebf", ROMX[$6ebf], BANK[$3]

Func_eebf:
	push af
	push bc
	ld a, [$cee9]
	ld b, a
	ld c, $00
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [$ceed]
	ld b, a
	ld c, $01
	call SetCardLocationAndIndex
	call Func_21d9
	call Func_219e
	call Func_1c7a
	ld a, [$cee9]
	ld b, a
	ld c, $00
	call SetCardLocationAndIndex
	call Func_1c65
	pop bc
	pop af
	ret
; 0xeeee

SECTION "Bank 3@6f1d", ROMX[$6f1d], BANK[$3]

Func_ef1d:
	push af
	push bc
	ld a, [$cee9]
	ld b, a
	ld c, $01
	call SetCardLocationAndIndex
	ld a, [$cee7]
	ld [wTempCardID + 0], a
	ld a, [$cee8]
	ld [wTempCardID + 1], a
	call Func_21d9
	call Func_1caa
	ld a, [$ceed]
	ld b, a
	ld c, $00
	call SetCardLocationAndIndex
	call Func_1c65
	pop bc
	pop af
	ret
; 0xef49

SECTION "Bank 3@6f49", ROMX[$6f49], BANK[$3]

Func_ef49:
	push af
	push bc
	push hl
	call Func_efee
	ld b, $00
	ld c, a
	sla c
	ld hl, $6f82
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0xef60

SECTION "Bank 3@6f64", ROMX[$6f64], BANK[$3]

Func_ef64:
	push af
	push bc
	push hl
	call Func_d6d4
	call Func_f05f
	ld b, $00
	ld c, a
	sla c
	ld hl, $6f82
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0xef7e

SECTION "Bank 3@6fee", ROMX[$6fee], BANK[$3]

Func_efee:
	push bc
	push de
	push hl
	ld a, [wcd5e]
	ld b, a
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	ld de, $12c
	call CompareBCAndDE
	cp $02
	jr nz, .asm_f013
	ld a, $2f
	jr .asm_f01a
.asm_f013
	ld hl, $6ef2
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hl]
.asm_f01a
	pop hl
	pop de
	pop bc
	ret
; 0xf01e

SECTION "Bank 3@705f", ROMX[$705f], BANK[$3]

Func_f05f:
	push bc
	push de
	push hl
	ld a, [$cecd]
	ld c, a
	ld a, [$cece]
	ld b, a
	ld de, $12c
	call CompareBCAndDE
	cp $02
	jr nz, .asm_f083
	farcall AttemptFusionSummon
	cp $00
	jr nz, .asm_f07f
	ld a, $01
	jr .asm_f081
.asm_f07f
	ld a, $02
.asm_f081
	jr .asm_f08a
.asm_f083
	ld hl, $6f62
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hl]
.asm_f08a
	pop hl
	pop de
	pop bc
	ret
; 0xf08e

SECTION "Bank 3@70f7", ROMX[$70f7], BANK[$3]

Func_f0f7:
	call Func_cd72
	call Func_c142
	call Func_cd9a
	call Func_d3ec
	ret

Func_f104:
	call Func_cd82
	call Func_c142
	ret

Func_f10b:
	call Func_cd82
	call Func_c142
	call Func_cd9a
	call Func_d3ec
	ret

Func_f118:
	call Func_ce47
	call Func_cefb
	call Func_cd9a
	call Func_d3ec
	ret

Func_f125:
	call Func_cd82
	call Func_ce47
	call Func_cefb
	call Func_c142
	call Func_cd9a
	call Func_d3ec
	ret

Func_f138:
	call Func_cd8a
	call Func_c142
	ret

Func_f13f:
	call Func_cd92
	call Func_ce47
	farcall Func_108f0
	call Func_c142
	call Func_cd9a
	call Func_d3ec
	ret

Func_f152:
	call Func_cd82
	farcall Func_108f0
	call Func_ce47
	ret

Func_f15c:
	call Func_c142
	call Func_cd82
	farcall Func_108f0
	call Func_ce47
	call Func_cd9a
	call Func_d3ec
	ret

Func_f16f:
	call Func_c142
	call Func_cd82
	farcall Func_108f0
	call Func_ce47
	call Func_cd9a
	call Func_d3ec
	ret

Func_f182:
	call Func_cd82
	call Func_ce47
	ret
; 0xf189

SECTION "Bank 3@7a4d", ROMX[$7a4d], BANK[$3]

HandlePlayerPetitMothEvolution:
	push af
	push bc
	ld b, 0
.loop
	ld a, b
	cp FIELD_SIZE
	jr nc, .asm_fa93
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call Func_fadb
	ld a, b
	cp $01
	jr nz, .asm_fa8f

	; set field card as next Petit Moth evolution
	ld a, c
	farcall Func_150dd
	ld b, $00
	sla c
	ld hl, PetitMothEvolutionCardIDs
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_1c7a
	farcall Func_5af2
	farcall SetCardAsSeen
.asm_fa8f
	pop bc
	inc b
	jr .loop
.asm_fa93
	pop bc
	pop af
	ret

Func_fa96:
	push af
	push bc
	push hl
	ld b, $00
.asm_fa9b
	ld a, b
	cp $05
	jr nc, .asm_fad7
	ld c, $01
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call Func_fadb
	ld a, b
	cp $01
	jr nz, .asm_fad3
	ld a, c
	farcall Func_150dd
	ld b, $00
	sla c
	ld hl, PetitMothEvolutionCardIDs
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_1c7a
.asm_fad3
	pop bc
	inc b
	jr .asm_fa9b
.asm_fad7
	pop hl
	pop bc
	pop af
	ret

Func_fadb:
	push af
	push de
	push hl
	ld hl, .CardIDs
	ld d, b
	ld e, c
	ld bc, 0
.loop
	; is it end of list?
	push bc
	push de
	sla c
	ld hl, .CardIDs
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, -1
	call IsBCEqualToDE
	pop de
	pop bc
	cp TRUE
	jr nz, .compare_ids
	ld b, $00
	jr .done
.compare_ids
	push bc
	sla c
	ld hl, .CardIDs
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call IsBCEqualToDE
	pop bc
	cp TRUE
	jr nz, .asm_fb19
	ld b, $01
	jr .done
.asm_fb19
	inc c
	jr .loop
.done
	pop hl
	pop de
	pop af
	ret

.CardIDs:
	dw PETIT_MOTH
	dw LARVAE_MOTH
	dw COCOON_EVOLUTION
	dw GREAT_MOTH
	dw -1 ; end

PetitMothEvolutionCardIDs:
	dw LARVAE_MOTH
	dw COCOON_EVOLUTION
	dw GREAT_MOTH
	dw PERFECT_GREAT_MOTH
	dw -1 ; end
; 0xfb34
