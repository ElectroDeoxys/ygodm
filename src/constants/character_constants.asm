	const_def
	const WEEVIL       ; $00
	const MAI          ; $01
	const REX          ; $02
	const MAKO         ; $03
	const YAMI_YUGI    ; $04
	const YUGI         ; $05
	const TEA          ; $06
	const JOEY         ; $07
	const SETO_KAIBA   ; $08
	const MOKUBA       ; $09
	const TRISTAN      ; $0a
	const BAKURA       ; $0b
	const PUPPETEER    ; $0c
	const PANIK        ; $0d
	const BANDIT_KEITH ; $0e
	const MAXIMILLION  ; $0f
	const SIMON        ; $10
	const EXODIA       ; $11
DEF NUM_CHARACTERS EQU const_value

; duelist constants are treated different from character constants
; they omit non-duelists (Tea and Exodia), and are a different order
; these are converted to character constants in ConvertNPCDuelistToCharacter
	const_def
	const DUELIST_WEEVIL       ; $00
	const DUELIST_MAI          ; $01
	const DUELIST_REX          ; $02
	const DUELIST_MAKO         ; $03
	const DUELIST_SETO_KAIBA   ; $04
	const DUELIST_MOKUBA       ; $05
	const DUELIST_PUPPETEER    ; $06
	const DUELIST_PANIK        ; $07
	const DUELIST_BANDIT_KEITH ; $08
	const DUELIST_YUGI         ; $09
	const DUELIST_TRISTAN      ; $0a
	const DUELIST_JOEY         ; $0b
	const DUELIST_BAKURA       ; $0c
	const DUELIST_SIMON        ; $0d
	const DUELIST_MAXIMILLION  ; $0e
	const DUELIST_YAMI_YUGI    ; $0f
	const DUELIST_UNUSED_10    ; $10
DEF NUM_DUELISTS EQU const_value
