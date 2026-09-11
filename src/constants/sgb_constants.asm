	const_def 0, 2
	const SGBFUNC_0 ; $0
	const SGBFUNC_2 ; $2
	const SGBFUNC_4 ; $4
	const SGBFUNC_6 ; $6
	const SGBFUNC_8 ; $8

DEF SGB_PACKET_SIZE EQU 16 ; bytes

MACRO sgb_command
DEF \1_CMD EQU (const_value << 3)
	const \1
ENDM

; SGB command constants
	const_def
	sgb_command PAL01    ; $00 ($00)
	sgb_command PAL23    ; $01 ($08)
	sgb_command PAL03    ; $02 ($10)
	sgb_command PAL12    ; $03 ($18)
	sgb_command ATTR_BLK ; $04 ($20)
	sgb_command ATTR_LIN ; $05 ($28)
	sgb_command ATTR_DIV ; $06 ($30)
	sgb_command ATTR_CHR ; $07 ($38)
	sgb_command SGBSOUND ; $08 ($40)
	sgb_command SOU_TRN  ; $09 ($48)
	sgb_command PAL_SET  ; $0a ($50)
	sgb_command PAL_TRN  ; $0b ($58)
	sgb_command ATRC_EN  ; $0c ($60)
	sgb_command TEST_EN  ; $0d ($68)
	sgb_command ICON_EN  ; $0e ($70)
	sgb_command DATA_SND ; $0f ($78)
	sgb_command DATA_TRN ; $10 ($80)
	sgb_command MLT_REQ  ; $11 ($88)
	sgb_command SGB_JUMP ; $12 ($90)
	sgb_command CHR_TRN  ; $13 ($98)
	sgb_command PCT_TRN  ; $14 ($a0)
	sgb_command ATTR_TRN ; $15 ($a8)
	sgb_command ATTR_SET ; $16 ($b0)
	sgb_command MASK_EN  ; $17 ($b8)
	sgb_command OBJ_TRN  ; $18 ($c0)
	sgb_command PAL_PRI  ; $19 ($c8)

; parameters for MLT_REQ
	const_def
	const MLT_REQ_1P ; $0
	const MLT_REQ_2P ; $1
	const_skip
	const MLT_REQ_4P ; $3

; parameters for CHR_TRN
DEF CHR_TRN_TILES0 EQU 0
DEF CHR_TRN_TILES1 EQU 1
DEF CHR_TRN_BG     EQU 0
DEF CHR_TRN_OBJ    EQU 1

; parameters for MASK_EN
	const_def
	const MASK_EN_CANCEL       ; $0
	const MASK_EN_FREEZE       ; $1
	const MASK_EN_BLANK_BLACK  ; $2
	const MASK_EN_BLANK_COLOR0 ; $3
