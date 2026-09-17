Func_1dea:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [wSerialReceive], a
	ld a, $00
	ld [wcdfb], a
	call Func_207c

	ld de, 65278 ; timeout
.loop
	ld a, [wSerialConnection]
	cp SERIAL_CONNECTION_INTERNAL_CLOCK
	jr nz, .external

; internal
	ld a, $30
	call SerialSend_Internal
	call WaitForVBlank
	ld a, [wSerialReceive]
	and $f0
	cp $40
	jr nz, .not_equal
	call SerialWait
	ld a, $01
	ld [wcdfb], a
	jr .done
.not_equal
	jr .decrement

.external
	ld a, $40
	call SerialSend_External
	ld a, $01
	ld [wcdfb], a
	call WaitForSerial
	jr .done
.decrement
	dec e
	jr nz, .next
	dec d
	ld a, d
	cp $ff
	jr nz, .next
	ld a, $02
	ld [wcdfb], a
	jr .done
.next
	jr .loop

.done
	pop hl
	pop de
	pop bc
	pop af
	ret

; waits for 3 frames
SerialWait:
	push af
	push bc
	ld c, 3
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
	ld [wSerialTimeOut + 0], a
	ld [wSerialTimeOut + 1], a
	ld [wcaaf], a
	ld [wcdfc], a
	pop af
	ret

Func_1e65:
	push af
	ld a, [wcdfc]
	or $02
	ld [wcdfc], a
	pop af
	ret

Func_1e70::
	push af
	call EnableSerial
	ld a, [wSerialConnection]
	cp SERIAL_CONNECTION_INTERNAL_CLOCK
	jr nz, .external
; internal
	call Func_1e88
	jr .asm_1e83
.external
	call Func_1ed5
.asm_1e83
	call DisableSerial
	pop af
	ret

Func_1e88:
	push af
	push bc
.asm_1e8a
	xor a
	ld [wcdfc], a
	call Func_1dea
	ld a, [wcdfb]
	cp $02
	jr z, .asm_1e8a
	call Func_207c
	call Func_1e55
	ld c, $7f
.asm_1ea0
	call Func_2062
	call SerialSend_Internal
	call WaitForVBlank
	call Func_1f1b
	ld a, [wcdfc]
	and $02
	jr nz, .asm_1eb6
	dec c
	jr nz, .asm_1ea0
.asm_1eb6
	ld a, [wcdfc]
	and $02
	jr nz, .asm_1e8a
	call SerialWait
	ld a, $50
	call SerialSend_Internal
	call SerialWait
	call Func_1f43
	ld a, [wcdfc]
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
	ld [wcdfc], a
	call Func_1dea
	ld a, [wcdfb]
	cp $02
	jr z, .asm_1ed7
	call Func_207c
	call Func_1e55
	ld a, $90
	ld [wcaa3], a
	ld c, $7f
.asm_1ef2
	ld a, [wcdfc]
	cp $00
	jr nz, .asm_1eff
	call WaitForSerial
	dec c
	jr nz, .asm_1ef2
.asm_1eff
	ld a, [wcdfc]
	and $02
	jr nz, .asm_1ed7
	ld a, $60
	call SerialSend_External
	call WaitForSerial
	call Func_1f2a
	ld a, [wcdfc]
	and $04
	jr z, .asm_1ed7
	pop bc
	pop af
	ret

Func_1f1b:
	push af
	ld a, [wSerialReceive]
	and $f0
	cp $90
	jr z, .asm_1f28
	call Func_1e65
.asm_1f28
	pop af
	ret

Func_1f2a:
	push af
	ld a, [wSerialReceive]
	and $f0
	cp $50
	jr z, .asm_1f39
	call Func_1e65
	jr .asm_1f41
.asm_1f39
	ld a, [wcdfc]
	or $04
	ld [wcdfc], a
.asm_1f41
	pop af
	ret

Func_1f43:
	push af
	ld a, [wSerialReceive]
	and $f0
	cp $60
	jr z, .asm_1f50
	call Func_1e65
.asm_1f50
	pop af
	ret

; unreferenced
Func_1f52:
	push af
	ld c, $00
	pop af
	ret

Func_1f57::
	push af
	ld a, $00
	ld [wcdff], a
	pop af
	ret

Func_1f5f::
	push af
	ld a, [wSerialConnection]
	cp SERIAL_CONNECTION_INTERNAL_CLOCK
	jr nz, .external
	call Func_1f71
	jr .asm_1f6f
.external
	call Func_1f79
.asm_1f6f
	pop af
	ret

Func_1f71:
	push af
	ld a, $01
	ld [wcdff], a
	pop af
	ret

Func_1f79:
	push af
	ld a, $02
	ld [wcdff], a
	pop af
	ret

Func_1f81::
	push af
	ld a, [wcdff]
	cp $01
	jr nz, .asm_1f93
	ld a, $02
	ld [wcdff], a
	call SwitchToSerialExternalClock
	jr .asm_1f9e
.asm_1f93
	ld a, $01
	ld [wcdff], a
	call SwitchToSerialInternalClock
	call SerialWait
.asm_1f9e
	pop af
	ret

; unreferenced
Func_1fa0:
	push af
	ld a, GAMEMODE_UNK0
	ld [wGameMode], a
	pop af
	ret

SetGameMode_DuelAIOpponent::
	push af
	ld a, GAMEMODE_DUEL_AI_OPP
	ld [wGameMode], a
	pop af
	ret

SetGameMode_DuelLinkOpponent::
	push af
	ld a, GAMEMODE_DUEL_LINK_OPP
	ld [wGameMode], a
	pop af
	ret

SetGameMode_Trade::
	push af
	ld a, GAMEMODE_TRADE
	ld [wGameMode], a
	pop af
	ret

SetGameMode_Records::
	push af
	ld a, GAMEMODE_RECORDS
	ld [wGameMode], a
	pop af
	ret

EnableSerial:
	push hl
	di
	ld hl, rIF
	res B_IF_SERIAL, [hl]
	ld hl, rIE
	set B_IE_SERIAL, [hl]
	ei
	pop hl
	ret

DisableSerial:
	push hl
	di
	ld hl, rIF
	res B_IF_SERIAL, [hl]
	ld hl, rIE
	res B_IE_SERIAL, [hl]
	ei
	pop hl
	ret

Func_1fe6::
	push af
	push bc
	push hl
	; fill wce17 with $80
	ld hl, wce17
	ld a, $80
	ld c, $80
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	xor a
	ld [wce97], a
	ld [wce98], a
	pop hl
	pop bc
	pop af
	ret

; unreferenced
Func_1fff:
	push af
	and $0f
	ld b, a
	swap b
	ld a, c
	and $0f
	or b
	call Func_2025
	pop af
	ret

Func_200e::
	push af
	push bc

	; high nybble
	ld c, a
	swap a
	and $0f
	or $80
	call Func_2025

	; low nybble
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
	ld hl, wce17
	add hl, bc
	pop af
	ld [hl], a
	pop hl
	pop bc
	ret

; unreferenced
Func_2041:
	push af
	call Func_2062
	ld b, a
	and $0f
	ld c, a
	ld a, b
	and $0f
	ld b, a
	swap b
	pop af
	ret

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
	ld hl, wce17
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
