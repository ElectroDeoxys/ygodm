	dw BANK(@)

	farcall_table_start
	farfunc Func_2801e ; $03
	farfunc Func_28392 ; $05
	farfunc Func_28776 ; $07
	farfunc Func_289b8 ; $09
	farfunc Func_28b5a ; $0b
	farfunc Func_28e0c ; $0d
	farfunc Func_29163 ; $0f
	farfunc Func_28fae ; $11
	farfunc Func_285d4 ; $13
	farfunc DrawMainMenu ; $15
	farfunc Func_2a5d4 ; $17
	farfunc Func_2a813 ; $19
	farfunc Func_2b9ed ; $1b
	farfunc Func_2b9c2 ; $1f

Func_2801e:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1 tile $50
	ld hl, Gfx_2805a
	ld b, $20 ; tiles
.asm_2802a
	ld c, TILE_SIZE
.asm_2802c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2802c
	dec b
	jr nz, .asm_2802a
	ld de, vBGMap0
	ld hl, Tilemap_2822a
	ld b, SCREEN_HEIGHT ; rows
.loop_rows
	ld c, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [hli]
	add $d0
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
	call Func_2baf9
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2805a: INCBIN "gfx/gfx_2805a.2bpp"
Tilemap_2822a: INCBIN "data/tilemaps/bg_2822a.tilemap"

Func_28392:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_283cc
	ld b, $80 ; tiles
.asm_2839e
	ld c, TILE_SIZE
.asm_283a0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_283a0
	dec b
	jr nz, .asm_2839e
	ld de, vBGMap0
	ld hl, Tilemap_2846c
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_283cc: INCBIN "gfx/gfx_283cc.2bpp"
Tilemap_2846c: INCBIN "data/tilemaps/bg_2846c.tilemap"

Func_285d4:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_283cc
	ld b, $80 ; tiles
.asm_285e0
	ld c, TILE_SIZE
.asm_285e2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_285e2
	dec b
	jr nz, .asm_285e0
	ld de, vBGMap0
	ld hl, Tilemap_2860e
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_2860e: INCBIN "data/tilemaps/bg_2860e.tilemap"

Func_28776:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_287b0
	ld b, $80 ; tiles
.asm_28782
	ld c, TILE_SIZE
.asm_28784
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28784
	dec b
	jr nz, .asm_28782
	ld de, vBGMap0
	ld hl, Tilemap_28850
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_287b0: INCBIN "gfx/gfx_287b0.2bpp"
Tilemap_28850: INCBIN "data/tilemaps/bg_28850.tilemap"

Func_289b8:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_287b0
	ld b, $80 ; tiles
.asm_289c4
	ld c, TILE_SIZE
.asm_289c6
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_289c6
	dec b
	jr nz, .asm_289c4
	ld de, vBGMap0
	ld hl, Tilemap_289f2
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_289f2: INCBIN "data/tilemaps/bg_289f2.tilemap"

Func_28b5a:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_28b94
	ld b, $80 ; tiles
.asm_28b66
	ld c, TILE_SIZE
.asm_28b68
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28b68
	dec b
	jr nz, .asm_28b66
	ld de, vBGMap0
	ld hl, Tilemap_28ca4
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_28b94: INCBIN "gfx/gfx_28b94.2bpp"
Tilemap_28ca4: INCBIN "data/tilemaps/bg_28ca4.tilemap"

Func_28e0c:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_28b94
	ld b, $80 ; tiles
.asm_28e18
	ld c, TILE_SIZE
.asm_28e1a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28e1a
	dec b
	jr nz, .asm_28e18
	ld de, vBGMap0
	ld hl, Tilemap_28e46
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_28e46: INCBIN "data/tilemaps/bg_28e46.tilemap"

Func_28fae:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_2805a
	ld b, $02 ; tiles
.asm_28fba
	ld c, TILE_SIZE
.asm_28fbc
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28fbc
	dec b
	jr nz, .asm_28fba
	ld de, vTiles1 tile $50
	ld hl, Gfx_2805a
	ld b, $30 ; tiles
.asm_28fcd
	ld c, TILE_SIZE
.asm_28fcf
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28fcf
	dec b
	jr nz, .asm_28fcd
	ld de, vBGMap0
	ld hl, Tilemap_28ffb
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_28ffb: INCBIN "data/tilemaps/bg_28ffb.tilemap"

Func_29163:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_291aa
	ld b, $11 ; tiles
.asm_2916f
	ld c, TILE_SIZE
.asm_29171
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_29171
	dec b
	jr nz, .asm_2916f
	ld hl, vTiles1 tile $50
	ld a, $ff
	ld b, $10 ; tiles
.asm_29181
	ld c, TILE_SIZE
.asm_29183
	ld [hli], a
	dec c
	jr nz, .asm_29183
	dec b
	jr nz, .asm_29181
	ld de, vBGMap0
	ld hl, Tilemap_292ba
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

Gfx_291aa: INCBIN "gfx/gfx_291aa.2bpp"
Tilemap_292ba: INCBIN "data/tilemaps/bg_292ba.tilemap"

DrawMainMenu:
	push af
	push bc
	push de
	push hl
	ld de, vTiles2
	ld hl, MainMenuGfx
	ld b, $80 ; tiles
.asm_2942e
	ld c, TILE_SIZE
.loop_copy_tile
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy_tile
	dec b
	jr nz, .asm_2942e
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_2943e
	ld c, TILE_SIZE
.asm_29440
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_29440
	dec b
	jr nz, .asm_2943e
	ld de, vBGMap0
	ld hl, Tilemap_2a46c
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
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

MainMenuGfx: INCBIN "gfx/gfx_2946c.2bpp"
Tilemap_2a46c: INCBIN "data/tilemaps/bg_2a46c.tilemap"

; unreferenced
Func_2a5d4:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, Gfx_2a60b
	ld b, $11 ; tiles
.asm_2a5e0
	ld c, TILE_SIZE
.asm_2a5e2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2a5e2
	dec b
	jr nz, .asm_2a5e0
	ld de, vBGMap0
	ld hl, Tilemap_2a6ab
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

Gfx_2a60b: INCBIN "gfx/gfx_2a60b.2bpp"
Tilemap_2a6ab: INCBIN "data/tilemaps/bg_2a6ab.tilemap"

Func_2a813:
	push af
	push bc
	push de
	push hl
	ld de, vTiles2
	ld hl, Gfx_2a85a
	ld b, $80 ; tiles
.asm_2a81f
	ld c, TILE_SIZE
.asm_2a821
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2a821
	dec b
	jr nz, .asm_2a81f
	ld de, vTiles1
	ld b, $80 ; tiles
.asm_2a82f
	ld c, TILE_SIZE
.asm_2a831
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2a831
	dec b
	jr nz, .asm_2a82f
	ld de, vBGMap0
	ld hl, Tilemap_2b85a
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

Gfx_2a85a: INCBIN "gfx/gfx_2a85a.2bpp"
Tilemap_2b85a: INCBIN "data/tilemaps/bg_2b85a.tilemap"

; unreferenced
Func_2b9c2:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles1
	xor a
	ld b, $01 ; tiles
.asm_2b9cc
	ld c, TILE_SIZE
.asm_2b9ce
	ld [hli], a
	dec c
	jr nz, .asm_2b9ce
	dec b
	jr nz, .asm_2b9cc
	ld hl, vBGMap0
	ld de, TILEMAP_WIDTH - SCREEN_WIDTH
	xor a
	ld b, SCREEN_HEIGHT ; rows
.asm_2b9de
	ld c, SCREEN_WIDTH ; cols
.asm_2b9e0
	ld [hli], a
	dec c
	jr nz, .asm_2b9e0
	add hl, de
	dec b
	jr nz, .asm_2b9de
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2b9ed:
	push af
	push bc
	push de
	push hl
	ld bc, Tilemap_2ba0f
	ld hl, vBGMap1
	ld d, 5 ; rows
.loop_rows
	ld e, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .loop_cols
	push bc
	ld bc, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec d
	jr nz, .loop_rows
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_2ba0f: INCBIN "data/tilemaps/bg_2ba0f.tilemap"

Func_2ba73:
	push af
	push bc
	push de
	push hl
	ld bc, Tilemap_2ba95
	ld hl, vBGMap1
	ld d, 5 ; rows
.loop_rows
	ld e, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .loop_cols
	push bc
	ld bc, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec d
	jr nz, .loop_rows
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_2ba95: INCBIN "data/tilemaps/bg_2ba95.tilemap"

Func_2baf9:
	push af
	push bc
	push de
	push hl
	ld bc, Tilemap_2bb1b
	ld hl, vBGMap1
	ld d, 5 ; rows
.loop_rows
	ld e, SCREEN_WIDTH ; cols
.loop_cols
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .loop_cols
	push bc
	ld bc, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec d
	jr nz, .loop_rows
	pop hl
	pop de
	pop bc
	pop af
	ret

Tilemap_2bb1b: INCBIN "data/tilemaps/bg_2bb1b.tilemap"
