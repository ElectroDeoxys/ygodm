	dw BANK(@)

	farcall_table_start
	farfunc ExecuteSGBFunction

; input:
; - a = SGBFUNC_* constant
ExecuteSGBFunction::
	push af
	push bc
	push de
	push hl
	ld c, a

	; before doing any SGB operation,
	; we stash current rIE, and disable V-Blank & Stat
	ldh a, [rIE]
	ld d, a
	and ~(IE_VBLANK | IE_STAT)
	ldh [rIE], a
	push de

	call DetectSGB
	push af
	ldh a, [hffde]
	cp $00
	jr nz, .asm_fc01f
	add sp, $04
	jr .skip
.asm_fc01f
	cp $01
	jr nz, .asm_fc027
	add sp, $04
	jr .skip
.asm_fc027
	pop af
	ld b, $00
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	pop de

	; recover original rIE and enable LCD
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld a, d
	ldh [rIE], a

.skip
	pop hl
	pop de
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_fc1d4 ; SGBFUNC_0
	dw Func_fc1e0 ; SGBFUNC_2
	dw Func_fc216 ; SGBFUNC_4
	dw Func_fc2c6 ; SGBFUNC_6
	dw Func_fc290 ; SGBFUNC_8

DetectSGB:
	push af
	push bc
	push de
	push hl

	; input is rIE without V-Blank & Stat flags
	; if there are any other interrupts enabled,
	; then we skip the entire detection routine
	cp $00
	jr nz, .skip

	ld a, $00
	ldh [rBGP], a

	; enable LCD
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]

	; temporarily set 2-player mode
	ld hl, SGBPacket_2PlayerRequest
	call SendSGBPacket

	; e will hold the result of the test
	ld e, $00

	; wait until next V-Blank starts
.wait_start_frame
	ldh a, [rLY]
	cp 0
	jr nz, .wait_start_frame
.wait_start_vblank
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait_start_vblank

	ld d, 10 ; number of attempts
.loop_attempts
	; trigger P15 from low to high,
	; will select next joypad
	ld a, JOYP_GET_CTRL_PAD
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, JOYP_GET_BUTTONS
	ldh [rJOYP], a
	REPT 6
		ldh a, [rJOYP]
	ENDR

	; read joypad input
	REPT 4
		ld a, JOYP_GET_NONE
		ldh [rJOYP], a
	ENDR

	; if SGB is present, then second player
	; input will show with low nybble == $e
	ldh a, [rJOYP]
	cp $fe
	jr nz, .next_attempt
	; detected 2-player signature, store result
	ld e, $01
.next_attempt
	dec d
	jr nz, .loop_attempts

	; set back to 1-player mode
	ld hl, SGBPacket_1PlayerRequest
	call SendSGBPacket

	ld d, $00
	ld b, $00
	sla e
	ld c, $00
	ldh a, [hBootUpA]
	cp BOOTUP_A_SGB2
	jr nz, .no_sgb2
	ld c, $01
.no_sgb2
	ld hl, .data
	add hl, de
	add hl, bc
	ld a, [hl]
	ldh [hffde], a
.skip
	pop hl
	pop de
	pop bc
	pop af
	ret

.data
	; SGB2  no, yes
	db     $00, $01 ; SGB not detected
	db     $02, $03 ; SGB detected

PrepareForVRAMTransfer:
	push af
	push bc
	push de
	push hl
	ld a, $00
	ldh [rSCY], a
	ld a, $00
	ldh [rSCX], a
	ld a, $00
	ldh [rBGP], a
	ld a, LCDC_BG_ON | LCDC_BLOCK01
	ldh [rLCDC], a
	ld a, $90
	ldh [rWY], a
	ld a, $a6
	ldh [rWX], a
	ld hl, vBGMap0
	xor a
	ld de, TILEMAP_WIDTH - SCREEN_WIDTH
	ld b, SCREEN_HEIGHT - 1
.asm_fc0f4
	ld c, SCREEN_WIDTH
.asm_fc0f6
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_fc0f6
	add hl, de
	dec b
	jr nz, .asm_fc0f4
	pop hl
	pop de
	pop bc
	pop af
	ret

DisableLCD_Bank3f:
	push af
	push hl
.wait
	ldh a, [rLY]
	cp LY_VBLANK + 3
	jr c, .wait
	ld hl, rLCDC
	res B_LCDC_ENABLE, [hl]
	pop hl
	pop af
	ret

; input:
; - hl = SGB packet to send
SendSGBPacket:
	push af
	push bc
	push de

	; wait for V-Blank
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait

	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	ld a, JOYP_SGB_START
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a

	ld d, SGB_PACKET_SIZE
.loop_bytes
	ld a, [hli]
	ld b, a
	ld e, 8 ; bits
.loop_bits
	srl b
	jr c, .bit_set
; bit unset
	ld a, JOYP_SGB_ZERO
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	jr .next_bit
.bit_set
	ld a, JOYP_SGB_ONE
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
.next_bit
	dec e
	jr nz, .loop_bits
	dec d
	jr nz, .loop_bytes

	ld a, JOYP_SGB_ZERO
	ldh [rJOYP], a
	ld a, JOYP_SGB_FINISH
	ldh [rJOYP], a
	call .Do4Frames
	pop de
	pop bc
	pop af
	ret

.Do4Frames:
	push af
	push bc
	ld b, 4
.loop_frame
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .loop_frame
.wait_begin_frame
	ldh a, [rLY]
	cp 0
	jr nz, .wait_begin_frame
	dec b
	jr nz, .loop_frame
	pop bc
	pop af
	ret
; 0xfc170

SECTION "Bank 3f@417b", ROMX[$417b], BANK[$3f]

; input:
; - hl = data to transfer
; - de = VRAM address (usually vTiles0)
; - bc = data size
WriteVRAMForSGBTransfer:
	push af
	push bc
	push de
	push hl
	call DisableLCD_Bank3f

	; copy until nearest $100th
	ld a, c
	cp $00
	jr z, .ok
.loop_copy_lo
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy_lo
.ok
	ld a, b
	cp $00
	jr z, .done
.loop_copy_hi
	ld c, $00
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy
	dec b
	jr nz, .loop_copy_hi

.done
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc1a7:
	push af
	push bc
	push hl
	ld hl, .SGBPackets
	ld bc, NULL
.loop
	push hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call SendSGBPacket
	pop hl
	inc c
	inc c
	ld a, c
	cp $10
	jr c, .loop
	pop hl
	pop bc
	pop af
	ret

.SGBPackets:
	dw SGBPacket_fc4a1
	dw SGBPacket_fc4b1
	dw SGBPacket_fc4c1
	dw SGBPacket_fc4d1
	dw SGBPacket_fc4e1
	dw SGBPacket_fc4f1
	dw SGBPacket_fc501
	dw SGBPacket_fc511

Func_fc1d4:
	push af
	push bc
	push de
	push hl
	call Func_fc1a7
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc1e0:
	push af
	push bc
	push de
	push hl
	call PrepareForVRAMTransfer
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, SGBPacket_fc3b1
	call SendSGBPacket
	ld hl, $4348
	ld bc, $5a
	ld de, vTiles0
	call WriteVRAMForSGBTransfer
	ld hl, SGBPacket_AttributeTransfer
	call SendSGBPacket
	ld a, $00
	ldh [rBGP], a
	ld hl, SGBPacket_AttributeSet
	call SendSGBPacket
	call DisableLCD_Bank3f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc216:
	push af
	push bc
	push de
	push hl
	call PrepareForVRAMTransfer
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, SGBPacket_MaskEnable
	call SendSGBPacket
	ld a, $e4
	ldh [rBGP], a
	ld hl, $4d91
	ld bc, $1000
	ld de, vTiles0
	call WriteVRAMForSGBTransfer
	ld hl, SGBPacket_CharacterTransfer_Tiles0
	call SendSGBPacket
	ld bc, $1000
	ld hl, $4d91
	add hl, bc
	ld bc, $1000
	ld de, vTiles0
	call WriteVRAMForSGBTransfer
	ld hl, SGBPacket_CharacterTransfer_Tiles1
	call SendSGBPacket
	ld hl, $4531
	ld bc, $1080
	ld de, vTiles0
	call WriteVRAMForSGBTransfer
	ld hl, SGBPacket_BorderTransfer
	call SendSGBPacket
	ld hl, SGBPacket_fc3c1
	call SendSGBPacket
	ld hl, $4348
	ld bc, $5a
	ld de, vTiles0
	call WriteVRAMForSGBTransfer
	ld hl, SGBPacket_AttributeTransfer
	call SendSGBPacket
	ld a, $00
	ldh [rBGP], a
	ld hl, SGBPacket_AttributeSet
	call SendSGBPacket
	call DisableLCD_Bank3f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc290:
	push af
	push bc
	push de
	push hl
	call PrepareForVRAMTransfer
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, SGBPacket_fc3e1
	call SendSGBPacket
	ld hl, $42df
	ld bc, $5a
	ld de, vTiles0
	call WriteVRAMForSGBTransfer
	ld hl, SGBPacket_AttributeTransfer
	call SendSGBPacket
	ld a, $00
	ldh [rBGP], a
	ld hl, SGBPacket_AttributeSet
	call SendSGBPacket
	call DisableLCD_Bank3f
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_fc2c6:
	push af
	push bc
	push hl
	ld a, $00
	ldh [rBGP], a
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	ld hl, SGBPacket_fc3d1
	call SendSGBPacket
	call DisableLCD_Bank3f
	pop hl
	pop bc
	pop af
	ret
; 0xfc2df

SECTION "Bank 3f@43b1", ROMX[$43b1], BANK[$3f]

SGBPacket_fc3b1:
	sgb_pal_01 $7bff, $7bdf, $2372, $0001, $0008, $000a, $000c

SGBPacket_fc3c1:
	sgb_pal_01 $7fff, $0c83, $0c83, $0441, $0000, $0000, $0000

SGBPacket_fc3d1:
	sgb_pal_01 $73ff, $4ad8, $254a, $1060, $0000, $0000, $0000

SGBPacket_fc3e1:
	sgb_pal_01 $7bff, $473d, $08ec, $0421, $7bff, $473d, $004f

SGBPacket_BorderTransfer:
	sgb_pct_trn

SGBPacket_AttributeTransfer:
	sgb_attr_trn

SGBPacket_AttributeSet:
	sgb_attr_set $00

SGBPacket_2PlayerRequest:
	sgb_mlt_req MLT_REQ_2P

SGBPacket_1PlayerRequest:
	sgb_mlt_req MLT_REQ_1P

SGBPacket_MaskEnable:
	sgb_mask_en MASK_EN_BLANK_BLACK

SGBPacket_CharacterTransfer_Tiles0:
	sgb_chr_trn CHR_TRN_TILES0, CHR_TRN_BG

SGBPacket_CharacterTransfer_Tiles1:
	sgb_chr_trn CHR_TRN_TILES1, CHR_TRN_BG
; 0xfc471

SECTION "Bank 3f@44a1", ROMX[$44a1], BANK[$3f]

SGBPacket_fc4a1:
	sgb_data_snd $81b, $00, $ea, $ea, $ea, $ea, $ea, $a9, $01, $cd, $4f, $0c, $d0

SGBPacket_fc4b1:
	sgb_data_snd $826, $00, $39, $cd, $48, $0c, $d0, $34, $a5, $c9, $c9, $80, $d0

SGBPacket_fc4c1:
	sgb_data_snd $831, $00, $0c, $a5, $ca, $c9, $7e, $d0, $06, $a5, $cb, $c9, $7e

SGBPacket_fc4d1:
	sgb_data_snd $83c, $00, $f0, $12, $a5, $c9, $c9, $c8, $d0, $1c, $a5, $ca, $c9

SGBPacket_fc4e1:
	sgb_data_snd $847, $00, $c4, $d0, $16, $a5, $cb, $c9, $05, $d0, $10, $a2, $28

SGBPacket_fc4f1:
	sgb_data_snd $852, $00, $a9, $e7, $9f, $01, $c0, $7e, $e8, $e8, $e8, $e8, $e0

SGBPacket_fc501:
	sgb_data_snd $85d, $00, $8c, $d0, $f4, $60

SGBPacket_fc511:
	sgb_data_snd $810, $00, $4c, $20, $08, $ea, $ea, $ea, $ea, $ea, $60, $ea, $ea
; 0xfc521
