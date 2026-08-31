	dw BANK(@)

	farcall_table_start
	farfunc Func_2c00a
	farfunc $44c9
	farfunc $4b88
	farfunc Func_2d717

Func_2c00a:
	push af
	push bc
	push de
	push hl

	ld de, vTiles2
	ld hl, Gfx_2c051
	ld b, $80 ; tiles
.loop_tiles_1
	ld c, 1 tiles
.loop_copy_tile_1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy_tile_1
	dec b
	jr nz, .loop_tiles_1

	; hl = Gfx_2c851
	ld de, vTiles1
	ld b, $80 ; tiles
.loop_tiles_2
	ld c, 1 tiles
.loop_copy_tile_2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy_tile_2
	dec b
	jr nz, .loop_tiles_2

	debgcoord 0, 0
	ld hl, $4361
	ld b, SCREEN_HEIGHT
.asm_2c039
	ld c, SCREEN_WIDTH
.asm_2c03b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2c03b
	push hl
	ld hl, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_2c039

	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2c051: INCBIN "gfx/gfx_2c051.2bpp"
Gfx_2c851: ;INCBIN "gfx/gfx_2c851.2bpp"

SECTION "Bank b@5717", ROMX[$5717], BANK[$b]

Func_2d717:
	push af
	push bc
	push de
	push hl
	ld hl, $575e
	ld de, vTiles2
	ld b, $80
.asm_2d723
	ld c, $10
.asm_2d725
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2d725
	dec b
	jr nz, .asm_2d723
	ld de, vTiles1
	ld b, $80
.asm_2d733
	ld c, $10
.asm_2d735
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2d735
	dec b
	jr nz, .asm_2d733
	ld de, vBGMap0
	ld hl, $675e
	ld b, $12
.asm_2d746
	ld c, $14
.asm_2d748
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2d748
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_2d746
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2d75e
