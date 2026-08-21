	dw BANK(@)

	farcall_table_start
	farfunc Func_fc004

Func_fc004::
	push af
	push bc
	push de
	push hl
	ld c, a
	ldh a, [rIE]
	ld d, a
	and ~(IE_VBLANK | IE_STAT)
	ldh [rIE], a
	push de
	call Func_fc04e
	push af
	ldh a, [$ffde]
	cp $00
	jr nz, .asm_fc01f
	add sp, $04
	jr .asm_fc03f
.asm_fc01f
	cp $01
	jr nz, .asm_fc027
	add sp, $04
	jr .asm_fc03f
.asm_fc027
	pop af
	ld b, $00
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	pop de
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld a, d
	ldh [rIE], a
.asm_fc03f
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw $41d4
	dw $41e0
	dw $4216
	dw $42c6
	dw $4290

Func_fc04e:
	push af
	push bc
	push de
	push hl
	cp $00
	jr nz, .skip
	ld a, $00
	ldh [rBGP], a
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, $4421
	call Func_fc114
	ld e, $00
.asm_fc067
	ldh a, [rLY]
	cp 0
	jr nz, .asm_fc067
.asm_fc06d
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .asm_fc06d
	ld d, $0a
.asm_fc075
	ld a, JOYP_GET_CTRL_PAD
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, JOYP_GET_BUTTONS
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ldh a, [rJOYP]
	cp $fe
	jr nz, .asm_fc0a5
	ld e, $01
.asm_fc0a5
	dec d
	jr nz, .asm_fc075
	ld hl, $4431
	call Func_fc114
	ld d, $00
	ld b, $00
	sla e
	ld c, $00
	ldh a, [$ffdd]
	cp BOOTUP_A_SGB2
	jr nz, .asm_fc0be
	ld c, $01
.asm_fc0be
	ld hl, $40cb
	add hl, de
	add hl, bc
	ld a, [hl]
	ldh [$ffde], a
.skip
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xfc0cb

SECTION "Bank 3f@4114", ROMX[$4114], BANK[$3f]

Func_fc114:
	push af
	push bc
	push de
.asm_fc117
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .asm_fc117
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	ld a, JOYP_SGB_START
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	ld d, $10
.asm_fc12b
	ld a, [hli]
	ld b, a
	ld e, $08
.asm_fc12f
	srl b
	jr c, .bit_set
; bit unset
	ld a, JOYP_SGB_ZERO
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	jr .asm_fc145
.bit_set
	ld a, JOYP_SGB_ONE
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
.asm_fc145
	dec e
	jr nz, .asm_fc12f
	dec d
	jr nz, .asm_fc12b
	ld a, JOYP_SGB_ZERO
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	call Func_fc15a
	pop de
	pop bc
	pop af
	ret

Func_fc15a:
	push af
	push bc
	ld b, $04
.asm_fc15e
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .asm_fc15e
.asm_fc164
	ldh a, [rLY]
	cp 0
	jr nz, .asm_fc164
	dec b
	jr nz, .asm_fc15e
	pop bc
	pop af
	ret
; 0xfc170
