	dw BANK(@)

	farcall_table_start
	farfunc $4036 ; $03
	farfunc $4185 ; $05
	farfunc $420c ; $07
	farfunc $45cd ; $09
	farfunc $48b6 ; $0b
	farfunc $500c ; $0d
	farfunc $501f ; $0f
	farfunc $5032 ; $11
	farfunc $508a ; $13
	farfunc $509a ; $15
	farfunc $50ad ; $17
	farfunc $50bd ; $19
	farfunc $50dd ; $1b
	farfunc $512c ; $1d
	farfunc $5148 ; $1f
	farfunc $5194 ; $21
	farfunc $51db ; $23
	farfunc $5204 ; $25
	farfunc $5049 ; $27
	farfunc $5059 ; $29
	farfunc $50cd ; $2b
	farfunc Func_1454b ; $2d
	farfunc $5233 ; $2f
	farfunc $52a3 ; $31
	farfunc $4216 ; $33
	farfunc $4238 ; $35

SECTION "Bank 5@454b", ROMX[$454b], BANK[$5]

Func_1454b:
	push af
	push bc
	call .Func_1455d
	cp FALSE
	jr nz, .asm_1455a
	farcall Func_b807
	call Func_23a8
.asm_1455a
	pop bc
	pop af
	ret

.Func_1455d:
	push bc
	push de
	ld b, 0
	ld c, CARD_LOCATION_HAND
	ld e, $00
.loop_hand
	ld a, b
	cp HAND_SIZE
	jr nc, .check_exodia_flags
	call Func_1c4f
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call .GetExodiaFlag
	or e
	ld e, a
	pop bc
	inc b
	jr .loop_hand
.check_exodia_flags
	; if has all pieces, then return FALSE
	ld a, e
	cp HAS_R_LEG_OF_FORBIDDEN | HAS_L_LEG_OF_FORBIDDEN | HAS_R_ARM_OF_FORBIDDEN | HAS_L_ARM_OF_FORBIDDEN | HAS_EXODIA_FORBIDDEN
	jr nz, .true
	xor a ; FALSE
	jr .false
.true
	ld a, TRUE
.false
	pop de
	pop bc
	ret

; input:
; - bc = card ID
.GetExodiaFlag:
	push bc
	push de
	push hl
	ld d, $00
	ld e, $00
	ld hl, .ExodiaCardIDs
.loop_exodia_cards
	ld a, e
	cp $05
	jr nc, .none_found
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call CompareBCAndDE
	pop de
	cp FALSE
	jr nz, .next_exodia_card
	push hl
	ld hl, .ExodiaPieceFlags
	add hl, de
	ld a, [hl]
	add sp, $02
	jr .done
	pop hl
.next_exodia_card
	inc e
	jr .loop_exodia_cards
.none_found
	xor a
.done
	pop hl
	pop de
	pop bc
	ret

.ExodiaCardIDs:
	dw R_LEG_OF_FORBIDDEN
	dw L_LEG_OF_FORBIDDEN
	dw R_ARM_OF_FORBIDDEN
	dw L_ARM_OF_FORBIDDEN
	dw EXODIA_FORBIDDEN

.ExodiaPieceFlags:
	db HAS_R_LEG_OF_FORBIDDEN
	db HAS_L_LEG_OF_FORBIDDEN
	db HAS_R_ARM_OF_FORBIDDEN
	db HAS_L_ARM_OF_FORBIDDEN
	db HAS_EXODIA_FORBIDDEN
; 0x145cd
