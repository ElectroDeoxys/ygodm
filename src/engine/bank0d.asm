	dw BANK(@)
	
	farcall_table_start
	farfunc Func_3400c
	farfunc Func_36e68
	farfunc $6e34
	farfunc Func_3708e
	farfunc $70e6

Func_3400c:
	push af
	push bc
	call Func_23f7
	cp $00
	jr z, .asm_34024
	call Func_34027
	farcall $11, $01
	farcall $41, $01
	farcall $29, $02
	call Func_36e8e
.asm_34024
	pop bc
	pop af
	ret

Func_34027:
	push af
	push de
	push hl
	ld a, 0
	ld [wRandRangeStart], a
	ld a, LOW($7ff)
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld e, a
	ld a, 0
	ld [wRandRangeStart], a
	ld a, HIGH($7ff)
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld d, a
	ld b, $00
	farcall $19, $02
	ld c, a
	sla c
	ld hl, $4072
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, NULL
.asm_3405e
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Func_1d0f
	pop bc
	cp $00
	jr z, .asm_3406e
	inc bc
	jr .asm_3405e
.asm_3406e
	pop hl
	pop de
	pop af
	ret
; 0x34072

SECTION "Bank d@6e68", ROMX[$6e68], BANK[$d]

Func_36e68:
	push af
	push bc
	ld a, 0
	ld [wRandRangeStart], a
	ld a, DECK_SIZE - 1
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld [$cfb8], a
	farcall Func_c5e8
	farcall Func_c604
	ld a, c
	ld [$cfb9], a
	ld a, b
	ld [$cfba], a
	pop bc
	pop af
	ret

Func_36e8e:
	push af
	push bc
	push de
	push hl
	call Func_36ebd
	ld a, b
	cp $01
	jr z, .asm_36eb8
	ld d, $00
	farcall $19, $02
	ld e, a
	sla e
	ld hl, $6f18
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	sla c
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	farcall $11, $01
	farcall $41, $01
	farcall $2b, $02
.asm_36eb8
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_36ebd:
	push af
	push de
	push hl
	ld b, $00
	ld a, [$ceef]
	ld c, a
	sla c
	ld hl, $cf70
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $6f02
	ld c, $00
.asm_36ed4
	push bc
	push de
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld de, rIE
	call CompareBCAndDE
	pop de
	pop bc
	cp $00
	jr nz, .asm_36eea
	ld b, $01
	jr .asm_36efe
.asm_36eea
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call CompareBCAndDE
	pop bc
	cp $00
	jr nz, .asm_36efb
	ld b, $00
	jr .asm_36efe
.asm_36efb
	inc c
	jr .asm_36ed4
.asm_36efe
	pop hl
	pop de
	pop af
	ret
; 0x36f02

SECTION "Bank 0d@708e", ROMX[$708e], BANK[$0d]

Func_3708e:
	push af
	ld a, $00
	ld [$cfdf], a
	ld a, $00
	ld [$cfe0], a
	pop af
	ret
; 0x3709b
