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
