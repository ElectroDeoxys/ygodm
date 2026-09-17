; returns a = (bc == de)
IsBCEqualToDE::
	push hl
	ld l, FALSE
	ld a, b
	cp d
	jr nz, .not_equal
	ld a, c
	cp e
	jr nz, .not_equal
	dec l ; TRUE
.not_equal
	ld a, l
	pop hl
	ret

; output:
; - a = DE_SMALLER_THAN_BC, if de  < bc
; -     DE_EQUAL_TO_BC,     if de == bc
; -     DE_LARGER_THAN_BC,  if de  > bc
CompareBCAndDE::
	push bc
	push de
	push hl

	ld l, DE_LARGER_THAN_BC
	call Func_13bb

	; the following can be replaced
	; with a simple ld a, e
	ld a, e
	cp DE_EQUAL_TO_BC
	jr nz, .asm_1d1e
; were equal
	ld l, DE_EQUAL_TO_BC
.asm_1d1e
	ld a, e
	cp DE_SMALLER_THAN_BC
	jr nz, .asm_1d25
	ld l, DE_SMALLER_THAN_BC
.asm_1d25
	ld a, l

	pop hl
	pop de
	pop bc
	ret

Func_1d2a::
	push de
	push hl
	ld l, $02
	ld a, [wcdf5 + 0]
	ld [wHexNumber + 0], a
	ld a, [wcdf5 + 1]
	ld [wHexNumber + 1], a
	ld a, [wcdf7]
	ld [wcade], a
	ld a, [wcdf8]
	ld [wcadf], a
	ld a, [wcdf9]
	ld [wcae0], a
	ld a, [wcdfa]
	ld [wcae1], a
	call Func_13db
	ld a, e
	cp $01
	jr nz, .asm_1d5c
	ld l, $01
.asm_1d5c
	ld a, e
	cp $00
	jr nz, .asm_1d63
	ld l, $00
.asm_1d63
	ld a, l
	pop hl
	pop de
	ret
