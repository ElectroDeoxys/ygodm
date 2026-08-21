	dw BANK(@)

	dw $4068 ; $03
	dw $551f ; $05
	dw $5acb ; $07
	dw $5c48 ; $09
	dw $5b92 ; $0b
	dw $56e0 ; $0d
	dw $5c86 ; $0f
	dw $5af2 ; $11
	dw $5b80 ; $13
	dw $5bb8 ; $15
	dw $5bd1 ; $17
	dw $5c10 ; $19
	dw $42c5 ; $1b
	dw $42d0 ; $1d
	dw $42ec ; $1f
	dw $5313 ; $21
	dw $5eb3 ; $23
	dw $5f37 ; $25
	dw $5f79 ; $27
	dw $6008 ; $29
	dw $6015 ; $2b
	dw $5ff2 ; $2d
	dw $5fbb ; $2f
	dw $5ef5 ; $31
	dw $5ffb ; $33
	dw $6022 ; $35
	dw $602b ; $37
	dw $6034 ; $39
	dw $603d ; $3b
	dw $6046 ; $3d
	dw $6101 ; $3f
	dw $5b04 ; $41
	dw $5b52 ; $43
	dw $62c2 ; $45
	dw $63d6 ; $47
	dw Func_6595 ; $49
	dw Func_65c4 ; $4b
	dw Func_65f3 ; $4d
	dw $6804 ; $4f
	dw $6622 ; $51
	dw $6736 ; $53
	dw $6a6e ; $55
	dw $689e ; $57
	dw $69b5 ; $59
	dw $6c67 ; $5b
	dw $6a97 ; $5d
	dw $6bae ; $5f
	dw $6e41 ; $61
	dw $6c90 ; $63
	dw $6da7 ; $65
	dw $64b5 ; $67

SECTION "Bank 01@6595", ROMX[$6595], BANK[$01]

Func_6595:
	push af
	push hl

	call DisableLCD
	ld hl, .Config
	call Func_10d9
	farcall $03, $0b
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

Func_65c4:
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

Func_65f3:
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
