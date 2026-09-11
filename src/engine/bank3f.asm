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
	call_hl
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
	dw Func_fc1d4
	dw Func_fc1e0
	dw Func_fc216
	dw Func_fc2c6
	dw Func_fc290

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
	ld hl, SGBPacket_fc421
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
	ldh a, [hBootUpA]
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

SECTION "Bank 3f@40cf", ROMX[$40cf], BANK[$3f]

Func_fc0cf:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ldh [rSCY], a
	ld a, $00
	ldh [rSCX], a
	ld a, $00
	ldh [rBGP], a
	ld a, LCDC_BG_ON | LCDC_BLOCK01
	ldh [rLCDC], a
	ld a, $90
	ldh [rWY], a
	ld a, $a6
	ldh [rWX], a
	ld hl, vBGMap0
	xor a
	ld de, $c
	ld b, $11
.asm_fc0f4
	ld c, $14
.asm_fc0f6
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_fc0f6
	add hl, de
	dec b
	jr nz, .asm_fc0f4
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc104:
	push af
	push hl
.asm_fc106
	ldh a, [rLY]
	cp $93
	jr c, .asm_fc106
	ld hl, rLCDC
	res B_LCDC_ENABLE, [hl]
	pop hl
	pop af
	ret

; input:
; - hl = SGB packet to send
Func_fc114:
	push af
	push bc
	push de

	; wait for V-Blank
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait

	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	ld a, JOYP_SGB_START
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a

	ld d, $10 ; bytes
.loop_bytes
	ld a, [hli]
	ld b, a
	ld e, 8 ; bits
.loop_bits
	srl b
	jr c, .bit_set
; bit unset
	ld a, JOYP_SGB_ZERO
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	jr .next_bit
.bit_set
	ld a, JOYP_SGB_ONE
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
.next_bit
	dec e
	jr nz, .loop_bits
	dec d
	jr nz, .loop_bytes

	ld a, JOYP_SGB_ZERO
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	call .Do4Frames
	pop de
	pop bc
	pop af
	ret

.Do4Frames:
	push af
	push bc
	ld b, 4
.loop_frame
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .loop_frame
.wait_begin_frame
	ldh a, [rLY]
	cp 0
	jr nz, .wait_begin_frame
	dec b
	jr nz, .loop_frame
	pop bc
	pop af
	ret
; 0xfc170

SECTION "Bank 3f@417b", ROMX[$417b], BANK[$3f]

Func_fc17b:
	push af
	push bc
	push de
	push hl
	call Func_fc104
	ld a, c
	cp $00
	jr z, .asm_fc18d
.asm_fc187
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_fc187
.asm_fc18d
	ld a, b
	cp $00
	jr z, .asm_fc19d
.asm_fc192
	ld c, $00
.asm_fc194
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_fc194
	dec b
	jr nz, .asm_fc192
.asm_fc19d
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc1a7:
	push af
	push bc
	push hl
	ld hl, $41c4
	ld bc, NULL
.asm_fc1b0
	push hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_fc114
	pop hl
	inc c
	inc c
	ld a, c
	cp $10
	jr c, .asm_fc1b0
	pop hl
	pop bc
	pop af
	ret
; 0xfc1c4

SECTION "Bank 3f@41d4", ROMX[$41d4], BANK[$3f]

Func_fc1d4:
	push af
	push bc
	push de
	push hl
	call Func_fc1a7
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc1e0:
	push af
	push bc
	push de
	push hl
	call Func_fc0cf
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, $43b1
	call Func_fc114
	ld hl, $4348
	ld bc, $5a
	ld de, vTiles0
	call Func_fc17b
	ld hl, $4401
	call Func_fc114
	ld a, $00
	ldh [rBGP], a
	ld hl, $4411
	call Func_fc114
	call Func_fc104
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc216:
	push af
	push bc
	push de
	push hl
	call Func_fc0cf
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, $4441
	call Func_fc114
	ld a, $e4
	ldh [rBGP], a
	ld hl, $4d91
	ld bc, $1000
	ld de, vTiles0
	call Func_fc17b
	ld hl, $4451
	call Func_fc114
	ld bc, $1000
	ld hl, $4d91
	add hl, bc
	ld bc, $1000
	ld de, vTiles0
	call Func_fc17b
	ld hl, $4461
	call Func_fc114
	ld hl, $4531
	ld bc, $1080
	ld de, vTiles0
	call Func_fc17b
	ld hl, $43f1
	call Func_fc114
	ld hl, $43c1
	call Func_fc114
	ld hl, $4348
	ld bc, $5a
	ld de, vTiles0
	call Func_fc17b
	ld hl, $4401
	call Func_fc114
	ld a, $00
	ldh [rBGP], a
	ld hl, $4411
	call Func_fc114
	call Func_fc104
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc290:
	push af
	push bc
	push de
	push hl
	call Func_fc0cf
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, $43e1
	call Func_fc114
	ld hl, $42df
	ld bc, $5a
	ld de, vTiles0
	call Func_fc17b
	ld hl, $4401
	call Func_fc114
	ld a, $00
	ldh [rBGP], a
	ld hl, $4411
	call Func_fc114
	call Func_fc104
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc2c6:
	push af
	push bc
	push hl
	ld a, $00
	ldh [rBGP], a
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, $43d1
	call Func_fc114
	call Func_fc104
	pop hl
	pop bc
	pop af
	ret
; 0xfc2df

SECTION "Bank 3f@4421", ROMX[$4421], BANK[$3f]

SGBPacket_fc421:
	db $89, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
; 0xfc431
