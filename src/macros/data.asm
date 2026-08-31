MACRO? dwb
	dw \1
	db \2
ENDM

MACRO? dn ; nybbles
	REPT _NARG / 2
		db ((\1) << 4) | (\2)
		shift 2
	ENDR
ENDM

; card frequency tables
MACRO? card_freq_table_start
	DEF _cur_freq = 0
	DEF _cur_card = 0
ENDM

MACRO? card_freq
	REPT \1 - _cur_card
		dw _cur_freq
	ENDR
	DEF _cur_freq = _cur_freq + \2
	DEF _cur_card = \1
ENDM

MACRO? card_freq_table_end
	ASSERT _cur_freq == $800, "Frequencies must add up to $800, _cur_freq = {_cur_freq}"
	REPT INVALID_CARD - _cur_card
		dw _cur_freq
	ENDR
ENDM
