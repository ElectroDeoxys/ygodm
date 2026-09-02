	dw BANK(@)

	farcall_table_start
	farfunc Func_14036 ; $03
	farfunc Func_14185 ; $05
	farfunc Func_1420c ; $07
	farfunc $45cd ; $09
	farfunc $48b6 ; $0b
	farfunc Func_1500c ; $0d
	farfunc Func_1501f ; $0f
	farfunc Func_15032 ; $11
	farfunc $508a ; $13
	farfunc Func_1509a ; $15
	farfunc Func_150ad ; $17
	farfunc Func_150bd ; $19
	farfunc Func_150dd ; $1b
	farfunc Func_1512c ; $1d
	farfunc Func_15148 ; $1f
	farfunc Func_15194 ; $21
	farfunc Func_151db ; $23
	farfunc Func_15204 ; $25
	farfunc $5049 ; $27
	farfunc Func_15059 ; $29
	farfunc $50cd ; $2b
	farfunc HandleExodiaWinCondition ; $2d
	farfunc HandleEmptyHandWinCondition ; $2f
	farfunc $52a3 ; $31
	farfunc Func_14216 ; $33
	farfunc Func_14238 ; $35

Func_14036:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $406e
	call Func_10d9
	call Func_12d2
	farcall Func_803e
	farcall Func_28fae
	call Func_140a3
	call Func_140e3
	call Func_14113
	call Func_14143
	farcall Func_f0004
	call EnableLCD
	call Func_ff0
	call WaitForVBlank
	call Func_2ae4
	call Func_14078
	pop hl
	pop af
	ret
; 0x1406e

SECTION "Bank 5@4078", ROMX[$4078], BANK[$5]

Func_14078:
	push af
	push bc
	call Func_1c0a
	call Func_1256
	farcall Func_5eb3
	ld bc, $1028
	call Func_1c1d
	ld bc, NULL
	call Func_1c12
	ld a, $0a
	call SetPendingVBlankMode
	call Func_1282
	farcall Func_5ff2
	call RequestVBlankMode
	call WaitForVBlank
	pop bc
	pop af
	ret

Func_140a3:
	push af
	push bc
	push de
	push hl
	hlbgcoord 1, 0
	ld a, [wLoadedCardID]
	ld c, a
	ld a, [$cd10]
	ld b, a
	call Func_1508
	call Func_111c
	ld de, $cab9
	ld c, $12
.asm_140bd
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_140bd
	ld de, $e
	add hl, de
	ld de, $cab9
	ld c, $12
.asm_140d2
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	ld [hli], a
	dec c
	jr nz, .asm_140d2
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_140e3:
	push af
	push hl
	hlbgcoord 13, 5
	ld a, $00
	farcall Func_42d0
	ld a, [wLoadedCardAtk]
	ld c, a
	ld a, [$cd14]
	ld b, a
	ld a, b
	cp $ff
	jr z, .asm_14110
	farcall Func_42c5
	farcall Func_42ec
	ld a, [$cab9]
	ld [hli], a
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
.asm_14110
	pop hl
	pop af
	ret

Func_14113:
	push af
	push hl
	hlbgcoord 13, 7
	ld a, $00
	farcall Func_42d0
	ld a, [wLoadedCardDef]
	ld c, a
	ld a, [$cd16]
	ld b, a
	ld a, b
	cp $ff
	jr z, .asm_14140
	farcall Func_42c5
	farcall Func_42ec
	ld a, [$cab9]
	ld [hli], a
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
.asm_14140
	pop hl
	pop af
	ret

Func_14143:
	push af
	push bc
	push de
	push hl
	ld a, $0e
	farcall Func_42d0
	ld b, $00
	ld a, [wLoadedCardType]
	ld c, a
	farcall Func_42c5
	farcall Func_42ec
	ld hl, $cab9
	debgcoord 11, 8
	ld c, $08
.asm_14160
	ld a, [hli]
	call Func_1144
	ld a, [$cacf]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_14160
	ld hl, $cab9
	debgcoord 11, 9
	ld c, $08
.asm_14174
	ld a, [hli]
	call Func_1144
	ld a, [$cad0]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_14174
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_14185:
	push af
	push bc
	push de
	push hl
	call Func_141a8
	ld b, $00
	ld c, a
	ld hl, $41a4
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0x1419b

SECTION "Bank 5@41a8", ROMX[$41a8], BANK[$5]

Func_141a8:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $02
	jr z, .asm_141c1
	ld c, $08
.asm_141b6
	dec c
	rlca
	jr nc, .asm_141b6
	ld b, $00
	ld hl, $41c6
	add hl, bc
	ld d, [hl]
.asm_141c1
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x141c6

SECTION "Bank 5@41e9", ROMX[$41e9], BANK[$5]

Func_141e9:
	push af
	ld a, $6d
	ld [$ceb5], a
	ld a, $01
	ld [$ceb6], a
	pop af
	ret

Func_141f6:
	push af
	ld a, c
	ld [$ceb5], a
	ld a, b
	ld [$ceb6], a
	pop af
	ret

Func_14201:
	push af
	ld a, [$ceb5]
	ld c, a
	ld a, [$ceb6]
	ld b, a
	pop af
	ret

Func_1420c:
	call Func_1425a
	call Func_141e9
	call Func_1432f
	ret

Func_14216:
	push af
	push bc
	push de
	push hl
	ld hl, $ceb7
	ld e, $05
.asm_1421f
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_14230
	farcall Func_5af2
	farcall GiveCard
.asm_14230
	dec e
	jr nz, .asm_1421f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_14238:
	push af
	push bc
	push de
	push hl
	ld hl, $cea5
	ld e, $05
.asm_14241
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call IsValidCard
	cp TRUE
	jr nz, .asm_14252
	farcall Func_5af2
	farcall GiveCard
.asm_14252
	dec e
	jr nz, .asm_14241
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1425a:
	push af
	push bc
	push hl
	ld hl, $ceb7
	ld c, $05
.asm_14262
	call Func_2051
	ld [hli], a
	call Func_2051
	ld [hli], a
	dec c
	jr nz, .asm_14262
	pop hl
	pop bc
	pop af
	ret

Func_14271:
	push bc
	push de
	push hl
	ld hl, $ceb7
	ld de, $cec1
	ld b, $00
	ld c, $0a
.asm_1427e
	ld a, [de]
	cp [hl]
	jr z, .asm_14284
	ld b, $01
.asm_14284
	inc hl
	inc de
	dec c
	jr nz, .asm_1427e
	ld a, b
	pop hl
	pop de
	pop bc
	ret

Func_1428e:
	push af
	push bc
	push de
	push hl
	ld h, b
	ld l, c
	ld b, a
	sla a
	sla a
	sla a
	sla b
	add b
	ld c, a
	ld b, $00
	add hl, bc
	ld b, h
	ld c, l
	ld e, d
	sla e
	ld d, $00
	ld hl, $42c7
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $05
.asm_142b2
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [bc]
	ld [de], a
	inc bc
	inc de
	ld a, [bc]
	ld [de], a
	inc bc
	pop af
	dec a
	jr nz, .asm_142b2
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x142c7

SECTION "Bank 5@430f", ROMX[$430f], BANK[$5]

Func_1430f:
	push af
	push bc
	push de
	push hl
	ld hl, $ceb7
	ld de, $cec1
	ld c, $0a
.asm_1431b
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1431b
	ld hl, $ceb7
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call Func_141f6
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1432f:
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld e, $18
.asm_14337
	push de
	ld bc, $436b
	ld e, d
	ld d, $00
.asm_1433e
	ld a, d
	cp $06
	jr nc, .asm_14361
	ld a, e
	call Func_1428e
	call Func_14271
	cp $00
	jr nz, .asm_1435e
	ld bc, $445b
	ld a, e
	ld d, $00
	call Func_1428e
	call Func_1430f
	add sp, $02
	jr .asm_14366
.asm_1435e
	inc d
	jr .asm_1433e
.asm_14361
	pop de
	inc d
	dec e
	jr nz, .asm_14337
.asm_14366
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1436b

SECTION "Bank 5@454b", ROMX[$454b], BANK[$5]

HandleExodiaWinCondition:
	push af
	push bc
	call .CheckAllExodiaPieces
	cp TRUE
	jr nz, .skip
	farcall Func_b807
	call Func_23a8
.skip
	pop bc
	pop af
	ret

; returns TRUE if player has all Exodia pieces
.CheckAllExodiaPieces:
	push bc
	push de
	ld b, 0
	ld c, CARD_LOCATION_PLAYER_HAND
	ld e, $00
.loop_hand
	ld a, b
	cp HAND_SIZE
	jr nc, .check_exodia_flags
	call SetTargetCard
	call LoadTargetCard
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
	; if has all pieces, then return TRUE
	ld a, e
	cp HAS_R_LEG_OF_FORBIDDEN | HAS_L_LEG_OF_FORBIDDEN | HAS_R_ARM_OF_FORBIDDEN | HAS_L_ARM_OF_FORBIDDEN | HAS_EXODIA_FORBIDDEN
	jr nz, .false
	xor a ; TRUE
	jr .true
.false
	ld a, FALSE
.true
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
	call IsBCEqualToDE
	pop de
	cp TRUE
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

Func_145cd:
	push af
	push bc
	push de
	push hl
	call Func_1466f
	call Func_146b6
	call Func_1461b
	call Func_148b6
	call Func_1463c
	call Func_1467e
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_145e8:
	push af
	push bc
	push de
	push hl
	call Func_1466f
	call Func_146b6
	call Func_1461b
	call Func_148b6
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_145fd:
	push af
	push bc
	push de
	push hl
	call Func_1466f
	call Func_14655
	call Func_146b6
	call Func_1461b
	call Func_148b6
	call Func_1463c
	call Func_1467e
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1461b:
	push af
	push bc
	ld a, $8f
	ldh [rWY], a
	ld a, $07
	ldh [rWX], a
	ld c, $8f
.asm_14627
	ld a, c
	cp $67
	jr c, .asm_14635
	ldh [rWY], a
	dec c
	dec c
	call WaitForVBlank
	jr .asm_14627
.asm_14635
	ld a, $67
	ldh [rWY], a
	pop bc
	pop af
	ret

Func_1463c:
	push af
	push bc
	ld c, $67
.asm_14640
	ld a, c
	cp $8f
	jr nc, .asm_1464e
	ldh [rWY], a
	inc c
	inc c
	call WaitForVBlank
	jr .asm_14640
.asm_1464e
	ld a, $8f
	ldh [rWY], a
	pop bc
	pop af
	ret

Func_14655:
	push af
	push bc
	ldh a, [rWY]
	ld c, a
.asm_1465a
	ld a, c
	cp $8f
	jr nc, .asm_14668
	ldh [rWY], a
	inc c
	inc c
	call WaitForVBlank
	jr .asm_1465a
.asm_14668
	ld a, $8f
	ldh [rWY], a
	pop bc
	pop af
	ret

Func_1466f:
	call Func_148e9
	call Func_14676
	ret

Func_14676:
	push hl
	ld hl, rLCDC
	res B_LCDC_OBJS, [hl]
	pop hl
	ret

Func_1467e:
	push hl
	ld hl, rLCDC
	set B_LCDC_OBJS, [hl]
	pop hl
	ret

Func_14686:
	push af
	ld a, $01
	ld [$cf41], a
	ld a, $00
	ld [$cf43], a
	ld a, $00
	ld [$cf44], a
	ld a, $00
	ld [$cf45], a
	ld a, $00
	ld [$cf46], a
	ld a, $00
	ld [$cf1c], a
	call Func_14830
	pop af
	ret

Func_146aa:
	push af
	call Func_148f9
	call Func_14731
	call Func_1487e
	pop af
	ret

Func_146b6:
	push af
	ld a, VBLANK_10
	call SetPendingVBlankMode
	ld a, $00
	ld [$cf45], a
	ld a, $00
	ld [$cf46], a
	call Func_14830
	call Func_146ef
	call RequestVBlankMode
	call WaitForVBlank
	ld a, VBLANK_10
	call SetPendingVBlankMode
	ld a, $00
	ld [$cf45], a
	ld a, $01
	ld [$cf46], a
	call Func_14830
	call Func_146ef
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	ret

Func_146ef:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$cf46]
	ld c, a
	sla c
	ld hl, $472b
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	call AddWordToVBlankStruct
	ld hl, $cf1d
	ld e, $12
.asm_1470a
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_1470a
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	ld hl, $cf2f
	ld e, $12
.asm_1471f
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_1471f
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1472b

SECTION "Bank 5@4731", ROMX[$4731], BANK[$5]

Func_14731:
	push af
	push bc
	push hl
	ld a, [$cf42]
	cp $b0
	jr nc, .asm_14740
	call Func_14761
	jr .done
.asm_14740
	ld b, $00
	sub $b0
	ld c, a
	sla c
	ld hl, $4757
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
.done
	pop hl
	pop bc
	pop af
	ret
; 0x14757

SECTION "Bank 5@4761", ROMX[$4761], BANK[$5]

Func_14761:
	push af
	push bc
	push de
	push hl
	ld a, [$cf41]
	cp $01
	jr nz, .asm_14795
	call Func_14854
	ld a, [$cf42]
	call Func_1144
	ld b, $00
	ld a, [$cf45]
	ld c, a
	ld hl, $cf1d
	add hl, bc
	ld a, [$cacf]
	ld [hl], a
	ld a, [$cf45]
	ld c, a
	ld hl, $cf2f
	add hl, bc
	ld a, [$cad0]
	ld [hl], a
	call Func_146ef
	call Func_1479a
.asm_14795
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1479a:
	push af
	ld a, [$cf45]
	inc a
	ld [$cf45], a
	cp $12
	jr c, .asm_147ae
	call Func_147b0
	ld a, $01
	ld [$cf1c], a
.asm_147ae
	pop af
	ret

Func_147b0:
	push af
	ld a, [$cf1c]
	cp $00
	jr nz, .asm_147cd
	ld a, $00
	ld [$cf45], a
	ld a, [$cf46]
	cp $02
	jr nc, .asm_147c5
	inc a
.asm_147c5
	ld [$cf46], a
	call Func_14830
	jr .asm_147d2
.asm_147cd
	ld a, $00
	ld [$cf1c], a
.asm_147d2
	pop af
	ret
; 0x147d4

SECTION "Bank 5@4830", ROMX[$4830], BANK[$5]

Func_14830:
	push af
	push bc
	push hl
	call Func_14854
	ld a, $00
	call Func_1144
	ld a, [$cacf]
	ld hl, $cf1d
	ld c, $12
.asm_14843
	ld [hli], a
	dec c
	jr nz, .asm_14843
	ld a, [$cad0]
	ld c, $12
.asm_1484c
	ld [hli], a
	dec c
	jr nz, .asm_1484c
	pop hl
	pop bc
	pop af
	ret

Func_14854:
	push af
	ld a, [$cf18]
	cp $00
	jr nz, .asm_1486d
	ld a, [$cf46]
	cp $00
	jr nz, .asm_14868
	call Func_1114
	jr .asm_1486b
.asm_14868
	call Func_111c
.asm_1486b
	jr .asm_1487c
.asm_1486d
	ld a, [$cf46]
	cp $00
	jr nz, .asm_14879
	call Func_1134
	jr .asm_1487c
.asm_14879
	call Func_113c
.asm_1487c
	pop af
	ret

Func_1487e:
	push af
	push bc
	push hl
	ld a, [$cf41]
	dec a
	ld [$cf41], a
	jr nz, .asm_148a5
	ld a, [$cf42]
	cp $b0
	jr nc, .asm_14898
	ld a, $02
	ld [$cf41], a
	jr .asm_148a5
.asm_14898
	ld b, $00
	sub $b0
	ld c, a
	ld hl, $48a9
	add hl, bc
	ld a, [hl]
	ld [$cf41], a
.asm_148a5
	pop hl
	pop bc
	pop af
	ret
; 0x148a9

SECTION "Bank 5@48b6", ROMX[$48b6], BANK[$5]

Func_148b6:
	push af
	push bc
	ld a, $00
	ld [$cf48], a
	call Func_14686
.asm_148c0
	ld a, VBLANK_10
	call SetPendingVBlankMode
	call Func_14f5a
	ld a, [$cf48]
	cp $00
	jr nz, .asm_148d4
	call Func_146aa
	jr .asm_148d7
.asm_148d4
	call Func_14fb2
.asm_148d7
	call RequestVBlankMode
	call WaitForVBlank
	ld a, [$cf48]
	cp $05
	jr z, .asm_148e6
	jr .asm_148c0
.asm_148e6
	pop bc
	pop af
	ret

Func_148e9:
	push af
	ld a, $00
	ld [$cf4c], a
	pop af
	ret

Func_148f1:
	push af
	ld a, $01
	ld [$cf4c], a
	pop af
	ret

Func_148f9:
	push af
	push bc
	push hl
	ld a, [$cf41]
	cp $01
	jr nz, .asm_14906
	call Func_1490a
.asm_14906
	pop hl
	pop bc
	pop af
	ret

Func_1490a:
	push bc
	push hl
	ld a, [$cf4c]
	cp $01
	jr nz, .asm_1491b
	call Func_14970
	ld [$cf42], a
	jr .asm_14931
.asm_1491b
	call Func_14934
	ld [$cf42], a
	call Func_14961
	cp $00
	jr nz, .asm_14931
	call Func_148f1
	call Func_14970
	ld [$cf42], a
.asm_14931
	pop hl
	pop bc
	ret

Func_14934:
	push bc
	push hl
	ld b, $00
	ld a, [$cf47]
	ld c, a
	sla c
	rl b
	ld hl, $4980
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cf44]
	ld b, a
	ld a, [$cf43]
	ld c, a
	inc a
	ld [$cf43], a
	jr nz, .asm_1495c
	ld a, [$cf44]
	inc a
	ld [$cf44], a
.asm_1495c
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_14961:
	cp $b5
	jr c, .asm_1496d
	sub $b5
	call Func_2ce8
	xor a
	jr .asm_1496f
.asm_1496d
	ld a, $01
.asm_1496f
	ret

Func_14970:
	push bc
	call Func_2c7d
	push af
	ld a, b
	cp $01
	jr nz, .asm_1497d
	call Func_148e9
.asm_1497d
	pop af
	pop bc
	ret
; 0x14980

SECTION "Bank 5@4f5a", ROMX[$4f5a], BANK[$5]

Func_14f5a:
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $03
	jr z, .asm_14f74
	ld c, $08
.asm_14f69
	dec c
	rlca
	jr nc, .asm_14f69
	ld b, $00
	ld hl, $4f88
	add hl, bc
	ld d, [hl]
.asm_14f74
	ld a, $01
	ld [$cf49], a
	ld a, d
	cp $02
	jr nz, .asm_14f83
	ld a, $00
	ld [$cf48], a
.asm_14f83
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x14f88

SECTION "Bank 5@4fb2", ROMX[$4fb2], BANK[$5]

Func_14fb2:
	call Func_14fb9
	call Func_14fe1
	ret

Func_14fb9:
	push af
	push bc
	push hl
	ld a, [$cf4d]
	dec a
	ld [$cf4d], a
	jr nz, .asm_14fd8
	ld a, $14
	ld [$cf4d], a
	ld b, $00
	ld a, [$cf48]
	ld c, a
	ld hl, $4fdc
	add hl, bc
	ld a, [hl]
	ld [$cf48], a
.asm_14fd8
	pop hl
	pop bc
	pop af
	ret
; 0x14fdc

SECTION "Bank 5@4fe1", ROMX[$4fe1], BANK[$5]

Func_14fe1:
	call Func_14fe8
	call Func_146ef
	ret

Func_14fe8:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$cf48]
	ld c, a
	dec c
	ld hl, $5008
	add hl, bc
	ld d, h
	ld e, l
	ld a, [$cf45]
	ld c, a
	ld hl, $cf2f
	add hl, bc
	ld a, [de]
	ld [hli], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x15008

SECTION "Bank 5@500c", ROMX[$500c], BANK[$5]

Func_1500c:
	push af
	call Func_2b68
	ld a, $00
	ld [$cf18], a
	ld a, $00
	ld [$cf47], a
	call Func_145fd
	pop af
	ret

Func_1501f:
	push af
	call Func_2b68
	ld a, $00
	ld [$cf18], a
	ld a, $01
	ld [$cf47], a
	call Func_145cd
	pop af
	ret

Func_15032:
	push af
	ld a, [$cdff]
	cp $02
	jr nz, .asm_15047
	ld a, $00
	ld [$cf18], a
	ld a, $08
	ld [$cf47], a
	call Func_145e8
.asm_15047
	pop af
	ret
; 0x15049

SECTION "Bank 5@5059", ROMX[$5059], BANK[$5]

Func_15059:
	push af
	push bc
	ld a, $01
	ld [$cf18], a
	ld a, $07
	ld [$cf47], a
	call Func_145cd
	call Func_2c4a
	call Func_14201
	call IsValidCard
	cp TRUE
	jr nz, .asm_15087
	ld e, $04
	call Func_2cf2
	ld a, $01
	ld [$cf18], a
	ld a, $09
	ld [$cf47], a
	call Func_145cd
.asm_15087
	pop bc
	pop af
	ret
; 0x1508a

SECTION "Bank 5@509a", ROMX[$509a], BANK[$5]

Func_1509a:
	push af
	call Func_2b68
	ld a, $00
	ld [$cf18], a
	ld a, $04
	ld [$cf47], a
	call Func_145cd
	pop af
	ret

Func_150ad:
	push af
	ld a, $01
	ld [$cf18], a
	ld a, $05
	ld [$cf47], a
	call Func_145cd
	pop af
	ret

Func_150bd:
	push af
	ld a, $01
	ld [$cf18], a
	ld a, $06
	ld [$cf47], a
	call Func_145cd
	pop af
	ret
; 0x150cd

SECTION "Bank 5@50dd", ROMX[$50dd], BANK[$5]

Func_150dd:
	push af
	push bc
	push de
	push hl
	ld e, a
	ld a, $00
	ld [$cf18], a
	ld d, $00
	ld hl, $5118
	add hl, de
	ld a, [hl]
	ld [$cf47], a
	call Func_2c4a
	sla e
	ld hl, $511c
	add hl, de
	push de
	ld e, $04
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call Func_2cf2
	pop de
	ld hl, $5124
	add hl, de
	ld e, $04
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call Func_2d01
	call Func_145cd
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x15118

SECTION "Bank 5@512c", ROMX[$512c], BANK[$5]

Func_1512c::
	push af
	push bc
	push hl
	ld c, a
	ld a, $00
	ld [$cf18], a
	ld b, $00
	ld hl, $5146
	add hl, bc
	ld a, [hl]
	ld [$cf47], a
	call Func_145cd
	pop hl
	pop bc
	pop af
	ret
; 0x15146

SECTION "Bank 5@5148", ROMX[$5148], BANK[$5]

Func_15148:
	push af
	push bc
	push hl
	ld c, a
	ld a, $00
	ld [$cf18], a
	ld b, $00
	ld hl, $5162
	add hl, bc
	ld a, [hl]
	ld [$cf47], a
	call Func_145cd
	pop hl
	pop bc
	pop af
	ret
; 0x15162

SECTION "Bank 5@5194", ROMX[$5194], BANK[$5]

Func_15194:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [$cf18], a
	ld a, $2a
	ld [$cf47], a
	call Func_2c4a
	ld e, $04
	ld a, [wMaterial1CardID + 0]
	ld c, a
	ld a, [wMaterial1CardID + 1]
	ld b, a
	call Func_2cf2
	ld e, $04
	ld a, [wMaterial2CardID + 0]
	ld c, a
	ld a, [wMaterial2CardID + 1]
	ld b, a
	call Func_2d01
	ld e, $04
	ld a, [wFusionCardID + 0]
	ld c, a
	ld a, [wFusionCardID + 1]
	ld b, a
	call Func_2d10
	call IsValidCard
	cp TRUE
	jr nz, .asm_151d6
	call Func_145cd
.asm_151d6
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_151db:
	push af
	push bc
	push de
	ld a, $00
	ld [$cf18], a
	ld a, $2b
	ld [$cf47], a
	call Func_2c4a
	ld e, $04
	call Func_2cf2
	ld e, $04
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call Func_2d01
	call Func_145cd
	pop de
	pop bc
	pop af
	ret

Func_15204:
	push af
	push bc
	push de
	ld a, $00
	ld [$cf18], a
	ld a, $11
	ld [$cf47], a
	call Func_2c4a
	ld e, $04
	ld bc, ELEGANT_EGOTIST
	call Func_2cf2
	ld e, $04
	ld bc, HARPIE_LADY
	call Func_2d01
	ld e, $04
	ld bc, HARPIE_LADY_SISTER
	call Func_2d10
	call Func_145cd
	pop de
	pop bc
	pop af
	ret

HandleEmptyHandWinCondition:
	push af
	; does player have any hand cards?
	farcall PlayerHasAnyHandCards
	cp FALSE
	jr nz, .done
	; no, which duelist has less LP?
	call PlayerHasSameOrMoreLPThanOpponent
	cp TRUE
	jr nz, .player_has_less_lp
	; player LP >= opp LP
	call Func_23a8
	jr .done
.player_has_less_lp
	; player LP < opp LP
	call Func_23a0
.done
	pop af
	ret

PlayerHasSameOrMoreLPThanOpponent:
	push bc
	push de
	ld a, [wPlayerLP + 0]
	ld e, a
	ld a, [wPlayerLP + 1]
	ld d, a
	ld a, [wOppLP + 0]
	ld c, a
	ld a, [wOppLP + 1]
	ld b, a
	call Func_13bb
	ld d, FALSE
	ld a, e
	cp $00
	jr z, .asm_1526a
	ld d, TRUE
.asm_1526a
	ld a, d
	pop de
	pop bc
	ret
; 0x1526e
