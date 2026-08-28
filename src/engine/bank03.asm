	dw BANK(@)

	farcall_table_start
	farfunc $406c ; $03
	farfunc $40b9 ; $05
	farfunc $425e ; $07
	farfunc $452e ; $09
	farfunc Func_c5cc ; $0b
	farfunc $468a ; $0d
	farfunc $4786 ; $0f
	farfunc $4be9 ; $11
	farfunc $4b87 ; $13
	farfunc $67eb ; $15
	farfunc $4c4c ; $17
	farfunc $684e ; $19
	farfunc $4618 ; $1b
	farfunc $4664 ; $1d
	farfunc $675b ; $1f
	farfunc $67a7 ; $21
	farfunc $4604 ; $23
	farfunc $4630 ; $25
	farfunc $6747 ; $27
	farfunc $6773 ; $29
	farfunc $4d55 ; $2b
	farfunc $5249 ; $2d
	farfunc $5224 ; $2f
	farfunc $4efb ; $31
	farfunc $4fe1 ; $33
	farfunc $53ec ; $35
	farfunc $4d9a ; $37
	farfunc Func_e6be ; $39
	farfunc Func_e49c ; $3b
	farfunc Func_e4fb ; $3d
	farfunc $6e30 ; $3f
	farfunc $475e ; $41
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
	farfunc $46cf ; $5d
	farfunc $4715 ; $5f
	farfunc Func_c5e8 ; $61
	farfunc Func_c5ec ; $63
	farfunc $43e3 ; $65
	farfunc $7a96 ; $67
	farfunc $5014 ; $69
	farfunc $6711 ; $6b

SECTION "Bank 03@45cc", ROMX[$45cc], BANK[$03]

Func_c5cc:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [$cc5a], a
	ld hl, $cc5b
	ld c, $28
.asm_c5da
	ld a, $6d
	ld [hli], a
	ld a, $01
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
; 0xc604

SECTION "Bank 03@649c", ROMX[$649c], BANK[$03]

Func_e49c:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $64bc
	call Func_10d9
	farcall Func_29422
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
	call AdvanceRNG
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
	dw $65f3
	dw $6606
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
	farcall $0d, $04
	call Func_e6be
	call Func_e49c
	jr .asm_e5cc
.asm_e598
	cp $01
	jr nz, .asm_e5aa
	call Func_1fb0
	farcall $0f, $04
	call Func_e6be
	call Func_e49c
	jr .asm_e5cc
.asm_e5aa
	cp $02
	jr nz, .asm_e5bc
	call Func_1fb8
	farcall $11, $04
	call Func_e6be
	call Func_e49c
	jr .asm_e5cc
.asm_e5bc
	cp $03
	jr nz, .asm_e5cc
	call Func_1fc0
	farcall $17, $04
	call Func_e6be
	call Func_e49c
.asm_e5cc
	ld a, $01
	ret
; 0xe5cf

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

SECTION "Bank 3@66e9", ROMX[$66e9], BANK[$3]

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
