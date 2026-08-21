_Start:
	ldh [$ffdd], a
	ld hl, $e000
	ld sp, hl
	call Func_1090
	farcall $05, $04
	ld a, $00
	farcall $03, $3f
	farcall $03, $3e
	call InitTransferVirtualOAM
	call Func_396
	call Func_dd8
	call Func_19f

	ld a, $02
	farcall $03, $3f
	farcall $49, $01
	ld a, $04
	farcall $03, $3f
	farcall $4b, $01
	ld a, $06
	farcall $03, $3f
	call Func_40c
	farcall $4d, $01

	farcall $03, $04

	call Func_1724
	ld a, $16
	call Func_de3
	call Func_f2f
	call Func_2d1f
	debug_loop
	ret

Func_19f:
	push af
	push hl
	di
	call Func_1fe6
	ld hl, rIE
	res B_IE_SERIAL, [hl]
	ld hl, rIF
	res B_IE_SERIAL, [hl]
	ld a, $00
	ld [$caa1], a
	xor a
	ld [$caa4], a
	ld [$caa2], a
	ld [$caa3], a
	ld [$caa0], a
	ldh [rSC], a
	ld a, $00
	ldh [rSB], a
	ld hl, rSC
	res B_SC_SOURCE, [hl]
	ei
	pop hl
	pop af
	ret

Serial:
	push af
	push bc
	push de
	push hl
	ld a, [$caa1]
	cp $00
	jr nz, .asm_1e0
	call Func_1f6
	jr .asm_1f0
.asm_1e0
	cp $02
	jr nz, .asm_1e9
	call Func_20f
	jr .asm_1f0
.asm_1e9
	cp $04
	jr nz, .asm_1f0
	call Func_21a
.asm_1f0
	pop hl
	pop de
	pop bc
	pop af
	reti

	ret

Func_1f6:
	ldh a, [rSB]
	ld [$caa2], a
	cp $20
	jr z, .asm_20e
	ld a, $00
	ldh [rSB], a
	call Func_376
	ld a, SC_EXTERNAL
	ldh [rSC], a
	ld a, SC_START
	ldh [rSC], a
.asm_20e
	ret

Func_20f:
	ldh a, [rSB]
	ld [$caa2], a
	ld a, $01
	ld [$caa0], a
	ret

Func_21a:
	ldh a, [rSB]
	ld [$caa2], a
	ld c, a
	and $f0
	cp $80
	jr nz, .asm_22e
	ld a, [$caa2]
	call Func_2025
	jr .asm_235
.asm_22e
	cp $50
	jr z, .asm_235
	call Func_1e65
.asm_235
	ld a, [$caa3]
	ldh [rSB], a
	ld hl, rSC
	set B_SC_START, [hl]
	ld a, $01
	ld [$caa0], a
	xor a
	ld [$caad], a
	ld [$caae], a
	ld [$caaf], a
	ret
; 0x24f

SECTION "Home@376", ROM0[$376]

Func_376:
	push af
	xor a
.asm_378
	nop
	nop
	dec a
	jr nz, .asm_378
	pop af
	ret
; 0x37f

SECTION "Home@396", ROM0[$396]

Func_396:
	push af
	ld a, $ff
	ld [$caa5], a
	xor a
	ld [$caa6], a
	ld [$caa7], a
	ld a, $14
	ld [$caa8], a
	pop af
	ret
; 0x3aa

SECTION "Home@40c", ROM0[$40c]

Func_40c:
	push hl
	di
	ld hl, rIF
	res B_IF_VBLANK, [hl]
	ld l, LOW(rIE)
	set B_IF_VBLANK, [hl]
	ei
	pop hl
	ret

VBlank:
	push af
	push hl
	push bc
	push de
	ld b, $00
	ld a, [$caac]
	ld c, a
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Func_444
	dw $45d
	dw $483
	dw $4ac
	dw $51f
	dw $6ce
	dw $826
	dw $900
	dw $a0a
	dw $b62
	dw $bf0
	dw Func_2d57

Func_444:
	ld c, $e4
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ld c, $e5
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	call Func_1705
	db $e0
	call Func_1705
	db $e1
	pop de
	pop bc
	pop hl
	pop af
	reti
; 0x45d

SECTION "Home@dd8", ROM0[$dd8]

Func_dd8:
	push af
	ld a, $00
	ld [$caab], a
	ld [$caac], a
	pop af
	ret

Func_de3::
	push af
	push bc
	push hl
	ld [$caab], a
	ld c, a
	ld b, $00
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .ret
	push bc
	jp hl
.ret
	ld a, $00
	ld [$caaa], a
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw .Func_e19
	dw .Func_e19
	dw .Func_e19
	dw .Func_e1a
	dw .Func_e3f
	dw .Func_e40
	dw .Func_e4d
	dw .Func_e6a
	dw .Func_eb7
	dw .Func_ee4
	dw .Func_f11
	dw .Func_f2e

.Func_e19:
	ret

.Func_e1a:
	push af
	push hl
	ld hl, $c500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld bc, $c516
	ld a, $18
	ld [hli], a
	ld [hl], $c5
	ld hl, $c52c
	ld a, $2e
	ld [hli], a
	ld [hl], $c5
	ld hl, $c542
	ld a, $42
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_e3f:
	ret

.Func_e40:
	push af
	push hl
	ld hl, $c500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_e4d:
	push af
	push hl
	ld hl, $c500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c514
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, $c528
	ld a, $2a
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_e6a:
	push af
	push hl
	ld hl, $c500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c50a
	ld a, $0c
	ld [hli], a
	ld [hl], $c5
	ld hl, $c514
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, $c51a
	ld a, $1c
	ld [hli], a
	ld [hl], $c5
	ld hl, $c520
	ld a, $22
	ld [hli], a
	ld [hl], $c5
	ld hl, $c526
	ld a, $28
	ld [hli], a
	ld [hl], $c5
	ld hl, $c52c
	ld a, $2e
	ld [hli], a
	ld [hl], $c5
	ld hl, $c536
	ld a, $38
	ld [hli], a
	ld [hl], $c5
	ld hl, $c540
	ld a, $42
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_eb7:
	push af
	push hl
	ld hl, $c500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c514
	ld a, $16
	ld [hli], a
	ld [hl], $c5
	ld hl, $c528
	ld a, $2a
	ld [hli], a
	ld [hl], $c5
	ld hl, $c53c
	ld a, $3e
	ld [hli], a
	ld [hl], $c5
	ld hl, $c550
	ld a, $52
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_ee4:
	push af
	push hl
	ld hl, $c500
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c506
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c50c
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c512
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	ld hl, $c518
	ld a, $de
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_f11:
	push af
	push hl
	ld hl, $c500
	ld a, $02
	ld [hli], a
	ld [hl], $c5
	ld hl, $c50a
	ld a, $0c
	ld [hli], a
	ld [hl], $c5
	ld hl, $c58a
	ld a, $8c
	ld [hli], a
	ld [hl], $c5
	pop hl
	pop af
	ret

.Func_f2e:
	ret

Func_f2f::
	push af
	ld a, [$caab]
	ld [$caac], a
	ld a, $00
	ld [$caab], a
	pop af
	ret

Func_f3d::
	push af
	push hl
	ld h, $c5
	ld a, [$caaa]
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, l
	ld [$caaa], a
	pop hl
	pop af
	ret

Func_f50::
	push af
	push hl
	push af
	ld h, $c5
	ld a, [$caaa]
	ld l, a
	pop af
	ld [hli], a
	ld a, l
	ld [$caaa], a
	pop hl
	pop af
	ret
; 0xf62

SECTION "Home@f74", ROM0[$f74]

Func_f74::
	push af
	call Func_177b
	db $80, $e4
.asm_f7a
	call Func_168f
	call Func_175a
	db $80, $e4
	jr z, .asm_f7a
	pop af
	ret
; 0xf86

SECTION "Home@100e", ROM0[$100e]

Func_100e::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $d2
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_101d::
	push af
	ld a, $00
	ldh [rBGP], a
	ld a, $00
	ldh [rOBP0], a
	ld a, $00
	ldh [rOBP1], a
	pop af
	ret
; 0x102c

SECTION "Home@1033", ROM0[$1033]

_Farcall:
	push af
	add sp, -$03
	push af
	push hl
	push bc
	push de

	ld hl, sp+$06
	ld d, h
	ld e, l

	; have bc point to args at call site
	ld hl, sp+$0e
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a

	; store current ROM bank in stack
	ld a, [rRAMB]
	ld [hld], a
	; copy over original f register value
	ld a, [hl]
	ld [de], a

	; return address after call will be Func_1071
	ld a, HIGH(Func_1071)
	ld [hld], a
	ld a, LOW(Func_1071)
	ld [hld], a

	; start reading args
	ld a, [bc] ; offset in table
	ld e, a
	inc bc
	ld d, $40
	ld a, [bc] ; ROM/SRAM bank
	inc bc

	; switch banks
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei
	; set address to call
	ld a, [de]
	ld [hld], a
	dec e
	ld a, [de]
	ld [hl], a

	; update pc at initial call site
	ld hl, sp+$0d
	ld a, c
	ld [hli], a
	ld [hl], b

	pop de
	pop bc
	pop hl
	pop af
	ret

Func_1071:
	push af
	push hl
	push bc
	ld hl, sp+$06

	ld a, [hl] ; old ROM/SRAM banks
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei

	; restore initial af registers
	ld b, h
	ld c, l
	dec bc
	ld a, [bc]
	ld [hld], a
	dec bc
	ld a, [bc]
	ld [hl], a
	pop bc
	pop hl
	; adjust sp to correctly point to call site
	add sp, $01
	pop af
	ret

Func_1090:
	push af
	push hl
	ld hl, rRAMG + $1000
	ld [hl], RAMG_SRAM_ENABLE
	ld hl, rBMODE + $1000
	ld [hl], BMODE_SIMPLE
	pop hl
	pop af
	ret
; 0x109f

SECTION "Home@10bb", ROM0[$10bb]

DisableLCD::
	push af
	push hl
	ld hl, rLCDC
	bit B_LCDC_ENABLE, [hl]
	jr z, .lcd_off
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK + 2
	jr c, .wait_vblank
	res B_LCDC_ENABLE, [hl]
.lcd_off
	pop hl
	pop af
	ret

EnableLCD::
	push af
	push hl
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	pop hl
	pop af
	ret

; sets configurations for:
; - rLCDC
; - rSTAT
; - rSCY
; - rSCX
; - rLYC
; - rBGP
; - rOBP0
; - rOBP1
; - rWY
; - rWX
Func_10d9::
	push af
	push bc
	push de
	push hl
	ld c, LOW(rLCDC)
	ld de, %1111010111110000
	ld b, $0c
.loop
	sla e
	rl d
	jr nc, .next
	ld a, [hli]
	ld [$ff00+c], a
.next
	inc c
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

DoFrame::
	push af
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait_vblank
.wait_end_vblank
	ldh a, [rLY]
	cp 0
	jr nz, .wait_end_vblank
	pop af
	ret
; 0x1104

SECTION "Home@1114", ROM0[$1114]

Func_1114::
	push af
	ld a, $01
	ld [$cace], a
	pop af
	ret
; 0x111c

SECTION "Bank 0@1124", ROM0[$1124]

Func_1124::
	push af
	ld a, $03
	ld [$cace], a
	pop af
	ret

Func_112c::
	push af
	ld a, $02
	ld [$cace], a
	pop af
	ret
; 0x1134

SECTION "Home@1144", ROM0[$1144]

Func_1144::
	push af
	push bc
	push de
	push hl
	ld e, $00
	ld d, a
	cp $7d
	jr c, .asm_115c
	ld b, $00
	sub $7d
	rlca
	ld c, a
	ld hl, $11a4
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
.asm_115c
	ld a, d
	cp $00
	jr nz, .asm_116c
	ld b, $00
	ld a, [$cace]
	ld c, a
	ld hl, $1184
	add hl, bc
	ld d, [hl]
.asm_116c
	ld a, d
	ld [$cad0], a
	ld a, [$cace]
	add e
	ld e, a
	ld d, $00
	ld hl, $118c
	add hl, de
	ld a, [hl]
	ld [$cacf], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x1184

SECTION "Home@120a", ROM0[$120a]

Func_120a::
	push af
	push bc
	push hl
	ld hl, $ca00
	ld c, $28
.asm_1212
	ld a, $ff
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld a, $00
	ld [hli], a
	ld a, $00
	ld [hli], a
	dec c
	jr nz, .asm_1212
	pop hl
	pop bc
	pop af
	ret

Func_1225::
	push af
	push bc
	push de
	push hl
	ld hl, $ca00
	ld de, $fe00
	ld c, $a0
.asm_1231
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .asm_1231
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_123c::
	push af
	push bc
	push hl
	push bc
	sla c
	sla c
	ld b, $00
	ld hl, $ca00
	add hl, bc
	pop bc
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hl], $00
	pop hl
	pop bc
	pop af
	ret
; 0x1256

SECTION "Home@1347", ROM0[$1347]

Func_1347:
	push af
	push bc
	ld e, $00
	ld c, $08
.asm_134d
	sla d
	rl e
	ld a, e
	cp b
	jr c, .asm_1358
	sub b
	ld e, a
	inc d
.asm_1358
	dec c
	jr nz, .asm_134d
	pop bc
	pop af
	ret
; 0x135e

SECTION "Bank 0@1391", ROM0[$1391]

Func_1391::
	push af
	push bc
	push de
	ld d, $00
	ld hl, $0
	ld c, $08
.asm_139b
	srl b
	jr nc, .asm_13a0
	add hl, de
.asm_13a0
	sla e
	rl d
	dec c
	jr nz, .asm_139b
	pop de
	pop bc
	pop af
	ret
; 0x13ab

SECTION "Home@14ea", ROM0[$14ea]

InitTransferVirtualOAM:
	push af
	push bc
	push hl
	ld b, SIZEOF("DMA Transfer")
	ld c, LOW(hTransferVirtualOAM)
	ld hl, TransferVirtualOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	pop hl
	pop bc
	pop af
	ret

TransferVirtualOAM:
LOAD "DMA Transfer", HRAM
hTransferVirtualOAM::
	ld a, $ca ; HIGH(wVirtualOAM)
	ldh [rDMA], a ; start DMA transfer (starts right after instruction)
	ld a, 160 / (1 + 3) ; delay for a total of 160 cycles
.loop
	dec a        ; 1 cycle
	jr nz, .loop ; 3 cycles
	ret
ENDL
; 0x1508

SECTION "Home@1576", ROM0[$1576]

Func_1576::
	push af
	push hl
	call Func_179b
	call Func_172f
	call Func_15a2
	call Func_15e9

	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld hl, rIE
	res B_IE_TIMER, [hl]

	; set timer to 262k / 56 ~ 4678 Hz
	ld a, -56
	ldh [rTIMA], a
	ld a, -56
	ldh [rTMA], a
	ld a, TAC_262KHZ | TAC_START
	ldh [rTAC], a

	ld hl, rIE
	set B_IE_TIMER, [hl]
	pop hl
	pop af
	ret

Func_15a2:
	push af
	push bc
	push hl
	ld hl, $15c8
	lb bc, $3, $eb
.asm_15ab
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	dec b
	jr nz, .asm_15ab
	pop hl
	pop bc
	pop af
	ret
; 0x15c4

SECTION "Home@15e9", ROM0[$15e9]

Func_15e9:
	push af
	push bc
	push hl
	ld c, $e0
	ld hl, $15c4
	ld b, $04
.asm_15f3
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_15f3
	ld a, $e0
	ldh [$ffdf], a
	pop hl
	pop bc
	pop af
	ret
; 0x1601

SECTION "Home@161a", ROM0[$161a]

Timer:
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	ldh a, [$ffdf]
	ld c, a
	sub $e0
	ld b, a
	rlca
	add b
	ld e, a
	ld a, $01
	ld [$ff00+c], a
.asm_162f
	inc c
	ld a, c
	cp $e4
	jr nz, .asm_1637
	ld c, $e0
.asm_1637
	ld a, [$ff00+c]
	cp $01
	jr nz, .asm_162f
	ld a, c
	ldh [$ffdf], a
	ld a, $02
	ld [$ff00+c], a
	ld a, $e8
	add e
	ld c, a
	ld hl, sp+$00
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, h
	ld [$ff00+c], a
	inc c
	ld a, [$4000]
	ld [$ff00+c], a
	ldh a, [$ffdf]
	sub $e0
	ld b, a
	rlca
	add b
	ld e, a
	add $e8
	ld c, a
	ld a, [$ff00+c]
	ld l, a
	inc c
	ld a, [$ff00+c]
	ld h, a
	ld sp, hl
	inc c
	ld a, [$ff00+c]
	ld [$3000], a
	rra
	swap a
	ld [$5000], a
	ld d, $00
	ld hl, $15dd
	add hl, de
	ld a, [hl]
	ldh [rTIMA], a
	ld a, [hli]
	ldh [rTMA], a
	ld a, [hli]
	ldh [rTAC], a
	ld a, [hl]
	ldh [rTAC], a
	pop de
	pop bc
	pop af
	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld l, LOW(rIE)
	set B_IE_TIMER, [hl]
	pop hl
	reti
; 0x168e

SECTION "Home@168f", ROM0[$168f]

Func_168f:
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	di
	ldh a, [$ffdf]
	ld c, a
	sub $e0
	ld b, a
	rlca
	add b
	ld e, a
	ld a, $00
	ld [$ff00+c], a
.asm_16a5
	inc c
	ld a, c
	cp $e4
	jr nz, .asm_16ad
	ld c, $e0
.asm_16ad
	ld a, [$ff00+c]
	cp $01
	jr nz, .asm_16a5
	ld a, c
	ldh [$ffdf], a
	ld a, $02
	ld [$ff00+c], a
	ld a, $e8
	add e
	ld c, a
	ld hl, sp+$00
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, h
	ld [$ff00+c], a
	inc c
	ld a, [rRAMB]
	ld [$ff00+c], a
	ldh a, [$ffdf]
	sub $e0
	ld b, a
	rlca
	add b
	ld e, a
	add $e8
	ld c, a
	ld a, [$ff00+c]
	ld l, a
	inc c
	ld a, [$ff00+c]
	ld h, a
	ld sp, hl
	inc c
	ld a, [$ff00+c]
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ld d, $00
	ld hl, $15dd
	add hl, de
	ld a, [hl]
	ldh [rTIMA], a
	ld a, [hli]
	ldh [rTMA], a
	ld a, [hli]
	ldh [rTAC], a
	ld a, [hl]
	ldh [rTAC], a
	pop de
	pop bc
	pop af
	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld l, LOW(rIE)
	set B_IE_TIMER, [hl]
	pop hl
	reti
; 0x1704

SECTION "Home@1705", ROM0[$1705]

Func_1705:
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, $01
	ld [$ff00+c], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x171c

SECTION "Home@1724", ROM0[$1724]

Func_1724:
	di
	ld hl, rIE
	res B_IE_TIMER, [hl]
	reti
; 0x172b

SECTION "Home@172f", ROM0[$172f]

Func_172f:
	push af
	push bc
	ld c, $e4
	xor a
	ld b, $04
.asm_1736
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_1736
	pop bc
	pop af
	ret
; 0x173e

SECTION "Home@175a", ROM0[$175a]

Func_175a:
	push bc
	push de
	push hl
	ld hl, sp+$06
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, $ff
	xor b
	ld d, a
	ld a, [$ff00+c]
	ld e, a
	and d
	ld [$ff00+c], a
	ld a, e
	and b
	pop hl
	pop de
	pop bc
	reti
; 0x177a

SECTION "Home@177b", ROM0[$177b]

Func_177b:
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, $ff
	xor b
	ld b, a
	ld a, [$ff00+c]
	and b
	ld [$ff00+c], a
	pop hl
	pop de
	pop bc
	pop af
	reti
; 0x179a

SECTION "Home@179b", ROM0[$179b]

Func_179b:
	push af
	xor a
	ld [$ccff], a
	ld [$cd00], a
	ld [$cd09], a
	ld [$cd0a], a
	pop af
	ret
; 0x17ab

SECTION "Home@1c4f", ROM0[$1c4f]

Func_1c4f:
	push af
	ld a, b
	ld [$cdf0], a
	ld a, c
	ld [$cdf1], a
	pop af
	ret
; 0x1c5a

SECTION "Bank 0@1c7a", ROM0[$1c7a]

Func_1c7a:
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, [$cdf2]
	ld [hli], a
	ld a, [$cdf3]
	ld [hli], a
	ld a, [$cdf4]
	ld [hli], a
	pop hl
	pop bc
	pop af
	ret

Func_1c92:
	push af
	push bc
	push hl
	call Func_1cb5
	ld h, b
	ld l, c
	ld a, [hli]
	ld [$cdf2], a
	ld a, [hli]
	ld [$cdf3], a
	ld a, [hli]
	ld [$cdf4], a
	pop hl
	pop bc
	pop af
	ret
; 0x1caa

SECTION "Bank 0@1cb5", ROM0[$1cb5]

Func_1cb5:
	push af
	push hl
	ld b, $00
	ld a, [$cdf1]
	ld c, a
	sla c
	ld hl, $1cdd
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld b, $00
	ld a, [$cdf0]
	ld c, a
	sla c
	ld hl, $1ce5
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	pop af
	ret
; 0x1cdd

SECTION "Bank 0@1d00", ROM0[$1d00]

Func_1d00:
	push hl
	ld l, $01
	ld a, b
	cp d
	jr nz, .asm_1d0c
	ld a, c
	cp e
	jr nz, .asm_1d0c
	dec l
.asm_1d0c
	ld a, l
	pop hl
	ret
; 0x1d0f

SECTION "Home@1e65", ROM0[$1e65]

Func_1e65:
	push af
	ld a, [$cdfc]
	or $02
	ld [$cdfc], a
	pop af
	ret
; 0x1e70

SECTION "Home@1fe6", ROM0[$1fe6]

Func_1fe6:
	push af
	push bc
	push hl
	ld hl, $ce17
	ld a, $80
	ld c, $80
.asm_1ff0
	ld [hli], a
	dec c
	jr nz, .asm_1ff0
	xor a
	ld [wce97], a
	ld [wce98], a
	pop hl
	pop bc
	pop af
	ret
; 0x1fff

SECTION "Home@2025", ROM0[$2025]

Func_2025:
	push bc
	push hl
	push af
	ld a, $00
	ld b, a
	ld a, [wce98]
	ld c, a
	inc a
	cp $80
	jr nz, .asm_2035
	xor a
.asm_2035
	ld [wce98], a
	ld hl, $ce17
	add hl, bc
	pop af
	ld [hl], a
	pop hl
	pop bc
	ret
; 0x2041

SECTION "Home@2086", ROM0[$2086]

SeedRNG::
	push af
	push bc
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	ld hl, rTAC
	res B_TAC_START, [hl]
	ld a, -255
	ldh [rTMA], a
	ldh [rTIMA], a
	set B_TAC_START, [hl]
	ld c, $00
	ldh a, [rTIMA]
	ld [wce99], a
	cp $00
	jr z, .asm_20a7
	inc c
.asm_20a7
	ldh a, [rTIMA]
	ld [wce9a], a
	cp $00
	jr z, .asm_20b1
	inc c
.asm_20b1
	ldh a, [rTIMA]
	ld [wce9b], a
	cp $00
	jr z, .asm_20bb
	inc c
.asm_20bb
	ldh a, [rTIMA]
	ld [wce9c], a
	cp $00
	jr z, .asm_20c5
	inc c
.asm_20c5
	ld a, c
	cp $00
	jr nz, .asm_20cf
	ld a, $01
	ld [wce99], a
.asm_20cf
	call AdvanceRNG
	call AdvanceRNG
	call AdvanceRNG
	call AdvanceRNG
	call AdvanceRNG
	pop hl
	pop bc
	pop af
	ret

AdvanceRNG::
	push af
	push bc
	push de
	ld a, [wce9c]
	ld b, a
	ld c, a
	ld a, [wce9b]
	rr c
	rra
	rr d
	xor b
	rl d
	rla
	rl c
	ld [wce9c], a
	ld a, [wce9a]
	ld [wce9b], a
	ld a, [wce99]
	ld [wce9a], a
	ld a, c
	ld [wce99], a
	ld [wce9f], a
	pop de
	pop bc
	pop af
	ret

Func_2112:
	push af
	push bc
	push de
	ld a, [wce9d]
	ld c, a
	ld a, [wce9e]
	cp c
	jr nz, .asm_2124
	ld [wce9f], a
	jr .asm_2136
.asm_2124
	sub c
	ld b, a
	inc b
	call AdvanceRNG
	ld a, [wce9f]
	ld d, a
	call Func_1347
	ld a, e
	add c
	ld [wce9f], a
.asm_2136
	pop de
	pop bc
	pop af
	ret
; 0x213a

SECTION "Home@2473", ROM0[$2473]

FadeIn::
	push af
	ldh a, [$ffde]
	cp $00
	jr nz, .asm_247f
	call DMGFadeIn
	jr .asm_2482
.asm_247f
	call SetDefaultPalettes
.asm_2482
	pop af
	ret

FadeOut::
	push af
	ldh a, [$ffde]
	cp $00
	jr nz, .asm_2490
	call DMGFadeOut
	jr .asm_2493
.asm_2490
	call SetBlackPalettes
.asm_2493
	pop af
	ret

SetDefaultPalettes:
	push af
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret
; 0x24a0

SECTION "Home@24af", ROM0[$24af]

SetBlackPalettes:
	push af
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

DMGFadeIn:
	push af
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $90
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret

DMGFadeOut:
	push af
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $90
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $40
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DoFrame
	call DoFrame
	call DoFrame
	ld a, $00
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	pop af
	ret
; 0x2536

SECTION "Home@2666", ROM0[$2666]

Func_2666::
	call Func_2670
	call Func_2774
	call Func_27a9
	ret

Func_2670:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [wce9d], a
	ld a, $63
	ld [wce9e], a
	ld e, $00
.asm_2680
	push de
	ld d, $00
	call Func_2112
	ld a, [wce9f]
	ld e, a
	sla e
	ld hl, $26ac
	add hl, de
	pop de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, e
	farcall $61, $03
	farcall $63, $03
	farcall $11, $01
	farcall $43, $01
	inc e
	ld a, e
	cp $21
	jr nz, .asm_2680
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x26ac

SECTION "Home@2774", ROM0[$2774]

Func_2774:
	push af
	push bc
	push de
	push hl
	ld e, $21
	ld hl, $279b
.asm_277d
	ld a, e
	cp $28
	jr nc, .asm_2796
	ld a, e
	farcall $61, $03
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	farcall $63, $03
	farcall $11, $01
	farcall $43, $01
	inc e
	jr .asm_277d
.asm_2796
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x279b

SECTION "Home@27a9", ROM0[$27a9]

Func_27a9:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ld [wce9d], a
	ld a, $ff
	ld [wce9e], a
	call Func_2112
	ld a, [wce9f]
	ld e, a
	ld a, $00
	ld [wce9d], a
	ld a, $07
	ld [wce9e], a
	call Func_2112
	ld a, [wce9f]
	ld d, a
	ld a, d
	cp $01
	jr nz, .asm_27f2
	ld a, e
	cp $03
	jr nz, .asm_27e4
	ld bc, $25
	farcall $11, $01
	farcall $41, $01
	jr .asm_27f2
.asm_27e4
	ld a, e
	cp $0e
	jr nz, .asm_27f2
	ld bc, $22
	farcall $11, $01
	farcall $41, $01
.asm_27f2
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_27f7::
	push af
	push bc
	push de
	push hl
	xor a
	ld hl, $cf4e
	ld de, $2823
	ld c, $11
.asm_2804
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2804
	ld hl, $cf70
	ld de, $2845
	ld c, $11
.asm_2815
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2815
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x2823

SECTION "Home@29f1", ROM0[$29f1]

Func_29f1:
	push af
	push bc
	push de
	push hl
	farcall $07, $3e
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_29fd::
	push af
	ld a, $00
	call Func_29f1
	call Func_f74
	pop af
	ret

Func_2a08::
	push af
	ld a, $01
	call Func_29f1
	call Func_f74
	pop af
	ret

SECTION "Bank 0@2a3f", ROM0[$2a3f]

Func_2a3f::
	push af
	ld a, $07
	call Func_29f1
	call Func_f74
	pop af
	ret
; 0x2a4a

SECTION "Bank 0@2aef", ROM0[$2aef]

Func_2aef:
	push af
	ld a, $98
	call Func_29f1
	call Func_f74
	pop af
	ret
; 0x2afa

SECTION "Home@2d1f", ROM0[$2d1f]

Func_2d1f:
	ld a, $08
	ld [$cfef], a
	call Func_2d2e
	xor a
	ld [$cfef], a
	jp Func_f4002

Func_2d2e:
	di
	bankswitch BANK(Func_f8076)
	ei
	ld a, [$cfef]
	call Func_f8076

	di
	bankswitch BANK(Func_f4002)
	ei
	ret

Func_2d57:
	call Func_f6e5d
	bankswitch BANK(Func_f811a)
	call Func_f811a
	di
	bankswitch $3d
	ei
	ld a, $01
	ld [$cfe2], a
	pop de
	pop bc
	pop hl
	pop af
	reti
; 0x2d87
