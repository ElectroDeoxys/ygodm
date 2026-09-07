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

MACRO? text_ptr
	dw \1
	const \1_
EXPORT \1_
ENDM

MACRO? ldtx
	ld \1, \2_
ENDM

MACRO? tx
	db \1_
ENDM
