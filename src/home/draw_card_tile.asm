GetCardIconTile::
	push bc
	push de
	push hl
	ld e, $d0
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	cp FALSE
	jr nz, .asm_1d7f
	ld e, $d0
	jr .got_tile
.asm_1d7f
	call Func_2203
	cp TRUE
	jr nz, .asm_1d97
	call Func_1daf
	cp TRUE
	jr nz, .asm_1d92
	ld hl, .Tiles1
	jr .asm_1d95
.asm_1d92
	ld hl, .Tiles2
.asm_1d95
	jr .asm_1d9a
.asm_1d97
	ld hl, .Tiles2
.asm_1d9a
	call Func_21f3
	ld b, $00
	ld c, a
	add hl, bc
	ld e, [hl]
.got_tile
	ld a, e
	pop hl
	pop de
	pop bc
	ret

.Tiles1:
	db $d0, $dd, $dd, $e1
.Tiles2:
	db $d0, $e5, $e5, $e9

Func_1daf:
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wcd5c]
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
	db FALSE ; CARD_LOCATION_OPP_HAND
	db FALSE ; CARD_LOCATION_OPP_FIELD
	db FALSE ; CARD_LOCATION_PLAYER_FIELD
	db TRUE  ; CARD_LOCATION_PLAYER_HAND

.Data_1dda:
	db FALSE ; CARD_LOCATION_OPP_HAND
	db FALSE ; CARD_LOCATION_OPP_FIELD
	db FALSE ; CARD_LOCATION_PLAYER_FIELD
	db TRUE  ; CARD_LOCATION_PLAYER_HAND

.Data_1dde:
	db FALSE ; CARD_LOCATION_OPP_HAND
	db FALSE ; CARD_LOCATION_OPP_FIELD
	db TRUE  ; CARD_LOCATION_PLAYER_FIELD
	db FALSE ; CARD_LOCATION_PLAYER_HAND

.Data_1de2:
	db FALSE ; CARD_LOCATION_OPP_HAND
	db FALSE ; CARD_LOCATION_OPP_FIELD
	db TRUE  ; CARD_LOCATION_PLAYER_FIELD
	db FALSE ; CARD_LOCATION_PLAYER_HAND

.Data_1de6:
	db FALSE ; CARD_LOCATION_OPP_HAND
	db TRUE  ; CARD_LOCATION_OPP_FIELD
	db FALSE ; CARD_LOCATION_PLAYER_FIELD
	db FALSE ; CARD_LOCATION_PLAYER_HAND
