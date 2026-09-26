    dw BANK(@)

    farcall_table_start
    farfunc PrintCardDescription

; prints loaded card's description
; at coordinates (1,13), in two lines
PrintCardDescription:
	IF DEF(_EARLY_DAYS_EN)
		push af
		push bc
		push de
		push hl
		ld a, [wLoadedCardID + 0]
		ld c, a
		ld a, [wLoadedCardID + 1]
		ld b, a
		sla c
		rl b
		ld hl, CardDescriptions
		add hl, bc
		ld a, [hli]
		ld d, [hl]
		ld e, a
		hlbgcoord 1, 14
		call Func_1114
		ld b, $03
	.asm_f0023
		push hl
		ld c, LINE_LENGTH
	.asm_f0026
		ld a, [de]
		inc de
		cp $b0
		jr z, .asm_f003a
		cp $b4
		jr z, .asm_f0049
		call ProcessChar
		ld a, [wCharTile]
		ld [hli], a
		dec c
		jr nz, .asm_f0026
	.asm_f003a
		call Func_111c
		pop hl
		push bc
		ld bc, TILEMAP_WIDTH
		add hl, bc
		pop bc
		dec b
		jr nz, .asm_f0023
		jr .asm_f004a
	.asm_f0049
		pop hl
	.asm_f004a
		pop hl
		pop de
		pop bc
		pop af
		ret

		; unreachable code
		db $d0, $ca
		ld [hl], a
		pop bc
		pop hl
		ld a, [wCharHeadTile]
		ld [hli], a
		dec c
		db $20, $e8
		pop hl
		pop de
		pop bc
		pop af
		ret
	ELSE
		push af
		push bc
		push de
		push hl
		ld a, [wLoadedCardID + 0]
		ld c, a
		ld a, [wLoadedCardID + 1]
		ld b, a
		sla c
		rl b
		ld hl, CardDescriptions
		add hl, bc
		ld a, [hli]
		ld d, [hl]
		ld e, a

		; first line
		hlbgcoord 1, 13
		call Func_1114
		ld c, LINE_LENGTH
	.asm_f0023
		ld a, [de]
		inc de
		call ProcessChar
		push hl
		push bc
		ld bc, TILEMAP_WIDTH
		add hl, bc
		ld a, [wCharTile]
		ld [hl], a
		pop bc
		pop hl
		ld a, [wCharHeadTile]
		ld [hli], a
		dec c
		jr nz, .asm_f0023

		; second line
		call Func_111c
		hlbgcoord 1, 15
		ld c, LINE_LENGTH
	.asm_f0043
		ld a, [de]
		inc de
		call ProcessChar
		push hl
		push bc
		ld bc, TILEMAP_WIDTH
		add hl, bc
		ld a, [wCharTile]
		ld [hl], a
		pop bc
		pop hl
		ld a, [wCharHeadTile]
		ld [hli], a
		dec c
		jr nz, .asm_f0043
		pop hl
		pop de
		pop bc
		pop af
		ret
	ENDC

INCLUDE "text/card_description_pointers.asm"

IF DEF(_EARLY_DAYS_EN)
	INCLUDE "text/en/card_descriptions.asm"
ELSE
	INCLUDE "text/jp/card_descriptions.asm"
ENDC
