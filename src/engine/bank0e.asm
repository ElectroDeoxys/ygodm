	dw BANK(@)

	farcall_table_start
	farfunc Func_38004

SECTION "Bank e@4004", ROMX[$4004], BANK[$e]

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
	call Func_38274
	call Func_2b7e
	ld c, $00
.asm_38048
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, $4079
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
	call WaitForVBlank
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
; 0x38079

SECTION "Bank e@4089", ROMX[$4089], BANK[$e]

Func_38089:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call Func_38274
	call Func_2b7e
	ld c, $00
.asm_38098
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, $4079
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
	call WaitForVBlank
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
; 0x380ef

SECTION "Bank e@424c", ROMX[$424c], BANK[$e]

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

Func_38274:
	push af
	push bc
	push de
	push hl
	ld bc, vTiles0
	ld hl, $42a7
	ld e, $10
.asm_38280
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	push hl
	ld hl, $80
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld d, $80
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
; 0x382a7

SECTION "Bank e@4aa7", ROMX[$4aa7], BANK[$e]

Func_38aa7:
	push af
	push bc
	push de
	push hl
	ld bc, vTiles0
	ld hl, $4ada
	ld e, $10
.asm_38ab3
	ld a, VBLANK_08
	call SetPendingVBlankMode
	call AddWordToVBlankStruct
	push hl
	ld hl, $80
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld d, $80
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
; 0x38ada

SECTION "Bank e@52da", ROMX[$52da], BANK[$e]

Func_392da:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call Func_38aa7
	call Func_2b73
	ld c, $00
.asm_392e9
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, $5328
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
	call WaitForVBlank
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
; 0x39328

SECTION "Bank e@5344", ROMX[$5344], BANK[$e]

Func_39344:
	push af
	push bc
	push de
	push hl
	call Func_255a
	call Func_38aa7
	call Func_2b73
	ld c, $00
.asm_39353
	ld d, $00
	ld e, c
	sla e
	ld a, c
	add e
	ld e, a
	ld hl, $5328
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
	call WaitForVBlank
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
; 0x393b8

SECTION "Bank e@57c1", ROMX[$57c1], BANK[$e]

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
; 0x3980e
