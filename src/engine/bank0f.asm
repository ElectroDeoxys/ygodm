	dw BANK(@)
	
	farcall_table_start
	farfunc Func_3c016
	farfunc Func_3c006

Func_3c006:
	push af
	ld a, $00
	ld [$cd1f], a
	pop af
	ret

Func_3c00e:
	push af
	ld a, $01
	ld [$cd1f], a
	pop af
	ret

Func_3c016:
	push af
	push bc
	push hl
	ld a, [$cd45]
	cp $01
	jr nz, .asm_3c023
	call Func_3c027
.asm_3c023
	pop hl
	pop bc
	pop af
	ret

Func_3c027:
	push bc
	push hl
	ld a, [$cd1f]
	cp $01
	jr nz, .asm_3c038
	call Func_3c08d
	ld [$cd46], a
	jr .asm_3c04e
.asm_3c038
	call Func_3c051
	ld [$cd46], a
	call Func_3c07e
	cp $00
	jr nz, .asm_3c04e
	call Func_3c00e
	call Func_3c08d
	ld [$cd46], a
.asm_3c04e
	pop hl
	pop bc
	ret

Func_3c051:
	push bc
	push hl
	ld b, $00
	ld a, [$cd51]
	ld c, a
	sla c
	rl b
	ld hl, $409d
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cd48]
	ld b, a
	ld a, [$cd47]
	ld c, a
	inc a
	ld [$cd47], a
	jr nz, .asm_3c079
	ld a, [$cd48]
	inc a
	ld [$cd48], a
.asm_3c079
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_3c07e:
	cp $b5
	jr c, .asm_3c08a
	sub $b5
	call Func_2ce8
	xor a
	jr .asm_3c08c
.asm_3c08a
	ld a, $01
.asm_3c08c
	ret

Func_3c08d:
	push bc
	call Func_2c7d
	push af
	ld a, b
	cp $01
	jr nz, .asm_3c09a
	call Func_3c006
.asm_3c09a
	pop af
	pop bc
	ret
; 0x3c09d
