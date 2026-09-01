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
	ld hl, $4055
	ld de, vTiles2
	ld b, $80
.asm_3001a
	ld c, $10
.asm_3001c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3001c
	dec b
	jr nz, .asm_3001a
	ld de, vTiles1
	ld b, $80
.asm_3002a
	ld c, $10
.asm_3002c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3002c
	dec b
	jr nz, .asm_3002a
	ld de, vBGMap0
	ld hl, $4ff5
	ld b, $12
.asm_3003d
	ld c, $14
.asm_3003f
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3003f
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_3003d
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x30055

SECTION "Bank c@515d", ROMX[$515d], BANK[$c]

Func_3115d:
	push af
	push bc
	push de
	push hl
	ld hl, $51a4
	ld de, vTiles2
	ld b, $80
.asm_31169
	ld c, $10
.asm_3116b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3116b
	dec b
	jr nz, .asm_31169
	ld de, vTiles1
	ld b, $80
.asm_31179
	ld c, $10
.asm_3117b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3117b
	dec b
	jr nz, .asm_31179
	ld de, vBGMap0
	ld hl, $61a4
	ld b, $12
.asm_3118c
	ld c, $14
.asm_3118e
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3118e
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_3118c
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x311a4

SECTION "Bank c@630c", ROMX[$630c], BANK[$c]

Func_3230c:
	push af
	push bc
	push de
	push hl
	ld hl, $6353
	ld de, vTiles2
	ld b, $80
.asm_32318
	ld c, $10
.asm_3231a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3231a
	dec b
	jr nz, .asm_32318
	ld de, vTiles1
	ld b, $80
.asm_32328
	ld c, $10
.asm_3232a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3232a
	dec b
	jr nz, .asm_32328
	ld de, vBGMap0
	ld hl, $7353
	ld b, $12
.asm_3233b
	ld c, $14
.asm_3233d
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3233d
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_3233b
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x32353

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
	farcall Func_2b9ed
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_334f5: INCBIN "gfx/gfx_334f5.2bpp"

SECTION "Bank c@772d", ROMX[$772d], BANK[$c]

Func_3372d:
	push af
	push bc
	push de
	push hl
	ld de, vBGMap0
	ld hl, $7751
	ld b, $12
.asm_33739
	ld c, $14
.asm_3373b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3373b
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_33739
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x33751

SECTION "Bank c@78b9", ROMX[$78b9], BANK[$c]

Func_338b9:
	push af
	push bc
	push de
	push hl
	ld hl, Gfx_334f5
	ld de, vTiles1 tile $50
	ld b, $30
.asm_338c5
	ld c, $10
.asm_338c7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_338c7
	dec b
	jr nz, .asm_338c5
	ld de, vBGMap0
	ld hl, $78f0
	ld b, $12
.asm_338d8
	ld c, $14
.asm_338da
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_338da
	push hl
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .asm_338d8
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x338f0
