	dw BANK(@)

	farcall_table_start
	farfunc Func_803e ; $03
	farfunc $4059 ; $05
	farfunc Func_883d ; $07
	farfunc $484a ; $09
	farfunc LoadCharacterOAMGfx ; $0b
	farfunc Func_8bfe ; $0d
	farfunc $4074 ; $0f
	farfunc $40b4 ; $11
	farfunc $752c ; $13
	farfunc $7547 ; $15
	farfunc $7562 ; $17
	farfunc $7724 ; $19
	farfunc $7711 ; $1b
	farfunc $77ee ; $1d
	farfunc $7807 ; $1f
	farfunc Func_b823 ; $21
	farfunc $7840 ; $23
	farfunc $757d ; $25
	farfunc $785d ; $27
	farfunc $787e ; $29
	farfunc $7889 ; $2b
	farfunc $7894 ; $2d
	farfunc $762d ; $2f
	farfunc $7679 ; $31
	farfunc $789f ; $33
	farfunc $78b2 ; $35
	farfunc $78cb ; $37
	farfunc $78e4 ; $39
	farfunc $78fd ; $3b
	farfunc $7916 ; $3d

Func_803e:
	push af
	push bc
	push de
	push hl
	ld hl, vTiles2
	ld de, TILE_SIZE
	ld a, $00
	ld b, $80 ; tiles
.loop
	call LoadCharacterTile
	add hl, de
	inc a
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x8059

SECTION "Bank 2@4074", ROMX[$4074], BANK[$2]

LoadCharacterTile:
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

Func_80b4:
	push af
	push bc
	push de
	push hl
	push hl
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Gfx_80d9
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld c, $08
.asm_80c8
	ld a, [de]
	call Func_f50
	ld a, [de]
	call Func_f50
	inc de
	dec c
	jr nz, .asm_80c8
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
	ld [$cd45], a
	ld a, $00
	ld [$cd47], a
	ld a, $00
	ld [$cd48], a
	ld a, $00
	ld [$cd49], a
	ld a, $00
	ld [$cd4a], a
	ld a, $00
	ld [$cd44], a
	call Func_86ec
	pop af
	ret

Func_8505:
	push af
	farcall $03, $0f
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
	ld a, [$cd4a]
	ld c, a
	sla c
	ld hl, $454d
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	call Func_f3d
	ld hl, $cd20
	ld e, $12
.asm_852c
	ld a, [hli]
	call Func_f50
	dec e
	jr nz, .asm_852c
	ld hl, $20
	add hl, bc
	ld b, h
	ld c, l
	call Func_f3d
	ld hl, $cd32
	ld e, $12
.asm_8541
	ld a, [hli]
	call Func_f50
	dec e
	jr nz, .asm_8541
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x854d

SECTION "Bank 2@4553", ROMX[$4553], BANK[$2]

Func_8553:
	push af
	push bc
	push de
	push hl
	call Func_8565
	ld a, [$cad0]
	call Func_80b4
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
	ld a, [$cd4a]
	ld c, a
	sla c
	ld hl, $458d
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld h, $00
	ld a, [$cd49]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld b, h
	ld c, l
	call Func_f3d
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
	ld a, [$cd46]
	cp $b0
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
	sub $b0
	ld c, a
	sla c
	ld hl, $45d9
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $45d0
	push bc
	jp hl
	ld a, $00
	ld [$cd53], a
.asm_85d5
	pop hl
	pop bc
	pop af
	ret
; 0x85d9

SECTION "Bank 2@45e3", ROMX[$45e3], BANK[$2]

Func_85e3:
	push af
	push bc
	push de
	push hl
	ld a, [$cd45]
	cp $01
	jr nz, .asm_8616
	ld a, $00
	ld [$cd44], a
	call Func_8710
	ld a, [$cd46]
	call Func_1144
	ld b, $00
	ld a, [$cd49]
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
	ld a, [$cd49]
	inc a
	ld [$cd49], a
	cp $12
	jr c, .asm_862f
	call Func_8655
	ld a, $01
	ld [$cd44], a
.asm_862f
	pop af
	ret

Func_8631:
	push af
	push bc
	push de
	push hl
	ld b, $00
	ld a, [$cd4a]
	ld c, a
	ld hl, $4652
	add hl, bc
	ld a, [$cd49]
	add [hl]
	ld e, a
	ld a, [$cd49]
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
	ld a, [$cd44]
	cp $00
	jr nz, .asm_8673
	ld a, $00
	ld [$cd49], a
	ld a, [$cd4a]
	inc a
	cp $03
	jr nz, .asm_866b
	dec a
.asm_866b
	ld [$cd4a], a
	call Func_86ec
	jr .asm_8678
.asm_8673
	ld a, $00
	ld [$cd44], a
.asm_8678
	pop af
	ret
; 0x867a

SECTION "Bank 2@46ec", ROMX[$46ec], BANK[$2]

Func_86ec:
	push af
	push bc
	push hl
	call Func_8710
	ld a, $00
	call Func_1144
	ld a, [$cacf]
	ld hl, $cd20
	ld c, $12
.asm_86ff
	ld [hli], a
	dec c
	jr nz, .asm_86ff
	ld a, [$cad0]
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
	ld a, [$cd4a]
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
	ld a, [$cd45]
	dec a
	ld [$cd45], a
	jr nz, .asm_8749
	ld a, [$cd46]
	cp $b0
	jr nc, .asm_873c
	ld a, $02
	ld [$cd45], a
	jr .asm_8749
.asm_873c
	ld b, $00
	sub $b0
	ld c, a
	ld hl, $474d
	add hl, bc
	ld a, [hl]
	ld [$cd45], a
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

SECTION "Bank 2@47aa", ROMX[$47aa], BANK[$2]

Func_87aa:
	call Func_87b1
	call Func_87d9
	ret

Func_87b1:
	push af
	push bc
	push hl
	ld a, [$cd4b]
	dec a
	ld [$cd4b], a
	jr nz, .asm_87d0
	ld a, $14
	ld [$cd4b], a
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
	call Func_f50
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
	ld a, $00
	ld [$cd51], a
	pop af
	ret

Func_884a:
	push af
	push bc
	ld a, $1d
	ld [$cd4c], a
	ld a, $01
	ld [$cd4d], a
	ld a, $11
	ld [$cd4e], a
	ld a, $01
	ld [$cd4f], a
	ld a, $00
	ld [$cd53], a
	ld a, $00
	ld [$cd52], a
	call Func_84e1
.asm_886d
	call AdvanceRNG
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
	call Func_f74
	ld a, [$cd52]
	cp $05
	jr z, .asm_889c
	jr .asm_886d
.asm_889c
	pop bc
	pop af
	ret

Func_889f:
	push af
	push bc
	push de
	push hl
	ld a, [$cd4d]
	dec a
	ld [$cd4d], a
	jr nz, .asm_88c8
	ld b, $00
	ld a, [$cd4c]
	ld c, a
	ld hl, $48cd
	add hl, bc
	ld a, [hl]
	ld [$cd4d], a
	call Func_8909
	ld a, c
	dec a
	cp $ff
	jr nz, .asm_88c5
	ld a, $1d
.asm_88c5
	ld [$cd4c], a
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
	ld a, [$cd4c]
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
	ld [$cd4f], a
	ld a, $11
	ld [$cd4e], a
	jr .asm_8984
.asm_895f
	ld a, [$cd4f]
	dec a
	ld [$cd4f], a
	jr nz, .asm_8984
	ld b, $00
	ld a, [$cd4e]
	ld c, a
	ld hl, $4989
	add hl, bc
	ld a, [hl]
	ld [$cd4f], a
	call Func_89ad
	ld a, c
	dec a
	cp $ff
	jr nz, .asm_8981
	ld a, $11
.asm_8981
	ld [$cd4e], a
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
	ld a, [$cd4e]
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
	db $40, $28, $40, $28, $40, $28 ; SETO
	db $44, $3f, $44, $3f, $44, $3f ; MOKUBA
	db $46, $31, $46, $31, $46, $31 ; TRISTAN
	db $3b, $39, $3b, $39, $3b, $39 ; BAKURA
	db $44, $35, $44, $35, $44, $35 ; PUPPETEER
	db $4a, $20, $4a, $20, $4a, $20 ; PANIK
	db $48, $30, $48, $30, $48, $30 ; BANDIT
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
	db $50, $20, $50, $20, $50, $20 ; SETO
	db $5c, $3f, $5c, $3f, $5c, $3f ; MOKUBA
	db $5e, $31, $5e, $31, $5e, $31 ; TRISTAN
	db $53, $39, $53, $39, $53, $39 ; BAKURA
	db $5b, $35, $5b, $35, $5b, $35 ; PUPPETEER
	db $5a, $20, $5a, $20, $5a, $20 ; PANIK
	db $58, $30, $58, $30, $58, $30 ; BANDIT
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
	db $48, $30, $48, $30, $48, $30 ; SETO
	db $54, $4f, $54, $4f, $54, $4f ; MOKUBA
	db $58, $40, $58, $40, $58, $40 ; TRISTAN
	db $4a, $49, $4a, $49, $4a, $49 ; BAKURA
	db $2b, $59, $2b, $59, $2b, $59 ; PUPPETEER
	db $52, $28, $52, $28, $52, $28 ; PANIK
	db $52, $41, $52, $41, $52, $41 ; BANDIT
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
	dw SetoOAMGfx        ; SETO
	dw MokubaOAMGfx      ; MOKUBA
	dw TristanOAMGfx     ; TRISTAN
	dw BakuraOAMGfx      ; BAKURA
	dw PuppeteerOAMGfx   ; PUPPETEER
	dw PanikOAMGfx       ; PANIK
	dw BanditOAMGfx      ; BANDIT
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
SetoOAMGfx:        INCBIN "gfx/characters/seto_oam.2bpp"
MokubaOAMGfx:      INCBIN "gfx/characters/mokuba_oam.2bpp"
TristanOAMGfx:     INCBIN "gfx/characters/tristan_oam.2bpp"
BakuraOAMGfx:      INCBIN "gfx/characters/bakura_oam.2bpp"
PuppeteerOAMGfx:   INCBIN "gfx/characters/puppeteer_oam.2bpp"
PanikOAMGfx:       INCBIN "gfx/characters/panik_oam.2bpp"
BanditOAMGfx:      INCBIN "gfx/characters/bandit_oam.2bpp"
MaximillionOAMGfx: INCBIN "gfx/characters/maximillion_oam.2bpp"
SimonOAMGfx:       INCBIN "gfx/characters/simon_oam.2bpp"
ExodiaOAMGfx:      INCBIN "gfx/characters/exodia_oam.2bpp"
; 0xb52c

SECTION "Bank 02@7823", ROMX[$7823], BANK[$02]

Func_b823:
	push af
	push bc
	push de
	call Func_29fd
	ld a, YAMI_YUGI
	ld [wNPCCharacter], a
	ld a, $53
	ld [$cd51], a
	farcall Func_18008
	call Func_2a3f
	call Func_884a
	pop de
	pop bc
	pop af
	ret
; 0xb840
