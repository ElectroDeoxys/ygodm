	dw BANK(@)

	farcall_table_start
	farfunc Func_2c00a
	farfunc Func_2c4c9
	farfunc Func_2cb88
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
	ld hl, Tilemap_2c361
	ld b, SCREEN_HEIGHT ; rows
.loop_rows
	ld c, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_cols
	push hl
	ld hl, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .loop_rows

	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2c051: INCBIN "gfx/gfx_2c051.2bpp"
Tilemap_2c361: INCBIN "data/tilemaps/bg_2c361.tilemap"

Func_2c4c9:
	push af
	push bc
	push de
	push hl
	ld de, vTiles2
	ld hl, Gfx_2c510
	ld b, $80 ; tiles
.asm_2c4d5
	ld c, TILE_SIZE
.asm_2c4d7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2c4d7
	dec b
	jr nz, .asm_2c4d5
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_2c4e5
	ld c, TILE_SIZE
.asm_2c4e7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2c4e7
	dec b
	jr nz, .asm_2c4e5
	ld de, vBGMap0
	ld hl, Tilemap_2ca20
	ld b, SCREEN_HEIGHT ; rows
.loop_rows
	ld c, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_cols
	push hl
	ld hl, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .loop_rows
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2c510: INCBIN "gfx/gfx_2c510.2bpp"
Tilemap_2ca20: INCBIN "data/tilemaps/bg_2ca20.tilemap"

Func_2cb88:
	push af
	push bc
	push de
	push hl
	ld de, vTiles2
	ld hl, Gfx_2cbcf
	ld b, $80 ; tiles
.asm_2cb94
	ld c, TILE_SIZE
.asm_2cb96
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2cb96
	dec b
	jr nz, .asm_2cb94
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_2cba4
	ld c, TILE_SIZE
.asm_2cba6
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2cba6
	dec b
	jr nz, .asm_2cba4
	ld de, vBGMap0
	ld hl, Tilemap_2d5af
	ld b, SCREEN_HEIGHT ; rows
.loop_rows
	ld c, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_cols
	push hl
	ld hl, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .loop_rows
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2cbcf: INCBIN "gfx/gfx_2cbcf.2bpp"
Tilemap_2d5af: INCBIN "data/tilemaps/bg_2d5af.tilemap"

Func_2d717:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_2d75e
	ld de, vTiles2
	ld b, $80 ; tiles
.asm_2d723
	ld c, TILE_SIZE
.asm_2d725
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2d725
	dec b
	jr nz, .asm_2d723
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_2d733
	ld c, TILE_SIZE
.asm_2d735
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2d735
	dec b
	jr nz, .asm_2d733
	ld de, vBGMap0
	ld hl, Tilemap_2e75e
	ld b, SCREEN_HEIGHT ; rows
.loop_rows
	ld c, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_cols
	push hl
	ld hl, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .loop_rows
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2d75e: INCBIN "gfx/gfx_2d75e.2bpp"
Tilemap_2e75e: INCBIN "data/tilemaps/bg_2e75e.tilemap"
