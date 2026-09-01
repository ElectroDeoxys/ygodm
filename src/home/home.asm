_Start:
	ldh [$ffdd], a
	ld hl, $e000
	ld sp, hl
	call Func_1090
	farcall Func_10477
	ld a, $00
	farcall Func_fc004
	farcall InitAudio
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

SECTION "Bank 0@301", ROM0[$301]

Func_301:
	ld [$caa1], a
	ret

Func_305::
	push af
	push hl
	ld a, $10
	ld [$caa4], a
	ld a, $02
	call Func_301
	ld a, $01
	ldh [rSC], a
	pop hl
	pop af
	ret

Func_318::
	push af
	ld a, $20
	ld [$caa4], a
	ld a, $04
	call Func_301
	ld a, $00
	ldh [rSC], a
	pop af
	ret
; 0x329

SECTION "Bank 0@357", ROM0[$357]

Func_357:
	push af
	push hl
	di
	ld hl, rSC
	call Func_36a
	ld [hl], $01
	ldh [rSB], a
	set 7, [hl]
	ei
	pop hl
	pop af
	ret

Func_36a:
	push af
	push hl
	ld hl, rSC
.asm_36f
	bit 7, [hl]
	jr nz, .asm_36f
	pop hl
	pop af
	ret

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

Func_37f:
	push af
	push hl
	push af
	di
	xor a
	ld [$caa0], a
	ld a, $00
	ldh [rSC], a
	pop af
	ldh [rSB], a
	ld a, $80
	ldh [rSC], a
	ei
	pop hl
	pop af
	ret

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
	dw .VBlank00  ; VBLANK_00
	dw .VBlank02  ; VBLANK_02
	dw .VBlank04  ; VBLANK_04
	dw .VBlank06  ; VBLANK_06
	dw .VBlank08  ; VBLANK_08
	dw .VBlank0A  ; VBLANK_0A
	dw .VBlank0C  ; VBLANK_0C
	dw .VBlank0E  ; VBLANK_0E
	dw .VBlank10  ; VBLANK_10
	dw .VBlank12  ; VBLANK_12
	dw .VBlank14  ; VBLANK_14
	dw VBlank16 ; VBLANK_16

.VBlank00:
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank02:
	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank04:
	call hTransferVirtualOAM
	ld a, VBLANK_00
	ld [wVBlankMode], a
	ld a, $01
	ld [wcaa9], a
	call ReadJoypad
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank06:
	call hTransferVirtualOAM

	ld bc, wVBlankStruct
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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank08:
	call hTransferVirtualOAM
	ld bc, wVBlankStruct
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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank0A:
	call hTransferVirtualOAM

	ld bc, wVBlankStruct
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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank0C:
	call hTransferVirtualOAM

	ld bc, wVBlankStruct
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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank0E:
	call hTransferVirtualOAM

	ld bc, wVBlankStruct
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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank10:
	call hTransferVirtualOAM
	ld bc, wVBlankStruct

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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank12:
	call hTransferVirtualOAM

	ld bc, wVBlankStruct
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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
	pop de
	pop bc
	pop hl
	pop af
	reti

.VBlank14:
	ld bc, wVBlankStruct

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
	ld c, LOW(hVBlankJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, LOW(hAudioJobFlags)
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call ActivateJob
	db JOB_MAIN
	call ActivateJob
	db JOB_AUDIO
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
	call_hl
	ld a, $00
	ld [wVBlankStructSize], a
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw .VBlank00 ; VBLANK_00
	dw .VBlank02 ; VBLANK_02
	dw .VBlank04 ; VBLANK_04
	dw .VBlank06 ; VBLANK_06
	dw .VBlank08 ; VBLANK_08
	dw .VBlank0A ; VBLANK_0A
	dw .VBlank0C ; VBLANK_0C
	dw .VBlank0E ; VBLANK_0E
	dw .VBlank10 ; VBLANK_10
	dw .VBlank12 ; VBLANK_12
	dw .VBlank14 ; VBLANK_14
	dw .VBlank16 ; VBLANK_16

.VBlank00:
.VBlank02:
.VBlank04:
	ret

.VBlank06:
	push af
	push hl
	ld hl, wVBlankStruct
	ld a, $02
	ld [hli], a
	ld [hl], $c5

	; bug, should be ld hl instead
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

.VBlank08:
	ret

.VBlank0A:
	push af
	push hl
	ld hl, wVBlankStruct
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.VBlank0C:
	push af
	push hl
	ld hl, wVBlankStruct
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

.VBlank0E:
	push af
	push hl
	ld hl, wVBlankStruct
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

.VBlank10:
	push af
	push hl
	ld hl, wVBlankStruct
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

.VBlank12:
	push af
	push hl
	ld hl, wVBlankStruct
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

.VBlank14:
	push af
	push hl
	ld hl, wVBlankStruct
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

.VBlank16:
	ret

RequestVBlankMode::
	push af
	ld a, [wPendingVBlankMode]
	ld [wVBlankMode], a
	ld a, VBLANK_00
	ld [wPendingVBlankMode], a
	pop af
	ret

AddWordToVBlankStruct::
	push af
	push hl
	ld h, HIGH(wVBlankStruct)
	ld a, [wVBlankStructSize]
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, l
	ld [wVBlankStructSize], a
	pop hl
	pop af
	ret

AddByteToVBlankStruct::
	push af
	push hl
	push af
	ld h, HIGH(wVBlankStruct)
	ld a, [wVBlankStructSize]
	ld l, a
	pop af
	ld [hli], a
	ld a, l
	ld [wVBlankStructSize], a
	pop hl
	pop af
	ret

Func_f62::
	push af
	push hl
	ld h, HIGH(wVBlankStruct)
	ld a, [wVBlankStructSize]
	ld l, a
	call Func_17ab
	ld a, l
	ld [wVBlankStructSize], a
	pop hl
	pop af
	ret

WaitForVBlank::
	push af
	call ResetJobFlag
	db $80, LOW(hVBlankJobFlags)
.asm_f7a
	call YieldJob
	call TestJobFlag
	db $80, LOW(hVBlankJobFlags)
	jr z, .asm_f7a
	pop af
	ret

Func_f86::
	push bc
	ld c, $0a
.asm_f89
	call WaitForVBlank
	dec c
	jr nz, .asm_f89
	pop bc
	ret

Func_f91:
	push af
	push hl
	xor a
	ld [$caad], a
	ld [$caae], a
	ld [$caaf], a
.asm_f9d
	call Func_fb1
	cp $01
	jr z, .asm_faa
	ld a, [$caa0]
	or a
	jr z, .asm_f9d
.asm_faa
	xor a
	ld [$caa0], a
	pop hl
	pop af
	ret

Func_fb1:
	ld a, [$caad]
	add $01
	ld [$caad], a
	ld a, [$caae]
	adc $00
	ld [$caae], a
	cp $ff
	jr nz, .asm_fcc
	call Func_1e65
	ld a, $01
	jr .asm_fcd
.asm_fcc
	xor a
.asm_fcd
	ret

AudioJob:
.loop
	ld a, [rRAMB]
	push af
	ld a, BANK(UpdateAudio)
	call Bankswitch1
	call UpdateAudio
	pop af
	call Bankswitch1
	call ResetJobFlag
	db $80, LOW(hAudioJobFlags)
.wait
	call YieldJob
	call TestJobFlag
	db $80, LOW(hAudioJobFlags)
	jr z, .wait
	jr .loop
; 0xfef

SECTION "Bank 0@ff0", ROM0[$ff0]

Func_ff0::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $1b
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_fff::
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

Func_102c::
	push af
	ld a, $e0
	ldh [rOBP0], a
	pop af
	ret

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

EnableObjects::
	push hl
	ld hl, rLCDC
	set B_LCDC_OBJS, [hl]
	pop hl
	ret
; 0x110c

SECTION "Home@1114", ROM0[$1114]

Func_1114::
	push af
	ld a, $01
	ld [$cace], a
	pop af
	ret

Func_111c::
	push af
	ld a, $00
	ld [$cace], a
	pop af
	ret

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

Func_1134::
	push af
	ld a, $05
	ld [$cace], a
	pop af
	ret

Func_113c::
	push af
	ld a, $04
	ld [$cace], a
	pop af
	ret

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

Func_1256::
	push af
	push bc
	push de
	push hl
	ld a, $b0
	ld [$cd1c], a
	ld a, $b0
	ld [$cd1b], a
	ld hl, $ca02
	ld a, $00
	ld de, $3
	ld bc, $228
.asm_126f
	ld [hli], a
	add b
	ld [hl], $00
	add hl, de
	dec c
	jr nz, .asm_126f
	call Func_12a4
	call Func_1225
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1282::
	call Func_1289
	call Func_12a4
	ret

Func_1289:
	push af
	push bc
	ld a, [$cd1d]
	ld b, a
	ld a, [$cd1b]
	add b
	ld [$cd1b], a
	ld a, [$cd1e]
	ld b, a
	ld a, [$cd1c]
	add b
	ld [$cd1c], a
	pop bc
	pop af
	ret

Func_12a4:
	push af
	push bc
	push de
	push hl
	ld hl, wVirtualOAM
	ld d, $00
	ld b, $05
.asm_12af
	ld e, $00
	ld c, $08
.asm_12b3
	ld a, [$cd1b]
	add d
	ld [hli], a
	ld a, [$cd1c]
	add e
	ld [hli], a
	inc hl
	inc hl
	ld a, $08
	add e
	ld e, a
	dec c
	jr nz, .asm_12b3
	ld a, $10
	add d
	ld d, a
	dec b
	jr nz, .asm_12af
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_12d2::
	call ClearOAM
	call Func_1225
	ret

Func_12d9::
	push af
	push hl
	push de
	ld d, $00
	ld hl, wVirtualOAM
	add hl, de
	pop de

	ld a, c
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	ld a, d
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes

	ld a, c
	ld [hli], a ; y
	ld a, b
	add 8
	ld [hli], a ; x
	ld a, d
	add 2
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes

	pop hl
	pop af
	ret

Func_12fb::
	call ClearOAM
	call Func_1225
	ret

Add4x4OAM::
	push af
	push hl
	push de
	ld d, $00
	sla e
	sla e
	ld hl, wVirtualOAM
	add hl, de
	pop de

	ld a, c
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	ld a, d
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes

	ld a, c
	ld [hli], a ; y
	ld a, b
	add 8
	ld [hli], a ; x
	ld a, d
	add 2
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes

	pop hl
	pop af
	ret

Func_1328::
	call ClearOAM
	ret

Func_132c::
	push af
	push hl
	push de
	ld d, $00
	dec e
	sla e
	sla e
	ld hl, wVirtualOAM
	add hl, de
	pop de
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $00
	ld [hli], a
	pop hl
	pop af
	ret

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

SECTION "Bank 0@13bb", ROM0[$13bb]

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
	ld e, $01
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

	; de >= bc
	ld e, $02
	jr nc, .done

	; de < bc
	ld e, $00

.done
	pop af
	ret

Func_13db::
	push af
	push bc
	push hl
	ld a, [$cadc]
	ld b, a
	ld a, [$cadd]
	ld c, a
	ld a, [$cade]
	ld d, a
	ld a, [$cadf]
	cp b
	jr nz, .asm_140a
	ld a, [$cae0]
	cp c
	jr nz, .asm_140a
	ld a, [$cae1]
	cp d
	jr nz, .asm_140a
	xor a
	ld [$cadc], a
	ld [$cadd], a
	ld [$cade], a
	ld e, $01
	jr .asm_1428
.asm_140a
	ld a, [$cadf]
	sub b
	daa
	ld [$cadc], a
	ld a, [$cae0]
	sbc c
	daa
	ld [$cadd], a
	ld a, [$cae1]
	sbc d
	daa
	ld [$cade], a
	ld e, $02
	jr nc, .asm_1428
	ld e, $00
.asm_1428
	pop hl
	pop bc
	pop af
	ret

Func_142c::
	push af
	push de
	push hl
	ld b, $00
	ld a, [$cadc]
	and $0f
	ld c, a
	sla c
	ld hl, $1484
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [$cadc]
	and $f0
	ld c, a
	swap c
	sla c
	ld hl, $14a4
	add hl, bc
	ld a, [hli]
	add e
	daa
	ld e, a
	ld a, [hl]
	adc d
	daa
	ld d, a
	ld a, [$cadd]
	and $0f
	ld c, a
	sla c
	ld hl, $14c4
	add hl, bc
	ld a, [hli]
	add e
	daa
	ld e, a
	ld a, [hl]
	adc d
	daa
	ld d, a
	ld a, [$cadd]
	and $f0
	ld c, a
	swap c
	sla c
	ld hl, $14e4
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
; 0x1484

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

Func_1508::
	push af
	push bc
	push hl
	push bc
	ld hl, $cab9
	xor a
	ld c, $08
.asm_1512
	ld [hli], a
	dec c
	jr nz, .asm_1512
	pop bc
	call IsCardInvalid
	cp $00
	jr nz, .asm_153e
	ld a, $04
	farcall Func_42d0
	farcall Func_42c5
	farcall Func_42ec
	farcall Func_5af2
	farcall GetCardCountInCollection
	cp $ff
	jr nz, .asm_153e
	ld hl, $cab9
	ld a, $73
	ld c, $08
.asm_153a
	ld [hli], a
	dec c
	jr nz, .asm_153a
.asm_153e
	pop hl
	pop bc
	pop af
	ret
; 0x1542

SECTION "Home@1576", ROM0[$1576]

Func_1576::
	push af
	push hl
	call Func_179b
	call Func_172f
	call InitJobs
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

InitJobs:
	push af
	push bc
	push hl
	ld hl, JobFunctionsAndStack
	lb bc, $3, LOW(hAudioJobStackPointer)
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

InitialJobStates:
	db JOBSTATE_RUNNING
	db JOBSTATE_ACTIVE
	db JOBSTATE_ACTIVE
	db JOBSTATE_ACTIVE

; arguments:
; - \1 = job function
; - \2 = bottom of stack
MACRO? job_func
	dw \2 - $8 ; to preserve registers
	db BANK(\1)
	dw \2
	dw \1
ENDM

JobFunctionsAndStack:
	job_func AudioJob,      wAudioJobStackBottom
	job_func DecompressJob, wDecompressJobStackBottom
	job_func Func_172c,     wJob4StackBottom

JobTimerConfigurations:
	db 240, TAC_4KHZ   | TAC_STOP, TAC_4KHZ   | TAC_START ; JOB_MAIN
	db 100, TAC_4KHZ   | TAC_STOP, TAC_4KHZ   | TAC_START ; JOB_AUDIO
	db 225, TAC_4KHZ   | TAC_STOP, TAC_4KHZ   | TAC_START ; JOB_DECOMPRESS
	db 240, TAC_262KHZ | TAC_STOP, TAC_262KHZ | TAC_START ; JOB_4

Func_15e9:
	push af
	push bc
	push hl
	ld c, LOW(hJobStates)
	ld hl, InitialJobStates
	ld b, NUM_JOBS
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ld a, JOB_MAIN
	ldh [hCurJob], a
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
	ldh a, [hCurJob]
	ld c, a
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	ld a, JOBSTATE_ACTIVE
	ld [$ff00+c], a
.asm_162f
	inc c
	ld a, c
	cp JOB_4 + 1
	jr nz, .got_job
	ld c, JOB_MAIN
.got_job
	ld a, [$ff00+c]
	cp JOBSTATE_ACTIVE
	jr nz, .asm_162f
	ld a, c
	ldh [hCurJob], a
	ld a, JOBSTATE_RUNNING
	ld [$ff00+c], a
	ld a, LOW(hJobStackPointers)
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
	ldh a, [hCurJob]
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	add LOW(hJobStackPointers)
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
	ld hl, JobTimerConfigurations
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

YieldJob::
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	di
	ldh a, [hCurJob]
	ld c, a
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	ld a, JOBSTATE_INACTIVE
	ld [$ff00+c], a
.asm_16a5
	inc c
	ld a, c
	cp JOB_4 + 1
	jr nz, .got_job
	ld c, JOB_MAIN
.got_job
	ld a, [$ff00+c]
	cp JOBSTATE_ACTIVE
	jr nz, .asm_16a5
	ld a, c
	ldh [hCurJob], a
	ld a, JOBSTATE_RUNNING
	ld [$ff00+c], a

	; save current stack pointer and bank
	ld a, LOW(hJobStackPointers)
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

	ldh a, [hCurJob]
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	add LOW(hJobStackPointers)
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
	ld hl, JobTimerConfigurations
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

ActivateJob::
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
	ld a, JOBSTATE_ACTIVE
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
	ld c, LOW(hVBlankJobFlags)
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

SetJobFlag::
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

TestJobFlag::
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

ResetJobFlag::
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
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_DECOMPRESS
	call YieldJob
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
	call SetJobFlag
	db $04, LOW(hVBlankJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_MAIN
	call YieldJob
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
	call SetJobFlag
	db $04, LOW(hVBlankJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_MAIN
	call YieldJob
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
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_DECOMPRESS
	call YieldJob
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
	call_hl
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

SECTION "Bank 0@1c0a", ROM0[$1c0a]

Func_1c0a::
	push af
	ld a, $b0
	ld [$cd1c], a
	pop af
	ret

Func_1c12::
	push af
	ld a, b
	ld [$cd1e], a
	ld a, c
	ld [$cd1d], a
	pop af
	ret

Func_1c1d::
	push af
	ld a, b
	ld [$cd1c], a
	ld a, c
	ld [$cd1b], a
	pop af
	ret

Func_1c28::
	push af
	push bc
	push hl
	ld a, $00
	ld [wCardLocationIndex], a
	ld a, CARD_LOCATION_OPP_HAND
	ld [wCardLocation], a
	ld hl, wOppHand
	ld b, $04
.asm_1c3a
	ASSERT HAND_SIZE == FIELD_SIZE
	ld c, HAND_SIZE ; aka FIELD_SIZE
.asm_1c3c
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld a, HIGH(INVALID_CARD)
	ld [hli], a
	ld a, $10
	ld [hli], a
	dec c
	jr nz, .asm_1c3c
	dec b
	jr nz, .asm_1c3a
	pop hl
	pop bc
	pop af
	ret

; input:
; - b = card location index
; - c = CARD_LOCATION_* constant
SetCardLocationAndIndex::
	push af
	ld a, b
	ld [wCardLocationIndex], a
	ld a, c
	ld [wCardLocation], a
	pop af
	ret

; output:
; - b = card location index
; - c = CARD_LOCATION_* constant
GetCardLocationAndIndex::
	push af
	ld a, [wCardLocationIndex]
	ld b, a
	ld a, [wCardLocation]
	ld c, a
	pop af
	ret

Func_1c65::
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, $6d
	ld [hli], a
	ld a, $01
	ld [hli], a
	ld a, $10
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_1c7a::
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, [wTempCardID + 0]
	ld [hli], a
	ld a, [wTempCardID + 1]
	ld [hli], a
	ld a, [$cdf4]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_1c92::
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, [hli]
	ld [wTempCardID + 0], a
	ld a, [hli]
	ld [wTempCardID + 1], a
	ld a, [hli]
	ld [$cdf4], a
	pop hl
	pop bc
	pop af
	ret

Func_1caa::
	push af
	push bc
	farcall Func_24024
	call Func_1c7a
	pop bc
	pop af
	ret

; outputs in bc pointer to card that
; corresponds to wCardLocation and wCardLocationIndex
Func_1cb5:
	push af
	push hl
	ld b, $00
	ld a, [wCardLocation]
	ld c, a
	sla c
	ld hl, .CardLocationAddresses
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld b, $00
	ld a, [wCardLocationIndex]
	ld c, a
	sla c
	ld hl, .CardLocationIndices
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

.CardLocationAddresses:
	dw wOppHand     ; CARD_LOCATION_OPP_HAND
	dw wOppField    ; CARD_LOCATION_OPP_FIELD
	dw wPlayerField ; CARD_LOCATION_PLAYER_FIELD
	dw wPlayerHand  ; CARD_LOCATION_PLAYER_HAND

.CardLocationIndices:
	dw 0 * $3 ; $0
	dw 1 * $3 ; $1
	dw 2 * $3 ; $2
	dw 3 * $3 ; $3
	dw 4 * $3 ; $4

; returns TRUE if card ID in bc is invalid
IsCardInvalid::
	push de
	ld e, FALSE
	ld a, b
	cp HIGH(INVALID_CARD)
	jr nz, .false
	ld a, c
	cp LOW(INVALID_CARD)
	jr nz, .false
; true
	inc e
.false
	ld a, e
	pop de
	ret

; returns TRUE if bc and de are different
; FALSE if they are equal
CompareBCAndDE::
	push hl
	ld l, TRUE
	ld a, b
	cp d
	jr nz, .not_equal
	ld a, c
	cp e
	jr nz, .not_equal
	dec l
.not_equal
	ld a, l
	pop hl
	ret

; input:
; - bc = ?
; - de = ?
; output:
; - a = $00 if de  < bc
; -     $01 if de == bc
; -     $02 if de >= bc
Func_1d0f::
	push bc
	push de
	push hl
	ld l, $02
	call Func_13bb

	; the following can be replaced
	; with a simple ld a, e
	ld a, e
	cp $01
	jr nz, .asm_1d1e
; were equal
	ld l, $01
.asm_1d1e
	ld a, e
	cp $00
	jr nz, .asm_1d25
	ld l, $00
.asm_1d25
	ld a, l
	pop hl
	pop de
	pop bc
	ret

Func_1d2a::
	push de
	push hl
	ld l, $02
	ld a, [$cdf5]
	ld [$cadc], a
	ld a, [$cdf6]
	ld [$cadd], a
	ld a, [$cdf7]
	ld [$cade], a
	ld a, [$cdf8]
	ld [$cadf], a
	ld a, [$cdf9]
	ld [$cae0], a
	ld a, [$cdfa]
	ld [$cae1], a
	call Func_13db
	ld a, e
	cp $01
	jr nz, .asm_1d5c
	ld l, $01
.asm_1d5c
	ld a, e
	cp $00
	jr nz, .asm_1d63
	ld l, $00
.asm_1d63
	ld a, l
	pop hl
	pop de
	ret

Func_1d67::
	push bc
	push de
	push hl
	ld e, $d0
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsCardInvalid
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
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetCardLocationAndIndex
	ld b, $00
	add hl, bc
	ld a, [hl]
	pop hl
	pop de
	pop bc
	ret

.PtrTable:
	dw .Data_1dd6
	dw .Data_1dda
	dw .Data_1dde
	dw .Data_1de2
	dw .Data_1de6

.Data_1dd6:
	db $01
	db $01
	db $01
	db $00

.Data_1dda:
	db $01
	db $01
	db $01
	db $00

.Data_1dde:
	db $01
	db $01
	db $00
	db $01

.Data_1de2:
	db $01
	db $01
	db $00
	db $01

.Data_1de6:
	db $01
	db $00
	db $01
	db $01

Func_1dea:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [$caa2], a
	ld a, $00
	ld [$cdfb], a
	call Func_207c
	ld de, $fefe
.asm_1dfe
	ld a, [$caa4]
	cp $10
	jr nz, .asm_1e22
	ld a, $30
	call Func_357
	call WaitForVBlank
	ld a, [$caa2]
	and $f0
	cp $40
	jr nz, .asm_1e20
	call Func_1e48
	ld a, $01
	ld [$cdfb], a
	jr .asm_1e43
.asm_1e20
	jr .asm_1e31
.asm_1e22
	ld a, $40
	call Func_37f
	ld a, $01
	ld [$cdfb], a
	call Func_f91
	jr .asm_1e43
.asm_1e31
	dec e
	jr nz, .asm_1e41
	dec d
	ld a, d
	cp $ff
	jr nz, .asm_1e41
	ld a, $02
	ld [$cdfb], a
	jr .asm_1e43
.asm_1e41
	jr .asm_1dfe
.asm_1e43
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1e48:
	push af
	push bc
	ld c, $03
.asm_1e4c
	call WaitForVBlank
	dec c
	jr nz, .asm_1e4c
	pop bc
	pop af
	ret

Func_1e55:
	push af
	xor a
	ld [$caad], a
	ld [$caae], a
	ld [$caaf], a
	ld [$cdfc], a
	pop af
	ret

Func_1e65:
	push af
	ld a, [$cdfc]
	or $02
	ld [$cdfc], a
	pop af
	ret

Func_1e70::
	push af
	call Func_1fc8
	ld a, [$caa4]
	cp $10
	jr nz, .asm_1e80
	call Func_1e88
	jr .asm_1e83
.asm_1e80
	call Func_1ed5
.asm_1e83
	call Func_1fd7
	pop af
	ret

Func_1e88:
	push af
	push bc
.asm_1e8a
	xor a
	ld [$cdfc], a
	call Func_1dea
	ld a, [$cdfb]
	cp $02
	jr z, .asm_1e8a
	call Func_207c
	call Func_1e55
	ld c, $7f
.asm_1ea0
	call Func_2062
	call Func_357
	call WaitForVBlank
	call Func_1f1b
	ld a, [$cdfc]
	and $02
	jr nz, .asm_1eb6
	dec c
	jr nz, .asm_1ea0
.asm_1eb6
	ld a, [$cdfc]
	and $02
	jr nz, .asm_1e8a
	call Func_1e48
	ld a, $50
	call Func_357
	call Func_1e48
	call Func_1f43
	ld a, [$cdfc]
	and $02
	jr nz, .asm_1e8a
	pop bc
	pop af
	ret

Func_1ed5:
	push af
	push bc
.asm_1ed7
	xor a
	ld [$cdfc], a
	call Func_1dea
	ld a, [$cdfb]
	cp $02
	jr z, .asm_1ed7
	call Func_207c
	call Func_1e55
	ld a, $90
	ld [$caa3], a
	ld c, $7f
.asm_1ef2
	ld a, [$cdfc]
	cp $00
	jr nz, .asm_1eff
	call Func_f91
	dec c
	jr nz, .asm_1ef2
.asm_1eff
	ld a, [$cdfc]
	and $02
	jr nz, .asm_1ed7
	ld a, $60
	call Func_37f
	call Func_f91
	call Func_1f2a
	ld a, [$cdfc]
	and $04
	jr z, .asm_1ed7
	pop bc
	pop af
	ret

Func_1f1b:
	push af
	ld a, [$caa2]
	and $f0
	cp $90
	jr z, .asm_1f28
	call Func_1e65
.asm_1f28
	pop af
	ret

Func_1f2a:
	push af
	ld a, [$caa2]
	and $f0
	cp $50
	jr z, .asm_1f39
	call Func_1e65
	jr .asm_1f41
.asm_1f39
	ld a, [$cdfc]
	or $04
	ld [$cdfc], a
.asm_1f41
	pop af
	ret

Func_1f43:
	push af
	ld a, [$caa2]
	and $f0
	cp $60
	jr z, .asm_1f50
	call Func_1e65
.asm_1f50
	pop af
	ret
; 0x1f52

SECTION "Home@1f57", ROM0[$1f57]

Func_1f57::
	push af
	ld a, $00
	ld [$cdff], a
	pop af
	ret

Func_1f5f::
	push af
	ld a, [$caa4]
	cp $10
	jr nz, .asm_1f6c
	call Func_1f71
	jr .asm_1f6f
.asm_1f6c
	call Func_1f79
.asm_1f6f
	pop af
	ret

Func_1f71:
	push af
	ld a, $01
	ld [$cdff], a
	pop af
	ret

Func_1f79:
	push af
	ld a, $02
	ld [$cdff], a
	pop af
	ret

Func_1f81::
	push af
	ld a, [$cdff]
	cp $01
	jr nz, .asm_1f93
	ld a, $02
	ld [$cdff], a
	call Func_318
	jr .asm_1f9e
.asm_1f93
	ld a, $01
	ld [$cdff], a
	call Func_305
	call Func_1e48
.asm_1f9e
	pop af
	ret
; 0x1fa0

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

Func_1fc8:
	push hl
	di
	ld hl, rIF
	res B_IF_SERIAL, [hl]
	ld hl, rIE
	set B_IF_SERIAL, [hl]
	ei
	pop hl
	ret

Func_1fd7:
	push hl
	di
	ld hl, rIF
	res B_IF_SERIAL, [hl]
	ld hl, rIE
	res B_IF_SERIAL, [hl]
	ei
	pop hl
	ret
; 0x1fe6

SECTION "Home@1fe6", ROM0[$1fe6]

Func_1fe6::
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

SECTION "Bank 0@200e", ROM0[$200e]

Func_200e::
	push af
	push bc
	ld c, a
	swap a
	and $0f
	or $80
	call Func_2025
	ld a, c
	and $0f
	or $80
	call Func_2025
	pop bc
	pop af
	ret

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

SECTION "Bank 0@2051", ROM0[$2051]

Func_2051::
	push bc
	call Func_2062
	and $0f
	ld c, a
	swap c
	call Func_2062
	and $0f
	or c
	pop bc
	ret

Func_2062:
	push bc
	push hl
	ld a, $00
	ld b, a
	ld a, [wce97]
	ld c, a
	inc a
	cp $80
	jr nz, .asm_2071
	xor a
.asm_2071
	ld [wce97], a
	ld hl, $ce17
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_207c::
	push af
	xor a
	ld [wce97], a
	ld [wce98], a
	pop af
	ret

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
; 0x213a

SECTION "Bank 0@217e", ROM0[$217e]

Func_217e::
	push af
	ld a, [$cdf4]
	and $cf
	or $10
	ld [$cdf4], a
	pop af
	ret

Func_218b::
	ld a, [$cdf4]
	and $30
	swap a
	ret

Func_2193::
	push af
	ld a, [$cdf4]
	or $40
	ld [$cdf4], a
	pop af
	ret

Func_219e::
	push af
	ld a, [$cdf4]
	and $bf
	ld [$cdf4], a
	pop af
	ret

Func_21a9::
	push af
	ld a, [$cdf4]
	or $08
	ld [$cdf4], a
	pop af
	ret

Func_21b4::
	push af
	ld a, [$cdf4]
	and $f7
	ld [$cdf4], a
	pop af
	ret
; 0x21bf

SECTION "Bank 0@21cc", ROM0[$21cc]

Func_21cc::
	push af
	ld a, [$cdf4]
	and $f8
	or $01
	ld [$cdf4], a
	pop af
	ret

Func_21d9::
	push af
	ld a, [$cdf4]
	and $f8
	or $02
	ld [$cdf4], a
	pop af
	ret

Func_21e6::
	push af
	ld a, [$cdf4]
	and $f8
	or $03
	ld [$cdf4], a
	pop af
	ret

Func_21f3::
	ld a, [$cdf4]
	and $07
	ret

Func_21f9::
	ld a, [$cdf4]
	and $40
	jr z, .asm_2202
	ld a, $01
.asm_2202
	ret

Func_2203::
	ld a, [$cdf4]
	and $08
	jr z, .asm_220c
	ld a, $01
.asm_220c
	ret
; 0x220d

SECTION "Bank 0@2217", ROM0[$2217]

Func_2217::
	push af
	xor a
	ld [$ced1], a
	ld [$ced2], a
	ld [$ced3], a
	ld [$ced4], a
	ld [$ced5], a
	ld [$ced6], a
	ld [$ced7], a
	ld [$ced8], a
	ld [$ced9], a
	ld [$ceda], a
	ld [$cedb], a
	ld [$cedc], a
	ld [$cedd], a
	ld [$cede], a
	ld [$cedf], a
	ld [$cee0], a
	ld [$cee1], a
	ld [$cee2], a
	ld [$cee3], a
	ld [$cee4], a
	ld [$cee5], a
	ld [$cee6], a
	pop af
	ret
; 0x225d

SECTION "Bank 0@2344", ROM0[$2344]

Func_2344::
	push af
	add $09
	ld [$ceef], a
	pop af
	ret
; 0x234c

SECTION "Bank 0@2364", ROM0[$2364]

Func_2364:
	push bc
	push hl
	ld b, $00
	ld a, [$ceef]
	ld c, a
	ld hl, $2374
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x2374

SECTION "Bank 0@2384", ROM0[$2384]

Func_2384::
	push af
	ld a, $00
	ld [$cf02], a
	ld a, $00
	ld [$cf03], a
	pop af
	ret

Func_2391::
	push af
	ld a, [$cf02]
	cp $00
	jr nz, .asm_239e
	ld a, $01
	ld [$cf02], a
.asm_239e
	pop af
	ret

Func_23a0::
	push af
	ld a, $02
	ld [$cf02], a
	pop af
	ret

Func_23a8::
	push af
	ld a, $03
	ld [$cf02], a
	pop af
	ret

Func_23b0::
	push bc
	ld a, [$ce00]
	cp $01
	jr nz, .asm_23ce
	ld c, $00
	ld a, [$cf02]
	cp $02
	jr nz, .asm_23c3
	ld c, $01
.asm_23c3
	ld a, [$cf02]
	cp $03
	jr nz, .asm_23cc
	ld c, $01
.asm_23cc
	jr .asm_23f4
.asm_23ce
	ld c, $00
	ld a, [$cf02]
	cp $02
	jr nz, .asm_23d9
	ld c, $01
.asm_23d9
	ld a, [$cf02]
	cp $03
	jr nz, .asm_23e2
	ld c, $01
.asm_23e2
	ld a, [$cf03]
	cp $02
	jr nz, .asm_23eb
	ld c, $01
.asm_23eb
	ld a, [$cf03]
	cp $03
	jr nz, .asm_23f4
	ld c, $01
.asm_23f4
	ld a, c
	pop bc
	ret

Func_23f7::
	ld a, [$ce00]
	cp $01
	jr nz, .asm_240c
	ld a, [$cf02]
	cp $02
	jr nz, .asm_2408
	xor a
	jr .asm_240a
.asm_2408
	ld a, $01
.asm_240a
	jr .asm_2434
.asm_240c
	ld a, [$cf02]
	cp $03
	jr nz, .asm_2417
	ld a, $01
	jr .asm_2434
.asm_2417
	ld a, [$cf02]
	cp $02
	jr nz, .asm_2421
	xor a
	jr .asm_2434
.asm_2421
	ld a, [$cf03]
	cp $03
	jr nz, .asm_242b
	xor a
	jr .asm_2434
.asm_242b
	ld a, [$cf03]
	cp $03
	jr nz, .asm_2434
	ld a, $01
.asm_2434
	ret
; 0x2435

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

Func_2536::
	push af
	ld a, $90
	ldh [rOBP0], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rOBP0], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $00
	ldh [rOBP0], a
	call DoFrame
	pop af
	ret

Func_255a::
	push af
	ld a, $e0
	ldh [rOBP0], a
	call DoFrame
	pop af
	ret

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

Func_25d4::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	ld c, $32
.asm_25e3
	call DoFrame
	dec c
	jr nz, .asm_25e3
	ld a, $06
	ldh [rBGP], a
	ld a, $90
	ldh [rOBP0], a
	ld a, $06
	ldh [rOBP1], a
	ld c, $32
.asm_25f7
	call DoFrame
	dec c
	jr nz, .asm_25f7
	ld a, $01
	ldh [rBGP], a
	ld a, $40
	ldh [rOBP0], a
	ld a, $01
	ldh [rOBP1], a
	ld c, $32
.asm_260b
	call DoFrame
	dec c
	jr nz, .asm_260b
	ld a, $00
	ldh [rBGP], a
	ld a, $00
	ldh [rOBP0], a
	ld a, $00
	ldh [rOBP1], a
	ld c, $64
.asm_261f
	call DoFrame
	dec c
	jr nz, .asm_261f
	pop af
	ret
; 0x2627

SECTION "Bank 0@2639", ROM0[$2639]

Func_2639::
	ld [$cf19], a
	ret
; 0x263d

SECTION "Home@2666", ROM0[$2666]

GenerateStartingDeck::
	call GenerateStartingDeckMonsterCards
	call GenerateStartingDeckMagicCards
	call Func_27a9
	ret

GenerateStartingDeckMonsterCards:
	push af
	push bc
	push de
	push hl
	ld a, 0
	ld [wRandRangeStart], a
	ld a, 99
	ld [wRandRangeEnd], a
	ld e, $00
.asm_2680
	push de
	ld d, $00
	call RandomRange
	ld a, [wRandNum]
	ld e, a
	sla e
	ld hl, StartingDeckMonsterCards
	add hl, de
	pop de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, e
	farcall SetPlayerDeckIndex
	farcall AddCardToPlayerDeck
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

StartingDeckMonsterCards:
	dw RYU_KISHIN
	dw MUSHROOM_MAN
	dw SHADOW_SPECTER
	dw SKULL_SERVANT
	dw MOUNTAIN_WARRIOR
	dw WATTKID
	dw SANGAN
	dw KURIBOH
	dw MAN_EATING_PLANT
	dw WINGS_OF_FLAME
	dw MASK_OF_DARKNESS
	dw TOMOZAURUS
	dw KAGENINGEN
	dw DARK_PLANT
	dw NEMURIKO
	dw WEATHER_CONTROL
	dw MYSTICAL_CAPTURE
	dw B_EYED_SIL_ZOMBIE
	dw TOAD_MASTER
	dw FLAME_MANIPULATOR
	dw NECROLANCER
	dw DJINN_THE_WATCHER
	dw BEWITCHING_PHANTOM
	dw MONSTER_EGG
	dw SHADOW_WHO_CONTROL
	dw MELTING_RED_SHADOW
	dw FIRE_REAPER
	dw LARVAS
	dw FIREGRASS
	dw MAN_EATER
	dw DIG_BEAK
	dw M_WARRIOR_1
	dw M_WARRIOR_2
	dw ANCIENT_JAR
	dw DARK_PRISONER
	dw HURRICAIL
	dw FIRE_EYE
	dw MONSTURTLE
	dw PHANTOM_DEWAN
	dw ARLOWNAY
	dw DARK_SHADE
	dw MASKED_CLOWN
	dw LUCKY_TRINKET
	dw GENIN
	dw EYEARMOR
	dw GATE_DEEG
	dw SYNCHAR
	dw FUSIONIST
	dw AKAKIEISU
	dw LALA_LI_OON
	dw KEY_MACE
	dw TURTLE_TIGER
	dw TERRA_THE_TERRIBLE
	dw DORON
	dw ARMA_KNIGHT
	dw MECH_MOLE_ZOMBIE
	dw HAPPY_LOVER
	dw PENGUIN_KNIGHT
	dw PETIT_DRAGON
	dw ARCHFIEND_MARMOT
	dw PHANTOM_GHOST
	dw DOROVER
	dw TWIN_LONG_RODS_1
	dw DROLL_BIRD
	dw PETIT_ANGEL
	dw WINGED_CLEAVER
	dw HINOTAMA_SOUL
	dw THUNDER_KID
	dw MEOTOKO
	dw KAGEMUSHA_BLUE
	dw FLAME_GHOST
	dw TWO_MOUTH_DARKRULER
	dw MIDNIGHT_FIEND
	dw SKULL_STALKER
	dw HITODENCHAK
	dw WOOD_REMAINS
	dw HOURGLASS_OF_LIFE
	dw MADJINN_GUNN
	dw HANIWA
	dw YASHINOKI
	dw VISHWAR_RANDI
	dw THE_DRDEK
	dw CANDLE_OF_FATE
	dw WATER_ELEMENT
	dw DISSOLVEROCK
	dw MEDA_BAT
	dw ROOT_WATER
	dw ANGELWITCH
	dw EMBRYONIC_BEAST
	dw ARCHFIEND_MIRROR
	dw SECTARIAN_SECRET
	dw MEGIRUS_LIGHT
	dw RAY_AND_TEMPERATURE
	dw KING_FOG
	dw MYSTICAL_SHEEP_2
	dw SERPENT_MARAUDER
	dw CHANGE_SLIME
	dw PSYCHIC_KAPPA
	dw DRAGON_ERSATZ_HEAD
	dw KURAMA

GenerateStartingDeckMagicCards:
	push af
	push bc
	push de
	push hl
	ld e, $21
	ld hl, StartingDeckMagicCards
.asm_277d
	ld a, e
	cp DECK_SIZE
	jr nc, .asm_2796
	ld a, e
	farcall SetPlayerDeckIndex
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall AddCardToPlayerDeck
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

StartingDeckMagicCards:
	dw RAIGEKI
	dw SPARKS
	dw SPARKS
	dw HINOTAMA
	dw MOOYAN_CURRY
	dw RED_MEDICINE
	dw DARK_PIERCE_LIGHT

Func_27a9:
	push af
	push bc
	push de
	push hl
	ld a, 0
	ld [wRandRangeStart], a
	ld a, LOW($7ff)
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld e, a
	ld a, 0
	ld [wRandRangeStart], a
	ld a, HIGH($7ff)
	ld [wRandRangeEnd], a
	call RandomRange
	ld a, [wRandNum]
	ld d, a

	; if de == $103, give Gaia Fierce Knight
	ld a, d
	cp $01
	jr nz, .done
	ld a, e
	cp $03
	jr nz, .dark_magician_check
	; give a Gaia Fierce Knight card
	ld bc, GAIA_FIERCE_KNIGHT
	farcall Func_5af2
	farcall GiveCard
	jr .done

.dark_magician_check
	; if de == $10e, give Dark Magician
	ld a, e
	cp $0e
	jr nz, .done
	; give a Dark Magician card
	ld bc, DARK_MAGICIAN
	farcall Func_5af2
	farcall GiveCard
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

SECTION "Bank 0@2867", ROM0[$2867]

Func_2867:
	push af
	ld a, c
	cp $99
	jr nz, .asm_2872
	ld a, b
	cp $99
	jr z, .asm_287c
.asm_2872
	ld a, c
	add $01
	daa
	ld c, a
	ld a, b
	adc $00
	daa
	ld b, a
.asm_287c
	pop af
	ret

Func_287e:
	push bc
	push de
	push hl
	ld e, $01
	ld b, $00
	ld c, a
	sla c
	ld hl, $cf70
	add hl, bc
	ld a, [hli]
	cp $05
	jr nc, .asm_2898
	ld a, [hl]
	cp $00
	jr nz, .asm_2898
	ld e, $00
.asm_2898
	ld a, e
	pop hl
	pop de
	pop bc
	ret

Func_289d:
	push af
	push bc
	ld a, [$cf6e]
	ld c, a
	ld a, [$cf6f]
	ld b, a
	call Func_2867
	ld a, c
	ld [$cf6e], a
	ld a, b
	ld [$cf6f], a
	pop bc
	pop af
	ret

Func_28b5:
	push af
	push bc
	ld a, [$cf90]
	ld c, a
	ld a, [$cf91]
	ld b, a
	call Func_2867
	ld a, c
	ld [$cf90], a
	ld a, b
	ld [$cf91], a
	pop bc
	pop af
	ret

Func_28cd::
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, $cf70
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	pop af
	ret

Func_28de:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$ceef]
	ld c, a
	sla c
	ld hl, $cf4e
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	call Func_2867
	ld a, c
	ld [hli], a
	ld [hl], b
	pop hl
	pop bc
	pop af
	ret

Func_28fb:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$ceef]
	ld c, a
	push af
	sla c
	ld hl, $cf70
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld d, b
	ld e, c
	call Func_2867
	ld a, c
	ld [hli], a
	ld [hl], b
	pop af
	cp $0e
	jr nz, .asm_2933
	ld a, b
	cp $00
	jr nz, .asm_292e
	ld a, c
	cp $05
	jr c, .asm_292c
	ld a, $01
	ld [$ccfe], a
.asm_292c
	jr .asm_2933
.asm_292e
	ld a, $01
	ld [$ccfe], a
.asm_2933
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2938::
	push af
	call Func_289d
	call Func_23f7
	cp $00
	jr z, .asm_2946
	call Func_28b5
.asm_2946
	pop af
	ret

Func_2948::
	push af
	call Func_28de
	call Func_23f7
	cp $00
	jr z, .asm_2956
	call Func_28fb
.asm_2956
	pop af
	ret

Func_2958::
	push de
	ld e, $00
	call Func_2982
	cp $00
	jr z, .asm_297f
	ld e, $01
	call Func_29a2
	cp $00
	jr z, .asm_297f
	ld e, $02
	call Func_29c7
	cp $00
	jr z, .asm_297f
	ld e, $03
	call Func_29dc
	cp $00
	jr z, .asm_297f
	ld e, $04
.asm_297f
	ld a, e
	pop de
	ret

Func_2982:
	push bc
	push de
	push hl
	ld e, $01
	ld hl, $299e
	ld c, $04
.asm_298c
	ld a, [hli]
	call Func_287e
	cp $00
	jr nz, .asm_2996
	ld e, $00
.asm_2996
	dec c
	jr nz, .asm_298c
	ld a, e
	pop hl
	pop de
	pop bc
	ret
; 0x299e

SECTION "Bank 0@29a2", ROM0[$29a2]

Func_29a2:
	push bc
	push de
	push hl
	ld e, $01
	ld hl, $29be
	ld c, $09
.asm_29ac
	ld a, [hli]
	call Func_287e
	cp $00
	jr nz, .asm_29b6
	ld e, $00
.asm_29b6
	dec c
	jr nz, .asm_29ac
	ld a, e
	pop hl
	pop de
	pop bc
	ret
; 0x29be

SECTION "Bank 0@29c7", ROM0[$29c7]

Func_29c7:
	push bc
	push de
	push hl
	ld e, $01
	ld a, $0d
	call Func_287e
	cp $00
	jr nz, .asm_29d7
	ld e, $00
.asm_29d7
	ld a, e
	pop hl
	pop de
	pop bc
	ret

Func_29dc:
	push bc
	push de
	push hl
	ld e, $01
	ld a, $0e
	call Func_287e
	cp $00
	jr nz, .asm_29ec
	ld e, $00
.asm_29ec
	ld a, e
	pop hl
	pop de
	pop bc
	ret

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
	call WaitForVBlank
	pop af
	ret

Func_2a08::
	push af
	ld a, $01
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a13::
	push af
	ld a, $02
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a1e:
	push af
	ld a, $04
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a29:
	push af
	ld a, $05
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a34:
	push af
	ld a, $03
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a3f::
	push af
	ld a, $07
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a4a:
	push af
	ld a, $10
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a55::
	push af
	ld a, $06
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a60::
	push af
	ld a, $09
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a6b::
	push af
	ld a, $0a
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a76::
	push af
	ld a, $0c
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a81::
	push af
	ld a, $0d
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a8c::
	push af
	ld a, $0b
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2a97::
	push af
	ld a, [$ce00]
	cp $01
	jr nz, .asm_2ab9
	call Func_2364
	cp $00
	jr nz, .asm_2aab
	call Func_2a13
	jr .asm_2ab7
.asm_2aab
	cp $01
	jr nz, .asm_2ab4
	call Func_2a1e
	jr .asm_2ab7
.asm_2ab4
	call Func_2a29
.asm_2ab7
	jr .asm_2abc
.asm_2ab9
	call Func_2a13
.asm_2abc
	pop af
	ret

Func_2abe::
	push af
	call Func_2364
	cp $00
	jr nz, .asm_2acb
	call Func_2a34
	jr .asm_2ad7
.asm_2acb
	cp $01
	jr nz, .asm_2ad4
	call Func_2a3f
	jr .asm_2ad7
.asm_2ad4
	call Func_2a4a
.asm_2ad7
	pop af
	ret
; 0x2ad9

SECTION "Bank 0@2aef", ROM0[$2aef]

Func_2aef:
	push af
	ld a, $98
	call Func_29f1
	call WaitForVBlank
	pop af
	ret
; 0x2afa

SECTION "Home@2b26", ROM0[$2b26]

Func_2b26::
	push af
	ld a, $9d
	call Func_29f1
	call WaitForVBlank
	pop af
	ret
; 0x2b31

SECTION "Bank 0@2b52", ROM0[$2b52]

Func_2b52::
	push af
	ld a, $a2
	call Func_29f1
	call WaitForVBlank
	pop af
	ret
; 0x2b5d

SECTION "Bank 0@2b68", ROM0[$2b68]

Func_2b68::
	push af
	ld a, $94
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2b73::
	push af
	ld a, $92
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2b7e::
	push af
	ld a, $a1
	call Func_29f1
	call WaitForVBlank
	pop af
	ret

Func_2b89::
	push af
	ld a, $0f
	call Func_29f1
	call WaitForVBlank
	pop af
	ret
; 0x2b94

SECTION "Bank 0@2b94", ROM0[$2b94]

Func_2b94::
	push af
	xor a
	ld [$cfbe], a
	ld [$cfbf], a
	pop af
	ret
; 0x2b9e

SECTION "Bank 0@2ba9", ROM0[$2ba9]

Func_2ba9::
	push af
	ld a, [$cfbe]
	and $fe
	ld [$cfbe], a
	pop af
	ret
; 0x2bb4

SECTION "Bank 0@2bbf", ROM0[$2bbf]

Func_2bbf::
	push af
	ld a, [$cfbf]
	and $fe
	ld [$cfbf], a
	pop af
	ret
; 0x2bca

SECTION "Bank 0@2bd4", ROM0[$2bd4]

Func_2bd4::
	ld a, [$cfbf]
	and $01
	jr z, .asm_2bdd
	ld a, $01
.asm_2bdd
	ret

Func_2bde::
	push af
	xor a
	ld [$cfc0], a
	ld [$cfc1], a
	pop af
	ret
; 0x2be8

SECTION "Bank 0@2bf0", ROM0[$2bf0]

Func_2bf0::
	push af
	ld a, [$cfc0]
	cp $00
	jr z, .asm_2bfc
	dec a
	ld [$cfc0], a
.asm_2bfc
	pop af
	ret

Func_2bfe::
	push af
	ld a, [$cfc1]
	cp $00
	jr z, .asm_2c0a
	dec a
	ld [$cfc1], a
.asm_2c0a
	pop af
	ret

Func_2c0c::
	push bc
	push hl
	ld b, $00
	ld a, [$cfc0]
	ld c, a
	ld hl, Data_2c2c
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_2c1c::
	push bc
	push hl
	ld b, $00
	ld a, [$cfc1]
	ld c, a
	ld hl, Data_2c2c
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Data_2c2c:
	db $02, $01, $00, $00, $00

Func_2c31::
	push af
	call Func_2c0c
	cp $00
	jr nz, .asm_2c3f
	xor a
	farcall Func_1512c
	jr .asm_2c48
.asm_2c3f
	cp $01
	jr nz, .asm_2c48
	ld a, $01
	farcall Func_1512c
.asm_2c48
	pop af
	ret

Func_2c4a::
	push af
	push bc
	push de
	push hl
	xor a
	ld [$cfc2], a
	ld [$cfd6], a
	ld [$cfd7], a
	ld [$cfd8], a
	ld [$cfd9], a
	ld [$cfda], a
	ld [$cfdb], a
	ld [$cfdc], a
	ld [$cfdd], a
	ld [$cfde], a
	ld hl, $cfc4
	ld a, $ff
	ld c, $12
.asm_2c74
	ld [hli], a
	dec c
	jr nz, .asm_2c74
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2c7d::
	push de
	push hl
	ld b, $00
	ld a, [$cfc3]
	ld c, a
	sla c
	ld hl, $2cbd
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cfc2]
	cp $00
	jr nz, .asm_2c9d
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, [hl]
	call Func_2cc3
.asm_2c9d
	ld b, $00
	ld a, [$cfc2]
	ld c, a
	inc a
	ld [$cfc2], a
	ld hl, $cfc4
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [$cfc2]
	ld e, a
	ld a, [$cacd]
	cp e
	jr nz, .asm_2cb9
	ld b, $01
.asm_2cb9
	ld a, c
	pop hl
	pop de
	ret
; 0x2cbd

SECTION "Bank 0@2cc3", ROM0[$2cc3]

Func_2cc3:
	push af
	push bc
	push de
	push hl
	ld a, d
	farcall Func_42d0
	farcall Func_42c5
	farcall Func_42ec
	ld hl, $cfc4
	ld de, $cab9
	ld c, $12
.asm_2cd9
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2cd9
	xor a
	ld [$cfc2], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_2ce8::
	push af
	ld [$cfc3], a
	xor a
	ld [$cfc2], a
	pop af
	ret

Func_2cf2::
	push af
	ld a, c
	ld [$cfd6], a
	ld a, b
	ld [$cfd7], a
	ld a, e
	ld [$cfd8], a
	pop af
	ret

Func_2d01::
	push af
	ld a, c
	ld [$cfd9], a
	ld a, b
	ld [$cfda], a
	ld a, e
	ld [$cfdb], a
	pop af
	ret
; 0x2d10

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

VBlank16:
	call Func_f6e5d
	bankswitch BANK(UpdateAudio)
	call UpdateAudio
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
