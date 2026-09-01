	dw BANK(@)

	farcall_table_start
	farfunc GameLoop ; $03
	farfunc Func_10477 ; $05
	farfunc $4484 ; $07
	farfunc Func_104f5 ; $09
	farfunc $4505 ; $0b
	farfunc Func_10047 ; $0d
	farfunc Func_10140 ; $0f
	farfunc Func_1018d ; $11
	farfunc Func_10741 ; $13
	farfunc Func_108f0 ; $15
	farfunc Func_10919 ; $17
	farfunc Func_11196 ; $19
	farfunc $51ad ; $1b
	farfunc $52cb ; $1d
	farfunc $4a1b ; $1f

GameLoop::
	call Func_1576
	farcall Func_883d
	call Func_10484
	call Func_10505

	; condition to break from loop
	ld a, $00
	ld [wBeatGame], a

.loop
	ld a, [wBeatGame]
	cp $01
	jr z, .break
	farcall Func_e6be
	farcall Func_e49c
	call Func_2a08
	farcall Func_e4fb
	jr .loop
.break
	ret

Func_10047:
	push af
	ld a, $02
	ld [$cea1], a
	call Func_2a55
.asm_10050
	ld a, [$cea1]
	cp $02
	jr nz, .asm_10062
	farcall Func_6804
	farcall Func_6622
	farcall Func_6736
	jr .asm_100a6
.asm_10062
	cp $03
	jr nz, .asm_10071
	farcall Func_64b5
	farcall Func_62c2
	farcall Func_63d6
	jr .asm_100a6
.asm_10071
	cp $04
	jr nz, .asm_10080
	farcall Func_6a6e
	farcall Func_689e
	farcall Func_69b5
	jr .asm_100a6
.asm_10080
	cp $05
	jr nz, .asm_1008f
	farcall Func_6c67
	farcall Func_6a97
	farcall Func_6bae
	jr .asm_100a6
.asm_1008f
	cp $06
	jr nz, .asm_1009e
	farcall Func_6e41
	farcall Func_6c90
	farcall Func_6da7
	jr .asm_100a6
.asm_1009e
	cp $00
	jr z, .asm_100a8
	cp $01
	jr z, .asm_100a8
.asm_100a6
	jr .asm_10050
.asm_100a8
	cp $01
	jr nz, .asm_100af
	call Func_100b1
.asm_100af
	pop af
	ret

Func_100b1:
	push af
	push bc
	farcall Func_b52c
	farcall Func_cbe9
	farcall Func_cb87
	call Func_2a60
	farcall Func_cc4c
	ld c, $0a
.asm_100c4
	call WaitForVBlank
	dec c
	jr nz, .asm_100c4
	cp $00
	jr nz, .asm_100d4
	call Func_2b68
	call DoDuel
.asm_100d4
	pop bc
	pop af
	ret

DoDuel:
	push af
	push bc
	call Func_1f57
	farcall SetupDuel
	farcall GenerateAIOpponentDeck
	farcall AIOppDrawInitialHand
	farcall Func_4068
	call Func_2a97
.loop
	farcall Func_d014
	call IsDuelOngoing
	cp FALSE
	jr z, .duel_finished
	farcall Func_1501f
	call Func_2391
	call Func_101f8
	call Func_10302
	call IsDuelOngoing
	cp FALSE
	jr z, .duel_finished
	farcall Func_c142
	jr .loop
.duel_finished
	call IncrementDuelistDuelAndWinCounts
	farcall GiveVictoryAwardCard
	call Func_104f5
	ld c, 100
.asm_10118
	call WaitForVBlank
	dec c
	jr nz, .asm_10118
	call Func_10124
	pop bc
	pop af
	ret

Func_10124:
	push af
	ld a, [$cf02]
	cp $03
	jr nz, .asm_10137
	farcall Func_b547
	farcall Func_b62d
	farcall Func_b679
	jr .asm_1013e
.asm_10137
	cp $02
	jr nz, .asm_1013e
	farcall Func_b562
.asm_1013e
	pop af
	ret

Func_10140:
	push af
	ldh a, [$ffde]
	cp $03
	jr nz, .asm_1014c
	farcall Func_b916
	jr .asm_1016b
.asm_1014c
	call Func_1016d
	cp $00
	jr z, .asm_10158
	farcall Func_b7ee
	jr .asm_1016b
.asm_10158
	farcall Func_cbe9
	farcall Func_cb87
	call Func_2a60
	farcall Func_cc4c
	cp $00
	jr nz, .asm_1016b
	farcall Func_d249
.asm_1016b
	pop af
	ret

Func_1016d:
	push bc
	push de
	ld e, $00
	farcall GetTrunkTotalCardCount
	farcall GetPlayerDeckCardCount
	add c
	ld c, a
	ld a, $00
	adc b
	ld b, a
	ld a, b
	cp $00
	jr nz, .asm_10189
	ld a, c
	cp $32
	jr nc, .asm_10189
	ld e, $01
.asm_10189
	ld a, e
	pop de
	pop bc
	ret

Func_1018d:
	push af
	ldh a, [$ffde]
	cp $03
	jr nz, .asm_10199
	farcall Func_b916
	jr .asm_101bb
.asm_10199
	call Func_101d8
	cp $00
	jr z, .asm_101a5
	farcall Func_b7ee
	jr .asm_101bb
.asm_101a5
	farcall Func_cbe9
	farcall Func_e711
	farcall Func_e7eb
	call Func_2a60
	farcall Func_e84e
	cp $00
	jr nz, .asm_101bb
	call Func_101bd
.asm_101bb
	pop af
	ret

Func_101bd:
	push af
	farcall Func_ee30
	cp $00
	jr nz, .asm_101d0
	farcall Func_14216
	call Func_104f5
	farcall Func_15059
	jr .asm_101d6
.asm_101d0
	farcall Func_14238
	farcall Func_150ad
.asm_101d6
	pop af
	ret

Func_101d8:
	push bc
	push de
	ld e, $00
	farcall GetTrunkTotalCardCount
	farcall GetPlayerDeckCardCount
	add c
	ld c, a
	ld a, $00
	adc b
	ld b, a
	ld a, b
	cp $00
	jr nz, .asm_101f4
	ld a, c
	cp $32
	jr nc, .asm_101f4
	ld e, $01
.asm_101f4
	ld a, e
	pop de
	pop bc
	ret

Func_101f8:
	call Func_1020e
	farcall Func_fa96
	call Func_1023c
	call Func_1027d
	call Func_102c0
	farcall Func_c1bc
	farcall Func_c1f1
	ret

Func_1020e:
	push af
	ld a, LOW(INVALID_CARD)
	ld [$cee7], a
	ld a, HIGH(INVALID_CARD)
	ld [$cee8], a
	ld a, $00
	ld [$cee9], a
	ld a, $00
	ld [$ceea], a
	ld a, LOW(INVALID_CARD)
	ld [$ceeb], a
	ld a, HIGH(INVALID_CARD)
	ld [$ceec], a
	ld a, $00
	ld [$ceed], a
	ld a, $00
	ld [$ceee], a
	farcall ClearFusionCards
	pop af
	ret

Func_1023c:
	push af
	push bc
	push hl
	ld b, $00
.asm_10241
	ld c, CARD_LOCATION_OPP_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr z, .asm_10260
	inc b
	ld a, b
	cp $05
	jr c, .asm_10241
.asm_10260
	ld a, b
	cp $05
	jr z, .asm_10279
	ld a, b
	ld [$cee9], a
	ld a, c
	ld [$ceea], a
	ld a, [wTempCardID + 0]
	ld [$cee7], a
	ld a, [wTempCardID + 1]
	ld [$cee8], a
.asm_10279
	pop hl
	pop bc
	pop af
	ret

Func_1027d:
	push af
	push bc
	push hl
	ld b, $00
.asm_10282
	ld c, CARD_LOCATION_OPP_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .asm_102a1
	inc b
	ld a, b
	cp $05
	jr c, .asm_10282
.asm_102a1
	ld a, b
	cp $05
	jr nz, .asm_102a8
	ld b, $00
.asm_102a8
	ld a, b
	ld [$ceed], a
	ld a, c
	ld [$ceee], a
	ld a, [wTempCardID + 0]
	ld [$ceeb], a
	ld a, [wTempCardID + 1]
	ld [$ceec], a
	pop hl
	pop bc
	pop af
	ret

Func_102c0:
	push af
	push bc
	ld a, [$ceed]
	ld b, a
	ld c, CARD_LOCATION_OPP_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall SetMaterial1Card
	ld a, [$cee9]
	ld b, a
	ld c, CARD_LOCATION_OPP_HAND
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall SetMaterial2Card
	farcall AttemptFusionSummon
	cp $00
	jr nz, .asm_102fc
	farcall Func_ef1d
	jr .asm_102ff
.asm_102fc
	farcall Func_eebf
.asm_102ff
	pop bc
	pop af
	ret

Func_10302:
	push af
	push bc
	call Func_10340
	ld a, $00
	ld [$cef7], a
.asm_1030c
	ld a, [$cef7]
	cp $05
	jr nc, .asm_10334
	call Func_2217
	farcall Func_e1f2
	call Func_10370
	cp $00
	jr nz, .asm_10323
	call Func_1039c
.asm_10323
	ld a, [$cef7]
	add $01
	ld [$cef7], a
	call IsDuelOngoing
	cp FALSE
	jr z, .asm_10334
	jr .asm_1030c
.asm_10334
	call Func_2bbf
	call Func_2bfe
	farcall Func_c772
	pop bc
	pop af
	ret

Func_10340:
	push af
	ld a, LOW(INVALID_CARD)
	ld [$cef0], a
	ld a, HIGH(INVALID_CARD)
	ld [$cef1], a
	ld a, $00
	ld [$cef2], a
	ld a, $00
	ld [$cef7], a
	ld a, $01
	ld [$cef8], a
	ld a, LOW(INVALID_CARD)
	ld [$cef9], a
	ld a, HIGH(INVALID_CARD)
	ld [$cefa], a
	ld a, $00
	ld [$cf00], a
	ld a, $00
	ld [$cf01], a
	pop af
	ret

Func_10370:
	push bc
	push de
	push hl
	ld e, $01
	ld a, [$cef7]
	ld b, a
	ld c, CARD_LOCATION_OPP_FIELD
	call SetCardLocationAndIndex
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .asm_10397
	call Func_10433
	ld e, $00
.asm_10397
	ld a, e
	pop hl
	pop de
	pop bc
	ret

Func_1039c:
	push bc
	push de
	call Func_2bd4
	cp $00
	jr nz, .asm_103c1
	farcall Func_d974
	ld e, a
	cp $02
	jr nz, .asm_103b2
	call Func_10414
	jr .asm_103bf
.asm_103b2
	ld a, e
	cp $01
	jr nz, .asm_103bc
	call Func_103fb
	jr .asm_103bf
.asm_103bc
	call Func_103d4
.asm_103bf
	jr .asm_103d1
.asm_103c1
	farcall Func_d974
	ld e, a
	cp $02
	jr nz, .asm_103ce
	call Func_10414
	jr .asm_103d1
.asm_103ce
	call Func_103d4
.asm_103d1
	pop de
	pop bc
	ret

Func_103d4:
	push af
	push bc
	push bc
	ld a, [$cef7]
	ld b, a
	ld a, [$cef8]
	ld c, a
	farcall Func_e285
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21d9
	call Func_1c7a
	pop bc
	call Func_1045a
	farcall Func_e2b2
	farcall Func_e407
	pop bc
	pop af
	ret

Func_103fb:
	push af
	push bc
	ld a, [$cef7]
	ld b, a
	ld a, [$cef8]
	ld c, a
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21e6
	call Func_1c7a
	pop bc
	pop af
	ret

Func_10414:
	push af
	push bc
	ld a, [$cef7]
	ld b, a
	ld a, [$cef8]
	ld c, a
	farcall Func_e285
	call SetCardLocationAndIndex
	call Func_1c92
	call Func_21d9
	call Func_1c7a
	farcall Func_e407
	pop bc
	pop af
	ret

Func_10433:
	push af
	ld a, [wTempCardID + 0]
	ld [$cef0], a
	ld a, [wTempCardID + 1]
	ld [$cef1], a
	ld a, $02
	ld [$cef2], a
	ld a, b
	ld [$cef7], a
	ld a, c
	ld [$cef8], a
	farcall Func_cfe1
	ld a, b
	ld [wcd5e], a
	ld a, c
	ld [wcd5f], a
	pop af
	ret

; input:
; - b = card location index
; - c = CARD_LOCATION_* constant
Func_1045a:
	push af
	call SetCardLocationAndIndex
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld [$cef9], a
	ld a, [wTempCardID + 1]
	ld [$cefa], a
	ld a, b
	ld [$cf00], a
	ld a, c
	ld [$cf01], a
	pop af
	ret

Func_10477::
	push af
	ld a, $00
	ld [$cf16], a
	ld a, $00
	ld [$cf17], a
	pop af
	ret

Func_10484:
	push af
	ld a, $00
	ld [$cf17], a
	call CheckSaveDataMagic
	cp FALSE
	jr nz, .valid_save_data
; invalid save data
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [$cf17], a
.valid_save_data
	call Func_105bc
	cp FALSE
	jr nz, .asm_104ae
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [$cf17], a
.asm_104ae
	call Func_1050f
	pop af
	ret

Func_104b3:
	call ClearSRAM
	call Func_104e2
	call Func_10645
	call Func_1060b
	call Func_10684
	call Func_10618
	call Func_1051c
	call Func_105fe
	ret

ClearSRAM:
	push af
	push bc
	push hl
	ld hl, STARTOF(SRAM)
	xor a
	ld b, SIZEOF(SRAM) / $100
.loop_outer
	ld c, $00 ; aka $100
.loop_inner
	ld [hli], a
	dec c
	jr nz, .loop_inner
	dec b
	jr nz, .loop_outer
	pop hl
	pop bc
	pop af
	ret

Func_104e2:
	call Func_1116c
	farcall InitTrunk
	farcall ClearPlayerDeck
	call SetInitialWinAndDuelCounts
	call GenerateStartingDeck
	farcall Func_3708e
	ret

Func_104f5:
	call Func_1060b
	call Func_10684
	call Func_10618
	call Func_1051c
	call Func_105fe
	ret

Func_10505:
	call Func_105fe
	call Func_10540
	call Func_106b2
	ret

Func_1050f:
	push af
	ld a, [$b7f0]
	cp $02
	jr nz, .asm_1051a
	call Func_1051c
.asm_1051a
	pop af
	ret

Func_1051c:
	push af
	push bc
	push de
	push hl
	ld hl, sa000
	ld de, $abf8
	ld c, $f8
.asm_10528
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_10528
	ld b, $0b
.asm_10530
	ld c, $00
.asm_10532
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_10532
	dec b
	jr nz, .asm_10530
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_10540:
	push af
	push bc
	push de
	push hl
	ld hl, sa000
	ld de, $abf8
	ld c, $f8
.asm_1054c
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1054c
	ld b, $0b
.asm_10554
	ld c, $00
.asm_10556
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_10556
	dec b
	jr nz, .asm_10554
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_10564:
	push af
	push bc
	push de
	push hl
	call Func_10586
	ld b, $00
	ld a, [$cf16]
	ld c, a
	sla c
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop hl
	pop de
	pop bc
	pop af
	ret

.PtrTable:
	dw $abf6
	dw $b7ee

Func_10586:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cf16]
	ld c, a
	sla c
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; calculate sum of $bf6 bytes in hl
	ld de, 0
	ld c, $f6
.asm_1059d
	ld a, [hli]
	add e
	ld e, a
	adc d
	ld d, a
	dec c
	jr nz, .asm_1059d
	ld b, $b
.asm_105a7
	ld c, $00 ; aka $100
.asm_105a9
	ld a, [hli]
	add e
	ld e, a
	adc d
	ld d, a
	dec c
	jr nz, .asm_105a9
	dec b
	jr nz, .asm_105a7
	pop hl
	pop bc
	pop af
	ret

.PtrTable:
	dw $a000
	dw $abf8
; 0x105bc

SECTION "Bank 04@45bc", ROMX[$45bc], BANK[$04]

Func_105bc:
	push bc
	push de
	push hl
	ld a, [$b7f0]
	cp $03
	jr c, .asm_105ca
	ld a, $01
	jr .done
.asm_105ca
	ld b, TRUE
	ld a, [$b7f0]
	ld c, a
	ld hl, $45fb
	add hl, bc
	ld a, [hl]
	ld [$cf16], a
	call Func_10586
	ld b, TRUE
	ld a, [$cf16]
	ld c, a
	sla c
	ld hl, $4582
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	cp e
	jr z, .asm_105f0
	ld b, FALSE
.asm_105f0
	ld a, [hl]
	cp d
	jr z, .asm_105f6
	ld b, FALSE
.asm_105f6
	ld a, b
.done
	pop hl
	pop de
	pop bc
	ret
; 0x105fb

SECTION "Bank 04@45fe", ROMX[$45fe], BANK[$04]

Func_105fe:
	push af
	ld a, $00
	ld [$b7f0], a
	ld a, $00
	ld [$cf16], a
	pop af
	ret

Func_1060b:
	push af
	ld a, $01
	ld [$b7f0], a
	ld a, $00
	ld [$cf16], a
	pop af
	ret

Func_10618:
	push af
	ld a, $02
	ld [$b7f0], a
	ld a, $01
	ld [$cf16], a
	pop af
	ret
; 0x10625

SECTION "Bank 04@4645", ROMX[$4645], BANK[$04]

Func_10645:
	push af
	push bc
	push de
	push hl
	ld hl, $b7f1
	ld de, SaveDataMagic
	ld c, $0b
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

SaveDataMagic:
	db $98, $10, $10, $00, $10, $4b, $4f, $4e, $41, $4d, $49
.end

CheckSaveDataMagic:
	push bc
	push de
	push hl
	ld b, TRUE
	ld hl, $b7f1
	ld de, SaveDataMagic
	ld c, SaveDataMagic.end - SaveDataMagic
.loop
	ld a, [de]
	cp [hl]
	jr z, .next
	ld b, FALSE
.next
	inc hl
	inc de
	dec c
	jr nz, .loop
	ld a, b
	pop hl
	pop de
	pop bc
	ret

; store data to save file
Func_10684:
	push af
	push bc
	push de
	push hl
	ld de, sa000
	ld bc, SRAMToWRAMMap
.loop
	ld a, [bc] ; WRAM address
	ld l, a    ;
	inc bc     ;
	ld a, [bc] ;
	ld h, a
	inc bc
	; == NULL?
	cp HIGH(NULL)
	jr nz, .not_null
	ld a, l
	cp LOW(NULL)
	jr z, .asm_106aa
.not_null
	push bc
	ld a, [bc] ; length
	ld c, a
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy
	pop bc
	inc bc
	jr .loop
.asm_106aa
	call Func_10564
	pop hl
	pop de
	pop bc
	pop af
	ret

; read data from save file
Func_106b2:
	push af
	push bc
	push de
	push hl
	ld de, sa000
	ld bc, SRAMToWRAMMap
.asm_106bc
	ld a, [bc] ; WRAM address
	ld l, a    ;
	inc bc     ;
	ld a, [bc] ;
	ld h, a
	inc bc
	; == NULL?
	cp HIGH(NULL)
	jr nz, .not_null
	ld a, l
	cp LOW(NULL)
	jr z, .done
.not_null
	push bc
	ld a, [bc] ; length
	ld c, a
.loop_copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy
	pop bc
	inc bc
	jr .asm_106bc
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

SRAMToWRAMMap:
	dwb $ce99, $04
	dwb $cfaf, $04
	dwb $cfb7, $01
	dwb $cfdf, $02
	dwb wPlayerDeck, DECK_SIZE * $2
	dwb wTrunk, $ff
	dwb wTrunk + $ff, LOW(NUM_CARDS - $ff)
	dwb wDuelistDuelCounts, NUM_DUELISTS * $2
	dwb wDuelistWinCounts, NUM_DUELISTS * $2
	dwb $cf99, $08
	dwb $b800, $c8
	dwb $b8c8, $c8
	dwb $b990, $c8
	dwb $ba58, $c8
	dw NULL

SECTION "Bank 4@4709", ROMX[$4709], BANK[$4]

Func_10709:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cf95]
	ld c, a
	ld hl, $471e
	add hl, bc
	ld a, [hl]
	ld [$cf96], a
	pop hl
	pop bc
	pop af
	ret
; 0x1071e

SECTION "Bank 4@4741", ROMX[$4741], BANK[$4]

Func_10741:
	ld [$cf95], a
	call Func_10709
	call Func_1074e
	call Func_108d1
	ret

Func_1074e:
	push af
	push bc
	push hl
	ld a, $10
	call SetPendingVBlankMode
	ld b, $00
	ld a, [$cf95]
	ld c, a
	sla c
	ld hl, $478e
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	bcbgcoord 1, 0, vBGMap1
	ld d, $05
.asm_1076a
	call AddWordToVBlankStruct
	ld e, $12
.asm_1076f
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_1076f
	push hl
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	dec d
	jr nz, .asm_1076a
	call RequestVBlankMode
	call WaitForVBlank
	call Func_10901
	pop hl
	pop bc
	pop af
	ret
; 0x1078e

SECTION "Bank 4@4846", ROMX[$4846], BANK[$4]

Func_10846:
	push af
	push bc
	push hl
	ld a, $10
	call SetPendingVBlankMode
	ld hl, $4877
	bcbgcoord 1, 0, vBGMap1
	ld d, $05
.asm_10856
	call AddWordToVBlankStruct
	ld e, $12
.asm_1085b
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_1085b
	push hl
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	dec d
	jr nz, .asm_10856
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop bc
	pop af
	ret
; 0x10877

SECTION "Bank 4@48d1", ROMX[$48d1], BANK[$4]

Func_108d1:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cf95]
	ld c, a
	ld hl, $48ec
	add hl, bc
	ld a, [hl]
	ldh [rWY], a
	ld hl, $48ee
	add hl, bc
	ld a, [hl]
	ldh [rWX], a
	pop hl
	pop bc
	pop af
	ret
; 0x108ec

SECTION "Bank 4@48f0", ROMX[$48f0], BANK[$4]

Func_108f0:
	push af
	call Func_10901
	ld a, $8f
	ldh [rWY], a
	ld a, $07
	ldh [rWX], a
	call Func_10846
	pop af
	ret

Func_10901:
	push af
	ld a, [$cf95]
	cp $01
	jr z, .asm_10917
	ld a, $04
	call SetPendingVBlankMode
	farcall Func_cefb
	call RequestVBlankMode
	call WaitForVBlank
.asm_10917
	pop af
	ret

Func_10919:
	call Func_112cb
	call Func_2a55
	call Func_11554
	ret
; 0x10923

SECTION "Bank 04@4942", ROMX[$4942], BANK[$04]

Func_10942:
	push af
	push bc
	push de
	push hl
	ld hl, $cfa1
	ld de, $493a
	ld c, $08
.asm_1094e
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1094e
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x10959

SECTION "Bank 04@4976", ROMX[$4976], BANK[$04]

Func_10976:
	push af
	push bc
	push hl
	ld c, $00
	ld hl, wce99
	ld a, [$cf99]
	add [hl]
	ld b, a
	ld a, [$cf9d]
	adc b
	ld [hli], a
	jr z, .asm_1098b
	inc c
.asm_1098b
	ld a, [$cf9a]
	add [hl]
	ld b, a
	ld a, [$cf9e]
	adc b
	ld [hli], a
	jr z, .asm_10998
	inc c
.asm_10998
	ld a, [$cf9b]
	add [hl]
	ld b, a
	ld a, [$cf9f]
	adc b
	ld [hli], a
	jr z, .asm_109a5
	inc c
.asm_109a5
	ld a, [$cf9c]
	add [hl]
	ld b, a
	ld a, [$cfa0]
	adc b
	ld [hli], a
	jr z, .asm_109b2
	inc c
.asm_109b2
	ld a, c
	cp $00
	jr nz, .asm_109bc
	ld a, $01
	ld [wce99], a
.asm_109bc
	pop hl
	pop bc
	pop af
	ret

Func_109c0:
	push af
	push bc
	push de
	push hl
	ld hl, $cf99
	ld de, $cfa1
	ld c, $08
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x109d7

SECTION "Bank 04@49f2", ROMX[$49f2], BANK[$04]

Func_109f2:
	push af
	call SeedRNG
	call Func_10942
	call Func_10b1f
	farcall Func_b823
	ld a, $00
	ld [$cf98], a
.loop
	ld a, [$cfa9]
	cp $03
	jr z, .asm_10a13
	call Func_10a3e
	call Func_11084
	jr .loop
.asm_10a13
	call Func_109c0
	call Func_10976
	pop af
	ret
; 0x10a1b

SECTION "Bank 04@4a3e", ROMX[$4a3e], BANK[$04]

Func_10a3e:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $4a70
	call Func_10d9
	farcall Func_803e
	ld a, [$cfa9]
	cp $00
	jr nz, .asm_10a5b
	farcall Func_334bb
	jr .asm_10a5e
.asm_10a5b
	farcall Func_3372d
.asm_10a5e
	call Func_10a7a
	call Func_10af3
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x10a70

SECTION "Bank 04@4a7a", ROMX[$4a7a], BANK[$04]

Func_10a7a:
	call ClearOAM
	call Func_10fe0
	call Func_10a87
	call Func_1225
	ret

Func_10a87:
	push af
	push bc
	push de
	push hl
	ld de, Gfx_10aa3
	ld hl, vTiles0
	ld b, 5 ; tiles
.loop_tiles
	ld c, TILE_SIZE
.loop_copy_tile
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy_tile
	dec b
	jr nz, .loop_tiles
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_10aa3: INCBIN "gfx/gfx_10aa3.2bpp"

Func_10af3:
	push af
	push bc
	push de
	push hl
	call Func_1114
	hlbgcoord 6, 0
	ld de, $cfa1
	ld c, $08
.loop
	ld a, [de]
	inc de
	call Func_1144
	push hl
	push bc
	ld bc, TILEMAP_WIDTH
	add hl, bc
	ld a, [$cad0]
	ld [hl], a
	pop bc
	pop hl
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_10b1f:
	push af
	ld a, $00
	ld [$cfa9], a
	ld a, $00
	ld [$cfaa], a
	ld a, $01
	ld [$cfab], a
	ld a, $00
	ld [$cfac], a
	pop af
	ret
; 0x10b36

SECTION "Bank 04@4fe0", ROMX[$4fe0], BANK[$04]

Func_10fe0:
	push af
	push bc
	push de
	push hl
	lb bc, 0, 0
	ld a, [$cfaa]
	call Func_11024
	ld d, a
	ld a, [$cfab]
	call Func_1103a
	call Func_123c

	call Func_1104e
	ld d, a
	lb bc, $1, $1
	ld a, $14
	call Func_123c
	lb bc, $2, $2
	ld a, $1c
	call Func_123c

	ld a, d
	add $08
	ld d, a
	lb bc, $3, $3
	ld a, $14
	call Func_123c
	lb bc, $4, $4
	ld a, $1c
	call Func_123c
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_11024:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $5031
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x11031

SECTION "Bank 04@503a", ROMX[$503a], BANK[$04]

Func_1103a:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, $5047
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x11047

SECTION "Bank 04@504e", ROMX[$504e], BANK[$04]

Func_1104e:
	push bc
	push hl
	ld b, $00
	ld a, [$cfac]
	ld c, a
	ld hl, $505e
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x1105e

SECTION "Bank 04@5084", ROMX[$5084], BANK[$04]

Func_11084:
	push af
	push bc
	push de
	push hl
.loop
	call Random
	call Func_110b4
	ld b, $00
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	cp $01
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_110ee
	dw $50fb
	dw $5110
	dw $5120
	dw $5133
	dw $5146
	dw $5159

Func_110b4:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_110cd
	ld c, $08
.asm_110c2
	dec c
	rlca
	jr nc, .asm_110c2
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_110cd
	ld a, [wcaa7]
	and $f0
	jr z, .asm_110e1
	ld c, $08
.asm_110d6
	dec c
	rlca
	jr nc, .asm_110d6
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_110e1
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $0a, $0c, $06, $08

Func_110ee:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret
; 0x110fb

SECTION "Bank 04@516c", ROMX[$516c], BANK[$04]

Func_1116c:
	push af
	push bc
	push de
	push hl
	ld hl, wce99
	ld de, $cfaf
	ld c, $04
.asm_11178
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_11178
	ld hl, $b800
	xor a
	ld b, $04
.asm_11184
	ld c, $c8
.asm_11186
	ld [hli], a
	dec c
	jr nz, .asm_11186
	dec b
	jr nz, .asm_11184
	xor a
	ld [$cfb7], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_11196:
	push af
	push bc
	push hl
	call Func_111c9
	cp $00
	jr nz, .skip
	farcall Func_5af2
	farcall GiveCard
	farcall Func_b889
.skip
	pop hl
	pop bc
	pop af
	ret

Func_111ad:
	push bc
	push hl
	ld hl, $cfb3
	xor a
	ld c, $04
.asm_111b5
	ld [hli], a
	dec c
	jr nz, .asm_111b5
	ld c, $c8
	ld a, [$cfb7]
	cp $00
	jr nz, .asm_111c5
	call Func_1123b
.asm_111c5
	ld a, c
	pop hl
	pop bc
	ret

Func_111c9:
	push de
	push hl
	ld h, $01
	call Func_11221
	ld a, b
	cp $00
	jr nz, .asm_111ea
	ld a, c
	call Func_111ee
	ld d, c
	ld b, 10
	call DDividedByB
	ld a, e
	cp 9
	jr nz, .asm_111ea
	ld a, d
	call Func_11292
	ld h, $00
.asm_111ea
	ld a, h
	pop hl
	pop de
	ret

Func_111ee:
	push af
	push bc
	push de
	push hl
	ld b, $00
	push af
	ld c, a
	sla c
	rl b
	sla c
	rl b
	ld hl, $b800
	add hl, bc
	ld de, $cfb3
	ld c, $04
.asm_11207
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_11207
	pop af
	cp $c7
	jr nz, .asm_11215
	ld hl, $b800
.asm_11215
	xor a
	ld c, $04
.asm_11218
	ld [hli], a
	dec c
	jr nz, .asm_11218
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_11221:
	push af
	push de
	push hl
	call Func_1123b
	ld a, c
	cp $c7
	jr nz, .asm_11237
	ld a, [$cfb7]
	inc a
	jr nz, .asm_11234
	ld a, $ff
.asm_11234
	ld [$cfb7], a
.asm_11237
	pop hl
	pop de
	pop af
	ret

Func_1123b:
	push af
	push de
	push hl
	ld hl, $b800
	ld c, $00
.asm_11243
	ld a, c
	cp $c8
	jr nc, .asm_11268
	ld b, $00
	ld de, $526c
	call Func_11270
	cp $00
	jr z, .asm_11268
	inc b
	ld de, $cfb3
	call Func_11270
	cp $00
	jr z, .asm_11268
	push de
	ld de, $4
	add hl, de
	pop de
	inc c
	jr .asm_11243
.asm_11268
	pop hl
	pop de
	pop af
	ret
; 0x1126c

SECTION "Bank 4@5270", ROMX[$5270], BANK[$4]

Func_11270:
	push bc
	push de
	push hl
	ld b, $01
	ld a, [de]
	cp [hl]
	jr nz, .asm_1128d
	inc de
	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .asm_1128d
	inc de
	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .asm_1128d
	inc de
	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .asm_1128d
	ld b, $00
.asm_1128d
	ld a, b
	pop hl
	pop de
	pop bc
	ret

Func_11292:
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, .CardIDs
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	pop af
	ret

.CardIDs:
	dw CHANGE_SLIME
	dw FLAME_SWORDSMAN
	dw BATTLE_OX
	dw DRAGON_CAPTURE_JAR
	dw BABY_DRAGON
	dw ARMORED_LIZARD
	dw GOBLINS_REMEDY
	dw ELECTRO_WHIP
	dw SWORD_ARM_DRAGON
	dw SPELLBIND_CIRCLE
	dw TIME_WIZARD
	dw GYAKUTENNO_MEGAMI
	dw KOJIKOCY
	dw HERCULES_BEETLE
	dw OOKAZI
	dw CYBER_SHIELD
	dw MEGAZOWLER
	dw KAIRYU_SHIN
	dw SUMMONED_SKULL
	dw TREMENDOUS_FIRE

Func_112cb:
	push af
	push hl
	call Func_1154c
	call Func_101d
	call DisableLCD
	ld hl, $52f7
	call Func_10d9
	farcall Func_803e
	farcall Func_338b9
	call Func_11301
	call Func_113e4
	call Func_11449
	call EnableLCD
	call Func_100e
	call WaitForVBlank
	pop hl
	pop af
	ret
; 0x112f7

SECTION "Bank 4@5301", ROMX[$5301], BANK[$4]

Func_11301:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles0
	ld de, $531d
	ld b, $0c
.asm_1130d
	ld c, $10
.asm_1130f
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1130f
	dec b
	jr nz, .asm_1130d
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1131d

SECTION "Bank 4@53e4", ROMX[$53e4], BANK[$4]

Func_113e4:
	push af
	push bc
	push de
	push hl
	ld a, $10
	farcall Func_42d0
	xor a
.asm_113ee
	push af
	ld b, $00
	ld c, a
	ld hl, $5444
	add hl, bc
	ld d, h
	ld e, l
	ld b, $00
	ld c, a
	call Func_118f0
	ld h, b
	ld l, c
	ld b, $00
	ld a, [de]
	ld c, a
	farcall Func_42c5
	farcall Func_42ec
	call Func_111c
	ld de, $cab9
	ld a, $00
	ld [hli], a
	ld c, $08
.asm_11415
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_11415
	ld de, $17
	add hl, de
	ld de, $cab9
	ld a, $00
	ld [hli], a
	ld c, $08
.asm_1142d
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	ld [hli], a
	dec c
	jr nz, .asm_1142d
	pop af
	inc a
	cp $03
	jr c, .asm_113ee
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x11444

SECTION "Bank 4@5449", ROMX[$5449], BANK[$4]

Func_11449:
	push af
	push bc
	push de
	push hl
	call Func_1145b
	call Func_114aa
	call Func_114e9
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1145b:
	push af
	push bc
	push de
	push hl
	ld a, $12
	farcall Func_42d0
	farcall Func_42ec
	ld b, $02
	ld c, $00
	call Func_118f0
	push bc
	ld hl, hMainJobState
	add hl, bc
	call Func_111c
	ld de, $cab9
	ld a, $00
	ld [hli], a
	ld a, [$cacd]
	ld c, a
.asm_11480
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_11480
	pop bc
	ld h, b
	ld l, c
	ld de, $cab9
	ld a, $00
	ld [hli], a
	ld a, [$cacd]
	ld c, a
.asm_11499
	ld a, [de]
	inc de
	call Func_1144
	ld a, [$cad0]
	ld [hli], a
	dec c
	jr nz, .asm_11499
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_114aa:
	push af
	push bc
	push hl
	ld a, $00
	farcall Func_42d0
	ld b, $02
	ld c, $01
	call Func_118f0
	ld h, b
	ld l, c
	call Func_111ad
	ld [$cadc], a
	ld a, $00
	ld [$cadd], a
	call Func_142c
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
	ld a, $20
	ld [hli], a
	ld a, $38
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_114e9:
	push af
	push bc
	push de
	push hl
	ld a, $00
	farcall Func_42d0
	ld b, $02
	ld c, $02
	call Func_118f0
	ld h, b
	ld l, c
	push hl
	ld hl, $cf6e
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall Func_42c5
	farcall Func_42ec
	pop hl
	ld a, [$cab9]
	ld [hli], a
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	ld a, $18
	ld [hli], a
	ld a, $38
	ld [hli], a
	push hl
	ld hl, $cf90
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall Func_42c5
	farcall Func_42ec
	pop hl
	ld a, [$cab9]
	ld [hli], a
	ld a, [$caba]
	ld [hli], a
	ld a, [$cabb]
	ld [hli], a
	ld a, [$cabc]
	ld [hli], a
	ld a, $16
	ld [hli], a
	ld a, $3c
	ld [hli], a
	ld [hl], $0d
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1154c:
	push af
	ld a, $00
	ld [$cfbd], a
	pop af
	ret

Func_11554:
	push af
	push bc
	push de
	push hl
	call Func_1157b
	ld b, $00
	ld c, a
	ld hl, $5573
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
; 0x1156a

SECTION "Bank 4@557b", ROMX[$557b], BANK[$4]

Func_1157b:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_11594
	ld c, $08
.asm_11589
	dec c
	rlca
	jr nc, .asm_11589
	ld b, $00
	ld hl, $5599
	add hl, bc
	ld d, [hl]
.asm_11594
	ld a, d
	pop hl
	pop de
	pop bc
	ret
; 0x11599

SECTION "Bank 4@58f0", ROMX[$58f0], BANK[$4]

Func_118f0:
	push af
	push de
	push hl
	ld d, $00
	ld e, b
	ld hl, $5908
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, c
	sla e
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	pop de
	pop af
	ret
; 0x11908
