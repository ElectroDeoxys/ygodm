; wMainMenuSelection constants
	const_def
	const MAINMENU_CAMPAIGN ; $0
	const MAINMENU_VERSUS   ; $1
	const MAINMENU_TRADE    ; $2
	const MAINMENU_RECORDS  ; $3
DEF NUM_MAIN_MENU_ENTRIES EQU const_value

; wCampaignStage constants
	const_def
	const STAGE_EXIT         ; $0
	const STAGE_START_DUEL   ; $1
	const STAGE_IN_THE_SHIP  ; $2
	const STAGE_DUEL_KINGDOM ; $3
	const STAGE_SIMON_MURAN  ; $4
	const STAGE_MAXIMILLION  ; $5
	const STAGE_YAMI_YUGI    ; $6

; game modes
	const_def
	const GAMEMODE_UNK0          ; $0
	const GAMEMODE_DUEL_AI_OPP   ; $1
	const GAMEMODE_DUEL_LINK_OPP ; $2
	const GAMEMODE_TRADE         ; $3
	const GAMEMODE_RECORDS       ; $4
