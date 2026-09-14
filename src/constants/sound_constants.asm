	const_def
	const MUSIC_NONE ; $00
	const MUSIC_MAIN_MENU ; $01
	const MUSIC_DUEL1 ; $02
	const MUSIC_DUEL2 ; $03
	const MUSIC_DUEL3 ; $04
	const MUSIC_DUEL4 ; $05
	const MUSIC_CAMPAIGN ; $06
	const MUSIC_07 ; $07
	const MUSIC_08 ; $08 unused?
	const MUSIC_09 ; $09
	const MUSIC_0A ; $0a
	const MUSIC_TEA ; $0b
	const MUSIC_DUEL_WIN ; $0c
	const MUSIC_DUEL_LOSS ; $0d
	const MUSIC_0E ; $0e unused?
	const MUSIC_EXODIA ; $0f
	const MUSIC_10 ; $10

	; IDs over this value are processed as SFX
	const_def $81
DEF SOUND_EFFECTS EQU const_value
	const_skip 17
	const SFX_92 ; $92
	const SFX_93 ; $93
	const SFX_94 ; $94
	const SFX_95 ; $95
	const SFX_96 ; $96
	const SFX_97 ; $97 unused?
	const SFX_98 ; $98
	const SFX_99 ; $99
	const SFX_9A ; $9a
	const SFX_9B ; $9b
	const SFX_9C ; $9c
	const SFX_9D ; $9d
	const SFX_9E ; $9e unused?
	const SFX_9F ; $9f
	const SFX_A0 ; $a0 unused?
	const SFX_A1 ; $a1
	const SFX_A2 ; $a2
	const SFX_A3 ; $a3

DEF INVALID_SOUND EQU -1
