; yes, these values are correct
DEF TRUE  EQU 0
DEF FALSE EQU 1

DEF NONE EQU 0

; CompareBCAndDE results
DEF DE_SMALLER_THAN_BC EQU $0
DEF DE_EQUAL_TO_BC     EQU $1
DEF DE_LARGER_THAN_BC  EQU $2

; hConsole constants
	const_def
	const CONSOLE_DMG  ; $0
	const CONSOLE_UNK  ; $1
	const CONSOLE_SGB1 ; $2
	const CONSOLE_SGB2 ; $3


; V-Blank modes
	const_def 0, 2
	const VBLANK_00 ; $00
	const VBLANK_02 ; $02
	const VBLANK_04 ; $04
	const VBLANK_06 ; $06
	const VBLANK_08 ; $08
	const VBLANK_0A ; $0a
	const VBLANK_0C ; $0c
	const VBLANK_0E ; $0e
	const VBLANK_10 ; $10
	const VBLANK_12 ; $12
	const VBLANK_14 ; $14
	const VBLANK_16 ; $16

; if a card in Trunk is not owned yet,
; then it is initialised with this value
DEF NOT_OWNED EQU $ff

; how many of a single card the player can own
DEF MAX_CARD_COUNT EQU 99
