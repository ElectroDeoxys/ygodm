	const_def
	const LINE_1 ; $0
	const LINE_2 ; $1
	const LINE_3 ; $2
	IF DEF(_EARLY_DAYS_EN)
		const LINE_4 ; $3
		const LINE_5 ; $4
	ENDC
DEF NUM_TEXTBOX_LINES EQU const_value

DEF LINE_LENGTH EQU 18

	const_def 0, 2
	const TEXTLOAD_NUMBER ; $00
	const TEXTLOAD_FIELD ; $02
	const TEXTLOAD_CARD_NAME ; $04
	const TEXTLOAD_06 ; $06
	const TEXTLOAD_08 ; $08
	const TEXTLOAD_0A ; $0a
	const TEXTLOAD_0C ; $0c
	const TEXTLOAD_CARD_TYPE ; $0e
	const TEXTLOAD_10 ; $10
	const TEXTLOAD_12 ; $12
