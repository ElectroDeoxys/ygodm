    dw BANK(@)

    farcall_table_start
    farfunc Func_f0004

Func_f0004:
	push af
	push bc
	push de
	push hl
	ld a, [wLoadedCardID]
	ld c, a
	ld a, [$cd10]
	ld b, a
	sla c
	rl b
	ld hl, $4060
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlbgcoord 1, 13
	call Func_1114
	ld c, $12
.asm_f0023
	ld a, [de]
	inc de
	call ProcessChar
	push hl
	push bc
	ld bc, $20
	add hl, bc
	ld a, [wCurChar]
	ld [hl], a
	pop bc
	pop hl
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_f0023
	call Func_111c
	hlbgcoord 1, 15
	ld c, $12
.asm_f0043
	ld a, [de]
	inc de
	call ProcessChar
	push hl
	push bc
	ld bc, $20
	add hl, bc
	ld a, [wCurChar]
	ld [hl], a
	pop bc
	pop hl
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_f0043
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xf0060
