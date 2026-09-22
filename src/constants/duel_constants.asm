DEF DECK_SIZE  EQU 40
DEF HAND_SIZE  EQU  5
DEF FIELD_SIZE EQU  5

DEF INITIAL_LP EQU $8000

; wDuelStatus and wOtherDuelStatus constants
	const_def
	const DUELSTATUS_0           ; $0
	const DUELSTATUS_1           ; $1
	const DUELSTATUS_PLAYER_LOSS ; $2
	const DUELSTATUS_PLAYER_WIN  ; $3

	const_def
	const CARD_LOCATION_OPP_HAND     ; $0
	const CARD_LOCATION_OPP_FIELD    ; $1
	const CARD_LOCATION_PLAYER_FIELD ; $2
	const CARD_LOCATION_PLAYER_HAND  ; $3

; card status flags
	const_def
	const_skip 3
	const CARDFLAG_UNK3_F ; 3
	const CARDFLAG_UNK4_F ; 4
	const_skip
	const CARDFLAG_FACE_UP_F ; 6

DEF CARDFLAG_UNK3    EQU 1 << CARDFLAG_UNK3_F
DEF CARDFLAG_UNK4    EQU 1 << CARDFLAG_UNK4_F
DEF CARDFLAG_FACE_UP EQU 1 << CARDFLAG_FACE_UP_F

DEF CARD_LEVEL EQU 4
DEF CARD_LEVEL_MASK EQU $3 << CARD_LEVEL

DEF LEVEL_MINUS_1 EQU 0 << CARD_LEVEL ; $00
DEF LEVEL_0       EQU 1 << CARD_LEVEL ; $10
DEF LEVEL_PLUS_1  EQU 2 << CARD_LEVEL ; $20
DEF LEVEL_PLUS_2  EQU 3 << CARD_LEVEL ; $30

	const_def
	const DRAGON        ; $00
	const SPELLCASTER   ; $01
	const ZOMBIE        ; $02
	const WARRIOR       ; $03
	const BEAST_WARRIOR ; $04
	const BEAST         ; $05
	const WINGED_BEAST  ; $06
	const FIEND         ; $07
	const FAIRY         ; $08
	const INSECT        ; $09
	const DINOSAUR      ; $0a
	const REPTILE       ; $0b
	const FISH          ; $0c
	const SEA_SERPENT   ; $0d
	const MACHINE       ; $0e
	const THUNDER       ; $0f
	const AQUA          ; $10
	const PYRO          ; $11
	const ROCK          ; $12
	const PLANT         ; $13

	const MAGIC         ; $14

; duel fields
	const_def 1
	const FIELD_FOREST    ; $1
	const FIELD_WASTELAND ; $2
	const FIELD_MOUNTAIN  ; $3
	const FIELD_SOGEN     ; $4
	const FIELD_UMI       ; $5
	const FIELD_YAMI      ; $6
DEF NUM_FIELDS EQU const_value - 1

; Exodia flags
DEF HAS_R_LEG_OF_FORBIDDEN EQU 1 << 0
DEF HAS_L_LEG_OF_FORBIDDEN EQU 1 << 1
DEF HAS_R_ARM_OF_FORBIDDEN EQU 1 << 2
DEF HAS_L_ARM_OF_FORBIDDEN EQU 1 << 3
DEF HAS_EXODIA_FORBIDDEN   EQU 1 << 4
