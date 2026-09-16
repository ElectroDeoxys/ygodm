	dw BANK(@)

	farcall_table_start
	farfunc GameLoop ; $03
	farfunc Func_10477 ; $05
	farfunc Func_10484 ; $07
	farfunc Func_104f5 ; $09
	farfunc Func_10505 ; $0b
	farfunc CampaignMenu ; $0d
	farfunc VersusMenu ; $0f
	farfunc TradeMenu ; $11
	farfunc Func_10741 ; $13
	farfunc Func_108f0 ; $15
	farfunc RecordsMenu ; $17
	farfunc Func_11196 ; $19
	farfunc Func_111ad ; $1b
	farfunc Func_112cb ; $1d
	farfunc Func_10a1b ; $1f

GameLoop::
	call InitJobs
	farcall Func_883d
	call Func_10484
	call Func_10505

	; condition to break from loop
	ld a, $00
	ld [wBeatCampaign], a

.loop
	ld a, [wBeatCampaign]
	cp $01
	jr z, .break
	farcall ResetMainMenuSelection
	farcall LoadMainMenu
	call PlayMusic_MainMenu
	farcall Func_e4fb
	jr .loop
.break
	ret

CampaignMenu:
	push af
	ld a, STAGE_IN_THE_SHIP
	ld [wCampaignStage], a
	call PlayMusic_Campaign
.loop
	ld a, [wCampaignStage]
	cp STAGE_IN_THE_SHIP
	jr nz, .check_duel_kingdom
	farcall Func_6804
	farcall Func_6622
	farcall Func_6736
	jr .restart
.check_duel_kingdom
	cp STAGE_DUEL_KINGDOM
	jr nz, .check_simon_muran
	farcall Func_64b5
	farcall Func_62c2
	farcall Func_63d6
	jr .restart
.check_simon_muran
	cp STAGE_SIMON_MURAN
	jr nz, .check_maximillion
	farcall Func_6a6e
	farcall Func_689e
	farcall Func_69b5
	jr .restart
.check_maximillion
	cp STAGE_MAXIMILLION
	jr nz, .check_yami_yugi
	farcall Func_6c67
	farcall Func_6a97
	farcall Func_6bae
	jr .restart
.check_yami_yugi
	cp STAGE_YAMI_YUGI
	jr nz, .check_exit
	farcall Func_6e41
	farcall Func_6c90
	farcall Func_6da7
	jr .restart
.check_exit
	cp STAGE_EXIT
	jr z, .check_start_duel
	cp STAGE_START_DUEL
	jr z, .check_start_duel
.restart
	jr .loop
.check_start_duel
	cp STAGE_START_DUEL
	jr nz, .exit
	call DuelAgainstAIOpponent
.exit
	pop af
	ret

DuelAgainstAIOpponent:
	push af
	push bc
	farcall Func_b52c
	farcall Func_cbe9
	farcall Func_cb87
	call PlayMusic_DuelPrep

	farcall DuelPrepMenu
	ld c, 10
.wait
	call WaitForVBlank
	dec c
	jr nz, .wait
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
	call PlayDuelMusic

.loop
	; player's turn
	farcall Func_d014
	call IsDuelOngoing
	cp FALSE
	jr z, .duel_finished
	farcall Func_1501f
	call Func_2391

	; opponent's turn
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

	; wait 100 frames
	ld c, 100
.wait
	call WaitForVBlank
	dec c
	jr nz, .wait
	call Func_10124
	pop bc
	pop af
	ret

Func_10124:
	push af
	ld a, [wDuelStatus]
	cp DUELSTATUS_PLAYER_WIN
	jr nz, .asm_10137
	farcall Func_b547
	farcall Func_b62d
	farcall Func_b679
	jr .asm_1013e
.asm_10137
	cp DUELSTATUS_PLAYER_LOSS
	jr nz, .asm_1013e
	farcall Func_b562
.asm_1013e
	pop af
	ret

VersusMenu:
	push af
	ldh a, [hConsole]
	cp CONSOLE_SGB2
	jr nz, .not_sgb2
	farcall Func_b916
	jr .asm_1016b
.not_sgb2
	call .CheckPlayerCards
	cp TRUE
	jr z, .has_enough_cards
	farcall Func_b7ee
	jr .asm_1016b
.has_enough_cards
	farcall Func_cbe9
	farcall Func_cb87
	call PlayMusic_DuelPrep
	farcall DuelPrepMenu
	cp $00
	jr nz, .asm_1016b
	farcall DuelAgainstLinkOpponent
.asm_1016b
	pop af
	ret

; returns TRUE if the player has at least 50 total cards
.CheckPlayerCards:
	push bc
	push de
	ld e, TRUE
	farcall GetTrunkTotalCardCount
	farcall GetPlayerDeckCardCount
	add c
	ld c, a
	ld a, 0
	adc b
	ld b, a
	ld a, b
	cp HIGH(DECK_SIZE + 10)
	jr nz, .true
	ld a, c
	cp LOW(DECK_SIZE + 10)
	jr nc, .true
	ld e, FALSE
.true
	ld a, e
	pop de
	pop bc
	ret

TradeMenu:
	push af
	ldh a, [hConsole]
	cp CONSOLE_SGB2
	jr nz, .not_sgb2
	farcall Func_b916
	jr .asm_101bb
.not_sgb2
	call .CheckPlayerCards
	cp TRUE
	jr z, .asm_101a5
	farcall Func_b7ee
	jr .asm_101bb
.asm_101a5
	farcall Func_cbe9
	farcall Func_e711
	farcall Func_e7eb
	call PlayMusic_DuelPrep
	farcall Func_e84e
	cp $00
	jr nz, .asm_101bb
	call .Func_101bd
.asm_101bb
	pop af
	ret

.Func_101bd:
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

; returns TRUE if the player has at least 50 total cards
.CheckPlayerCards:
	push bc
	push de
	ld e, TRUE
	farcall GetTrunkTotalCardCount
	farcall GetPlayerDeckCardCount
	add c
	ld c, a
	ld a, 0
	adc b
	ld b, a
	ld a, b
	cp HIGH(DECK_SIZE + 10)
	jr nz, .true
	ld a, c
	cp LOW(DECK_SIZE + 10)
	jr nc, .true
	ld e, FALSE
.true
	ld a, e
	pop de
	pop bc
	ret

Func_101f8:
	call InitAITurnVariables
	farcall HandleOpponentPetitMothEvolution
	call AIPickHandCardToPlay
	call AIPickFieldZoneToPlayCard
	call AIPlayMonsterCard
	farcall Func_c1bc
	farcall Func_c1f1
	ret

InitAITurnVariables:
	push af
	ld a, LOW(INVALID_CARD)
	ld [wAIOppHandTargetCardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wAIOppHandTargetCardID + 1], a
	ld a, $00
	ld [wAIOppHandTargetCardIndex], a
	ld a, CARD_LOCATION_OPP_HAND
	ld [wAIOppHandTargetCardLocation], a
	ld a, LOW(INVALID_CARD)
	ld [wAIOppFieldTargetCardID + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wAIOppFieldTargetCardID + 1], a
	ld a, $00
	ld [wAIOppFieldTargetZoneIndex], a
	ld a, $00
	ld [wAIOppFieldTargetZoneLocation], a
	farcall ClearFusionCards
	pop af
	ret

AIPickHandCardToPlay:
	push af
	push bc
	push hl

	; find first valid card in hand
	ld b, $00
.loop_hand
	ld c, CARD_LOCATION_OPP_HAND
	call SetTargetCard
	call LoadTargetCard
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr z, .valid_card
	inc b
	ld a, b
	cp HAND_SIZE
	jr c, .loop_hand
.valid_card
	ld a, b
	cp HAND_SIZE
	jr z, .done

	; store its location and ID
	ld a, b
	ld [wAIOppHandTargetCardIndex], a
	ld a, c
	ld [wAIOppHandTargetCardLocation], a
	ld a, [wTempCardID + 0]
	ld [wAIOppHandTargetCardID + 0], a
	ld a, [wTempCardID + 1]
	ld [wAIOppHandTargetCardID + 1], a

.done
	pop hl
	pop bc
	pop af
	ret

AIPickFieldZoneToPlayCard:
	push af
	push bc
	push hl

	; find first empty zone in field
	ld b, $00
.loop_field
	ld c, CARD_LOCATION_OPP_FIELD
	call SetTargetCard
	call LoadTargetCard
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .no_card
	; not empty, next zone
	inc b
	ld a, b
	cp FIELD_SIZE
	jr c, .loop_field
.no_card
	; either found an empty zone
	; or there are no empty zones in field
	ld a, b
	cp FIELD_SIZE
	jr nz, .is_empty
	ld b, $00
.is_empty

	; store its location (and ID if there's a card)
	ld a, b
	ld [wAIOppFieldTargetZoneIndex], a
	ld a, c
	ld [wAIOppFieldTargetZoneLocation], a
	ld a, [wTempCardID + 0]
	ld [wAIOppFieldTargetCardID + 0], a
	ld a, [wTempCardID + 1]
	ld [wAIOppFieldTargetCardID + 1], a
	pop hl
	pop bc
	pop af
	ret

AIPlayMonsterCard:
	push af
	push bc

	; can we fuse the monsters in hand and field?
	ld a, [wAIOppFieldTargetZoneIndex]
	ld b, a
	ld c, CARD_LOCATION_OPP_FIELD
	call SetTargetCard
	call LoadTargetCard
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall SetMaterial1Card
	ld a, [wAIOppHandTargetCardIndex]
	ld b, a
	ld c, CARD_LOCATION_OPP_HAND
	call SetTargetCard
	call LoadTargetCard
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall SetMaterial2Card
	farcall AttemptFusionSummon
	cp TRUE
	jr nz, .no_fusion
	; we can, fuse them
	farcall Func_ef1d
	jr .done
.no_fusion
	; we cannot, play card over field card
	farcall Func_eebf

.done
	pop bc
	pop af
	ret

Func_10302:
	push af
	push bc
	call Func_10340
	ld a, $00
	ld [wCardLocationIndex_cef7], a
.loop_field
	ld a, [wCardLocationIndex_cef7]
	cp FIELD_SIZE
	jr nc, .break
	call Func_2217
	farcall Func_e1f2
	call Func_10370
	cp TRUE
	jr nz, .asm_10323
	call Func_1039c
.asm_10323
	ld a, [wCardLocationIndex_cef7]
	add 1
	ld [wCardLocationIndex_cef7], a
	call IsDuelOngoing
	cp FALSE
	jr z, .break
	jr .loop_field
.break
	call Func_2bbf
	call Func_2bfe
	farcall Func_c772
	pop bc
	pop af
	ret

Func_10340:
	push af
	ld a, LOW(INVALID_CARD)
	ld [wCardID_cef0 + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wCardID_cef0 + 1], a
	ld a, $00
	ld [wcef2], a
	ld a, $00
	ld [wCardLocationIndex_cef7], a
	ld a, $01
	ld [wcef8], a
	ld a, LOW(INVALID_CARD)
	ld [wCardID_cef9 + 0], a
	ld a, HIGH(INVALID_CARD)
	ld [wCardID_cef9 + 1], a
	ld a, $00
	ld [wcf00], a
	ld a, $00
	ld [wcf01], a
	pop af
	ret

Func_10370:
	push bc
	push de
	push hl
	ld e, FALSE
	ld a, [wCardLocationIndex_cef7]
	ld b, a
	ld c, CARD_LOCATION_OPP_FIELD
	call SetTargetCard
	call LoadTargetCard
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsValidCard
	pop bc
	cp TRUE
	jr nz, .no_card
	call Func_10433
	ld e, TRUE
.no_card
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
	ld a, [wCardLocationIndex_cef7]
	ld b, a
	ld a, [wcef8]
	ld c, a
	farcall Func_e285
	call SetTargetCard
	call LoadTargetCard
	call Func_21d9
	call OverwriteTargetCard
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
	ld a, [wCardLocationIndex_cef7]
	ld b, a
	ld a, [wcef8]
	ld c, a
	call SetTargetCard
	call LoadTargetCard
	call Func_21e6
	call OverwriteTargetCard
	pop bc
	pop af
	ret

Func_10414:
	push af
	push bc
	ld a, [wCardLocationIndex_cef7]
	ld b, a
	ld a, [wcef8]
	ld c, a
	farcall Func_e285
	call SetTargetCard
	call LoadTargetCard
	call Func_21d9
	call OverwriteTargetCard
	farcall Func_e407
	pop bc
	pop af
	ret

Func_10433:
	push af
	ld a, [wTempCardID + 0]
	ld [wCardID_cef0 + 0], a
	ld a, [wTempCardID + 1]
	ld [wCardID_cef0 + 1], a
	ld a, $02
	ld [wcef2], a
	ld a, b
	ld [wCardLocationIndex_cef7], a
	ld a, c
	ld [wcef8], a
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
	call SetTargetCard
	call LoadTargetCard
	ld a, [wTempCardID + 0]
	ld [wCardID_cef9 + 0], a
	ld a, [wTempCardID + 1]
	ld [wCardID_cef9 + 1], a
	ld a, b
	ld [wcf00], a
	ld a, c
	ld [wcf01], a
	pop af
	ret

Func_10477::
	push af
	ld a, $00
	ld [wcf16], a
	ld a, $00
	ld [wcf17], a
	pop af
	ret

Func_10484:
	push af
	ld a, $00
	ld [wcf17], a
	call CheckSaveDataMagic
	cp FALSE
	jr nz, .valid_magic
; invalid magic numbers
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [wcf17], a
.valid_magic
	call CheckSaveDataChecksum
	cp FALSE
	jr nz, .valid_checksum
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [wcf17], a
.valid_checksum
	call Func_1050f
	pop af
	ret

Func_104b3:
	call ClearSRAM
	call Func_104e2
	call WriteSaveDataMagic
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
	ld a, [sb7f0]
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
	ld hl, sSaveData
	ld de, sBackupSaveData
	ld c, $f8
.loop_lo
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_lo
	ld b, $0b
.loop_hi
	ld c, $00 ; aka $100
.loop_100_bytes
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_100_bytes
	dec b
	jr nz, .loop_hi
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
	ld hl, sSaveData
	ld de, sBackupSaveData
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
	call CalculateSaveDataChecksum
	ld b, $00
	ld a, [wcf16]
	ld c, a
	sla c
	ld hl, SaveDataChecksumPointers
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

SaveDataChecksumPointers:
	dw sSaveDataChecksum
	dw sBackupSaveDataChecksum

CalculateSaveDataChecksum:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wcf16]
	ld c, a
	sla c
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; calculate sum of $bf6 bytes in hl
	ld de, 0
	ld c, LOW($bf6)
.loop_lo
	ld a, [hli]
	add e
	ld e, a
	adc d
	ld d, a
	dec c
	jr nz, .loop_lo
	ld b, HIGH($bf6)
.loop_hi
	ld c, $00 ; aka $100
.loop_100_bytes
	ld a, [hli]
	add e
	ld e, a
	adc d
	ld d, a
	dec c
	jr nz, .loop_100_bytes
	dec b
	jr nz, .loop_hi
	pop hl
	pop bc
	pop af
	ret

.PtrTable:
	dw sSaveData
	dw sBackupSaveData

; returns TRUE if save data checksum checks out
CheckSaveDataChecksum:
	push bc
	push de
	push hl
	ld a, [sb7f0]
	cp $03
	jr c, .asm_105ca
	ld a, FALSE
	jr .done
.asm_105ca
	ld b, TRUE
	ld a, [sb7f0]
	ld c, a
	ld hl, Data_105fb
	add hl, bc
	ld a, [hl]
	ld [wcf16], a
	call CalculateSaveDataChecksum

	; check if saved checksum is valid
	ld b, TRUE
	ld a, [wcf16]
	ld c, a
	sla c
	ld hl, SaveDataChecksumPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	cp e
	jr z, .equal_hi
	ld b, FALSE
.equal_hi
	ld a, [hl]
	cp d
	jr z, .equal_lo
	ld b, FALSE
.equal_lo
	ld a, b
.done
	pop hl
	pop de
	pop bc
	ret

Data_105fb:
	db $01, $01, $00

Func_105fe:
	push af
	ld a, $00
	ld [sb7f0], a
	ld a, $00
	ld [wcf16], a
	pop af
	ret

Func_1060b:
	push af
	ld a, $01
	ld [sb7f0], a
	ld a, $00
	ld [wcf16], a
	pop af
	ret

Func_10618:
	push af
	ld a, $02
	ld [sb7f0], a
	ld a, $01
	ld [wcf16], a
	pop af
	ret

; unreferenced
Func_10625:
	push af
	push bc
	push de
	push hl
	call CalculateSaveDataChecksum
	ld b, $00
	ld a, [wcf16]
	ld c, a
	ld hl, .ChecksumPtrs
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

.ChecksumPtrs:
	dw sSaveDataChecksum
	dw sBackupSaveDataChecksum

; writes magic numbers SaveDataMagic to sMagicNumbers
WriteSaveDataMagic:
	push af
	push bc
	push de
	push hl
	ld hl, sMagicNumbers
	ld de, SaveDataMagic
	ld c, SaveDataMagic.end - SaveDataMagic
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

; returns TRUE if sMagicNumbers
; has magic numbers SaveDataMagic
CheckSaveDataMagic:
	push bc
	push de
	push hl
	ld b, TRUE
	ld hl, sMagicNumbers
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
	ld de, sSaveData
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
	ld de, sSaveData
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
	dwb wce99, $04 ; sUnk_ce99
	dwb wcfaf, $04 ; sUnk_cfaf
	dwb wcfb7, $01 ; sUnk_cfb7
	dwb wcfdf, $02 ; sUnk_cfdf
	dwb wPlayerDeck, DECK_SIZE * $2 ; sPlayerDeck
	dwb wTrunk, $ff ; sTrunk
	dwb wTrunk + $ff, LOW(NUM_CARDS - $ff)
	dwb wDuelistDuelCounts, NUM_DUELISTS * $2 ; sDuelistDuelCounts
	dwb wDuelistWinCounts, NUM_DUELISTS * $2 ; sDuelistWinCounts
	dwb wcf99, $08 ; sUnk_cf99
	dwb sb800, $c8 ; sUnk_b800
	dwb sb8c8, $c8 ; sUnk_b8c8
	dwb sb990, $c8 ; sUnk_b990
	dwb sba58, $c8 ; sUnk_ba58
	dw NULL

Func_10709:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wcf95]
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	ld [wcf96], a
	pop hl
	pop bc
	pop af
	ret

.data
	db $00, $01

; unreferenced
Func_10721:
	push af
	ld a, [wcf96]
	add $01
	cp $02
	jr nz, .asm_1072b
	xor a
.asm_1072b
	ld [wcf96], a
	pop af
	ret

; unreferenced
Func_10730:
	push af
	ld a, [wcf96]
	sub $01
	cp $ff
	jr nz, .asm_1073c
	ld a, $01
.asm_1073c
	ld [wcf96], a
	pop af
	ret

Func_10741:
	ld [wcf95], a
	call Func_10709
	call Func_1074e
	call Func_108d1
	ret

Func_1074e:
	push af
	push bc
	push hl
	ld a, VBLANK_10
	call SetPendingVBlankMode
	ld b, $00
	ld a, [wcf95]
	ld c, a
	sla c
	ld hl, .ptrs
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
	ld hl, TILEMAP_WIDTH
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

.ptrs
	dw .Tiles1
	dw .Tiles2

.Tiles1:
	db $d3, $d3, $d3, $7d, $d3, $d4, $00, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3
	db $00, $14, $0d, $13, $11, $d6, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $71, $00, $d6, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $16, $3b, $25, $00, $d6, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $d8, $d8, $d8, $d8, $d8, $d9, $00, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8

.Tiles2:
	db $d3, $7d, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3
	db $03, $1e, $1e, $00, $10, $0e, $31, $34, $29, $18, $38, $00, $00, $00, $00, $24, $0c, $00
	db $00, $00, $00, $00, $00, $71, $00, $00, $00, $71, $00, $00, $00, $00, $00, $00, $00, $00
	db $14, $23, $1f, $29, $0e, $1d, $00, $0c, $0c, $1d, $17, $10, $75, $00, $00, $0c, $0c, $0e
	db $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8

Func_10846:
	push af
	push bc
	push hl
	ld a, VBLANK_10
	call SetPendingVBlankMode
	ld hl, .Tiles
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
	ld hl, TILEMAP_WIDTH
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

.Tiles:
	db $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3, $d3
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8

Func_108d1:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [wcf95]
	ld c, a
	ld hl, .XPositions
	add hl, bc
	ld a, [hl]
	ldh [rWY], a
	ld hl, .YPositions
	add hl, bc
	ld a, [hl]
	ldh [rWX], a
	pop hl
	pop bc
	pop af
	ret

.XPositions:
	db $67, $67

.YPositions:
	db $6e, $07

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
	ld a, [wcf95]
	cp $01
	jr z, .asm_10917
	ld a, VBLANK_04
	call SetPendingVBlankMode
	farcall Func_cefb
	call RequestVBlankMode
	call WaitForVBlank
.asm_10917
	pop af
	ret

RecordsMenu:
	call Func_112cb
	call PlayMusic_Campaign
	call Func_11554
	ret

; unreferenced
Func_10923:
	push af
	push bc
	push de
	push hl
	ld hl, wcf99
	ld de, Data_1093a
	ld c, $08
.asm_1092f
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1092f
	pop hl
	pop de
	pop bc
	pop af
	ret

Data_1093a:
	ds $8, $0

Func_10942:
	push af
	push bc
	push de
	push hl
	ld hl, wcfa1
	ld de, Data_1093a
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

Func_10959:
	push bc
	push de
	push hl
	ld hl, wcfa1
	ld de, Data_1093a
	ld b, $01
	ld c, $08
.asm_10966
	ld a, [de]
	cp [hl]
	jr z, .asm_1096c
	ld b, $00
.asm_1096c
	inc de
	inc hl
	dec c
	jr nz, .asm_10966
	ld a, b
	pop hl
	pop de
	pop bc
	ret

Func_10976:
	push af
	push bc
	push hl
	ld c, $00
	ld hl, wce99
	ld a, [wcf99]
	add [hl]
	ld b, a
	ld a, [wcf9d]
	adc b
	ld [hli], a
	jr z, .asm_1098b
	inc c
.asm_1098b
	ld a, [wcf9a]
	add [hl]
	ld b, a
	ld a, [wcf9e]
	adc b
	ld [hli], a
	jr z, .asm_10998
	inc c
.asm_10998
	ld a, [wcf9b]
	add [hl]
	ld b, a
	ld a, [wcf9f]
	adc b
	ld [hli], a
	jr z, .asm_109a5
	inc c
.asm_109a5
	ld a, [wcf9c]
	add [hl]
	ld b, a
	ld a, [wcfa0]
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
	ld hl, wcf99
	ld de, wcfa1
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

Func_109d7:
	push af
	push bc
	push hl
	ld a, b
	ld b, $00
	ld hl, wcfa1
	add hl, bc
	ld [hl], a
	pop hl
	pop bc
	pop af
	ret

Func_109e6:
	push bc
	push hl
	ld b, $00
	ld hl, wcfa1
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

Func_109f2:
	push af
	call SeedRNG
	call Func_10942
	call Func_10b1f
	farcall Func_b823
	ld a, $00
	ld [wcf98], a
.loop
	ld a, [wcfa9]
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

Func_10a1b:
	push af
	call Func_10942
	call Func_10b1f
	farcall Func_b840
	ld a, $01
	ld [wcf98], a
.asm_10a2a
	ld a, [wcfa9]
	cp $03
	jr z, .asm_10a39
	call Func_10a3e
	call Func_11084
	jr .asm_10a2a
.asm_10a39
	farcall Func_370e6
	pop af
	ret

Func_10a3e:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, ScreenConfig_10a70
	call SetScreenConfig
	farcall LoadFontToVTiles2
	ld a, [wcfa9]
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

ScreenConfig_10a70:
	db LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_ON | LCDC_WIN_9C00 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 144 ; WY
	db 159 + WX_OFS ; WX

Func_10a7a:
	call ClearOAM
	call Func_10fe0
	call Func_10a87
	call CopyOAMDirect
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
	ld de, wcfa1
	ld c, $08
.loop
	ld a, [de]
	inc de
	call ProcessChar
	push hl
	push bc
	ld bc, TILEMAP_WIDTH
	add hl, bc
	ld a, [wCharTile]
	ld [hl], a
	pop bc
	pop hl
	ld a, [wCharHeadTile]
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
	ld [wcfa9], a
	ld a, $00
	ld [wcfaa], a
	ld a, $01
	ld [wcfab], a
	ld a, $00
	ld [wcfac], a
	pop af
	ret

Func_10b36:
	push bc
	push hl
	ld a, [wcfa9]
	cp $02
	jr z, .asm_10b44
	call Func_10b4a
	jr .asm_10b47
.asm_10b44
	call Func_10d76
.asm_10b47
	pop hl
	pop bc
	ret

Func_10b4a:
	push bc
	push hl
	ld a, [wcfab]
	ld e, a
	ld b, $09
	call BTimesE
	ld b, $00
	ld a, [wcfaa]
	ld c, a
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wcfa9]
	cp $00
	jr nz, .asm_10b6a
	ld hl, .data_1
	jr .asm_10b6d
.asm_10b6a
	ld hl, .data_2
.asm_10b6d
	add hl, bc
	ld a, [hl]
	call Func_10bf6
	call Func_10db8
	pop hl
	pop bc
	ret

.data_1
	db $f1, $f0, $f0, $f0, $f0, $f0, $f0, $f2, $f0, $0b, $10, $15, $1a, $1f, $24, $29
	db $2e, $31, $0c, $11, $16, $1b, $20, $25, $2a, $2f, $32, $0d, $12, $17, $1c, $21
	db $26, $2b, $30, $33, $0e, $13, $18, $1d, $22, $27, $2c, $36, $34, $0f, $14, $19
	db $1e, $23, $28, $2d, $38, $35, $39, $3a, $3b, $3c, $00, $f5, $f6, $f3, $f0
	
.data_2
	db $f4, $f0, $f0, $f0, $f0, $f0, $f0, $f2, $f0, $3d, $42, $47, $4c, $51, $56, $5b
	db $60, $63, $3e, $43, $48, $4d, $52, $57, $5c, $61, $32, $3f, $44, $49, $4e, $53
	db $58, $5d, $62, $65, $40, $45, $4a, $4f, $54, $27, $5e, $68, $66, $41, $46, $4b
	db $50, $55, $5a, $5f, $6a, $67, $6d, $6e, $6f, $70, $73, $f5, $f6, $f0, $f0

Func_10bf6:
	push bc
	push hl
	cp $f0
	jr c, .asm_10c11
	sub $f0
	ld c, a
	sla c
	ld b, $00
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	jr .asm_10c14
.asm_10c11
	call Func_10d5e
.asm_10c14
	pop hl
	pop bc
	ret

.Jumptable:
	dw Func_10c25
	dw Func_10c27
	dw Func_10c2f
	dw Func_10c37
	dw Func_10c4e
	dw Func_10c56
	dw Func_10cf8

Func_10c25:
	xor a
	ret

Func_10c27:
	ld a, $01
	ld [wcfa9], a
	ld a, $01
	ret

Func_10c2f:
	call Func_11075
	call Func_2ad9
	xor a
	ret

Func_10c37:
	ld a, $02
	ld [wcfa9], a
	ld a, $06
	ld [wcfab], a
	ld a, $01
	call Func_10741
	call Func_10db8
	call Func_2ae4
	xor a
	ret

Func_10c4e:
	ld a, $00
	ld [wcfa9], a
	ld a, $01
	ret

Func_10c56:
	push bc
	push de
	push hl
	ld de, NULL
	ld a, [wcfac]
	ld c, a
	cp $00
	jr z, .asm_10c92
	dec c
	call Func_109e6
	ld b, a
	ld hl, .data_1
.asm_10c6c
	ld a, [hli]
	cp $00
	jr z, .asm_10c7b
	cp b
	jr nz, .asm_10c78
	ld d, $01
	jr .asm_10c7b
.asm_10c78
	inc e
	jr .asm_10c6c
.asm_10c7b
	ld a, d
	cp $01
	jr nz, .asm_10c92
	ld d, $00
	ld hl, .data_2
	add hl, de
	ld b, [hl]
	ld a, [wcfac]
	ld c, a
	dec c
	call Func_109d7
	call Func_2ae4
.asm_10c92
	xor a
	pop hl
	pop de
	pop bc
	ret

.data_1
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $24
	db $25, $26, $27, $28, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d
	db $4e, $4f, $50, $56, $57, $58, $5a, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $af
	db $00 ; end

.data_2
	db $7e, $7f, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d
	db $8e, $8f, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d
	db $9e, $9f, $a0, $a1, $a2, $a3, $a5, $8d, $8e, $8f, $90, $91, $a1, $a2, $a3, $a5

Func_10cf8:
	push bc
	push de
	push hl
	ld de, NULL
	ld a, [wcfac]
	ld c, a
	cp $00
	jr z, .asm_10d34
	dec c
	call Func_109e6
	ld b, a
	ld hl, .data_1
.asm_10d0e
	ld a, [hli]
	cp $00
	jr z, .asm_10d1d
	cp b
	jr nz, .asm_10d1a
	ld d, $01
	jr .asm_10d1d
.asm_10d1a
	inc e
	jr .asm_10d0e
.asm_10d1d
	ld a, d
	cp $01
	jr nz, .asm_10d34
	ld d, $00
	ld hl, .data_2
	add hl, de
	ld b, [hl]
	ld a, [wcfac]
	ld c, a
	dec c
	call Func_109d7
	call Func_2ae4
.asm_10d34
	xor a
	pop hl
	pop de
	pop bc
	ret

.data_1
	db $24, $25, $26, $27, $28, $56, $57, $58, $5a, $8d, $8e, $8f, $90, $91, $a1, $a2, $a3, $a5
	db $00 ; end

.data_2
	db $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $af, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $af

Func_10d5e:
	push bc
	push hl
	ld b, a
	ld a, [wcfac]
	ld c, a
	cp $08
	jr z, .asm_10d6f
	call Func_109d7
	call Func_2ae4
.asm_10d6f
	call Func_11067
	xor a
	pop hl
	pop bc
	ret

Func_10d76:
	ld a, [wcfab]
	cp $05
	jr nz, .asm_10da3
	call Func_10959
	cp $00
	jr nz, .asm_10d8d
	ld a, $03
	ld [wcfa9], a
	ld a, $01
	jr .asm_10da1
.asm_10d8d
	ld a, $00
	ld [wcfa9], a
	call Func_108f0
	ld a, $06
	ld [wcfab], a
	call Func_10db8
	call Func_2ad9
	xor a
.asm_10da1
	jr .asm_10db7
.asm_10da3
	ld a, $00
	ld [wcfa9], a
	call Func_108f0
	ld a, $06
	ld [wcfab], a
	call Func_10db8
	call Func_2ad9
	xor a
.asm_10db7
	ret

Func_10db8:
	push af
	push bc
	push hl
	ld a, VBLANK_0E
	call SetPendingVBlankMode
	bcbgcoord 6, 0
	call AddWordToVBlankStruct
	ld hl, wcfa1
	ld c, $08
.asm_10dcb
	ld a, [hli]
	call ProcessChar
	ld a, [wCharHeadTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_10dcb
	bcbgcoord 6, 1
	call AddWordToVBlankStruct
	ld hl, wcfa1
	ld c, $08
.asm_10de3
	ld a, [hli]
	call ProcessChar
	ld a, [wCharTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_10de3
	call Func_10fe0
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop bc
	pop af
	ret

Func_10dfd:
	push af
	push bc
	ld a, [wcfa9]
	cp $02
	jr z, .asm_10e14
	call Func_11075
	ld b, $00
	ld a, [wcfac]
	ld c, a
	call Func_109d7
	jr .asm_10e21
.asm_10e14
	ld a, $00
	ld [wcfa9], a
	call Func_108f0
	ld a, $06
	ld [wcfab], a
.asm_10e21
	call Func_10db8
	call Func_2ad9
	pop bc
	pop af
	ret

Func_10e2a:
	push af
	push bc
	push de
	push hl
	ld a, [wcfab]
	ld e, a
	ld a, [wcfa9]
	cp $02
	jr z, .asm_10e6a
	cp $00
	jr nz, .asm_10e42
	ld hl, .ptrs_1
	jr .asm_10e45
.asm_10e42
	ld hl, .ptrs_2
.asm_10e45
	ld b, $00
	ld a, [wcfab]
	ld c, a
	sla c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcfaa]
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wcfaa], a
	ld a, [wcfab]
	cp $06
	jr z, .asm_10e68
	ld a, [wcfab]
	inc a
	ld [wcfab], a
.asm_10e68
	jr .asm_10e6f
.asm_10e6a
	ld a, $06
	ld [wcfab], a
.asm_10e6f
	ld a, [wcfab]
	cp e
	jr z, .asm_10e78
	call Func_2aef
.asm_10e78
	pop hl
	pop de
	pop bc
	pop af
	ret

.ptrs_1
	dw .data_1
	dw .data_1
	dw .data_1
	dw .data_1
	dw .data_1
	dw .data_2
	dw .data_2

.ptrs_2
	dw .data_1
	dw .data_1
	dw .data_1
	dw .data_1
	dw .data_1
	dw .data_2
	dw .data_1

.data_1
	db $00, $01, $02, $03, $04, $05, $06, $07, $08
.data_2
	db $00, $01, $02, $03, $04, $05, $06, $07, $07

Func_10eab:
	push af
	push bc
	push de
	push hl
	ld a, [wcfab]
	ld e, a
	ld a, [wcfa9]
	cp $02
	jr z, .asm_10ee2
	ld b, $00
	ld a, [wcfab]
	ld c, a
	sla c
	ld hl, .ptrs
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcfaa]
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wcfaa], a
	ld a, [wcfab]
	cp $00
	jr z, .asm_10ee0
	ld a, [wcfab]
	dec a
	ld [wcfab], a
.asm_10ee0
	jr .asm_10ee7
.asm_10ee2
	ld a, $05
	ld [wcfab], a
.asm_10ee7
	ld a, [wcfab]
	cp e
	jr z, .asm_10ef0
	call Func_2aef
.asm_10ef0
	pop hl
	pop de
	pop bc
	pop af
	ret

.ptrs
	dw .data_1
	dw .data_2
	dw .data_3
	dw .data_3
	dw .data_3
	dw .data_3
	dw .data_3

.data_1
	db $00, $07
.data_2
	db $00, $00, $00, $00, $00, $07, $07, $07, $07
.data_3
	db $00, $01, $02, $03, $04, $05, $06, $07, $08

Func_10f17:
	push af
	push bc
	push de
	push hl
	ld a, [wcfa9]
	cp $02
	jr z, .asm_10f50
	ld a, [wcfaa]
	ld e, a
	cp $00
	jr nz, .asm_10f2f
	ld hl, .ptrs_1
	jr .asm_10f32
.asm_10f2f
	ld hl, .ptrs_2
.asm_10f32
	ld b, $00
	ld a, [wcfab]
	ld c, a
	sla c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcfaa]
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wcfaa], a
	ld a, [wcfaa]
	cp e
	jr z, .asm_10f50
	call Func_2aef
.asm_10f50
	pop hl
	pop de
	pop bc
	pop af
	ret

.ptrs_1
	dw .data_1
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_3

.ptrs_2
	dw .data_1
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_3

.data_1
	db $07, $00, $00, $00, $00, $00, $00, $07
.data_2
	db $01, $02, $03, $04, $05, $06, $07, $08, $08
.data_3
	db $01, $02, $03, $04, $05, $06, $07, $07

Func_10f8a:
	push af
	ld a, [wcfa9]
	cp $02
	jr z, .asm_10fb7
	ld a, [wcfaa]
	ld e, a
	ld b, $00
	ld a, [wcfab]
	ld c, a
	sla c
	ld hl, .ptrs
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcfaa]
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wcfaa], a
	ld a, [wcfaa]
	cp e
	jr z, .asm_10fb7
	call Func_2aef
.asm_10fb7
	pop af
	ret

.ptrs
	dw .data_1
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_2
	dw .data_3

.data_1
	db $00, $00, $00, $00, $00, $00, $00, $00
.data_2
	db $00, $00, $01, $02, $03, $04, $05, $06, $07
.data_3
	db $00, $00, $01, $02, $03, $04, $05, $06

Func_10fe0:
	push af
	push bc
	push de
	push hl
	lb bc, 0, 0
	ld a, [wcfaa]
	call Func_11024
	ld d, a
	ld a, [wcfab]
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
	ld hl, .data
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.data
	db $10, $20, $30, $40, $50, $60, $70, $80, $90

Func_1103a:
	push bc
	push hl
	ld b, $00
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.data
	db $30, $40, $50, $60, $70, $80, $90

Func_1104e:
	push bc
	push hl
	ld b, $00
	ld a, [wcfac]
	ld c, a
	ld hl, .data
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.data
	db $34, $3c, $44, $4c, $54, $5c, $64, $6c, $d0

Func_11067:
	push af
	ld a, [wcfac]
	cp $08
	jr z, .asm_11073
	inc a
	ld [wcfac], a
.asm_11073
	pop af
	ret

Func_11075:
	push af
	ld a, [wcfac]
	cp $00
	jr z, .asm_11081
	dec a
	ld [wcfac], a
.asm_11081
	pop af
	ret

	ret ; stray ret

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
	dw Func_110fb
	dw Func_11110
	dw Func_11120
	dw Func_11133
	dw Func_11146
	dw Func_11159

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

Func_110fb:
	push bc
	push hl
	call Func_10b36
	push af
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	pop af
	pop hl
	pop bc
	ret

Func_11110:
	call Func_10dfd
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_11120:
	call Func_10eab
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_10fe0
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_11133:
	call Func_10e2a
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_10fe0
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_11146:
	call Func_10f17
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_10fe0
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_11159:
	call Func_10f8a
	ld a, VBLANK_04
	call SetPendingVBlankMode
	call Func_10fe0
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_1116c:
	push af
	push bc
	push de
	push hl
	ld hl, wce99
	ld de, wcfaf
	ld c, $04
.asm_11178
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_11178
	ld hl, sb800
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
	ld [wcfb7], a
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
	ld hl, wcfb3
	xor a
	ld c, $04
.asm_111b5
	ld [hli], a
	dec c
	jr nz, .asm_111b5
	ld c, $c8
	ld a, [wcfb7]
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
	ld hl, sb800
	add hl, bc
	ld de, wcfb3
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
	ld hl, sb800
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
	ld a, [wcfb7]
	inc a
	jr nz, .asm_11234
	ld a, $ff
.asm_11234
	ld [wcfb7], a
.asm_11237
	pop hl
	pop de
	pop af
	ret

Func_1123b:
	push af
	push de
	push hl
	ld hl, sb800
	ld c, $00
.asm_11243
	ld a, c
	cp $c8
	jr nc, .asm_11268
	ld b, $00
	ld de, .data
	call Func_11270
	cp $00
	jr z, .asm_11268
	inc b
	ld de, wcfb3
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

.data
	db $00, $00, $00, $00

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
	ld hl, ScreenConfig_112f7
	call SetScreenConfig
	farcall LoadFontToVTiles2
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

ScreenConfig_112f7:
	db LCDC_BG_ON | LCDC_OBJ_OFF | LCDC_OBJ_8 | LCDC_BG_9800 | LCDC_BLOCK21 | LCDC_WIN_OFF | LCDC_WIN_9800 ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; BGP
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP0
	dbpal SHADE_WHITE, SHADE_WHITE, SHADE_WHITE, SHADE_WHITE ; OBP1
	db 144 ; WY
	db 159 + WX_OFS ; WX

Func_11301:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles0
	ld de, Gfx_1131d
	ld b, $0c ; tiles
.asm_1130d
	ld c, TILE_SIZE
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

Gfx_1131d: INCBIN "gfx/gfx_630b.2bpp"

; unreferenced
Func_113dd:
	call Func_12fb
	call CopyOAMDirect
	ret

Func_113e4:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_10
	farcall SetTextLoadMode
	xor a
.asm_113ee
	push af
	ld b, $00
	ld c, a
	ld hl, .data
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
	farcall SetTextArg
	farcall LoadText
	call Func_111c
	ld de, wTextBuffer
	ld a, $00
	ld [hli], a
	ld c, $08
.asm_11415
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_11415
	ld de, $17
	add hl, de
	ld de, wTextBuffer
	ld a, $00
	ld [hli], a
	ld c, $08
.asm_1142d
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
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

.data
	db $12, $11, $10, $ff, $ff

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
	ld a, TEXTLOAD_12
	farcall SetTextLoadMode
	farcall LoadText
	ld b, $02
	ld c, $00
	call Func_118f0
	push bc
	ld hl, hMainJobState
	add hl, bc
	call Func_111c
	ld de, wTextBuffer
	ld a, $00
	ld [hli], a
	ld a, [wTextLength]
	ld c, a
.asm_11480
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharHeadTile]
	ld [hli], a
	dec c
	jr nz, .asm_11480
	pop bc
	ld h, b
	ld l, c
	ld de, wTextBuffer
	ld a, $00
	ld [hli], a
	ld a, [wTextLength]
	ld c, a
.asm_11499
	ld a, [de]
	inc de
	call ProcessChar
	ld a, [wCharTile]
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
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	ld b, $02
	ld c, $01
	call Func_118f0
	ld h, b
	ld l, c
	call Func_111ad
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	farcall SetTextArg
	farcall LoadText
	ld a, [wTextBuffer + $0]
	ld [hli], a
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
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
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	ld b, $02
	ld c, $02
	call Func_118f0
	ld h, b
	ld l, c
	push hl
	ld hl, wcf6e
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	pop hl
	ld a, [wTextBuffer + $0]
	ld [hli], a
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
	ld [hli], a
	ld a, $18
	ld [hli], a
	ld a, $38
	ld [hli], a
	push hl
	ld hl, wcf90
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall SetTextArg
	farcall LoadText
	pop hl
	ld a, [wTextBuffer + $0]
	ld [hli], a
	ld a, [wTextBuffer + $1]
	ld [hli], a
	ld a, [wTextBuffer + $2]
	ld [hli], a
	ld a, [wTextBuffer + $3]
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
	ld [wcfbd], a
	pop af
	ret

Func_11554:
	push af
	push bc
	push de
	push hl
.loop
	call Func_1157b
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
	dw Func_115a1
	dw Func_115ae
	dw Func_115bc
	dw Func_115cc

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
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_11594
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $00, $02, $00, $00, $04, $06, $00, $00

Func_115a1:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_115ae:
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	ld a, $01
	ret

Func_115bc:
	call Func_115fc
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_115cc:
	call Func_11610
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call WaitForVBlank
	xor a
	ret

Func_115dc:
	push bc
	push hl
	call Func_2958
	ld b, $00
	ld c, a
	ld hl, .data
	add hl, bc
	ld c, [hl]
	ld a, [wcfbd]
	cp c
	jr nc, .asm_115f2
	xor a
	jr .asm_115f4
.asm_115f2
	ld a, $01
.asm_115f4
	pop hl
	pop bc
	ret

.data
	db $03, $03, $04, $04, $04

Func_115fc:
	push af
	call Func_115dc
	cp $00
	jr nz, .asm_1160e
	ld a, [wcfbd]
	inc a
	ld [wcfbd], a
	call Func_11621
.asm_1160e
	pop af
	ret

Func_11610:
	push af
	ld a, [wcfbd]
	cp $00
	jr z, .asm_1161f
	dec a
	ld [wcfbd], a
	call Func_11621
.asm_1161f
	pop af
	ret

Func_11621:
	push af
	ld a, [wcfbd]
	cp $04
	jr nz, .asm_11642
	call Func_2958
	cp $02
	jr nz, .asm_11634
	ld a, $04
	jr .asm_11642
.asm_11634
	cp $03
	jr nz, .asm_1163c
	ld a, $05
	jr .asm_11642
.asm_1163c
	cp $04
	jr nz, .asm_11642
	ld a, $06
.asm_11642
	call Func_11647
	pop af
	ret

Func_11647:
	push af
	push bc
	push de
	push hl
	add sp, $fa
	ld b, $00
	ld c, a
	sla c
	ld hl, .ptrs
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, sp+$00
	ld c, $05
.asm_1165d
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1165d
	ld hl, sp+$05
	ld [hl], $00
	ld hl, sp+$00
	ld d, h
	ld e, l
	ld a, $05
.asm_1166d
	push af
	ld a, VBLANK_06
	call SetPendingVBlankMode
	ld hl, sp+$07
	ld c, [hl]
	inc [hl]
	ld b, $00
	call Func_118f0
	call AddWordToVBlankStruct
	ld a, [de]
	call Func_116f4
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	ld a, [de]
	call Func_1173c
	call RequestVBlankMode
	call WaitForVBlank
	ld a, VBLANK_06
	call SetPendingVBlankMode
	push bc
	ld hl, $25
	add hl, bc
	ld b, h
	ld c, l
	ld a, [de]
	call Func_11784
	pop bc
	ld hl, $5
	add hl, bc
	ld b, h
	ld c, l
	ld a, [de]
	call Func_117f0
	call RequestVBlankMode
	call WaitForVBlank
	inc de
	pop af
	dec a
	jr nz, .asm_1166d
	add sp, $06
	pop hl
	pop de
	pop bc
	pop af
	ret

.ptrs
	dw .data_1
	dw .data_2
	dw .data_3
	dw .data_4
	dw .data_5
	dw .data_6
	dw .data_7

.data_1
	db $12, $11, $10, $ff, $ff
.data_2
	db $09, $0a, $0b, $0c, $ff
.data_3
	db $00, $01, $02, $03, $04
.data_4
	db $05, $06, $07, $08, $ff
.data_5
	db $0d, $ff, $ff, $ff, $ff
.data_6
	db $0d, $0e, $ff, $ff, $ff
.data_7
	db $0d, $0e, $0f, $ff, $ff

Func_116f4:
	push af
	push bc
	push de
	push hl
	cp $ff
	jr nz, .asm_11707
	xor a
	ld c, $14
.asm_116ff
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_116ff
	jr .asm_11737
.asm_11707
	ld b, $00
	ld c, a
	farcall SetTextArg
	ld a, TEXTLOAD_10
	farcall SetTextLoadMode
	farcall LoadText
	xor a
	call AddByteToVBlankStruct
	call Func_111c
	ld hl, wTextBuffer
	ld c, $08
.asm_11721
	ld a, [hli]
	call ProcessChar
	ld a, [wCharHeadTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11721
	xor a
	ld c, $0b
.asm_11731
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11731
.asm_11737
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1173c:
	push af
	push bc
	push de
	push hl
	cp $ff
	jr nz, .asm_1174f
	xor a
	ld c, $14
.asm_11747
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11747
	jr .asm_1177f
.asm_1174f
	ld b, $00
	ld c, a
	farcall SetTextArg
	ld a, TEXTLOAD_10
	farcall SetTextLoadMode
	farcall LoadText
	xor a
	call AddByteToVBlankStruct
	call Func_111c
	ld hl, wTextBuffer
	ld c, $08
.asm_11769
	ld a, [hli]
	call ProcessChar
	ld a, [wCharTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11769
	xor a
	ld c, $0b
.asm_11779
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11779
.asm_1177f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_11784:
	push af
	push bc
	push de
	push hl
	cp $ff
	jr nz, .asm_1179a
	call AddWordToVBlankStruct
	xor a
	ld c, $14
.asm_11792
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11792
	jr .asm_117b8
.asm_1179a
	cp $11
	jr nz, .asm_117a6
	call AddWordToVBlankStruct
	call Func_11850
	jr .asm_117b8
.asm_117a6
	cp $12
	jr nz, .asm_117b2
	call AddWordToVBlankStruct
	call Func_1188e
	jr .asm_117b8
.asm_117b2
	call AddWordToVBlankStruct
	call Func_117fd
.asm_117b8
	pop hl
	pop de
	pop bc
	pop af
	ret

PtrTable_117bd:
	dw wTextBuffer + $0
	dw wTextBuffer + $1
	dw wTextBuffer + $2
	dw wTextBuffer + $3
	dw Data_57e9
	dw Data_57ea
	dw Data_57ee

PtrTable_117cb:
	dw wTextBuffer + $0
	dw wTextBuffer + $1
	dw wTextBuffer + $2
	dw wTextBuffer + $3
	dw Data_57eb
	dw Data_57ec
	dw Data_57ed
	dw Data_57ee

PtrTable_117db:
	dw wTextBuffer + $0
	dw wTextBuffer + $1
	dw wTextBuffer + $2
	dw wTextBuffer + $3
	dw Data_57ef
	dw Data_57ea
	dw Data_57ee

Data_57e9:
	db $18
Data_57ea:
	db $38
Data_57eb:
	db $16
Data_57ec:
	db $3c
Data_57ed:
	db $0d
Data_57ee:
	db $ff
Data_57ef:
	db $20

Func_117f0:
	push af
	cp $12
	jr nz, .asm_117fb
	call AddWordToVBlankStruct
	call Func_118bf
.asm_117fb
	pop af
	ret

Func_117fd:
	push af
	push bc
	push de
	push hl
	push af
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	pop af
	ld d, $00
	ld e, a
	sla e
	ld hl, wDuelistDuelCounts
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	farcall SetTextArg
	farcall LoadText
	push de
	ld hl, PtrTable_117bd
.asm_1181e
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .asm_1182c
	call AddByteToVBlankStruct
	jr .asm_1181e
.asm_1182c
	pop de
	ld hl, wDuelistWinCounts
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	farcall SetTextArg
	farcall LoadText
	ld hl, PtrTable_117cb
.asm_1183d
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .asm_1184b
	call AddByteToVBlankStruct
	jr .asm_1183d
.asm_1184b
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_11850:
	push af
	push bc
	push de
	push hl
	push af
	ld a, TEXTLOAD_NUMBER
	farcall SetTextLoadMode
	pop af
	call Func_111ad
	ld [wHexNumber + 0], a
	ld a, $00
	ld [wHexNumber + 1], a
	call ConvertToDecimalRepresentation
	farcall SetTextArg
	farcall LoadText
	ld hl, PtrTable_117db
.asm_11872
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .asm_11880
	call AddByteToVBlankStruct
	jr .asm_11872
.asm_11880
	xor a
	ld c, $08
.asm_11883
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_11883
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1188e:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_12
	farcall SetTextLoadMode
	farcall LoadText
	ld hl, wTextBuffer
	ld a, [wTextLength]
	ld c, a
	ld b, c
.asm_118a2
	ld a, [hli]
	call ProcessChar
	ld a, [wCharTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_118a2
	ld a, $14
	sub b
	ld c, a
	xor a
.asm_118b4
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_118b4
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_118bf:
	push af
	push bc
	push de
	push hl
	ld a, TEXTLOAD_12
	farcall SetTextLoadMode
	farcall LoadText
	ld hl, wTextBuffer
	ld a, [wTextLength]
	ld c, a
	ld b, c
.asm_118d3
	ld a, [hli]
	call ProcessChar
	ld a, [wCharHeadTile]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_118d3
	ld a, $14
	sub b
	ld c, a
	xor a
.asm_118e5
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_118e5
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_118f0:
	push af
	push de
	push hl
	ld d, $00
	ld e, b
	ld hl, .ptrs
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

.ptrs
	dw .data_1
	dw .data_2
	dw .data_3

.data_1
	dwcoord  0,  2
	dwcoord  0,  5
	dwcoord  0,  8
	dwcoord  0, 11
	dwcoord  0, 14
.data_2
	dwcoord  5,  4
	dwcoord  5,  7
	dwcoord  5, 10
	dwcoord  5, 13
	dwcoord  5, 16
.data_3
	dwcoord 11,  4
	dwcoord 11,  7
	dwcoord 11, 10
	dwcoord 11, 13
	dwcoord 11, 16
