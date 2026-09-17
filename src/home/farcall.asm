_Farcall:
	push af
	add sp, -$03
	push af
	push hl
	push bc
	push de

	ld hl, sp+$06
	ld d, h
	ld e, l

	; have bc point to args at call site
	ld hl, sp+$0e
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a

	; store current ROM bank in stack
	ld a, [rRAMB]
	ld [hld], a
	; copy over original f register value
	ld a, [hl]
	ld [de], a

	; return address after call will be FarcallRet
	ld a, HIGH(FarcallRet)
	ld [hld], a
	ld a, LOW(FarcallRet)
	ld [hld], a

	; start reading args
	ld a, [bc] ; offset in table
	ld e, a
	inc bc
	ld d, $40
	ld a, [bc] ; ROM/SRAM bank
	inc bc

	; switch banks
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei
	; set address to call
	ld a, [de]
	ld [hld], a
	dec e
	ld a, [de]
	ld [hl], a

	; update pc at initial call site
	ld hl, sp+$0d
	ld a, c
	ld [hli], a
	ld [hl], b

	pop de
	pop bc
	pop hl
	pop af
	ret

FarcallRet:
	push af
	push hl
	push bc
	ld hl, sp+$06

	ld a, [hl] ; old ROM/SRAM banks
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei

	; restore initial af registers
	ld b, h
	ld c, l
	dec bc
	ld a, [bc]
	ld [hld], a
	dec bc
	ld a, [bc]
	ld [hl], a
	pop bc
	pop hl
	; adjust sp to correctly point to call site
	add sp, $01
	pop af
	ret
