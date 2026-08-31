	dw BANK(@)

	farcall_table_start
	farfunc $4063
	farfunc Func_24024
	farfunc $6b89

SECTION "Bank 9@4024", ROMX[$4024], BANK[$9]

Func_24024::
	push af
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call Func_24063
	call Func_1c5a
	call Func_24058
	call Func_24040
	call Func_2420b
	pop bc
	pop af
	ret

Func_24040:
	push af
	ld a, [$cad1]
	call Func_24312
	pop af
	ret
; 0x24049

SECTION "Bank 9@4058", ROMX[$4058], BANK[$9]

Func_24058:
	push af
	ld a, b
	ld [$cd11], a
	ld a, c
	ld [$cd12], a
	pop af
	ret

Func_24063:
	push af
	push bc
	push de
	push hl
	ld a, c
	ld [$cd0f], a
	ld a, b
	ld [$cd10], a
	ld hl, $409e
	add hl, bc
	ld a, [hl]
	ld [$cd17], a
	sla c
	rl b
	ld hl, $4381
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, e
	ld [$cd13], a
	ld a, d
	ld [$cd14], a
	ld hl, $465d
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, e
	ld [$cd15], a
	ld a, d
	ld [$cd16], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2409e

SECTION "Bank 9@420b", ROMX[$420b], BANK[$9]

Func_2420b:
	push af
	push bc
	push hl
	call Func_218b
	ld b, $00
	ld c, a
	sla c
	ld hl, $4226
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	pop hl
	pop bc
	pop af
	ret
; 0x24226

SECTION "Bank 9@4312", ROMX[$4312], BANK[$9]

Func_24312:
	push af
	push bc
	push de
	push hl
	push af
	ld b, $00
	ld c, a
	sla c
	ld hl, $4365
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cd0f]
	ld c, a
	ld a, [$cd10]
	ld b, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, e
	ld [$cd13], a
	ld a, d
	ld [$cd14], a
	pop af
	ld b, $00
	ld c, a
	sla c
	ld hl, $4373
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cd0f]
	ld c, a
	ld a, [$cd10]
	ld b, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, e
	ld [$cd15], a
	ld a, d
	ld [$cd16], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x24365
