DEF hlbgcoord EQUS "bgcoord hl,"
DEF bcbgcoord EQUS "bgcoord bc,"
DEF debgcoord EQUS "bgcoord de,"

MACRO? bgcoord
; register, x, y[, origin]
IF _NARG < 4
	ld \1, (\3) * TILEMAP_WIDTH + (\2) + vBGMap0
ELSE
	ld \1, (\3) * TILEMAP_WIDTH + (\2) + \4
ENDC
ENDM

MACRO? ldbgcoord
; x, y[, origin]
IF _NARG < 3
	ld [(\2) * TILEMAP_WIDTH + (\1) + vBGMap0], a
ELSE
	ld [(\2) * TILEMAP_WIDTH + (\1) + \3], a
ENDC
ENDM

MACRO? dwcoord
; x, y
	rept? _NARG / 2
		dw (\2) * TILEMAP_WIDTH + (\1) + vBGMap0
		SHIFT 2
	endr
ENDM
