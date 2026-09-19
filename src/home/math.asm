; output:
; - d = d / b
; - e = d % b
DDividedByB::
	push af
	push bc
	ld e, $00
	ld c, $8 ; bits
.loop
	sla d
	rl e
	ld a, e
	cp b
	jr c, .skip_sub
	sub b
	ld e, a
	inc d
.skip_sub
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret

; multiplies bc by de, interpreting
; one of the numbers as a fixed point number
; of 16-bits ([0, 65535] -> [0.0, 1.0])
MultiplyQ16::
	push af
	push bc
	push hl
	ld hl, $0
	ld a, $10
.asm_1366
	push af
	sla e
	rl d
	rl l
	rl h
	ld a, h
	cp b
	jr c, .asm_1387
	ld a, h
	cp b
	jr nz, .asm_1382
	ld a, l
	cp c
	jr c, .asm_1380
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
.asm_1380
	jr .asm_1387
.asm_1382
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
.asm_1387
	pop af
	dec a
	jr nz, .asm_1366
	ld d, h
	ld e, l
	pop hl
	pop bc
	pop af
	ret

; outputs hl = d * e
BTimesE::
	push af
	push bc
	push de
	ld d, $00
	ld hl, 0
	ld c, $8 ; bits
.loop
	srl b
	jr nc, .no_carry
	add hl, de
.no_carry
	sla e
	rl d
	dec c
	jr nz, .loop
	pop de
	pop bc
	pop af
	ret

; outputs bc = bc + de, in decimal representation
; caps result to $9999
DecimalAddBCAndDE::
	push af
	ld a, e
	add c
	daa
	ld c, a
	ld a, d
	add b
	daa
	ld b, a
	jr nc, .ok
	ld bc, $9999
.ok
	pop af
	ret

; input:
; - bc = ?
; - de = ?
; output:
; - bc = de - bc
; - e = $00 if de  < bc
; -     $01 if de == bc
; -     $02 if de >= bc
Func_13bb::
	push af

	; compare de and bc
	ld a, b
	cp d
	jr nz, .not_equal
	ld a, c
	cp e
	jr nz, .not_equal

; equal
	ld bc, 0
	ld e, DE_EQUAL_TO_BC
	jr .done

.not_equal
	; bc = de - bc
	ld a, e
	sub c
	daa
	ld c, a
	ld a, d
	sbc b
	daa
	ld b, a

	; de > bc
	ld e, DE_LARGER_THAN_BC
	jr nc, .done

	; de < bc
	ld e, DE_SMALLER_THAN_BC

.done
	pop af
	ret

Func_13db::
	push af
	push bc
	push hl
	ld a, [wHexNumber + 0]
	ld b, a
	ld a, [wHexNumber + 1]
	ld c, a
	ld a, [wcade]
	ld d, a
	ld a, [wcadf]
	cp b
	jr nz, .asm_140a
	ld a, [wcae0]
	cp c
	jr nz, .asm_140a
	ld a, [wcae1]
	cp d
	jr nz, .asm_140a
	xor a
	ld [wHexNumber + 0], a
	ld [wHexNumber + 1], a
	ld [wcade], a
	ld e, $01
	jr .asm_1428
.asm_140a
	ld a, [wcadf]
	sub b
	daa
	ld [wHexNumber + 0], a
	ld a, [wcae0]
	sbc c
	daa
	ld [wHexNumber + 1], a
	ld a, [wcae1]
	sbc d
	daa
	ld [wcade], a
	ld e, $02
	jr nc, .asm_1428
	ld e, $00
.asm_1428
	pop hl
	pop bc
	pop af
	ret

; converts 4-digit hexadecimal number in wHexNumber
; to 4-digit decimal representation
; output:
; - bc = converted value
ConvertToDecimalRepresentation::
	push af
	push de
	push hl
	ld b, $00
	ld a, [wHexNumber + 0]
	and $0f ; ones digit
	ld c, a
	sla c
	ld hl, .OnesDigit
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wHexNumber + 0]
	and $f0 ; tens digit
	ld c, a
	swap c
	sla c
	ld hl, .TensDigit
	add hl, bc
	ld a, [hli]
	add e
	daa
	ld e, a
	ld a, [hl]
	adc d
	daa
	ld d, a
	ld a, [wHexNumber + 1]
	and $0f ; hundreds digit
	ld c, a
	sla c
	ld hl, .HundredsDigit
	add hl, bc
	ld a, [hli]
	add e
	daa
	ld e, a
	ld a, [hl]
	adc d
	daa
	ld d, a
	ld a, [wHexNumber + 1]
	and $f0 ; thousands digit
	ld c, a
	swap c
	sla c
	ld hl, .ThousandsDigit
	add hl, bc
	ld a, [hli]
	add e
	daa
	ld c, a
	ld a, [hl]
	adc d
	daa
	ld b, a
	pop hl
	pop de
	pop af
	ret

.OnesDigit:
	dw   $0
	dw   $1
	dw   $2
	dw   $3
	dw   $4
	dw   $5
	dw   $6
	dw   $7
	dw   $8
	dw   $9
	dw  $10
	dw  $11
	dw  $12
	dw  $13
	dw  $14
	dw  $15

.TensDigit:
	dw   $0
	dw  $16
	dw  $32
	dw  $48
	dw  $64
	dw  $80
	dw  $96
	dw $112
	dw $128
	dw $144
	dw $160
	dw $176
	dw $192
	dw $208
	dw $224
	dw $240

.HundredsDigit:
	dw    $0
	dw  $256
	dw  $512
	dw  $768
	dw $1024
	dw $1280
	dw $1536
	dw $1792
	dw $2048
	dw $2304
	dw $2560
	dw $2816
	dw $3072
	dw $3328
	dw $3584
	dw $3840

.ThousandsDigit:
	dw    $0
	dw $4096
	dw $8192
