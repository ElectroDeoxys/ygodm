	dw BANK(@)

	farcall_table_start
	farfunc Func_10020 ; $03
	farfunc Func_10477 ; $05
	farfunc $4484 ; $07
	farfunc $44f5 ; $09
	farfunc $4505 ; $0b
	farfunc Func_10047 ; $0d
	farfunc $4140 ; $0f
	farfunc $418d ; $11
	farfunc $4741 ; $13
	farfunc $48f0 ; $15
	farfunc $4919 ; $17
	farfunc $5196 ; $19
	farfunc $51ad ; $1b
	farfunc $52cb ; $1d
	farfunc $4a1b ; $1f

SECTION "Bank 04@4020", ROMX[$4020], BANK[$04]

Func_10020::
	call Func_1576
	farcall Func_883d
	call Func_10484
	call Func_10505
	ld a, $00
	ld [$ccfe], a
.loop
	ld a, [$ccfe]
	cp $01
	jr z, .asm_10046
	farcall Func_e6be
	farcall Func_e49c
	call Func_2a08
	farcall Func_e4fb
	jr .loop
.asm_10046
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
	farcall $67, $01
	farcall $45, $01
	farcall $47, $01
	jr .asm_100a6
.asm_10071
	cp $04
	jr nz, .asm_10080
	farcall $55, $01
	farcall $57, $01
	farcall $59, $01
	jr .asm_100a6
.asm_10080
	cp $05
	jr nz, .asm_1008f
	farcall $5b, $01
	farcall $5d, $01
	farcall $5f, $01
	jr .asm_100a6
.asm_1008f
	cp $06
	jr nz, .asm_1009e
	farcall $61, $01
	farcall $63, $01
	farcall $65, $01
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
	call Func_f74
	dec c
	jr nz, .asm_100c4
	cp $00
	jr nz, .asm_100d4
	call Func_2b68
	call Func_100d7
.asm_100d4
	pop bc
	pop af
	ret

Func_100d7:
	push af
	push bc
	call Func_1f57
	farcall Func_d224
	farcall GenerateAIOpponentDeck
	farcall Func_c75e
	farcall Func_4068
	call Func_2a97
.asm_100eb
	farcall Func_d014
	call Func_23b0
	cp $01
	jr z, .asm_1010d
	farcall $0f, $05
	call Func_2391
	call Func_101f8
	call Func_10302
	call Func_23b0
	cp $01
	jr z, .asm_1010d
	farcall $5b, $03
	jr .asm_100eb
.asm_1010d
	call Func_2948
	farcall $03, $0d
	call Func_104f5
	ld c, $64
.asm_10118
	call Func_f74
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
	farcall $15, $02
	farcall $2f, $02
	farcall $31, $02
	jr .asm_1013e
.asm_10137
	cp $02
	jr nz, .asm_1013e
	farcall $17, $02
.asm_1013e
	pop af
	ret
; 0x10140

SECTION "Bank 4@41f8", ROMX[$41f8], BANK[$4]

Func_101f8:
	call Func_1020e
	farcall $67, $03
	call Func_1023c
	call Func_1027d
	call Func_102c0
	farcall $53, $03
	farcall $55, $03
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
	farcall $09, $3b
	pop af
	ret

Func_1023c:
	push af
	push bc
	push hl
	ld b, $00
.asm_10241
	ld c, CARD_LOCATION_0
	call Func_1c4f
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsCardInvalid
	pop bc
	cp $00
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
	ld c, CARD_LOCATION_1
	call Func_1c4f
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsCardInvalid
	pop bc
	cp $00
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
	ld c, CARD_LOCATION_1
	call Func_1c4f
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall $03, $3b
	ld a, [$cee9]
	ld b, a
	ld c, CARD_LOCATION_0
	call Func_1c4f
	call Func_1c92
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	farcall $05, $3b
	farcall $07, $3b
	cp $00
	jr nz, .asm_102fc
	farcall $51, $03
	jr .asm_102ff
.asm_102fc
	farcall $4f, $03
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
	farcall $43, $03
	call Func_10370
	cp $00
	jr nz, .asm_10323
	call Func_1039c
.asm_10323
	ld a, [$cef7]
	add $01
	ld [$cef7], a
	call Func_23b0
	cp $01
	jr z, .asm_10334
	jr .asm_1030c
.asm_10334
	call Func_2bbf
	call Func_2bfe
	farcall $59, $03
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
	ld c, CARD_LOCATION_1
	call Func_1c4f
	call Func_1c92
	push bc
	ld a, [wTempCardID + 0]
	ld c, a
	ld a, [wTempCardID + 1]
	ld b, a
	call IsCardInvalid
	pop bc
	cp $00
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
	farcall $49, $03
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
	farcall $49, $03
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
	farcall $47, $03
	call Func_1c4f
	call Func_1c92
	call Func_21d9
	call Func_1c7a
	pop bc
	call Func_1045a
	farcall $4d, $03
	farcall $57, $03
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
	call Func_1c4f
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
	farcall $47, $03
	call Func_1c4f
	call Func_1c92
	call Func_21d9
	call Func_1c7a
	farcall $57, $03
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
	farcall $33, $03
	ld a, b
	ld [$cd5e], a
	ld a, c
	ld [$cd5f], a
	pop af
	ret

; input:
; - b = card location index
; - c = CARD_LOCATION_* constant
Func_1045a:
	push af
	call Func_1c4f
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
	cp TRUE
	jr nz, .valid_save_data
; invalid save data
	call Func_109f2
	call Func_104b3
	ld a, $01
	ld [$cf17], a
.valid_save_data
	call Func_105bc
	cp TRUE
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
	farcall Func_5acb
	farcall Func_c5cc
	call Func_27f7
	call Func_2666
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
	ld b, FALSE
	ld a, [$b7f0]
	ld c, a
	ld hl, $45fb
	add hl, bc
	ld a, [hl]
	ld [$cf16], a
	call Func_10586
	ld b, FALSE
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
	ld b, TRUE
.asm_105f0
	ld a, [hl]
	cp d
	jr z, .asm_105f6
	ld b, TRUE
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
	ld b, FALSE
	ld hl, $b7f1
	ld de, SaveDataMagic
	ld c, SaveDataMagic.end - SaveDataMagic
.loop
	ld a, [de]
	cp [hl]
	jr z, .next
	ld b, TRUE
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
	dwb $cc5b, $50
	dwb $cae4, $ff
	dwb $cbe3, $6e
	dwb $cf4e, $22
	dwb $cf70, $22
	dwb $cf99, $08
	dwb $b800, $c8
	dwb $b8c8, $c8
	dwb $b990, $c8
	dwb $ba58, $c8
	dw NULL

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
	farcall $0b, $0c
.asm_10a5e
	call Func_10a7a
	call Func_10af3
	call EnableLCD
	call Func_100e
	call Func_f74
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
	ld bc, .ret
	push bc
	jp hl
.ret
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
	call Func_f74
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
; 0x11196
