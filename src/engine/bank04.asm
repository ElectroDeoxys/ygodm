	dw BANK(@)

	farcall_table_start
	farfunc Func_10020
	farfunc Func_10477
	farfunc $4484
	farfunc $44f5
	farfunc $4505
	farfunc $4047
	farfunc $4140
	farfunc $418d
	farfunc $4741
	farfunc $48f0
	farfunc $4919
	farfunc $5196
	farfunc $51ad
	farfunc $52cb
	farfunc $4a1b

SECTION "Bank 04@4020", ROMX[$4020], BANK[$04]

Func_10020::
	call Func_1576
	farcall Func_883d
	call Func_10484
	call Func_10505
	ld a, $00
	ld [$ccfe], a
.asm_10031
	ld a, [$ccfe]
	cp $01
	jr z, .asm_10046
	farcall $39, $03
	farcall $3b, $03
	call Func_2a08
	farcall $3d, $03
	jr .asm_10031
.asm_10046
	ret
; 0x10047

SECTION "Bank 04@4477", ROMX[$4477], BANK[$04]

Func_10477::
	push af
	ld a, $00
	ld [$cf16], a
	ld a, $00
	ld [$cf17], a
	pop af
	ret

Func_10484:
	push af
	ld a, $00
	ld [$cf17], a
	call Func_10667
	cp $01
	jr nz, .asm_1049c
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [$cf17], a
.asm_1049c
	call Func_105bc
	cp $01
	jr nz, .asm_104ae
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [$cf17], a
.asm_104ae
	call Func_1050f
	pop af
	ret

Func_104b3:
	call Func_104cc
	call Func_104e2
	call Func_10645
	call Func_1060b
	call Func_10684
	call Func_10618
	call Func_1051c
	call Func_105fe
	ret

Func_104cc:
	push af
	push bc
	push hl
	ld hl, vEnd
	xor a
	ld b, $20
.asm_104d5
	ld c, $00
.asm_104d7
	ld [hli], a
	dec c
	jr nz, .asm_104d7
	dec b
	jr nz, .asm_104d5
	pop hl
	pop bc
	pop af
	ret

Func_104e2:
	call Func_1116c
	farcall $07, $01
	farcall $0b, $03
	call Func_27f7
	call Func_2666
	farcall $09, $0d
	ret
; 0x104f5

SECTION "Bank 04@4505", ROMX[$4505], BANK[$04]

Func_10505:
	call Func_105fe
	call Func_10540
	call Func_106b2
	ret

Func_1050f:
	push af
	ld a, [$b7f0]
	cp $02
	jr nz, .asm_1051a
	call Func_1051c
.asm_1051a
	pop af
	ret

Func_1051c:
	push af
	push bc
	push de
	push hl
	ld hl, vEnd
	ld de, $abf8
	ld c, $f8
.asm_10528
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_10528
	ld b, $0b
.asm_10530
	ld c, $00
.asm_10532
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_10532
	dec b
	jr nz, .asm_10530
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_10540:
	push af
	push bc
	push de
	push hl
	ld hl, vEnd
	ld de, $abf8
	ld c, $f8
.asm_1054c
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1054c
	ld b, $0b
.asm_10554
	ld c, $00
.asm_10556
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_10556
	dec b
	jr nz, .asm_10554
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_10564:
	push af
	push bc
	push de
	push hl
	call Func_10586
	ld b, $00
	ld a, [$cf16]
	ld c, a
	sla c
	ld hl, $4582
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x10582

SECTION "Bank 04@4586", ROMX[$4586], BANK[$04]

Func_10586:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cf16]
	ld c, a
	sla c
	ld hl, $45b8
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, NULL
	ld c, $f6
.asm_1059d
	ld a, [hli]
	add e
	ld e, a
	adc d
	ld d, a
	dec c
	jr nz, .asm_1059d
	ld b, $0b
.asm_105a7
	ld c, $00
.asm_105a9
	ld a, [hli]
	add e
	ld e, a
	adc d
	ld d, a
	dec c
	jr nz, .asm_105a9
	dec b
	jr nz, .asm_105a7
	pop hl
	pop bc
	pop af
	ret
; 0x105b8

SECTION "Bank 04@45bc", ROMX[$45bc], BANK[$04]

Func_105bc:
	push bc
	push de
	push hl
	ld a, [$b7f0]
	cp $03
	jr c, .asm_105ca
	ld a, $01
	jr .asm_105f7
.asm_105ca
	ld b, $00
	ld a, [$b7f0]
	ld c, a
	ld hl, $45fb
	add hl, bc
	ld a, [hl]
	ld [$cf16], a
	call Func_10586
	ld b, $00
	ld a, [$cf16]
	ld c, a
	sla c
	ld hl, $4582
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	cp e
	jr z, .asm_105f0
	ld b, $01
.asm_105f0
	ld a, [hl]
	cp d
	jr z, .asm_105f6
	ld b, $01
.asm_105f6
	ld a, b
.asm_105f7
	pop hl
	pop de
	pop bc
	ret
; 0x105fb

SECTION "Bank 04@45fe", ROMX[$45fe], BANK[$04]

Func_105fe:
	push af
	ld a, $00
	ld [$b7f0], a
	ld a, $00
	ld [$cf16], a
	pop af
	ret

Func_1060b:
	push af
	ld a, $01
	ld [$b7f0], a
	ld a, $00
	ld [$cf16], a
	pop af
	ret

Func_10618:
	push af
	ld a, $02
	ld [$b7f0], a
	ld a, $01
	ld [$cf16], a
	pop af
	ret
; 0x10625

SECTION "Bank 04@4645", ROMX[$4645], BANK[$04]

Func_10645:
	push af
	push bc
	push de
	push hl
	ld hl, $b7f1
	ld de, $465c
	ld c, $0b
.asm_10651
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_10651
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1065c

SECTION "Bank 04@4667", ROMX[$4667], BANK[$04]

Func_10667:
	push bc
	push de
	push hl
	ld b, $00
	ld hl, $b7f1
	ld de, $465c
	ld c, $0b
.loop
	ld a, [de]
	cp [hl]
	jr z, .next
	ld b, $01
.next
	inc hl
	inc de
	dec c
	jr nz, .loop
	ld a, b
	pop hl
	pop de
	pop bc
	ret

Func_10684:
	push af
	push bc
	push de
	push hl
	ld de, vEnd
	ld bc, $46dd
.asm_1068e
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	cp $00
	jr nz, .asm_1069d
	ld a, l
	cp $00
	jr z, .asm_106aa
.asm_1069d
	push bc
	ld a, [bc]
	ld c, a
.asm_106a0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_106a0
	pop bc
	inc bc
	jr .asm_1068e
.asm_106aa
	call Func_10564
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_106b2:
	push af
	push bc
	push de
	push hl
	ld de, vEnd
	ld bc, $46dd
.asm_106bc
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	cp $00
	jr nz, .asm_106cb
	ld a, l
	cp $00
	jr z, .asm_106d8
.asm_106cb
	push bc
	ld a, [bc]
	ld c, a
.asm_106ce
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_106ce
	pop bc
	inc bc
	jr .asm_106bc
.asm_106d8
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x106dd

SECTION "Bank 04@4942", ROMX[$4942], BANK[$04]

Func_10942:
	push af
	push bc
	push de
	push hl
	ld hl, $cfa1
	ld de, $493a
	ld c, $08
.asm_1094e
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1094e
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x10959

SECTION "Bank 04@4976", ROMX[$4976], BANK[$04]

Func_10976:
	push af
	push bc
	push hl
	ld c, $00
	ld hl, wce99
	ld a, [$cf99]
	add [hl]
	ld b, a
	ld a, [$cf9d]
	adc b
	ld [hli], a
	jr z, .asm_1098b
	inc c
.asm_1098b
	ld a, [$cf9a]
	add [hl]
	ld b, a
	ld a, [$cf9e]
	adc b
	ld [hli], a
	jr z, .asm_10998
	inc c
.asm_10998
	ld a, [$cf9b]
	add [hl]
	ld b, a
	ld a, [$cf9f]
	adc b
	ld [hli], a
	jr z, .asm_109a5
	inc c
.asm_109a5
	ld a, [$cf9c]
	add [hl]
	ld b, a
	ld a, [$cfa0]
	adc b
	ld [hli], a
	jr z, .asm_109b2
	inc c
.asm_109b2
	ld a, c
	cp $00
	jr nz, .asm_109bc
	ld a, $01
	ld [wce99], a
.asm_109bc
	pop hl
	pop bc
	pop af
	ret

Func_109c0:
	push af
	push bc
	push de
	push hl
	ld hl, $cf99
	ld de, $cfa1
	ld c, $08
.asm_109cc
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_109cc
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x109d7

SECTION "Bank 04@49f2", ROMX[$49f2], BANK[$04]

Func_109f2:
	push af
	call SeedRNG
	call Func_10942
	call Func_10b1f
	farcall Func_b823
	ld a, $00
	ld [$cf98], a
.asm_10a04
	ld a, [$cfa9]
	cp $03
	jr z, .asm_10a13
	call Func_10a3e
	call Func_11084
	jr .asm_10a04
.asm_10a13
	call Func_109c0
	call Func_10976
	pop af
	ret
; 0x10a1b

SECTION "Bank 04@4a3e", ROMX[$4a3e], BANK[$04]

Func_10a3e:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $4a70
	call Func_10d9
	farcall $03, $02
	ld a, [$cfa9]
	cp $00
	jr nz, .asm_10a5b
	farcall $09, $0c
	jr .asm_10a5e
.asm_10a5b
	farcall $0b, $0c
.asm_10a5e
	call Func_10a7a
	call Func_10af3
	call EnableLCD
	call Func_100e
	call Func_f74
	pop hl
	pop af
	ret
; 0x10a70

SECTION "Bank 04@4a7a", ROMX[$4a7a], BANK[$04]

Func_10a7a:
	call Func_120a
	call Func_10fe0
	call Func_10a87
	call Func_1225
	ret

Func_10a87:
	push af
	push bc
	push de
	push hl
	ld de, $4aa3
	ld hl, vTiles0
	ld b, $05
.asm_10a93
	ld c, $10
.asm_10a95
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_10a95
	dec b
	jr nz, .asm_10a93
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x10aa3

SECTION "Bank 04@4af3", ROMX[$4af3], BANK[$04]

Func_10af3:
	push af
	push bc
	push de
	push hl
	call Func_1114
	hlbgcoord 6, 0
	ld de, $cfa1
	ld c, $08
.asm_10b02
	ld a, [de]
	inc de
	call Func_1144
	push hl
	push bc
	ld bc, $20
	add hl, bc
	ld a, [$cad0]
	ld [hl], a
	pop bc
	pop hl
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_10b02
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_10b1f:
	push af
	ld a, $00
	ld [$cfa9], a
	ld a, $00
	ld [$cfaa], a
	ld a, $01
	ld [$cfab], a
	ld a, $00
	ld [$cfac], a
	pop af
	ret
; 0x10b36

SECTION "Bank 04@4fe0", ROMX[$4fe0], BANK[$04]

Func_10fe0:
	push af
	push bc
	push de
	push hl
	ld bc, NULL
	ld a, [$cfaa]
	call Func_11024
	ld d, a
	ld a, [$cfab]
	call Func_1103a
	call Func_123c
	call Func_1104e
	ld d, a
	ld bc, $101
	ld a, $14
	call Func_123c
	ld bc, $202
	ld a, $1c
	call Func_123c
	ld a, d
	add $08
	ld d, a
	ld bc, $303
	ld a, $14
	call Func_123c
	ld bc, $404
	ld a, $1c
	call Func_123c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_11024:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $5031
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x11031

SECTION "Bank 04@503a", ROMX[$503a], BANK[$04]

Func_1103a:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $5047
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x11047

SECTION "Bank 04@504e", ROMX[$504e], BANK[$04]

Func_1104e:
	push bc
	push hl
	ld b, $00
	ld a, [$cfac]
	ld c, a
	ld hl, $505e
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x1105e

SECTION "Bank 04@5084", ROMX[$5084], BANK[$04]

Func_11084:
	push af
	push bc
	push de
	push hl
	call AdvanceRNG
	call Func_110b4
	ld b, $00
	ld c, a
	ld hl, $50a6
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $509d
	push bc
	jp hl
; 0x1109d

SECTION "Bank 04@50b4", ROMX[$50b4], BANK[$04]

Func_110b4:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [$caa6]
	and $ff
	jr z, .asm_110cd
	ld c, $08
.asm_110c2
	dec c
	rlca
	jr nc, .asm_110c2
	ld b, $00
	ld hl, $50e6
	add hl, bc
	ld d, [hl]
.asm_110cd
	ld a, [$caa7]
	and $f0
	jr z, .asm_110e1
	ld c, $08
.asm_110d6
	dec c
	rlca
	jr nc, .asm_110d6
	ld b, $00
	ld hl, $50e6
	add hl, bc
	ld d, [hl]
.asm_110e1
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x110e6

SECTION "Bank 04@516c", ROMX[$516c], BANK[$04]

Func_1116c:
	push af
	push bc
	push de
	push hl
	ld hl, wce99
	ld de, $cfaf
	ld c, $04
.asm_11178
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_11178
	ld hl, $b800
	xor a
	ld b, $04
.asm_11184
	ld c, $c8
.asm_11186
	ld [hli], a
	dec c
	jr nz, .asm_11186
	dec b
	jr nz, .asm_11184
	xor a
	ld [$cfb7], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x11196
