SeedRNG::
	push af
	push bc
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	ld hl, rTAC
	res B_TAC_START, [hl]
	ld a, -255
	ldh [rTMA], a
	ldh [rTIMA], a
	set B_TAC_START, [hl]
	ld c, $00
	ldh a, [rTIMA]
	ld [wce99], a
	cp $00
	jr z, .asm_20a7
	inc c
.asm_20a7
	ldh a, [rTIMA]
	ld [wce9a], a
	cp $00
	jr z, .asm_20b1
	inc c
.asm_20b1
	ldh a, [rTIMA]
	ld [wce9b], a
	cp $00
	jr z, .asm_20bb
	inc c
.asm_20bb
	ldh a, [rTIMA]
	ld [wce9c], a
	cp $00
	jr z, .asm_20c5
	inc c
.asm_20c5
	ld a, c
	cp $00
	jr nz, .asm_20cf
	ld a, $01
	ld [wce99], a
.asm_20cf
	call Random
	call Random
	call Random
	call Random
	call Random
	pop hl
	pop bc
	pop af
	ret

Random::
	push af
	push bc
	push de
	ld a, [wce9c]
	ld b, a
	ld c, a
	ld a, [wce9b]
	rr c
	rra
	rr d
	xor b
	rl d
	rla
	rl c
	ld [wce9c], a
	ld a, [wce9a]
	ld [wce9b], a
	ld a, [wce99]
	ld [wce9a], a
	ld a, c
	ld [wce99], a
	ld [wRandNum], a
	pop de
	pop bc
	pop af
	ret

; outputs a random number
; between wRandRangeStart and wRandRangeEnd, inclusive
; input:
; - [wRandRangeStart] = range start
; - [wRandRangeEnd] = range end
; output:
; - [wRandNum] = random number
RandomRange::
	push af
	push bc
	push de
	ld a, [wRandRangeStart]
	ld c, a
	ld a, [wRandRangeEnd]
	cp c
	jr nz, .not_equal
	ld [wRandNum], a
	jr .done
.not_equal
	sub c
	ld b, a
	inc b
	; b = (wRandRangeEnd - wRandRangeStart) + 1
	call Random
	ld a, [wRandNum]
	ld d, a
	call DDividedByB
	ld a, e
	add c
	ld [wRandNum], a
.done
	pop de
	pop bc
	pop af
	ret
