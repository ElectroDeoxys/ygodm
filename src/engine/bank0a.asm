	dw BANK(@)

	farcall_table_start
	farfunc Func_2801e ; $03
	farfunc $4392 ; $05
	farfunc $4776 ; $07
	farfunc $49b8 ; $09
	farfunc Func_28b5a ; $0b
	farfunc $4e0c ; $0d
	farfunc $5163 ; $0f
	farfunc $4fae ; $11
	farfunc $45d4 ; $13
	farfunc DrawMainMenu ; $15
	farfunc $65d4 ; $17
	farfunc $6813 ; $19
	farfunc Func_2b9ed ; $1b
	farfunc $79c2 ; $1f

Func_2801e:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1 tile $50
	ld hl, $405a
	ld b, $20
.asm_2802a
	ld c, $10
.asm_2802c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2802c
	dec b
	jr nz, .asm_2802a
	ld de, vBGMap0
	ld hl, $422a
	ld b, $12
.asm_2803d
	ld c, $14
.asm_2803f
	ld a, [hli]
	add $d0
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2803f
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_2803d
	call Func_2baf9
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2805a

SECTION "Bank a@4b5a", ROMX[$4b5a], BANK[$a]

Func_28b5a:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, $4b94
	ld b, $80
.asm_28b66
	ld c, $10
.asm_28b68
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28b68
	dec b
	jr nz, .asm_28b66
	ld de, vBGMap0
	ld hl, $4ca4
	ld b, $12
.asm_28b79
	ld c, $14
.asm_28b7b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28b7b
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_28b79
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x28b94

SECTION "Bank a@5422", ROMX[$5422], BANK[$a]

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

MainMenuGfx: INCBIN "gfx/gfx_2946c.2bpp"
; 0x2a46c

SECTION "Bank a@79ed", ROMX[$79ed], BANK[$a]

Func_2b9ed:
	push af
	push bc
	push de
	push hl
	ld bc, $7a0f
	ld hl, vBGMap1
	ld d, $05
.asm_2b9f9
	ld e, $14
.asm_2b9fb
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_2b9fb
	push bc
	ld bc, $c
	add hl, bc
	pop bc
	dec d
	jr nz, .asm_2b9f9
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2ba0f

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

SECTION "Bank a@7af9", ROMX[$7af9], BANK[$a]

Func_2baf9:
	push af
	push bc
	push de
	push hl
	ld bc, $7b1b
	ld hl, vBGMap1
	ld d, $05
.asm_2bb05
	ld e, $14
.asm_2bb07
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_2bb07
	push bc
	ld bc, $c
	add hl, bc
	pop bc
	dec d
	jr nz, .asm_2bb05
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2bb1b
