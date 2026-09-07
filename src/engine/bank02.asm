	dw BANK(@)

	farcall_table_start
	farfunc LoadFontToVTiles2 ; $03
	farfunc LoadDigitTiles ; $05
	farfunc Func_883d ; $07
	farfunc $484a ; $09
	farfunc LoadCharacterOAMGfx ; $0b
	farfunc Func_8bfe ; $0d
	farfunc $4074 ; $0f
	farfunc LoadCharTileToVBlankStruct ; $11
	farfunc Func_b52c ; $13
	farfunc Func_b547 ; $15
	farfunc Func_b562 ; $17
	farfunc ConvertNPCDuelistToCharacter ; $19
	farfunc $7711 ; $1b
	farfunc Func_b7ee ; $1d
	farfunc Func_b807 ; $1f
	farfunc Func_b823 ; $21
	farfunc Func_b840 ; $23
	farfunc Func_b57d ; $25
	farfunc Func_b85d ; $27
	farfunc Func_b87e ; $29
	farfunc Func_b889 ; $2b
	farfunc Func_b894 ; $2d
	farfunc Func_b62d ; $2f
	farfunc Func_b679 ; $31
	farfunc $789f ; $33
	farfunc Func_b8b2 ; $35
	farfunc Func_b8cb ; $37
	farfunc Func_b8e4 ; $39
	farfunc $78fd ; $3b
	farfunc Func_b916 ; $3d

LoadFontToVTiles2:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles2
	ld de, TILE_SIZE
	ld a, ' '
	ld b, $80 ; tiles
.loop
	call LoadCharTile
	add hl, de
	inc a
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

LoadDigitTiles:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles1 tile $46
	ld a, '0'
	ld de, 1 tiles
	ld b, 10
.loop
	call LoadCharTile
	add hl, de
	inc a
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

; input:
; - a  = which character to load
; - hl = pointer to VRAM
LoadCharTile:
	push af
	push bc
	push de
	push hl
	cp $7d
	jr nc, .char_2bpp
	push hl
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	ld de, Gfx_80d9
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld c, TILE_1BPP_SIZE
.loop_copy_1bpp
	ld a, [de]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy_1bpp
	jr .done
.char_2bpp
	push hl
	sub $7d
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $44c1
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld c, TILE_SIZE
.loop_copy_2bpp
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_copy_2bpp
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

; input:
; - a = which character to load
LoadCharTileToVBlankStruct:
	push af
	push bc
	push de
	push hl
	push hl
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	ld de, Gfx_80d9
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld c, TILE_1BPP_SIZE
.loop
	ld a, [de]
	call AddByteToVBlankStruct
	ld a, [de]
	call AddByteToVBlankStruct
	inc de
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

Gfx_80d9: INCBIN "gfx/gfx_80d9.1bpp"

SECTION "Bank 2@44e1", ROMX[$44e1], BANK[$2]

Func_84e1:
	push af
	ld a, $01
	ld [wcd45], a
	ld a, $00
	ld [wcd47], a
	ld a, $00
	ld [wcd48 + 0], a
	ld a, $00
	ld [wcd48 + 1], a
	ld a, $00
	ld [wcd4a], a
	ld a, $00
	ld [wcd44], a
	call Func_86ec
	pop af
	ret

Func_8505:
	push af
	farcall Func_3c016
	call Func_8593
	call Func_8722
	pop af
	ret

Func_8511:
	push af
	push bc
	push de
	push hl

	ld b, $00
	ld a, [wcd4a]
	ld c, a
	sla c
	ld hl, .BGCoords
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	call AddWordToVBlankStruct
	ld hl, $cd20
	ld e, $12
.asm_852c
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_852c

	ld hl, TILEMAP_WIDTH
	add hl, bc
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	ld hl, $cd32
	ld e, $12
.asm_8541
	ld a, [hli]
	call AddByteToVBlankStruct
	dec e
	jr nz, .asm_8541
	pop hl
	pop de
	pop bc
	pop af
	ret

.BGCoords:
	dwcoord 1, 11
	dwcoord 1, 13
	dwcoord 1, 15

Func_8553:
	push af
	push bc
	push de
	push hl
	call Func_8565
	ld a, [wCurChar]
	call LoadCharTileToVBlankStruct
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_8565:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wcd4a]
	ld c, a
	sla c
	ld hl, $458d
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld h, $00
	ld a, [wcd48 + 1]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld b, h
	ld c, l
	call AddWordToVBlankStruct
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x858d

SECTION "Bank 2@4593", ROMX[$4593], BANK[$2]

Func_8593:
	push af
	push bc
	push hl
	ld a, [wcd46]
	cp CONTROL_CHAR
	jr nc, .asm_85bd
	call Func_85e3
	push af
	ld a, $01
	ld [$cd53], a
	pop af
	cp $00
	jr nz, .asm_85b2
	ld a, $00
	ld [$cd53], a
	jr .asm_85bb
.asm_85b2
	cp $59
	jr nz, .asm_85bb
	ld a, $00
	ld [$cd53], a
.asm_85bb
	jr .asm_85d5
.asm_85bd
	ld b, $00
	sub CONTROL_CHAR
	ld c, a
	sla c
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	ld a, $00
	ld [$cd53], a
.asm_85d5
	pop hl
	pop bc
	pop af
	ret

.PtrTable:
	dw Func_8655 ; <LINE>
	dw Func_867a ; <PROMPT>
	dw Func_86ce ; <B2>
	dw Func_86d6 ; <B3>
	dw Func_86e8 ; <DONE>

Func_85e3:
	push af
	push bc
	push de
	push hl
	ld a, [wcd45]
	cp $01
	jr nz, .asm_8616
	ld a, $00
	ld [wcd44], a
	call Func_8710
	ld a, [wcd46]
	call ProcessChar
	ld b, $00
	ld a, [wcd48 + 1]
	ld c, a
	ld hl, $cd20
	add hl, bc
	ld a, [$cacf]
	ld [hl], a
	call Func_8631
	call Func_8511
	call Func_8553
	call Func_861b
.asm_8616
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_861b:
	push af
	ld a, [wcd48 + 1]
	inc a
	ld [wcd48 + 1], a
	cp $12
	jr c, .asm_862f
	call Func_8655
	ld a, $01
	ld [wcd44], a
.asm_862f
	pop af
	ret

Func_8631:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wcd4a]
	ld c, a
	ld hl, $4652
	add hl, bc
	ld a, [wcd48 + 1]
	add [hl]
	ld e, a
	ld a, [wcd48 + 1]
	ld c, a
	ld hl, $cd32
	add hl, bc
	ld [hl], e
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x8652

SECTION "Bank 2@4655", ROMX[$4655], BANK[$2]

Func_8655:
	push af
	ld a, [wcd44]
	cp $00
	jr nz, .asm_8673
	ld a, $00
	ld [wcd48 + 1], a
	ld a, [wcd4a]
	inc a
	cp $03
	jr nz, .asm_866b
	dec a
.asm_866b
	ld [wcd4a], a
	call Func_86ec
	jr .asm_8678
.asm_8673
	ld a, $00
	ld [wcd44], a
.asm_8678
	pop af
	ret

Func_867a:
	push af
	ld a, [wcd45]
	cp $01
	jr nz, .asm_868c
	ld a, $00
	ld [wcd44], a
	call Func_8788
	jr .asm_86cc
.asm_868c
	cp $14
	jr nz, .asm_86a2
	ld a, $00
	ld [$cd49], a
	ld a, $02
	ld [wcd4a], a
	call Func_86ec
	call Func_8511
	jr .asm_86cc
.asm_86a2
	cp $13
	jr nz, .asm_86b8
	ld a, $00
	ld [$cd49], a
	ld a, $01
	ld [wcd4a], a
	call Func_86ec
	call Func_8511
	jr .asm_86cc
.asm_86b8
	cp $12
	jr nz, .asm_86cc
	ld a, $00
	ld [$cd49], a
	ld a, $00
	ld [wcd4a], a
	call Func_86ec
	call Func_8511
.asm_86cc
	pop af
	ret

Func_86ce:
	push af
	ld a, $00
	ld [wcd44], a
	pop af
	ret

Func_86d6:
	push af
	ld a, [wcd45]
	cp $01
	jr nz, .asm_86e6
	ld a, $00
	ld [wcd44], a
	call Func_8795
.asm_86e6
	pop af
	ret

Func_86e8:
	call Func_87a2
	ret

Func_86ec:
	push af
	push bc
	push hl
	call Func_8710
	ld a, ' '
	call ProcessChar
	ld a, [$cacf]
	ld hl, $cd20
	ld c, $12
.asm_86ff
	ld [hli], a
	dec c
	jr nz, .asm_86ff
	ld a, [wCurChar]
	ld c, $12
.asm_8708
	ld [hli], a
	dec c
	jr nz, .asm_8708
	pop hl
	pop bc
	pop af
	ret

Func_8710:
	push af
	ld a, [wcd4a]
	cp $00
	jr nz, .asm_871d
	call Func_1124
	jr .asm_8720
.asm_871d
	call Func_112c
.asm_8720
	pop af
	ret

Func_8722:
	push af
	push bc
	push hl
	ld a, [wcd45]
	dec a
	ld [wcd45], a
	jr nz, .asm_8749
	ld a, [wcd46]
	cp $b0
	jr nc, .asm_873c
	ld a, $02
	ld [wcd45], a
	jr .asm_8749
.asm_873c
	ld b, $00
	sub $b0
	ld c, a
	ld hl, $474d
	add hl, bc
	ld a, [hl]
	ld [wcd45], a
.asm_8749
	pop hl
	pop bc
	pop af
	ret
; 0x874d

SECTION "Bank 2@4752", ROMX[$4752], BANK[$2]

Func_8752:
	push af
	push bc
	push de
	push hl
	ld d, $00
	ld a, [wJoypadPressed]
	and PAD_A | PAD_B
	jr z, .asm_876c
	ld c, $08
.asm_8761
	dec c
	rlca
	jr nc, .asm_8761
	ld b, $00
	ld hl, $4780
	add hl, bc
	ld d, [hl]
.asm_876c
	ld a, $01
	ld [$cd54], a
	ld a, d
	cp $02
	jr nz, .asm_877b
	ld a, $00
	ld [$cd52], a
.asm_877b
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x8780

SECTION "Bank 2@4788", ROMX[$4788], BANK[$2]

Func_8788:
	push af
	ld a, $04
	ld [$cd52], a
	ld a, $01
	ld [wcd4b], a
	pop af
	ret

Func_8795:
	push af
	ld a, $02
	ld [$cd52], a
	ld a, $01
	ld [wcd4b], a
	pop af
	ret

Func_87a2:
	push af
	ld a, $05
	ld [$cd52], a
	pop af
	ret

Func_87aa:
	call Func_87b1
	call Func_87d9
	ret

Func_87b1:
	push af
	push bc
	push hl
	ld a, [wcd4b]
	dec a
	ld [wcd4b], a
	jr nz, .asm_87d0
	ld a, $14
	ld [wcd4b], a
	ld b, $00
	ld a, [$cd52]
	ld c, a
	ld hl, $47d4
	add hl, bc
	ld a, [hl]
	ld [$cd52], a
.asm_87d0
	pop hl
	pop bc
	pop af
	ret
; 0x87d4

SECTION "Bank 2@47d9", ROMX[$47d9], BANK[$2]

Func_87d9:
	call Func_8631
	call Func_8511
	call Func_87e3
	ret

Func_87e3:
	push af
	push bc
	push hl
	call Func_8565
	ld b, $00
	ld a, [$cd52]
	dec a
	rlca
	ld c, a
	ld hl, $4805
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $10
.asm_87fa
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .asm_87fa
	pop hl
	pop bc
	pop af
	ret
; 0x8805

SECTION "Bank 02@483d", ROMX[$483d], BANK[$02]

Func_883d:
	push af
	ld a, WEEVIL
	ld [wNPCCharacter], a
	ldtx a, Text_3c15d
	ld [wTextID], a
	pop af
	ret

Func_884a:
	push af
	push bc
	ld a, $1d
	ld [wcd4c], a
	ld a, $01
	ld [wcd4d], a
	ld a, $11
	ld [wcd4e], a
	ld a, $01
	ld [wcd4f], a
	ld a, $00
	ld [$cd53], a
	ld a, $00
	ld [$cd52], a
	call Func_84e1
.loop
	call Random
	ld a, VBLANK_0C
	call SetPendingVBlankMode
	call Func_8752
	call Func_889f
	call Func_8945
	ld a, [$cd52]
	cp $00
	jr nz, .asm_888a
	call Func_8505
	jr .asm_888d
.asm_888a
	call Func_87aa
.asm_888d
	call RequestVBlankMode
	call WaitForVBlank
	ld a, [$cd52]
	cp $05
	jr z, .asm_889c
	jr .loop
.asm_889c
	pop bc
	pop af
	ret

Func_889f:
	push af
	push bc
	push de
	push hl
	ld a, [wcd4d]
	dec a
	ld [wcd4d], a
	jr nz, .asm_88c8
	ld b, $00
	ld a, [wcd4c]
	ld c, a
	ld hl, $48cd
	add hl, bc
	ld a, [hl]
	ld [wcd4d], a
	call Func_8909
	ld a, c
	dec a
	cp $ff
	jr nz, .asm_88c5
	ld a, $1d
.asm_88c5
	ld [wcd4c], a
.asm_88c8
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x88cd

SECTION "Bank 2@4909", ROMX[$4909], BANK[$2]

Func_8909:
	push af
	push bc
	push hl
	ld a, $00
	call Func_8bd6
	ld b, $00
	ld a, [wcd4c]
	ld c, a
	ld hl, $48eb
	add hl, bc
	ld a, [hl]
	cp $00
	jr nz, .asm_8927
	ld a, $00
	call Func_8be7
	jr .asm_8937
.asm_8927
	cp $01
	jr nz, .asm_8932
	ld a, $01
	call Func_8be7
	jr .asm_8937
.asm_8932
	ld a, $02
	call Func_8be7
.asm_8937
	ld a, $00
	call Func_8c1e
	ld a, $01
	call Func_8c1e
	pop hl
	pop bc
	pop af
	ret

Func_8945:
	push af
	push bc
	push de
	push hl
	ld a, [$cd53]
	cp $00
	jr nz, .asm_895f
	call Func_89e4
	ld a, $01
	ld [wcd4f], a
	ld a, $11
	ld [wcd4e], a
	jr .asm_8984
.asm_895f
	ld a, [wcd4f]
	dec a
	ld [wcd4f], a
	jr nz, .asm_8984
	ld b, $00
	ld a, [wcd4e]
	ld c, a
	ld hl, $4989
	add hl, bc
	ld a, [hl]
	ld [wcd4f], a
	call Func_89ad
	ld a, c
	dec a
	cp $ff
	jr nz, .asm_8981
	ld a, $11
.asm_8981
	ld [wcd4e], a
.asm_8984
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x8989

SECTION "Bank 2@49ad", ROMX[$49ad], BANK[$2]

Func_89ad:
	push af
	push bc
	push hl
	ld a, $02
	call Func_8bd6
	ld b, $00
	ld a, [wcd4e]
	ld c, a
	ld hl, $499b
	add hl, bc
	ld a, [hl]
	cp $00
	jr nz, .asm_89cb
	ld a, $00
	call Func_8be7
	jr .asm_89db
.asm_89cb
	cp $01
	jr nz, .asm_89d6
	ld a, $01
	call Func_8be7
	jr .asm_89db
.asm_89d6
	ld a, $02
	call Func_8be7
.asm_89db
	ld a, $02
	call Func_8c1e
	pop hl
	pop bc
	pop af
	ret

Func_89e4:
	push af
	ld a, $02
	call Func_8bd6
	ld a, $00
	call Func_8be7
	ld a, $02
	call Func_8c1e
	pop af
	ret
; 0x89f6

SECTION "Bank 2@4a1d", ROMX[$4a1d], BANK[$2]

Func_8a1d:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$cd59]
	ld c, a
	sla c
	push bc
	ld hl, .PtrTable
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	push de
	ld a, [wNPCCharacter]
	ld b, a
	ld e, $6
	call BTimesE
	pop de
	add hl, de
	pop bc
	ld a, c
	cp $04
	jr z, .asm_8a49
	ld a, [$cd5a]
	ld c, a
	jr .asm_8a4d
.asm_8a49
	ld a, [$cd5b]
	ld c, a
.asm_8a4d
	sla c
	add hl, bc
	ld a, [hli]
	ld [$cd55], a
	ld a, [hl]
	ld [$cd56], a
	pop hl
	pop de
	pop bc
	pop af
	ret

.PtrTable:
	dw .Data_8a63
	dw .Data_8acf
	dw .Data_8b3b

.Data_8a63:
	db $4f, $3d, $4f, $3d, $4f, $3d ; WEEVIL
	db $46, $2b, $46, $2b, $46, $2b ; MAI
	db $38, $38, $38, $38, $38, $38 ; REX
	db $49, $26, $49, $26, $49, $26 ; MAKO
	db $40, $33, $40, $33, $40, $33 ; YAMI_YUGI
	db $4e, $3d, $4e, $3d, $4e, $3d ; YUGI
	db $42, $31, $42, $31, $42, $31 ; TEA
	db $4f, $2d, $4f, $2d, $4f, $2d ; JOEY
	db $40, $28, $40, $28, $40, $28 ; SETO_KAIBA
	db $44, $3f, $44, $3f, $44, $3f ; MOKUBA
	db $46, $31, $46, $31, $46, $31 ; TRISTAN
	db $3b, $39, $3b, $39, $3b, $39 ; BAKURA
	db $44, $35, $44, $35, $44, $35 ; PUPPETEER
	db $4a, $20, $4a, $20, $4a, $20 ; PANIK
	db $48, $30, $48, $30, $48, $30 ; BANDIT_KEITH
	db $40, $30, $40, $30, $40, $30 ; MAXIMILLION
	db $48, $40, $48, $40, $48, $40 ; SIMON
	db $c8, $d0, $c8, $d0, $c8, $d0 ; EXODIA

.Data_8acf:
	db $5f, $3d, $5f, $3d, $5f, $3d ; WEEVIL
	db $5c, $2c, $5c, $2c, $5c, $2c ; MAI
	db $50, $35, $50, $35, $50, $35 ; REX
	db $5f, $26, $5f, $26, $5f, $26 ; MAKO
	db $58, $33, $58, $33, $58, $33 ; YAMI_YUGI
	db $5e, $3f, $5e, $3f, $5e, $3f ; YUGI
	db $5a, $31, $5a, $31, $5a, $31 ; TEA
	db $5f, $2d, $5f, $2d, $5f, $2d ; JOEY
	db $50, $20, $50, $20, $50, $20 ; SETO_KAIBA
	db $5c, $3f, $5c, $3f, $5c, $3f ; MOKUBA
	db $5e, $31, $5e, $31, $5e, $31 ; TRISTAN
	db $53, $39, $53, $39, $53, $39 ; BAKURA
	db $5b, $35, $5b, $35, $5b, $35 ; PUPPETEER
	db $5a, $20, $5a, $20, $5a, $20 ; PANIK
	db $58, $30, $58, $30, $58, $30 ; BANDIT_KEITH
	db $50, $30, $50, $30, $50, $30 ; MAXIMILLION
	db $58, $40, $58, $40, $58, $40 ; SIMON
	db $c8, $d0, $c8, $d0, $c8, $d0 ; EXODIA

.Data_8b3b:
	db $4f, $4d, $4f, $4d, $4f, $4d ; WEEVIL
	db $51, $3b, $51, $3b, $51, $3b ; MAI
	db $48, $4a, $48, $4a, $48, $4a ; REX
	db $54, $36, $54, $36, $54, $36 ; MAKO
	db $50, $43, $50, $43, $50, $43 ; YAMI_YUGI
	db $56, $4d, $56, $4d, $56, $4d ; YUGI
	db $52, $41, $52, $41, $52, $41 ; TEA
	db $5f, $3d, $5f, $3d, $5f, $3d ; JOEY
	db $48, $30, $48, $30, $48, $30 ; SETO_KAIBA
	db $54, $4f, $54, $4f, $54, $4f ; MOKUBA
	db $58, $40, $58, $40, $58, $40 ; TRISTAN
	db $4a, $49, $4a, $49, $4a, $49 ; BAKURA
	db $2b, $59, $2b, $59, $2b, $59 ; PUPPETEER
	db $52, $28, $52, $28, $52, $28 ; PANIK
	db $52, $41, $52, $41, $52, $41 ; BANDIT_KEITH
	db $48, $40, $48, $40, $48, $40 ; MAXIMILLION
	db $50, $48, $50, $48, $50, $48 ; SIMON
	db $c8, $d0, $c8, $d0, $c8, $d0 ; EXODIA

Func_8ba7:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cd59]
	ld c, a
	ld hl, $4bca
	add hl, bc
	push hl
	sla c
	ld hl, $4bd0
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	ld a, [bc]
	rlca
	rlca
	add [hl]
	ld [$cd57], a
	pop hl
	pop bc
	pop af
	ret
; 0x8bca

SECTION "Bank 2@4bd6", ROMX[$4bd6], BANK[$2]

Func_8bd6:
	ld [$cd59], a
	ret

Func_8bda:
	push af
	ld a, $00
	ld [$cd5a], a
	ld a, $00
	ld [$cd5b], a
	pop af
	ret

Func_8be7:
	push af
	push bc
	ld c, a
	ld a, [$cd59]
	cp $02
	jr z, .asm_8bf7
	ld a, c
	ld [$cd5a], a
	jr .asm_8bfb
.asm_8bf7
	ld a, c
	ld [$cd5b], a
.asm_8bfb
	pop bc
	pop af
	ret

Func_8bfe:
	push af
	push bc
	push hl
	call Func_8bda
	ld a, $00
	call Func_8c1e
	ld a, $01
	call Func_8c1e
	ld a, $02
	call Func_8c1e
	pop hl
	pop bc
	pop af
	ret
; 0x8c17

SECTION "Bank 2@4c1e", ROMX[$4c1e], BANK[$2]

Func_8c1e:
	call Func_8bd6
	call Func_8a1d
	call Func_8ba7
	call Func_8c2b
	ret

Func_8c2b:
	push af
	push bc
	push hl
	ld b, $00
	ld a, [$cd59]
	rlca
	rlca
	rlca
	ld c, a
	ld hl, wVirtualOAM
	add hl, bc
	ld a, [$cd56]
	ld [hli], a ; y
	ld a, [$cd55]
	ld [hli], a ; x
	ld a, [$cd57]
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes
	ld a, [$cd56]
	ld [hli], a ; y
	ld a, [$cd55]
	add $08
	ld [hli], a ; x
	ld a, [$cd57]
	add $02
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes
	pop hl
	pop bc
	pop af
	ret

; loads OAM graphics that correspond
; to character in wNPCCharacter
LoadCharacterOAMGfx:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [wNPCCharacter]
	ld c, a
	sla c
	ld hl, .GfxTable
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, vTiles0
	ld b, $80 ; tiles
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

.GfxTable:
	dw WeevilOAMGfx      ; WEEVIL
	dw MaiOAMGfx         ; MAI
	dw RexOAMGfx         ; REX
	dw MakoOAMGfx        ; MAKO
	dw YamiYugiOAMGfx    ; YAMI_YUGI
	dw YugiOAMGfx        ; YUGI
	dw TeaOAMGfx         ; TEA
	dw JoeyOAMGfx        ; JOEY
	dw SetoKaibaOAMGfx   ; SETO_KAIBA
	dw MokubaOAMGfx      ; MOKUBA
	dw TristanOAMGfx     ; TRISTAN
	dw BakuraOAMGfx      ; BAKURA
	dw PuppeteerOAMGfx   ; PUPPETEER
	dw PanikOAMGfx       ; PANIK
	dw BanditKeithOAMGfx ; BANDIT_KEITH
	dw MaximillionOAMGfx ; MAXIMILLION
	dw SimonOAMGfx       ; SIMON
	dw ExodiaOAMGfx      ; EXODIA

WeevilOAMGfx:      INCBIN "gfx/characters/weevil_oam.2bpp"
MaiOAMGfx:         INCBIN "gfx/characters/mai_oam.2bpp"
RexOAMGfx:         INCBIN "gfx/characters/rex_oam.2bpp"
MakoOAMGfx:        INCBIN "gfx/characters/mako_oam.2bpp"
YamiYugiOAMGfx:    INCBIN "gfx/characters/yami_yugi_oam.2bpp"
YugiOAMGfx:        INCBIN "gfx/characters/yugi_oam.2bpp"
TeaOAMGfx:         INCBIN "gfx/characters/tea_oam.2bpp"
JoeyOAMGfx:        INCBIN "gfx/characters/joey_oam.2bpp"
SetoKaibaOAMGfx:   INCBIN "gfx/characters/seto_kaiba_oam.2bpp"
MokubaOAMGfx:      INCBIN "gfx/characters/mokuba_oam.2bpp"
TristanOAMGfx:     INCBIN "gfx/characters/tristan_oam.2bpp"
BakuraOAMGfx:      INCBIN "gfx/characters/bakura_oam.2bpp"
PuppeteerOAMGfx:   INCBIN "gfx/characters/puppeteer_oam.2bpp"
PanikOAMGfx:       INCBIN "gfx/characters/panik_oam.2bpp"
BanditKeithOAMGfx: INCBIN "gfx/characters/bandit_keith_oam.2bpp"
MaximillionOAMGfx: INCBIN "gfx/characters/maximillion_oam.2bpp"
SimonOAMGfx:       INCBIN "gfx/characters/simon_oam.2bpp"
ExodiaOAMGfx:      INCBIN "gfx/characters/exodia_oam.2bpp"

Func_b52c:
	push af
	call Func_29fd
	call ConvertNPCDuelistToCharacter
	ld [wNPCCharacter], a
	call GetDuelistPreDuelTextID
	ld [wTextID], a
	farcall Func_18008
	call Func_2abe
	call Func_884a
	pop af
	ret

Func_b547:
	push af
	call Func_29fd
	call ConvertNPCDuelistToCharacter
	ld [wNPCCharacter], a
	call GetDuelistLossTextID
	ld [wTextID], a
	farcall Func_18008
	call Func_2a76
	call Func_884a
	pop af
	ret

Func_b562:
	push af
	call Func_29fd
	call ConvertNPCDuelistToCharacter
	ld [wNPCCharacter], a
	call GetDuelistWinTextID
	ld [wTextID], a
	farcall Func_18008
	call Func_2a81
	call Func_884a
	pop af
	ret

Func_b57d:
	push af
	call PlayerLostDuel
	cp TRUE
	jr z, .asm_b58d
	call Func_b595
	call Func_b6c5
	jr .asm_b593
.asm_b58d
	call Func_b5e1
	call Func_b6c5
.asm_b593
	pop af
	ret

Func_b595:
	push af
	push bc
	push de
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3d159
	ld [wTextID], a
	call Func_2c4a
	ld e, $00
	ld a, [$cf14]
	add $01
	ld [$cadc], a
	ld a, [$cf15]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_2cf2
	ld e, $04
	ld a, [$cf14]
	ld c, a
	ld a, [$cf15]
	ld b, a
	call Func_2d01
	call IsValidCard
	cp TRUE
	jr nz, .asm_b5dd
	call Func_29fd
	farcall Func_18008
	call Func_2a76
	call Func_884a
.asm_b5dd
	pop de
	pop bc
	pop af
	ret

Func_b5e1:
	push af
	push bc
	push de
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3d174
	ld [wTextID], a
	call Func_2c4a
	ld e, $00
	ld a, [$cf14]
	add $01
	ld [$cadc], a
	ld a, [$cf15]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_2cf2
	ld e, $04
	ld a, [$cf14]
	ld c, a
	ld a, [$cf15]
	ld b, a
	call Func_2d01
	call IsValidCard
	cp TRUE
	jr nz, .asm_b629
	call Func_29fd
	farcall Func_18008
	call Func_2a81
	call Func_884a
.asm_b629
	pop de
	pop bc
	pop af
	ret

Func_b62d:
	push af
	push bc
	push de
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3d189
	ld [wTextID], a
	call Func_2c4a
	ld e, $00
	ld a, [$cf10]
	add $01
	ld [$cadc], a
	ld a, [$cf11]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_2cf2
	ld e, $04
	ld a, [$cf10]
	ld c, a
	ld a, [$cf11]
	ld b, a
	call Func_2d01
	call IsValidCard
	cp TRUE
	jr nz, .asm_b675
	call Func_29fd
	farcall Func_18008
	call Func_2a8c
	call Func_884a
.asm_b675
	pop de
	pop bc
	pop af
	ret

Func_b679:
	push af
	push bc
	push de
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3d1ae
	ld [wTextID], a
	call Func_2c4a
	ld e, $00
	ld a, [$cf12]
	add $01
	ld [$cadc], a
	ld a, [$cf13]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_2cf2
	ld e, $04
	ld a, [$cf12]
	ld c, a
	ld a, [$cf13]
	ld b, a
	call Func_2d01
	call IsValidCard
	cp TRUE
	jr nz, .asm_b6c1
	call Func_29fd
	farcall Func_18008
	call Func_2a8c
	call Func_884a
.asm_b6c1
	pop de
	pop bc
	pop af
	ret

Func_b6c5:
	push af
	push bc
	push de
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3d1db
	ld [wTextID], a
	call Func_2c4a
	ld e, $00
	ld a, [$cf12]
	add $01
	ld [$cadc], a
	ld a, [$cf13]
	adc $00
	ld [$cadd], a
	call Func_142c
	call Func_2cf2
	ld e, $04
	ld a, [$cf12]
	ld c, a
	ld a, [$cf13]
	ld b, a
	call Func_2d01
	call IsValidCard
	cp TRUE
	jr nz, .asm_b70d
	call Func_29fd
	farcall Func_18008
	call Func_2a8c
	call Func_884a
.asm_b70d
	pop de
	pop bc
	pop af
	ret
; 0xb711

SECTION "Bank 2@7724", ROMX[$7724], BANK[$2]

; converts wNPCDuelist DUELIST_* constant
; to corresponding character constant
ConvertNPCDuelistToCharacter:
	push bc
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	ld hl, .Characters
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.Characters:
	db WEEVIL       ; DUELIST_WEEVIL
	db MAI          ; DUELIST_MAI
	db REX          ; DUELIST_REX
	db MAKO         ; DUELIST_MAKO
	db SETO_KAIBA   ; DUELIST_SETO_KAIBA
	db MOKUBA       ; DUELIST_MOKUBA
	db PUPPETEER    ; DUELIST_PUPPETEER
	db PANIK        ; DUELIST_PANIK
	db BANDIT_KEITH ; DUELIST_BANDIT_KEITH
	db YUGI         ; DUELIST_YUGI
	db TRISTAN      ; DUELIST_TRISTAN
	db JOEY         ; DUELIST_JOEY
	db BAKURA       ; DUELIST_BAKURA
	db SIMON        ; DUELIST_SIMON
	db MAXIMILLION  ; DUELIST_MAXIMILLION
	db YAMI_YUGI    ; DUELIST_YAMI_YUGI

GetDuelistPreDuelTextID:
	push bc
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	call GetDuelistWinCount
	ld hl, .AlreadyBeatenTextIDs
	ld a, c
	cp LOW(0)
	jr nz, .not_zero
	ld a, b
	cp HIGH(0)
	jr nz, .not_zero
	; zero wins
	ld hl, .UnbeatenTextIDs
.not_zero
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.UnbeatenTextIDs:
	tx Text_3c179 ; DUELIST_WEEVIL
	tx Text_3c1b0 ; DUELIST_MAI
	tx Text_3c1e2 ; DUELIST_REX
	tx Text_3c215 ; DUELIST_MAKO
	tx Text_3c2dd ; DUELIST_SETO_KAIBA
	tx Text_3c314 ; DUELIST_MOKUBA
	tx Text_3c3b3 ; DUELIST_PUPPETEER
	tx Text_3c3eb ; DUELIST_PANIK
	tx Text_3c420 ; DUELIST_BANDIT_KEITH
	tx Text_3c274 ; DUELIST_YUGI
	tx Text_3c349 ; DUELIST_TRISTAN
	tx Text_3c2a8 ; DUELIST_JOEY
	tx Text_3c381 ; DUELIST_BAKURA
	tx Text_3c48a ; DUELIST_SIMON
	tx Text_3c455 ; DUELIST_MAXIMILLION
	tx Text_3c248 ; DUELIST_YAMI_YUGI

.AlreadyBeatenTextIDs:
	tx Text_3c4bd ; DUELIST_WEEVIL
	tx Text_3c4ef ; DUELIST_MAI
	tx Text_3c515 ; DUELIST_REX
	tx Text_3c531 ; DUELIST_MAKO
	tx Text_3c5d2 ; DUELIST_SETO_KAIBA
	tx Text_3c5f7 ; DUELIST_MOKUBA
	tx Text_3c664 ; DUELIST_PUPPETEER
	tx Text_3c67e ; DUELIST_PANIK
	tx Text_3c6ac ; DUELIST_BANDIT_KEITH
	tx Text_3c57d ; DUELIST_YUGI
	tx Text_3c613 ; DUELIST_TRISTAN
	tx Text_3c5a8 ; DUELIST_JOEY
	tx Text_3c638 ; DUELIST_BAKURA
	tx Text_3c70f ; DUELIST_SIMON
	tx Text_3c6dd ; DUELIST_MAXIMILLION
	tx Text_3c561 ; DUELIST_YAMI_YUGI

GetDuelistLossTextID:
	push bc
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	call GetDuelistWinCount
	ld hl, .DefaultTextIDs
	ld a, c
	cp LOW(5)
	jr nz, .not_5
	ld a, b
	cp HIGH(5)
	jr nz, .not_5
	ld hl, .Exactly5WinsTextIDs
.not_5
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.Exactly5WinsTextIDs:
	tx Text_3ccaf ; DUELIST_WEEVIL
	tx Text_3cce5 ; DUELIST_MAI
	tx Text_3cd17 ; DUELIST_REX
	tx Text_3cd48 ; DUELIST_MAKO
	tx Text_3cdf6 ; DUELIST_SETO_KAIBA
	tx Text_3ce2d ; DUELIST_MOKUBA
	tx Text_3ceae ; DUELIST_PUPPETEER
	tx Text_3cece ; DUELIST_PANIK
	tx Text_3cefd ; DUELIST_BANDIT_KEITH
	tx Text_3cd93 ; DUELIST_YUGI
	tx Text_3ce50 ; DUELIST_TRISTAN
	tx Text_3cdc7 ; DUELIST_JOEY
	tx Text_3ce7e ; DUELIST_BAKURA
	tx Text_3cf5f ; DUELIST_SIMON
	tx Text_3cf33 ; DUELIST_MAXIMILLION
	tx Text_3cd7e ; DUELIST_YAMI_YUGI

.DefaultTextIDs:
	tx Text_3ca22 ; DUELIST_WEEVIL
	tx Text_3ca50 ; DUELIST_MAI
	tx Text_3ca7d ; DUELIST_REX
	tx Text_3caae ; DUELIST_MAKO
	tx Text_3cb4d ; DUELIST_SETO_KAIBA
	tx Text_3cb78 ; DUELIST_MOKUBA
	tx Text_3cbea ; DUELIST_PUPPETEER
	tx Text_3cc09 ; DUELIST_PANIK
	tx Text_3cc2a ; DUELIST_BANDIT_KEITH
	tx Text_3caf8 ; DUELIST_YUGI
	tx Text_3cb98 ; DUELIST_TRISTAN
	tx Text_3cb2b ; DUELIST_JOEY
	tx Text_3cbb4 ; DUELIST_BAKURA
	tx Text_3cc84 ; DUELIST_SIMON
	tx Text_3cc56 ; DUELIST_MAXIMILLION
	tx Text_3cae3 ; DUELIST_YAMI_YUGI

GetDuelistWinTextID:
	push bc
	push hl
	ld b, $00
	ld a, [wNPCDuelist]
	ld c, a
	ld hl, .TextIDs
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

.TextIDs:
	tx Text_3c740 ; DUELIST_WEEVIL
	tx Text_3c76f ; DUELIST_MAI
	tx Text_3c796 ; DUELIST_REX
	tx Text_3c7c9 ; DUELIST_MAKO
	tx Text_3c88e ; DUELIST_SETO_KAIBA
	tx Text_3c8c2 ; DUELIST_MOKUBA
	tx Text_3c944 ; DUELIST_PUPPETEER
	tx Text_3c95d ; DUELIST_PANIK
	tx Text_3c98c ; DUELIST_BANDIT_KEITH
	tx Text_3c824 ; DUELIST_YUGI
	tx Text_3c8d9 ; DUELIST_TRISTAN
	tx Text_3c85b ; DUELIST_JOEY
	tx Text_3c90e ; DUELIST_BAKURA
	tx Text_3c9ef ; DUELIST_SIMON
	tx Text_3c9bf ; DUELIST_MAXIMILLION
	tx Text_3c7f4 ; DUELIST_YAMI_YUGI

Func_b7ee:
	push af
	call Func_29fd
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3cf94
	ld [wTextID], a
	farcall Func_18008
	call Func_2a8c
	call Func_884a
	pop af
	ret

Func_b807:
	push af
	call Func_29fd
	ld a, EXODIA
	ld [wNPCCharacter], a
	ldtx a, Text_3cfca
	ld [wTextID], a
	call Func_2b89
	farcall Func_18008
	call Func_884a
	call Func_25d4
	pop af
	ret

Func_b823:
	push af
	push bc
	push de
	call Func_29fd
	ld a, YAMI_YUGI
	ld [wNPCCharacter], a
	ldtx a, Text_3cffb
	ld [wTextID], a
	farcall Func_18008
	call Func_2a3f
	call Func_884a
	pop de
	pop bc
	pop af
	ret

Func_b840:
	push af
	push bc
	push de
	call Func_29fd
	ld a, YAMI_YUGI
	ld [wNPCCharacter], a
	ldtx a, Text_3d074
	ld [wTextID], a
	farcall Func_18008
	call Func_2a3f
	call Func_884a
	pop de
	pop bc
	pop af
	ret

Func_b85d:
	push af
	ld a, LOW(INVALID_CARD)
	ld [$cf10], a
	ld a, HIGH(INVALID_CARD)
	ld [$cf11], a
	ld a, LOW(INVALID_CARD)
	ld [$cf12], a
	ld a, HIGH(INVALID_CARD)
	ld [$cf13], a
	ld a, LOW(INVALID_CARD)
	ld [$cf14], a
	ld a, HIGH(INVALID_CARD)
	ld [$cf15], a
	pop af
	ret

Func_b87e:
	push af
	ld a, c
	ld [$cf10], a
	ld a, b
	ld [$cf11], a
	pop af
	ret

Func_b889:
	push af
	ld a, c
	ld [$cf12], a
	ld a, b
	ld [$cf13], a
	pop af
	ret

Func_b894:
	push af
	ld a, c
	ld [$cf14], a
	ld a, b
	ld [$cf15], a
	pop af
	ret
; 0xb89f

SECTION "Bank 2@78b2", ROMX[$78b2], BANK[$2]

Func_b8b2:
	push af
	call Func_29fd
	ld a, YAMI_YUGI
	ld [wNPCCharacter], a
	ldtx a, Text_3d0bc
	ld [wTextID], a
	farcall Func_18008
	call Func_2a3f
	call Func_884a
	pop af
	ret

Func_b8cb:
	push af
	call Func_29fd
	ld a, YAMI_YUGI
	ld [wNPCCharacter], a
	ldtx a, Text_3d0db
	ld [wTextID], a
	farcall Func_18008
	call Func_2a3f
	call Func_884a
	pop af
	ret

Func_b8e4:
	push af
	call Func_29fd
	ld a, YAMI_YUGI
	ld [wNPCCharacter], a
	ldtx a, Text_3d106
	ld [wTextID], a
	farcall Func_18008
	call Func_2a3f
	call Func_884a
	pop af
	ret
; 0xb8fd

SECTION "Bank 2@7916", ROMX[$7916], BANK[$2]

Func_b916:
	push af
	call Func_29fd
	ld a, TEA
	ld [wNPCCharacter], a
	ldtx a, Text_3d217
	ld [wTextID], a
	farcall Func_18008
	call Func_2a8c
	call Func_884a
	pop af
	ret
; 0xb92f
