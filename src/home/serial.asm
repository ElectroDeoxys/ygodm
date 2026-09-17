Func_19f:
	push af
	push hl

	di
	call Func_1fe6

	; disable serial interrupts
	ld hl, rIE
	res B_IE_SERIAL, [hl]
	ld hl, rIF
	res B_IE_SERIAL, [hl]

	ld a, $00
	ld [wcaa1], a
	xor a
	ld [wSerialConnection], a
	ld [wSerialReceive], a
	ld [wcaa3], a
	ld [wSerialWaiting], a
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
	ld a, [wcaa1]
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
	ld [wSerialReceive], a
	cp $20
	jr z, .asm_20e
	ld a, $00
	ldh [rSB], a
	call Func_376
	ld a, SC_EXTERNAL
	ldh [rSC], a
	ld a, SC_EXTERNAL | SC_START
	ldh [rSC], a
.asm_20e
	ret

Func_20f:
	ldh a, [rSB]
	ld [wSerialReceive], a
	ld a, FALSE
	ld [wSerialWaiting], a
	ret

Func_21a:
	ldh a, [rSB]
	ld [wSerialReceive], a
	ld c, a
	and $f0
	cp $80
	jr nz, .asm_22e
	ld a, [wSerialReceive]
	call Func_2025
	jr .asm_235
.asm_22e
	cp $50
	jr z, .asm_235
	call Func_1e65
.asm_235
	ld a, [wcaa3]
	ldh [rSB], a
	ld hl, rSC
	set B_SC_START, [hl]
	ld a, FALSE
	ld [wSerialWaiting], a
	xor a
	ld [wSerialTimeOut + 0], a
	ld [wSerialTimeOut + 1], a
	ld [wcaaf], a
	ret

Func_24f::
	push bc
	push de
	push hl
	call Func_19f
	call EnableSerial

.retry
	ld e, $00
	ld b, 5 * 2
	ld d, FALSE

.loop_outer
	; attempt external connection for 60 frames
	ld c, 60
.loop_external
	call TryConnectingWithExternalClock
	cp TRUE
	jr nz, .asm_26d
	ld e, $01
	ld d, TRUE
	jr .established_connection
.asm_26d
	dec c
	jr nz, .loop_external

	; attempt interal connection for 2 frames
	ld c, 2
.loop_internal
	dec b
	jr z, .fail
	call TryConnectingWithInternalClock
	cp TRUE
	jr nz, .asm_282
	ld e, $02
	ld d, TRUE
	jr .established_connection
.asm_282
	dec c
	jr nz, .loop_internal
	jr .loop_outer

.established_connection
	call Func_2d8
	cp TRUE
	jr nz, .retry
.fail
	call DisableSerial
	ld a, d
	pop hl
	pop de
	pop bc
	ret

TryConnectingWithInternalClock:
	push hl
	ld hl, rSC
	ld [hl], SC_EXTERNAL
	ld a, SERIAL_CONNECTION_INTERNAL_CLOCK
	ldh [rSB], a
	ld [hl], SC_INTERNAL
	set B_SC_START, [hl]
	call WaitForVBlank
	ld l, FALSE
	ld a, [wSerialReceive]
	cp SERIAL_CONNECTION_EXTERNAL_CLOCK
	jr nz, .false
; true
	ld l, TRUE
.false
	ld a, l
	pop hl
	ret

TryConnectingWithExternalClock:
	push hl
	ld hl, rSC
	ld a, SC_EXTERNAL
	ld [hl], a
	ld a, $00
	ld [wSerialReceive], a
	ld a, SERIAL_CONNECTION_EXTERNAL_CLOCK
	ldh [rSB], a
	set B_SC_START, [hl]
	call WaitForVBlank
	ld l, FALSE
	ld a, [wSerialReceive]
	cp SERIAL_CONNECTION_INTERNAL_CLOCK
	jr nz, .false
; true
	ld l, TRUE
.false
	ld a, l
	pop hl
	ret

Func_2d8:
	push bc
	push de
	ld b, FALSE
	ld a, e
	cp $01
	jr nz, .asm_2ea
	call SwitchToSerialExternalClock
	call Func_340
	ld b, a
	jr .done
.asm_2ea
	cp $02
	jr nz, .done
	call SerialWait
	call SwitchToSerialInternalClock
	call SerialWait
	call Func_329
	ld b, a
	call SerialWait
.done
	pop de
	pop bc
	ret

Func_301:
	ld [wcaa1], a
	ret

SwitchToSerialInternalClock::
	push af
	push hl
	ld a, SERIAL_CONNECTION_INTERNAL_CLOCK
	ld [wSerialConnection], a
	ld a, $02
	call Func_301
	ld a, SC_INTERNAL
	ldh [rSC], a
	pop hl
	pop af
	ret

SwitchToSerialExternalClock::
	push af
	ld a, SERIAL_CONNECTION_EXTERNAL_CLOCK
	ld [wSerialConnection], a
	ld a, $04
	call Func_301
	ld a, SC_EXTERNAL
	ldh [rSC], a
	pop af
	ret

Func_329:
	push bc
	ld b, FALSE
	ld a, $50
	call SerialSend_Internal
	call WaitForVBlank
	ld a, [wSerialReceive]
	cp $60
	jr nz, .false
	ld b, TRUE
.false
	ld a, b
	pop bc
	ret

Func_340:
	push bc
	ld b, FALSE
	ld a, $60
	call SerialSend_External
	call WaitForSerial
	ld a, [wSerialReceive]
	cp $50
	jr nz, .false
	ld b, TRUE
.false
	ld a, b
	pop bc
	ret

SerialSend_Internal:
	push af
	push hl
	di
	ld hl, rSC
	call .WaitForSerialFree
	ld [hl], SC_INTERNAL
	ldh [rSB], a
	set B_SC_START, [hl]
	ei
	pop hl
	pop af
	ret

.WaitForSerialFree:
	push af
	push hl
	ld hl, rSC
.wait
	bit B_SC_START, [hl]
	jr nz, .wait
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

SerialSend_External:
	push af
	push hl
	push af
	di
	xor a ; TRUE
	ld [wSerialWaiting], a
	ld a, SC_EXTERNAL
	ldh [rSC], a
	pop af
	ldh [rSB], a
	ld a, SC_EXTERNAL | SC_START
	ldh [rSC], a
	ei
	pop hl
	pop af
	ret
