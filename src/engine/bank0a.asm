	dw BANK(@)

	farcall_table_start
	farfunc $401e ; $03
	farfunc $4392 ; $05
	farfunc $4776 ; $07
	farfunc $49b8 ; $09
	farfunc $4b5a ; $0b
	farfunc $4e0c ; $0d
	farfunc $5163 ; $0f
	farfunc $4fae ; $11
	farfunc $45d4 ; $13
	farfunc Func_29422 ; $15
	farfunc $65d4 ; $17
	farfunc $6813 ; $19
	farfunc $79ed ; $1b
	farfunc $79c2 ; $1f

SECTION "Bank a@5422", ROMX[$5422], BANK[$a]

Func_29422:
	push af
	push bc
	push de
	push hl
	ld de, vTiles2
	ld hl, Gfx_2946c
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
	ld hl, $646c
	ld b, $12
.asm_29451
	ld c, $14
.asm_29453
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_29453
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_29451
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_2946c: INCBIN "gfx/gfx_2946c.2bpp"
; 0x2a46c

SECTION "Bank a@7a73", ROMX[$7a73], BANK[$a]

Func_2ba73:
	push af
	push bc
	push de
	push hl
	ld bc, $7a95
	ld hl, vBGMap1
	ld d, $05
.asm_2ba7f
	ld e, $14
.asm_2ba81
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_2ba81
	push bc
	ld bc, $c
	add hl, bc
	pop bc
	dec d
	jr nz, .asm_2ba7f
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2ba95
