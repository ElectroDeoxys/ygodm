MACRO? text
	db \#
ENDM

MACRO? line
	db "<LINE>", \#
ENDM

MACRO? prompt
	db "<PROMPT>"
ENDM

MACRO? done
	db "<DONE>"
ENDM

MACRO? dialogue_ptr
	dw \1
	const \1_
EXPORT \1_
ENDM

MACRO? lddlg
	ld \1, \2_
ENDM

MACRO? dlg
	db \1_
ENDM
