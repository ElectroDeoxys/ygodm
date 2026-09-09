	dw BANK(@)

	farcall_table_start
	farfunc Func_18008
	farfunc Func_191c5
	farfunc Func_19272

SECTION "Bank 6@4008", ROMX[$4008], BANK[$6]

Func_18008:
	push hl
	farcall Func_3c006
	call Func_101d
	call DisableLCD
	ld hl, $4038
	call Func_10d9
	call ClearOAM
	farcall LoadCharacterGfx
	call LoadTextBoxGfx
	call DrawTextBox
	call Func_1814d
	farcall LoadCharacterOAMGfx
	farcall Func_8bfe
	call Func_1225
	call EnableLCD
	call Func_2564
	pop hl
	ret
; 0x18038

SECTION "Bank 6@4042", ROMX[$4042], BANK[$6]

LoadTextBoxGfx:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles1 tile $3b
	ld de, Gfx_1805e
	ld b, $10 ; tiles
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

Gfx_1805e: INCBIN "gfx/gfx_1805e.2bpp"

SECTION "Bank 6@414d", ROMX[$414d], BANK[$6]

Func_1814d:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wNPCCharacter]
	ld c, a
	sla c
	ld hl, NPCCharacterTilemaps
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, vBGMap0
	ld b, $0b
.asm_18165
	ld c, $14
.asm_18167
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_18167
	push de
	ld de, $c
	add hl, de
	pop de
	dec b
	jr nz, .asm_18165
	pop hl
	pop de
	pop bc
	pop af
	ret

DrawTextBox:
	push af
	push bc
	push de
	push hl
	ld de, $419d
	hlbgcoord 0, 11
	ld b, $07
.asm_18187
	ld c, $14
.asm_18189
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_18189
	push de
	ld de, $c
	add hl, de
	pop de
	dec b
	jr nz, .asm_18187
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1819d

SECTION "Bank 6@4229", ROMX[$4229], BANK[$6]

NPCCharacterTilemaps:
	dw $424d
	dw $4329
	dw $4405
	dw $44e1
	dw $45bd
	dw $4699
	dw $4775
	dw $4851
	dw $492d
	dw $4a09
	dw $4ae5
	dw $4bc1
	dw $4c9d
	dw $4d79
	dw $4e55
	dw $4f31
	dw $500d
	dw $50e9
; 0x1824d

SECTION "Bank 6@51c5", ROMX[$51c5], BANK[$6]

Func_191c5:
	push af
	push bc
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $51f3
	call Func_10d9
	farcall Func_29163
	farcall LoadDigitTiles
	call Func_191fd
	call Func_1921e
	call Func_19248
	call Func_1256
	call EnableLCD
	call Func_ff0
	call WaitForVBlank
	pop hl
	pop bc
	pop af
	ret
; 0x191f3

SECTION "Bank 6@51fd", ROMX[$51fd], BANK[$6]

Func_191fd:
	push af
	push bc
	ld a, [$ced2]
	ld c, a
	ld a, [$ced3]
	ld b, a
	farcall Func_5af2
	farcall SetCardAsSeen
	ld a, [$cedd]
	ld c, a
	ld a, [$cede]
	ld b, a
	farcall Func_5af2
	farcall SetCardAsSeen
	pop bc
	pop af
	ret

Func_1921e:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	ld a, [$ced4]
	ld c, a
	ld a, [$ced5]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	hlbgcoord 4, 16
	ld de, wTextBuffer
	ld c, $04
.asm_1923d
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1923d
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_19248:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	ld a, [$cedf]
	ld c, a
	ld a, [$cee0]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	hlbgcoord 14, 16
	ld de, wTextBuffer
	ld c, $04
.asm_19267
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_19267
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_19272:
	call Func_1927f
	call Func_19405
	farcall Func_38004
	call Func_1958b
	ret

Func_1927f:
	push af
	ld a, [$ced1]
	and $01
	jr z, .asm_19298
	call Func_1929a
	call Func_19310
	call Func_192f9
	ld c, $28
.asm_19292
	call WaitForVBlank
	dec c
	jr nz, .asm_19292
.asm_19298
	pop af
	ret

Func_1929a:
	push af
	push bc
	push de
	call Func_1c0a
	ld bc, $c038
	call Func_1c1d
	ld bc, $1000
	call Func_1c12
	ld a, [$ced2]
	ld c, a
	ld a, [$ced3]
	ld b, a
	farcall LoadCardData
	farcall Func_5eb3
	ld e, $05
.asm_192bc
	call Func_1282
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_192bc
	ld bc, NULL
	call Func_1c12
	ld a, $0a
	call SetPendingVBlankMode
	call Func_1282
	farcall Func_603d
	call RequestVBlankMode
	call WaitForVBlank
	ld bc, $c038
	call Func_1c1d
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	pop de
	pop bc
	pop af
	ret

Func_192f9:
	push af
	farcall Func_5f37
	ld a, $0a
	call SetPendingVBlankMode
	call Func_1282
	farcall Func_6008
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_19310:
	push af
	ld a, $14
	call SetPendingVBlankMode
	call Func_19330
	ld a, [$ced1]
	and $02
	jr z, .asm_19325
	call Func_19379
	jr .asm_19328
.asm_19325
	call Func_193bf
.asm_19328
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_19330:
	push af
	push bc
	push de
	push hl
	call Func_1134
	ld a, [$ced2]
	ld c, a
	ld a, [$ced3]
	ld b, a
	call Func_1508
	bcbgcoord 1, 0
	call AddWordToVBlankStruct
	ld de, wTextBuffer
	ld c, $08
.asm_1934d
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_1934d
	ld bc, vTiles1 tile $50
	call AddWordToVBlankStruct
	ld de, wTextBuffer
	ld c, $08
.asm_19366
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
	farcall LoadCharTileToVBlankStruct
	dec c
	jr nz, .asm_19366
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_19379:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	ld a, [$ced8]
	ld c, a
	ld a, [$ced9]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	ld a, b
	cp $ff
	jr nz, .asm_19398
	farcall Func_5313
.asm_19398
	bcbgcoord 1, 2
	call AddWordToVBlankStruct
	ld hl, $53bb
	ld c, $04
.asm_193a3
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_193a3
	ld hl, wTextBuffer
	ld c, $04
.asm_193af
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_193af
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x193bb

SECTION "Bank 6@53bf", ROMX[$53bf], BANK[$6]

Func_193bf:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	ld a, [$ceda]
	ld c, a
	ld a, [$cedb]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	ld a, b
	cp $ff
	jr nz, .asm_193de
	farcall Func_5313
.asm_193de
	bcbgcoord 1, 3
	call AddWordToVBlankStruct
	ld hl, $5401
	ld c, $04
.asm_193e9
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_193e9
	ld hl, wTextBuffer
	ld c, $04
.asm_193f5
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_193f5
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x19401

SECTION "Bank 6@5405", ROMX[$5405], BANK[$6]

Func_19405:
	push af
	ld a, [$cedc]
	and $01
	jr z, .asm_1941e
	call Func_19420
	call Func_19496
	call Func_1947f
	ld c, $28
.asm_19418
	call WaitForVBlank
	dec c
	jr nz, .asm_19418
.asm_1941e
	pop af
	ret

Func_19420:
	push af
	push bc
	push de
	call Func_1c0a
	ld bc, $b038
	call Func_1c1d
	ld bc, $f000
	call Func_1c12
	ld a, [$cedd]
	ld c, a
	ld a, [$cede]
	ld b, a
	farcall LoadCardData
	farcall Func_5eb3
	ld e, $05
.asm_19442
	call Func_1282
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_19442
	ld bc, NULL
	call Func_1c12
	ld a, $0a
	call SetPendingVBlankMode
	call Func_1282
	farcall Func_6046
	call RequestVBlankMode
	call WaitForVBlank
	ld bc, $b038
	call Func_1c1d
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	pop de
	pop bc
	pop af
	ret

Func_1947f:
	push af
	farcall Func_5f79
	ld a, $0a
	call SetPendingVBlankMode
	call Func_1282
	farcall Func_6015
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_19496:
	push af
	ld a, $14
	call SetPendingVBlankMode
	call Func_194b6
	ld a, [$cedc]
	and $02
	jr z, .asm_194ab
	call Func_194ff
	jr .asm_194ae
.asm_194ab
	call Func_19545
.asm_194ae
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_194b6:
	push af
	push bc
	push de
	push hl
	call Func_1134
	ld a, [$cedd]
	ld c, a
	ld a, [$cede]
	ld b, a
	call Func_1508
	bcbgcoord 11, 0
	call AddWordToVBlankStruct
	ld de, wTextBuffer
	ld c, $08
.asm_194d3
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_194d3
	ld bc, vTiles1 tile $58
	call AddWordToVBlankStruct
	ld de, wTextBuffer
	ld c, $08
.asm_194ec
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
	farcall LoadCharTileToVBlankStruct
	dec c
	jr nz, .asm_194ec
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_194ff:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	ld a, [$cee3]
	ld c, a
	ld a, [$cee4]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	ld a, b
	cp $ff
	jr nz, .asm_1951e
	farcall Func_5313
.asm_1951e
	bcbgcoord 11, 2
	call AddWordToVBlankStruct
	ld hl, $5541
	ld c, $04
.asm_19529
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_19529
	ld hl, wTextBuffer
	ld c, $04
.asm_19535
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_19535
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x19541

SECTION "Bank 6@5545", ROMX[$5545], BANK[$6]

Func_19545:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	ld a, [$cee5]
	ld c, a
	ld a, [$cee6]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	ld a, b
	cp $ff
	jr nz, .asm_19564
	farcall Func_5313
.asm_19564
	bcbgcoord 11, 3
	call AddWordToVBlankStruct
	ld hl, $5587
	ld c, $04
.asm_1956f
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_1956f
	ld hl, wTextBuffer
	ld c, $04
.asm_1957b
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_1957b
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x19587

SECTION "Bank 6@558b", ROMX[$558b], BANK[$6]

Func_1958b:
	push bc
	ld c, $14
.asm_1958e
	call WaitForVBlank
	dec c
	jr nz, .asm_1958e
	call Func_195a4
	call Func_19678
	ld c, $28
.asm_1959c
	call WaitForVBlank
	dec c
	jr nz, .asm_1959c
	pop bc
	ret

Func_195a4:
	push af
	push bc
	push de
	push hl
	ld a, [$ced4]
	ld [$cdf5], a
	ld a, [$ced5]
	ld [$cdf6], a
	ld a, $00
	ld [$cdf7], a
	ld a, [$ced6]
	ld [$cdf8], a
	ld a, [$ced7]
	ld [$cdf9], a
	ld a, $00
	ld [$cdfa], a
	call Func_1d2a
	cp FALSE
	jr z, .asm_1962a
	call Func_2b52
	ld a, [$ced4]
	ld c, a
	ld a, [$ced5]
	ld b, a
	ld d, $00
.asm_195de
	ld e, $0a
.asm_195e0
	ld a, c
	ld [$cdf5], a
	ld a, b
	ld [$cdf6], a
	call Func_1d2a
	cp TRUE
	jr z, .asm_195f1
	ld d, $01
.asm_195f1
	ld a, d
	cp $01
	jr z, .asm_19622
	ld a, $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	ld a, $00
	ld [$cade], a
	ld a, c
	ld [$cadf], a
	ld a, b
	ld [$cae0], a
	ld a, $00
	ld [$cae1], a
	push de
	call Func_13db
	pop de
	ld a, [wHexNumber + 0]
	ld c, a
	ld a, [wHexNumber + 1]
	ld b, a
	dec e
	jr nz, .asm_195e0
.asm_19622
	call Func_1962f
	ld a, d
	cp $00
	jr z, .asm_195de
.asm_1962a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1962f:
	push af
	push bc
	push de
	push hl
	ld a, $14
	call SetPendingVBlankMode
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	farcall SetTextArg
	farcall LoadText
	ld a, b
	cp $ff
	jr nz, .asm_1964b
	farcall Func_5313
.asm_1964b
	bcbgcoord 0, 16
	call AddWordToVBlankStruct
	ld hl, $5674
	ld c, $04
.asm_19656
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_19656
	ld hl, wTextBuffer
	ld c, $04
.asm_19662
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_19662
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x19674

SECTION "Bank 6@5678", ROMX[$5678], BANK[$6]

Func_19678:
	push af
	push bc
	push de
	push hl
	ld a, [$cedf]
	ld [$cdf5], a
	ld a, [$cee0]
	ld [$cdf6], a
	ld a, $00
	ld [$cdf7], a
	ld a, [$cee1]
	ld [$cdf8], a
	ld a, [$cee2]
	ld [$cdf9], a
	ld a, $00
	ld [$cdfa], a
	call Func_1d2a
	cp $01
	jr z, .asm_196fe
	call Func_2b52
	ld a, [$cedf]
	ld c, a
	ld a, [$cee0]
	ld b, a
	ld d, $00
.asm_196b2
	ld e, $0a
.asm_196b4
	ld a, c
	ld [$cdf5], a
	ld a, b
	ld [$cdf6], a
	call Func_1d2a
	cp TRUE
	jr z, .asm_196c5
	ld d, $01
.asm_196c5
	ld a, d
	cp $01
	jr z, .asm_196f6
	ld a, $01
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	ld a, $00
	ld [$cade], a
	ld a, c
	ld [$cadf], a
	ld a, b
	ld [$cae0], a
	ld a, $00
	ld [$cae1], a
	push de
	call Func_13db
	pop de
	ld a, [wHexNumber + 0]
	ld c, a
	ld a, [wHexNumber + 1]
	ld b, a
	dec e
	jr nz, .asm_196b4
.asm_196f6
	call Func_19703
	ld a, d
	cp $00
	jr z, .asm_196b2
.asm_196fe
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_19703:
	push af
	push bc
	push de
	push hl
	ld a, $14
	call SetPendingVBlankMode
	ld a, TEXTLOAD_0A
	farcall SetTextLoadMode
	farcall SetTextArg
	farcall LoadText
	ld a, b
	cp $ff
	jr nz, .asm_1971f
	farcall Func_5313
.asm_1971f
	bcbgcoord 10, 16
	call AddWordToVBlankStruct
	ld hl, $5748
	ld c, $04
.asm_1972a
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_1972a
	ld hl, wTextBuffer
	ld c, $04
.asm_19736
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_19736
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x19748


