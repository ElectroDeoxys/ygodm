	dw BANK(@)

	farcall_table_start
	farfunc Func_14036 ; $03
	farfunc Func_14185 ; $05
	farfunc Func_1420c ; $07
	farfunc ShowDuelMessage ; $09
	farfunc Func_148b6 ; $0b
	farfunc Func_1500c ; $0d
	farfunc Func_1501f ; $0f
	farfunc Func_15032 ; $11
	farfunc Func_1508a ; $13
	farfunc Func_1509a ; $15
	farfunc Func_150ad ; $17
	farfunc Func_150bd ; $19
	farfunc Func_150dd ; $1b
	farfunc Func_1512c ; $1d
	farfunc Func_15148 ; $1f
	farfunc Func_15194 ; $21
	farfunc Func_151db ; $23
	farfunc Func_15204 ; $25
	farfunc Func_15049 ; $27
	farfunc Func_15059 ; $29
	farfunc Func_150cd ; $2b
	farfunc HandleExodiaWinCondition ; $2d
	farfunc HandleEmptyHandWinCondition ; $2f
	farfunc AutoBuildPlayerDeck ; $31
	farfunc Func_14216 ; $33
	farfunc Func_14238 ; $35

Func_14036:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_1406e
	call SetScreenConfig
	call Func_12d2
	farcall LoadFontToVTiles2
	farcall Func_28fae
	call Func_140a3
	call Func_140e3
	call Func_14113
	call Func_14143
	farcall Func_f0004
	call EnableLCD
	call Func_ff0
	call WaitForVBlank
	call Func_2ae4
	call Func_14078
	pop hl
	pop af
	ret

ScreenConfig_1406e:
	db LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 144 ; WY
	db 159 + WX_OFS ; WX

Func_14078:
	push af
	push bc
	call Func_1c0a
	call Func_1256
	farcall Func_5eb3
	lb bc, $10, $28
	call Func_1c1d
	ld bc, NULL
	call Func_1c12
	ld a, VBLANK_0A
	call SetPendingVBlankMode
	call Func_1282
	farcall Func_5ff2
	call RequestVBlankMode
	call WaitForVBlank
	pop bc
	pop af
	ret

Func_140a3:
	push af
	push bc
	push de
	push hl
	hlbgcoord 1, 0
	ld a, [wLoadedCardID + 0]
	ld c, a
	ld a, [wLoadedCardID + 1]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, LINE_LENGTH
.asm_140bd
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_140bd
	ld de, $e
	add hl, de
	ld de, wTextBuffer
	ld c, LINE_LENGTH
.asm_140d2
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
	ld [hli], a
	dec c
	jr nz, .asm_140d2
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_140e3:
	push af
	push hl
	hlbgcoord 13, 5
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	ld a, [wLoadedCardAtk + 0]
	ld c, a
	ld a, [wLoadedCardAtk + 1]
	ld b, a
	ld a, b
	cp -1
	jr z, .asm_14110
	farcall SetTextArg
	farcall LoadText
	ld a, [wTextBuffer + $0]
	ld [hli], a
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
.asm_14110
	pop hl
	pop af
	ret

Func_14113:
	push af
	push hl
	hlbgcoord 13, 7
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	ld a, [wLoadedCardDef + 0]
	ld c, a
	ld a, [wLoadedCardDef + 1]
	ld b, a
	ld a, b
	cp -1
	jr z, .asm_14140
	farcall SetTextArg
	farcall LoadText
	ld a, [wTextBuffer + $0]
	ld [hli], a
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
.asm_14140
	pop hl
	pop af
	ret

Func_14143:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_CARD_TYPE
	farcall SetTextLoadMode
	ld b, $00
	ld a, [wLoadedCardType]
	ld c, a
	farcall SetTextArg
	farcall LoadText
	ld hl, wTextBuffer
	debgcoord 11, 8
	ld c, $08
.asm_14160
	ld a, [hli]
	call ProcessChar
	ld a, [wCharHeadTile]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_14160
	ld hl, wTextBuffer
	debgcoord 11, 9
	ld c, $08
.asm_14174
	ld a, [hli]
	call ProcessChar
	ld a, [wCharTile]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_14174
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_14185:
	push af
	push bc
	push de
	push hl
.loop
	call Func_141a8
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
	dw Func_141ce
	dw Func_141db

Func_141a8:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and PAD_B
	jr z, .asm_141c1
	ld c, $08
.asm_141b6
	dec c
	rlca
	jr nc, .asm_141b6
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_141c1
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $00, $02, $00, $00, $00, $00, $00, $00

Func_141ce:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_141db:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $01
	ret

Func_141e9:
	push af
	ld a, $6d
	ld [wceb5], a
	ld a, $01
	ld [wceb6], a
	pop af
	ret

Func_141f6:
	push af
	ld a, c
	ld [wceb5], a
	ld a, b
	ld [wceb6], a
	pop af
	ret

Func_14201:
	push af
	ld a, [wceb5]
	ld c, a
	ld a, [wceb6]
	ld b, a
	pop af
	ret

Func_1420c:
	call Func_1425a
	call Func_141e9
	call Func_1432f
	ret

Func_14216:
	push af
	push bc
	push de
	push hl
	ld hl, wceb7
	ld e, $05
.asm_1421f
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_14230
	farcall Func_5af2
	farcall GiveCard
.asm_14230
	dec e
	jr nz, .asm_1421f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_14238:
	push af
	push bc
	push de
	push hl
	ld hl, wcea5
	ld e, $05
.asm_14241
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_14252
	farcall Func_5af2
	farcall GiveCard
.asm_14252
	dec e
	jr nz, .asm_14241
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1425a:
	push af
	push bc
	push hl
	ld hl, wceb7
	ld c, $05
.asm_14262
	call Func_2051
	ld [hli], a
	call Func_2051
	ld [hli], a
	dec c
	jr nz, .asm_14262
	pop hl
	pop bc
	pop af
	ret

Func_14271:
	push bc
	push de
	push hl
	ld hl, wceb7
	ld de, wcec1
	ld b, $00
	ld c, $0a
.asm_1427e
	ld a, [de]
	cp [hl]
	jr z, .asm_14284
	ld b, $01
.asm_14284
	inc hl
	inc de
	dec c
	jr nz, .asm_1427e
	ld a, b
	pop hl
	pop de
	pop bc
	ret

Func_1428e:
	push af
	push bc
	push de
	push hl
	ld h, b
	ld l, c
	ld b, a
	sla a
	sla a
	sla a
	sla b
	add b
	ld c, a ; *10
	ld b, $00
	add hl, bc
	ld b, h
	ld c, l
	ld e, d
	sla e
	ld d, $00
	ld hl, .ptrs
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $05
.asm_142b2
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [bc]
	ld [de], a
	inc bc
	inc de
	ld a, [bc]
	ld [de], a
	inc bc
	pop af
	dec a
	jr nz, .asm_142b2
	pop hl
	pop de
	pop bc
	pop af
	ret

.ptrs
	dw .ptrs_1
	dw .ptrs_2
	dw .ptrs_3
	dw .ptrs_4
	dw .ptrs_5
	dw .ptrs_6

.ptrs_1
	dw wcec1 + 0, wcec1 + 2, wcec1 + 4, wcec1 + 6, wcec1 + 8
.ptrs_2
	dw wcec1 + 0, wcec1 + 4, wcec1 + 2, wcec1 + 6, wcec1 + 8
.ptrs_3
	dw wcec1 + 2, wcec1 + 0, wcec1 + 4, wcec1 + 6, wcec1 + 8
.ptrs_4
	dw wcec1 + 2, wcec1 + 4, wcec1 + 0, wcec1 + 6, wcec1 + 8
.ptrs_5
	dw wcec1 + 4, wcec1 + 0, wcec1 + 2, wcec1 + 6, wcec1 + 8
.ptrs_6
	dw wcec1 + 4, wcec1 + 2, wcec1 + 0, wcec1 + 6, wcec1 + 8

Func_1430f:
	push af
	push bc
	push de
	push hl
	ld hl, wceb7
	ld de, wcec1
	ld c, $0a
.asm_1431b
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1431b
	ld hl, wceb7
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call Func_141f6
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1432f:
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld e, $18
.asm_14337
	push de
	ld bc, .data_1
	ld e, d
	ld d, $00
.asm_1433e
	ld a, d
	cp $06
	jr nc, .asm_14361
	ld a, e
	call Func_1428e
	call Func_14271
	cp $00
	jr nz, .asm_1435e
	ld bc, .data_2
	ld a, e
	ld d, $00
	call Func_1428e
	call Func_1430f
	add sp, $02
	jr .asm_14366
.asm_1435e
	inc d
	jr .asm_1433e
.asm_14361
	pop de
	inc d
	dec e
	jr nz, .asm_14337
.asm_14366
	pop hl
	pop de
	pop bc
	pop af
	ret

.data_1
	db $25, $00, $26, $00, $20, $01, $6d, $01, $6d, $01
	db $03, $00, $0f, $00, $20, $01, $6d, $01, $6d, $01
	db $19, $00, $5a, $00, $20, $01, $6d, $01, $6d, $01
	db $7a, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $9c, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $11, $01, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $10, $01, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $07, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $4a, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $9d, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $ed, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $b3, $00, $15, $01, $20, $01, $6d, $01, $6d, $01
	db $7a, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $9c, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $11, $01, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $10, $01, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $07, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $4a, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $9d, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $ed, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $b3, $00, $37, $00, $20, $01, $6d, $01, $6d, $01
	db $47, $00, $47, $00, $20, $01, $6d, $01, $6d, $01
	db $38, $00, $47, $00, $20, $01, $6d, $01, $6d, $01
	db $15, $00, $51, $00, $20, $01, $6d, $01, $6d, $01

.data_2
	db $24, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $44, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $5b, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $37, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $47, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $38, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $42, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01
	db $d8, $00, $6d, $01, $6d, $01, $6d, $01, $6d, $01

HandleExodiaWinCondition:
	push af
	push bc
	call .CheckAllExodiaPieces
	cp TRUE
	jr nz, .skip
	farcall Func_b807
	call SetDuelStatus_PlayerWin
.skip
	pop bc
	pop af
	ret

; returns TRUE if player has all Exodia pieces
.CheckAllExodiaPieces:
	push bc
	push de
	ld b, 0
	ld c, CARD_LOCATION_PLAYER_HAND
	ld e, $00
.loop_hand
	ld a, b
	cp HAND_SIZE
	jr nc, .check_exodia_flags
	call SetTargetCard
	call LoadTargetCard
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call .GetExodiaFlag
	or e
	ld e, a
	pop bc
	inc b
	jr .loop_hand
.check_exodia_flags
	; if has all pieces, then return TRUE
	ld a, e
	cp HAS_R_LEG_OF_FORBIDDEN | HAS_L_LEG_OF_FORBIDDEN | HAS_R_ARM_OF_FORBIDDEN | HAS_L_ARM_OF_FORBIDDEN | HAS_EXODIA_FORBIDDEN
	jr nz, .false
	xor a ; TRUE
	jr .true
.false
	ld a, FALSE
.true
	pop de
	pop bc
	ret

; input:
; - bc = card ID
.GetExodiaFlag:
	push bc
	push de
	push hl
	ld d, $00
	ld e, $00
	ld hl, .ExodiaCardIDs
.loop_exodia_cards
	ld a, e
	cp $05
	jr nc, .none_found
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call IsBCEqualToDE
	pop de
	cp TRUE
	jr nz, .next_exodia_card
	push hl
	ld hl, .ExodiaPieceFlags
	add hl, de
	ld a, [hl]
	add sp, $02
	jr .done
	pop hl
.next_exodia_card
	inc e
	jr .loop_exodia_cards
.none_found
	xor a
.done
	pop hl
	pop de
	pop bc
	ret

.ExodiaCardIDs:
	dw R_LEG_OF_FORBIDDEN
	dw L_LEG_OF_FORBIDDEN
	dw R_ARM_OF_FORBIDDEN
	dw L_ARM_OF_FORBIDDEN
	dw EXODIA_FORBIDDEN

.ExodiaPieceFlags:
	db HAS_R_LEG_OF_FORBIDDEN
	db HAS_L_LEG_OF_FORBIDDEN
	db HAS_R_ARM_OF_FORBIDDEN
	db HAS_L_ARM_OF_FORBIDDEN
	db HAS_EXODIA_FORBIDDEN

; shows duel message loaded into [wDuelMsg]
ShowDuelMessage:
	push af
	push bc
	push de
	push hl
	call Func_1466f
	call Func_146b6
	call ShowDuelTextBox
	call Func_148b6
	call HideDuelTextBox_FromTop
	call Func_1467e
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_145e8:
	push af
	push bc
	push de
	push hl
	call Func_1466f
	call Func_146b6
	call ShowDuelTextBox
	call Func_148b6
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_145fd:
	push af
	push bc
	push de
	push hl
	call Func_1466f
	call HideDuelTextBox
	call Func_146b6
	call ShowDuelTextBox
	call Func_148b6
	call HideDuelTextBox_FromTop
	call Func_1467e
	pop hl
	pop de
	pop bc
	pop af
	ret

ShowDuelTextBox:
	push af
	push bc
	ld a, SCREEN_HEIGHT_PX - 1
	ldh [rWY], a
	ld a, 0 + WX_OFS
	ldh [rWX], a
	ld c, SCREEN_HEIGHT_PX - 1
.loop
	ld a, c
	cp 103
	jr c, .done
	ldh [rWY], a
	dec c
	dec c
	call WaitForVBlank
	jr .loop
.done
	ld a, 103
	ldh [rWY], a
	pop bc
	pop af
	ret

HideDuelTextBox_FromTop:
	push af
	push bc
	ld c, 103
.loop
	ld a, c
	cp SCREEN_HEIGHT_PX - 1
	jr nc, .done
	ldh [rWY], a
	inc c
	inc c
	call WaitForVBlank
	jr .loop
.done
	ld a, SCREEN_HEIGHT_PX - 1
	ldh [rWY], a
	pop bc
	pop af
	ret

HideDuelTextBox:
	push af
	push bc
	ldh a, [rWY]
	ld c, a
.loop
	ld a, c
	cp SCREEN_HEIGHT_PX - 1
	jr nc, .done
	ldh [rWY], a
	inc c
	inc c
	call WaitForVBlank
	jr .loop
.done
	ld a, SCREEN_HEIGHT_PX - 1
	ldh [rWY], a
	pop bc
	pop af
	ret

Func_1466f:
	call Func_148e9
	call Func_14676
	ret

Func_14676:
	push hl
	ld hl, rLCDC
	res B_LCDC_OBJS, [hl]
	pop hl
	ret

Func_1467e:
	push hl
	ld hl, rLCDC
	set B_LCDC_OBJS, [hl]
	pop hl
	ret

Func_14686:
	push af
	ld a, $01
	ld [wcf41], a
	ld a, $00
	ld [wcf43 + 0], a
	ld a, $00
	ld [wcf43 + 1], a
	ld a, $00
	ld [wcf45], a
	ld a, $00
	ld [wcf46], a
	ld a, $00
	ld [wcf1c], a
	call Func_14830
	pop af
	ret

Func_146aa:
	push af
	call Func_148f9
	call Func_14731
	call Func_1487e
	pop af
	ret

Func_146b6:
	push af
	ld a, VBLANK_10
	call SetPendingVBlankMode
	ld a, $00
	ld [wcf45], a
	ld a, $00
	ld [wcf46], a
	call Func_14830
	call Func_146ef
	call RequestVBlankMode
	call WaitForVBlank

	ld a, VBLANK_10
	call SetPendingVBlankMode
	ld a, $00
	ld [wcf45], a
	ld a, $01
	ld [wcf46], a
	call Func_14830
	call Func_146ef
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_146ef:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wcf46]
	ld c, a
	sla c
	ld hl, .Coords
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	call AddWordToVBlankStruct
	ld hl, wcf1d
	ld e, LINE_LENGTH
.asm_1470a
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_1470a
	ld hl, TILEMAP_WIDTH
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	ld hl, wcf2f
	ld e, LINE_LENGTH
.asm_1471f
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_1471f
	pop hl
	pop de
	pop bc
	pop af
	ret

.Coords:
	dwcoord 1, 0, vBGMap1
	dwcoord 1, 2, vBGMap1
	dwcoord 1, 4, vBGMap1

Func_14731:
	push af
	push bc
	push hl
	ld a, [wcf42]
	cp CONTROL_CHAR
	jr nc, .ctrl_char
	call Func_14761
	jr .done
.ctrl_char
	ld b, $00
	sub CONTROL_CHAR
	ld c, a
	sla c
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
.done
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_147b0 ; <LINE>
	dw Func_147d4 ; <PROMPT>
	dw Func_14812 ; <B2>
	dw Func_1481a ; <B3>
	dw Func_1482c ; <DONE>

Func_14761:
	push af
	push bc
	push de
	push hl
	ld a, [wcf41]
	cp $01
	jr nz, .asm_14795
	call Func_14854
	ld a, [wcf42]
	call ProcessChar
	ld b, $00
	ld a, [wcf45]
	ld c, a
	ld hl, wcf1d
	add hl, bc
	ld a, [wCharHeadTile]
	ld [hl], a
	ld a, [wcf45]
	ld c, a
	ld hl, wcf2f
	add hl, bc
	ld a, [wCharTile]
	ld [hl], a
	call Func_146ef
	call Func_1479a
.asm_14795
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1479a:
	push af
	ld a, [wcf45]
	inc a
	ld [wcf45], a
	cp $12
	jr c, .asm_147ae
	call Func_147b0
	ld a, $01
	ld [wcf1c], a
.asm_147ae
	pop af
	ret

Func_147b0:
	push af
	ld a, [wcf1c]
	cp $00
	jr nz, .asm_147cd
	ld a, $00
	ld [wcf45], a
	ld a, [wcf46]
	cp $02
	jr nc, .asm_147c5
	inc a
.asm_147c5
	ld [wcf46], a
	call Func_14830
	jr .asm_147d2
.asm_147cd
	ld a, $00
	ld [wcf1c], a
.asm_147d2
	pop af
	ret

Func_147d4:
	push af
	ld a, [wcf41]
	cp $01
	jr nz, .asm_147e6
	ld a, $00
	ld [wcf1c], a
	call Func_14f90
	jr .asm_14810
.asm_147e6
	cp $13
	jr nz, .asm_147fc
	ld a, $00
	ld [wcf45], a
	ld a, $01
	ld [wcf46], a
	call Func_14830
	call Func_146ef
	jr .asm_14810
.asm_147fc
	cp $12
	jr nz, .asm_14810
	ld a, $00
	ld [wcf45], a
	ld a, $00
	ld [wcf46], a
	call Func_14830
	call Func_146ef
.asm_14810
	pop af
	ret

Func_14812:
	push af
	ld a, $00
	ld [wcf1c], a
	pop af
	ret

Func_1481a:
	push af
	ld a, [wcf41]
	cp $01
	jr nz, .asm_1482a
	ld a, $00
	ld [wcf1c], a
	call Func_14f9d
.asm_1482a
	pop af
	ret

Func_1482c:
	call Func_14faa
	ret

Func_14830:
	push af
	push bc
	push hl
	call Func_14854
	ld a, ' '
	call ProcessChar
	ld a, [wCharHeadTile]
	ld hl, wcf1d
	ld c, LINE_LENGTH
.asm_14843
	ld [hli], a
	dec c
	jr nz, .asm_14843
	ld a, [wCharTile]
	ld c, LINE_LENGTH
.asm_1484c
	ld [hli], a
	dec c
	jr nz, .asm_1484c
	pop hl
	pop bc
	pop af
	ret

Func_14854:
	push af
	ld a, [wcf18]
	cp TRUE
	jr nz, .asm_1486d
	ld a, [wcf46]
	cp $00
	jr nz, .asm_14868
	call Func_1114
	jr .asm_1486b
.asm_14868
	call Func_111c
.asm_1486b
	jr .asm_1487c
.asm_1486d
	ld a, [wcf46]
	cp $00
	jr nz, .asm_14879
	call Func_1134
	jr .asm_1487c
.asm_14879
	call Func_113c
.asm_1487c
	pop af
	ret

Func_1487e:
	push af
	push bc
	push hl
	ld a, [wcf41]
	dec a
	ld [wcf41], a
	jr nz, .asm_148a5
	ld a, [wcf42]
	cp CONTROL_CHAR
	jr nc, .asm_14898
	ld a, $02
	ld [wcf41], a
	jr .asm_148a5
.asm_14898
	ld b, $00
	sub CONTROL_CHAR
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	ld [wcf41], a
.asm_148a5
	pop hl
	pop bc
	pop af
	ret

.data
	db $01, $14, $10, $03, $01

; unreferenced
Func_148ae:
	push af
	ld a, $00
	ld [wDuelMsg], a
	pop af
	ret

Func_148b6:
	push af
	push bc
	ld a, $00
	ld [wcf48], a
	call Func_14686
.asm_148c0
	ld a, VBLANK_10
	call SetPendingVBlankMode
	call Func_14f5a
	ld a, [wcf48]
	cp $00
	jr nz, .asm_148d4
	call Func_146aa
	jr .asm_148d7
.asm_148d4
	call Func_14fb2
.asm_148d7
	call RequestVBlankMode
	call WaitForVBlank
	ld a, [wcf48]
	cp $05
	jr z, .asm_148e6
	jr .asm_148c0
.asm_148e6
	pop bc
	pop af
	ret

Func_148e9:
	push af
	ld a, $00
	ld [wcf4c], a
	pop af
	ret

Func_148f1:
	push af
	ld a, $01
	ld [wcf4c], a
	pop af
	ret

Func_148f9:
	push af
	push bc
	push hl
	ld a, [wcf41]
	cp $01
	jr nz, .asm_14906
	call Func_1490a
.asm_14906
	pop hl
	pop bc
	pop af
	ret

Func_1490a:
	push bc
	push hl
	ld a, [wcf4c]
	cp $01
	jr nz, .asm_1491b
	call Func_14970
	ld [wcf42], a
	jr .asm_14931
.asm_1491b
	call Func_14934
	ld [wcf42], a
	call Func_14961
	cp TRUE
	jr nz, .asm_14931
	call Func_148f1
	call Func_14970
	ld [wcf42], a
.asm_14931
	pop hl
	pop bc
	ret

Func_14934:
	push bc
	push hl
	ld b, $00
	ld a, [wDuelMsg]
	ld c, a
	sla c
	rl b
	ld hl, DuelMessages
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcf43 + 1]
	ld b, a
	ld a, [wcf43 + 0]
	ld c, a
	inc a
	ld [wcf43 + 0], a
	jr nz, .asm_1495c
	ld a, [wcf43 + 1]
	inc a
	ld [wcf43 + 1], a
.asm_1495c
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_14961:
	cp '<B5>'
	jr c, .asm_1496d
	sub '<B5>'
	call Func_2ce8
	xor a ; TRUE
	jr .asm_1496f
.asm_1496d
	ld a, FALSE
.asm_1496f
	ret

Func_14970:
	push bc
	call Func_2c7d
	push af
	ld a, b
	cp $01
	jr nz, .asm_1497d
	call Func_148e9
.asm_1497d
	pop af
	pop bc
	ret

	const_def

DuelMessages:
	message_ptr Text_ItsYourTurn ; $00
	message_ptr Text_ItsTheComputersTurn ; $01
	message_ptr Text_149f4 ; $02
	message_ptr Text_149ff ; $03
	message_ptr Text_TurnFinished ; $04
	message_ptr Text_CommunicationError ; $05
	message_ptr Text_TheDeckIsNotComplete ; $06
	message_ptr Text_TheTradeHasEnded ; $07
	message_ptr Text_YourOpponentIsCurrentlySearching ; $08
	message_ptr Text_CommunicationHasBeenEstablished ; $09
	message_ptr Text_14a8a ; $0a
	message_ptr Text_14a96 ; $0b
	message_ptr Text_14aa2 ; $0c
	message_ptr Text_14aae ; $0d
	message_ptr Text_14aba ; $0e
	message_ptr Text_14ad5 ; $0f
	message_ptr Text_14aec ; $10
	message_ptr Text_14b09 ; $11
	message_ptr Text_14b20 ; $12
	message_ptr Text_14b3d ; $13
	message_ptr Text_14b6f ; $14
	message_ptr Text_14bad ; $15
	message_ptr Text_14be9 ; $16
	message_ptr Text_14c23 ; $17
	message_ptr Text_14c5c ; $18
	message_ptr Text_14ca3 ; $19
	message_ptr Text_14cdd ; $1a
	message_ptr Text_14d06 ; $1b
	message_ptr Text_14d2d ; $1c
	message_ptr Text_14d4a ; $1d
	message_ptr Text_14d67 ; $1e
	message_ptr Text_14d84 ; $1f
	message_ptr Text_14da2 ; $20
	message_ptr Text_14dc9 ; $21
	message_ptr Text_14de5 ; $22
	message_ptr Text_14e06 ; $23
	message_ptr Text_14e26 ; $24
	message_ptr Text_14e48 ; $25
	message_ptr Text_14e67 ; $26
	message_ptr Text_14ea8 ; $27
	message_ptr Text_14ed4 ; $28
	message_ptr Text_14f04 ; $29
	message_ptr Text_14f19 ; $2a
	message_ptr Text_14f2d ; $2b
	message_ptr Text_14f40 ; $2c

Text_ItsYourTurn:
	text "あなたのタ-ンです"
	prompt
	done

Text_ItsTheComputersTurn:
	text "コンピュ-タ-のタ-ンです"
	prompt
	done

Text_149f4:
	text "つうしんちゅうです"
	prompt
	done

Text_149ff:
	text "てふだから 1まい えらんでください"
	line ""
	prompt
	done

Text_TurnFinished:
	text "タ-ンしゅうりょうです"
	prompt
	done

Text_CommunicationError:
	text "つうしんエラ-です"
	line "もういちど やりなおしてください"
	prompt
	done

Text_TheDeckIsNotComplete:
	text "デッキが40まい そろぅていません"
	prompt
	done

Text_TheTradeHasEnded:
	text "トレ-ドはしゅうりょうしました"
	prompt
	done

Text_YourOpponentIsCurrentlySearching:
	text "たいせんあいてが そうさちゅうです"
	done

Text_CommunicationHasBeenEstablished:
	text "つうしんゆうごうがはぅせいした"
	prompt
	text "<B5>になぅた"
	prompt
	done

Text_14a8a:
	text "<B5>は <B6>にしんかした"
	prompt
	done

Text_14a96:
	text "<B5>は <B6>にしんかした"
	prompt
	done

Text_14aa2:
	text "<B5>は <B6>にしんかした"
	prompt
	done

Text_14aae:
	text "<B5>は <B6>にしんかした"
	prompt
	done

Text_14aba:
	text "ひかりのごふうけん のこうかは"
	line "まだ つづいている"
	prompt
	done

Text_14ad5:
	text "ひかりのごふうけん のこうかが"
	line "なくなぅた"
	prompt
	done

Text_14aec:
	text "でんせつのけんをつかぅた"
	line "モンスタ-はパワ-アップした"
	prompt
	done

Text_14b09:
	text "<B5>をつかぅた"
	prompt
	text "<B6>はぶんしんして <B7>になぅた"
	prompt
	done

Text_14b20:
	text "しゅびふうじをつかぅた"
	line "あいては こうげきしかできない"
	prompt
	done

Text_14b3d:
	text "ドラゴンぞく·ふういんのつぼを"
	line "つかぅた"
	prompt
	text "フィ-ルドにいた ドラゴンぞくは"
	line "つぼにふういんされた"
	prompt
	done

Text_14b6f:
	text "もりカ-ドをつかぅた"
	line "フィ-ルドはもりにへんかした"
	prompt
	text "じゅうせんし けもの こんちゅう"
	line "しょくぶつはフィ-ルドパワ-をえる"
	prompt
	done

Text_14bad:
	text "こうやカ-ドをつかぅた"
	line "フィ-ルドはこうやにへんかした"
	prompt
	text "アンデット きょうりゅう がんせき"
	line "はフィ-ルドパワ-をえる"
	prompt
	done

Text_14be9:
	text "やまカ-ドをつかぅた"
	line "フィ-ルドはやまにへんかした"
	prompt
	text "ドラゴン ちょうじゅう いかずち"
	line "は フィ-ルドパワ-をえる"
	prompt
	done

Text_14c23:
	text "そうげんカ-ドをつかぅた"
	line "フィ-ルドはそうげんにへんかした"
	prompt
	text "せんし じゅうせんし は フィ-ルド"
	line "パワ-をえる"
	prompt
	done

Text_14c5c:
	text "うみカ-ドをつかぅた"
	line "フィ-ルドはうみにへんかした"
	prompt
	text "さかな かいりゅう いかずち みず"
	line "は パワ-アップ"
	prompt
	text "きかい ほのお は パワ-ダウン"
	prompt
	done

Text_14ca3:
	text "やみカ-ドをつかぅた"
	line "フィ-ルドはやみにへんかした"
	prompt
	text "まほうつかい あくま はパワ-アップ"
	line "てんし はパワ-ダウン"
	prompt
	done

Text_14cdd:
	text "ブラック·ホ-ルをつかぅた"
	prompt
	text "フィ-ルドのモンスタ-は すべて"
	line "きえさぅてしまう"
	prompt
	done

Text_14d06:
	text "サンダ-·ボルトをつかぅた"
	prompt
	text "てきのフィ-ルドモンスタ-は"
	line "きえさぅてしまう"
	prompt
	done

Text_14d2d:
	text "モウヤンのカレ-をつかぅた"
	line "ライフポイントが かいふく"
	prompt
	done

Text_14d4a:
	text "レッドポ-ションをつかぅた"
	line "ライフポイントが かいふく"
	prompt
	done

Text_14d67:
	text "ゴブりンのひやくをつかぅた"
	line "ライフポイントが かいふく"
	prompt
	done

Text_14d84:
	text "てんしのいきちをつかぅた"
	line "ライフポイントが かいふくした"
	prompt
	done

Text_14da2:
	text "ちりょうのかみ ディアン·ケトを"
	line "つかぅた"
	prompt
	text "ライフポイントが かいふくした"
	prompt
	done

Text_14dc9:
	text "ひのこ をつかぅた"
	line "あいてのライフポイントにダメ-ジ"
	prompt
	done

Text_14de5:
	text "ファイア-ボ-ル をつかぅた"
	line "あいてのライフポイントにダメ-ジ"
	prompt
	done

Text_14e06:
	text "ひあぶりのけい をつかぅた"
	line "あいてのライフポイントにダメ-ジ"
	prompt
	done

Text_14e26:
	text "ちゅうやのおおかじ をつかぅた"
	line "あいてのライフポイントにダメ-ジ"
	prompt
	done

Text_14e48:
	text "かえんじごく をつかぅた"
	line "あいてのライフポイントにダメ-ジ"
	prompt
	done

Text_14e67:
	text "ひかりのごふうけん をつかぅた"
	line "あいては 3タ-ンこうげきできない"
	prompt
	text "フィ-ルドにいるモンスタ-は"
	line "ひかりによぅてはんべつされた"
	prompt
	done

Text_14ea8:
	text "ろくぼうせいのじゅばく をつかぅた"
	prompt
	text "フィ-ルドにいるてきのモンスタ-は"
	line "パワ-ダウン"
	prompt
	done

Text_14ed4:
	text "やみをかきけすひかり をつかぅた"
	prompt
	text "フィ-ルドにいるモンスタ-は"
	line "ひかりによぅてはんべつされた"
	prompt
	done

Text_14f04:
	text "つうしんエラ- バッファがあふれました"
	prompt
	done

Text_14f19:
	text "<B5>と <B6>は"
	prompt
	text "ゆうごうして <B7>になぅた"
	prompt
	done

Text_14f2d:
	text "<B5>をつかぅた"
	prompt
	text "<B6>はパワ-アップした"
	prompt
	done

Text_14f40:
	text "<B5>をつかぅた"
	prompt
	text "しかし パワ-アップはできなかぅた"
	prompt
	done

Func_14f5a:
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and PAD_A | PAD_B
	jr z, .no_a_or_b_btns
	ld c, $08
.asm_14f69
	dec c
	rlca
	jr nc, .asm_14f69
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.no_a_or_b_btns
	ld a, $01
	ld [wcf49], a
	ld a, d
	cp $02
	jr nz, .asm_14f83
	ld a, $00
	ld [wcf48], a
.asm_14f83
	pop hl
	pop de
	pop bc
	pop af
	ret

.data
	db $02, $02, $00, $00, $00, $00, $00, $00

Func_14f90:
	push af
	ld a, $04
	ld [wcf48], a
	ld a, $01
	ld [wcf4d], a
	pop af
	ret

Func_14f9d:
	push af
	ld a, $02
	ld [wcf48], a
	ld a, $01
	ld [wcf4d], a
	pop af
	ret

Func_14faa:
	push af
	ld a, $05
	ld [wcf48], a
	pop af
	ret

Func_14fb2:
	call Func_14fb9
	call Func_14fe1
	ret

Func_14fb9:
	push af
	push bc
	push hl
	ld a, [wcf4d]
	dec a
	ld [wcf4d], a
	jr nz, .asm_14fd8
	ld a, $14
	ld [wcf4d], a
	ld b, $00
	ld a, [wcf48]
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	ld [wcf48], a
.asm_14fd8
	pop hl
	pop bc
	pop af
	ret

.data
	db $00, $02, $01, $04, $03

Func_14fe1:
	call Func_14fe8
	call Func_146ef
	ret

Func_14fe8:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wcf48]
	ld c, a
	dec c
	ld hl, .data
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wcf45]
	ld c, a
	ld hl, wcf2f
	add hl, bc
	ld a, [de]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

.data
	db $78, $00, $79, $00

Func_1500c:
	push af
	call Func_2b68
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_ItsYourTurn
	ld [wDuelMsg], a
	call Func_145fd
	pop af
	ret

Func_1501f:
	push af
	call Func_2b68
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_ItsTheComputersTurn
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

Func_15032:
	push af
	ld a, [wcdff]
	cp $02
	jr nz, .asm_15047
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_YourOpponentIsCurrentlySearching
	ld [wDuelMsg], a
	call Func_145e8
.asm_15047
	pop af
	ret

; unreferenced
Func_15049:
	push af
	ld a, $01
	ld [wcf18], a
	ldmsg a, Text_149f4
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

Func_15059:
	push af
	push bc
	ld a, FALSE
	ld [wcf18], a
	ldmsg a, Text_TheTradeHasEnded
	ld [wDuelMsg], a
	call ShowDuelMessage
	call Func_2c4a
	call Func_14201
	call IsValidCard
	cp TRUE
	jr nz, .asm_15087
	ld e, $04
	call Func_2cf2
	ld a, FALSE
	ld [wcf18], a
	ldmsg a, Text_CommunicationHasBeenEstablished
	ld [wDuelMsg], a
	call ShowDuelMessage
.asm_15087
	pop bc
	pop af
	ret

; unreferenced
Func_1508a:
	push af
	ld a, $00
	ld [wcf18], a
	ldmsg a, Text_149ff
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

Func_1509a:
	push af
	call Func_2b68
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_TurnFinished
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

Func_150ad:
	push af
	ld a, FALSE
	ld [wcf18], a
	ldmsg a, Text_CommunicationError
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

Func_150bd:
	push af
	ld a, FALSE
	ld [wcf18], a
	ldmsg a, Text_TheDeckIsNotComplete
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

; unreferenced
Func_150cd:
	push af
	ld a, $01
	ld [wcf18], a
	ldmsg a, Text_14f04
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop af
	ret

Func_150dd:
	push af
	push bc
	push de
	push hl
	ld e, a
	ld a, TRUE
	ld [wcf18], a
	ld d, $00
	ld hl, .DuelMessages
	add hl, de
	ld a, [hl]
	ld [wDuelMsg], a
	call Func_2c4a
	sla e
	ld hl, .data_1
	add hl, de
	push de
	ld e, $04
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call Func_2cf2
	pop de
	ld hl, .data_2
	add hl, de
	ld e, $04
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call Func_2d01
	call ShowDuelMessage
	pop hl
	pop de
	pop bc
	pop af
	ret

.DuelMessages:
	msg Text_14a8a
	msg Text_14a96
	msg Text_14aa2
	msg Text_14aae

.data_1
	db $15, $01
	db $37, $00
	db $47, $00
	db $38, $00

.data_2
	db $37, $00
	db $47, $00
	db $38, $00
	db $42, $00

Func_1512c::
	push af
	push bc
	push hl
	ld c, a
	ld a, TRUE
	ld [wcf18], a
	ld b, $00
	ld hl, .DuelMessages
	add hl, bc
	ld a, [hl]
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop hl
	pop bc
	pop af
	ret

.DuelMessages:
	msg Text_14aba
	msg Text_14ad5

Func_15148:
	push af
	push bc
	push hl
	ld c, a
	ld a, TRUE
	ld [wcf18], a
	ld b, $00
	ld hl, .DuelMessages
	add hl, bc
	ld a, [hl]
	ld [wDuelMsg], a
	call ShowDuelMessage
	pop hl
	pop bc
	pop af
	ret

.DuelMessages:
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14b20
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14aec
	msg Text_14b3d
	msg Text_14b6f
	msg Text_14bad
	msg Text_14be9
	msg Text_14c23
	msg Text_14c5c
	msg Text_14ca3
	msg Text_14cdd
	msg Text_14d06
	msg Text_14d2d
	msg Text_14d4a
	msg Text_14d67
	msg Text_14d84
	msg Text_14da2
	msg Text_14dc9
	msg Text_14de5
	msg Text_14e06
	msg Text_14e26
	msg Text_14e48
	msg Text_14e67
	msg Text_14ea8
	msg Text_14ed4

Func_15194:
	push af
	push bc
	push de
	push hl
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_14f19
	ld [wDuelMsg], a
	call Func_2c4a
	ld e, $04
	ld a, [wMaterial1CardID + 0]
	ld c, a
	ld a, [wMaterial1CardID + 1]
	ld b, a
	call Func_2cf2
	ld e, $04
	ld a, [wMaterial2CardID + 0]
	ld c, a
	ld a, [wMaterial2CardID + 1]
	ld b, a
	call Func_2d01
	ld e, $04
	ld a, [wFusionCardID + 0]
	ld c, a
	ld a, [wFusionCardID + 1]
	ld b, a
	call Func_2d10
	call IsValidCard
	cp TRUE
	jr nz, .asm_151d6
	call ShowDuelMessage
.asm_151d6
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_151db:
	push af
	push bc
	push de
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_14f2d
	ld [wDuelMsg], a
	call Func_2c4a
	ld e, $04
	call Func_2cf2
	ld e, $04
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call Func_2d01
	call ShowDuelMessage
	pop de
	pop bc
	pop af
	ret

Func_15204:
	push af
	push bc
	push de
	ld a, TRUE
	ld [wcf18], a
	ldmsg a, Text_14b09
	ld [wDuelMsg], a
	call Func_2c4a
	ld e, $04
	ld bc, ELEGANT_EGOTIST
	call Func_2cf2
	ld e, $04
	ld bc, HARPIE_LADY
	call Func_2d01
	ld e, $04
	ld bc, HARPIE_LADY_SISTER
	call Func_2d10
	call ShowDuelMessage
	pop de
	pop bc
	pop af
	ret

HandleEmptyHandWinCondition:
	push af
	; does player have any hand cards?
	farcall PlayerHasAnyHandCards
	cp FALSE
	jr nz, .done
	; no, which duelist has less LP?
	call PlayerHasSameOrMoreLPThanOpponent
	cp TRUE
	jr nz, .player_has_less_lp
	; player LP >= opp LP
	call SetDuelStatus_PlayerWin
	jr .done
.player_has_less_lp
	; player LP < opp LP
	call SetDuelStatus_PlayerLoss
.done
	pop af
	ret

PlayerHasSameOrMoreLPThanOpponent:
	push bc
	push de
	ld a, [wPlayerLP + 0]
	ld e, a
	ld a, [wPlayerLP + 1]
	ld d, a
	ld a, [wOppLP + 0]
	ld c, a
	ld a, [wOppLP + 1]
	ld b, a
	call Func_13bb
	ld d, FALSE
	ld a, e
	cp $00
	jr z, .asm_1526a
	ld d, TRUE
.asm_1526a
	ld a, d
	pop de
	pop bc
	ret

; unreferenced
Func_1526e:
	call Func_15272
	ret

Func_15272:
	push af
	ld a, $00
	ld [wcf97], a
	pop af
	ret

; unreferenced
Func_1527a:
	push af
	ld a, $01
	ld [wcf97], a
	pop af
	ret

; unreferenced
Func_15282:
	push af
	ld a, $02
	ld [wcf97], a
	pop af
	ret

; moves all cards from the player's deck to the trunk
EmptyPlayersDeck:
	push af
	push bc
	farcall GetPlayerDeckCardCount
	dec a
	ld c, a
.loop
	ld a, c
	cp -1
	jr z, .done
	ld a, c
	farcall SetPlayerDeckIndex
	farcall Func_5bd1
	dec c
	jr .loop
.done
	pop bc
	pop af
	ret

; unreferenced
; auto-builds a deck with high atk monsters
; owned by the player, maybe used for debugging
AutoBuildPlayerDeck:
	call Func_15272
	call EmptyPlayersDeck
	call .AutoBuild
	farcall Func_c3e3
	farcall Func_c25e
	farcall Func_c786
	ret

.AutoBuild:
	push af
	push de

	ld a, [wcf97]
	cp $00
	jr nz, .asm_152c9
	; high attack
	ld e, 30
.asm_152c1
	call AddMonsterWithHighAttackToPlayerDeck
	dec e
	jr nz, .asm_152c1
	jr .done

.asm_152c9
	cp $01
	jr nz, .asm_152df
	; mixed attack/defense
	ld e, 15
.asm_152cf
	call AddMonsterWithHighAttackToPlayerDeck
	dec e
	jr nz, .asm_152cf
	ld e, 15
.asm_152d7
	call AddMonsterWithHighDefenseToPlayerDeck
	dec e
	jr nz, .asm_152d7
	jr .done

.asm_152df
	; high defense
	ld e, 30
.asm_152e1
	call AddMonsterWithHighDefenseToPlayerDeck
	dec e
	jr nz, .asm_152e1
.done
	pop de
	pop af
	ret

AddMonsterWithHighAttackToPlayerDeck:
	push af
	push bc
	call GenerateRandomMonsterCard
	call FindMonsterWithHighAttack
	farcall Func_5af2
	farcall Func_5b92
	pop bc
	pop af
	ret

AddMonsterWithHighDefenseToPlayerDeck:
	push af
	push bc
	call GenerateRandomMonsterCard
	call FindMonsterWithHighDefense
	farcall Func_5af2
	farcall Func_5b92
	pop bc
	pop af
	ret

GenerateRandomMonsterCard:
	push af
	push de
	ld a, 0
	ld [wRandRangeStart], a
	ld a, 255
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld e, a
	call RandomRange
	ld a, [wRandNum]
	ld d, a
	; de = random number in [0, 65535]
	ld bc, MAGIC_CARDS
	call MultiplyQ16
	ld b, d
	ld c, e
	pop de
	pop af
	ret

; expectation: given a starting monster card in bc
; check the next 10 cards and choose the monster card
; with the highest attack
; reality: the maximum attack value is found,
; but the output monster card is the last one checked
FindMonsterWithHighAttack:
	push af
	push de
	push hl
	ld de, 0
	ld l, 0
.loop
	ld a, l
	cp 10
	jr nc, .break
	inc bc
	ld a, b
	cp HIGH(MAGIC_CARDS)
	jr nz, .monster_card
	ld a, c
	cp LOW(MAGIC_CARDS)
	jr c, .monster_card
	; wrap back to beginning
	ld bc, B_EYE_WHITE_DRAGON
.monster_card
	farcall Func_5af2
	farcall GetCardCountInTrunk
	; does player own it already?
	cp NOT_OWNED
	jr z, .loop
	; yes, is the count 0?
	cp 0
	jr z, .loop
	; count is non-zero
	inc l
	push bc
	push de
	farcall LoadCardData
	ld a, [wLoadedCardAtk + 0]
	ld c, a
	ld a, [wLoadedCardAtk + 1]
	ld b, a
	push bc
	call Func_13bb
	ld a, e
	pop bc
	pop de
	cp $00
	jr nz, .next
	ld d, b
	ld e, c
.next
	pop bc
	jr .loop
.break
	pop hl
	pop de
	pop af
	ret

; expectation: given a starting monster card in bc
; check the next 10 cards and choose the monster card
; with the highest defense
; reality: the maximum defense value is found,
; but the output monster card is the last one checked
FindMonsterWithHighDefense:
	push af
	push de
	push hl
	ld de, 0
	ld l, 0
.loop
	ld a, l
	cp 10
	jr nc, .break
	inc bc
	ld a, b
	cp HIGH(MAGIC_CARDS)
	jr nz, .asm_15397
	ld a, c
	cp LOW(MAGIC_CARDS)
	jr c, .asm_15397
	; wrap back to beginning
	ld bc, B_EYE_WHITE_DRAGON
.asm_15397
	farcall Func_5af2
	farcall GetCardCountInTrunk
	; does player own it already?
	cp NOT_OWNED
	jr z, .loop
	; yes, is the count 0?
	cp 0
	jr z, .loop
	; count is non-zero
	inc l
	push bc
	push de
	farcall LoadCardData
	ld a, [wLoadedCardDef + 0]
	ld c, a
	ld a, [wLoadedCardDef + 1]
	ld b, a
	push bc
	call Func_13bb
	ld a, e
	pop bc
	pop de
	cp $00
	jr nz, .next
	ld d, b
	ld e, c
.next
	pop bc
	jr .loop
.break
	pop hl
	pop de
	pop af
	ret
