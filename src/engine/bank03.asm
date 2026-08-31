	dw BANK(@)

	farcall_table_start
	farfunc $406c ; $03
	farfunc $40b9 ; $05
	farfunc $425e ; $07
	farfunc $452e ; $09
	farfunc Func_c5cc ; $0b
	farfunc $468a ; $0d
	farfunc $4786 ; $0f
	farfunc Func_cbe9 ; $11
	farfunc Func_cb87 ; $13
	farfunc $67eb ; $15
	farfunc Func_cc4c ; $17
	farfunc $684e ; $19
	farfunc $4618 ; $1b
	farfunc $4664 ; $1d
	farfunc $675b ; $1f
	farfunc $67a7 ; $21
	farfunc Func_c604 ; $23
	farfunc $4630 ; $25
	farfunc $6747 ; $27
	farfunc $6773 ; $29
	farfunc $4d55 ; $2b
	farfunc $5249 ; $2d
	farfunc Func_d224 ; $2f
	farfunc $4efb ; $31
	farfunc $4fe1 ; $33
	farfunc $53ec ; $35
	farfunc Func_cd9a ; $37
	farfunc Func_e6be ; $39
	farfunc Func_e49c ; $3b
	farfunc Func_e4fb ; $3d
	farfunc $6e30 ; $3f
	farfunc Func_c75e ; $41
	farfunc $61f2 ; $43
	farfunc $5e81 ; $45
	farfunc $6285 ; $47
	farfunc $5974 ; $49
	farfunc $5853 ; $4b
	farfunc $62b2 ; $4d
	farfunc $6ebf ; $4f
	farfunc $6f1d ; $51
	farfunc $41bc ; $53
	farfunc $41f1 ; $55
	farfunc $6407 ; $57
	farfunc $4772 ; $59
	farfunc $4142 ; $5b
	farfunc SetOppDeckIndex ; $5d
	farfunc AddCardToOpponentDeck ; $5f
	farfunc Func_c5e8 ; $61
	farfunc Func_c5ec ; $63
	farfunc $43e3 ; $65
	farfunc $7a96 ; $67
	farfunc Func_d014 ; $69
	farfunc $6711 ; $6b

SECTION "Bank 3@406c", ROMX[$406c], BANK[$3]

Func_c06c:
	push af
	ld a, $00
	ld [$cab0], a
	ld a, $80
	ld [$cab1], a
	ld a, $00
	ld [$cab2], a
	pop af
	ret
; 0xc07e

SECTION "Bank 3@40b9", ROMX[$40b9], BANK[$3]

Func_c0b9:
	push af
	ld a, $00
	ld [$cab3], a
	ld a, $80
	ld [$cab4], a
	ld a, $00
	ld [$cab5], a
	pop af
	ret
; 0xc0cb

SECTION "Bank 3@4106", ROMX[$4106], BANK[$3]

Func_c106:
	push af
	ld a, $00
	ld [$cad1], a
	pop af
	ret
; 0xc10e

SECTION "Bank 3@4142", ROMX[$4142], BANK[$3]

Func_c142:
	call Func_c152
	call Func_c187
	call Func_c1bc
	call Func_c1f1
	call Func_c24d
	ret

Func_c152:
	push af
	push bc
	push de
	push hl
	ld a, $12
	call SetPendingVBlankMode
	bcbgcoord 10, 16
	ld d, $00
	ld e, $05
.asm_c162
	call Func_f3d
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_HAND
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	inc d
	dec e
	jr nz, .asm_c162
	call RequestVBlankMode
	call Func_f74
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c187:
	push af
	push bc
	push de
	push hl
	ld a, $12
	call SetPendingVBlankMode
	bcbgcoord 10, 14
	ld d, $00
	ld e, $05
.asm_c197
	call Func_f3d
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_2
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	inc d
	dec e
	jr nz, .asm_c197
	call RequestVBlankMode
	call Func_f74
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c1bc:
	push af
	push bc
	push de
	push hl
	ld a, $12
	call SetPendingVBlankMode
	bcbgcoord 10, 2
	ld d, $04
	ld e, $05
.asm_c1cc
	call Func_f3d
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_1
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	dec d
	dec e
	jr nz, .asm_c1cc
	call RequestVBlankMode
	call Func_f74
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c1f1:
	push af
	push bc
	push de
	push hl
	ld a, $12
	call SetPendingVBlankMode
	bcbgcoord 10, 0
	ld d, $04
	ld e, $05
.asm_c201
	call Func_f3d
	inc bc
	inc bc
	push bc
	ld b, d
	ld c, CARD_LOCATION_0
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_c226
	pop bc
	dec d
	dec e
	jr nz, .asm_c201
	call RequestVBlankMode
	call Func_f74
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c226:
	push af
	cp $d0
	jr z, .asm_c23f
	call Func_f50
	add $02
	call Func_f50
	sub $01
	call Func_f50
	add $02
	call Func_f50
	jr .asm_c24b
.asm_c23f
	call Func_f50
	call Func_f50
	call Func_f50
	call Func_f50
.asm_c24b
	pop af
	ret

Func_c24d:
	push af
	ld a, $0e
	call SetPendingVBlankMode
	call Func_d58c
	call RequestVBlankMode
	call Func_f74
	pop af
	ret
; 0xc25e

SECTION "Bank 03@45cc", ROMX[$45cc], BANK[$03]

Func_c5cc:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [$cc5a], a
	ld hl, $cc5b
	ld c, DECK_SIZE
.asm_c5da
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld a, HIGH(INVALID_CARD)
	ld [hli], a
	dec c
	jr nz, .asm_c5da
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c5e8::
	ld [$cc5a], a
	ret

Func_c5ec::
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld a, [$cc5a]
	ld e, a
	sla e
	ld hl, $cc5b
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_c604:
	push af
	push hl
	ld b, $00
	ld a, [$cc5a]
	ld c, a
	sla c
	ld hl, $cc5b
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	pop af
	ret
; 0xc618

SECTION "Bank 3@46cf", ROMX[$46cf], BANK[$3]

SetOppDeckIndex:
	ld [wOppDeckIndex], a
	ret

ResetOppDeckIndex:
	push af
	xor a
	ld [wOppDeckIndex], a
	pop af
	ret

Func_c6da:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wOppDeckIndex]
	ld c, a
	sla c
	ld hl, wOppDeck
	add hl, bc
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld [hl], HIGH(INVALID_CARD)
	pop hl
	pop bc
	pop af
	ret

Func_c6f2:
	push af
	push hl
	ld b, $00
	ld a, [wOppDeckIndex]
	ld c, a
	sla c
	ld hl, wOppDeck
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	pop hl
	pop af
	ret

IncrementOppDeckIndex:
	push af
	ld a, [wOppDeckIndex]
	cp DECK_SIZE
	jr nc, .asm_c713
	inc a
	ld [wOppDeckIndex], a
.asm_c713
	pop af
	ret

; input:
; - bc = card ID
AddCardToOpponentDeck:
	push af
	push hl
	push bc
	ld b, $00
	ld a, [wOppDeckIndex]
	ld c, a
	sla c
	ld hl, wOppDeck
	add hl, bc
	pop bc
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop af
	ret

Func_c72b:
	push af
	push bc
	ld b, a
	call Func_d833
	cp $00
	jr z, .asm_c75b
	ld a, [wOppDeckIndex]
	cp DECK_SIZE
	jr nc, .asm_c75b
	ld c, CARD_LOCATION_0
	call Func_1c4f
	call Func_c6f2
	call Func_c6da
	call IncrementOppDeckIndex
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_21cc
	call Func_217e
	call Func_1caa
.asm_c75b
	pop bc
	pop af
	ret

Func_c75e:
	push af
	push bc
	call ResetOppDeckIndex
	ld b, $00
	ld c, HAND_SIZE
.loop
	ld a, b
	call Func_c72b
	inc b
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret
; 0xc772

SECTION "Bank 03@4b87", ROMX[$4b87], BANK[$03]

Func_cb87:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $4baa
	call Func_10d9
	farcall Func_803e
	farcall Func_28b5a
	call Func_cbb4
	call EnableLCD
	call Func_fff
	call Func_f74
	pop hl
	pop af
	ret
; 0xcbaa

SECTION "Bank 3@4bb4", ROMX[$4bb4], BANK[$3]

Func_cbb4:
	call ClearOAM
	call Func_cc1e
	call Func_cbc1
	call Func_1225
	ret

Func_cbc1:
	push af
	push bc
	push de
	push hl
	ld de, $4bd9
	ld hl, vTiles0
	ld c, $10
.asm_cbcd
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_cbcd
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xcbd9

SECTION "Bank 03@4be9", ROMX[$4be9], BANK[$03]

Func_cbe9:
	push af
	ld a, $00
	ld [$ccfd], a
	pop af
	ret
; 0xcbf1

SECTION "Bank 3@4c1e", ROMX[$4c1e], BANK[$3]

Func_cc1e:
	push af
	push bc
	push de
	push hl
	ld bc, $2
	ld a, [$ccfd]
	call Func_cc35
	ld d, $20
	call Func_123c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_cc35:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $4c42
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0xcc42

SECTION "Bank 03@4c4c", ROMX[$4c4c], BANK[$03]

Func_cc4c:
	push bc
	push de
	push hl
	ld e, $00
.loop
	call Func_cc76
	ld b, $00
	ld c, a
	ld hl, $4c6c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	cp $01
	jr nz, .loop
	ld a, e
	pop hl
	pop de
	pop bc
	ret
; 0xcc6c

SECTION "Bank 3@4c76", ROMX[$4c76], BANK[$3]

Func_cc76:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_cc8f
	ld c, $08
.asm_cc84
	dec c
	rlca
	jr nc, .asm_cc84
	ld b, $00
	ld hl, $4ca8
	add hl, bc
	ld d, [hl]
.asm_cc8f
	ld a, [wcaa7]
	and $c0
	jr z, .asm_cca3
	ld c, $08
.asm_cc98
	dec c
	rlca
	jr nc, .asm_cc98
	ld b, $00
	ld hl, $4ca8
	add hl, bc
	ld d, [hl]
.asm_cca3
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0xcca8

SECTION "Bank 3@4d55", ROMX[$4d55], BANK[$3]

Func_cd55:
	push af
	ld a, $00
	ld [$cd5e], a
	ld a, $03
	ld [$cd5f], a
	ld a, $00
	ld [$cd60], a
	ld a, $02
	ld [$cd61], a
	call Func_cd72
	call Func_cefb
	pop af
	ret

Func_cd72:
	push af
	ld a, $00
	ld [$cd5c], a
	pop af
	ret
; 0xcd7a

SECTION "Bank 3@4d9a", ROMX[$4d9a], BANK[$3]

Func_cd9a:
	push af
	push bc
	ld a, [$cd5e]
	ld b, a
	ld a, [$cd5f]
	ld c, a
	call Func_cfe1
	call Func_1c4f
	call Func_1c92
	farcall $05, $09
	pop bc
	pop af
	ret
; 0xcdb3

SECTION "Bank 3@4efb", ROMX[$4efb], BANK[$3]

Func_cefb:
	push af
	ld a, [$cd5c]
	cp $00
	jr nz, .asm_cf09
	call Func_cf93
	call Func_cf45
.asm_cf09
	ld a, [$cd5c]
	cp $01
	jr nz, .asm_cf19
	call Func_cf93
	call Func_cf45
	call Func_cf5e
.asm_cf19
	ld a, [$cd5c]
	cp $02
	jr nz, .asm_cf26
	call Func_cf93
	call Func_cf45
.asm_cf26
	ld a, [$cd5c]
	cp $03
	jr nz, .asm_cf33
	call Func_cf93
	call Func_cf77
.asm_cf33
	ld a, [$cd5c]
	cp $04
	jr nz, .asm_cf43
	call Func_cf93
	call Func_cf45
	call Func_cf5e
.asm_cf43
	pop af
	ret

Func_cf45:
	push af
	push bc
	push de
	ld a, [$cd5e]
	ld b, a
	ld a, [$cd5f]
	ld c, a
	call Func_cfbe
	ld d, $50
	ld e, $00
	call Func_12d9
	pop de
	pop bc
	pop af
	ret

Func_cf5e:
	push af
	push bc
	push de
	ld a, [$cd60]
	ld b, a
	ld a, [$cd61]
	ld c, a
	call Func_cfbe
	ld d, $54
	ld e, $08
	call Func_12d9
	pop de
	pop bc
	pop af
	ret

Func_cf77:
	push af
	push bc
	push de
	ld bc, $580a
	ld d, $77
	call Func_d8ee
	cp $02
	jr nz, .asm_cf8a
	ld a, $7e
	jr .asm_cf8c
.asm_cf8a
	ld a, $8e
.asm_cf8c
	call Func_123c
	pop de
	pop bc
	pop af
	ret

Func_cf93:
	push af
	push bc
	push de
	ld a, $ff
	ld b, a
	ld a, $ff
	ld c, a
	ld d, $50
	ld e, $00
	call Func_12d9
	ld a, $ff
	ld b, a
	ld a, $ff
	ld c, a
	ld d, $54
	ld e, $08
	call Func_12d9
	ld bc, $580a
	ld d, $ff
	ld a, $ff
	call Func_123c
	pop de
	pop bc
	pop af
	ret

Func_cfbe:
	push af
	push de
	push hl
	push bc
	ld a, b
	ld c, a
	ld b, $00
	ld hl, $4fdc
	add hl, bc
	ld e, [hl]
	pop bc
	ld b, $00
	ld hl, $4fd8
	add hl, bc
	ld c, [hl]
	ld b, e
	pop hl
	pop de
	pop af
	ret

SECTION "Bank 3@4fe1", ROMX[$4fe1], BANK[$3]

Func_cfe1:
	push af
	ld a, c
	cp $00
	jr nz, .asm_cfeb
	ld a, $04
	sub b
	ld b, a
.asm_cfeb
	ld a, c
	cp $01
	jr nz, .asm_cff4
	ld a, $04
	sub b
	ld b, a
.asm_cff4
	pop af
	ret
; 0xcff6

SECTION "Bank 3@5014", ROMX[$5014], BANK[$3]

Func_d014:
	push af
	push bc
	push de
	push hl
	xor a
	ld [$cd62], a
	farcall Func_1454b
	call Func_23b0
	cp $01
	jr z, .asm_d059
	farcall $2f, $05
	call Func_23b0
	cp $01
	jr z, .asm_d059
	farcall $0d, $05
	call Func_d06c
.asm_d036
	call Func_d095
	ld b, $00
	ld c, a
	ld hl, $505e
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $5048
	push bc
	jp hl
	call Func_23b0
	cp $01
	jr z, .asm_d056
	ld a, [$cd62]
	cp $01
	jr nz, .asm_d036
.asm_d056
	call Func_d085
.asm_d059
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xd05e

SECTION "Bank 3@506c", ROMX[$506c], BANK[$3]

Func_d06c:
	call Func_fa4d
	call Func_2c31
	call Func_da60
	call Func_cd55
	call Func_c142
	call Func_cd9a
	call Func_d3ec
	call Func_1104
	ret

Func_d085:
	call Func_2ba9
	call Func_2bf0
	call Func_cd55
	call Func_d953
	call Func_d213
	ret

Func_d095:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $f3
	jr z, .asm_d0ae
	ld c, $08
.asm_d0a3
	dec c
	rlca
	jr nc, .asm_d0a3
	ld b, $00
	ld hl, $50c7
	add hl, bc
	ld d, [hl]
.asm_d0ae
	ld a, [wJoypadDown]
	and $f0
	jr z, .asm_d0c2
	ld c, $08
.asm_d0b7
	dec c
	rlca
	jr nc, .asm_d0b7
	ld b, $00
	ld hl, $50c7
	add hl, bc
	ld d, [hl]
.asm_d0c2
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0xd0c7

SECTION "Bank 3@5140", ROMX[$5140], BANK[$3]

Func_d140:
	push af
	push bc
	push hl
	ld a, $00
	ld [$cd63], a
	ld hl, $cd64
	ld c, DECK_SIZE
.asm_d14d
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld a, HIGH(INVALID_CARD)
	ld [hli], a
	dec c
	jr nz, .asm_d14d
	pop hl
	pop bc
	pop af
	ret

Func_d15a:
	ld [$cd63], a
	ret

Func_d15e:
	push af
	xor a
	ld [$cd63], a
	pop af
	ret

Func_d165:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cd63]
	ld c, a
	sla c
	ld hl, $cd64
	add hl, bc
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld [hl], HIGH(INVALID_CARD)
	pop hl
	pop bc
	pop af
	ret

Func_d17d:
	push af
	push hl
	ld b, $00
	ld a, [$cd63]
	ld c, a
	sla c
	ld hl, $cd64
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop hl
	pop af
	ret

Func_d191:
	push af
	ld a, [$cd63]
	cp DECK_SIZE
	jr nc, .asm_d19d
	inc a
	ld [$cd63], a
.asm_d19d
	pop af
	ret

Func_d19f:
	push af
	push hl
	push bc
	ld b, $00
	ld a, [$cd63]
	ld c, a
	sla c
	ld hl, $cd64
	add hl, bc
	pop bc
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop af
	ret
; 0xd1b5

SECTION "Bank 3@51cc", ROMX[$51cc], BANK[$3]

Func_d1cc:
	push af
	push bc
	ld b, a
	call Func_d813
	cp $00
	jr z, .asm_d1fc
	ld a, [$cd63]
	cp DECK_SIZE
	jr nc, .asm_d1fc
	ld c, CARD_LOCATION_HAND
	call Func_1c4f
	call Func_d17d
	call Func_d165
	call Func_d191
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_21cc
	call Func_217e
	call Func_1caa
.asm_d1fc
	pop bc
	pop af
	ret

Func_d1ff:
	push af
	push bc
	call Func_d15e
	ld b, $00
	ld c, HAND_SIZE
.loop
	ld a, b
	call Func_d1cc
	inc b
	dec c
	jr nz, .loop
	pop bc
	pop af
	ret

Func_d213:
	push af
	push bc
	ld b, $00
	ld c, $05
.asm_d219
	ld a, b
	call Func_d1cc
	inc b
	dec c
	jr nz, .asm_d219
	pop bc
	pop af
	ret

Func_d224:
	call Func_2384
	farcall Func_b85d
	call Func_1c28
	call Func_c06c
	call Func_c0b9
	call Func_e447
	farcall Func_36e68
	call Func_d1ff
	call Func_c106
	call Func_2b94
	call Func_2bde
	call Func_cd55
	ret
; 0xd249

SECTION "Bank 3@53ec", ROMX[$53ec], BANK[$3]

Func_d3ec:
	push af
	push bc
	call Func_d447
	cp $00
	jr z, .asm_d3fc
	ld b, $01
	ld c, $6d
	farcall $03, $09
.asm_d3fc
	call Func_cefb
	ld a, $0a
	call SetPendingVBlankMode
	farcall $35, $01
	call RequestVBlankMode
	call Func_f74
	ld a, $0e
	call SetPendingVBlankMode
	call Func_d47b
	call RequestVBlankMode
	call Func_f74
	call Func_1c0a
	farcall $31, $01
	ld bc, $6030
	call Func_1c1d
	ld bc, NULL
	call Func_1c12
	farcall $33, $01
	call RequestVBlankMode
	call Func_f74
	ld a, $0a
	call SetPendingVBlankMode
	farcall $33, $01
	call RequestVBlankMode
	call Func_f74
	pop bc
	pop af
	ret

Func_d447:
	push bc
	push de
	ld e, $01
	ld a, [$cd12]
	ld c, a
	ld a, [$cd11]
	ld b, a
	call Func_1c4f
	call Func_1c92
	ld a, c
	cp $01
	jr nz, .asm_d469
	call Func_21f9
	cp $01
	jr nz, .asm_d467
	ld e, $00
.asm_d467
	jr .asm_d477
.asm_d469
	cp $02
	jr nz, .asm_d471
	ld e, $00
	jr .asm_d477
.asm_d471
	cp $03
	jr nz, .asm_d477
	ld e, $00
.asm_d477
	ld a, e
	pop de
	pop bc
	ret

Func_d47b:
	call Func_d48e
	call Func_d4d7
	call Func_d50e
	call Func_d545
	call Func_d58c
	call Func_d5db
	ret

Func_d48e:
	push af
	push bc
	push de
	push hl
	call Func_1114
	ld a, [$cd0f]
	ld c, a
	ld a, [$cd10]
	ld b, a
	call Func_1508
	bcbgcoord 1, 6
	call Func_f3d
	ld de, $cab9
	ld c, $08
.asm_d4ab
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	call Func_f50
	dec c
	jr nz, .asm_d4ab
	bcbgcoord 1, 7
	call Func_f3d
	ld de, $cab9
	ld c, $08
.asm_d4c4
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	call Func_f50
	dec c
	jr nz, .asm_d4c4
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d4d7:
	push af
	push bc
	push de
	push hl
	ld a, $00
	farcall $1d, $01
	ld a, [$cd13]
	ld c, a
	ld a, [$cd14]
	ld b, a
	farcall $1b, $01
	farcall $1f, $01
	ld a, b
	cp $ff
	jr nz, .asm_d4f6
	farcall $21, $01
.asm_d4f6
	bcbgcoord 5, 8
	call Func_f3d
	ld de, $cab9
	ld c, $04
.asm_d501
	ld a, [de]
	inc de
	call Func_f50
	dec c
	jr nz, .asm_d501
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d50e:
	push af
	push bc
	push de
	push hl
	ld a, $00
	farcall $1d, $01
	ld a, [$cd15]
	ld c, a
	ld a, [$cd16]
	ld b, a
	farcall $1b, $01
	farcall $1f, $01
	ld a, b
	cp $ff
	jr nz, .asm_d52d
	farcall $21, $01
.asm_d52d
	bcbgcoord 5, 9
	call Func_f3d
	ld de, $cab9
	ld c, $04
.asm_d538
	ld a, [de]
	inc de
	call Func_f50
	dec c
	jr nz, .asm_d538
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d545:
	push af
	push bc
	push hl
	ld a, [$cab0]
	ld c, a
	ld a, [$cab1]
	ld b, a
	farcall $1b, $01
	farcall $1f, $01
	bcbgcoord 5, 16
	call Func_f3d
	ld hl, $cab9
	ld c, $04
.asm_d561
	ld a, [hli]
	call Func_f50
	dec c
	jr nz, .asm_d561
	ld a, [$cab3]
	ld c, a
	ld a, [$cab4]
	ld b, a
	farcall $1b, $01
	farcall $1f, $01
	bcbgcoord 5, 1
	call Func_f3d
	ld hl, $cab9
	ld c, $04
.asm_d581
	ld a, [hli]
	call Func_f50
	dec c
	jr nz, .asm_d581
	pop hl
	pop bc
	pop af
	ret

Func_d58c:
	push af
	push bc
	push de
	push hl
	call Func_1114
	ld b, $00
	ld a, [$cad1]
	ld c, a
	farcall $1b, $01
	ld a, $02
	farcall $1d, $01
	farcall $1f, $01
	bcbgcoord 1, 3
	call Func_f3d
	ld de, $cab9
	ld c, $08
.asm_d5af
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	call Func_f50
	dec c
	jr nz, .asm_d5af
	bcbgcoord 1, 4
	call Func_f3d
	ld de, $cab9
	ld c, $08
.asm_d5c8
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	call Func_f50
	dec c
	jr nz, .asm_d5c8
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_d5db:
	push af
	push bc
	push de
	push hl
	bcbgcoord 1, 11
	call Func_f3d
	ld a, [$cd0f]
	ld c, a
	ld a, [$cd10]
	ld b, a
	call IsCardInvalid
	cp $00
	jr nz, .asm_d60e
	call Func_218b
	ld b, $00
	ld c, a
	sla c
	ld hl, $561f
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $08
.asm_d605
	ld a, [hli]
	call Func_f50
	dec c
	jr nz, .asm_d605
	jr .asm_d61a
.asm_d60e
	ld hl, $5647
	ld c, $08
.asm_d613
	ld a, [hli]
	call Func_f50
	dec c
	jr nz, .asm_d613
.asm_d61a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xd61f

SECTION "Bank 3@5813", ROMX[$5813], BANK[$3]

Func_d813:
	push bc
	ld b, a
	ld c, CARD_LOCATION_HAND
	call Func_1c4f
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsCardInvalid
	ld c, $01
	cp $00
	jr nz, .asm_d830
	ld c, $00
.asm_d830
	ld a, c
	pop bc
	ret

Func_d833:
	push bc
	ld b, a
	ld c, CARD_LOCATION_0
	call Func_1c4f
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsCardInvalid
	ld c, $01
	cp $00
	jr nz, .asm_d850
	ld c, $00
.asm_d850
	ld a, c
	pop bc
	ret
; 0xd853

SECTION "Bank 3@58ee", ROMX[$58ee], BANK[$3]

Func_d8ee:
	push bc
	ld a, [$cd5e]
	ld b, a
	ld c, CARD_LOCATION_2
	call Func_1c4f
	call Func_1c92
	call Func_21f3
	pop bc
	ret
; 0xd900

SECTION "Bank 3@5953", ROMX[$5953], BANK[$3]

Func_d953:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld c, CARD_LOCATION_2
	ld d, $00
.asm_d95d
	call Func_1c4f
	call Func_1c92
	call Func_21b4
	call Func_1c7a
	inc b
	ld a, b
	cp $05
	jr c, .asm_d95d
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0xd974

SECTION "Bank 3@5a60", ROMX[$5a60], BANK[$3]

Func_da60:
	push af
	push bc
	push hl
	lb bc, 0, CARD_LOCATION_1
.asm_da66
	ld a, b
	cp $05
	jr nc, .asm_da8b
	call Func_1c4f
	call Func_1c92
	call Func_21f3
	cp $02
	jr nz, .asm_da88
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall $11, $01
	farcall $43, $01
	pop bc
.asm_da88
	inc b
	jr .asm_da66
.asm_da8b
	pop hl
	pop bc
	pop af
	ret
; 0xda8f

SECTION "Bank 3@6447", ROMX[$6447], BANK[$3]

Func_e447:
	push af
	push bc
	push de
	push hl
	call Func_d140
	ld a, 0
	ld [wRandRangeStart], a
	ld a, DECK_SIZE - 1
	ld [wRandRangeEnd], a
	ld e, DECK_SIZE
.loop
	ld a, e
	dec a
	call Func_c5e8
	call RandomRange
	ld a, [wRandNum]
	ld d, a
	call Func_e47a
	call Func_c604
	call Func_d19f
	dec e
	jr nz, .loop
	call Func_2639
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_e47a:
	push af
	push bc
	push de
	push hl
	ld e, a
.loop
	ld a, e
	call Func_d15a
	call Func_d17d
	call IsCardInvalid
	cp TRUE
	jr z, .skip
	inc e
	ld a, e
	cp DECK_SIZE
	jr nz, .asm_e495
	ld e, 0
.asm_e495
	jr .loop
.skip
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_e49c:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $64bc
	call Func_10d9
	farcall DrawMainMenu
	call Func_e4c6
	call EnableLCD
	call Func_100e
	call Func_f74
	pop hl
	pop af
	ret
; 0xe4bc

SECTION "Bank 3@64fb", ROMX[$64fb], BANK[$3]

Func_e4fb:
	push af
	push bc
	push de
	push hl
	ld e, $00
.loop
	call Random
	call Func_e52e
	call Func_e626
	ld b, $00
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	cp $01
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_e568
	dw Func_e575
	dw Func_e5f3
	dw Func_e606
	dw $6619
	dw $65cf

Func_e52e:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and PAD_A | PAD_B | PAD_SELECT | PAD_START | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	jr z, .no_keys
	ld c, $08
.asm_e53c
	dec c
	rlca
	jr nc, .asm_e53c
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.no_keys
	ld a, [wcaa7]
	and $c0
	jr z, .asm_e55b
	ld c, $08
.asm_e550
	dec c
	rlca
	jr nc, .asm_e550
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_e55b
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $0a, $00, $08, $00, $00, $04, $06

Func_e568:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call Func_f74
	xor a
	ret

Func_e575:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_e6e9
	call RequestVBlankMode
	call Func_f74
	ld a, [$cea0]
	cp $00
	jr nz, .asm_e598
	call Func_1fa8
	farcall Func_10047
	call Func_e6be
	call Func_e49c
	jr .done
.asm_e598
	cp $01
	jr nz, .asm_e5aa
	call Func_1fb0
	farcall $0f, $04
	call Func_e6be
	call Func_e49c
	jr .done
.asm_e5aa
	cp $02
	jr nz, .asm_e5bc
	call Func_1fb8
	farcall $11, $04
	call Func_e6be
	call Func_e49c
	jr .done
.asm_e5bc
	cp $03
	jr nz, .done
	call Func_1fc0
	farcall $17, $04
	call Func_e6be
	call Func_e49c
.done
	ld a, $01
	ret
; 0xe5cf

SECTION "Bank 3@65f3", ROMX[$65f3], BANK[$3]

Func_e5f3:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_e6d8
	call Func_e6e9
	call RequestVBlankMode
	call Func_f74
	xor a
	ret
; 0xe606

SECTION "Bank 3@6606", ROMX[$6606], BANK[$3]

Func_e606:
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_e6c7
	call Func_e6e9
	call RequestVBlankMode
	call Func_f74
	xor a
	ret
; 0xe619

SECTION "Bank 3@6626", ROMX[$6626], BANK[$3]

Func_e626:
	push af
	push bc
	push hl
	ld a, [wJoypadPressed]
	cp NONE
	jr z, .done
	ld a, e
	cp $00
	jr nz, .asm_e64c
	ld a, [wJoypadPressed]
	cp PAD_UP
	jr nz, .asm_e63e
	ld e, $01
.asm_e63e
	cp PAD_DOWN
	jr nz, .asm_e644
	ld e, $08
.asm_e644
	cp PAD_LEFT
	jr nz, .asm_e64a
	ld e, $13
.asm_e64a
	jr .asm_e661
.asm_e64c
	ld d, $00
	ld hl, .ButtonCombination1
	add hl, de
	ld a, [wJoypadPressed]
	cp [hl]
	jr nz, .reset
	ld hl, $66a4
	add hl, de
	ld e, [hl]
	jr .asm_e661
.reset
	ld e, $00
.asm_e661
	ld a, e
	cp $81
	jr nz, .asm_e672
	ld a, $22
	ld [$b7f1], a
	call Func_2b7e
	ld e, $00
	jr .done
.asm_e672
	ld a, e
	cp $82
	jr nz, .done
	ldh a, [$ffde]
	cp $03
	jr nz, .asm_e681
	ld a, $02
	ldh [$ffde], a
.asm_e681
	call Func_2b26
	ld e, $00
.done
	pop hl
	pop bc
	pop af
	ret

.ButtonCombination1:
	db PAD_UP, PAD_DOWN, PAD_B, PAD_DOWN, PAD_DOWN, PAD_B | PAD_UP, PAD_B, PAD_DOWN
.ButtonCombination2:
	db PAD_UP, PAD_B, PAD_DOWN, PAD_DOWN, PAD_RIGHT, PAD_UP, PAD_UP, PAD_UP, PAD_UP, PAD_B | PAD_DOWN, PAD_LEFT
.ButtonCombination3:
	db PAD_B, PAD_B, PAD_B, PAD_UP, PAD_B, PAD_B, PAD_B | PAD_RIGHT
; 0xe68a

SECTION "Bank 03@66be", ROMX[$66be], BANK[$03]

Func_e6be:
	push af
	xor a
	ld [$cea0], a
	pop af
	ret
; 0xe6c5

SECTION "Bank 3@64c6", ROMX[$64c6], BANK[$3]

Func_e4c6:
	call ClearOAM
	call Func_e6e9
	call Func_e4d3
	call Func_1225
	ret

Func_e4d3:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_e4ea
	ld hl, vTiles0
	ld c, TILE_SIZE
.loop_copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_e4ea: INCBIN "gfx/gfx_e4ea.2bpp"
; 0xe4fa

SECTION "Bank 3@66c7", ROMX[$66c7], BANK[$3]

Func_e6c7:
	push af
	ld a, [$cea0]
	cp $03
	jr z, .asm_e6d6
	ld a, [$cea0]
	inc a
	ld [$cea0], a
.asm_e6d6
	pop af
	ret

Func_e6d8:
	push af
	ld a, [$cea0]
	cp $00
	jr z, .asm_e6e7
	ld a, [$cea0]
	dec a
	ld [$cea0], a
.asm_e6e7
	pop af
	ret

Func_e6e9:
	push af
	push bc
	push de
	push hl
	lb bc, $00, $2
	ld a, [$cea0]
	call Func_e700
	ld d, 96 ; x
	call Func_123c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_e700:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $670d
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0xe70d

SECTION "Bank 3@7a4d", ROMX[$7a4d], BANK[$3]

Func_fa4d:
	push af
	push bc
	ld b, $00
.asm_fa51
	ld a, b
	cp $05
	jr nc, .asm_fa93
	ld c, CARD_LOCATION_2
	call Func_1c4f
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call Func_fadb
	ld a, b
	cp $01
	jr nz, .asm_fa8f
	ld a, c
	farcall $1b, $05
	ld b, $00
	sla c
	ld hl, $7b2a
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, c
	ld [wTempCardID + 0], a
	ld a, b
	ld [wTempCardID + 1], a
	call Func_1c7a
	farcall $11, $01
	farcall $43, $01
.asm_fa8f
	pop bc
	inc b
	jr .asm_fa51
.asm_fa93
	pop bc
	pop af
	ret
; 0xfa96

SECTION "Bank 3@7adb", ROMX[$7adb], BANK[$3]

Func_fadb:
	push af
	push de
	push hl
	ld hl, $7b20
	ld d, b
	ld e, c
	ld bc, NULL
.asm_fae6
	push bc
	push de
	sla c
	ld hl, $7b20
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, rIE
	call CompareBCAndDE
	pop de
	pop bc
	cp $00
	jr nz, .asm_fb02
	ld b, $00
	jr .asm_fb1c
.asm_fb02
	push bc
	sla c
	ld hl, $7b20
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call CompareBCAndDE
	pop bc
	cp $00
	jr nz, .asm_fb19
	ld b, $01
	jr .asm_fb1c
.asm_fb19
	inc c
	jr .asm_fae6
.asm_fb1c
	pop hl
	pop de
	pop af
	ret
; 0xfb20
