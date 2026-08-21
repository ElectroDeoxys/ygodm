	dw BANK(@)

	farcall_table_start
	farfunc $4068 ; $03
	farfunc $551f ; $05
	farfunc $5acb ; $07
	farfunc $5c48 ; $09
	farfunc $5b92 ; $0b
	farfunc $56e0 ; $0d
	farfunc $5c86 ; $0f
	farfunc $5af2 ; $11
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
	farfunc $5fbb ; $2f
	farfunc $5ef5 ; $31
	farfunc $5ffb ; $33
	farfunc $6022 ; $35
	farfunc $602b ; $37
	farfunc $6034 ; $39
	farfunc $603d ; $3b
	farfunc $6046 ; $3d
	farfunc $6101 ; $3f
	farfunc $5b04 ; $41
	farfunc $5b52 ; $43
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
