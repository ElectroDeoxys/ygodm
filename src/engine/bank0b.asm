	dw BANK(@)

	farcall_table_start
	farfunc Func_2c00a
	farfunc $44c9
	farfunc $4b88
	farfunc $5717

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
Gfx_2c851: INCBIN "gfx/gfx_2c851.2bpp"
