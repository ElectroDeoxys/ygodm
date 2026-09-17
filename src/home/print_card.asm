Func_1508::
	push af
	push bc
	push hl
	push bc
	ld hl, wTextBuffer
	xor a
	ld c, $08
.asm_1512
	ld [hli], a
	dec c
	jr nz, .asm_1512
	pop bc
	call IsValidCard
	cp TRUE
	jr nz, .asm_153e
	ld a, TEXTLOAD_CARD_NAME
	farcall SetTextLoadMode
	farcall SetTextArg
	farcall LoadText
	farcall Func_5af2
	farcall GetCardCountInTrunk
	cp NOT_OWNED
	jr nz, .asm_153e
	ld hl, wTextBuffer
	ld a, '-'
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

Func_1542::
	push af
	push bc
	push hl
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	farcall Func_5af2
	farcall GetCardCountInTrunk
	cp NOT_OWNED
	jr z, .not_owned
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	farcall SetTextArg
	farcall LoadText
	jr .done
.not_owned
	ld hl, wTextBuffer
	ld a, $80
	ld c, $08
.asm_156e
	ld [hli], a
	dec c
	jr nz, .asm_156e
.done
	pop hl
	pop bc
	pop af
	ret
