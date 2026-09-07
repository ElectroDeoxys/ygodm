	dw BANK(@)

	farcall_table_start
	farfunc Func_4068 ; $03
	farfunc Func_551f ; $05
	farfunc InitTrunk ; $07
	farfunc GetTrunkTotalCardCount ; $09
	farfunc $5b92 ; $0b
	farfunc Func_56e0 ; $0d
	farfunc Func_5c86 ; $0f
	farfunc Func_5af2 ; $11
	farfunc GetCardCountInTrunk ; $13
	farfunc $5bb8 ; $15
	farfunc $5bd1 ; $17
	farfunc $5c10 ; $19
	farfunc Func_42c5 ; $1b
	farfunc Func_42d0 ; $1d
	farfunc Func_42ec ; $1f
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
	farfunc $6101 ; $3f
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
	ld hl, $40a6
	call Func_10d9
	farcall Func_cd9a
	farcall Func_2801e
	farcall LoadFontToVTiles2
	call Func_40b0
	call Func_4110
	call Func_413a
	call Func_4164
	call Func_41a1
	call Func_41c6
	call Func_41eb
	call Func_42a7
	call Func_42ae
	call EnableLCD
	call Func_fff
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x40a6

SECTION "Bank 1@40b0", ROMX[$40b0], BANK[$1]

Func_40b0:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 16
	ld d, $00
	ld e, $05
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
	ld e, $05
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

Func_4110:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_42d0
	ld a, [wPlayerLP + 0]
	ld c, a
	ld a, [wPlayerLP + 1]
	ld b, a
	call Func_42c5
	call Func_42ec
	hlbgcoord 5, 16
	ld de, wTextBuffer
	ld c, $04
.asm_412f
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_412f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_413a:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_42d0
	ld a, [wOppLP + 0]
	ld c, a
	ld a, [wOppLP + 1]
	ld b, a
	call Func_42c5
	call Func_42ec
	hlbgcoord 5, 1
	ld de, wTextBuffer
	ld c, $04
.asm_4159
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_4159
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
	call Func_42c5
	ld a, $02
	call Func_42d0
	call Func_42ec
	call Func_1114
	hlbgcoord 1, 3
	ld de, wTextBuffer
	ld c, $08
.asm_4184
	ld a, [de]
	inc de
	call ProcessChar
	push hl
	push bc
	ld bc, TILEMAP_WIDTH
	add hl, bc
	ld a, [wCurChar]
	ld [hl], a
	pop bc
	pop hl
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_4184
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_41a1:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 14
	ld d, $00
	ld e, $05
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

Func_41c6:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 2
	ld d, $04
	ld e, $05
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
	ld de, $4207
	ld b, $0c
.asm_41f7
	ld c, $10
.asm_41f9
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_41f9
	dec b
	jr nz, .asm_41f7
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x4207

SECTION "Bank 1@42a7", ROMX[$42a7], BANK[$1]

Func_42a7:
	call Func_12d2
	call Func_1225
	ret

Func_42ae:
	push af
	ld a, [$cdff]
	cp $02
	jr nz, .asm_42c3
	ld a, $07
	ldh [rWX], a
	ld a, $67
	ldh [rWY], a
	ld hl, rLCDC
	res 1, [hl]
.asm_42c3
	pop af
	ret

; input:
; - c = card type
; - b = ?
Func_42c5::
	push af
	ld a, c
	ld [wcab6], a
	ld a, b
	ld [wcab7], a
	pop af
	ret

Func_42d0::
	ld [wcab8], a
	ret

Func_42d4:
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
	ld [$cacd], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_42ec::
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wcab8]
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
	dw Func_4319
	dw Func_437b
	dw Func_43d4
	dw Func_52a5
	dw Func_52d8
	dw Func_435c
	dw Func_5324
	dw Func_536d
	dw Func_5436
	dw Func_54ef

Func_4319:
	push af
	push bc
	push de
	push hl
	call Func_42d4
	ld hl, wTextBuffer
	ld de, wcab7
	ld b, $01
	ld c, $02
.asm_432a
	ld a, [de]
	push de
	ld d, $02
.asm_432e
	swap a
	push af
	and $0f
	jr z, .asm_433b
	add $01
	ld [hl], a
	inc b
	jr .asm_4342
.asm_433b
	ld a, b
	cp $01
	jr z, .asm_4342
	ld [hl], $01
.asm_4342
	inc l
	pop af
	dec d
	jr nz, .asm_432e
	pop de
	dec de
	dec c
	jr nz, .asm_432a
	dec b
	jr nz, .asm_4352
	dec l
	ld [hl], $01
.asm_4352
	ld a, $04
	ld [$cacd], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_435c:
	push af
	push bc
	push hl
	call Func_4319
	ld hl, wTextBuffer
	ld c, $04
.asm_4367
	ld a, [hl]
	cp $00
	jr z, .asm_4371
	add $c5
	ld [hl], a
	jr .asm_4373
.asm_4371
	ld [hl], $80
.asm_4373
	inc hl
	dec c
	jr nz, .asm_4367
	pop hl
	pop bc
	pop af
	ret

Func_437b:
	push af
	push bc
	push de
	push hl
	ld de, $439c
	ld h, $00
	ld a, [wcab6]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
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
; 0x439c

SECTION "Bank 1@43d4", ROMX[$43d4], BANK[$1]

Func_43d4:
	push af
	push bc
	push de
	push hl
	call Func_42d4
	ld de, $440f
	ld a, [wcab6]
	ld l, a
	ld a, [wcab7]
	ld h, a
	add hl, hl
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
	ld de, wTextBuffer
	ld b, $00
.asm_43fc
	ld a, c
	cp l
	jr z, .asm_4406
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	jr .asm_43fc
.asm_4406
	ld a, b
	ld [$cacd], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x440f

SECTION "Bank 1@52a5", ROMX[$52a5], BANK[$1]

Func_52a5:
	push af
	push bc
	push de
	push hl
	ld de, $52c8
	ld a, [wcab6]
	ld l, a
	ld a, [wcab7]
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
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
; 0x52c8

SECTION "Bank 1@52d8", ROMX[$52d8], BANK[$1]

Func_52d8:
	push af
	push bc
	push de
	push hl
	ld de, $52c8
	ld a, [wcab6]
	ld l, a
	ld a, [wcab7]
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
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
; 0x52fb

SECTION "Bank 1@5313", ROMX[$5313], BANK[$1]

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
	ld de, wcab6
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
; 0x535d

SECTION "Bank 1@536d", ROMX[$536d], BANK[$1]

Func_536d:
	push af
	push bc
	push de
	push hl
	ld de, $538e
	ld h, $00
	ld a, [wcab6]
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
; 0x538e

SECTION "Bank 1@5436", ROMX[$5436], BANK[$1]

Func_5436:
	push af
	push bc
	push de
	push hl
	ld de, $5457
	ld h, $00
	ld a, [wcab6]
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
; 0x5457

SECTION "Bank 1@54ef", ROMX[$54ef], BANK[$1]

Func_54ef:
	push af
	push bc
	push de
	push hl
	call Func_42d4
	ld de, wTextBuffer
	ld hl, $cf99
	ld c, $08
.asm_54fe
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_54fe
	ld hl, wTextBuffer
	ld de, NULL
	ld c, $08
.asm_550c
	inc e
	ld a, [hli]
	cp $00
	jr z, .asm_5513
	ld d, e
.asm_5513
	dec c
	jr nz, .asm_550c
	ld a, d
	ld [$cacd], a
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
	ld hl, $554b
	call Func_10d9
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
; 0x554b

SECTION "Bank 1@5555", ROMX[$5555], BANK[$1]

Func_5555:
	call ClearOAM
	call Func_581f
	call Func_5562
	call Func_1225
	ret

Func_5562:
	push af
	push bc
	push de
	push hl
	ld de, $557a
	ld hl, vTiles0
	ld c, $10
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
; 0x557a

SECTION "Bank 1@558a", ROMX[$558a], BANK[$1]

Func_558a:
	push af
	push bc
	push hl
	hlbgcoord 12, 1
	ld a, $00
	call Func_42d0
	ld a, [$cad8]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	inc hl
	ld a, [$cad9]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
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
	ld a, [$cada]
	ld [$cad2], a
	ld a, [$cadb]
	ld [$cad3], a
	ld d, $05
	ld a, [$cad8]
	ld c, a
	ld a, [$cad9]
	cp c
	jr nz, .asm_5602
	ld a, [$cad7]
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
	ld a, [$cad2]
	add $01
	ld [$cad2], a
	ld a, [$cad3]
	adc $00
	ld [$cad3], a
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
	ld a, $00
	call Func_42d0
	ld a, [$cad2]
	add $01
	ld [$cadc], a
	ld a, [$cad3]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
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
	ld a, [$cad2]
	ld c, a
	ld a, [$cad3]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, $08
.asm_5690
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [$cacf]
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
	ld a, [wCurChar]
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
	ld a, [$cad2]
	ld c, a
	ld a, [$cad3]
	ld b, a
	call Func_1542
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_56e0:
	push af
	ld a, $00
	ld [$cad4], a
	ld a, $00
	ld [$cad5], a
	ld a, $00
	ld [$cad6], a
	ld a, $04
	ld [$cad7], a
	ld a, $00
	ld [$cad8], a
	call PlayerOwnsAnySecretCard
	cp TRUE
	jr nz, .no_secret_cards
	ld a, $48
	ld [$cad9], a
	jr .asm_570d
.no_secret_cards
	ld a, $45
	ld [$cad9], a
.asm_570d
	pop af
	ret

Func_570f:
	push af
	push bc
	ld a, [$cad4]
	ld c, a
	ld a, c
	cp $00
	jr nz, .asm_5737
	call Func_2ae4
	ld a, $01
	ld [$cad4], a
	ld a, $00
	ld [$cad6], a
	ld a, $04
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
	ld a, $00
	ld [$cad4], a
	pop af
	ret

Func_5748:
	push af
	push bc
	ld a, [$cad4]
	cp $00
	jr nz, .asm_5779
	ld a, [$cad9]
	ld c, a
	ld a, [$cad8]
	cp c
	jr nz, .asm_576b
	ld a, [$cad7]
	ld b, a
	ld a, [$cad5]
	cp b
	jr z, .asm_5769
	inc a
	call Func_2aef
.asm_5769
	jr .asm_5776
.asm_576b
	ld a, [$cad5]
	cp $04
	jr z, .asm_5776
	inc a
	call Func_2aef
.asm_5776
	ld [$cad5], a
.asm_5779
	ld a, [$cad4]
	cp $01
	jr nz, .asm_578e
	ld a, [$cad6]
	cp $00
	jr nz, .asm_578b
	inc a
	call Func_2aef
.asm_578b
	ld [$cad6], a
.asm_578e
	pop bc
	pop af
	ret

Func_5791:
	push af
	ld a, [$cad4]
	cp $00
	jr nz, .asm_57a7
	ld a, [$cad5]
	cp $00
	jr z, .asm_57a4
	dec a
	call Func_2aef
.asm_57a4
	ld [$cad5], a
.asm_57a7
	ld a, [$cad4]
	cp $01
	jr nz, .asm_57bc
	ld a, [$cad6]
	cp $01
	jr nz, .asm_57b9
	dec a
	call Func_2aef
.asm_57b9
	ld [$cad6], a
.asm_57bc
	pop af
	ret

Func_57be:
	push af
	push bc
	push de
	ld a, [$cad4]
	cp $00
	jr nz, .asm_57fa
	ld a, [$cad9]
	ld c, a
	ld a, [$cad8]
	cp c
	jr z, .asm_57fa
	inc a
	ld [$cad8], a
	call Func_2aef
	cp c
	jr nz, .asm_57ea
	ld a, [$cad7]
	ld d, a
	ld a, [$cad5]
	cp d
	jr c, .asm_57ea
	ld a, d
	ld [$cad5], a
.asm_57ea
	ld e, $05
	ld a, [$cad8]
	cp c
	jr nz, .asm_57f7
	ld a, [$cad7]
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
	ld a, [$cad4]
	cp $00
	jr nz, .asm_581b
	ld a, [$cad8]
	cp $00
	jr z, .asm_581b
	dec a
	ld [$cad8], a
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
	ld a, [$cad4]
	cp $00
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
	ld a, [$cad5]
	call Func_588d
	ld d, $10
	call Func_123c
.asm_584a
	ld a, [$cad4]
	cp $01
	jr nz, .asm_5888
	ld c, $00
	ld a, $ff
	ld d, $10
	call Func_123c
	ld bc, $1
	ld a, [$cad6]
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
	ld a, [$cad5]
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
	ld hl, $589a
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x589a

SECTION "Bank 1@58a3", ROMX[$58a3], BANK[$1]

Func_58a3:
	push af
	push bc
	push de
	push hl
	ld a, [$cad8]
	ld e, a
	ld b, $05
	call BTimesE
	ld a, l
	ld [$cada], a
	ld a, h
	ld [$cadb], a
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
	ld a, $06
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
	ld a, [$cada]
	add $01
	ld [$cada], a
	ld a, [$cadb]
	adc $00
	ld [$cadb], a
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
	ld a, $06
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
	ld a, [$cada]
	ld c, a
	ld a, [$cadb]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, $08
.asm_598d
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [$cacf]
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
	ld a, $00
	call Func_42d0
	ld a, [$cada]
	add $01
	ld [$cadc], a
	ld a, [$cadb]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	call AddByteToVBlankStruct
	ld a, [$cabb]
	call AddByteToVBlankStruct
	ld a, [$cabc]
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
	ld a, $04
	call Func_42d0
	ld a, [$cada]
	ld c, a
	ld a, [$cadb]
	ld b, a
	call Func_1508
	call Func_111c
	ld hl, wTextBuffer
	ld c, $08
.asm_5a01
	ld a, [hli]
	call ProcessChar
	ld a, [wCurChar]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_5a01
	ld a, $80
	call AddByteToVBlankStruct
	ld a, [$cada]
	ld c, a
	ld a, [$cadb]
	ld b, a
	call Func_1542
	ld a, [$cabb]
	call AddByteToVBlankStruct
	ld a, [$cabc]
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
	ld a, $06
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
	ld a, $00
	call Func_42d0
	ld a, [$cad8]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	call AddByteToVBlankStruct
	ld a, [$cabb]
	call AddByteToVBlankStruct
	ld a, [$cabc]
	call AddByteToVBlankStruct
	ld a, $81
	call AddByteToVBlankStruct
	ld a, [$cad9]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	call AddByteToVBlankStruct
	ld a, [$cabb]
	call AddByteToVBlankStruct
	ld a, [$cabc]
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
	ld a, [wCardID_cae2]
	ld c, a
	ld a, [$cae3]
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
	ld a, [wCardID_cae2]
	ld c, a
	ld a, [$cae3]
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
; 0x5bb8

SECTION "Bank 1@5bea", ROMX[$5bea], BANK[$1]

Func_5bea:
	push bc
	push de
	ld e, $01
	ld a, [wCardID_cae2]
	ld c, a
	ld a, [$cae3]
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
; 0x5c10

SECTION "Bank 1@5c29", ROMX[$5c29], BANK[$1]

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
; 0x5c85

SECTION "Bank 1@5c86", ROMX[$5c86], BANK[$1]

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
	ld hl, $5ce5
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
	ld hl, $5ce5
	add hl, bc
	ld d, [hl]
.asm_5ce0
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x5ce5

SECTION "Bank 1@5ced", ROMX[$5ced], BANK[$1]

Func_5ced:
	ld a, $02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5cfa:
	ld a, $04
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
	ld a, $04
	call SetPendingVBlankMode
	ld b, $00
	ld a, [$cad4]
	ld c, a
	ld hl, $5d2e
	add hl, bc
	ld a, [hl]
	call Func_573d
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop bc
	ret
; 0x5d2e

SECTION "Bank 1@5d30", ROMX[$5d30], BANK[$1]

Func_5d30:
	ld a, $04
	call SetPendingVBlankMode
	call Func_5791
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d43:
	ld a, $04
	call SetPendingVBlankMode
	call Func_5748
	call Func_581f
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d56:
	call Func_57fe
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d66:
	call Func_57be
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_5d76:
	push af
	ld a, [$cad6]
	cp $00
	jr nz, .asm_5d8f
	ld a, [$ce00]
	cp $03
	jr z, .asm_5d8a
	call Func_5da0
	jr .asm_5d8d
.asm_5d8a
	call Func_5dde
.asm_5d8d
	jr .asm_5d9e
.asm_5d8f
	ld a, [$ce00]
	cp $03
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
	ld a, [$cad5]
	ld c, a
	call Func_58a3
	ld a, [$cada]
	add c
	ld c, a
	ld a, [$cadb]
	adc $00
	ld b, a
	call Func_5af2
	call GetCardCountInTrunk
	cp $ff
	jr z, .asm_5dd2
	farcall LoadCardData
	farcall Func_14036
	farcall Func_14185
	ld a, $00
	ld [$cad4], a
	call Func_551f
	jr .asm_5dda
.asm_5dd2
	call Func_2afa
	ld a, $00
	ld [$cad4], a
.asm_5dda
	pop hl
	pop bc
	pop af
	ret

Func_5dde:
	push af
	push bc
	push hl
	ld a, [$cad5]
	ld c, a
	call Func_58a3
	ld a, [$cada]
	add c
	ld c, a
	ld a, [$cadb]
	adc $00
	ld b, a
	call Func_5af2
	call GetCardCountInTrunk
	cp $ff
	jr z, .asm_5e10
	farcall LoadCardData
	farcall Func_14036
	farcall Func_14185
	ld a, $00
	ld [$cad4], a
	call Func_6101
	jr .asm_5e18
.asm_5e10
	call Func_2afa
	ld a, $00
	ld [$cad4], a
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
	ld a, [$cad8]
	ld b, a
	ld e, $05
	call BTimesE
	ld a, [$cad5]
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
	ld a, $00
	ld [$cad4], a
	ld a, $00
	ld [$cad6], a
	ld a, $04
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
	ld a, [$cad8]
	ld b, a
	ld e, $05
	call BTimesE
	ld a, [$cad5]
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
	ld a, $00
	ld [$cad4], a
	ld a, $00
	ld [$cad6], a
	ld a, $04
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
	ld a, [wLoadedCardID]
	call Func_1842
	ld a, [$cd10]
	call Func_1842
	call SetJobFlag
	ld bc, $cde6
	dec b
	rla
	ld [$ff00+c], a
	ld bc, vTiles0
	ld e, $0a
.asm_5ed6
	ld a, $08
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
	ld a, [wLoadedCardID]
	call Func_1842
	ld a, [$cd10]
	call Func_1842
	call SetJobFlag
	ld bc, $cde6
	dec b
	rla
	ld [$ff00+c], a
	ld bc, vTiles1 tile $60
	ld e, $0a
.asm_5f5a
	ld a, $08
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
	ld a, [wLoadedCardID]
	call Func_1842
	ld a, [$cd10]
	call Func_1842
	call SetJobFlag
	ld bc, $cde6
	dec b
	rla
	ld [$ff00+c], a
	ld bc, vTiles2 tile $30
	ld e, $0a
.asm_5f9c
	ld a, $08
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
	ld hl, $612d
	call Func_10d9
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
; 0x612d

SECTION "Bank 1@6137", ROMX[$6137], BANK[$1]

Func_6137:
	call ClearOAM
	call Func_581f
	call Func_6144
	call Func_1225
	ret

Func_6144:
	push af
	push bc
	push de
	push hl
	ld de, $615c
	ld hl, vTiles0
	ld c, $10
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
; 0x615c

SECTION "Bank 1@616c", ROMX[$616c], BANK[$1]

Func_616c:
	push af
	push bc
	push hl
	hlbgcoord 12, 1
	ld a, $00
	call Func_42d0
	ld a, [$cad8]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	inc hl
	ld a, [$cad9]
	add $01
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
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
	ld a, [$cada]
	ld [$cea2], a
	ld a, [$cadb]
	ld [$cea3], a
	ld d, $05
	ld a, [$cad8]
	ld c, a
	ld a, [$cad9]
	cp c
	jr nz, .asm_61e4
	ld a, [$cad7]
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
	ld a, [$cea2]
	add $01
	ld [$cea2], a
	ld a, [$cea3]
	adc $00
	ld [$cea3], a
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
	ld a, $00
	call Func_42d0
	ld a, [$cea2]
	add $01
	ld [$cadc], a
	ld a, [$cea3]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_42c5
	call Func_42ec
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
	ld a, [$cea2]
	ld c, a
	ld a, [$cea3]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, wTextBuffer
	ld c, $08
.asm_6272
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [$cacf]
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
	ld a, [wCurChar]
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
	ld a, [$cea2]
	ld c, a
	ld a, [$cea3]
	ld b, a
	call Func_1542
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
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
	ld hl, $62e5
	call Func_10d9
	farcall Func_2a813
	call Func_62ef
	call Func_63cb
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x62e5

SECTION "Bank 1@62ef", ROMX[$62ef], BANK[$1]

Func_62ef:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles0
	ld de, $630b
	ld b, $0c
.asm_62fb
	ld c, $10
.asm_62fd
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_62fd
	dec b
	jr nz, .asm_62fb
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x630b

SECTION "Bank 1@63cb", ROMX[$63cb], BANK[$1]

Func_63cb:
	call Func_12fb
	call Func_64ca
	call Func_1225
	ret
; 0x63d5

SECTION "Bank 1@63d6", ROMX[$63d6], BANK[$1]

Func_63d6:
	push af
	push bc
	push de
	push hl
	call Func_6403
	ld b, $00
	ld c, a
	ld hl, $63f5
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0x63ec

SECTION "Bank 1@6403", ROMX[$6403], BANK[$1]

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
	ld hl, $6421
	add hl, bc
	ld d, [hl]
.asm_641c
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x6421

SECTION "Bank 1@64b5", ROMX[$64b5], BANK[$1]

Func_64b5:
	push af
	push bc
	ld a, $00
	ld [$cf04], a
	call Func_653f
	ld a, b
	ld [$cf05], a
	ld a, c
	ld [$cf06], a
	pop bc
	pop af
	ret

Func_64ca:
	push af
	push bc
	push de
	ld a, [$cf05]
	ld b, a
	ld a, [$cf06]
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
; 0x64fd

SECTION "Bank 1@653f", ROMX[$653f], BANK[$1]

Func_653f:
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, $6550
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	pop af
	ret
; 0x6550

SECTION "Bank 01@6595", ROMX[$6595], BANK[$01]

Func_6595::
	push af
	push hl

	call DisableLCD
	ld hl, .Config
	call Func_10d9
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

.Config:
	db LCDC_BG_ON ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	db $00 ; BGP
	db $00 ; OBP0
	db $00 ; OBP1
	db 143 ; WY
	db 166 ; WX

Func_65c4::
	push af
	push hl
	call DisableLCD
	ld hl, $65e9
	call Func_10d9
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
; 0x65e9

SECTION "Bank 01@65f3", ROMX[$65f3], BANK[$01]

Func_65f3::
	push af
	push hl
	call DisableLCD
	ld hl, $6618
	call Func_10d9
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
; 0x6618

SECTION "Bank 1@6622", ROMX[$6622], BANK[$1]

Func_6622:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $6642
	call Func_10d9
	farcall Func_2d717
	call Func_664c
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x6642

SECTION "Bank 1@664c", ROMX[$664c], BANK[$1]

Func_664c:
	call ClearOAM
	call Func_681b
	call Func_6659
	call Func_1225
	ret

Func_6659:
	push af
	push bc
	push de
	push hl
	ld de, $6675
	ld hl, vTiles0
	ld b, $0c
.asm_6665
	ld c, $10
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
; 0x6675

SECTION "Bank 01@6736", ROMX[$6736], BANK[$01]

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
	ld a, $01
	ld [$cea1], a
	ld a, $01
	pop hl
	pop bc
	ret

Func_67ae:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $00
	ld [$cea1], a
	ld a, $01
	ret

Func_67c1:
	call Func_685f
	ld a, $04
	call SetPendingVBlankMode
	call Func_681b
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_67d4:
	call Func_6843
	ld a, $04
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
	ld a, $03
	ld [$cea1], a
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
	ld [$cf92], a
	ld a, $00
	call Func_6885
	ld a, b
	ld [$cf93], a
	ld a, c
	ld [$cf94], a
	pop bc
	pop af
	ret

Func_681b:
	push af
	push bc
	push de
	ld d, $00
	ld e, $00
	ld a, [$cf93]
	ld b, a
	ld a, [$cf94]
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
	ld a, [$cf92]
	inc a
	cp $04
	jr nz, .asm_684e
	xor a
.asm_684e
	ld [$cf92], a
	call Func_6885
	ld a, b
	ld [$cf93], a
	ld a, c
	ld [$cf94], a
	pop bc
	pop af
	ret

Func_685f:
	push af
	push bc
	ld a, [$cf92]
	dec a
	cp $ff
	jr nz, .asm_686b
	ld a, $03
.asm_686b
	ld [$cf92], a
	call Func_6885
	ld a, b
	ld [$cf93], a
	ld a, c
	ld [$cf94], a
	pop bc
	pop af
	ret

Func_687c:
	push af
	ld a, [$cf92]
	call Func_2344
	pop af
	ret

Func_6885:
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, $6896
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	pop af
	ret
; 0x6896

SECTION "Bank 1@689e", ROMX[$689e], BANK[$1]

Func_689e:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $68c1
	call Func_10d9
	farcall LoadFontToVTiles2
	farcall Func_3000e
	call Func_68cb
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x68c1

SECTION "Bank 1@68cb", ROMX[$68cb], BANK[$1]

Func_68cb:
	call ClearOAM
	call Func_68d8
	call Func_6a73
	call Func_1225
	ret

Func_68d8:
	push af
	push bc
	push de
	push hl
	ld de, $68f4
	ld hl, vTiles0
	ld b, $0c
.asm_68e4
	ld c, $10
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
; 0x68f4

SECTION "Bank 1@69b5", ROMX[$69b5], BANK[$1]

Func_69b5:
	push af
	push bc
	push de
	push hl
	call Func_69de
	ld b, $00
	ld c, a
	ld hl, $69d4
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0x69cb

SECTION "Bank 1@69de", ROMX[$69de], BANK[$1]

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
	ld hl, $69fc
	add hl, bc
	ld d, [hl]
.asm_69f7
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x69fc

SECTION "Bank 1@6a6e", ROMX[$6a6e], BANK[$1]

Func_6a6e:
	ret
; 0x6a6f

SECTION "Bank 1@6a73", ROMX[$6a73], BANK[$1]

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
	ld hl, $6aba
	call Func_10d9
	farcall LoadFontToVTiles2
	farcall Func_3115d
	call Func_6ac4
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x6aba

SECTION "Bank 1@6ac4", ROMX[$6ac4], BANK[$1]

Func_6ac4:
	call ClearOAM
	call Func_6ad1
	call Func_6c6c
	call Func_1225
	ret

Func_6ad1:
	push af
	push bc
	push de
	push hl
	ld de, $6aed
	ld hl, vTiles0
	ld b, $0c
.asm_6add
	ld c, $10
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
; 0x6aed

SECTION "Bank 1@6bae", ROMX[$6bae], BANK[$1]

Func_6bae:
	push af
	push bc
	push de
	push hl
	call Func_6bd7
	ld b, $00
	ld c, a
	ld hl, $6bcd
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0x6bc4

SECTION "Bank 1@6bd7", ROMX[$6bd7], BANK[$1]

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
	ld hl, $6bf5
	add hl, bc
	ld d, [hl]
.asm_6bf0
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x6bf5

SECTION "Bank 1@6c67", ROMX[$6c67], BANK[$1]

Func_6c67:
	ret
; 0x6c68

SECTION "Bank 1@6c6c", ROMX[$6c6c], BANK[$1]

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
	ld hl, $6cb3
	call Func_10d9
	farcall LoadFontToVTiles2
	farcall Func_3230c
	call Func_6cbd
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x6cb3

SECTION "Bank 1@6cbd", ROMX[$6cbd], BANK[$1]

Func_6cbd:
	call ClearOAM
	call Func_6cca
	call Func_6e46
	call Func_1225
	ret

Func_6cca:
	push af
	push bc
	push de
	push hl
	ld de, $6ce6
	ld hl, vTiles0
	ld b, $0c
.asm_6cd6
	ld c, $10
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
; 0x6ce6

SECTION "Bank 1@6da7", ROMX[$6da7], BANK[$1]

Func_6da7:
	push af
	push bc
	push de
	push hl
	call Func_6dce
	ld b, $00
	ld c, a
	ld hl, $6dc6
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0x6dbd

SECTION "Bank 1@6dce", ROMX[$6dce], BANK[$1]

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
	ld hl, $6dec
	add hl, bc
	ld d, [hl]
.asm_6de7
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x6dec

SECTION "Bank 1@6e41", ROMX[$6e41], BANK[$1]

Func_6e41:
	ret
; 0x6e42

SECTION "Bank 1@6e46", ROMX[$6e46], BANK[$1]

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
; 0x6e58
