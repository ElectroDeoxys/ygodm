; unreferenced
Func_1be4:
	push af
	ld a, c
	ld [wUnused_cd19], a
	ld a, b
	ld [wUnused_cd1a], a
	pop af
	ret

; unreferenced
Func_1bef:
	push af
	push bc
	push de
	push hl
	ld hl, wcd1b
	ld de, .data
	ld c, $04
.asm_1bfb
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1bfb
	pop hl
	pop de
	pop bc
	pop af
	ret

.data
	db $30, $38, $00, $00

Func_1c0a::
	push af
	ld a, $b0
	ld [wcd1c], a
	pop af
	ret

Func_1c12::
	push af
	ld a, b
	ld [wcd1e], a
	ld a, c
	ld [wcd1d], a
	pop af
	ret

Func_1c1d::
	push af
	ld a, b
	ld [wcd1c], a
	ld a, c
	ld [wcd1b], a
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
SetTargetCard::
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

RemoveTargetCard::
	push af
	push bc
	push hl
	call GetPointerToTargetCard
	ld h, b
	ld l, c
	ld a, LOW(INVALID_CARD)
	ld [hli], a
	ld a, HIGH(INVALID_CARD)
	ld [hli], a
	ld a, $10
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

OverwriteTargetCard::
	push af
	push bc
	push hl
	call GetPointerToTargetCard
	ld h, b
	ld l, c
	ld a, [wTempCardID + 0]
	ld [hli], a
	ld a, [wTempCardID + 1]
	ld [hli], a
	ld a, [wcdf4]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

LoadTargetCard::
	push af
	push bc
	push hl
	call GetPointerToTargetCard
	ld h, b
	ld l, c
	ld a, [hli]
	ld [wTempCardID + 0], a
	ld a, [hli]
	ld [wTempCardID + 1], a
	ld a, [hli]
	ld [wcdf4], a
	pop hl
	pop bc
	pop af
	ret

Func_1caa::
	push af
	push bc
	farcall Func_24024
	call OverwriteTargetCard
	pop bc
	pop af
	ret

; outputs in bc pointer to card that
; corresponds to wCardLocation and wCardLocationIndex
GetPointerToTargetCard:
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

; returns TRUE if card ID in bc is valid
IsValidCard::
	push de
	ld e, TRUE
	ld a, b
	cp HIGH(INVALID_CARD)
	jr nz, .true
	ld a, c
	cp LOW(INVALID_CARD)
	jr nz, .true
; false
	inc e
.true
	ld a, e
	pop de
	ret
