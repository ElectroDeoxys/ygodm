MACRO? lb ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 | ((\3) & $ff)
ENDM

MACRO? farcall
	rst Farcall
	db \1 ; offset in table
	db \2 ; ROM bank
ENDM

MACRO? bankswitch
	ld a, \1
	ld [$cfe1], a
	ld a, (\1) >> 5
	ld [$4100], a
	ld a, (\1) & $1f
	ld [$2100], a
ENDM

MACRO? debug_loop
:
	jr :-
ENDM
