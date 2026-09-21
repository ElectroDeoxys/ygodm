Func_3f00::
	call Bankswitch1
	ld c, $00
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

Func_3f18::
	call WaitForVBlank
	ld a, [wJoypadDown]
	or a
	ret z
	ld c, $01
	ret

Func_3f23::
	call WaitForVBlank
	ld a, [wJoypadDown]
	or a
	ret z
	ld b, $01
	ret

Func_3f2e::
	push af
	ld a, [wJoypadDown]
	or a
	call z, WaitForVBlank
	pop af
	ret

Func_3f38::
	ld a, [wJoypadDown]
	or a
	ld a, $02
	jr z, .asm_3f41
	dec a
.asm_3f41
	ld [wcf41], a
	ret

Func_3f45::
	ld a, [wJoypadDown]
	or a
	ld a, $02
	jr z, .asm_3f4e
	dec a
.asm_3f4e
	ld [wcd45], a
	ret
