MACRO sgb_header
	db \1 | \2 ; sgb_command and length
ENDM

MACRO sgb_pal_01
	sgb_header PAL01_CMD, 1
	dw \1 ; pal 0/1 col #0
	dw \2 ; pal 0 col #1
	dw \3 ; pal 0 col #2
	dw \4 ; pal 0 col #3
	dw \5 ; pal 1 col #1
	dw \6 ; pal 1 col #2
	dw \7 ; pal 1 col #3
	db $00
ENDM

MACRO sgb_data_snd
	ASSERT _NARG <= 2 + 11
	sgb_header DATA_SND_CMD, 1
	dw \1 ; SNES RAM address
	db \2 ; SNES RAM bank
	SHIFT 2

	db _NARG
	db \#
	; pad the rest with $00
	ds 11 - _NARG, $00
ENDM

MACRO sgb_mlt_req
	sgb_header MLT_REQ_CMD, 1
	db \1 ; MLT_REQ_* parameter
	ds 14, $00
ENDM

MACRO sgb_chr_trn
	sgb_header CHR_TRN_CMD, 1
	db (\1 << 0) | (\2 << 1) ; CHR_TRN_* parameters
	ds 14, $00
ENDM

MACRO sgb_pct_trn
	sgb_header PCT_TRN_CMD, 1
	ds 15, $00
ENDM

MACRO sgb_attr_trn
	sgb_header ATTR_TRN_CMD, 1
	ds 15, $00
ENDM

MACRO sgb_attr_set
	sgb_header ATTR_SET_CMD, 1
	db \1 | (1 << 6)
	ds 14, $00
ENDM

MACRO sgb_mask_en
	sgb_header MASK_EN_CMD, 1
	db \1 ; MASK_EN_* parameter
	ds 14, $00
ENDM
