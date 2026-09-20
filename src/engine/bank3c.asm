    dw BANK(@)

    farcall_table_start
    farfunc PrintCardDescription

; prints loaded card's description
; at coordinates (1,13), in two lines
PrintCardDescription:
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

INCLUDE "text/card_description_pointers.asm"
INCLUDE "text/card_descriptions.asm"
