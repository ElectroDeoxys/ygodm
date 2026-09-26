Func_bf00:
	ld a, [wCharTile]
	ld l, a
	ld h, HIGH(wde00)
	ld a, [hl]
	cp $ff
	jr nz, .asm_bf19
	ld a, [wde80]
	ld [hl], a
	inc a
	cp $3a
	jr c, .asm_bf15
	xor a
.asm_bf15
	ld [wde80], a
	ld a, [hl]
.asm_bf19
	ld e, a
	ld hl, wcd20
	ld a, [wcd48 + 1]
	add l
	ld l, a
	ld a, $c6
	add e
	ld [hl], a
	call Func_8511
	xor $80
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, vTiles1
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	ld a, [wCharTile]
	call LoadCharTileToVBlankStruct
	ret

Func_bf42:
	push hl
	push bc
	ld hl, wde00
	ld a, $ff
	ld c, $80
.asm_bf4b
	ld [hli], a
	dec c
	jr nz, .asm_bf4b
	xor a
	ld [wde80], a
	pop bc
	pop hl
	jp Func_86ec

Func_bf58:
	ld hl, wcd20
	ld a, [wcd48 + 1]
	add l
	ld l, a
	ld [hl], $ff
	ld bc, vTiles1 tile $7f
	jp AddWordToVBlankStruct
