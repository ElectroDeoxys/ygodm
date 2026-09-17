EnableVBlank:
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
	table_width 2
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
	assert_table_length NUM_VBLANK_MODES

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
	table_width 2
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
	assert_table_length NUM_VBLANK_MODES

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
	ld bc, wVBlankStruct + $16
	ld a, $18
	ld [hli], a
	ld [hl], $c5

	ld hl, wVBlankStruct + $2c
	ld a, $2e
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $42
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
	ld hl, wVBlankStruct + $14
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $28
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
	ld hl, wVBlankStruct + $0a
	ld a, $0c
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $14
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $1a
	ld a, $1c
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $20
	ld a, $22
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $26
	ld a, $28
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $2c
	ld a, $2e
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $36
	ld a, $38
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $40
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
	ld hl, wVBlankStruct + $14
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $28
	ld a, $2a
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $3c
	ld a, $3e
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $50
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
	ld hl, wVBlankStruct + $06
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $0c
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $12
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $18
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
	ld hl, wVBlankStruct + $0a
	ld a, $0c
	ld [hli], a
	ld [hl], $c5
	ld hl, wVBlankStruct + $8a
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

WaitForSerial:
	push af
	push hl

	; reset time out
	xor a
	ld [wSerialTimeOut + 0], a
	ld [wSerialTimeOut + 1], a
	ld [wcaaf], a

.loop
	call .TickTimeOut
	cp FALSE
	jr z, .timed_out
	ld a, [wSerialWaiting]
	or a
	jr z, .loop

.timed_out
	xor a ; TRUE
	ld [wSerialWaiting], a
	pop hl
	pop af
	ret

.TickTimeOut:
	ld a, [wSerialTimeOut + 0]
	add 1
	ld [wSerialTimeOut + 0], a
	ld a, [wSerialTimeOut + 1]
	adc 0
	ld [wSerialTimeOut + 1], a
	cp HIGH(65280)
	jr nz, .true
	; timed out
	call Func_1e65
	ld a, FALSE
	jr .false
.true
	xor a ; TRUE
.false
	ret
