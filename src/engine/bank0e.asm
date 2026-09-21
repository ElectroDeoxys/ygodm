	dw BANK(@)

	farcall_table_start
	farfunc Func_38004

Func_38004:
	push af
	call Func_38032
	ld a, [wced1]
	and $10
	jr z, .asm_38012
	call Func_38039
.asm_38012
	ld a, [wced1]
	and $04
	jr z, .asm_3801c
	call Func_392da
.asm_3801c
	ld a, [wcedc]
	and $10
	jr z, .asm_38026
	call Func_38089
.asm_38026
	ld a, [wcedc]
	and $04
	jr z, .asm_38030
	call Func_39344
.asm_38030
	pop af
	ret

Func_38032:
	call Func_1328
	call Func_102c
	ret

Func_38039:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call LoadAttackGfx
	call Func_2b7e
	ld c, $00
.asm_38048
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, Data_38079
	add hl, de
	ld a, [hli]
	cp $ff
	jr z, .asm_3806e
	ld b, a
	call Func_380c9
.asm_3805d
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	IF DEF(_EARLY_DAYS)
		call Func_3f23
	ELSE
		call WaitForVBlank
	ENDC
	dec b
	jr nz, .asm_3805d
	inc c
	jr nz, .asm_38048
.asm_3806e
	call Func_2536
	call Func_397e9
	pop hl
	pop de
	pop bc
	pop af
	ret

Data_38079:
	dbw $04, Data_380ef
	dbw $03, Data_38118
	dbw $03, Data_38149
	dbw $03, Data_3818a
	dbw $30, Data_381df
	db $ff ; end

Func_38089:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call LoadAttackGfx
	call Func_2b7e
	ld c, $00
.asm_38098
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, Data_38079
	add hl, de
	ld a, [hli]
	cp $ff
	jr z, .asm_380be
	ld b, a
	call Func_3824c
.asm_380ad
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	IF DEF(_EARLY_DAYS)
		call Func_3f23
	ELSE
		call WaitForVBlank
	ENDC
	dec b
	jr nz, .asm_380ad
	inc c
	jr nz, .asm_38098
.asm_380be
	call Func_2536
	call Func_397e9
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_380c9:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_04
	call SetPendingVBlankMode
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld e, a
.asm_380d7
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, a
	inc hl
	call Func_132c
	dec e
	jr nz, .asm_380d7
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Data_380ef:
	db $0a, $68, $40, $12, $00, $68, $38, $10, $00, $58, $40, $0e, $00, $58, $38, $0c
	db $00, $48, $40, $0a, $00, $48, $38, $08, $00, $48, $30, $06, $00, $38, $40, $04
	db $00, $38, $38, $02, $00, $38, $30, $00, $00

Data_38118:
	db $0c, $68, $30, $26, $00, $68, $38, $28, $00, $48, $38, $1c, $00, $38, $38, $16
	db $00, $58, $38, $22, $00, $58, $30, $20, $00, $48, $30, $1a, $00, $38, $30, $14
	db $00, $68, $40, $2a, $00, $58, $40, $24, $00, $48, $40, $3a, $00, $38, $40, $32
	db $00

Data_38149:
	db $10, $68, $30, $44, $00, $68, $28, $42, $00, $58, $30, $3e, $00, $58, $28, $3c
	db $00, $48, $30, $36, $00, $48, $28, $34, $00, $38, $28, $2c, $00, $68, $38, $5e
	db $00, $68, $40, $2a, $00, $58, $38, $40, $00, $58, $40, $24, $00, $48, $40, $3a
	db $00, $48, $38, $38, $00, $38, $40, $32, $00, $38, $38, $30, $00, $38, $30, $2e
	db $00

Data_3818a:
	db $15, $78, $28, $62, $00, $78, $20, $60, $00, $68, $28, $5a, $00, $68, $20, $58
	db $00, $58, $28, $54, $00, $58, $20, $52, $00, $48, $20, $4c, $00, $68, $30, $5c
	db $00, $68, $38, $5e, $00, $68, $40, $2a, $00, $58, $30, $56, $00, $58, $38, $40
	db $00, $58, $40, $24, $00, $48, $40, $3a, $00, $48, $38, $38, $00, $48, $30, $50
	db $00, $48, $28, $4e, $00, $38, $28, $4a, $00, $38, $40, $32, $00, $38, $38, $30
	db $00, $38, $30, $2e, $00

Data_381df:
	db $1b, $68, $10, $70, $00, $78, $18, $78, $00, $78, $20, $7a, $00, $78, $28, $7c
	db $00, $68, $18, $72, $00, $68, $20, $74, $00, $68, $28, $76, $00, $68, $30, $5c
	db $00, $68, $38, $5e, $00, $68, $40, $2a, $00, $58, $10, $68, $00, $58, $18, $6a
	db $00, $58, $20, $6c, $00, $58, $28, $6e, $00, $58, $30, $56, $00, $58, $38, $40
	db $00, $58, $40, $24, $00, $48, $40, $3a, $00, $48, $38, $38, $00, $48, $30, $50
	db $00, $48, $28, $4e, $00, $48, $20, $66, $00, $48, $18, $64, $00, $38, $28, $4a
	db $00, $38, $40, $32, $00, $38, $38, $30, $00, $38, $30, $2e, $00

Func_3824c:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_04
	call SetPendingVBlankMode
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld e, a
.asm_3825a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add $50
	ld b, a
	ld a, [hli]
	ld d, a
	inc hl
	call Func_132c
	dec e
	jr nz, .asm_3825a
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

LoadAttackGfx:
	push af
	push bc
	push de
	push hl
	ld bc, vTiles0
	ld hl, AttackGfx
	ld e, $10
.asm_38280
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	push hl
	ld hl, 8 tiles
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld d, 8 tiles
.asm_38292
	ld a, [hli]
	call AddByteToVBlankStruct
	dec d
	jr nz, .asm_38292
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_38280
	pop hl
	pop de
	pop bc
	pop af
	ret

AttackGfx: INCBIN "gfx/duel/attack.2bpp"

LoadDestroyGfx:
	push af
	push bc
	push de
	push hl
	ld bc, vTiles0
	ld hl, DestroyGfx
	ld e, $10
.asm_38ab3
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	push hl
	ld hl, 8 tiles
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld d, 8 tiles
.asm_38ac5
	ld a, [hli]
	call AddByteToVBlankStruct
	dec d
	jr nz, .asm_38ac5
	call RequestVBlankMode
	call WaitForVBlank
	dec e
	jr nz, .asm_38ab3
	pop hl
	pop de
	pop bc
	pop af
	ret

DestroyGfx: INCBIN "gfx/duel/destroy.2bpp"

Func_392da:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call LoadDestroyGfx
	call Func_2b73
	ld c, $00
.asm_392e9
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, Data_39328
	add hl, de
	ld a, [hli]
	cp $ff
	jr z, .asm_3930f
	ld b, a
	call Func_39392
.asm_392fe
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	IF DEF(_EARLY_DAYS)
		call Func_3f23
	ELSE
		call WaitForVBlank
	ENDC
	dec b
	jr nz, .asm_392fe
	inc c
	jr nz, .asm_392e9
.asm_3930f
	ld a, VBLANK_0A
	call SetPendingVBlankMode
	farcall Func_602b
	call RequestVBlankMode
	call WaitForVBlank
	call Func_2536
	call Func_397e9
	pop hl
	pop de
	pop bc
	pop af
	ret

Data_39328:
	dbw $03, Data_393b8
	dbw $03, Data_393d9
	dbw $03, Data_3941a
	dbw $03, Data_39463
	dbw $03, Data_394c4
	dbw $03, Data_39545
	dbw $03, Data_395de
	dbw $03, Data_3967f
	dbw $20, Data_39720
	db $ff ; end

Func_39344:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call LoadDestroyGfx
	call Func_2b73
	ld c, $00
.asm_39353
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, Data_39328
	add hl, de
	ld a, [hli]
	cp $ff
	jr z, .asm_39379
	ld b, a
	call Func_397c1
.asm_39368
	ld a, VBLANK_02
	call SetPendingVBlankMode
	call RequestVBlankMode
	IF DEF(_EARLY_DAYS)
		call Func_3f23
	ELSE
		call WaitForVBlank
	ENDC
	dec b
	jr nz, .asm_39368
	inc c
	jr nz, .asm_39353
.asm_39379
	ld a, VBLANK_0A
	call SetPendingVBlankMode
	farcall Func_6034
	call RequestVBlankMode
	call WaitForVBlank
	call Func_2536
	call Func_397e9
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_39392:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_04
	call SetPendingVBlankMode
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld e, a
.asm_393a0
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, a
	inc hl
	call Func_132c
	dec e
	jr nz, .asm_393a0
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Data_393b8:
	db $08, $78, $48, $20, $00, $78, $40, $1e, $00, $78, $38, $1c, $00, $78, $30, $1a
	db $00, $78, $28, $18, $00, $78, $20, $16, $00, $78, $18, $14, $00, $78, $10, $12
	db $00

Data_393d9:
	db $10, $78, $30, $0a, $00, $78, $28, $0a, $00, $68, $48, $30, $00, $68, $40, $2e
	db $00, $68, $38, $2c, $00, $68, $30, $2a, $00, $68, $28, $28, $00, $68, $20, $26
	db $00, $68, $18, $24, $00, $68, $10, $22, $00, $78, $38, $3c, $00, $78, $48, $0c
	db $00, $78, $40, $0a, $00, $78, $20, $36, $00, $78, $18, $34, $00, $78, $10, $32
	db $00

Data_3941a:
	db $12, $68, $48, $48, $00, $60, $40, $76, $00, $60, $38, $74, $00, $70, $40, $00
	db $00, $70, $38, $00, $00, $68, $30, $46, $00, $68, $28, $44, $00, $68, $20, $42
	db $00, $68, $18, $40, $00, $68, $10, $3e, $00, $78, $48, $0c, $00, $78, $40, $0a
	db $00, $78, $38, $0a, $00, $78, $30, $0a, $00, $78, $28, $0a, $00, $78, $20, $0a
	db $00, $78, $18, $0a, $00, $78, $10, $08, $00

Data_39463:
	db $18, $68, $38, $50, $00, $68, $20, $4e, $00, $68, $18, $4c, $00, $68, $10, $4a
	db $00, $68, $30, $00, $00, $68, $28, $00, $00, $58, $48, $30, $00, $58, $40, $2e
	db $00, $58, $38, $2c, $00, $58, $30, $2a, $00, $58, $28, $28, $00, $58, $20, $26
	db $00, $58, $18, $24, $00, $58, $10, $22, $00, $68, $48, $10, $00, $68, $40, $00
	db $00, $78, $48, $0c, $00, $78, $40, $0a, $00, $78, $38, $0a, $00, $78, $30, $0a
	db $00, $78, $28, $0a, $00, $78, $20, $0a, $00, $78, $18, $0a, $00, $78, $10, $08
	db $00

Data_394c4:
	db $20, $5d, $48, $3a, $00, $5d, $30, $5e, $00, $5d, $28, $5c, $00, $5d, $20, $5a
	db $00, $5d, $18, $58, $00, $5d, $10, $56, $00, $5d, $40, $00, $00, $5d, $38, $00
	db $00, $4d, $48, $78, $00, $4d, $40, $76, $00, $4d, $38, $74, $00, $4d, $30, $72
	db $00, $4d, $28, $70, $00, $4d, $20, $6e, $00, $4d, $18, $6c, $00, $4d, $10, $6a
	db $00, $68, $40, $00, $00, $68, $38, $00, $00, $68, $30, $00, $00, $68, $28, $00
	db $00, $68, $20, $00, $00, $68, $18, $00, $00, $68, $48, $10, $00, $78, $48, $0c
	db $00, $78, $40, $0a, $00, $78, $38, $0a, $00, $78, $30, $0a, $00, $78, $28, $0a
	db $00, $78, $20, $0a, $00, $78, $18, $0a, $00, $78, $10, $08, $00, $68, $10, $0e
	db $00

Data_39545:
	db $26, $4c, $48, $54, $00, $4c, $10, $52, $00, $54, $38, $50, $00, $54, $40, $4c
	db $00, $54, $18, $4c, $00, $54, $20, $4e, $00, $54, $30, $00, $00, $54, $28, $00
	db $00, $44, $40, $2e, $00, $44, $38, $2c, $00, $44, $30, $2a, $00, $44, $28, $28
	db $00, $44, $20, $26, $00, $44, $18, $24, $00, $68, $40, $00, $00, $68, $38, $00
	db $00, $68, $30, $00, $00, $68, $28, $00, $00, $68, $20, $00, $00, $68, $18, $00
	db $00, $58, $40, $00, $00, $58, $38, $00, $00, $58, $30, $00, $00, $58, $28, $00
	db $00, $58, $20, $00, $00, $58, $18, $00, $00, $68, $48, $10, $00, $58, $48, $10
	db $00, $78, $48, $0c, $00, $78, $40, $0a, $00, $78, $38, $0a, $00, $78, $30, $0a
	db $00, $78, $28, $0a, $00, $78, $20, $0a, $00, $78, $18, $0a, $00, $78, $10, $08
	db $00, $68, $10, $0e, $00, $58, $10, $0e, $00

Data_395de:
	db $28, $4c, $48, $3a, $00, $4c, $30, $5e, $00, $4c, $28, $5c, $00, $4c, $20, $5a
	db $00, $4c, $18, $58, $00, $4c, $10, $56, $00, $4c, $40, $00, $00, $4c, $38, $00
	db $00, $3c, $48, $78, $00, $3c, $40, $76, $00, $3c, $38, $74, $00, $3c, $30, $72
	db $00, $3c, $28, $70, $00, $3c, $20, $6e, $00, $3c, $18, $6c, $00, $3c, $10, $6a
	db $00, $68, $40, $00, $00, $68, $38, $00, $00, $68, $30, $00, $00, $68, $28, $00
	db $00, $68, $20, $00, $00, $68, $18, $00, $00, $58, $40, $00, $00, $58, $38, $00
	db $00, $58, $30, $00, $00, $58, $28, $00, $00, $58, $20, $00, $00, $58, $18, $00
	db $00, $68, $48, $10, $00, $58, $48, $10, $00, $78, $48, $0c, $00, $78, $40, $0a
	db $00, $78, $38, $0a, $00, $78, $30, $0a, $00, $78, $28, $0a, $00, $78, $20, $0a
	db $00, $78, $18, $0a, $00, $78, $10, $08, $00, $68, $10, $0e, $00, $58, $10, $0e
	db $00

Data_3967f:
	db $28, $38, $48, $7e, $00, $38, $40, $7c, $00, $38, $38, $7a, $00, $38, $30, $68
	db $00, $38, $28, $66, $00, $38, $20, $64, $00, $38, $18, $62, $00, $38, $10, $60
	db $00, $68, $40, $00, $00, $68, $38, $00, $00, $68, $30, $00, $00, $68, $28, $00
	db $00, $68, $20, $00, $00, $68, $18, $00, $00, $58, $40, $00, $00, $58, $38, $00
	db $00, $58, $30, $00, $00, $58, $28, $00, $00, $58, $20, $00, $00, $58, $18, $00
	db $00, $48, $40, $00, $00, $48, $38, $00, $00, $48, $30, $00, $00, $48, $28, $00
	db $00, $48, $20, $00, $00, $48, $18, $00, $00, $68, $48, $10, $00, $58, $48, $10
	db $00, $48, $48, $10, $00, $78, $48, $0c, $00, $78, $40, $0a, $00, $78, $38, $0a
	db $00, $78, $30, $0a, $00, $78, $28, $0a, $00, $78, $20, $0a, $00, $78, $18, $0a
	db $00, $78, $10, $08, $00, $68, $10, $0e, $00, $58, $10, $0e, $00, $48, $10, $0e
	db $00

Data_39720:
	db $28, $68, $40, $00, $00, $68, $38, $00, $00, $68, $30, $00, $00, $68, $28, $00
	db $00, $68, $20, $00, $00, $68, $18, $00, $00, $58, $40, $00, $00, $58, $38, $00
	db $00, $58, $30, $00, $00, $58, $28, $00, $00, $58, $20, $00, $00, $58, $18, $00
	db $00, $48, $40, $00, $00, $48, $38, $00, $00, $48, $30, $00, $00, $48, $28, $00
	db $00, $48, $20, $00, $00, $48, $18, $00, $00, $68, $48, $10, $00, $58, $48, $10
	db $00, $48, $48, $10, $00, $78, $48, $0c, $00, $78, $40, $0a, $00, $78, $38, $0a
	db $00, $78, $30, $0a, $00, $78, $28, $0a, $00, $78, $20, $0a, $00, $78, $18, $0a
	db $00, $78, $10, $08, $00, $68, $10, $0e, $00, $58, $10, $0e, $00, $48, $10, $0e
	db $00, $38, $48, $06, $00, $38, $40, $04, $00, $38, $38, $04, $00, $38, $30, $04
	db $00, $38, $28, $04, $00, $38, $20, $04, $00, $38, $18, $04, $00, $38, $10, $02
	db $00

Func_397c1:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_04
	call SetPendingVBlankMode
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld e, a
.asm_397cf
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add $50
	ld b, a
	ld a, [hli]
	ld d, a
	inc hl
	call Func_132c
	dec e
	jr nz, .asm_397cf
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_397e9:
	push af
	push bc
	push de
	push hl
	ld a, VBLANK_04
	call SetPendingVBlankMode
	ld e, $28
.asm_397f4
	ld a, $ff
	ld c, a
	ld a, $ff
	ld b, a
	ld a, $00
	ld d, a
	call Func_132c
	dec e
	jr nz, .asm_397f4
	call RequestVBlankMode
	call WaitForVBlank
	pop hl
	pop de
	pop bc
	pop af
	ret
