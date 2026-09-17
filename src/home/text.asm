Func_1114::
	push af
	ld a, $01
	ld [wcace], a
	pop af
	ret

Func_111c::
	push af
	ld a, $00
	ld [wcace], a
	pop af
	ret

Func_1124::
	push af
	ld a, $03
	ld [wcace], a
	pop af
	ret

Func_112c::
	push af
	ld a, $02
	ld [wcace], a
	pop af
	ret

Func_1134::
	push af
	ld a, $05
	ld [wcace], a
	pop af
	ret

Func_113c::
	push af
	ld a, $04
	ld [wcace], a
	pop af
	ret

; input:
; - a = character
ProcessChar::
	push af
	push bc
	push de
	push hl
	ld e, $00
	ld d, a
	cp DIACRITIC_CHAR
	jr c, .not_diacritic_char
	ld b, $00
	sub DIACRITIC_CHAR
	rlca
	ld c, a
	ld hl, CharsWithDiacritics
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
.not_diacritic_char
	; is it space character?
	ld a, d
	cp ' '
	jr nz, .not_space
	ld b, $00
	ld a, [wcace]
	ld c, a
	ld hl, Data_1184
	add hl, bc
	ld d, [hl]
.not_space
	ld a, d
	ld [wCharTile], a
	ld a, [wcace]
	add e
	ld e, a
	ld d, $00
	ld hl, Data_118c
	add hl, de
	ld a, [hl]
	ld [wCharHeadTile], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Data_1184:
	db ' '
	db ' '
	db ' '
	db ' '
	db ' '
	db ' '
	db ' '
	db ' '

Data_118c:
	db ' '
	db $d3
	db SYM_WHITE
	db SYM_BAR_HORIZONTAL
	db $80
	db $83
	db ' '
	db ' '
	db '゛'
	db $7d
	db SYM_DAKUTEN
	db SYM_BAR_DAKUTEN
	db $8d
	db $8f
	db ' '
	db ' '
	db '゜'
	db $7e
	db SYM_HANDAKUTEN
	db SYM_BAR_HANDAKUTEN
	db $8e
	db $90
	db ' '
	db ' '

INCLUDE "data/diacritics.asm"
