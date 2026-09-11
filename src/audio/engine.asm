	dw BANK(@)

	farcall_table_start
	farfunc InitAudio
	farfunc UpdateAudio
	farfunc _PlaySound

InitAudio::
	ld a, $ff
	ld [$c920], a

	ld hl, STARTOF("WRAM Audio")
	ld bc, SIZEOF("WRAM Audio")
.loop_clear_wram
	xor a
	ld [hl], a
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop_clear_wram

	ld a, $7f
	ld [$c90e], a
	ld a, $ff
	ld [$c90f], a

	; enable all channels
	ld a, AUDENA_CH1_ON | AUDENA_CH2_ON | AUDENA_CH3_ON | AUDENA_CH4_ON | AUDENA_ON
	ldh [rAUDENA], a

	call Func_f82fc

	; load triangle wave to channel 3
	ld hl, _AUD3WAVERAM
	ld bc, .TriangleWave
	ld d, AUD3WAVE_SIZE
.loop_init_waveram
	ld a, [bc]
	inc bc
	ld [hli], a
	dec d
	jr nz, .loop_init_waveram
	ld a, AUD3ENA_ON
	ldh [rAUD3ENA], a

	ld a, $04
	ld [$c90c], a
	ld hl, $c700
	ld c, $08
.asm_f8048
	ld a, l
	and $c0
	ld l, $23
	or l
	ld l, a
	ld a, $80
	ld [hl], a
	ld a, l
	and $c0
	ld l, $24
	or l
	ld l, a
	ld a, $80
	ld [hl], a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_f8048
	ret

.TriangleWave:
	dn 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

; input:
; - a = sound constant to play?
_PlaySound::
	ld [$c920], a
	ret

Func_f807a:
	push hl
	push bc
	push de
	cp $81
	jr nc, .asm_f80c1
	ld de, $c724
	call .Func_f808d
	ld hl, $c700
	jp .asm_f80cc

.Func_f808d:
	add a
	add a
	ld hl, $4660
	ld b, $00
	ld c, a
	add hl, bc
	ld bc, $c902
	ld a, [hli]
	ld [de], a
	ld [bc], a
	inc bc
	push hl
	ld hl, $40
	add hl, de
	push hl
	pop de
	pop hl
	ld a, [hli]
	ld [de], a
	ld [bc], a
	inc bc
	push hl
	ld hl, $40
	add hl, de
	push hl
	pop de
	pop hl
	ld a, [hli]
	ld [de], a
	ld [bc], a
	inc bc
	push hl
	ld hl, $40
	add hl, de
	push hl
	pop de
	pop hl
	ld a, [hl]
	ld [de], a
	ld [bc], a
	ret

.asm_f80c1
	and $7f
	ld de, $c824
	call .Func_f808d
	ld hl, $c800
.asm_f80cc
	ld de, $c902
	ld d, $80
	ld b, $04
	ld a, $12
.asm_f80d5
	ld c, a
	ld a, l
	and $c0
	ld l, $21
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, $2f
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, $2e
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, $23
	or l
	ld l, a
	ld [hl], d
	ld a, l
	and $c0
	ld l, $35
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, [de]
	inc de
	cp $80
	jr nc, .asm_f810a
	xor a
	ld [$ff00+c], a
.asm_f810a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	ld a, c
	add $05
	dec b
	jr nz, .asm_f80d5
	pop de
	pop bc
	pop hl
	ret

UpdateAudio::
	ld a, [$c920]
	cp $ff
	jr z, .asm_f8129
	call Func_f807a
	ld a, $ff
	ld [$c920], a
.asm_f8129
	ld hl, $c90c
	ld de, $c918
	ld bc, $c912
	ld a, [hl]
	ld [de], a
	ld a, [bc]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [bc]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [bc]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [bc]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [bc]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [bc]
	ld [hli], a
	inc bc
	inc de
	xor a
	ld hl, $c837
	ld [hl], a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	xor a
	ld [hl], a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	xor a
	ld [hl], a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	xor a
	ld [hl], a
	ldh a, [rAUD1LEN]
	ld [$c91e], a
	ldh a, [rAUD2LEN]
	ld [$c91f], a
	xor a
	ld [$c900], a
	ld hl, $c800
	ld a, $10
	call Func_f81f2
	ld hl, $c90c
	ld de, $c918
	ld bc, $c912
	ld a, [hl]
	ld [bc], a
	ld a, [de]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [bc], a
	ld a, [de]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [bc], a
	ld a, [de]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [bc], a
	ld a, [de]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [bc], a
	ld a, [de]
	ld [hli], a
	inc bc
	inc de
	ld a, [hl]
	ld [bc], a
	ld a, [de]
	ld [hli], a
	inc bc
	inc de
	ld hl, $c837
	ld de, $c737
	ld c, $04
.asm_f81be
	ld a, [hl]
	ld [de], a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	push hl
	ld hl, $40
	add hl, de
	push hl
	pop de
	pop hl
	dec c
	jr nz, .asm_f81be
	ld a, [$c91e]
	ldh [rAUD1LEN], a
	ld a, [$c91f]
	ldh [rAUD2LEN], a
	xor a
	ld [$c900], a
	ld hl, $c700
	ld a, $10
	call Func_f81f2
	ld a, [$c90a]
	ldh [rAUDVOL], a
	ld a, [$c90b]
	ldh [rAUDTERM], a
	ret

Func_f81f2:
	ld [$c901], a
	ld a, l
	and $c0
	ld l, $24
	or l
	ld l, a
	ld a, [hl]
	ld c, $80
	cp c
	jr nc, .asm_f8236
	ld [hl], c
	add a
	add $f0
	ld e, a
	ld a, $00
	adc $46
	ld d, a
	ld a, l
	and $c0
	ld l, $22
	or l
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	inc l
	ld a, [de]
	ld [hl], a
	push af
	ld a, l
	and $c0
	ld l, $20
	or l
	ld l, a
	pop af
	ld [hl], $1f
	ld a, l
	and $c0
	ld l, $2f
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, $21
	or l
	ld l, a
	xor a
	ld [hl], a
.asm_f8236
	ld a, l
	and $c0
	ld l, $23
	or l
	ld l, a
	ld a, [hl]
	cp c
	jr nc, .asm_f8278
	ld a, l
	and $c0
	ld l, $2f
	or l
	ld l, a
	ld a, [hl]
	push af
	ld a, l
	and $c0
	ld l, $21
	or l
	ld l, a
	pop af
	sub [hl]
	jr c, .asm_f8262
	push af
	ld a, l
	and $c0
	ld l, $2f
	or l
	ld l, a
	pop af
	ld [hl], a
	call Func_f8488
.asm_f8262
	ld a, l
	and $c0
	ld l, $2f
	or l
	ld l, a
	ld a, [$c90c]
	add [hl]
	ld [hl], a
	ld a, l
	and $c0
	ld l, $37
	or l
	ld l, a
	ld a, $ff
	ld [hl], a
.asm_f8278
	ld a, [$c900]
	inc a
	ld [$c900], a
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	ld a, [$c901]
	add $05
	cp $24
	jr nc, .asm_f8291
	jp Func_f81f2
.asm_f8291
	ld a, [$c908]
	inc a
	ld [$c908], a
	and $1f
	ld e, a
	ld a, [$c90e]
	ld b, a
	and $70
	ld c, a
	swap c
	or c
	ld [$c90a], a
	dec e
	jr nz, .asm_f82be
	ld a, [$c910]
	add b
	ld c, a
	xor b
	rlca
	jr nc, .asm_f82ba
	ld a, c
	rlca
	rlca
	sbc a
	cpl
	ld c, a
.asm_f82ba
	ld a, c
	ld [$c90e], a
.asm_f82be
	ld a, [$c90f]
	ld c, a
	ld a, [$c90e]
	and a
	jr nz, .asm_f82ca
	ld c, $00
.asm_f82ca
	ld a, c
	ld [$c90b], a
	ret
; 0xf82cf

SECTION "Bank 3e@42fc", ROMX[$42fc], BANK[$3e]

Func_f82fc:
	ld a, $08
	ld [$c911], a
	ret
; 0xf8302

SECTION "Bank 3e@446e", ROMX[$446e], BANK[$3e]

Func_f846e:
	push bc
	ret

Func_f8470:
	and $3f
	sub $10
	push af
	add a
	ld de, $440e
	add e
	ld e, a
	ld a, $00
	adc d
	ld d, a
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	pop af
	call Func_f846e
;	fallthrough
Func_f8488:
	call Func_f8520
	cp $c0
	jr nc, Func_f8470
	ld c, a
	call Func_f8520
	ld [$c906], a
	swap a
	rrca
	and $07
	ld [$c907], a
	ld a, c
	call Func_f8530
	ld a, l
	and $c0
	ld l, $21
	or l
	ld l, a
	ld a, [$c906]
	and $1f
	inc a
	add a
	add a
	ld [hl], a
	ld a, l
	and $c0
	ld l, $35
	or l
	ld l, a
	ld a, [hld]
	and a
	ret z
	inc a
	and $0f
	ld c, $00
	cp [hl]
	jr nz, .asm_f84c7
	ld c, $ff
	xor a
.asm_f84c7
	or $f0
	inc l
	ld [hli], a
	inc l
	ld a, [hl]
	xor c
	ld [hl], a
	and $01
	inc a
	and $03
	rra
	ld c, a
	rla
	and $01
	swap a
	or c
	ld b, a
	ld a, [$c900]
	inc a
	ld c, a
	ld a, b
	ld b, $ee
	dec c
	jr z, .asm_f84f7
	add a
	ld b, $dd
	dec c
	jr z, .asm_f84f7
	add a
	ld b, $bb
	dec c
	jr z, .asm_f84f7
	add a
	ld b, $77
.asm_f84f7
	ld c, a
	ld de, $c90f
	ld a, [de]
	and b
	or c
	ld [de], a
	ret
; 0xf8500

SECTION "Bank 3e@4520", ROMX[$4520], BANK[$3e]

Func_f8520:
	ld a, l
	and $c0
	ld l, $22
	or l
	ld l, a
	ld e, [hl]
	inc l
	ld d, [hl]
	ld a, [de]
	inc de
	ld [hl], d
	dec l
	ld [hl], e
	ret

Func_f8530:
	ld c, a
	ld a, l
	and $c0
	ld l, $37
	or l
	ld l, a
	ld a, [hl]
	and a
	ret nz
	ld a, l
	and $c0
	ld l, $25
	or l
	ld l, a
	ld a, c
	ld [hl], a
	cp $6f
	jr nz, .asm_f8555
	ld a, [$c901]
	add $02
	ld c, a
	xor a
	ld [$ff00+c], a
	inc c
	ld [$ff00+c], a
	inc c
	ld [$ff00+c], a
	ret
.asm_f8555
	ld b, a
	ld a, [$c900]
	cp $03
	jr z, .asm_f85a9
	ld a, [$c907]
	add $26
	push af
	ld a, l
	and $c0
	ld l, a
	pop af
	add l
	ld l, a
	ld a, [$c901]
	add $02
	ld c, a
	ld a, [hl]
	ld [$ff00+c], a
	inc c
	ld a, l
	and $c0
	ld l, $2e
	or l
	ld l, a
	ld a, [hl]
	add b
	push hl
	add a
	ld e, a
	ld hl, $45d0
	ld d, $00
	add hl, de
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [$c900]
	cp $02
	jr nz, .asm_f859b
	xor a
	ldh [AUD3RAM], a
	nop
	nop
	nop
	ld a, $80
	ldh [AUD3RAM], a
	jr .asm_f85a3
.asm_f859b
	and a
	jr nz, .asm_f85a3
	ld a, [$c911]
	ldh [AUD1RAM], a
.asm_f85a3
	ld a, [hl]
	or $80
	ld [$ff00+c], a
	pop hl
	ret
.asm_f85a9
	ld a, [$c907]
	add $26
	push af
	ld a, l
	and $c0
	ld l, a
	pop af
	add l
	ld l, a
	ld a, [hl]
	ldh [rAUD4ENV], a
	ld a, l
	and $c0
	ld l, $25
	or l
	ld l, a
	ld a, [hl]
	add a
	add a
	add a
	ld b, a
	ld a, [$c90d]
	or b
	ldh [rAUD4POLY], a
	ld a, $80
	ldh [rAUD4GO], a
	ret
; 0xf85d0
