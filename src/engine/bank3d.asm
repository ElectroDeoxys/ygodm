	dw BANK(@)

Func_f4002::
	ld a, IE_VBLANK
	ldh [rIE], a
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ldh [rSTAT], a
	ldh [rSCY], a
	ldh [rSCX], a

	call Func_f40c8

	ld hl, wcfe1
	ld de, wcff1
	ld b, $00
	call FillMemFromHLToDE

	ld a, $60
	ld [wcfe8], a
	ld a, $02
	ld [wcfe9], a
	ld a, $b8
	ld [wcfec], a
	ld a, $44
	ld [wcfed], a

	ld hl, vBGMap0
	debgcoord 31, 31
	ld b, $00
	call FillMemFromHLToDE

	ld hl, FontGfx
	ld de, vTiles0
	ld bc, $80 tiles
	call Copy1bpp

	ld a, LCDC_BG_ON | LCDC_BLOCK01 | LCDC_ON
	ldh [rLCDC], a

	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
.asm_f4058
	xor a
	ld [wcfe2], a
.asm_f405c
	ld a, [wcfe2]
	or a
	jr z, .asm_f405c
	ld a, [wcfee]
	or a
	jr z, .asm_f406a
	debug_loop
.asm_f406a
	ld de, $40

	call ReadJoypad_Credits

	ld a, [wcff1]
	ld b, a
	ld a, [wcff0]
	bit B_PAD_A, a
	jr nz, .a_btn
	bit B_PAD_B, a
	jr nz, .b_btn
	jr .asm_f4089
.a_btn
	ld de, $200
	jr .asm_f4089
.b_btn
	ld de, NULL
.asm_f4089
	ld a, [wcfe4]
	add e
	ld [wcfe4], a
	ld a, [wcfe5]
	adc d
	ld [wcfe5], a
	ldh [rSCY], a
	ld a, [wcfea]
	add e
	ld [wcfea], a
	ld a, [wcfeb]
	adc d
	ld [wcfeb], a
	jr .asm_f4058

; fills memory values from hl to de (inclusive)
; with fill value given in b
FillMemFromHLToDE:
.loop
	ld a, b
	ld [hli], a
	ld a, h
	cp d
	jr nz, .loop
	ld a, l
	cp e
	jr nz, .loop
	ret
; 0xf40b4

SECTION "Bank 3d@40bd", ROMX[$40bd], BANK[$3d]

; copies 1bpp graphics data (bc bytes) from hl to de
Copy1bpp:
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Func_f40c8:
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	ret z ; LCD off
	ldh a, [rIE]
	ld [wcfe3], a
	res B_IE_VBLANK, a
	ldh [rIE], a
.asm_f40d6
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .asm_f40d6
	ldh a, [rLCDC]
	and ~LCDC_ON
	ldh [rLCDC], a
	ld a, [wcfe3]
	ldh [rIE], a
	ret

FontGfx: INCBIN "gfx/gfx_f40e8.1bpp"

SECTION "Bank 3d@6e5d", ROMX[$6e5d], BANK[$3d]

Func_f6e5d::
.asm_f6e5d
	ld a, [wcfeb]
	cp $08
	ret c
	sub $08
	ld [wcfeb], a
	ld b, SCREEN_WIDTH
	ld a, [wcfe8]
	add TILEMAP_WIDTH
	ld e, a
	ld [wcfe8], a
	ld a, [wcfe9]
	adc $00
	and $03
	ld d, a
	ld [wcfe9], a
	ld hl, vBGMap0
	add hl, de
	ld e, l
	ld d, h
	ld a, [wcfec]
	ld l, a
	ld a, [wcfed]
	ld h, a
.asm_f6e8c
	ld a, b
	or a
	jr z, .asm_f6e9a
	ld a, [hli]
	cp $ff
	jr z, .asm_f6ea4
	ld [de], a
	inc de
	dec b
	jr .asm_f6e8c
.asm_f6e9a
	ld a, l
	ld [wcfec], a
	ld a, h
	ld [wcfed], a
	jr .asm_f6e5d
.asm_f6ea4
	ld a, $01
	ld [wcfee], a
	ret

ReadJoypad_Credits:
	; read d-pad
	ld a, JOYP_GET_CTRL_PAD
	ldh [rJOYP], a
	REPT 2
		ldh a, [rJOYP]
	ENDR
	cpl
	and JOYP_INPUTS
	swap a
	ld b, a

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a

	; read buttons
	ld a, JOYP_GET_BUTTONS
	ldh [rJOYP], a
	REPT 6
		ldh a, [rJOYP]
	ENDR
	cpl
	and JOYP_INPUTS
	or b
	ld c, a
	; c holds all input of current frame

	ld a, [wcff0] ; keys that were already down
	xor c
	and c
	ld [wcff1], a ; key that are pressed on this frame
	ld a, c
	ld [wcff0], a ; update keys down

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ret
; 0xf6ee2
