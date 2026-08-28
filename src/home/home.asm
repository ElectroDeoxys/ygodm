_Start:
	ldh [$ffdd], a
	ld hl, $e000
	ld sp, hl
	call Func_1090
	farcall Func_10477
	ld a, $00
	farcall Func_fc004
	farcall Func_f8008
	call InitTransferVirtualOAM
	call Func_396
	call Func_dd8
	call Func_19f

	ld a, $02
	farcall Func_fc004
	farcall Func_6595
	ld a, $04
	farcall Func_fc004
	farcall Func_65c4
	ld a, $06
	farcall Func_fc004
	call Func_40c
	farcall Func_65f3

	farcall Func_10020

	call Func_1724
	ld a, VBLANK_16
	call SetPendingVBlankMode
	call RequestVBlankMode
	call Func_2d1f
	debug_loop
	ret

Func_19f:
	push af
	push hl
	di
	call Func_1fe6
	ld hl, rIE
	res B_IE_SERIAL, [hl]
	ld hl, rIF
	res B_IE_SERIAL, [hl]
	ld a, $00
	ld [$caa1], a
	xor a
	ld [$caa4], a
	ld [$caa2], a
	ld [$caa3], a
	ld [$caa0], a
	ldh [rSC], a
	ld a, $00
	ldh [rSB], a
	ld hl, rSC
	res B_SC_SOURCE, [hl]
	ei
	pop hl
	pop af
	ret

Serial:
	push af
	push bc
	push de
	push hl
	ld a, [$caa1]
	cp $00
	jr nz, .asm_1e0
	call Func_1f6
	jr .asm_1f0
.asm_1e0
	cp $02
	jr nz, .asm_1e9
	call Func_20f
	jr .asm_1f0
.asm_1e9
	cp $04
	jr nz, .asm_1f0
	call Func_21a
.asm_1f0
	pop hl
	pop de
	pop bc
	pop af
	reti

	ret

Func_1f6:
	ldh a, [rSB]
	ld [$caa2], a
	cp $20
	jr z, .asm_20e
	ld a, $00
	ldh [rSB], a
	call Func_376
	ld a, SC_EXTERNAL
	ldh [rSC], a
	ld a, SC_START
	ldh [rSC], a
.asm_20e
	ret

Func_20f:
	ldh a, [rSB]
	ld [$caa2], a
	ld a, $01
	ld [$caa0], a
	ret

Func_21a:
	ldh a, [rSB]
	ld [$caa2], a
	ld c, a
	and $f0
	cp $80
	jr nz, .asm_22e
	ld a, [$caa2]
	call Func_2025
	jr .asm_235
.asm_22e
	cp $50
	jr z, .asm_235
	call Func_1e65
.asm_235
	ld a, [$caa3]
	ldh [rSB], a
	ld hl, rSC
	set B_SC_START, [hl]
	ld a, $01
	ld [$caa0], a
	xor a
	ld [$caad], a
	ld [$caae], a
	ld [$caaf], a
	ret
; 0x24f

SECTION "Home@376", ROM0[$376]

Func_376:
	push af
	xor a
.asm_378
	nop
	nop
	dec a
	jr nz, .asm_378
	pop af
	ret
; 0x37f

SECTION "Home@396", ROM0[$396]

Func_396:
	push af
	ld a, $ff
	ld [wJoypadDown], a
	xor a
	ld [wJoypadPressed], a
	ld [wcaa7], a
	ld a, $14
	ld [wcaa8], a
	pop af
	ret

ReadJoypad:
	push af
	push bc
	push de
	; read d-pad
	ld a, JOYP_GET_CTRL_PAD
	ldh [rJOYP], a
	REPT 2
		ldh a, [rJOYP]
	ENDR
	cpl
	and JOYP_INPUTS
	swap a
	ld b, a

	; read buttons
	ld a, JOYP_GET_BUTTONS
	ldh [rJOYP], a
	REPT 6
		ldh a, [rJOYP]
	ENDR
	cpl
	and JOYP_INPUTS
	or b
	ld c, a
	; c holds all input of current frame

	ld a, [wJoypadDown] ; keys that were already down
	ld d, a
	xor c
	and c
	ld [wJoypadPressed], a ; key that are pressed on this frame
	ld a, c
	ld [wJoypadDown], a ; update keys down

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a

	ld a, [wJoypadDown]
	cp d
	jr nz, .asm_400
	ld a, $00
	ld [wcaa7], a
	ld a, [wcaa8]
	dec a
	ld [wcaa8], a
	jr nz, .asm_3fe
	ld a, $03
	ld [wcaa8], a
	ld a, d
	ld [wcaa7], a
.asm_3fe
	jr .done
.asm_400
	ld [wcaa7], a
	ld a, $14
	ld [wcaa8], a
.done
	pop de
	pop bc
	pop af
	ret

Func_40c:
	push hl
	di
	ld hl, rIF
	res B_IF_VBLANK, [hl]
	ld l, LOW(rIE)
	set B_IF_VBLANK, [hl]
	ei
	pop hl
	ret

VBlank:
	push af
	push hl
	push bc
	push de
	ld b, $00
	ld a, [wVBlankMode]
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Func_444  ; VBLANK_00
	dw Func_45d  ; VBLANK_02
	dw Func_483  ; VBLANK_04
	dw Func_4ac  ; VBLANK_06
	dw Func_51f  ; VBLANK_08
	dw Func_6ce  ; VBLANK_0A
	dw Func_826  ; VBLANK_0C
	dw Func_900  ; VBLANK_0E
	dw Func_a0a  ; VBLANK_10
	dw Func_b62  ; VBLANK_12
	dw Func_bf0  ; VBLANK_14
	dw Func_2d57 ; VBLANK_16

Func_444:
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_45d:
	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_483:
	call hTransferVirtualOAM
	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_4ac:
	call hTransferVirtualOAM

	ld bc, wc500
	ld e, $04
.asm_4b4
	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 20
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR
	dec e
	jr nz, .asm_4b4

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_51f:
	call hTransferVirtualOAM
	ld bc, wc500
	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT $80
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR
	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_6ce:
	call hTransferVirtualOAM

	ld bc, wc500
	REPT 10
		ld a, [bc]
		ld l, a
		inc c
		ld a, [bc]
		ld h, a
		inc c
		REPT 8
			ld a, [bc]
			ld [hli], a
			inc c
		ENDR
	ENDR

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_826:
	call hTransferVirtualOAM

	ld bc, wc500
	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 18
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 18
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 16
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_900:
	call hTransferVirtualOAM

	ld bc, wc500
	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	REPT 4
		ld a, [bc]
		ld l, a
		inc c
		ld a, [bc]
		ld h, a
		inc c
		REPT 4
			ld a, [bc]
			ld [hli], a
			inc c
		ENDR
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_a0a:
	call hTransferVirtualOAM
	ld bc, wc500

	REPT 5
		ld a, [bc]
		ld l, a
		inc c
		ld a, [bc]
		ld h, a
		inc c
		REPT 18
			ld a, [bc]
			ld [hli], a
			inc c
		ENDR
	ENDR

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_b62:
	call hTransferVirtualOAM

	ld bc, wc500
	ld de, $20
	REPT 5
		ld a, [bc]
		ld l, a
		inc c
		ld a, [bc]
		ld h, a
		inc c
		ld a, [bc]
		ld [hli], a
		inc c
		ld a, [bc]
		ld [hld], a
		inc c
		add hl, de
		ld a, [bc]
		ld [hli], a
		inc c
		ld a, [bc]
		ld [hld], a
		inc c
	ENDR

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_bf0:
	ld bc, wc500

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT $80
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, [bc]
	ld l, a
	inc c
	ld a, [bc]
	ld h, a
	inc c
	REPT 8
		ld a, [bc]
		ld [hli], a
		inc c
	ENDR

	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	ld c, LOW(hffe4)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hffe5)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db LOW(hffe0)
	call Func_1705
	db LOW(hffe1)
	pop de
	pop bc
	pop hl
	pop af
	reti

Func_dd8:
	push af
	ld a, VBLANK_00
	ld [wPendingVBlankMode], a
	ld [wVBlankMode], a
	pop af
	ret

; input:
; - a = VBLANK_* constant
SetPendingVBlankMode::
	push af
	push bc
	push hl
	ld [wPendingVBlankMode], a
	ld c, a
	ld b, $00
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	ld a, $00
	ld [wcaaa], a
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw .Func_e19 ; VBLANK_00
	dw .Func_e19 ; VBLANK_02
	dw .Func_e19 ; VBLANK_04
	dw .Func_e1a ; VBLANK_06
	dw .Func_e3f ; VBLANK_08
	dw .Func_e40 ; VBLANK_0A
	dw .Func_e4d ; VBLANK_0C
	dw .Func_e6a ; VBLANK_0E
	dw .Func_eb7 ; VBLANK_10
	dw .Func_ee4 ; VBLANK_12
	dw .Func_f11 ; VBLANK_14
	dw .Func_f2e ; VBLANK_16

.Func_e19:
	ret

.Func_e1a:
	push af
	push hl
	ld hl, wc500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld bc, $c516
	ld a, $18
	ld [hli], a
	ld [hl], $c5
	ld hl, $c52c
	ld a, $2e
	ld [hli], a
	ld [hl], $c5
	ld hl, $c542
	ld a, $42
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_e3f:
	ret

.Func_e40:
	push af
	push hl
	ld hl, wc500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_e4d:
	push af
	push hl
	ld hl, wc500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c514
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, $c528
	ld a, $2a
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_e6a:
	push af
	push hl
	ld hl, wc500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c50a
	ld a, $0c
	ld [hli], a
	ld [hl], $c5
	ld hl, $c514
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, $c51a
	ld a, $1c
	ld [hli], a
	ld [hl], $c5
	ld hl, $c520
	ld a, $22
	ld [hli], a
	ld [hl], $c5
	ld hl, $c526
	ld a, $28
	ld [hli], a
	ld [hl], $c5
	ld hl, $c52c
	ld a, $2e
	ld [hli], a
	ld [hl], $c5
	ld hl, $c536
	ld a, $38
	ld [hli], a
	ld [hl], $c5
	ld hl, $c540
	ld a, $42
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_eb7:
	push af
	push hl
	ld hl, wc500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c514
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, $c528
	ld a, $2a
	ld [hli], a
	ld [hl], $c5
	ld hl, $c53c
	ld a, $3e
	ld [hli], a
	ld [hl], $c5
	ld hl, $c550
	ld a, $52
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_ee4:
	push af
	push hl
	ld hl, wc500
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c506
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c50c
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c512
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c518
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_f11:
	push af
	push hl
	ld hl, wc500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c50a
	ld a, $0c
	ld [hli], a
	ld [hl], $c5
	ld hl, $c58a
	ld a, $8c
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_f2e:
	ret

RequestVBlankMode::
	push af
	ld a, [wPendingVBlankMode]
	ld [wVBlankMode], a
	ld a, VBLANK_00
	ld [wPendingVBlankMode], a
	pop af
	ret

Func_f3d::
	push af
	push hl
	ld h, HIGH(wc500)
	ld a, [wcaaa]
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, l
	ld [wcaaa], a
	pop hl
	pop af
	ret

Func_f50::
	push af
	push hl
	push af
	ld h, HIGH(wc500)
	ld a, [wcaaa]
	ld l, a
	pop af
	ld [hli], a
	ld a, l
	ld [wcaaa], a
	pop hl
	pop af
	ret
; 0xf62

SECTION "Home@f74", ROM0[$f74]

Func_f74::
	push af
	call Func_177b
	db $80, LOW(hffe4)
.asm_f7a
	call Func_168f
	call Func_175a
	db $80, LOW(hffe4)
	jr z, .asm_f7a
	pop af
	ret
; 0xf86

SECTION "Home@fce", ROM0[$fce]

Func_fce:
.loop
	ld a, [rRAMB]
	push af
	ld a, BANK(Func_f811a)
	call Bankswitch1
	call Func_f811a
	pop af
	call Bankswitch1
	call Func_177b
	db $80, LOW(hffe5)
.asm_fe3
	call Func_168f
	call Func_175a
	db $80, LOW(hffe5)
	jr z, .asm_fe3
	jr .loop
; 0xfef

SECTION "Home@fff", ROM0[$fff]

Func_fff:
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_100e::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $d2
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_101d::
	push af
	ld a, $00
	ldh [rBGP], a
	ld a, $00
	ldh [rOBP0], a
	ld a, $00
	ldh [rOBP1], a
	pop af
	ret
; 0x102c

SECTION "Home@1033", ROM0[$1033]

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

	; return address after call will be Func_1071
	ld a, HIGH(Func_1071)
	ld [hld], a
	ld a, LOW(Func_1071)
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

Func_1071:
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

Func_1090:
	push af
	push hl
	ld hl, rRAMG + $1000
	ld [hl], RAMG_SRAM_ENABLE
	ld hl, rBMODE + $1000
	ld [hl], BMODE_SIMPLE
	pop hl
	pop af
	ret

Bankswitch1:
	push af
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei
	pop af
	ret

Bankswitch2:
	push af
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei
	pop af
	ret

DisableLCD::
	push af
	push hl
	ld hl, rLCDC
	bit B_LCDC_ENABLE, [hl]
	jr z, .lcd_off
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK + 2
	jr c, .wait_vblank
	res B_LCDC_ENABLE, [hl]
.lcd_off
	pop hl
	pop af
	ret

EnableLCD::
	push af
	push hl
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	pop hl
	pop af
	ret

; sets configurations for:
; - rLCDC
; - rSTAT
; - rSCY
; - rSCX
; - rLYC
; - rBGP
; - rOBP0
; - rOBP1
; - rWY
; - rWX
Func_10d9::
	push af
	push bc
	push de
	push hl
	ld c, LOW(rLCDC)
	ld de, %1111010111110000
	ld b, $0c
.loop
	sla e
	rl d
	jr nc, .next
	ld a, [hli]
	ld [$ff00+c], a
.next
	inc c
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

DoFrame::
	push af
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait_vblank
.wait_end_vblank
	ldh a, [rLY]
	cp 0
	jr nz, .wait_end_vblank
	pop af
	ret
; 0x1104

SECTION "Home@1114", ROM0[$1114]

Func_1114::
	push af
	ld a, $01
	ld [$cace], a
	pop af
	ret
; 0x111c

SECTION "Bank 0@1124", ROM0[$1124]

Func_1124::
	push af
	ld a, $03
	ld [$cace], a
	pop af
	ret

Func_112c::
	push af
	ld a, $02
	ld [$cace], a
	pop af
	ret
; 0x1134

SECTION "Home@1144", ROM0[$1144]

Func_1144::
	push af
	push bc
	push de
	push hl
	ld e, $00
	ld d, a
	cp $7d
	jr c, .asm_115c
	ld b, $00
	sub $7d
	rlca
	ld c, a
	ld hl, $11a4
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
.asm_115c
	ld a, d
	cp $00
	jr nz, .asm_116c
	ld b, $00
	ld a, [$cace]
	ld c, a
	ld hl, $1184
	add hl, bc
	ld d, [hl]
.asm_116c
	ld a, d
	ld [$cad0], a
	ld a, [$cace]
	add e
	ld e, a
	ld d, $00
	ld hl, $118c
	add hl, de
	ld a, [hl]
	ld [$cacf], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1184

SECTION "Home@120a", ROM0[$120a]

ClearOAM::
	push af
	push bc
	push hl
	ld hl, wVirtualOAM
	ld c, OAM_COUNT
.loop
	ld a, -1
	ld [hli], a ; y
	ld a, -1
	ld [hli], a ; x
	ld a, $00
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes
	dec c
	jr nz, .loop
	pop hl
	pop bc
	pop af
	ret

; copy wVirtualOAM directly to OAM
; this must be done during V-Blank or H-Blank
Func_1225::
	push af
	push bc
	push de
	push hl
	ld hl, wVirtualOAM
	ld de, $fe00 ; OAM
	ld c, OAM_SIZE
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

; input:
; - c = OAM index
; - a = y
; - d = x
; - b = tile ID
Func_123c::
	push af
	push bc
	push hl
	push bc
	sla c
	sla c
	ld b, $00
	ld hl, wVirtualOAM
	add hl, bc
	pop bc
	ld [hli], a ; y
	ld a, d
	ld [hli], a ; x
	ld a, b
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes
	pop hl
	pop bc
	pop af
	ret
; 0x1256

SECTION "Bank 0@12d2", ROM0[$12d2]

Func_12d2:
	call ClearOAM
	call Func_1225
	ret
; 0x12d9

SECTION "Home@1347", ROM0[$1347]

; output:
; - d = d / b
; - e = d % b
DDividedByB:
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
; 0x135e

SECTION "Bank 0@1391", ROM0[$1391]

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
; 0x13ab

SECTION "Home@14ea", ROM0[$14ea]

InitTransferVirtualOAM:
	push af
	push bc
	push hl
	ld b, SIZEOF("DMA Transfer")
	ld c, LOW(hTransferVirtualOAM)
	ld hl, TransferVirtualOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	pop hl
	pop bc
	pop af
	ret

TransferVirtualOAM:
LOAD "DMA Transfer", HRAM
hTransferVirtualOAM::
	ld a, HIGH(wVirtualOAM)
	ldh [rDMA], a ; start DMA transfer (starts right after instruction)
	ld a, 160 / (1 + 3) ; delay for a total of 160 cycles
.loop
	dec a        ; 1 cycle
	jr nz, .loop ; 3 cycles
	ret
ENDL
; 0x1508

SECTION "Home@1576", ROM0[$1576]

Func_1576::
	push af
	push hl
	call Func_179b
	call Func_172f
	call Func_15a2
	call Func_15e9

	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld hl, rIE
	res B_IE_TIMER, [hl]

	; set timer to 262k / 56 ~ 4678 Hz
	ld a, -56
	ldh [rTIMA], a
	ld a, -56
	ldh [rTMA], a
	ld a, TAC_262KHZ | TAC_START
	ldh [rTAC], a

	ld hl, rIE
	set B_IE_TIMER, [hl]
	pop hl
	pop af
	ret

Func_15a2:
	push af
	push bc
	push hl
	ld hl, Data_15c8
	lb bc, $3, LOW(hffeb)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	dec b
	jr nz, .loop
	pop hl
	pop bc
	pop af
	ret
; 0x15c4

SECTION "Home@15c8", ROM0[$15c8]

Data_15c8:
	dwb $dcf6, BANK(Func_fce)
	dw $dcfe, Func_fce

	dwb $dbf6, BANK(Func_1c002)
	dw $dbfe, Func_1c002

	dwb $daf6, BANK(Func_172c)
	dw $dafe, Func_172c
; 0x15dd

SECTION "Home@15e9", ROM0[$15e9]

Func_15e9:
	push af
	push bc
	push hl
	ld c, LOW(hffe0)
	ld hl, $15c4
	ld b, $04
.asm_15f3
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_15f3
	ld a, LOW(hffe0)
	ldh [hffdf], a
	pop hl
	pop bc
	pop af
	ret
; 0x1601

SECTION "Home@161a", ROM0[$161a]

Timer:
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	ldh a, [hffdf]
	ld c, a
	sub $e0
	ld b, a
	rlca
	add b ; *3
	ld e, a
	ld a, $01
	ld [$ff00+c], a
.asm_162f
	inc c
	ld a, c
	cp $e4
	jr nz, .asm_1637
	ld c, $e0
.asm_1637
	ld a, [$ff00+c]
	cp $01
	jr nz, .asm_162f
	ld a, c
	ldh [hffdf], a
	ld a, $02
	ld [$ff00+c], a
	ld a, $e8
	add e
	ld c, a
	ld hl, sp+$00
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, h
	ld [$ff00+c], a
	inc c
	ld a, [rRAMB]
	ld [$ff00+c], a
	ldh a, [hffdf]
	sub $e0
	ld b, a
	rlca
	add b ; *3
	ld e, a
	add $e8
	ld c, a
	ld a, [$ff00+c]
	ld l, a
	inc c
	ld a, [$ff00+c]
	ld h, a
	ld sp, hl
	inc c
	ld a, [$ff00+c]
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a

	ld d, $00
	ld hl, $15dd
	add hl, de
	ld a, [hl]
	ldh [rTIMA], a
	ld a, [hli]
	ldh [rTMA], a
	ld a, [hli]
	ldh [rTAC], a
	ld a, [hl]
	ldh [rTAC], a
	pop de
	pop bc
	pop af
	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld l, LOW(rIE)
	set B_IE_TIMER, [hl]
	pop hl
	reti
; 0x168e

SECTION "Home@168f", ROM0[$168f]

Func_168f::
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	di
	ldh a, [hffdf]
	ld c, a
	sub $e0
	ld b, a
	rlca
	add b ; *3
	ld e, a
	ld a, $00
	ld [$ff00+c], a
.asm_16a5
	inc c
	ld a, c
	cp $e4
	jr nz, .asm_16ad
	ld c, $e0
.asm_16ad
	ld a, [$ff00+c]
	cp $01
	jr nz, .asm_16a5
	ld a, c
	ldh [hffdf], a
	ld a, $02
	ld [$ff00+c], a

	; save current stack pointer and bank
	ld a, $e8
	add e
	ld c, a
	ld hl, sp+$00
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, h
	ld [$ff00+c], a
	inc c
	ld a, [rRAMB]
	ld [$ff00+c], a

	ldh a, [hffdf]
	sub $e0
	ld b, a
	rlca
	add b ; *3
	ld e, a
	add $e8
	ld c, a
	ld a, [$ff00+c]
	ld l, a
	inc c
	ld a, [$ff00+c]
	ld h, a
	ld sp, hl
	inc c
	ld a, [$ff00+c]
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a

	ld d, $00
	ld hl, $15dd
	add hl, de
	ld a, [hl]
	ldh [rTIMA], a
	ld a, [hli]
	ldh [rTMA], a
	ld a, [hli]
	ldh [rTAC], a
	ld a, [hl]
	ldh [rTAC], a
	pop de
	pop bc
	pop af
	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld l, LOW(rIE)
	set B_IE_TIMER, [hl]
	pop hl
	reti
; 0x1704

SECTION "Home@1705", ROM0[$1705]

Func_1705::
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, $01
	ld [$ff00+c], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_171c:
	push hl
	ld hl, rTAC
	res B_TAC_START, [hl]
	pop hl
	ret

Func_1724:
	di
	ld hl, rIE
	res B_IE_TIMER, [hl]
	reti
; 0x172b

SECTION "Home@172c", ROM0[$172c]

Func_172c:
.loop
	jr .loop
; 0x172e

SECTION "Home@172f", ROM0[$172f]

Func_172f:
	push af
	push bc
	ld c, LOW(hffe4)
	xor a
	ld b, $04
.asm_1736
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_1736
	pop bc
	pop af
	ret

Func_173e::
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, [$ff00+c]
	or b
	ld [$ff00+c], a
	ei
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_175a::
	push bc
	push de
	push hl
	ld hl, sp+$06
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, $ff
	xor b
	ld d, a
	ld a, [$ff00+c]
	ld e, a
	and d
	ld [$ff00+c], a
	ld a, e
	and b
	pop hl
	pop de
	pop bc
	reti
; 0x177a

SECTION "Home@177b", ROM0[$177b]

Func_177b::
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, $ff
	xor b
	ld b, a
	ld a, [$ff00+c]
	and b
	ld [$ff00+c], a
	pop hl
	pop de
	pop bc
	pop af
	reti
; 0x179a

SECTION "Home@179b", ROM0[$179b]

Func_179b:
	push af
	xor a
	ld [$ccff], a
	ld [$cd00], a
	ld [$cd09], a
	ld [$cd0a], a
	pop af
	ret

Func_17ab::
	push af
	push bc
	push de
	ld a, [$ccff]
	ld e, a
.asm_17b2
	ld a, [$cd00]
	cp e
	jr nz, .asm_17c9
	call Func_173e
	db $01, LOW(hffe6)
	call Func_171c
	call Func_1705
	db LOW(hffe2)
	call Func_168f
	jr .asm_17b2
.asm_17c9
	ld d, HIGH(wc600)
	ld c, $8 tiles
.asm_17cd
	ld a, [de]
	ld [hli], a
	inc e
	dec c
	jr nz, .asm_17cd
	ld a, e
	ld [$ccff], a
	pop de
	pop bc
	pop af
	ret

Func_17db:
	push af
	push bc
	push de
	ld a, [$cd00]
	ld e, a
	ld a, $80
	add e
	ld c, a
.loop
	ld a, [$ccff]
	cp c
	jr nz, .asm_17fd
	call Func_173e
	db $04, LOW(hffe4)
	call Func_171c
	call Func_1705
	db LOW(hffe0)
	call Func_168f
	jr .loop
.asm_17fd
	ld d, HIGH(wc600)
	ld c, $8 tiles
.asm_1801
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .asm_1801
	ld a, e
	ld [$cd00], a
	pop de
	pop bc
	pop af
	ret

Func_180f::
	push de
	push hl
	ld a, [$cd09]
	ld e, a
.loop
	ld a, [$cd0a]
	cp e
	jr nz, .asm_182c
	call Func_173e
	db $04, LOW(hffe4)
	call Func_171c
	call Func_1705
	db LOW(hffe0)
	call Func_168f
	jr .loop

.asm_182c
	ld d, $00
	ld hl, $cd01
	add hl, de
	inc e
	ld a, e
	cp $08
	jr nz, .asm_183a
	ld e, $00
.asm_183a
	ld a, e
	ld [$cd09], a
	ld a, [hli]
	pop hl
	pop de
	ret

Func_1842::
	push af
	push bc
	push de
	push hl
	push af
	ld d, $00
	ld a, [$cd0a]
	ld e, a
	ld hl, $cd01
	add hl, de
	inc e
	ld a, e
	cp $08
	jr nz, .asm_1859
	ld e, $00
.asm_1859
	ld a, [$cd09]
	cp e
	jr nz, .asm_1870
	call Func_173e
	db $01, LOW(hffe6)
	call Func_171c
	call Func_1705
	db LOW(hffe2)
	call Func_168f
	jr .asm_1859
.asm_1870
	pop af
	ld [hli], a
	ld a, e
	ld [$cd0a], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_187b::
	push af
	ld a, d
	ld [$cd0b], a
	ld a, c
	ld [$cd0c], a
	ld a, b
	ld [$cd0d], a
	pop af
	ret

Func_188a::
	push af
	push bc
	push hl
	ld a, [rRAMB]
	push af
	ld b, $00
	ld a, [$cd0b]
	ld c, a
	sla c
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	pop af
	call Bankswitch2
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_18b1
	dw Func_1a5e

Func_18b1:
	call Func_18b8
	call Func_1afd
	ret

Func_18b8:
	push af
	push bc
	push de
	push hl
	call Func_1aaf
	ld a, BANK(Func_40002)
	call Bankswitch1
	ld a, [$cd0c]
	ld c, a
	ld a, [$cd0d]
	ld b, a
	ld a, [$cd0b]
	ld d, a
	push bc
	call Func_40002
	call SetDecompressSource
	ld a, $01
	call Func_1af9
	ld bc, $50 tiles
	call SetDecompressLength
	pop bc
	ld hl, CardGraphicsBanks
	add hl, bc
	ld a, [hl]
	call Bankswitch1
	pop hl
	pop de
	pop bc
	pop af
	ret

CardGraphicsBanks:
	db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $11, $11, $11
	db $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $12, $12, $12, $12, $12
	db $12, $12, $12, $12, $12, $12, $12, $12, $13, $13, $13, $13, $13, $13, $13, $13
	db $13, $13, $13, $13, $13, $14, $14, $14, $14, $14, $14, $14, $14, $14, $14, $14
	db $14, $14, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $16
	db $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $17, $17, $17, $17
	db $17, $17, $17, $17, $17, $17, $17, $17, $17, $18, $18, $18, $18, $18, $18, $18
	db $18, $18, $18, $18, $18, $18, $19, $19, $19, $19, $19, $19, $19, $19, $19, $19
	db $19, $19, $19, $1a, $1a, $1a, $1a, $1a, $1a, $1a, $1a, $1a, $1a, $1a, $1a, $1a
	db $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1b, $1c, $1c, $1c
	db $1c, $1c, $1c, $1c, $1c, $1c, $1c, $1c, $1c, $1c, $1d, $1d, $1d, $1d, $1d, $1d
	db $1d, $1d, $1d, $1d, $1d, $1d, $1d, $1e, $1e, $1e, $1e, $1e, $1e, $1e, $1e, $1e
	db $1e, $1e, $1e, $1f, $1f, $1f, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f
	db $1f, $21, $21, $21, $21, $21, $21, $21, $21, $21, $21, $21, $21, $21, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $23, $23, $23, $23, $23
	db $23, $23, $23, $23, $23, $23, $23, $23, $24, $24, $24, $24, $24, $24, $24, $24
	db $24, $24, $24, $24, $24, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25
	db $25, $25, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $27
	db $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $28, $28, $28, $28
	db $28, $28, $28, $28, $28, $28, $28, $28, $28, $29, $29, $29, $29, $29, $29, $29
	db $29, $29, $29, $29, $29, $29, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a
	db $2a, $2a, $2a, $2b, $2b, $2b, $2b, $2b, $2b, $2b, $2b, $2b, $2b, $2b, $2b, $2b
	db $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c, $2c

Func_1a5e:
	call Func_1a65
	call Func_1afd
	ret

Func_1a65:
	push af
	push bc
	push de
	push hl
	call Func_1aaf
	ld a, BANK(Func_40002)
	call Bankswitch1
	ld a, [$cd0c]
	ld c, a
	ld a, [$cd0d]
	ld b, a
	ld a, [$cd0b]
	ld d, a
	push bc
	call Func_40002
	call SetDecompressSource
	ld a, $01
	call Func_1af9
	ld bc, $c0 tiles
	call SetDecompressLength
	pop bc
	ld hl, $1a9d
	add hl, bc
	ld a, [hl]
	call Bankswitch1
	pop hl
	pop de
	pop bc
	pop af
	ret

	db $2e, $2e, $2e, $2e, $2e, $2e, $2f, $2f, $2f, $2f, $2f, $2f, $30, $30, $30, $30, $30, $30

Func_1aaf:
	push af
	push bc
	push de
	push hl

	; prepares lookback buffer
	ld hl, wDecompressLookbackBuffer
	ld de, wDecompressLookbackBuffer + 1
	ld [hl], $20
	ld bc, $3dd
.asm_1abe
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1abe
.asm_1ac4
	ld c, $00
.asm_1ac6
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1ac6
	dec b
	jr nz, .asm_1ac4

	ld a, $80
	ldh [hDecompressBufferSize], a

	ld bc, wDecompressBuffer
	call SetDecompressDestination
	pop hl
	pop de
	pop bc
	pop af
	ret

; input:
; - bc = pointer to compressed data to decompress
SetDecompressSource:
	push af
	ld a, c
	ldh [hDecompressSource + 0], a
	ld a, b
	ldh [hDecompressSource + 1], a
	pop af
	ret

; input:
; - bc = pointer to address where decompressed data
;        should be output
SetDecompressDestination:
	push af
	ld a, c
	ldh [hDecompressDest + 0], a
	ld a, b
	ldh [hDecompressDest + 1], a
	pop af
	ret

; input:
; - bc = length of decompressed data
SetDecompressLength:
	push af
	ld a, c
	ldh [hDecompressLen + 0], a
	ld a, b
	ldh [hDecompressLen + 1], a
	pop af
	ret

Func_1af9:
	ld [$cd0e], a
	ret

Func_1afd:
	push af
	ld a, [$cd0e]
	dec a
	jr nz, .asm_1b09
	call Decompress
	jr .asm_1b0c
.asm_1b09
	call Func_1b0e
.asm_1b0c
	pop af
	ret

Func_1b0e:
	push af
	push bc
	push hl
	ldh a, [hDecompressSource + 0]
	ld l, a
	ldh a, [hDecompressSource + 1]
	ld h, a
	ld c, $0a
.asm_1b19
	call Func_17db
	dec c
	jr nz, .asm_1b19
	pop hl
	pop bc
	pop af
	ret

; compressed data has a simple lookback mechanism
; first a command byte is read, and each bit is iterated
; from least significant to most significant, if the bit:
; - is set, then copy the next byte;
; - is unset, then next 2 bytes encode the lookback address
;   and its length (%ZZZZZZZZ %YYY_XXXXX, where %XXXXX + 3 is the length
;   and %YYYZZZZZZZZ is the offset in wDecompressLookbackBuffer);
Decompress:
	push af
	push bc
	push de
	push hl
	ld de, wDecompressLookbackBuffer + $3de
	ld c, $80
.next_cmd
	call .ReadByte
	ld c, a
	ld b, 8 ; bits
.read_cmd_bit
	rr c
	jr nc, .lookback
; literal copy
	call .ReadByte
	call .WriteByte
	jr c, .done
	ld [de], a
	inc e
	jr nz, .done_literal_copy
	inc d
	ld a, d
	cp HIGH(wDecompressLookbackBufferEnd)
	jr nz, .done_literal_copy
	; wrap back to beginning
	ld d, HIGH(wDecompressLookbackBuffer)
.done_literal_copy
	jr .next_cmd_bit

.lookback
	push bc
	call .ReadByte
	ld l, a
	call .ReadByte
	ld h, a
	and $1f
	add 3
	ld c, a ; length
	ld a, h
	swap a
	rrca
	and $03
	add HIGH(wDecompressLookbackBuffer)
	ld h, a
.loop_lookback
	ld a, [hl]
	call .WriteByte
	jr nc, .asm_1b6d
	; discard push bc
	add sp, $02
	jr .done
.asm_1b6d
	ld [de], a
	inc l
	jr nz, .asm_1b79
	inc h
	ld a, h
	cp HIGH(wDecompressLookbackBufferEnd)
	jr nz, .asm_1b79
	ld h, HIGH(wDecompressLookbackBuffer)
.asm_1b79
	inc e
	jr nz, .asm_1b84
	inc d
	ld a, d
	cp HIGH(wDecompressLookbackBufferEnd)
	jr nz, .asm_1b84
	ld d, HIGH(wDecompressLookbackBuffer)
.asm_1b84
	dec c
	jr nz, .loop_lookback
	pop bc
.next_cmd_bit
	dec b
	jr nz, .read_cmd_bit
	jr .next_cmd

.done
	pop hl
	pop de
	pop bc
	pop af
	ret

.ReadByte:
	push hl
	ldh a, [hDecompressSource + 0]
	add LOW($1)
	ldh [hDecompressSource + 0], a
	ld l, a
	ldh a, [hDecompressSource + 1]
	adc HIGH($1)
	ldh [hDecompressSource + 1], a
	ld h, a
	dec hl
	ld a, [hl]
	pop hl
	ret

.WriteByte:
	push bc
	push de
	push hl

	; write byte to output
	ld d, a
	ldh a, [hDecompressDest + 0]
	add LOW($1)
	ldh [hDecompressDest + 0], a
	ld l, a
	ldh a, [hDecompressDest + 1]
	adc HIGH($1)
	ldh [hDecompressDest + 1], a
	ld h, a
	dec hl
	ld a, d
	ld [hl], a

	ld hl, hDecompressBufferSize
	dec [hl]
	jr nz, .asm_1bcd
	ld [hl], $80
	ld hl, wDecompressBuffer
	ld b, h
	ld c, l
	call Func_17db
	call SetDecompressDestination
.asm_1bcd
	ldh a, [hDecompressLen + 0]
	ld l, a
	ldh a, [hDecompressLen + 1]
	ld h, a
	dec hl
	ld a, l
	ldh [hDecompressLen + 0], a
	ld a, h
	ldh [hDecompressLen + 1], a
	ld a, h
	or l
	jr nz, .asm_1bdf
	scf
.asm_1bdf
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x1be4

SECTION "Home@1c4f", ROM0[$1c4f]

Func_1c4f:
	push af
	ld a, b
	ld [$cdf0], a
	ld a, c
	ld [$cdf1], a
	pop af
	ret

Func_1c5a:
	push af
	ld a, [$cdf0]
	ld b, a
	ld a, [$cdf1]
	ld c, a
	pop af
	ret
; 0x1c65

SECTION "Bank 0@1c7a", ROM0[$1c7a]

Func_1c7a:
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, [$cdf2]
	ld [hli], a
	ld a, [$cdf3]
	ld [hli], a
	ld a, [$cdf4]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_1c92:
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, [hli]
	ld [$cdf2], a
	ld a, [hli]
	ld [$cdf3], a
	ld a, [hli]
	ld [$cdf4], a
	pop hl
	pop bc
	pop af
	ret
; 0x1caa

SECTION "Bank 0@1cb5", ROM0[$1cb5]

Func_1cb5:
	push af
	push hl
	ld b, $00
	ld a, [$cdf1]
	ld c, a
	sla c
	ld hl, $1cdd
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld b, $00
	ld a, [$cdf0]
	ld c, a
	sla c
	ld hl, $1ce5
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	pop af
	ret
; 0x1cdd

SECTION "Bank 0@1cef", ROM0[$1cef]

Func_1cef::
	push de
	ld e, $00
	ld a, b
	cp $01
	jr nz, .asm_1cfd
	ld a, c
	cp $6d
	jr nz, .asm_1cfd
	inc e
.asm_1cfd
	ld a, e
	pop de
	ret

Func_1d00:
	push hl
	ld l, $01
	ld a, b
	cp d
	jr nz, .asm_1d0c
	ld a, c
	cp e
	jr nz, .asm_1d0c
	dec l
.asm_1d0c
	ld a, l
	pop hl
	ret
; 0x1d0f

SECTION "Bank 0@1d67", ROM0[$1d67]

Func_1d67:
	push bc
	push de
	push hl
	ld e, $d0
	ld a, [$cdf2]
	ld c, a
	ld a, [$cdf3]
	ld b, a
	call Func_1cef
	cp $01
	jr nz, .asm_1d7f
	ld e, $d0
	jr .asm_1da2
.asm_1d7f
	call Func_2203
	cp $00
	jr nz, .asm_1d97
	call Func_1daf
	cp $00
	jr nz, .asm_1d92
	ld hl, $1da7
	jr .asm_1d95
.asm_1d92
	ld hl, $1dab
.asm_1d95
	jr .asm_1d9a
.asm_1d97
	ld hl, $1dab
.asm_1d9a
	call Func_21f3
	ld b, $00
	ld c, a
	add hl, bc
	ld e, [hl]
.asm_1da2
	ld a, e
	pop hl
	pop de
	pop bc
	ret
; 0x1da7

SECTION "Bank 0@1daf", ROM0[$1daf]

Func_1daf:
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$cd5c]
	ld c, a
	sla c
	ld hl, $1dcc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_1c5a
	ld b, $00
	add hl, bc
	ld a, [hl]
	pop hl
	pop de
	pop bc
	ret
; 0x1dcc

SECTION "Home@1e65", ROM0[$1e65]

Func_1e65:
	push af
	ld a, [$cdfc]
	or $02
	ld [$cdfc], a
	pop af
	ret
; 0x1e70

SECTION "Home@1fa8", ROM0[$1fa8]

Func_1fa8::
	push af
	ld a, $01
	ld [$ce00], a
	pop af
	ret

Func_1fb0::
	push af
	ld a, $02
	ld [$ce00], a
	pop af
	ret

Func_1fb8::
	push af
	ld a, $03
	ld [$ce00], a
	pop af
	ret

Func_1fc0::
	push af
	ld a, $04
	ld [$ce00], a
	pop af
	ret
; 0x1fc8

SECTION "Home@1fe6", ROM0[$1fe6]

Func_1fe6:
	push af
	push bc
	push hl
	ld hl, $ce17
	ld a, $80
	ld c, $80
.asm_1ff0
	ld [hli], a
	dec c
	jr nz, .asm_1ff0
	xor a
	ld [wce97], a
	ld [wce98], a
	pop hl
	pop bc
	pop af
	ret
; 0x1fff

SECTION "Home@2025", ROM0[$2025]

Func_2025:
	push bc
	push hl
	push af
	ld a, $00
	ld b, a
	ld a, [wce98]
	ld c, a
	inc a
	cp $80
	jr nz, .asm_2035
	xor a
.asm_2035
	ld [wce98], a
	ld hl, $ce17
	add hl, bc
	pop af
	ld [hl], a
	pop hl
	pop bc
	ret
; 0x2041

SECTION "Home@2086", ROM0[$2086]

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
	call AdvanceRNG
	call AdvanceRNG
	call AdvanceRNG
	call AdvanceRNG
	call AdvanceRNG
	pop hl
	pop bc
	pop af
	ret

AdvanceRNG::
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
	ld [wce9f], a
	pop de
	pop bc
	pop af
	ret

Func_2112:
	push af
	push bc
	push de
	ld a, [wce9d]
	ld c, a
	ld a, [wce9e]
	cp c
	jr nz, .asm_2124
	ld [wce9f], a
	jr .done
.asm_2124
	sub c
	ld b, a
	inc b
	call AdvanceRNG
	ld a, [wce9f]
	ld d, a
	call DDividedByB
	ld a, e
	add c
	ld [wce9f], a
.done
	pop de
	pop bc
	pop af
	ret
; 0x213a

SECTION "Bank 0@21f3", ROM0[$21f3]

Func_21f3:
	ld a, [$cdf4]
	and $07
	ret
; 0x21f9

SECTION "Bank 0@2203", ROM0[$2203]

Func_2203:
	ld a, [$cdf4]
	and $08
	jr z, .asm_220c
	ld a, $01
.asm_220c
	ret
; 0x220d

SECTION "Home@2473", ROM0[$2473]

FadeIn::
	push af
	ldh a, [$ffde]
	cp $00
	jr nz, .asm_247f
	call DMGFadeIn
	jr .asm_2482
.asm_247f
	call SetDefaultPalettes
.asm_2482
	pop af
	ret

FadeOut::
	push af
	ldh a, [$ffde]
	cp $00
	jr nz, .asm_2490
	call DMGFadeOut
	jr .asm_2493
.asm_2490
	call SetBlackPalettes
.asm_2493
	pop af
	ret

SetDefaultPalettes:
	push af
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret
; 0x24a0

SECTION "Home@24af", ROM0[$24af]

SetBlackPalettes:
	push af
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

DMGFadeIn:
	push af
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $90
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

DMGFadeOut:
	push af
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $90
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret
; 0x2536

SECTION "Home@2564", ROM0[$2564]

Func_2564::
	push af
	ld a, [wNPCCharacter]
	cp EXODIA
	jr z, .fade_in
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	jr .done
.fade_in
	call Func_257f
.done
	pop af
	ret

Func_257f:
	push af
	push bc

	ld a, $ff
	ldh [rBGP], a
	ld a, $ff
	ldh [rOBP0], a
	ld a, $ff
	ldh [rOBP1], a
	; wait 50 frames
	ld c, 50
.wait_1
	call DoFrame
	dec c
	jr nz, .wait_1

	ld a, $ab
	ldh [rBGP], a
	ld a, $ea
	ldh [rOBP0], a
	ld a, $ab
	ldh [rOBP1], a
	; wait 50 frames
	ld c, 50
.wait_2
	call DoFrame
	dec c
	jr nz, .wait_2

	ld a, $5b
	ldh [rBGP], a
	ld a, $e5
	ldh [rOBP0], a
	ld a, $5b
	ldh [rOBP1], a
	; wait 100 frames
	ld c, 100
.wait_3
	call DoFrame
	dec c
	jr nz, .wait_3

	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	; wait 100 frames
	ld c, 100
.wait_4
	call DoFrame
	dec c
	jr nz, .wait_4

	pop bc
	pop af
	ret
; 0x25d4

SECTION "Home@2666", ROM0[$2666]

Func_2666::
	call Func_2670
	call Func_2774
	call Func_27a9
	ret

Func_2670:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [wce9d], a
	ld a, $63
	ld [wce9e], a
	ld e, $00
.asm_2680
	push de
	ld d, $00
	call Func_2112
	ld a, [wce9f]
	ld e, a
	sla e
	ld hl, $26ac
	add hl, de
	pop de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, e
	farcall Func_c5e8
	farcall Func_c5ec
	farcall Func_5af2
	farcall Func_5b52
	inc e
	ld a, e
	cp $21
	jr nz, .asm_2680
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x26ac

SECTION "Home@2774", ROM0[$2774]

Func_2774:
	push af
	push bc
	push de
	push hl
	ld e, $21
	ld hl, $279b
.asm_277d
	ld a, e
	cp $28
	jr nc, .asm_2796
	ld a, e
	farcall Func_c5e8
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall Func_c5ec
	farcall Func_5af2
	farcall Func_5b52
	inc e
	jr .asm_277d
.asm_2796
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x279b

SECTION "Home@27a9", ROM0[$27a9]

Func_27a9:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [wce9d], a
	ld a, $ff
	ld [wce9e], a
	call Func_2112
	ld a, [wce9f]
	ld e, a
	ld a, $00
	ld [wce9d], a
	ld a, $07
	ld [wce9e], a
	call Func_2112
	ld a, [wce9f]
	ld d, a
	ld a, d
	cp $01
	jr nz, .done
	ld a, e
	cp $03
	jr nz, .asm_27e4
	ld bc, $25
	farcall Func_5af2
	farcall Func_5b04
	jr .done
.asm_27e4
	ld a, e
	cp $0e
	jr nz, .done
	ld bc, $22
	farcall Func_5af2
	farcall Func_5b04
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_27f7::
	push af
	push bc
	push de
	push hl
	xor a
	ld hl, $cf4e
	ld de, $2823
	ld c, $11
.asm_2804
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2804
	ld hl, $cf70
	ld de, $2845
	ld c, $11
.asm_2815
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2815
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2823

SECTION "Home@29f1", ROM0[$29f1]

Func_29f1:
	push af
	push bc
	push de
	push hl
	farcall Func_f8076
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_29fd::
	push af
	ld a, $00
	call Func_29f1
	call Func_f74
	pop af
	ret

Func_2a08::
	push af
	ld a, $01
	call Func_29f1
	call Func_f74
	pop af
	ret

SECTION "Bank 0@2a3f", ROM0[$2a3f]

Func_2a3f::
	push af
	ld a, $07
	call Func_29f1
	call Func_f74
	pop af
	ret
; 0x2a4a

SECTION "Bank 0@2aef", ROM0[$2aef]

Func_2aef:
	push af
	ld a, $98
	call Func_29f1
	call Func_f74
	pop af
	ret
; 0x2afa

SECTION "Home@2b26", ROM0[$2b26]

Func_2b26::
	push af
	ld a, $9d
	call Func_29f1
	call Func_f74
	pop af
	ret
; 0x2b31

SECTION "Bank 0@2b7e", ROM0[$2b7e]

Func_2b7e::
	push af
	ld a, $a1
	call Func_29f1
	call Func_f74
	pop af
	ret
; 0x2b89

SECTION "Home@2d1f", ROM0[$2d1f]

Func_2d1f:
	ld a, $08
	ld [$cfef], a
	call Func_2d2e
	xor a
	ld [$cfef], a
	jp Func_f4002

Func_2d2e:
	di
	bankswitch BANK(Func_f8076)
	ei
	ld a, [$cfef]
	call Func_f8076

	di
	bankswitch BANK(Func_f4002)
	ei
	ret

Func_2d57:
	call Func_f6e5d
	bankswitch BANK(Func_f811a)
	call Func_f811a
	di
	bankswitch $3d
	ei
	ld a, $01
	ld [$cfe2], a
	pop de
	pop bc
	pop hl
	pop af
	reti
; 0x2d87
