	dw BANK(@)
	
	farcall_table_start
	farfunc Func_3c016
	farfunc Func_3c006

Func_3c006:
	push af
	ld a, TRUE
	ld [wcd1f], a
	pop af
	ret

Func_3c00e:
	push af
	ld a, FALSE
	ld [wcd1f], a
	pop af
	ret

Func_3c016:
	push af
	push bc
	push hl
	ld a, [wcd45]
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
	ld a, [wcd1f]
	cp FALSE
	jr nz, .asm_3c038
	call Func_3c08d
	ld [wcd46], a
	jr .asm_3c04e
.asm_3c038
	call .ReadNextTextChar
	ld [wcd46], a
	call Func_3c07e
	cp TRUE
	jr nz, .asm_3c04e
	call Func_3c00e
	call Func_3c08d
	ld [wcd46], a
.asm_3c04e
	pop hl
	pop bc
	ret

.ReadNextTextChar:
	push bc
	push hl
	ld b, $00
	ld a, [wTextID]
	ld c, a
	sla c
	rl b
	ld hl, TextPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd48 + 0]
	ld b, a
	ld a, [wcd47]
	ld c, a
	inc a
	ld [wcd47], a
	jr nz, .asm_3c079
	ld a, [wcd48 + 0]
	inc a
	ld [wcd48 + 0], a
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
	xor a ; TRUE
	jr .asm_3c08c
.asm_3c08a
	ld a, FALSE
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
