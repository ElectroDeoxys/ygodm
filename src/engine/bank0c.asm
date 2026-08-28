	dw BANK(@)

	farcall_table_start
	farfunc $400e
	farfunc $515d
	farfunc $630c
	farfunc Func_334bb
	farfunc $772d
	farfunc $78b9

SECTION "Bank 0c@74bb", ROMX[$74bb], BANK[$0c]

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
	ld hl, $75c5
	ld b, $12
.asm_334da
	ld c, $14
.asm_334dc
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_334dc
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_334da
	farcall $1b, $0a
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_334f5: INCBIN "gfx/gfx_334f5.2bpp"
