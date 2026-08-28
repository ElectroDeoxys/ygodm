	dw BANK(@)

	farcall_table_start
	farfunc $4068 ; $03
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
	farfunc $6804 ; $4f
	farfunc $6622 ; $51
	farfunc $6736 ; $53
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
	call Func_1cef
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
