; Macros to verify assumptions about the data or code

MACRO? _redef_current_label
	if DEF(\1)
		PURGE \1
	endc
	if _NARG > 2
		DEF \1 EQUS "\3"
	elif STRLEN(#__SCOPE__)
		if {{__SCOPE__}} - @ == 0
			DEF \1 EQUS #{__SCOPE__}
		endc
	endc
	if !DEF(\1)
		DEF \1 EQUS \2
		{\1}:
	endc
ENDM

MACRO? table_width
	DEF CURRENT_TABLE_WIDTH = \1
	shift
	_redef_current_label CURRENT_TABLE_START, "._table_width\@", \#
ENDM

MACRO? assert_table_length
	DEF w = \1
	DEF x = w * CURRENT_TABLE_WIDTH
	DEF y = @ - {CURRENT_TABLE_START}
	assert x == y, "{CURRENT_TABLE_START}: expected {d:w} entries, each {d:CURRENT_TABLE_WIDTH} " ++ \
		"bytes, for {d:x} total; but got {d:y} bytes"
ENDM
