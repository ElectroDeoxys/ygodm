	dw BANK(@)

	farcall_table_start
	farfunc Func_4068 ; $03
	farfunc $551f ; $05
	farfunc Func_5acb ; $07
	farfunc $5c48 ; $09
	farfunc $5b92 ; $0b
	farfunc $56e0 ; $0d
	farfunc $5c86 ; $0f
	farfunc Func_5af2 ; $11
	farfunc $5b80 ; $13
	farfunc $5bb8 ; $15
	farfunc $5bd1 ; $17
	farfunc $5c10 ; $19
	farfunc $42c5 ; $1b
	farfunc $42d0 ; $1d
	farfunc $42ec ; $1f
	farfunc $5313 ; $21
	farfunc $5eb3 ; $23
	farfunc $5f37 ; $25
	farfunc $5f79 ; $27
	farfunc $6008 ; $29
	farfunc $6015 ; $2b
	farfunc $5ff2 ; $2d
	farfunc LoadCharacterGfx ; $2f
	farfunc $5ef5 ; $31
	farfunc $5ffb ; $33
	farfunc $6022 ; $35
	farfunc $602b ; $37
	farfunc $6034 ; $39
	farfunc $603d ; $3b
	farfunc $6046 ; $3d
	farfunc $6101 ; $3f
	farfunc Func_5b04 ; $41
	farfunc Func_5b52 ; $43
	farfunc $62c2 ; $45
	farfunc $63d6 ; $47
	farfunc Func_6595 ; $49
	farfunc Func_65c4 ; $4b
	farfunc Func_65f3 ; $4d
	farfunc Func_6804 ; $4f
	farfunc Func_6622 ; $51
	farfunc Func_6736 ; $53
	farfunc $6a6e ; $55
	farfunc $689e ; $57
	farfunc $69b5 ; $59
	farfunc $6c67 ; $5b
	farfunc $6a97 ; $5d
	farfunc $6bae ; $5f
	farfunc $6e41 ; $61
	farfunc $6c90 ; $63
	farfunc $6da7 ; $65
	farfunc $64b5 ; $67

Func_4068:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $40a6
	call Func_10d9
	farcall Func_cd9a
	farcall Func_2801e
	farcall Func_803e
	call Func_40b0
	call Func_4110
	call Func_413a
	call Func_4164
	call Func_41a1
	call Func_41c6
	call Func_41eb
	call Func_42a7
	call Func_42ae
	call EnableLCD
	call Func_fff
	call Func_f74
	pop hl
	pop af
	ret
; 0x40a6

SECTION "Bank 1@40b0", ROMX[$40b0], BANK[$1]

Func_40b0:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 16
	ld d, $00
	ld e, $05
.asm_40bb
	ld b, d
	ld c, CARD_LOCATION_HAND
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	inc d
	dec e
	jr nz, .asm_40bb
	hlbgcoord 10, 0
	ld d, $04
	ld e, $05
.asm_40d7
	ld b, d
	ld c, CARD_LOCATION_0
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	dec d
	dec e
	jr nz, .asm_40d7
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_40f1:
	push af
	push bc
	push hl
	ld bc, $20
	cp $d0
	jr z, .asm_4107
	ld [hli], a
	inc a
	inc a
	ld [hld], a
	dec a
	add hl, bc
	ld [hli], a
	inc a
	inc a
	ld [hl], a
	jr .asm_410c
.asm_4107
	ld [hli], a
	ld [hld], a
	add hl, bc
	ld [hli], a
	ld [hl], a
.asm_410c
	pop hl
	pop bc
	pop af
	ret

Func_4110:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_42d0
	ld a, [$cab0]
	ld c, a
	ld a, [$cab1]
	ld b, a
	call Func_42c5
	call Func_42ec
	hlbgcoord 5, 16
	ld de, $cab9
	ld c, $04
.asm_412f
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_412f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_413a:
	push af
	push bc
	push de
	push hl
	ld a, $00
	call Func_42d0
	ld a, [$cab3]
	ld c, a
	ld a, [$cab4]
	ld b, a
	call Func_42c5
	call Func_42ec
	hlbgcoord 5, 1
	ld de, $cab9
	ld c, $04
.asm_4159
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_4159
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_4164:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$cad1]
	ld c, a
	call Func_42c5
	ld a, $02
	call Func_42d0
	call Func_42ec
	call Func_1114
	hlbgcoord 1, 3
	ld de, $cab9
	ld c, $08
.asm_4184
	ld a, [de]
	inc de
	call Func_1144
	push hl
	push bc
	ld bc, $20
	add hl, bc
	ld a, [$cad0]
	ld [hl], a
	pop bc
	pop hl
	ld a, [$cacf]
	ld [hli], a
	dec c
	jr nz, .asm_4184
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_41a1:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 14
	ld d, $00
	ld e, $05
.asm_41ac
	ld b, d
	ld c, CARD_LOCATION_2
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	inc d
	dec e
	jr nz, .asm_41ac
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_41c6:
	push af
	push bc
	push de
	push hl
	hlbgcoord 10, 2
	ld d, $04
	ld e, $05
.asm_41d1
	ld b, d
	ld c, CARD_LOCATION_1
	call Func_1c4f
	call Func_1c92
	call Func_1d67
	call Func_40f1
	inc hl
	inc hl
	dec d
	dec e
	jr nz, .asm_41d1
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_41eb:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles0 tile $50
	ld de, $4207
	ld b, $0c
.asm_41f7
	ld c, $10
.asm_41f9
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_41f9
	dec b
	jr nz, .asm_41f7
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x4207

SECTION "Bank 1@42a7", ROMX[$42a7], BANK[$1]

Func_42a7:
	call Func_12d2
	call Func_1225
	ret

Func_42ae:
	push af
	ld a, [$cdff]
	cp $02
	jr nz, .asm_42c3
	ld a, $07
	ldh [rWX], a
	ld a, $67
	ldh [rWY], a
	ld hl, rLCDC
	res 1, [hl]
.asm_42c3
	pop af
	ret

Func_42c5:
	push af
	ld a, c
	ld [$cab6], a
	ld a, b
	ld [$cab7], a
	pop af
	ret

Func_42d0:
	ld [$cab8], a
	ret
; 0x42d4

SECTION "Bank 1@42ec", ROMX[$42ec], BANK[$1]

Func_42ec:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cab8]
	ld c, a
	ld hl, $4305
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $4301
	push bc
	jp hl
; 0x4301

SECTION "Bank 01@5acb", ROMX[$5acb], BANK[$01]

Func_5acb:
	push af
	push bc
	push hl
	ld hl, $cae4
	ld a, $ff
	ld b, $01
.asm_5ad5
	ld c, $00
.asm_5ad7
	ld [hli], a
	dec c
	jr nz, .asm_5ad7
	dec b
	jr nz, .asm_5ad5
	ld c, $6d
.asm_5ae0
	ld [hli], a
	dec c
	jr nz, .asm_5ae0
	ld a, $00
	ld [$cae2], a
	ld a, $00
	ld [$cae3], a
	pop hl
	pop bc
	pop af
	ret

Func_5af2::
	push af
	call IsCardInvalid
	cp $00
	jr nz, .asm_5b02
	ld a, c
	ld [$cae2], a
	ld a, b
	ld [$cae3], a
.asm_5b02
	pop af
	ret

Func_5b04::
	push af
	push bc
	push hl
	call Func_5b80
	cp $ff
	jr nz, .asm_5b12
	xor a
	call Func_5b6c
.asm_5b12
	ld a, [$cae2]
	ld c, a
	ld a, [$cae3]
	ld b, a
	ld hl, $cae4
	add hl, bc
	ld a, [hl]
	cp $63
	jr z, .asm_5b25
	inc a
	ld [hl], a
.asm_5b25
	pop hl
	pop bc
	pop af
	ret
; 0x5b29

SECTION "Bank 01@5b52", ROMX[$5b52], BANK[$01]

Func_5b52::
	push af
	push bc
	push hl
	ld a, [$cae2]
	ld c, a
	ld a, [$cae3]
	ld b, a
	ld hl, $cae4
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_5b68
	ld [hl], $00
.asm_5b68
	pop hl
	pop bc
	pop af
	ret

Func_5b6c:
	push bc
	push hl
	push af
	ld a, [$cae2]
	ld c, a
	ld a, [$cae3]
	ld b, a
	ld hl, $cae4
	add hl, bc
	pop af
	ld [hl], a
	pop hl
	pop bc
	ret

Func_5b80:
	push bc
	push hl
	ld a, [$cae2]
	ld c, a
	ld a, [$cae3]
	ld b, a
	ld hl, $cae4
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
; 0x5b92

SECTION "Bank 1@5fbb", ROMX[$5fbb], BANK[$1]

; loads tiles that correspond to character in wNPCCharacter
LoadCharacterGfx:
	push af
	push bc
	push de
	push hl

	ld a, $01
	call Func_1842
	ld a, [wNPCCharacter]
	call Func_1842
	xor a
	call Func_1842
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call ActivateJob
	db JOB_DECOMPRESS

	ld hl, vTiles2
	ld b, $10
.asm_5fdc
	call Func_17ab
	dec b
	jr nz, .asm_5fdc
	ld hl, vTiles1
	ld b, $08
.asm_5fe7
	call Func_17ab
	dec b
	jr nz, .asm_5fe7
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x5ff2

SECTION "Bank 01@6595", ROMX[$6595], BANK[$01]

Func_6595::
	push af
	push hl

	call DisableLCD
	ld hl, .Config
	call Func_10d9
	farcall Func_2c00a
	call EnableLCD
	call DoFrame
	call FadeIn

	; wait for 90 frames
	ld l, 90
.wait
	call DoFrame
	dec l
	jr nz, .wait

	call FadeOut
	pop hl
	pop af
	ret

.Config:
	db LCDC_BG_ON ; LCDC
	db STAT_LYC ; STAT
	db   0 ; SCY
	db   0 ; SCX
	db  32 ; LYC
	db $00 ; BGP
	db $00 ; OBP0
	db $00 ; OBP1
	db 143 ; WY
	db 166 ; WX

Func_65c4::
	push af
	push hl
	call DisableLCD
	ld hl, $65e9
	call Func_10d9
	farcall $05, $0b
	call EnableLCD
	call DoFrame
	call FadeIn

	; wait for 90 frames
	ld l, 90
.wait
	call DoFrame
	dec l
	jr nz, .wait

	call FadeOut
	pop hl
	pop af
	ret
; 0x65e9

SECTION "Bank 01@65f3", ROMX[$65f3], BANK[$01]

Func_65f3::
	push af
	push hl
	call DisableLCD
	ld hl, $6618
	call Func_10d9
	farcall $07, $0b
	call EnableLCD
	call DoFrame
	call FadeIn

	; wait for 90 frames
	ld l, 90
.wait
	call DoFrame
	dec l
	jr nz, .wait

	call FadeOut
	pop hl
	pop af
	ret
; 0x6618

SECTION "Bank 1@6622", ROMX[$6622], BANK[$1]

Func_6622:
	push af
	push hl
	call Func_101d
	call DisableLCD
	ld hl, $6642
	call Func_10d9
	farcall Func_2d717
	call Func_664c
	call EnableLCD
	call Func_100e
	call Func_f74
	pop hl
	pop af
	ret
; 0x6642

SECTION "Bank 1@664c", ROMX[$664c], BANK[$1]

Func_664c:
	call ClearOAM
	call Func_681b
	call Func_6659
	call Func_1225
	ret

Func_6659:
	push af
	push bc
	push de
	push hl
	ld de, $6675
	ld hl, vTiles0
	ld b, $0c
.asm_6665
	ld c, $10
.asm_6667
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_6667
	dec b
	jr nz, .asm_6665
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x6675

SECTION "Bank 01@6736", ROMX[$6736], BANK[$01]

Func_6736:
	push af
	push bc
	push de
	push hl
.loop
	call Func_6761
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
	dw Func_6787
	dw Func_6794
	dw $67ae
	dw $67c1
	dw $67d4
	dw $67e7

Func_6761:
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and $ff
	jr z, .asm_677a
	ld c, 8 ; bits
.asm_676f
	dec c
	rlca
	jr nc, .asm_676f
	ld b, $00
	ld hl, .data
	add hl, bc
	ld d, [hl]
.asm_677a
	ld a, d
	pop hl
	pop de
	pop bc
	ret

.data
	db $02, $04, $00, $00, $0a, $00, $06, $08

Func_6787:
	ld a, $02
	call SetPendingVBlankMode
	call RequestVBlankMode
	call Func_f74
	xor a
	ret

Func_6794:
	push bc
	push hl
	call Func_687c
	ld a, $04
	call SetPendingVBlankMode
	call RequestVBlankMode
	call Func_f74
	ld a, $01
	ld [$cea1], a
	ld a, $01
	pop hl
	pop bc
	ret
; 0x67ae

SECTION "Bank 01@6804", ROMX[$6804], BANK[$01]

Func_6804:
	push af
	push bc
	ld a, $00
	ld [$cf92], a
	ld a, $00
	call Func_6885
	ld a, b
	ld [$cf93], a
	ld a, c
	ld [$cf94], a
	pop bc
	pop af
	ret

Func_681b:
	push af
	push bc
	push de
	ld d, $00
	ld e, $00
	ld a, [$cf93]
	ld b, a
	ld a, [$cf94]
	ld c, a
	call Add4x4OAM
	call Func_2958
	cp $01
	jr c, .asm_683f
	ld c, $50
	ld b, $98
	ld d, $08
	ld e, $04
	call Add4x4OAM
.asm_683f
	pop de
	pop bc
	pop af
	ret
; 0x6843

SECTION "Bank 1@687c", ROMX[$687c], BANK[$1]

Func_687c:
	push af
	ld a, [$cf92]
	call Func_2344
	pop af
	ret

Func_6885:
	push af
	push hl
	ld b, $00
	ld c, a
	sla c
	ld hl, $6896
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	pop af
	ret
; 0x6896
