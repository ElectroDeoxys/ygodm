Func_1bf00:
	ld a, [wJoypadDown]
	or a
	jr nz, .keys_down
	call RequestVBlankMode
	jp WaitForVBlank
.keys_down
	ld bc, wVBlankStruct
	call .Func_1bf4d
	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	ld d, $08
.loop
	REPT 16
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR
	dec d
	jr nz, .loop
.Func_1bf4d
	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR
	ret
