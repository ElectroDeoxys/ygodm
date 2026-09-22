	dw BANK(@)

	farcall_table_start
	farfunc GenerateAIOpponentDeck

; generates the cards that the AI player will use
; each card is sampled from the duelist's card table,
; and the deck is not shuffled (all cards stay in place)
GenerateAIOpponentDeck:
	push af
	push bc
	push de
	push hl
	ld e, 0
.loop
	ld a, e
	cp DECK_SIZE
	jr nc, .done
	ld a, e
	farcall SetOppDuelDeckIndex
	call .GenerateCard
	farcall AddCardToOpponentDeck
	inc e
	jr .loop
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

; output:
; - bc = card ID
.GenerateCard:
	push af
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
	; de = random number between [$0, $7ff]
	ld b, $00
	farcall ConvertNPCDuelistToCharacter
	ld c, a
	sla c
	ld hl, DuelistDeckLists
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; find first number in frequency table
	; that is larger than sample number
	ld bc, 0
.loop_freqs
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call CompareBCAndDE
	pop bc
	; larger?
	cp DE_SMALLER_THAN_BC
	jr z, .got_card
	; no, increment card ID
	inc bc
	jr .loop_freqs
.got_card
	pop hl
	pop de
	pop af
	ret

INCLUDE "data/deck_lists.asm"
