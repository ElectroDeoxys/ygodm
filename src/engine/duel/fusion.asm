	dw BANK(@)

	farcall_table_start
	farfunc SetMaterial1Card
	farfunc SetMaterial2Card
	farfunc AttemptFusionSummon
	farfunc ClearFusionCards

; unreferenced, identical to ClearFusionCards
Func_ec00a:
	push af
	ld a, LOW(INVALID_CARD)
	ld [wMaterial1CardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wMaterial1CardID + 1], a
	ld a, LOW(INVALID_CARD)
	ld [wMaterial2CardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wMaterial2CardID + 1], a
	ld a, LOW(INVALID_CARD)
	ld [wFusionCardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wFusionCardID + 1], a
	pop af
	ret

; clears wMaterial1CardID, wMaterial2CardID and wFusionCardID
ClearFusionCards:
	push af
	ld a, LOW(INVALID_CARD)
	ld [wMaterial1CardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wMaterial1CardID + 1], a
	ld a, LOW(INVALID_CARD)
	ld [wMaterial2CardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wMaterial2CardID + 1], a
	ld a, LOW(INVALID_CARD)
	ld [wFusionCardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wFusionCardID + 1], a
	pop af
	ret

; input:
; - bc = card ID
SetMaterial1Card:
	push af
	call IsValidCard
	cp TRUE
	jr nz, .invalid
	ld a, c
	ld [wMaterial1CardID + 0], a
	ld a, b
	ld [wMaterial1CardID + 1], a
.invalid
	pop af
	ret

; input:
; - bc = card ID
SetMaterial2Card:
	push af
	call IsValidCard
	cp TRUE
	jr nz, .invalid
	ld a, c
	ld [wMaterial2CardID + 0], a
	ld a, b
	ld [wMaterial2CardID + 1], a
.invalid
	pop af
	ret

; swaps between material 1 and 2
SwapMaterialCards:
	push af
	push bc
	ld a, [wMaterial1CardID + 0]
	ld c, a
	ld a, [wMaterial1CardID + 1]
	ld b, a
	ld a, [wMaterial2CardID + 0]
	ld [wMaterial1CardID + 0], a
	ld a, [wMaterial2CardID + 1]
	ld [wMaterial1CardID + 1], a
	ld a, c
	ld [wMaterial2CardID + 0], a
	ld a, b
	ld [wMaterial2CardID + 1], a
	pop bc
	pop af
	ret

; with cards given in wMaterial1CardID and wMaterial2CardID,
; attempt to fuse them into a Fusion monster
; if found, wFusionCardID will hold the card ID
; otherwise, it will hold INVALID_CARD
AttemptFusionSummon:
	push bc
	push de
	push hl
	ld l, FALSE

	; is material 1 valid?
	ld a, [wMaterial1CardID + 0]
	ld c, a
	ld a, [wMaterial1CardID + 1]
	ld b, a
	ld de, INVALID_CARD
	call IsBCEqualToDE
	and a
	jr z, .got_fusion_card

	; is material 2 valid?
	ld a, [wMaterial2CardID + 0]
	ld c, a
	ld a, [wMaterial2CardID + 1]
	ld b, a
	call IsBCEqualToDE
	and a
	jr z, .got_fusion_card

	; both are valid cards

	; try finding valid fusion between them
	call FindValidFusion
	cp TRUE
	jr nz, .not_found_1
	ld l, TRUE
	call GetFusionCard
	jr .got_fusion_card

.not_found_1
	; try finding valid fusion with materials swapped
	call SwapMaterialCards
	call FindValidFusion
	cp TRUE
	jr nz, .not_found_2
	ld l, TRUE
	call GetFusionCard
.not_found_2
	call SwapMaterialCards

.got_fusion_card
	ld a, e
	ld [wFusionCardID + 0], a
	ld a, d
	ld [wFusionCardID + 1], a
	ld a, l
	pop hl
	pop de
	pop bc
	ret

; tries to find a valid fusion between both material cards
; if found, return FALSE, else return TRUE
FindValidFusion:
	push bc
	push hl
	ld de, $86e
	ld hl, FusionCards_Material1
	ld a, [wMaterial1CardID + 0]
	ld c, a
	ld a, [wMaterial1CardID + 1]
	ld b, a
.loop_find
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call IsBCEqualToDE
	pop de
	and a
	jr nz, .next_entry
	call .CheckMaterial2
	and a
	jr z, .found_pair
.next_entry
	dec de
	ld a, d
	cp HIGH(-1)
	jr nz, .loop_find
.found_pair
	ld l, TRUE
	ld a, d
	cp HIGH(-1)
	jr nz, .done
	inc l ; FALSE
.done
	; do bc - de, which gives the fusion index
	ld bc, $86e
	ld a, c
	sub e
	ld e, a
	ld a, b
	sbc d
	ld d, a
	ld a, l
	pop hl
	pop bc
	ret

.CheckMaterial2:
	push bc
	push de
	push hl
	ld bc, $86e
	ld a, c
	sub e
	ld e, a
	ld a, b
	sbc d
	ld d, a
	sla e
	rl d
	ld hl, FusionCards_Material2
	add hl, de
	ld a, [wMaterial2CardID + 0]
	ld c, a
	ld a, [wMaterial2CardID + 1]
	ld b, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call IsBCEqualToDE
	pop hl
	pop de
	pop bc
	ret

; given fusion index in de, output its card ID in bc
GetFusionCard:
	push af
	push hl
	sla e
	rl d
	ld hl, FusionCards_Result
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	pop af
	ret

INCLUDE "data/fusion_cards.asm"
