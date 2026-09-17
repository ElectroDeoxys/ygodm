Func_396:
	push af
	ld a, $ff
	ld [wJoypadDown], a
	xor a
	ld [wJoypadPressed], a
	ld [wcaa7], a
	ld a, $14
	ld [wcaa8], a
	pop af
	ret

ReadJoypad:
	push af
	push bc
	push de
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

	ld a, [wJoypadDown] ; keys that were already down
	ld d, a
	xor c
	and c
	ld [wJoypadPressed], a ; key that are pressed on this frame
	ld a, c
	ld [wJoypadDown], a ; update keys down

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a

	ld a, [wJoypadDown]
	cp d
	jr nz, .asm_400
	ld a, $00
	ld [wcaa7], a
	ld a, [wcaa8]
	dec a
	ld [wcaa8], a
	jr nz, .asm_3fe
	ld a, $03
	ld [wcaa8], a
	ld a, d
	ld [wcaa7], a
.asm_3fe
	jr .done
.asm_400
	ld [wcaa7], a
	ld a, $14
	ld [wcaa8], a
.done
	pop de
	pop bc
	pop af
	ret
