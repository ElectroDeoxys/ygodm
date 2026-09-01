MACRO? lb ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 | ((\3) & $ff)
ENDM

MACRO? farcall
	rst Farcall

	IF _NARG == 2 ; TODO remove when all farcalls are defined
		db \1, \2
	ELSE
		DEF _farcallidx EQUS "FARFUNCIDX_\1"
		db _farcallidx ; offset in table
		db BANK(\1) ; ROM bank
		PURGE _farcallidx
	ENDC
ENDM

MACRO? farcall_table_start
	DEF _curfarcallidx = 3
ENDM

MACRO? farfunc
	dw \1

	DEF _farcallidx EQUS "FARFUNCIDX_\1"
	EXPORT DEF {_farcallidx} EQU _curfarcallidx
	DEF _curfarcallidx = _curfarcallidx + 2
	PURGE _farcallidx
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

MACRO? call_hl
	ld bc, :+
	push bc
	jp hl
:
ENDM
