	dw BANK(@)

	farcall_table_start
	farfunc Func_2801e ; $03
	farfunc Func_28392 ; $05
	farfunc Func_28776 ; $07
	farfunc $49b8 ; $09
	farfunc Func_28b5a ; $0b
	farfunc Func_28e0c ; $0d
	farfunc Func_29163 ; $0f
	farfunc Func_28fae ; $11
	farfunc $45d4 ; $13
	farfunc DrawMainMenu ; $15
	farfunc $65d4 ; $17
	farfunc Func_2a813 ; $19
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

SECTION "Bank a@4392", ROMX[$4392], BANK[$a]

Func_28392:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, $43cc
	ld b, $80
.asm_2839e
	ld c, $10
.asm_283a0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_283a0
	dec b
	jr nz, .asm_2839e
	ld de, vBGMap0
	ld hl, $446c
	ld b, $12
.asm_283b1
	ld c, $14
.asm_283b3
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_283b3
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_283b1
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x283cc

SECTION "Bank a@4776", ROMX[$4776], BANK[$a]

Func_28776:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, $47b0
	ld b, $80
.asm_28782
	ld c, $10
.asm_28784
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28784
	dec b
	jr nz, .asm_28782
	ld de, vBGMap0
	ld hl, $4850
	ld b, $12
.asm_28795
	ld c, $14
.asm_28797
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28797
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_28795
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x287b0

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

SECTION "Bank a@4e0c", ROMX[$4e0c], BANK[$a]

Func_28e0c:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, $4b94
	ld b, $80
.asm_28e18
	ld c, $10
.asm_28e1a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28e1a
	dec b
	jr nz, .asm_28e18
	ld de, vBGMap0
	ld hl, $4e46
	ld b, $12
.asm_28e2b
	ld c, $14
.asm_28e2d
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28e2d
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_28e2b
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x28e46

SECTION "Bank a@4fae", ROMX[$4fae], BANK[$a]

Func_28fae:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, $405a
	ld b, $02
.asm_28fba
	ld c, $10
.asm_28fbc
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28fbc
	dec b
	jr nz, .asm_28fba
	ld de, vTiles1 tile $50
	ld hl, $405a
	ld b, $30
.asm_28fcd
	ld c, $10
.asm_28fcf
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28fcf
	dec b
	jr nz, .asm_28fcd
	ld de, vBGMap0
	ld hl, $4ffb
	ld b, $12
.asm_28fe0
	ld c, $14
.asm_28fe2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28fe2
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_28fe0
	call Func_2ba73
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x28ffb

SECTION "Bank a@5163", ROMX[$5163], BANK[$a]

Func_29163:
	push af
	push bc
	push de
	push hl
	ld de, vTiles1
	ld hl, $51aa
	ld b, $11
.asm_2916f
	ld c, $10
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
	ld b, $10
.asm_29181
	ld c, $10
.asm_29183
	ld [hli], a
	dec c
	jr nz, .asm_29183
	dec b
	jr nz, .asm_29181
	ld de, vBGMap0
	ld hl, $52ba
	ld b, $12
.asm_29192
	ld c, $14
.asm_29194
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_29194
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_29192
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x291aa

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

SECTION "Bank a@6813", ROMX[$6813], BANK[$a]

Func_2a813:
	push af
	push bc
	push de
	push hl
	ld de, vTiles2
	ld hl, $685a
	ld b, $80
.asm_2a81f
	ld c, $10
.asm_2a821
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2a821
	dec b
	jr nz, .asm_2a81f
	ld de, vTiles1
	ld b, $80
.asm_2a82f
	ld c, $10
.asm_2a831
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2a831
	dec b
	jr nz, .asm_2a82f
	ld de, vBGMap0
	ld hl, $785a
	ld b, $12
.asm_2a842
	ld c, $14
.asm_2a844
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2a844
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_2a842
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2a85a

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
