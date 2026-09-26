	dw BANK(@)

	farcall_table_start
	farfunc Func_3000e
	farfunc Func_3115d
	farfunc Func_3230c
	farfunc Func_334bb
	farfunc Func_3372d
	farfunc Func_338b9

Func_3000e:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_30055
	ld de, vTiles2
	ld b, $80 ; tiles
.asm_3001a
	ld c, TILE_SIZE
.asm_3001c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3001c
	dec b
	jr nz, .asm_3001a
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_3002a
	ld c, TILE_SIZE
.asm_3002c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3002c
	dec b
	jr nz, .asm_3002a
	ld de, vBGMap0
	ld hl, Tilemap_30ff5
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

Gfx_30055:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "gfx/gfx_30055_en.2bpp"
ELSE
	INCBIN "gfx/gfx_30055_jp.2bpp"
ENDC

Tilemap_30ff5: 
IF DEF(_EARLY_DAYS_EN)
	INCBIN "data/tilemaps/bg_30ff5_en.tilemap"
ELSE
	INCBIN "data/tilemaps/bg_30ff5_jp.tilemap"
ENDC

Func_3115d:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_311a4
	ld de, vTiles2
	ld b, $80 ; tiles
.asm_31169
	ld c, TILE_SIZE
.asm_3116b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3116b
	dec b
	jr nz, .asm_31169
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_31179
	ld c, TILE_SIZE
.asm_3117b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3117b
	dec b
	jr nz, .asm_31179
	ld de, vBGMap0
	ld hl, Tilemap_321a4
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

Gfx_311a4:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "gfx/gfx_311a4_en.2bpp"
ELSE
	INCBIN "gfx/gfx_311a4_jp.2bpp"
ENDC

Tilemap_321a4:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "data/tilemaps/bg_321a4_en.tilemap"
ELSE
	INCBIN "data/tilemaps/bg_321a4_jp.tilemap"
ENDC

Func_3230c:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_32353
	ld de, vTiles2
	ld b, $80 ; tiles
.asm_32318
	ld c, TILE_SIZE
.asm_3231a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3231a
	dec b
	jr nz, .asm_32318
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_32328
	ld c, TILE_SIZE
.asm_3232a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3232a
	dec b
	jr nz, .asm_32328
	ld de, vBGMap0
	ld hl, Tilemap_33353
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

Gfx_32353:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "gfx/gfx_32353_en.2bpp"
ELSE
	INCBIN "gfx/gfx_32353_jp.2bpp"
ENDC

Tilemap_33353:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "data/tilemaps/bg_33353_en.tilemap"
ELSE
	INCBIN "data/tilemaps/bg_33353_jp.tilemap"
ENDC

Func_334bb:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_334f5
	ld de, vTiles1 tile $50
	ld b, $30
.asm_334c7
	ld c, TILE_SIZE
.loop_copy_tile
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy_tile
	dec b
	jr nz, .asm_334c7
	ld de, vBGMap0
	ld hl, Tilemap_335c5
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
	farcall Func_2b9ed
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_334f5: INCBIN "gfx/gfx_334f5.2bpp"
Tilemap_335c5:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "data/tilemaps/bg_335c5_en.tilemap"
ELSE
	INCBIN "data/tilemaps/bg_335c5_jp.tilemap"
ENDC

Func_3372d:
	push af
	push bc
	push de
	push hl
	ld de, vBGMap0
	ld hl, Tilemap_33751
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

Tilemap_33751:
IF DEF(_EARLY_DAYS_EN)
	INCBIN "data/tilemaps/bg_33751_en.tilemap"
ELSE
	INCBIN "data/tilemaps/bg_33751_jp.tilemap"
ENDC

Func_338b9:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_334f5
	ld de, vTiles1 tile $50
	ld b, $30 ; tiles
.asm_338c5
	ld c, TILE_SIZE
.asm_338c7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_338c7
	dec b
	jr nz, .asm_338c5
	ld de, vBGMap0
	ld hl, Tilemap_338f0
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

Tilemap_338f0:
	IF DEF(_EARLY_DAYS_EN)
		text "                    "
		text " Versus             "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
	ELSE
		text "                    "
		text " せいせき               "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
		text "                    "
	ENDC
