	dw BANK(@)

	farcall_table_start
	farfunc Func_4068 ; $03
	farfunc Func_551f ; $05
	farfunc InitTrunk ; $07
	farfunc GetTrunkTotalCardCount ; $09
	farfunc Func_5b92 ; $0b
	farfunc Func_56e0 ; $0d
	farfunc Func_5c86 ; $0f
	farfunc Func_5af2 ; $11
	farfunc GetCardCountInTrunk ; $13
	farfunc Func_5bb8 ; $15
	farfunc Func_5bd1 ; $17
	farfunc Func_5c10 ; $19
	farfunc SetTextArg ; $1b
	farfunc SetTextLoadMode ; $1d
	farfunc LoadText ; $1f
	farfunc Func_5313 ; $21
	farfunc Func_5eb3 ; $23
	farfunc Func_5f37 ; $25
	farfunc Func_5f79 ; $27
	farfunc Func_6008 ; $29
	farfunc Func_6015 ; $2b
	farfunc Func_5ff2 ; $2d
	farfunc LoadCharacterGfx ; $2f
	farfunc LoadCardGfx ; $31
	farfunc Func_5ffb ; $33
	farfunc Func_6022 ; $35
	farfunc Func_602b ; $37
	farfunc Func_6034 ; $39
	farfunc Func_603d ; $3b
	farfunc Func_6046 ; $3d
	farfunc Func_6101 ; $3f
	farfunc GiveCard ; $41
	farfunc SetCardAsSeen ; $43
	farfunc Func_62c2 ; $45
	farfunc Func_63d6 ; $47
	farfunc Func_6595 ; $49
	farfunc Func_65c4 ; $4b
	farfunc Func_65f3 ; $4d
	farfunc Func_6804 ; $4f
	farfunc Func_6622 ; $51
	farfunc Func_6736 ; $53
	farfunc Func_6a6e ; $55
	farfunc Func_689e ; $57
	farfunc Func_69b5 ; $59
	farfunc Func_6c67 ; $5b
	farfunc Func_6a97 ; $5d
	farfunc Func_6bae ; $5f
	farfunc Func_6e41 ; $61
	farfunc Func_6c90 ; $63
	farfunc Func_6da7 ; $65
	farfunc Func_64b5 ; $67

Func_4068:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_40a6
	call SetScreenConfig
	farcall Func_cd9a
	farcall Func_2801e
	farcall LoadFontToVTiles2
	call DrawDuelistHands
	call PrintPlayerLP
	call PrintOpponentLP
	call Func_4164
	call DrawPlayerField
	call DrawOpponentField
	call Func_41eb
	call Func_42a7
	call Func_42ae
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	pop hl
	pop af
	ret

ScreenConfig_40a6:
	db LCDC_BG_ON | LCDC_OBJ_OFF | LCDC_OBJ_16 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_ON | LCDC_WIN_9C00 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 143 ; WY
	db   0 + WX_OFS ; WX

DrawDuelistHands:
	push af
	push bc
	push de
	push hl

	hlbgcoord 10, 16
	ld d, $00
	ld e, HAND_SIZE
.asm_40bb
	ld b, d
	ld c, CARD_LOCATION_PLAYER_HAND
	call SetTargetCard
	call LoadTargetCard
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	inc d
	dec e
	jr nz, .asm_40bb

	hlbgcoord 10, 0
	ld d, $04
	ld e, HAND_SIZE
.asm_40d7
	ld b, d
	ld c, CARD_LOCATION_OPP_HAND
	call SetTargetCard
	call LoadTargetCard
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	dec d
	dec e
	jr nz, .asm_40d7

	pop hl
	pop de
	pop bc
	pop af
	ret

Func_40f1:
	push af
	push bc
	push hl
	ld bc, $20
	cp $d0
	jr z, .asm_4107
	ld [hli], a
	inc a
	inc a
	ld [hld], a
	dec a
	add hl, bc
	ld [hli], a
	inc a
	inc a
	ld [hl], a
	jr .asm_410c
.asm_4107
	ld [hli], a
	ld [hld], a
	add hl, bc
	ld [hli], a
	ld [hl], a
.asm_410c
	pop hl
	pop bc
	pop af
	ret

; prints player's LP at coordinates (5, 16)
PrintPlayerLP:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wPlayerLP + 0]
	ld c, a
	ld a, [wPlayerLP + 1]
	ld b, a
	call SetTextArg
	call LoadText
	hlbgcoord 5, 16
	ld de, wTextBuffer
	ld c, 4 ; digits
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

; prints opponent's LP at coordinates (5, 1)
PrintOpponentLP:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wOppLP + 0]
	ld c, a
	ld a, [wOppLP + 1]
	ld b, a
	call SetTextArg
	call LoadText
	hlbgcoord 5, 1
	ld de, wTextBuffer
	ld c, 4 ; digits
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_4164:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wActiveField]
	ld c, a
	call SetTextArg
	ld a, TEXTLOAD_FIELD
	call SetTextLoadMode
	call LoadText
	call Func_1114
	hlbgcoord 1, 3
	ld de, wTextBuffer
	ld c, $08
.loop_chars
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
	jr nz, .loop_chars

	pop hl
	pop de
	pop bc
	pop af
	ret

DrawPlayerField:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 14
	ld d, $00
	ld e, FIELD_SIZE
.asm_41ac
	ld b, d
	ld c, CARD_LOCATION_PLAYER_FIELD
	call SetTargetCard
	call LoadTargetCard
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	inc d
	dec e
	jr nz, .asm_41ac
	pop hl
	pop de
	pop bc
	pop af
	ret

DrawOpponentField:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 2
	ld d, $04
	ld e, FIELD_SIZE
.asm_41d1
	ld b, d
	ld c, CARD_LOCATION_OPP_FIELD
	call SetTargetCard
	call LoadTargetCard
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	dec d
	dec e
	jr nz, .asm_41d1
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_41eb:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles0 tile $50
	ld de, Gfx_4207
	ld b, 12 ; tiles, should be 10
.loop_tiles
	ld c, TILE_SIZE
.loop_copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy
	dec b
	jr nz, .loop_tiles
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_4207: INCBIN "gfx/gfx_4207.2bpp"

Func_42a7:
	call Func_12d2
	call CopyOAMDirect
	ret

Func_42ae:
	push af
	ld a, [wcdff]
	cp $02
	jr nz, .asm_42c3
	ld a, 0 + WX_OFS
	ldh [rWX], a
	ld a, 103
	ldh [rWY], a
	ld hl, rLCDC
	res B_LCDC_OBJS, [hl]
.asm_42c3
	pop af
	ret

; loads bc into wTextArg
SetTextArg::
	push af
	ld a, c
	ld [wTextArg + 0], a
	ld a, b
	ld [wTextArg + 1], a
	pop af
	ret

; input:
; - a = TEXTLOAD_* constant
SetTextLoadMode::
	ld [wTextLoadMode], a
	ret

ClearTextBuffer:
	push af
	push bc
	push de
	push hl
	ld hl, wTextBuffer
	xor a
	ld c, $14
.asm_42de
	ld [hli], a
	dec c
	jr nz, .asm_42de
	ld a, $00
	ld [wTextLength], a
	pop hl
	pop de
	pop bc
	pop af
	ret

; loads text according to wTextLoadMode and wTextArg
; text is output in wTextBuffer
LoadText::
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wTextLoadMode]
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw LoadText_Number ; TEXTLOAD_NUMBER
	dw LoadText_Field ; TEXTLOAD_FIELD
	dw LoadText_CardName ; TEXTLOAD_CARD_NAME
	dw Func_52a5 ; TEXTLOAD_06
	dw Func_52d8 ; TEXTLOAD_08
	dw Func_435c ; TEXTLOAD_0A
	dw Func_5324 ; TEXTLOAD_0C
	dw LoadText_CardType ; TEXTLOAD_CARD_TYPE
	dw Func_5436 ; TEXTLOAD_10
	dw Func_54ef ; TEXTLOAD_12

; input:
; - wTextArg = 4-digit number
; output:
; - wTextBuffer = digit tiles to represent number
; - [wTextLength] = 4
LoadText_Number:
	push af
	push bc
	push de
	push hl
	call ClearTextBuffer
	ld hl, wTextBuffer
	ld de, wTextArg + 1
	ld b, $01
	ld c, 2 ; bytes
.loop_bytes
	ld a, [de]
	push de
	ld d, 2 ; nybbles
.loop_nybbles
	swap a
	push af
	and $0f
	jr z, .zero_digit
	add '0'
	ld [hl], a
	inc b
	jr .next_nybble
.zero_digit
	; did we already have a non-zero digit?
	ld a, b
	cp $01
	jr z, .next_nybble
	; yes, output '0'
	ld [hl], '0'
.next_nybble
	inc l
	pop af
	dec d
	jr nz, .loop_nybbles
	pop de
	dec de
	dec c
	jr nz, .loop_bytes

	; done processing each digit
	; is it zero?
	dec b
	jr nz, .done
	; yes, then no digits were output
	; write a single '0' digit
	dec l
	ld [hl], '0'

.done
	ld a, 4
	ld [wTextLength], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_435c:
	push af
	push bc
	push hl
	call LoadText_Number
	ld hl, wTextBuffer
	ld c, 4
.loop_digits
	ld a, [hl]
	cp ' '
	jr z, .asm_4371
	add $c5
	ld [hl], a
	jr .next
.asm_4371
	ld [hl], $80
.next
	inc hl
	dec c
	jr nz, .loop_digits
	pop hl
	pop bc
	pop af
	ret

; input:
; - [wTextArg] = FIELD_* constant
; output:
; - wTextBuffer = name of field
LoadText_Field:
	push af
	push bc
	push de
	push hl
	ld de, .Texts
	ld h, $00
	ld a, [wTextArg + 0]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_4391
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_4391
	pop hl
	pop de
	pop bc
	pop af
	ret

.Texts:
	text " かくとうじょう"
	text "      もり"
	text "     こうや"
	text "      やま"
	text "    そうげん"
	text "      うみ"
	text "      やみ"

; input:
; - wTextArg = card ID
; output:
; - wTextBuffer = card name
; - [wTextLength] = length of text
LoadText_CardName:
	push af
	push bc
	push de
	push hl

	call ClearTextBuffer

	ld de, CardNamePointers
	ld a, [wTextArg + 0]
	ld l, a
	ld a, [wTextArg + 1]
	ld h, a
	add hl, hl ; *2
	ld b, h
	ld c, l
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push hl
	inc bc
	inc bc
	ld h, b
	ld l, c
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl

	; hl = pointer to text entry
	; bc = pointer to end of text

	ld de, wTextBuffer
	ld b, $00
.loop_copy
	ld a, c
	cp l
	jr z, .break
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	jr .loop_copy
.break
	ld a, b
	ld [wTextLength], a
	pop hl
	pop de
	pop bc
	pop af
	ret

INCLUDE "text/card_name_pointers.asm"
INCLUDE "text/card_names.asm"

Func_52a5:
	push af
	push bc
	push de
	push hl
	ld de, $52c8
	ld a, [wTextArg + 0]
	ld l, a
	ld a, [wTextArg + 1]
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_52bd
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_52bd
	pop hl
	pop de
	pop bc
	pop af
	ret

Text_52c8:
	text "  ディテイル "
	text "  フィ-ルド "

Func_52d8:
	push af
	push bc
	push de
	push hl
	ld de, $52c8
	ld a, [wTextArg + 0]
	ld l, a
	ld a, [wTextArg + 1]
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_52f0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_52f0
	pop hl
	pop de
	pop bc
	pop af
	ret

Text_52fb:
	text "        "
	text "    こうげき"
	text "    ぼうぎょ"

Func_5313:
	push af
	push bc
	push hl
	ld hl, wTextBuffer
	xor a
	ld c, $08
.asm_531c
	ld [hli], a
	dec c
	jr nz, .asm_531c
	pop hl
	pop bc
	pop af
	ret

Func_5324:
	push af
	push bc
	push de
	push hl
	ld hl, wTextBuffer
	ld de, wTextArg
	ld c, $02
.asm_5330
	push bc
	push hl
	ld a, [de]
	and $f0
	ld c, a
	swap c
	ld b, $00
	ld hl, $535d
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	ld [hli], a
	push hl
	ld a, [de]
	and $0f
	ld c, a
	ld b, $00
	ld hl, $535d
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	ld [hli], a
	pop bc
	inc de
	dec c
	jr nz, .asm_5330
	pop hl
	pop de
	pop bc
	pop af
	ret

Text_535d:
	text "0123456789"
	text "あいうえおか"

LoadText_CardType:
	push af
	push bc
	push de
	push hl
	ld de, $538e
	ld h, $00
	ld a, [wTextArg + 0]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_5383
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_5383
	pop hl
	pop de
	pop bc
	pop af
	ret

Text_538e:
	text "ドラゴン    "
	text "まほうつかい  "
	text "アンデット   "
	text "せんし     "
	text "じゅうせんし  "
	text "けもの     "
	text "ちょうじゅう  "
	text "あくま     "
	text "てんし     "
	text "こんちゅう   "
	text "きょうりゅう  "
	text "はちゅうるい  "
	text "さかな     "
	text "かいりゅう   "
	text "きかい     "
	text "いかずち    "
	text "みず      "
	text "ほのお     "
	text "がんせき    "
	text "しょくぶつ   "
	text "まほう     "

Func_5436:
	push af
	push bc
	push de
	push hl
	ld de, $5457
	ld h, $00
	ld a, [wTextArg + 0]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_544c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_544c
	pop hl
	pop de
	pop bc
	pop af
	ret

Text_5457:
	text "インセクタ-はが"
	text "くじゃくまい  "
	text "りゅうざき   "
	text "カジキりょうた "
	text "かいばせと   "
	text "かいばモクバ  "
	text "ふくわじゅつし "
	text "やみつかい   "
	text "キ-ス     "
	text "むとうゆうぎ  "
	text "ほんだヒロト  "
	text "じょうのうち  "
	text "ばくらりょう  "
	text "シモン·ム-ラン"
	text "<ぺ>ガサス    "
	text "やみ·ゆうぎ  "
	text "つうしんたいせん"
	text "たいせんにんずう"
	text "なまえ     "

Func_54ef:
	push af
	push bc
	push de
	push hl

	call ClearTextBuffer

	ld de, wTextBuffer
	ld hl, wcf99
	ld c, $08
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy

	; count text length
	ld hl, wTextBuffer
	lb de, 0, 0
	ld c, $08
.loop_count
	inc e
	ld a, [hli]
	cp ' '
	jr z, .space
	ld d, e
.space
	dec c
	jr nz, .loop_count
	ld a, d
	ld [wTextLength], a

	pop hl
	pop de
	pop bc
	pop af
	ret

Func_551f:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_554b
	call SetScreenConfig
	farcall LoadFontToVTiles2
	farcall Func_28392
	call Func_5555
	call Func_558a
	call Func_55de
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	call Func_2ae4
	pop hl
	pop af
	ret

ScreenConfig_554b:
	db LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 144 ; WY
	db 159 + WX_OFS ; WX

Func_5555:
	call ClearOAM
	call Func_581f
	call Func_5562
	call CopyOAMDirect
	ret

Func_5562:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_557a
	ld hl, vTiles0
	ld c, 2 * TILE_1BPP_SIZE
.asm_556e
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_556e
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_557a: INCBIN "gfx/gfx_557a.1bpp"

Func_558a:
	push af
	push bc
	push hl
	hlbgcoord 12, 1
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wcad8]
	add $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	inc hl
	ld a, [wcad9]
	add $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_55de:
	push af
	push bc
	push de
	push hl
	call Func_58a3
	ld a, [wcada + 0]
	ld [wcad2 + 0], a
	ld a, [wcada + 1]
	ld [wcad2 + 1], a
	ld d, $05
	ld a, [wcad8]
	ld c, a
	ld a, [wcad9]
	cp c
	jr nz, .asm_5602
	ld a, [wcad7]
	ld d, a
	inc d
.asm_5602
	ld e, $00
.asm_5604
	ld a, e
	cp d
	jr nc, .asm_5625
	ld a, l
	call Func_562a
	call Func_566b
	call Func_56b6
	inc e
	ld a, [wcad2 + 0]
	add $01
	ld [wcad2 + 0], a
	ld a, [wcad2 + 1]
	adc $00
	ld [wcad2 + 1], a
	jr .asm_5604
.asm_5625
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_562a:
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
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wcad2 + 0]
	add $01
	ld [wHexNumber + 0], a
	ld a, [wcad2 + 1]
	adc $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_566b:
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
	ld a, [wcad2 + 0]
	ld c, a
	ld a, [wcad2 + 1]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, $08
.asm_5690
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_5690
	ld de, $18
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_56a5
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
	ld [hli], a
	dec c
	jr nz, .asm_56a5
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_56b6:
	push af
	push bc
	push de
	push hl
	ld d, $00
	swap e
	sla e
	sla e
	rl d
	hlbgcoord 15, 3
	add hl, de
	ld a, [wcad2 + 0]
	ld c, a
	ld a, [wcad2 + 1]
	ld b, a
	call Func_1542
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_56e0:
	push af
	ld a, TRUE
	ld [wcad4], a
	ld a, $00
	ld [wcad5], a
	ld a, $00
	ld [wcad6], a
	ld a, $04
	ld [wcad7], a
	ld a, $00
	ld [wcad8], a
	call PlayerOwnsAnySecretCard
	cp TRUE
	jr nz, .no_secret_cards
	ld a, $48
	ld [wcad9], a
	jr .asm_570d
.no_secret_cards
	ld a, $45
	ld [wcad9], a
.asm_570d
	pop af
	ret

Func_570f:
	push af
	push bc
	ld a, [wcad4]
	ld c, a
	ld a, c
	cp TRUE
	jr nz, .asm_5737
	call Func_2ae4
	ld a, FALSE
	ld [wcad4], a
	ld a, $00
	ld [wcad6], a
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	jr .asm_573a
.asm_5737
	call Func_5d76
.asm_573a
	pop bc
	pop af
	ret

Func_573d:
	push af
	call Func_2ad9
	ld a, TRUE
	ld [wcad4], a
	pop af
	ret

Func_5748:
	push af
	push bc
	ld a, [wcad4]
	cp TRUE
	jr nz, .asm_5779
	ld a, [wcad9]
	ld c, a
	ld a, [wcad8]
	cp c
	jr nz, .asm_576b
	ld a, [wcad7]
	ld b, a
	ld a, [wcad5]
	cp b
	jr z, .asm_5769
	inc a
	call Func_2aef
.asm_5769
	jr .asm_5776
.asm_576b
	ld a, [wcad5]
	cp $04
	jr z, .asm_5776
	inc a
	call Func_2aef
.asm_5776
	ld [wcad5], a
.asm_5779
	ld a, [wcad4]
	cp FALSE
	jr nz, .asm_578e
	ld a, [wcad6]
	cp $00
	jr nz, .asm_578b
	inc a
	call Func_2aef
.asm_578b
	ld [wcad6], a
.asm_578e
	pop bc
	pop af
	ret

Func_5791:
	push af
	ld a, [wcad4]
	cp TRUE
	jr nz, .asm_57a7
	ld a, [wcad5]
	cp $00
	jr z, .asm_57a4
	dec a
	call Func_2aef
.asm_57a4
	ld [wcad5], a
.asm_57a7
	ld a, [wcad4]
	cp FALSE
	jr nz, .asm_57bc
	ld a, [wcad6]
	cp $01
	jr nz, .asm_57b9
	dec a
	call Func_2aef
.asm_57b9
	ld [wcad6], a
.asm_57bc
	pop af
	ret

Func_57be:
	push af
	push bc
	push de
	ld a, [wcad4]
	cp TRUE
	jr nz, .asm_57fa
	ld a, [wcad9]
	ld c, a
	ld a, [wcad8]
	cp c
	jr z, .asm_57fa
	inc a
	ld [wcad8], a
	call Func_2aef
	cp c
	jr nz, .asm_57ea
	ld a, [wcad7]
	ld d, a
	ld a, [wcad5]
	cp d
	jr c, .asm_57ea
	ld a, d
	ld [wcad5], a
.asm_57ea
	ld e, $05
	ld a, [wcad8]
	cp c
	jr nz, .asm_57f7
	ld a, [wcad7]
	ld e, a
	inc e
.asm_57f7
	call Func_58bd
.asm_57fa
	pop de
	pop bc
	pop af
	ret

Func_57fe:
	push af
	push bc
	push de
	ld a, [wcad4]
	cp TRUE
	jr nz, .asm_581b
	ld a, [wcad8]
	cp $00
	jr z, .asm_581b
	dec a
	ld [wcad8], a
	call Func_2aef
	ld e, $05
	call Func_58bd
.asm_581b
	pop de
	pop bc
	pop af
	ret

Func_581f:
	push af
	push bc
	push de
	push hl
	ld a, [wcad4]
	cp TRUE
	jr nz, .asm_584a
	ld c, $00
	ld a, $ff
	ld d, $10
	call Func_123c
	ld c, $01
	ld a, $ff
	ld d, $10
	call Func_123c
	ld bc, $2
	ld a, [wcad5]
	call Func_588d
	ld d, $10
	call Func_123c
.asm_584a
	ld a, [wcad4]
	cp FALSE
	jr nz, .asm_5888
	ld c, $00
	ld a, $ff
	ld d, $10
	call Func_123c
	ld bc, $1
	ld a, [wcad6]
	cp $02
	jr z, .asm_5870
	add $05
	call Func_588d
	ld d, $10
	call Func_123c
	jr .asm_587a
.asm_5870
	ld a, $05
	call Func_588d
	ld d, $65
	call Func_123c
.asm_587a
	ld bc, $102
	ld a, [wcad5]
	call Func_588d
	ld d, $10
	call Func_123c
.asm_5888
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_588d:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.data
	db $28, $38, $48, $58, $68, $78, $88, $98, $a8

Func_58a3:
	push af
	push bc
	push de
	push hl
	ld a, [wcad8]
	ld e, a
	ld b, $05
	call BTimesE
	ld a, l
	ld [wcada + 0], a
	ld a, h
	ld [wcada + 1], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_58bd:
	push af
	push bc
	push de
	push hl
	call Func_5a3a
	call Func_58a3
	bcbgcoord 0, 2
	ld d, e
	ld e, $00
.asm_58cd
	ld a, e
	cp d
	jr z, .asm_5911
	ld a, e
	and $01
	jr z, .asm_58db
	ld a, VBLANK_06
	call SetPendingVBlankMode
.asm_58db
	call AddWordToVBlankStruct
	call Func_595a
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	call Func_59a0
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wcada + 0]
	add $01
	ld [wcada + 0], a
	ld a, [wcada + 1]
	adc $00
	ld [wcada + 1], a
	ld a, e
	and $01
	jr nz, .asm_590e
	call RequestVBlankMode
	call WaitForVBlank
.asm_590e
	inc e
	jr .asm_58cd
.asm_5911
	ld e, d
.asm_5912
	ld a, e
	cp $05
	jr z, .asm_5955
	ld a, e
	and $01
	jr z, .asm_5921
	ld a, VBLANK_06
	call SetPendingVBlankMode
.asm_5921
	call AddWordToVBlankStruct
	ld a, $80
	ld d, $14
.asm_5928
	call AddByteToVBlankStruct
	dec d
	jr nz, .asm_5928
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	ld a, $80
	ld d, $14
.asm_593b
	call AddByteToVBlankStruct
	dec d
	jr nz, .asm_593b
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	ld a, e
	and $01
	jr nz, .asm_5952
	call RequestVBlankMode
	call WaitForVBlank
.asm_5952
	inc e
	jr .asm_5912
.asm_5955
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_595a:
	push af
	push bc
	ld a, $80
	ld c, $06
.asm_5960
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_5960
	call Func_5976
	ld a, $80
	ld c, $06
.asm_596d
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_596d
	pop bc
	pop af
	ret

Func_5976:
	push af
	push bc
	push de
	push hl
	ld a, [wcada + 0]
	ld c, a
	ld a, [wcada + 1]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, $08
.asm_598d
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_598d
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_59a0:
	push af
	push bc
	ld a, $80
	call AddByteToVBlankStruct
	call AddByteToVBlankStruct
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wcada + 0]
	add $01
	ld [wHexNumber + 0], a
	ld a, [wcada + 1]
	adc $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $2]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $3]
	call AddByteToVBlankStruct
	ld a, $80
	call AddByteToVBlankStruct
	call Func_59e5
	pop bc
	pop af
	ret

Func_59e5:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_CARD_NAME
	call SetTextLoadMode
	ld a, [wcada + 0]
	ld c, a
	ld a, [wcada + 1]
	ld b, a
	call Func_1508
	call Func_111c
	ld hl, wTextBuffer
	ld c, $08
.asm_5a01
	ld a, [hli]
	call ProcessChar
	ld a, [wCharTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_5a01
	ld a, $80
	call AddByteToVBlankStruct
	ld a, [wcada + 0]
	ld c, a
	ld a, [wcada + 1]
	ld b, a
	call Func_1542
	ld a, [wTextBuffer + $2]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $3]
	call AddByteToVBlankStruct
	ld a, $80
	call AddByteToVBlankStruct
	call AddByteToVBlankStruct
	call AddByteToVBlankStruct
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_5a3a:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_06
	call SetPendingVBlankMode
	bcbgcoord 0, 1
	call AddWordToVBlankStruct
	ld a, $80
	call AddByteToVBlankStruct
	ld a, $10
	call AddByteToVBlankStruct
	ld a, $24
	call AddByteToVBlankStruct
	ld a, $38
	call AddByteToVBlankStruct
	ld a, $80
	ld c, $08
.asm_5a61
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_5a61
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wcad8]
	add $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $2]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $3]
	call AddByteToVBlankStruct
	ld a, $81
	call AddByteToVBlankStruct
	ld a, [wcad9]
	add $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $2]
	call AddByteToVBlankStruct
	ld a, [wTextBuffer + $3]
	call AddByteToVBlankStruct
	ld a, $80
	call AddByteToVBlankStruct
	pop hl
	pop de
	pop bc
	pop af
	ret

; initialises all wTrunk cards with NOT_OWNED
InitTrunk:
	push af
	push bc
	push hl
	ld hl, wTrunk
	ld a, NOT_OWNED
	ld b, HIGH(NUM_CARDS)
.loop_hi
	ld c, $00
.loop_write
	ld [hli], a
	dec c
	jr nz, .loop_write
	dec b
	jr nz, .loop_hi
	ld c, LOW(NUM_CARDS)
.loop_lo
	ld [hli], a
	dec c
	jr nz, .loop_lo

	ld a, LOW(B_EYE_WHITE_DRAGON)
	ld [wCardID_cae2 + 0], a
	ld a, HIGH(B_EYE_WHITE_DRAGON)
	ld [wCardID_cae2 + 1], a
	pop hl
	pop bc
	pop af
	ret

Func_5af2::
	push af
	call IsValidCard
	cp TRUE
	jr nz, .invalid
	ld a, c
	ld [wCardID_cae2 + 0], a
	ld a, b
	ld [wCardID_cae2 + 1], a
.invalid
	pop af
	ret

; gives card to player
GiveCard::
	push af
	push bc
	push hl
	call GetCardCountInTrunk
	cp NOT_OWNED
	jr nz, .owned
	; set its count to 0
	xor a
	call SetCardCountInTrunk
.owned
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	ld hl, wTrunk
	add hl, bc
	ld a, [hl]
	cp MAX_CARD_COUNT
	jr z, .maxed
	inc a
	ld [hl], a
.maxed
	pop hl
	pop bc
	pop af
	ret

Func_5b29:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	ld hl, wTrunk
	add hl, bc
	ld a, [hl]
	cp $00
	jr nz, .asm_5b43
	ld d, $01
	jr .asm_5b4d
.asm_5b43
	cp $ff
	jr nz, .asm_5b4b
	ld d, $01
	jr .asm_5b4d
.asm_5b4b
	dec a
	ld [hl], a
.asm_5b4d
	ld a, d
	pop hl
	pop de
	pop bc
	ret

; sets card in wCardID_cae2 as seen,
; that is, set its card count to 0 in wTrunk
SetCardAsSeen::
	push af
	push bc
	push hl
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	ld hl, wTrunk
	add hl, bc
	ld a, [hl]
	cp NOT_OWNED
	jr nz, .owns_card
	; doesn't own, mark with count of 0
	ld [hl], 0
.owns_card
	pop hl
	pop bc
	pop af
	ret

SetCardCountInTrunk:
	push bc
	push hl
	push af
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	ld hl, wTrunk
	add hl, bc
	pop af
	ld [hl], a
	pop hl
	pop bc
	ret

GetCardCountInTrunk::
	push bc
	push hl
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	ld hl, wTrunk
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_5b92:
	push bc
	push de
	ld e, $01
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	push bc
	farcall Func_c664
	ld a, b
	pop bc
	cp TRUE
	jr nz, .asm_5bb4
	call Func_5b29
	cp $00
	jr nz, .asm_5bb4
	farcall Func_c618
	ld e, $00
.asm_5bb4
	ld a, e
	pop de
	pop bc
	ret

Func_5bb8:
	push af
	push bc
	farcall Func_c664
	ld a, c
	cp $01
	jr z, .asm_5bce
	farcall GetPlayerDeckCard
	call Func_5af2
	call GiveCard
	farcall RemoveCardFromPlayerDeck
.asm_5bce
	pop bc
	pop af
	ret

; unreferenced
Func_5bd1:
	push af
	push bc
	farcall Func_c664
	ld a, c
	cp $00
	jr z, .asm_5be7
	farcall GetPlayerDeckCard
	call Func_5af2
	call GiveCard
	farcall RemoveCardFromPlayerDeck
.asm_5be7
	pop bc
	pop af
	ret

Func_5bea:
	push bc
	push de
	ld e, $01
	ld a, [wCardID_cae2 + 0]
	ld c, a
	ld a, [wCardID_cae2 + 1]
	ld b, a
	push bc
	farcall Func_e7a7
	ld a, b
	pop bc
	cp $00
	jr nz, .asm_5c0c
	call Func_5b29
	cp $00
	jr nz, .asm_5c0c
	farcall Func_e75b
	ld e, $00
.asm_5c0c
	ld a, e
	pop de
	pop bc
	ret

Func_5c10:
	push af
	push bc
	farcall Func_e7a7
	ld a, c
	cp $00
	jr z, .asm_5c26
	farcall Func_e747
	call Func_5af2
	call GiveCard
	farcall Func_e773
.asm_5c26
	pop bc
	pop af
	ret

; returns TRUE if player owns any of the Secret cards
PlayerOwnsAnySecretCard:
	push bc
	push de
	push hl
	ld d, FALSE
	ld bc, SECRET_CARDS
	ld e, NUM_SECRET_CARDS
.loop_secret_cards
	call Func_5af2
	call GetCardCountInTrunk
	cp NOT_OWNED
	jr z, .next_card
	ld d, TRUE
.next_card
	inc bc
	dec e
	jr nz, .loop_secret_cards
	ld a, d
	pop hl
	pop de
	pop bc
	ret

; outputs in bc the total number
; of cards in the player's Trunk
GetTrunkTotalCardCount:
	push af
	push de
	push hl
	ld hl, NULL
	ld bc, 0
	ld e, 200
.loop_cards_1
	call Func_5af2
	call GetCardCountInTrunk
	cp NOT_OWNED
	jr nz, .got_count_1
	; not owned count as 0
	xor a
.got_count_1
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	inc bc
	dec e
	jr nz, .loop_cards_1
	ld e, NUM_CARDS - 200
.loop_cards_2
	call Func_5af2
	call GetCardCountInTrunk
	cp NOT_OWNED
	jr nz, .got_count_2
	; not owned count as 0
	xor a
.got_count_2
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	inc bc
	dec e
	jr nz, .loop_cards_2
	ld b, h
	ld c, l
	pop hl
	pop de
	pop af
	ret

	ret ; stray ret

Func_5c86:
	push af
	push bc
	push de
	push hl
.loop
	call Func_5cb3
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
	dw Func_5ced
	dw Func_5cfa
	dw Func_5d0d
	dw Func_5d30
	dw Func_5d43
	dw Func_5d56
	dw Func_5d66

Func_5cb3:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_5ccc
	ld c, $08
.asm_5cc1
	dec c
	rlca
	jr nc, .asm_5cc1
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_5ccc
	ld a, [wcaa7]
	and $f0
	jr z, .asm_5ce0
	ld c, $08
.asm_5cd5
	dec c
	rlca
	jr nc, .asm_5cd5
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_5ce0
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $0c, $0a, $06, $08

Func_5ced:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5cfa:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_570f
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d0d:
	push bc
	push hl
	ld a, VBLANK_04
	call SetPendingVBlankMode
	ld b, $00
	ld a, [wcad4]
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	call Func_573d
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop bc
	ret

.data
	db $01, $00

Func_5d30:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_5791
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d43:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_5748
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d56:
	call Func_57fe
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d66:
	call Func_57be
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d76:
	push af
	ld a, [wcad6]
	cp $00
	jr nz, .asm_5d8f
	ld a, [wGameMode]
	cp GAMEMODE_TRADE
	jr z, .asm_5d8a
	call Func_5da0
	jr .asm_5d8d
.asm_5d8a
	call Func_5dde
.asm_5d8d
	jr .asm_5d9e
.asm_5d8f
	ld a, [wGameMode]
	cp GAMEMODE_TRADE
	jr z, .asm_5d9b
	call Func_5e1c
	jr .asm_5d9e
.asm_5d9b
	call Func_5e66
.asm_5d9e
	pop af
	ret

Func_5da0:
	push af
	push bc
	push hl
	ld a, [wcad5]
	ld c, a
	call Func_58a3
	ld a, [wcada + 0]
	add c
	ld c, a
	ld a, [wcada + 1]
	adc $00
	ld b, a
	call Func_5af2
	call GetCardCountInTrunk
	cp $ff
	jr z, .asm_5dd2
	farcall LoadCardData
	farcall Func_14036
	farcall Func_14185
	ld a, TRUE
	ld [wcad4], a
	call Func_551f
	jr .asm_5dda
.asm_5dd2
	call Func_2afa
	ld a, TRUE
	ld [wcad4], a
.asm_5dda
	pop hl
	pop bc
	pop af
	ret

Func_5dde:
	push af
	push bc
	push hl
	ld a, [wcad5]
	ld c, a
	call Func_58a3
	ld a, [wcada + 0]
	add c
	ld c, a
	ld a, [wcada + 1]
	adc $00
	ld b, a
	call Func_5af2
	call GetCardCountInTrunk
	cp $ff
	jr z, .asm_5e10
	farcall LoadCardData
	farcall Func_14036
	farcall Func_14185
	ld a, TRUE
	ld [wcad4], a
	call Func_6101
	jr .asm_5e18
.asm_5e10
	call Func_2afa
	ld a, TRUE
	ld [wcad4], a
.asm_5e18
	pop hl
	pop bc
	pop af
	ret

Func_5e1c:
	push af
	push bc
	push de
	push hl
	ld a, [wcad8]
	ld b, a
	ld e, $05
	call BTimesE
	ld a, [wcad5]
	add l
	ld c, a
	ld a, h
	adc $00
	ld b, a
	call Func_5af2
	call Func_5b92
	cp $00
	jr nz, .asm_5e41
	call Func_2ae4
	jr .asm_5e44
.asm_5e41
	call Func_2afa
.asm_5e44
	ld a, TRUE
	ld [wcad4], a
	ld a, $00
	ld [wcad6], a
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	ld e, $05
	call Func_58bd
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_5e66:
	push af
	push bc
	push de
	push hl
	call Func_2ae4
	ld a, [wcad8]
	ld b, a
	ld e, $05
	call BTimesE
	ld a, [wcad5]
	add l
	ld c, a
	ld a, h
	adc $00
	ld b, a
	call Func_5af2
	call Func_5bea
	cp $00
	jr nz, .asm_5e8e
	call Func_2ae4
	jr .asm_5e91
.asm_5e8e
	call Func_2afa
.asm_5e91
	ld a, TRUE
	ld [wcad4], a
	ld a, $00
	ld [wcad6], a
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	ld e, $05
	call Func_58bd
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_5eb3:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_1842
	ld a, [wLoadedCardID + 0]
	call Func_1842
	ld a, [wLoadedCardID + 1]
	call Func_1842
	call SetJobFlag
	lb bc, $cd, LOW(hDecompressJobFlags)
	dec b
	rla
	ld [$ff00+c], a
	ld bc, vTiles0
	ld e, $0a
.asm_5ed6
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	ld hl, $80
	add hl, bc
	ld b, h
	ld c, l
	call Func_f62
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_5ed6
	pop hl
	pop de
	pop bc
	pop af
	ret

LoadCardGfx:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_1842
	ld a, [wLoadedCardID + 0]
	call Func_1842
	ld a, [wLoadedCardID + 1]
	call Func_1842
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call ActivateJob
	db JOB_DECOMPRESS

	ld bc, vTiles1
	ld e, $0a
.asm_5f18
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	ld hl, $8 tiles
	add hl, bc
	ld b, h
	ld c, l
	call Func_f62
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_5f18
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_5f37:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_1842
	ld a, [wLoadedCardID + 0]
	call Func_1842
	ld a, [wLoadedCardID + 1]
	call Func_1842
	call SetJobFlag
	lb bc, $cd, LOW(hDecompressJobFlags)
	dec b
	rla
	ld [$ff00+c], a
	ld bc, vTiles1 tile $60
	ld e, $0a
.asm_5f5a
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	ld hl, $80
	add hl, bc
	ld b, h
	ld c, l
	call Func_f62
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_5f5a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_5f79:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_1842
	ld a, [wLoadedCardID + 0]
	call Func_1842
	ld a, [wLoadedCardID + 1]
	call Func_1842
	call SetJobFlag
	lb bc, $cd, LOW(hDecompressJobFlags)
	dec b
	rla
	ld [$ff00+c], a
	ld bc, vTiles2 tile $30
	ld e, $0a
.asm_5f9c
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	ld hl, $80
	add hl, bc
	ld b, h
	ld c, l
	call Func_f62
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_5f9c
	pop hl
	pop de
	pop bc
	pop af
	ret

; loads tiles that correspond to character in wNPCCharacter
LoadCharacterGfx:
	push af
	push bc
	push de
	push hl

	ld a, $01
	call Func_1842
	ld a, [wNPCCharacter]
	call Func_1842
	xor a
	call Func_1842
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call ActivateJob
	db JOB_DECOMPRESS

	ld hl, vTiles2
	ld b, $10
.asm_5fdc
	call Func_17ab
	dec b
	jr nz, .asm_5fdc
	ld hl, vTiles1
	ld b, $08
.asm_5fe7
	call Func_17ab
	dec b
	jr nz, .asm_5fe7
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_5ff2:
	push bc
	bcbgcoord 1, 3
	call Func_604f
	pop bc
	ret

Func_5ffb:
	push af
	push bc
	ld a, $80
	bcbgcoord 11, 4
	call Func_60be
	pop bc
	pop af
	ret

Func_6008:
	push af
	push bc
	ld a, $e0
	bcbgcoord 1, 5
	call Func_60be
	pop bc
	pop af
	ret

Func_6015:
	push af
	push bc
	ld a, $30
	bcbgcoord 11, 5
	call Func_60be
	pop bc
	pop af
	ret

Func_6022:
	push bc
	bcbgcoord 11, 4
	call Func_6074
	pop bc
	ret

Func_602b:
	push bc
	bcbgcoord 1, 5
	call Func_6099
	pop bc
	ret

Func_6034:
	push bc
	bcbgcoord 11, 5
	call Func_6099
	pop bc
	ret

Func_603d:
	push bc
	bcbgcoord 1, 5
	call Func_604f
	pop bc
	ret

Func_6046:
	push bc
	bcbgcoord 11, 5
	call Func_604f
	pop bc
	ret

Func_604f:
	push af
	push bc
	push de
	push hl
	ld a, $81
	ld d, $0a
.asm_6057
	call AddWordToVBlankStruct
	ld e, $08
.asm_605c
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_605c
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld b, h
	ld c, l
	pop de
	dec d
	jr nz, .asm_6057
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_6074:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld d, $0a
.asm_607c
	call AddWordToVBlankStruct
	ld e, $08
.asm_6081
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_6081
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld b, h
	ld c, l
	pop de
	dec d
	jr nz, .asm_607c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_6099:
	push af
	push bc
	push de
	push hl
	ld a, $80
	ld d, $0a
.asm_60a1
	call AddWordToVBlankStruct
	ld e, $08
.asm_60a6
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_60a6
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld b, h
	ld c, l
	pop de
	dec d
	jr nz, .asm_60a1
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_60be:
	push af
	push bc
	push de
	push hl
	ld d, $05
.asm_60c4
	call AddWordToVBlankStruct
	push af
	ld e, $08
.asm_60ca
	call AddByteToVBlankStruct
	inc a
	inc a
	dec e
	jr nz, .asm_60ca
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld b, h
	ld c, l
	pop de
	pop af
	inc a
	push af
	call AddWordToVBlankStruct
	ld e, $08
.asm_60e4
	call AddByteToVBlankStruct
	inc a
	inc a
	dec e
	jr nz, .asm_60e4
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld b, h
	ld c, l
	pop de
	pop af
	add $0f
	dec d
	jr nz, .asm_60c4
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_6101:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_612d
	call SetScreenConfig
	farcall LoadFontToVTiles2
	farcall Func_285d4
	call Func_6137
	call Func_616c
	call Func_61c0
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	call Func_2ae4
	pop hl
	pop af
	ret

ScreenConfig_612d:
	db LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 144 ; WY
	db 159 + WX_OFS ; WX

Func_6137:
	call ClearOAM
	call Func_581f
	call Func_6144
	call CopyOAMDirect
	ret

Func_6144:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_615c
	ld hl, vTiles0
	ld c, 2 * TILE_1BPP_SIZE
.asm_6150
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_6150
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_615c: INCBIN "gfx/gfx_557a.1bpp"

Func_616c:
	push af
	push bc
	push hl
	hlbgcoord 12, 1
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wcad8]
	add $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	inc hl
	ld a, [wcad9]
	add $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_61c0:
	push af
	push bc
	push de
	push hl
	call Func_58a3
	ld a, [wcada + 0]
	ld [wcea2], a
	ld a, [wcada + 1]
	ld [wcea3], a
	ld d, $05
	ld a, [wcad8]
	ld c, a
	ld a, [wcad9]
	cp c
	jr nz, .asm_61e4
	ld a, [wcad7]
	ld d, a
	inc d
.asm_61e4
	ld e, $00
.asm_61e6
	ld a, e
	cp d
	jr nc, .asm_6207
	ld a, l
	call Func_620c
	call Func_624d
	call Func_6298
	inc e
	ld a, [wcea2]
	add $01
	ld [wcea2], a
	ld a, [wcea3]
	adc $00
	ld [wcea3], a
	jr .asm_61e6
.asm_6207
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_620c:
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
	ld a, TEXTLOAD_NUMBER
	call SetTextLoadMode
	ld a, [wcea2]
	add $01
	ld [wHexNumber + 0], a
	ld a, [wcea3]
	adc $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	call SetTextArg
	call LoadText
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_624d:
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
	ld a, [wcea2]
	ld c, a
	ld a, [wcea3]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, $08
.asm_6272
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_6272
	ld de, $18
	add hl, de
	ld de, wTextBuffer
	ld c, $08
.asm_6287
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
	ld [hli], a
	dec c
	jr nz, .asm_6287
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_6298:
	push af
	push bc
	push de
	push hl
	ld d, $00
	swap e
	sla e
	sla e
	rl d
	hlbgcoord 15, 3
	add hl, de
	ld a, [wcea2]
	ld c, a
	ld a, [wcea3]
	ld b, a
	call Func_1542
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_62c2:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_62e5
	call SetScreenConfig
	farcall Func_2a813
	call Func_62ef
	call Func_63cb
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret

ScreenConfig_62e5:
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

Func_62ef:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles0
	ld de, Gfx_630b
	ld b, $0c ; tiles
.loop_tiles
	ld c, TILE_SIZE
.loop_copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy
	dec b
	jr nz, .loop_tiles
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_630b: INCBIN "gfx/gfx_630b.2bpp"

Func_63cb:
	call Func_12fb
	call Func_64ca
	call CopyOAMDirect
	ret

	ret ; stray ret

Func_63d6:
	push af
	push bc
	push de
	push hl
.loop
	call Func_6403
	ld b, $00
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	cp $00
	jr z, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_6429
	dw Func_6436
	dw Func_644c
	dw Func_645f
	dw Func_6472
	dw Func_6485
	dw Func_6498

Func_6403:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $f3
	jr z, .asm_641c
	ld c, $08
.asm_6411
	dec c
	rlca
	jr nc, .asm_6411
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_641c
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $0c, $0a, $06, $08

Func_6429:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6436:
	call Func_6536
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $01
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_644c:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $00
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_645f:
	call Func_6519
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_64ca
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6472:
	call Func_64fd
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_64ca
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6485:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $02
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6498:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	call Func_2958
	cp $02
	jr c, .asm_64b3
	ld a, $04
	ld [wCampaignStage], a
	ld a, $01
	jr .asm_64b4
.asm_64b3
	xor a
.asm_64b4
	ret

Func_64b5:
	push af
	push bc
	ld a, DUELIST_WEEVIL
	ld [wcf04], a
	call Func_653f
	ld a, b
	ld [wcf05], a
	ld a, c
	ld [wcf06], a
	pop bc
	pop af
	ret

Func_64ca:
	push af
	push bc
	push de
	ld a, [wcf05]
	ld b, a
	ld a, [wcf06]
	ld c, a
	ld d, $00
	ld e, $00
	call Add4x4OAM
	ld c, $50
	ld b, $08
	ld d, $04
	ld e, $02
	call Add4x4OAM
	call Func_2958
	cp $02
	jr c, .asm_64f9
	ld c, $50
	ld b, $98
	ld d, $08
	ld e, $04
	call Add4x4OAM
.asm_64f9
	pop de
	pop bc
	pop af
	ret

Func_64fd:
	push af
	push bc
	ld a, [wcf04]
	inc a
	cp IN_THE_SHIP_DUELISTS
	jr nz, .asm_6508
	xor a
.asm_6508
	ld [wcf04], a
	call Func_653f
	ld a, b
	ld [wcf05], a
	ld a, c
	ld [wcf06], a
	pop bc
	pop af
	ret

Func_6519:
	push af
	push bc
	ld a, [wcf04]
	dec a
	cp -1
	jr nz, .asm_6525
	ld a, NUM_DUEL_KINGDOM_DUELISTS - 1
.asm_6525
	ld [wcf04], a
	call Func_653f
	ld a, b
	ld [wcf05], a
	ld a, c
	ld [wcf06], a
	pop bc
	pop af
	ret

Func_6536:
	push af
	ld a, [wcf04]
	call SetNPCDuelist
	pop af
	ret

Func_653f:
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, .data
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	pop af
	ret

.data
	db $6b, $57
	db $4a, $25
	db $79, $6a
	db $1f, $1c
	db $7d, $3c
	db $4d, $5c
	db $21, $53
	db $6f, $24
	db $2f, $34

; unreferenced
Func_6562:
	push af
	push bc
	push hl
	ld hl, $cf07
	ld c, $09
.asm_656a
	ld [hli], a
	dec c
	jr nz, .asm_656a
	pop hl
	pop bc
	pop af
	ret

; unreferenced
Func_6572:
	push af
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $cf07
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_6582
	inc [hl]
.asm_6582
	pop hl
	pop bc
	pop af
	ret

; unreferenced
Func_6586:
	push af
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $cf07
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	pop af
	ret

Func_6595::
	push af
	push hl

	call DisableLCD
	ld hl, ScreenConfig_65ba
	call SetScreenConfig
	farcall Func_2c00a
	call EnableLCD
	call DoFrame
	call FadeIn

	; wait for 90 frames
	ld l, 90
.wait
	call DoFrame
	dec l
	jr nz, .wait

	call FadeOut
	pop hl
	pop af
	ret

ScreenConfig_65ba:
	db LCDC_BG_ON | LCDC_OBJ_OFF | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 143 ; WY
	db 159 + WX_OFS ; WX

Func_65c4::
	push af
	push hl
	call DisableLCD
	ld hl, ScreenConfig_65e9
	call SetScreenConfig
	farcall Func_2c4c9
	call EnableLCD
	call DoFrame
	call FadeIn

	; wait for 90 frames
	ld l, 90
.wait
	call DoFrame
	dec l
	jr nz, .wait

	call FadeOut
	pop hl
	pop af
	ret

ScreenConfig_65e9:
	db LCDC_BG_ON | LCDC_OBJ_OFF | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 143 ; WY
	db 159 + WX_OFS ; WX

Func_65f3::
	push af
	push hl
	call DisableLCD
	ld hl, ScreenConfig_6618
	call SetScreenConfig
	farcall Func_2cb88
	call EnableLCD
	call DoFrame
	call FadeIn

	; wait for 90 frames
	ld l, 90
.wait
	call DoFrame
	dec l
	jr nz, .wait

	call FadeOut
	pop hl
	pop af
	ret

ScreenConfig_6618:
	db LCDC_BG_ON | LCDC_OBJ_OFF | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 143 ; WY
	db 159 + WX_OFS ; WX

Func_6622:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_6642
	call SetScreenConfig
	farcall Func_2d717
	call Func_664c
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret

ScreenConfig_6642:
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

Func_664c:
	call ClearOAM
	call Func_681b
	call Func_6659
	call CopyOAMDirect
	ret

Func_6659:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_6675
	ld hl, vTiles0
	ld b, $0c ; tiles
.asm_6665
	ld c, TILE_SIZE
.asm_6667
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_6667
	dec b
	jr nz, .asm_6665
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_6675: INCBIN "gfx/gfx_6675.2bpp"

	ret ; stray ret

Func_6736:
	push af
	push bc
	push de
	push hl
.loop
	call Func_6761
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
	dw Func_6787
	dw Func_6794
	dw Func_67ae
	dw Func_67c1
	dw Func_67d4
	dw Func_67e7

Func_6761:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_677a
	ld c, 8 ; bits
.asm_676f
	dec c
	rlca
	jr nc, .asm_676f
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_677a
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $0a, $00, $06, $08

Func_6787:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6794:
	push bc
	push hl
	call Func_687c
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, STAGE_START_DUEL
	ld [wCampaignStage], a
	ld a, $01
	pop hl
	pop bc
	ret

Func_67ae:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, STAGE_EXIT
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_67c1:
	call Func_685f
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_681b
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_67d4:
	call Func_6843
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_681b
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_67e7:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	call Func_2958
	cp $01
	jr c, .asm_6802
	ld a, STAGE_DUEL_KINGDOM
	ld [wCampaignStage], a
	ld a, $01
	jr .asm_6803
.asm_6802
	xor a
.asm_6803
	ret

Func_6804:
	push af
	push bc
	ld a, $00
	ld [wcf92], a
	ld a, $00
	call Func_6885
	ld a, b
	ld [wcf93], a
	ld a, c
	ld [wcf94], a
	pop bc
	pop af
	ret

Func_681b:
	push af
	push bc
	push de
	ld d, $00
	ld e, $00
	ld a, [wcf93]
	ld b, a
	ld a, [wcf94]
	ld c, a
	call Add4x4OAM
	call Func_2958
	cp $01
	jr c, .asm_683f
	ld c, $50
	ld b, $98
	ld d, $08
	ld e, $04
	call Add4x4OAM
.asm_683f
	pop de
	pop bc
	pop af
	ret

Func_6843:
	push af
	push bc
	ld a, [wcf92]
	inc a
	cp $04
	jr nz, .asm_684e
	xor a
.asm_684e
	ld [wcf92], a
	call Func_6885
	ld a, b
	ld [wcf93], a
	ld a, c
	ld [wcf94], a
	pop bc
	pop af
	ret

Func_685f:
	push af
	push bc
	ld a, [wcf92]
	dec a
	cp $ff
	jr nz, .asm_686b
	ld a, $03
.asm_686b
	ld [wcf92], a
	call Func_6885
	ld a, b
	ld [wcf93], a
	ld a, c
	ld [wcf94], a
	pop bc
	pop af
	ret

Func_687c:
	push af
	ld a, [wcf92]
	call Func_2344
	pop af
	ret

Func_6885:
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, .data
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	pop af
	ret

.data
	db $30, $60
	db $70, $10
	db $80, $50
	db $20, $20

Func_689e:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_68c1
	call SetScreenConfig
	farcall LoadFontToVTiles2
	farcall Func_3000e
	call Func_68cb
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret

ScreenConfig_68c1:
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

Func_68cb:
	call ClearOAM
	call Func_68d8
	call Func_6a73
	call CopyOAMDirect
	ret

Func_68d8:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_68f4
	ld hl, vTiles0
	ld b, $0c ; tiles
.asm_68e4
	ld c, TILE_SIZE
.asm_68e6
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_68e6
	dec b
	jr nz, .asm_68e4
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_68f4: INCBIN "gfx/gfx_68f4.2bpp"

	ret ; stray ret

Func_69b5:
	push af
	push bc
	push de
	push hl
.loop
	call Func_69de
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
	dw Func_6a04
	dw Func_6a11
	dw Func_6a2b
	dw Func_6a3e
	dw Func_6a5b

Func_69de:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_69f7
	ld c, $08
.asm_69ec
	dec c
	rlca
	jr nc, .asm_69ec
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_69f7
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $06, $08, $00, $00

Func_6a04:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6a11:
	push bc
	push hl
	call Func_6a6f
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $01
	ld [wCampaignStage], a
	ld a, $01
	pop hl
	pop bc
	ret

Func_6a2b:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $00
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6a3e:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	call Func_2958
	cp $03
	jr c, .asm_6a59
	ld a, $05
	ld [wCampaignStage], a
	ld a, $01
	jr .asm_6a5a
.asm_6a59
	xor a
.asm_6a5a
	ret

Func_6a5b:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $03
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6a6e:
	ret

Func_6a6f:
	call Func_234c
	ret

Func_6a73:
	push af
	push bc
	push de
	ld c, $50
	ld b, $08
	ld d, $04
	ld e, $02
	call Add4x4OAM
	call Func_2958
	cp $03
	jr c, .asm_6a93
	ld c, $50
	ld b, $98
	ld d, $08
	ld e, $04
	call Add4x4OAM
.asm_6a93
	pop de
	pop bc
	pop af
	ret

Func_6a97:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_6aba
	call SetScreenConfig
	farcall LoadFontToVTiles2
	farcall Func_3115d
	call Func_6ac4
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret

ScreenConfig_6aba:
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

Func_6ac4:
	call ClearOAM
	call Func_6ad1
	call Func_6c6c
	call CopyOAMDirect
	ret

Func_6ad1:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_6aed
	ld hl, vTiles0
	ld b, $0c ; tiles
.asm_6add
	ld c, TILE_SIZE
.asm_6adf
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_6adf
	dec b
	jr nz, .asm_6add
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_6aed: INCBIN "gfx/gfx_68f4.2bpp"

	ret ; stray ret

Func_6bae:
	push af
	push bc
	push de
	push hl
.loop
	call Func_6bd7
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
	dw Func_6bfd
	dw Func_6c0a
	dw Func_6c24
	dw Func_6c37
	dw Func_6c54

Func_6bd7:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_6bf0
	ld c, $08
.asm_6be5
	dec c
	rlca
	jr nc, .asm_6be5
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_6bf0
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $06, $08, $00, $00

Func_6bfd:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6c0a:
	push bc
	push hl
	call Func_6c68
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $01
	ld [wCampaignStage], a
	ld a, $01
	pop hl
	pop bc
	ret

Func_6c24:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $00
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6c37:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	call Func_2958
	cp $04
	jr c, .asm_6c52
	ld a, $06
	ld [wCampaignStage], a
	ld a, $01
	jr .asm_6c53
.asm_6c52
	xor a
.asm_6c53
	ret

Func_6c54:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $04
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6c67:
	ret

Func_6c68:
	call Func_2354
	ret

Func_6c6c:
	push af
	push bc
	push de
	ld c, $50
	ld b, $08
	ld d, $04
	ld e, $02
	call Add4x4OAM
	call Func_2958
	cp $04
	jr c, .asm_6c8c
	ld c, $50
	ld b, $98
	ld d, $08
	ld e, $04
	call Add4x4OAM
.asm_6c8c
	pop de
	pop bc
	pop af
	ret

Func_6c90:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_6cb3
	call SetScreenConfig
	farcall LoadFontToVTiles2
	farcall Func_3230c
	call Func_6cbd
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret

ScreenConfig_6cb3:
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

Func_6cbd:
	call ClearOAM
	call Func_6cca
	call Func_6e46
	call CopyOAMDirect
	ret

Func_6cca:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_6ce6
	ld hl, vTiles0
	ld b, $0c ; tiles
.asm_6cd6
	ld c, TILE_SIZE
.asm_6cd8
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_6cd8
	dec b
	jr nz, .asm_6cd6
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_6ce6: INCBIN "gfx/gfx_6ce6.2bpp"

	ret ; stray ret

Func_6da7:
	push af
	push bc
	push de
	push hl
.loop
	call Func_6dce
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
	dw Func_6df4
	dw Func_6e01
	dw Func_6e1b
	dw Func_6e2e

Func_6dce:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_6de7
	ld c, $08
.asm_6ddc
	dec c
	rlca
	jr nc, .asm_6ddc
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_6de7
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $00, $06, $00, $00

Func_6df4:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_6e01:
	push bc
	push hl
	call Func_6e42
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $01
	ld [wCampaignStage], a
	ld a, $01
	pop hl
	pop bc
	ret

Func_6e1b:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $00
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6e2e:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $05
	ld [wCampaignStage], a
	ld a, $01
	ret

Func_6e41:
	ret

Func_6e42:
	call Func_235c
	ret

Func_6e46:
	push af
	push bc
	push de
	ld c, $50
	ld b, $08
	ld d, $04
	ld e, $02
	call Add4x4OAM
	pop de
	pop bc
	pop af
	ret
