	dw BANK(@)

	farcall_table_start
	farfunc Func_18008
	farfunc $51c5
	farfunc $5272

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
	call Func_18042
	call Func_1817b
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

Func_18042:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles1 tile $3b
	ld de, Gfx_1805e
	ld b, $10 ; tiles
.asm_1804e
	ld c, TILE_SIZE
.asm_18050
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_18050
	dec b
	jr nz, .asm_1804e
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
	ld hl, $4229
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

Func_1817b:
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
