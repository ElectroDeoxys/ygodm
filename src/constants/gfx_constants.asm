; tile size
DEF tiles EQUS "* TILE_SIZE"
DEF tile  EQUS "+ TILE_SIZE *"

def TILE_1BPP_SIZE equ 8 ; size of 1bpp tile in bytes

	const_def 0, 2
	const COL_0 ; 0
	const COL_1 ; 2
	const COL_2 ; 4
	const COL_3 ; 6

MACRO ldpal
ASSERT \2 < 4 && \3 < 4 && \4 < 4 && \5 < 4
	ld \1, (\2 << COL_0) | (\3 << COL_1) | (\4 << COL_2) | (\5 << COL_3)
ENDM

MACRO dbpal
ASSERT \1 < 4 && \2 < 4 && \3 < 4 && \4 < 4
	db (\1 << COL_0) | (\2 << COL_1) | (\3 << COL_2) | (\4 << COL_3)
ENDM
