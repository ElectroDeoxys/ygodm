MACRO? sound
	db \1_ ; channel 1
	db \2_ ; channel 2
	db \3_ ; channel 3
	db \4_ ; channel 4
ENDM

SoundHeaders:
	sound Sound_None_Ch1, Sound_None_Ch2, Sound_None_Ch3, Sound_None_Ch4 ; MUSIC_NONE
	sound Music_MainMenu_Ch1, Music_MainMenu_Ch2, Music_MainMenu_Ch3, Music_MainMenu_Ch4 ; MUSIC_MAIN_MENU
	db $08, $09, $0a, $0b ; MUSIC_DUEL1
	db $0c, $0d, $0e, $0f ; MUSIC_DUEL2
	db $10, $11, $12, $13 ; MUSIC_DUEL3
	db $14, $15, $16, $17 ; MUSIC_DUEL4
	db $18, $19, $1a, $1b ; MUSIC_CAMPAIGN
	db $1c, $1d, $1e, $1f ; MUSIC_07
	db $20, $21, $22, $23 ; MUSIC_08
	db $24, $25, $26, $27 ; MUSIC_09
	db $28, $29, $2a, $2b ; MUSIC_0A
	db $2c, $2d, $2e, $2f ; MUSIC_TEA
	db $30, $31, $32, $33 ; MUSIC_DUEL_WIN
	db $34, $35, $36, $37 ; MUSIC_DUEL_LOSS
	db $38, $39, $3a, $3b ; MUSIC_0E
	db $3c, $3d, $3e, $3f ; MUSIC_EXODIA
	db $40, $41, $42, $43 ; MUSIC_10
	db $80, $80, $80, $80
	db $44, $45, $80, $80 ; SFX_92
	db $80, $46, $80, $80 ; SFX_93
	db $80, $47, $80, $80 ; SFX_94
	db $80, $48, $80, $80 ; SFX_95
	db $49, $80, $80, $80 ; SFX_96
	db $4a, $80, $80, $80 ; SFX_97
	db $4b, $80, $80, $80 ; SFX_98
	db $80, $4c, $80, $80 ; SFX_99
	db $80, $4d, $80, $80 ; SFX_9A
	db $80, $4e, $80, $80 ; SFX_9B
	db $80, $80, $80, $4f ; SFX_9C
	db $50, $80, $80, $80 ; SFX_9D
	db $51, $80, $80, $80 ; SFX_9E
	db $52, $80, $80, $80 ; SFX_9F
	db $53, $54, $80, $80 ; SFX_A0
	db $80, $80, $80, $55 ; SFX_A1
	db $80, $80, $80, $56 ; SFX_A2
	db $57, $80, $80, $58 ; SFX_A3
