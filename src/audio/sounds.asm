	const_def

MACRO? sound_ptr
	const \1_
	dw \1
ENDM

Sounds:
	sound_ptr Sound_None_Ch1
	sound_ptr Sound_None_Ch2
	sound_ptr Sound_None_Ch3
	sound_ptr Sound_None_Ch4
	sound_ptr Music_MainMenu_Ch1
	sound_ptr Music_MainMenu_Ch2
	sound_ptr Music_MainMenu_Ch3
	sound_ptr Music_MainMenu_Ch4
	dw Sound_f8d15
	dw Sound_f8ea6
	dw Sound_f92cf
	dw Sound_f93cf
	dw Sound_f93f7
	dw Sound_f951a
	dw Sound_f9718
	dw Sound_f97d3
	dw Sound_f97e5
	dw Sound_f99a8
	dw Sound_f9ba9
	dw Sound_f9ca7
	dw Sound_f9cd0
	dw Sound_f9f5b
	dw Sound_fa2c6
	dw Sound_fa3d3
	dw Sound_fa477
	dw Sound_fa5b0
	dw Sound_fa6b1
	dw Sound_fa753
	dw Sound_fa76a
	dw Sound_fa833
	dw Sound_faa08
	dw Sound_fab71
	dw Sound_fab87
	dw Sound_fadee
	dw Sound_fb0ad
	dw Sound_fb14a
	dw Sound_fb15c
	dw Sound_fb211
	dw Sound_fb2d5
	dw Sound_fb31e
	dw Sound_fb32e
	dw Sound_fb3f8
	dw Sound_fb4b0
	dw Sound_fb522
	dw Sound_fb542
	dw Sound_fb621
	dw Sound_fb718
	dw Sound_None_Ch1
	dw Sound_fb761
	dw Sound_fb7c6
	dw Sound_fb825
	dw Sound_fb856
	dw Sound_fb88e
	dw Sound_fb8e9
	dw Sound_fb942
	dw Sound_fb95d
	dw Sound_fb97a
	dw Sound_fb9b7
	dw Sound_fb9e4
	dw Sound_fba03
	dw Sound_fba1b
	dw Sound_fba5c
	dw Sound_fba9f
	dw Sound_fbacf
	dw Sound_fbaf5
	dw Sound_fbbde
	dw Sound_fbc97
	dw Sound_fbd5d
	dw Sound_fbde7
	dw Sound_fbdfc
	dw Sound_fbe16
	dw Sound_fbe2d
	dw Sound_fbe56
	dw Sound_fbe71
	dw Sound_fbe84
	dw Sound_fbe97
	dw Sound_fbeb1
	dw Sound_fbecc
	dw Sound_fbed5
	dw Sound_fbeec
	dw Sound_fbefe
	dw Sound_fbf1d
	dw Sound_fbf2a
	dw Sound_fbf47
	dw Sound_fbf61
	dw Sound_fbf7f
	dw Sound_fbf96
	dw Sound_fbfa9
	dw Sound_fbfb5

Sound_None_Ch1:
Sound_None_Ch2:
Sound_None_Ch3:
Sound_None_Ch4:
	audio_done

INCLUDE "audio/music/main_menu.asm"

Sound_f8d15:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note G_3,  4, $1
	rest  0
	note G_3,  4, $3
	rest  0
	note D_4,  4, $1
	rest  0
	note D_4,  4, $3
	rest  0
	note D_4,  4, $1
	rest  0
	note D_4,  4, $3
	rest  0
	note D#4,  9, $1
	rest  1
	note D#4,  4, $3
	rest  0
	note D#4,  4, $1
	rest  0
	note D_4,  4, $1
	rest  0
	note D_4,  4, $3
	rest  0
	note C_4,  4, $1
	rest  0
	note C_4,  4, $3
	rest  0
	note D_4,  4, $1
	rest  0
	note D_4,  4, $3
	rest  0
	note C_4,  4, $1
	rest  0
	note C_4,  4, $3
	rest  0
	note A#3,  4, $1
	rest  0
	note A#3,  4, $3
	rest  0
	note A#3,  4, $1
	rest  0
	note A#3,  4, $3
	rest  0
	note G#3,  9, $1
	rest  1
	note G#3,  4, $3
	rest  0
	note G#3,  4, $1
	rest  0
	note G#3,  4, $1
	rest  0
	note G#3,  4, $3
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $3
	rest  0
	note F_3,  4, $1
	rest  0
	note F_3,  4, $3
	rest  0
	note G_4,  4, $1
	rest  0
	note G_4,  4, $3
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $3
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $3
	rest  0
	note D#5,  9, $1
	rest  1
	note D#5,  4, $3
	rest  0
	note D#5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $3
	rest  0
	note C_5,  4, $1
	rest  0
	note C_5,  4, $3
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $3
	rest  0
	note C_5,  4, $1
	rest  0
	note C_5,  4, $3
	rest  0
	note A#4,  4, $1
	rest  0
	note A#4,  4, $3
	rest  0
	note A#4,  4, $1
	rest  0
	note A#4,  4, $3
	rest  0
	note G#4,  9, $1
	rest  1
	note G#4,  4, $3
	rest  0
	note G#4,  4, $1
	rest  0
	note G#4,  4, $1
	rest  0
	note G#4,  4, $3
	rest  0
	note G_4,  4, $1
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $1
	rest  0
	note F_4,  4, $3
	rest  0
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $4
	note D_4, 23, $1
	note D_4, 23, $1
	note D_4, 23, $1
	note D_4, 22, $1
	rest  0
	note G_3, 23, $1
	note G_3, 23, $1
	note G_3, 22, $1
	rest  0
	note G_3,  4, $1
	rest  0
	note A#3,  4, $1
	rest  0
	note D_4,  4, $1
	rest  0
	note F_4,  4, $1
	rest  0
	note E_4, 23, $1
	note E_4, 23, $1
	note E_4, 22, $1
	rest  0
	note G_3,  4, $1
	rest  0
	note A#3,  4, $1
	rest  0
	note D_4,  4, $1
	rest  0
	note G_4,  4, $1
	rest  0
	note G#4, 23, $4
	note G#4, 23, $4
	note G#4, 23, $4
	note G#4, 23, $4
	note G#4, 10, $1
	rest  0
	note G#4, 21, $1
	rest  1
	note G#4, 21, $1
	rest  1
	note G#4, 21, $1
	rest  1
	note G#4, 10, $1
	rest  0
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 10, $1
	rest  0
	note G_4, 21, $1
	rest  1
	note G_4, 21, $1
	rest  1
	note G_4, 21, $1
	rest  1
	note G_4, 10, $1
	rest  0
	audio_jp Sound_f8d15

Sound_f8ea6:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note A#5, 10, $2
	rest  0
	note A#5,  4, $4
	rest  0
	note A#5,  4, $4
	rest  0
	note A#5, 10, $2
	rest  0
	note A#5,  4, $4
	rest  0
	note A#5,  4, $4
	rest  0
	note C_6, 10, $2
	rest  0
	note C_6,  4, $4
	rest  0
	note C_6,  4, $4
	rest  0
	note C_6, 10, $2
	rest  0
	note C_6,  4, $4
	rest  0
	note C_6,  4, $4
	rest  0
	note D_6, 10, $2
	rest  0
	note D_6,  4, $4
	rest  0
	note D_6,  4, $4
	rest  0
	note D_6, 10, $2
	rest  0
	note D_6,  4, $4
	rest  0
	note D_6,  4, $4
	rest  0
	note D#6, 10, $2
	rest  0
	note D#6,  4, $4
	rest  0
	note D#6,  4, $4
	rest  0
	note D#6, 10, $2
	rest  0
	note D#6,  4, $4
	rest  0
	note D#6,  4, $4
	rest  0
	note A#5, 10, $2
	rest  0
	note A#5,  4, $4
	rest  0
	note A#5,  4, $4
	rest  0
	note A#5, 10, $2
	rest  0
	note A#5,  4, $4
	rest  0
	note A#5,  4, $4
	rest  0
	note C_6, 10, $2
	rest  0
	note C_6,  4, $4
	rest  0
	note C_6,  4, $4
	rest  0
	note C_6, 10, $2
	rest  0
	note C_6,  4, $4
	rest  0
	note C_6,  4, $4
	rest  0
	note D_6, 10, $2
	rest  0
	note D_6,  4, $4
	rest  0
	note D_6,  4, $4
	rest  0
	note D_6, 10, $2
	rest  0
	note D_6,  4, $4
	rest  0
	note D_6,  4, $4
	rest  0
	note D#6, 10, $2
	rest  0
	note D#6,  4, $4
	rest  0
	note D#6,  4, $4
	rest  0
	note D#6, 10, $2
	rest  0
	note D#6,  4, $4
	rest  0
	note D#6,  4, $4
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note F#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note A_3,  1, $2
	rest  0
	note A#3,  1, $2
	rest  0
	note B_3,  1, $2
	rest  0
	note C_4,  1, $2
	rest  0
	note C#4,  1, $2
	rest  0
	note D_4,  1, $2
	rest  0
	note D#4,  1, $2
	rest  0
	note E_4,  1, $2
	rest  0
	note F_4,  1, $2
	rest  0
	note F#4,  1, $2
	rest  0
	note G_4,  1, $2
	rest  0
	note G#4,  1, $2
	rest  0
	note A_4,  1, $2
	rest  0
	note A#4,  1, $2
	rest  0
	note B_4,  1, $2
	rest  0
	note C_5,  1, $2
	rest  0
	note C#5,  1, $2
	rest  0
	note D_5,  1, $2
	rest  0
	note D#5,  1, $2
	rest  0
	note E_5,  1, $2
	rest  0
	note F_5,  1, $2
	rest  0
	note F#5,  1, $2
	rest  0
	note G_5,  1, $2
	rest  0
	note G#5,  1, $2
	rest  0
	note A_5,  1, $2
	rest  0
	note A#5,  1, $2
	rest  0
	note B_5,  1, $2
	rest  0
	note C_6,  1, $2
	rest  0
	note C#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note D#6,  1, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note D_5,  4, $4
	rest  0
	note D_5,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note D_5,  4, $4
	rest  0
	note D_5,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note D_5,  4, $4
	rest  0
	note D_5,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note D_5,  4, $4
	rest  0
	note G_5,  4, $2
	rest  0
	note G#5,  4, $2
	rest  0
	note G_5,  4, $2
	rest  0
	note G_5,  4, $4
	rest  0
	note G_5,  4, $2
	rest  0
	note G#5,  4, $2
	rest  0
	note G_5,  4, $2
	rest  0
	note G_5,  4, $4
	rest  0
	note G_5,  4, $2
	rest  0
	note G#5,  4, $2
	rest  0
	note G_5,  4, $2
	rest  0
	note G_5,  4, $4
	rest  0
	note G_5,  4, $2
	rest  0
	note G#5,  4, $2
	rest  0
	note G_5,  4, $2
	rest  0
	note G_5,  4, $4
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F_5,  4, $4
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F_5,  4, $4
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F_5,  4, $4
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F_5,  4, $4
	rest  0
	note F_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note F_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note F_5,  4, $2
	rest  0
	note F#5,  4, $2
	rest  0
	note C_6, 23, $2
	note C_6,  9, $2
	rest  1
	note B_5,  2, $2
	rest  0
	note C_6,  2, $2
	rest  0
	note B_5,  2, $2
	rest  0
	note E_6,  1, $2
	rest  0
	note D_6,  1, $2
	rest  0
	note C#6,  1, $2
	rest  0
	note C_6,  1, $2
	rest  0
	note B_5,  1, $2
	rest  0
	note A#5,  1, $2
	rest  0
	note A_5,  1, $2
	rest  0
	note G#5,  1, $2
	rest  0
	note G_5,  1, $2
	rest  0
	note F#5,  1, $2
	rest  0
	note F_5,  1, $2
	rest  0
	note E_5,  1, $2
	rest  0
	note D#5,  1, $2
	rest  0
	note D_5,  1, $2
	rest  0
	note C#5,  1, $2
	rest  0
	note C_5,  1, $2
	rest  0
	note B_4,  1, $2
	rest  0
	note A#4,  1, $2
	rest  0
	note A_4,  1, $2
	rest  0
	note G#4,  1, $2
	rest  0
	note G_4,  1, $2
	rest  0
	note F#4,  1, $2
	rest  0
	note F_4,  1, $2
	rest  0
	note E_4,  1, $2
	rest  0
	note D#4,  1, $2
	rest  0
	note D_4,  1, $2
	rest  0
	note C#4,  1, $2
	rest  0
	note C_4,  1, $2
	rest  0
	note B_3,  1, $2
	rest  0
	note A#3,  1, $2
	rest  0
	note A_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	note G_3,  1, $2
	rest  0
	note G#3,  1, $2
	rest  0
	audio_jp Sound_f8ea6

Sound_f92cf:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	audio_call Sound_f938e
	audio_call Sound_f938e
	audio_call Sound_f938e
	audio_call Sound_f938e
	note D_3, 16, $2
	rest  0
	rest  5
	note D_3, 16, $2
	rest  0
	rest  5
	note D_3, 10, $2
	rest  0
	note A_2, 10, $2
	rest  0
	note D_3, 10, $2
	rest  0
	note A_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note G_2, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C#3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	note C_3, 10, $2
	rest  0
	audio_jp Sound_f92cf

Sound_f938e:
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G_2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	note G#2,  4, $2
	rest  0
	audio_ret

Sound_f93cf:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	pan PAN_LEFT | PAN_RIGHT
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	audio_jp Sound_f93cf

Sound_f93f7:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT
	audio_unkf9 $03
	audio_call Sound_f9486
	audio_call Sound_f9486
	note B_3, 16, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note A_3, 10, $1
	rest  0
	note A_3,  4, $4
	rest  0
	note E_4,  5, $4
	note E_4, 23, $4
	note E_4, 23, $4
	audio_call Sound_f9507
	note B_3, 16, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note G_3, 10, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note E_4,  5, $4
	note E_4, 23, $4
	note E_4, 23, $4
	audio_call Sound_f9507
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note D#4,  4, $4
	rest  0
	audio_jp Sound_f93f7

Sound_f9486:
	rest 11
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note C_5,  4, $1
	rest  0
	note D_5, 23, $1
	note D_5,  9, $1
	rest  1
	note D_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note D#5, 10, $1
	rest  0
	note D#5,  4, $3
	rest  0
	note D_5, 10, $1
	rest  0
	note D_5,  4, $3
	rest  0
	note C_5, 23, $1
	note C_5, 21, $1
	rest  1
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	rest 11
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note C_5,  4, $1
	rest  0
	note D_5, 23, $1
	note D_5,  9, $1
	rest  1
	note D_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note F_5, 23, $4
	note F_5, 23, $4
	note F_5, 23, $4
	note F_5, 10, $1
	rest  0
	note F_5,  4, $3
	rest  0
	note F_5,  4, $4
	rest  0
	audio_ret

Sound_f9507:
	note E_4, 23, $4
	note E_4, 23, $4
	note E_4, 23, $4
	note E_4, 10, $1
	rest  0
	note E_4,  4, $3
	rest  0
	note E_4,  4, $4
	rest  0
	audio_ret

Sound_f951a:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_1
	pan PAN_RIGHT
	audio_unkf9 $03
	audio_call Sound_f9655
	audio_call Sound_f9696
	audio_call Sound_f9655
	audio_call Sound_f96d7
	audio_call Sound_f9655
	audio_call Sound_f9696
	audio_call Sound_f9655
	audio_call Sound_f96d7
	note E_4, 23, $3
	note E_4, 21, $3
	rest  1
	note C_6,  4, $3
	rest  0
	note C_6,  4, $4
	rest  0
	note A_5,  4, $3
	rest  0
	note A_5,  4, $4
	rest  0
	note F_5,  4, $3
	rest  0
	note F_5,  4, $4
	rest  0
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note C_6,  4, $3
	rest  0
	note C_6,  4, $4
	rest  0
	note A_5,  4, $3
	rest  0
	note A_5,  4, $4
	rest  0
	note F_5,  4, $3
	rest  0
	note F_5,  4, $4
	rest  0
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note C_6,  4, $3
	rest  0
	note C_6,  4, $4
	rest  0
	note A_5,  4, $3
	rest  0
	note A_5,  4, $4
	rest  0
	note F_5,  4, $3
	rest  0
	note F_5,  4, $4
	rest  0
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note E_4, 23, $3
	note E_4, 21, $3
	rest  1
	note C_6,  4, $3
	rest  0
	note C_6,  4, $4
	rest  0
	note B_5,  4, $3
	rest  0
	note B_5,  4, $4
	rest  0
	note G_5,  4, $3
	rest  0
	note G_5,  4, $4
	rest  0
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note C_6,  4, $3
	rest  0
	note C_6,  4, $4
	rest  0
	note B_5,  4, $3
	rest  0
	note B_5,  4, $4
	rest  0
	note G_5,  4, $3
	rest  0
	note G_5,  4, $4
	rest  0
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note C_6,  4, $3
	rest  0
	note C_6,  4, $4
	rest  0
	note B_5,  4, $3
	rest  0
	note B_5,  4, $4
	rest  0
	note G_5,  4, $3
	rest  0
	note G_5,  4, $4
	rest  0
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	note G#3,  4, $2
	rest  0
	note G#3,  4, $4
	rest  0
	audio_jp Sound_f951a

Sound_f9655:
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	audio_ret

Sound_f9696:
	note C_5,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note C_5,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	audio_ret

Sound_f96d7:
	note G#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note G#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note G#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note G#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note G#4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note A#4,  4, $4
	rest  0
	note G#4,  4, $4
	rest  0
	note C#5,  4, $4
	rest  0
	note C_5,  4, $4
	rest  0
	note D#5,  4, $4
	rest  0
	note C#5,  4, $4
	rest  0
	audio_ret

Sound_f9718:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	audio_call Sound_f9777
	audio_call Sound_f9777
	note F_3, 23, $2
	note F_3, 23, $2
	note F_3,  5, $2
	rest  5
	note F_4, 21, $2
	rest  1
	note F_3, 11, $4
	note F_3, 11, $2
	note F_2,  5, $2
	rest  5
	note F_2, 21, $2
	rest  1
	note F_2, 17, $2
	note F_2,  5, $2
	rest 11
	note F_2, 11, $2
	note C_3, 23, $4
	note C_3, 23, $4
	note C_3, 17, $2
	rest  5
	note C_3,  5, $2
	note D_3,  5, $2
	note E_3,  5, $2
	note G_2,  5, $2
	rest 11
	note G_2,  5, $2
	rest  5
	note G_2, 21, $2
	rest  1
	note C_3, 11, $2
	rest  5
	note C_3, 11, $2
	rest  5
	note C_3,  5, $2
	rest  5
	audio_call Sound_f97ca
	audio_call Sound_f97ca
	audio_jp Sound_f9718

Sound_f9777:
	note G_2, 17, $2
	note G_3,  5, $2
	rest 11
	note G_2, 21, $2
	rest  1
	note G_2,  5, $2
	note G_2,  5, $2
	note G_3,  5, $2
	note G_2, 11, $2
	note G_2,  5, $2
	note G#2, 17, $2
	note G#3,  5, $2
	rest 11
	note G#2,  5, $2
	rest  5
	note G#3, 11, $2
	rest 11
	note G#2, 11, $2
	note G#2, 11, $2
	note G_2, 17, $2
	note G_3,  5, $2
	rest 11
	note G_2, 21, $2
	rest  1
	note G_2,  5, $2
	note G_2,  5, $2
	note G_3,  5, $2
	note G_2, 11, $2
	note G_2,  5, $2
	note C#3, 17, $2
	note C#4,  5, $2
	rest 11
	note C#3,  5, $2
	rest  5
	note C#4, 11, $2
	rest 11
	note G#3,  5, $2
	rest  1
	note F_3,  5, $2
	note C#3,  5, $2
	note G#2,  5, $2
	audio_ret

Sound_f97ca:
	note C#3, 23, $2
	note C#3, 23, $2
	note C#3, 23, $2
	note C#3, 23, $2
	audio_ret

Sound_f97d3:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	note D#1, 23, $1
	note D#1, 11, $1
	note D#1, 11, $1
	audio_jp Sound_f97d3

Sound_f97e5:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note A_3,  4, $1
	rest  0
	note A_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note C_4,  4, $1
	rest  0
	note C_4,  4, $4
	rest  0
	note D_4,  4, $1
	rest  0
	note D_4,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note A_3,  4, $1
	rest  0
	note A_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note C_4,  4, $1
	rest  0
	note C_4,  4, $4
	rest  0
	note D_4,  4, $1
	rest  0
	note D_4,  4, $4
	rest  0
	note D#5, 21, $1
	rest  1
	note D#5,  4, $3
	rest  0
	note D#5,  4, $4
	rest  0
	note D#5,  4, $1
	rest  0
	note D#5,  4, $1
	rest  0
	note G#4, 21, $1
	rest  1
	note G#4,  4, $3
	rest  0
	note G#4,  4, $4
	rest  0
	note G#4,  4, $1
	rest  0
	note G#4,  4, $1
	rest  0
	note B_4, 21, $1
	rest  1
	note B_4,  4, $3
	rest  0
	note B_4,  4, $4
	rest  0
	note B_4,  4, $1
	rest  0
	note B_4,  4, $1
	rest  0
	note C_5, 16, $1
	rest  0
	note C_5,  4, $4
	rest  0
	note D_5, 16, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note F_5, 21, $1
	rest  1
	note F_5,  4, $3
	rest  0
	note F_5,  4, $4
	rest  0
	note F_5,  4, $1
	rest  0
	note F_5,  4, $1
	rest  0
	note B_4, 21, $1
	rest  1
	note B_4,  4, $3
	rest  0
	note B_4,  4, $4
	rest  0
	note B_4,  4, $1
	rest  0
	note B_4,  4, $1
	rest  0
	note C_5, 21, $1
	rest  1
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note C_5,  4, $1
	rest  0
	note C_5,  4, $1
	rest  0
	note D_5, 16, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note E_5, 16, $1
	rest  0
	note E_5,  4, $4
	rest  0
	audio_call Sound_f9996
	audio_call Sound_f9996
	audio_call Sound_f999f
	audio_call Sound_f999f
	audio_jp Sound_f97e5

Sound_f9996:
	note G_5, 23, $4
	note G_5, 23, $4
	note G_5, 23, $4
	note G_5, 23, $4
	audio_ret

Sound_f999f:
	rest 23
	rest 23
	rest 23
	rest 23
	audio_ret

Sound_f99a8:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note F#3,  4, $1
	rest  0
	note F#3,  4, $4
	rest  0
	note E_3,  4, $1
	rest  0
	note E_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note A_3,  4, $1
	rest  0
	note A_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note F#3,  4, $1
	rest  0
	note F#3,  4, $4
	rest  0
	note E_3,  4, $1
	rest  0
	note E_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note G_3,  4, $1
	rest  0
	note G_3,  4, $4
	rest  0
	note A_3,  4, $1
	rest  0
	note A_3,  4, $4
	rest  0
	note B_3,  4, $1
	rest  0
	note B_3,  4, $4
	rest  0
	note C_4,  4, $3
	rest  0
	note G#4,  4, $3
	rest  0
	note C_4,  4, $3
	rest  0
	note G#4,  4, $3
	rest  0
	note C_4,  4, $3
	rest  0
	note G#4,  4, $3
	rest  0
	note C_4,  4, $3
	rest  0
	note G#4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note F_4,  4, $3
	rest  0
	note D_5, 21, $1
	rest  1
	note D_5,  4, $3
	rest  0
	note D_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note G#4, 21, $1
	rest  1
	note G#4,  4, $3
	rest  0
	note G#4,  4, $4
	rest  0
	note G#4,  4, $1
	rest  0
	note G#4,  4, $1
	rest  0
	note A_4, 21, $1
	rest  1
	note A_4,  4, $3
	rest  0
	note A_4,  4, $4
	rest  0
	note A_4,  4, $1
	rest  0
	note A_4,  4, $1
	rest  0
	note B_4, 16, $1
	rest  0
	note B_4,  4, $4
	rest  0
	note C_5, 16, $1
	rest  0
	note C_5,  4, $4
	rest  0
	audio_call Sound_f9b97
	audio_call Sound_f9b97
	audio_call Sound_f9ba0
	audio_call Sound_f9ba0
	audio_jp Sound_f99a8

Sound_f9b97:
	note A#4, 23, $1
	note A#4, 23, $4
	note A#4, 23, $4
	note A#4, 23, $4
	audio_ret

Sound_f9ba0:
	rest 23
	rest 23
	rest 23
	rest 23
	audio_ret

Sound_f9ba9:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note C_0
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	rest 11
	note E_2, 11, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note C_3, 11, $2
	rest 11
	note C_3, 11, $2
	rest 11
	note C_3, 11, $2
	rest 11
	note C_3, 11, $2
	rest 11
	note C_3, 11, $2
	rest 11
	note C_3, 11, $2
	rest 11
	note C_3, 11, $2
	rest 11
	note C_3,  5, $2
	note B_2,  5, $2
	note C_3,  5, $2
	note B_2,  5, $2
	note G#2,  5, $2
	rest  5
	note G#2,  5, $2
	rest  5
	note G#2,  5, $2
	rest  5
	note G#2,  5, $2
	rest  5
	note D_2,  5, $2
	rest  5
	note D_2,  5, $2
	rest  5
	note D_2,  5, $2
	rest  5
	note D_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note G_2,  5, $2
	rest  5
	note B_2,  5, $2
	rest  5
	note B_2,  5, $2
	rest  5
	note B_2,  5, $2
	rest  5
	note B_2,  5, $2
	rest  5
	note E_2,  5, $2
	rest  5
	note E_2,  5, $2
	rest  5
	note E_2,  5, $2
	rest  5
	note E_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	note F_2,  5, $2
	rest  5
	audio_call Sound_f9c86
	audio_call Sound_f9c86
	audio_call Sound_f9c86
	audio_call Sound_f9c86
	audio_jp Sound_f9ba9

Sound_f9c86:
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	note D#2,  5, $2
	rest  5
	audio_ret

Sound_f9ca7:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	audio_call Sound_f9cc7
	note D#1,  5, $1
	rest  5
	note G#0,  5, $1
	note G#0,  5, $7
	note D#1,  5, $1
	note D#1,  5, $7
	note G#0,  5, $1
	note G#0,  5, $7
	audio_call Sound_f9cc7
	audio_jp Sound_f9ca7

Sound_f9cc7:
	note D#1,  5, $1
	rest  5
	note G#0,  5, $1
	rest  5
	audio_ret

Sound_f9cd0:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note C_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note D_4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note G_4, 21, $1
	rest  1
	note G_4,  4, $3
	rest  0
	note G_4,  4, $4
	rest  0
	note G_4,  4, $1
	rest  0
	note A_4,  4, $1
	rest  0
	note A#4, 16, $1
	rest  0
	note A#4,  4, $3
	rest  0
	note G_5, 16, $1
	rest  0
	note G_5,  4, $3
	rest  0
	note F#5, 10, $1
	rest  0
	note F#5,  4, $3
	rest  0
	note D#5,  4, $1
	rest  0
	note D_5, 23, $1
	note D_5, 23, $1
	note D_5, 23, $1
	note C_5, 21, $1
	rest  1
	note C_5,  4, $3
	rest  0
	note C_5,  4, $4
	rest  0
	note C_5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note D#5, 16, $1
	rest  0
	note D#5,  4, $3
	rest  0
	note A#5, 16, $1
	rest  0
	note A#5,  4, $3
	rest  0
	note A_5, 10, $1
	rest  0
	note A_5,  4, $3
	rest  0
	note G_5,  4, $1
	rest  0
	note F#5, 23, $4
	note F#5, 23, $4
	note F#5, 23, $4
	note F#5, 23, $1
	note F#5, 23, $1
	note F#5, 23, $1
	note F#5, 23, $1
	audio_jp Sound_f9cd0

Sound_f9f5b:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	rest  5
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note C_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note F#4,  4, $4
	rest  0
	note D_4,  4, $4
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4,  4, $4
	rest  0
	note D#4,  4, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note F_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note D_5, 10, $1
	rest  0
	note D_5,  4, $3
	rest  0
	note C_5,  4, $1
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note C_5,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note C_5,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note C_5,  4, $2
	rest  0
	note D#5,  4, $2
	rest  0
	note C_5,  4, $2
	rest  0
	note G_5,  4, $2
	rest  0
	note F#5, 10, $1
	rest  0
	note F#5,  4, $3
	rest  0
	note D#5,  4, $1
	rest  0
	note D_5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note D_5,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note D_4,  1, $1
	rest  0
	note D#4,  1, $1
	rest  0
	note E_4,  1, $1
	rest  0
	note F_4,  1, $1
	rest  0
	note F#4,  1, $1
	rest  0
	note G_4,  1, $1
	rest  0
	note G#4,  1, $1
	rest  0
	note A_4,  1, $1
	rest  0
	note A#4,  1, $1
	rest  0
	note B_4,  1, $1
	rest  0
	note C_5,  1, $1
	rest  0
	note C#5,  1, $1
	rest  0
	note D_5,  1, $1
	rest  0
	note D#5,  1, $1
	rest  0
	note E_5,  1, $1
	rest  0
	note F_5,  1, $1
	rest  0
	audio_jp Sound_f9f5b

Sound_fa2c6:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note C_3, 23, $4
	note C_3, 23, $4
	note C_3, 23, $4
	note C_3, 23, $4
	note C_3, 23, $2
	note C_3, 23, $2
	note C_3, 23, $2
	note C_3, 22, $2
	rest  0
	note A#4,  4, $2
	rest  0
	note A_4,  4, $2
	rest  0
	note F#4, 11, $4
	note F#4, 23, $4
	note F#4, 23, $4
	note F#4, 23, $4
	note F#4, 23, $2
	note F#4, 23, $2
	note F#4, 23, $2
	note F#4, 22, $2
	rest  0
	note D#4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note C_5, 11, $4
	note C_5, 23, $4
	note C_5, 23, $4
	note C_5, 23, $4
	note C_5, 23, $2
	note C_5, 23, $2
	note C_5, 23, $2
	note C_5, 22, $2
	rest  0
	note A_4, 23, $2
	note A_4,  9, $2
	rest  1
	note A_4,  4, $2
	rest  0
	note G_4,  4, $2
	rest  0
	note F#4, 23, $4
	note F#4, 23, $4
	note F#4, 23, $2
	note F#4, 23, $2
	note F#4, 23, $2
	note F#4, 22, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D#2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note G#2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	note D_2, 10, $2
	rest  0
	audio_jp Sound_fa2c6

Sound_fa3d3:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note D#1, 23, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	rest 23
	rest 23
	note D#1, 11, $1
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0, 11, $1
	audio_call Sound_fa43d
	audio_call Sound_fa43d
	audio_call Sound_fa43d
	note D#1, 23, $1
	note D#1, 23, $1
	note D#1, 23, $1
	audio_call Sound_fa46e
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note G#0, 11, $1
	note G#0, 11, $1
	audio_call Sound_fa446
	audio_call Sound_fa446
	audio_call Sound_fa446
	audio_call Sound_fa446
	audio_call Sound_fa465
	audio_call Sound_fa465
	audio_call Sound_fa465
	audio_call Sound_fa46e
	audio_jp Sound_fa3d3

Sound_fa43d:
	note D#1, 23, $1
	note D#1, 23, $1
	note D#1, 23, $1
	note D#1, 23, $1
	audio_ret

Sound_fa446:
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 11, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	audio_ret

Sound_fa465:
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	audio_ret

Sound_fa46e:
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	audio_ret

Sound_fa477:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note E_5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note E_5, 10, $1
	rest  0
	note E_5,  4, $3
	rest  0
	note E_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note E_5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note B_4,  4, $1
	rest  0
	note B_4,  4, $4
	rest  0
	note G_4, 16, $1
	rest  0
	note G_4,  4, $4
	rest  0
	note A_4,  4, $1
	rest  0
	note G_4,  4, $1
	rest  0
	note A_4, 11, $4
	note A_4, 23, $4
	note A_4, 23, $4
	note A_4, 10, $1
	rest  0
	note A_4,  4, $3
	rest  0
	note A_4,  4, $4
	rest  0
	note E_5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note E_5, 10, $1
	rest  0
	note E_5,  4, $3
	rest  0
	note E_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note E_5,  4, $1
	rest  0
	note G_5,  4, $1
	rest  0
	note F_5,  4, $1
	rest  0
	note G_5, 21, $1
	rest  1
	note G_5,  4, $3
	rest  0
	note G_5,  4, $4
	rest  0
	note E_5,  4, $1
	rest  0
	note D_5,  4, $1
	rest  0
	note E_5, 11, $4
	note E_5, 23, $4
	note E_5, 23, $4
	note E_5, 10, $1
	rest  0
	note E_5,  4, $3
	rest  0
	note E_5,  4, $4
	rest  0
	note D_5, 10, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note C#5, 10, $1
	rest  0
	note C#5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note A_5, 23, $1
	note A_5,  9, $1
	rest  1
	note A_5,  4, $3
	rest  0
	note A_5,  4, $4
	rest  0
	note G_5, 10, $1
	rest  0
	note G_5,  4, $4
	rest  0
	note F_5, 10, $1
	rest  0
	note F_5,  4, $4
	rest  0
	note D_5,  4, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note B_4, 23, $1
	note B_4,  9, $1
	rest  1
	note B_4,  4, $3
	rest  0
	note B_4,  4, $4
	rest  0
	note E_5, 10, $1
	rest  0
	note E_5,  4, $4
	rest  0
	note D_5, 10, $1
	rest  0
	note D_5,  4, $4
	rest  0
	note A_4, 23, $1
	note A_4, 21, $1
	rest  1
	note A_4,  4, $3
	rest  0
	note A_4,  4, $4
	rest  0
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 23, $1
	note G_4, 23, $1
	note G_4, 23, $1
	note G_4, 23, $1
	audio_jp Sound_fa477

Sound_fa5b0:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 23, $4
	note C_4, 23, $3
	note C_4, 21, $3
	rest  1
	note B_3, 23, $3
	note B_3, 21, $3
	rest  1
	note C_4, 23, $3
	note C_4, 21, $3
	rest  1
	note C_4, 21, $3
	rest  1
	note C_4, 21, $3
	rest  1
	note C_4, 23, $3
	note C_4, 21, $3
	rest  1
	note B_3, 10, $3
	rest  0
	note B_4, 10, $3
	rest  0
	note B_3, 10, $3
	rest  0
	note B_4, 10, $3
	rest  0
	note C_5, 23, $3
	note C_5, 21, $3
	rest  1
	note C_4, 23, $3
	note C_4, 21, $3
	rest  1
	note F#4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note F#4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note F#4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note F#4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note C_4,  4, $3
	rest  0
	note E_4,  4, $3
	rest  0
	note C_5,  4, $3
	rest  0
	note E_4,  4, $3
	rest  0
	note E_5,  4, $3
	rest  0
	note E_4,  4, $3
	rest  0
	note C_5,  4, $3
	rest  0
	note E_4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note B_3,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note B_3,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note B_3,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note G_4,  4, $3
	rest  0
	note D_4,  4, $3
	rest  0
	note D_5,  4, $3
	rest  0
	note G_5,  4, $3
	rest  0
	note F_5,  4, $3
	rest  0
	note E_5,  4, $3
	rest  0
	note D_5,  4, $3
	rest  0
	note E_5,  4, $3
	rest  0
	note F_5,  4, $3
	rest  0
	note C_5, 11, $1
	note C_5,  5, $4
	note A_4, 11, $1
	note A_4,  5, $4
	note C_4, 23, $1
	note C_4, 23, $1
	note C_4,  5, $3
	note C_4,  5, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $1
	note B_3, 23, $1
	note B_3, 23, $1
	note B_3, 23, $1
	audio_jp Sound_fa5b0

Sound_fa6b1:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note E_3, 23, $2
	note E_3, 23, $2
	rest 11
	note E_3, 11, $2
	rest 11
	note E_3,  5, $2
	rest  5
	note E_3, 23, $2
	note E_3, 23, $2
	rest 11
	note E_3, 11, $2
	rest 11
	note E_3,  5, $2
	rest  5
	note A_2, 23, $2
	note A_2, 23, $2
	note G_2, 23, $2
	note G_2, 23, $2
	note F#2, 23, $2
	note F#2, 23, $2
	rest 11
	note F#2, 11, $2
	rest 11
	note F#2,  5, $2
	rest  5
	note A_2, 23, $2
	note A_2, 23, $2
	note G_2, 23, $2
	note G_2, 23, $2
	note F_2, 23, $2
	note F_2, 23, $2
	rest 11
	note F_2, 11, $2
	rest 11
	note F_2,  5, $2
	rest  5
	note B_2, 11, $2
	note B_2, 11, $2
	note B_2, 11, $2
	note B_2, 11, $2
	note A_2, 11, $2
	note A_2, 11, $2
	note A_2, 11, $2
	note A_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note G_2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note F#2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	note E_2, 11, $2
	audio_jp Sound_fa6b1

Sound_fa753:
	audio_done

; unreferenced
Sound_fa754:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note D#1, 23, $1
	note D#1, 23, $1
	note D#1, 23, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	audio_jp Sound_fa753

Sound_fa76a:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_75
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	rest 23
	rest 23
	rest 23
	note A_3, 23, $1
	note F_4, 23, $1
	note F_4, 23, $1
	note F_4, 23, $1
	note E_4, 11, $1
	note G_4, 11, $4
	note G_4, 23, $1
	note G_4, 23, $1
	note G_4, 23, $1
	note E_4, 11, $1
	note F_4, 11, $4
	note F_4, 23, $1
	note F_4, 23, $1
	note F_4, 23, $1
	note E_4, 11, $1
	note G_4, 11, $4
	note G_4, 23, $1
	note G_4, 23, $1
	note G_4, 23, $1
	note E_4, 11, $1
	note F_4, 11, $4
	note F_4, 23, $1
	note F_4, 23, $1
	note F_4, 23, $1
	note E_4, 11, $1
	note G_4, 11, $4
	note G_4, 23, $1
	note G_4, 23, $1
	note G_4, 23, $1
	note E_4, 11, $1
	note F_4, 11, $4
	note F_4, 23, $4
	note F_4, 23, $4
	note F_4, 23, $4
	note F_4, 23, $4
	note F_4, 23, $1
	note F_4, 23, $1
	note F_4, 23, $1
	rest 23
	note G_5,  5, $1
	note G_5,  5, $4
	note F_5,  5, $1
	note F_5,  5, $4
	note D#5,  5, $1
	note D#5,  5, $4
	note G_5, 17, $1
	note G_5,  5, $4
	note F_5,  5, $1
	note F_5,  5, $4
	note D#5,  5, $1
	note D#5,  5, $4
	note G_5,  5, $1
	note G_5,  5, $4
	note F_5,  5, $1
	note F_5,  5, $4
	note E_5,  5, $1
	note E_5,  5, $4
	note D_5,  5, $1
	note D_5,  5, $4
	note A_4, 23, $1
	note A_4, 23, $1
	note A_4,  5, $3
	note A_4,  5, $4
	note D_5,  5, $1
	note D_5,  5, $4
	note C_5,  5, $1
	note C_5,  5, $4
	note A#4,  5, $1
	note A#4,  5, $4
	note D_5, 17, $1
	note D_5,  5, $4
	note C_5,  5, $1
	note C_5,  5, $4
	note A#4, 17, $1
	note A#4,  5, $4
	note E_5,  5, $1
	note E_5,  5, $4
	note D_5,  5, $1
	note D_5,  5, $4
	note C#5,  5, $1
	note C#5,  5, $4
	note A_4, 23, $1
	note A_4, 23, $1
	note A_4,  5, $3
	note A_4,  5, $4
	rest 23
	rest 23
	rest 23
	rest 23
	audio_jp Sound_fa76a

Sound_fa833:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note B_4,  5, $3
	note B_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note D#4,  5, $3
	note D#4,  5, $4
	note D#4,  5, $3
	note D#4,  5, $4
	note G_4,  5, $3
	note G_4,  5, $4
	note D#4,  5, $3
	note D#4,  5, $4
	note D#4,  5, $3
	note D#4,  5, $4
	note D#4,  5, $3
	note D#4,  5, $4
	note G_4,  5, $3
	note G_4,  5, $4
	note D#4,  5, $3
	note D#4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note A_4,  5, $3
	note A_4,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note F_5,  5, $3
	note F_5,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note A#3,  5, $3
	note A#3,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	note C#4,  5, $3
	note C#4,  5, $4
	audio_jp Sound_fa833

Sound_faa08:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note E_2,  5, $2
	note E_2,  5, $2
	note E_3,  5, $2
	note B_2,  5, $2
	note G_2,  5, $2
	note E_2,  5, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note E_2,  5, $2
	note E_2,  5, $2
	note E_3,  5, $2
	note B_2,  5, $2
	note G_2,  5, $2
	note E_2,  5, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note E_2,  5, $2
	note E_2,  5, $2
	note E_3,  5, $2
	note B_2,  5, $2
	note G_2,  5, $2
	note E_2,  5, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note E_2,  5, $2
	note E_2,  5, $2
	note E_3,  5, $2
	note B_2,  5, $2
	note G_2,  5, $2
	note E_2,  5, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note E_2,  5, $2
	note E_2,  5, $2
	note E_3,  5, $2
	note B_2,  5, $2
	note G_2,  5, $2
	note E_2,  5, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note E_2,  5, $2
	note E_2,  5, $2
	note E_3,  5, $2
	note B_2,  5, $2
	note G_2,  5, $2
	note E_2,  5, $2
	note G_2,  5, $2
	note B_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note D_2,  5, $2
	note D_2,  5, $2
	note D_3,  5, $2
	note A_2,  5, $2
	note F_2,  5, $2
	note D_2,  5, $2
	note F_2,  5, $2
	note A_2,  5, $2
	note C_3, 23, $2
	note C_3, 23, $2
	note C_3, 23, $2
	note C_3, 23, $2
	note D_3, 23, $2
	note D_3, 23, $2
	note D_3, 23, $2
	note D_3, 23, $2
	note E_3, 23, $2
	note E_3, 23, $2
	note E_3, 23, $2
	note E_3, 21, $2
	note A_2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A#2,  5, $2
	note A_2,  5, $2
	note A_2, 23, $2
	note A_2, 23, $2
	note A_2, 23, $2
	note A_2, 23, $2
	audio_jp Sound_faa08

Sound_fab71:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	pan PAN_LEFT | PAN_RIGHT
	note D#1, 11, $1
	note D#1, 11, $1
	note G#0, 23, $1
	note D#1,  5, $1
	note G#0, 11, $1
	note D#1,  5, $1
	note G#0, 17, $1
	note D#1,  5, $1
	audio_jp Sound_fab71

Sound_fab87:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	duty_cycle DUTY_75
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note B_3,  9, $4
	note B_3,  1, $7
	note B_3, 21, $4
	note B_3,  1, $7
	note B_3, 21, $4
	note B_3,  1, $7
	note B_3, 21, $4
	note B_3,  1, $7
	note B_3, 10, $4
	note B_3,  0, $7
	note B_3,  9, $3
	note B_3,  1, $6
	note B_3, 21, $3
	note B_3,  1, $6
	note B_3, 21, $2
	note B_3,  1, $7
	note B_3, 21, $2
	note B_3,  1, $7
	note B_3, 10, $2
	note B_3,  0, $7
	note E_4, 23, $1
	note E_4,  9, $1
	rest  1
	note F#4,  4, $1
	rest  0
	note G#4,  4, $1
	rest  0
	note B_4, 16, $1
	rest  0
	note B_4,  4, $4
	rest  0
	note G#5, 16, $1
	rest  0
	note G#5,  4, $4
	rest  0
	note F#5, 10, $1
	rest  0
	note F#5,  4, $4
	rest  0
	note E_5,  4, $1
	rest  0
	note D#5, 23, $1
	note D#5, 21, $1
	rest  1
	note D#5,  4, $3
	rest  0
	note D#5,  4, $4
	rest  0
	note C#5,  4, $1
	rest  0
	note D#5,  4, $1
	rest  0
	note E_5, 23, $1
	note E_5,  9, $1
	rest  1
	note D#5,  4, $1
	rest  0
	note C#5,  4, $1
	rest  0
	note B_4, 16, $1
	rest  0
	note B_4,  4, $4
	rest  0
	note G#4, 16, $1
	rest  0
	note G#4,  4, $4
	rest  0
	note C#5, 23, $1
	note C#5, 23, $1
	note C#5, 22, $1
	rest  0
	note C#4, 21, $1
	rest  1
	note E_4, 23, $1
	note E_4,  9, $1
	rest  1
	note F#4,  4, $1
	rest  0
	note G#4,  4, $1
	rest  0
	note B_4, 16, $1
	rest  0
	note B_4,  4, $4
	rest  0
	note G#5, 16, $1
	rest  0
	note G#5,  4, $4
	rest  0
	note B_5, 10, $1
	rest  0
	note F#5,  4, $4
	rest  0
	note E_5,  4, $1
	rest  0
	note D#5, 23, $1
	note D#5, 21, $1
	rest  1
	note D#5,  4, $3
	rest  0
	note D#5,  4, $4
	rest  0
	note C#5,  4, $1
	rest  0
	note D#5,  4, $1
	rest  0
	note E_5, 23, $1
	note E_5,  9, $1
	rest  1
	note D#5,  4, $1
	rest  0
	note E_5,  4, $1
	rest  0
	note B_5, 16, $1
	rest  0
	note B_5,  4, $4
	rest  0
	note G#5, 16, $1
	rest  0
	note G#5,  4, $4
	rest  0
	note C#6, 23, $4
	note C#6, 23, $4
	note C#6, 23, $4
	note C#6, 23, $4
	note C#6, 21, $1
	rest  1
	note C#4,  1, $1
	rest  0
	note D_4,  1, $1
	rest  0
	note D#4,  1, $1
	rest  0
	note E_4,  1, $1
	rest  0
	note F_4,  1, $1
	rest  0
	note F#4,  1, $1
	rest  0
	note G_4,  1, $1
	rest  0
	note G#4,  1, $1
	rest  0
	note A_4,  1, $1
	rest  0
	note A#4,  1, $1
	rest  0
	note B_4,  1, $1
	rest  0
	note C_5,  1, $1
	rest  0
	note C#5,  1, $1
	rest  0
	note D_5,  1, $1
	rest  0
	note D#5,  1, $1
	rest  0
	note E_5,  1, $1
	rest  0
	note F_5,  1, $1
	rest  0
	note F#5,  1, $1
	rest  0
	note G_5,  1, $1
	rest  0
	note G#5,  1, $1
	rest  0
	note A_5,  1, $1
	rest  0
	note A#5,  1, $1
	rest  0
	note B_5,  1, $1
	rest  0
	note C_6,  1, $1
	rest  0
	note G#5, 23, $1
	note G#5,  9, $1
	rest  1
	note F#5,  4, $1
	rest  0
	note G#5,  4, $1
	rest  0
	note B_5, 16, $1
	rest  0
	note B_5,  4, $4
	rest  0
	note D#5, 16, $1
	rest  0
	note D#5,  4, $4
	rest  0
	note E_5, 10, $1
	rest  0
	note E_5,  4, $4
	rest  0
	note D#5,  4, $1
	rest  0
	note C#5, 23, $4
	note C#5, 23, $4
	note C#5, 10, $1
	rest  0
	note C#5,  4, $3
	rest  0
	note C#5,  4, $4
	rest  0
	note B_4, 23, $1
	note B_4,  9, $1
	rest  1
	note B_4,  4, $1
	rest  0
	note C#5,  4, $1
	rest  0
	note A#4,  4, $1
	rest  0
	note A#4,  4, $4
	rest  0
	note B_4,  4, $1
	rest  0
	note B_4,  4, $4
	rest  0
	note C#5,  4, $1
	rest  0
	note C#5,  4, $4
	rest  0
	note A#4,  4, $1
	rest  0
	note A#4,  4, $4
	rest  0
	note B_4, 23, $1
	note B_4, 23, $1
	note B_4, 22, $1
	rest  0
	rest 11
	note B_4,  4, $1
	rest  0
	note B_4,  4, $1
	rest  0
	note G#5, 23, $1
	note G#5,  9, $1
	rest  1
	note F#5,  4, $1
	rest  0
	note G#5,  4, $1
	rest  0
	note B_5, 16, $1
	rest  0
	note B_5,  4, $4
	rest  0
	note D#5, 16, $1
	rest  0
	note D#5,  4, $4
	rest  0
	note E_5, 10, $1
	rest  0
	note E_5,  4, $4
	rest  0
	note C#5,  4, $1
	rest  0
	note G#5, 23, $4
	note G#5, 23, $4
	note G#5, 10, $1
	rest  0
	note G#5,  4, $3
	rest  0
	note G#5,  4, $4
	rest  0
	note F#5, 10, $1
	rest  0
	note F#5,  4, $4
	rest  0
	note E_5,  4, $1
	rest  0
	note D#5, 23, $4
	note D#5, 23, $4
	note D#5, 10, $1
	rest  0
	note D#5,  4, $3
	rest  0
	note D#5,  4, $4
	rest  0
	note E_5, 10, $1
	rest  0
	note E_5,  4, $4
	rest  0
	note D#5,  4, $1
	rest  0
	note C#5, 23, $4
	note C#5, 23, $4
	note C#5, 23, $4
	note C#5, 10, $1
	rest  0
	note C#5,  4, $3
	rest  0
	note C#5,  4, $4
	rest  0
	rest 23
	rest 23
	rest 23
	audio_jp Sound_fab87

Sound_fadee:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note G#3,  9, $4
	note G#3,  1, $7
	note G#3, 21, $4
	note G#3,  1, $7
	note G#3, 21, $4
	note G#3,  1, $7
	note G#3, 21, $4
	note G#3,  1, $7
	note G#3, 10, $4
	note G#3,  0, $7
	note G#3,  9, $3
	note G#3,  1, $7
	note G#3, 21, $3
	note G#3,  1, $7
	note G#3, 21, $2
	note G#3,  1, $7
	note G#3, 21, $2
	note G#3,  1, $7
	note G#3, 10, $2
	note G#3,  0, $7
	audio_call Sound_fafe1
	audio_call Sound_fb074
	audio_call Sound_fafe1
	note E_6, 10, $2
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6, 10, $2
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6, 10, $2
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6, 10, $2
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	audio_call Sound_fb074
	note B_3,  4, $2
	note B_3,  0, $7
	note B_3,  4, $2
	note B_3,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note B_4,  4, $2
	note B_4,  0, $7
	note B_4,  4, $2
	note B_4,  0, $7
	note F#5,  4, $2
	note F#5,  0, $7
	note E_5,  4, $2
	note E_5,  0, $7
	note D#5,  4, $2
	note D#5,  0, $7
	note E_5,  4, $2
	note E_5,  0, $7
	note F#5, 21, $2
	note F#5,  1, $7
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $2
	note G#5,  0, $7
	note A_5,  4, $2
	note A_5,  0, $7
	note B_5,  4, $2
	note B_5,  0, $7
	note C#6,  4, $2
	note C#6,  0, $7
	note G#5, 23, $2
	note G#5,  9, $2
	note G#5,  1, $7
	note G#5,  4, $2
	note G#5,  0, $7
	note A#5,  4, $2
	note A#5,  0, $7
	note C#6, 10, $2
	note C#6,  0, $7
	note C#6,  4, $4
	note C#6,  0, $7
	note C#6,  4, $4
	note C#6,  0, $7
	note A#4,  4, $2
	note A#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note F#4,  4, $2
	note F#4,  0, $7
	note F_4,  4, $2
	note F_4,  0, $7
	note D#4,  4, $2
	note D#4,  0, $7
	note D#4,  4, $2
	note D#4,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note F#4,  4, $2
	note F#4,  0, $7
	note F#4,  4, $2
	note F#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note D#5,  4, $2
	note D#5,  0, $7
	note D#5,  4, $2
	note D#5,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note F#4,  4, $2
	note F#4,  0, $7
	note F#4,  4, $2
	note F#4,  0, $7
	note D#4,  4, $2
	note D#4,  0, $7
	note D#4,  4, $2
	note D#4,  0, $7
	note B_3,  4, $2
	note B_3,  0, $7
	note B_3,  4, $2
	note B_3,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note B_4,  4, $2
	note B_4,  0, $7
	note B_4,  4, $2
	note B_4,  0, $7
	note F#5,  4, $2
	note F#5,  0, $7
	note E_5,  4, $2
	note E_5,  0, $7
	note D#5,  4, $2
	note D#5,  0, $7
	note E_5,  4, $2
	note E_5,  0, $7
	note F#5, 21, $2
	note F#5,  1, $7
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note E_6, 10, $2
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note E_6,  4, $4
	note E_6,  0, $7
	note C#6, 10, $2
	note C#6,  0, $7
	note C#6,  4, $4
	note C#6,  0, $7
	note C#6,  4, $4
	note C#6,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note F#4,  4, $2
	note F#4,  0, $7
	note G#4,  4, $2
	note G#4,  0, $7
	note C#5,  4, $2
	note C#5,  0, $7
	note D#5, 10, $1
	note D#5,  0, $7
	note D#5,  4, $4
	note D#5,  0, $7
	note C#5,  4, $1
	note C#5,  0, $7
	note F#4, 23, $4
	note F#4, 23, $4
	note F#4, 10, $1
	note F#4,  0, $7
	note F#4,  4, $3
	note F#4,  0, $7
	note F#4,  4, $4
	note F#4,  0, $7
	note C#5, 10, $1
	note C#5,  0, $7
	note C#5,  4, $4
	note C#5,  0, $7
	note B_4,  4, $1
	note B_4,  0, $7
	note E_4, 23, $4
	note E_4, 23, $4
	note E_4, 23, $4
	note E_4, 10, $1
	note E_4,  0, $7
	note E_4,  4, $3
	note E_4,  0, $7
	note E_4,  4, $4
	note E_4,  0, $7
	rest 23
	rest 23
	rest 23
	audio_jp Sound_fadee

Sound_fafe1:
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5, 10, $2
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note G#5,  4, $4
	note G#5,  0, $7
	note E_4,  4, $2
	note E_4,  0, $7
	note D#4,  4, $2
	note D#4,  0, $7
	note C#4,  4, $2
	note C#4,  0, $7
	note D#4,  4, $2
	note D#4,  0, $7
	note B_3, 23, $2
	note B_3, 21, $4
	note B_3,  1, $7
	note C#4, 10, $2
	note C#4,  0, $7
	note D#4, 10, $2
	note D#4,  0, $7
	note E_5,  1, $2
	note E_5,  0, $7
	note F#5,  1, $2
	note F#5,  0, $7
	note G#5,  1, $2
	note G#5,  0, $7
	note A_5,  1, $2
	note A_5,  0, $7
	note B_5,  1, $2
	note B_5,  0, $7
	note C#6,  1, $2
	note C#6,  0, $7
	note D#6,  1, $2
	note D#5,  0, $7
	note E_6,  1, $2
	note E_6,  0, $7
	note G#6, 10, $2
	note G#6,  0, $7
	note G#6,  4, $4
	note G#6,  0, $7
	note G#6,  4, $4
	note G#6,  0, $7
	note G#6, 10, $2
	note G#6,  0, $7
	note G#6,  4, $4
	note G#6,  0, $7
	note G#6,  4, $4
	note G#6,  0, $7
	note D#6, 10, $2
	note G#6,  0, $7
	note D#6,  4, $4
	note D#6,  0, $7
	note D#6,  4, $4
	note D#6,  0, $7
	note D#6, 10, $2
	note D#6,  0, $7
	note D#6,  4, $4
	note D#6,  0, $7
	note D#6,  4, $4
	note D#6,  0, $7
	audio_ret

Sound_fb074:
	note E_6, 10, $2
	rest  0
	note E_6,  4, $4
	rest  0
	note E_6,  4, $4
	rest  0
	note E_6, 10, $2
	rest  0
	note E_6,  4, $4
	rest  0
	note E_6,  4, $4
	rest  0
	note E_6,  4, $2
	rest  0
	note E_6,  4, $4
	rest  0
	note E_6,  4, $2
	rest  0
	note E_6,  4, $4
	rest  0
	note A_4,  4, $2
	rest  0
	note G#4,  4, $2
	rest  0
	note F#4,  4, $2
	rest  0
	note E_4,  4, $2
	rest  0
	audio_ret

Sound_fb0ad:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	base_note C_0
	pan PAN_LEFT | PAN_RIGHT
	audio_call Sound_fb11e
	audio_call Sound_fb11e
	audio_call Sound_fb11e
	audio_call Sound_fb127
	audio_call Sound_fb138
	audio_call Sound_fb141
	audio_call Sound_fb11e
	audio_call Sound_fb127
	audio_call Sound_fb138
	audio_call Sound_fb141
	audio_call Sound_fb141
	note E_2, 23, $2
	note E_2, 23, $2
	note D#2, 23, $2
	note D#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note E_2, 23, $2
	note E_2, 23, $2
	note A#1, 23, $2
	note A#1, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	note E_2, 23, $2
	note E_2, 23, $2
	note D#2, 23, $2
	note D#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	audio_jp Sound_fb0ad

Sound_fb11e:
	note E_2, 23, $2
	note E_2, 23, $2
	note E_2, 23, $2
	note E_2, 23, $2
	audio_ret

Sound_fb127:
	note D#2, 23, $2
	note D#2, 23, $2
	note D#2, 23, $2
	note D#2, 23, $2
	note C#2, 23, $2
	note C#2, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	audio_ret

Sound_fb138:
	note C#2, 23, $2
	note C#2, 23, $2
	note B_1, 23, $2
	note B_1, 23, $2
	audio_ret

Sound_fb141:
	note A_1, 23, $2
	note A_1, 23, $2
	note A_1, 23, $2
	note A_1, 23, $2
	audio_ret

Sound_fb14a:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_call Sound_fb157
	audio_jp Sound_fb14a

Sound_fb157:
	note D#1, 11, $1
	note G#0, 11, $1
	audio_ret

Sound_fb15c:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	note E_4, 21, $1
	rest  1
	note D#4, 23, $1
	note D#4, 21, $1
	rest  1
	note E_4,  6, $1
	rest  0
	note D#4,  6, $1
	rest  0
	note E_4,  6, $1
	rest  0
	note D#4, 21, $1
	rest  1
	note E_4, 23, $1
	note E_4, 23, $1
	note E_4, 22, $1
	rest  0
	rest 23
	note B_5,  1, $1
	rest  0
	note A#5,  1, $1
	rest  0
	note A_5,  1, $1
	rest  0
	note B_5,  1, $3
	rest  0
	note A#5,  1, $3
	rest  0
	note A_5,  1, $3
	rest  0
	note B_5,  1, $4
	rest  0
	note A#5,  1, $4
	rest  0
	note A_5,  1, $4
	rest  0
	note B_5,  1, $6
	rest  0
	note A#5,  1, $6
	rest  0
	note A_5,  1, $6
	rest  0
	rest 23
	rest 11
	rest 23
	rest 23
	rest 23
	rest 23
	rest 23
	note B_4,  1, $1
	rest  0
	note A#4,  1, $1
	rest  0
	note A_4,  1, $1
	rest  0
	note B_4,  1, $3
	rest  0
	note A#4,  1, $3
	rest  0
	note A_4,  1, $3
	rest  0
	note B_4,  1, $4
	rest  0
	note A#4,  1, $4
	rest  0
	note A_4,  1, $4
	rest  0
	note B_4,  1, $6
	rest  0
	note A#4,  1, $6
	rest  0
	note A_4,  1, $6
	rest  0
	rest 23
	rest 11
	rest 23
	rest 23
	rest 23
	rest 23
	audio_jp Sound_fb15c

Sound_fb211:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note C_4, 21, $1
	rest  1
	note B_3, 23, $1
	note B_3, 21, $1
	rest  1
	note C_4,  6, $1
	rest  0
	note B_3,  6, $1
	rest  0
	note C_4,  6, $1
	rest  0
	note B_3, 21, $1
	rest  1
	note C_4, 23, $1
	note C_4, 23, $1
	note C_4, 22, $1
	rest  0
	audio_call Sound_fb254
	audio_call Sound_fb254
	audio_call Sound_fb254
	audio_call Sound_fb254
	audio_jp Sound_fb211

Sound_fb254:
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	note B_2,  1, $1
	rest  0
	note B_2,  1, $4
	rest  0
	audio_ret

Sound_fb2d5:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note A_2, 23, $1
	note G#2, 23, $1
	note G#2, 23, $1
	note A_2,  7, $1
	note G#2,  7, $1
	note A_2,  7, $1
	note G#2, 23, $1
	note A_2, 23, $1
	note A_2, 23, $1
	note A_2, 23, $1
	note E_4, 23, $1
	note E_4, 23, $1
	note B_4, 23, $1
	note B_4, 23, $1
	rest 23
	note E_4, 23, $1
	note B_4, 23, $1
	note B_4, 23, $1
	note A#4, 23, $4
	note A#4, 23, $4
	note A#4, 23, $4
	note A#4, 23, $4
	note A#4, 23, $1
	note A#4, 23, $1
	note A#4, 23, $1
	note A#4, 23, $1
	audio_jp Sound_fb2d5

Sound_fb31e:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note D#1, 11, $1
	note D#1,  5, $1
	note D#1,  5, $1
	audio_jp Sound_fb31e

Sound_fb32e:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	rest 23
	note D#4, 11, $2
	note D_4, 23, $2
	note D_4, 11, $2
	note D#4, 11, $2
	note G_4, 11, $4
	note G_4, 23, $2
	note G_4, 23, $2
	note F#4, 23, $2
	note F#4, 23, $2
	rest 23
	note D#4, 11, $2
	note D_4, 23, $2
	note D_4, 11, $2
	note D#4, 11, $2
	note G_4, 11, $4
	note G_4, 23, $2
	note G_4, 23, $2
	note G_4, 23, $2
	note G_4, 23, $2
	audio_call Sound_fb3d9
	audio_call Sound_fb3d9
	note G_4,  2, $2
	note C_5,  2, $2
	note G_5, 17, $4
	note G_5, 23, $2
	note G_5, 23, $2
	note G_5, 23, $2
	note F#5,  2, $2
	note G_5,  2, $2
	note C_6, 17, $4
	note C_6, 23, $2
	note C_6, 23, $2
	note C_6, 23, $2
	note G_5,  2, $2
	note C_6,  2, $2
	note D#6, 17, $4
	note D#6, 23, $2
	note D#6, 23, $2
	note D#6, 23, $2
	note C_6,  2, $2
	note D#6,  2, $2
	note G_6, 17, $4
	note G_6, 23, $2
	note G_6, 23, $2
	note G_6, 23, $2
	audio_call Sound_fb3d9
	audio_call Sound_fb3d9
	note G_4,  2, $2
	note C_5,  2, $2
	note G_5, 17, $4
	note G_5, 23, $2
	note G_5, 23, $2
	note G_5, 23, $2
	note F#5,  2, $2
	note G_5,  2, $2
	note C_6, 17, $4
	note C_6, 23, $2
	note C_6, 23, $2
	note C_6, 23, $2
	note G_5,  2, $2
	note C_6,  2, $2
	note D#6, 17, $4
	note D#6, 23, $2
	note D#6, 23, $2
	note D#6, 23, $2
	note C_6,  2, $2
	note D#6,  2, $2
	note G_6, 17, $4
	note G_6, 23, $2
	note G_6, 23, $2
	note G_6, 23, $2
	audio_jp Sound_fb32e

Sound_fb3d9:
	note D_6, 23, $4
	note D_6, 11, $4
	note D_6,  5, $2
	note D_6,  5, $4
	note C#6, 23, $4
	note C#6, 11, $4
	note C#6,  5, $2
	note C#6,  5, $4
	rest 23
	note D_6, 17, $2
	note D_6,  5, $4
	note C#6, 23, $4
	note C#6, 11, $4
	note C#6,  5, $2
	note C#6,  5, $4
	audio_ret

Sound_fb3f8:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_call Sound_fb437
	audio_call Sound_fb437
	audio_call Sound_fb437
	audio_call Sound_fb437
	audio_call Sound_fb491
	audio_call Sound_fb491
	audio_call Sound_fb458
	audio_call Sound_fb458
	audio_call Sound_fb458
	audio_call Sound_fb458
	audio_call Sound_fb491
	audio_call Sound_fb491
	audio_call Sound_fb458
	audio_call Sound_fb458
	audio_call Sound_fb458
	audio_call Sound_fb458
	audio_jp Sound_fb3f8

Sound_fb437:
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	note C_3,  5, $1
	note C_3,  5, $4
	audio_ret

Sound_fb458:
	note G_4,  3, $2
	note D#4,  3, $2
	note D_4,  3, $2
	note D#4,  2, $2
	rest  2
	note C_4,  2, $2
	rest  2
	note G_4,  3, $2
	note D#4,  3, $2
	note D_4,  3, $2
	note D#4,  2, $2
	rest  2
	note C_4,  2, $2
	rest  2
	note G_4,  3, $2
	note D#4,  3, $2
	note D_4,  3, $2
	note D#4,  2, $2
	rest  2
	note C_4,  2, $2
	rest  2
	note G_4,  3, $2
	note D#4,  3, $2
	note D_4,  3, $2
	note D#4,  1, $2
	rest  2
	note C_4,  2, $2
	rest  2
	audio_ret

Sound_fb491:
	note B_5, 23, $4
	note B_5, 11, $4
	note B_5,  5, $2
	note B_5,  5, $4
	note A#5, 23, $4
	note A#5, 11, $4
	note A#5,  5, $2
	note A#5,  5, $4
	rest 23
	note B_5, 17, $2
	note B_5,  5, $4
	note A#5, 23, $4
	note A#5, 11, $4
	note A#5,  5, $2
	note A#5,  5, $4
	audio_ret

Sound_fb4b0:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	rest 23
	note G_4, 11, $2
	note F#4, 23, $2
	note F#4, 11, $2
	note G_4, 11, $2
	note A#4, 11, $4
	note A#4, 23, $2
	note A#4, 23, $2
	note A_4, 23, $2
	note A_4, 23, $2
	rest 23
	note G_4, 11, $2
	note F#4, 23, $2
	note F#4, 11, $2
	note G_4, 11, $2
	note A#4, 11, $4
	note A#4, 23, $2
	note A#4, 23, $2
	note A#4, 23, $2
	note A#4, 23, $2
	audio_call Sound_fb4f2
	audio_call Sound_fb4f2
	audio_call Sound_fb501
	audio_call Sound_fb501
	audio_call Sound_fb501
	audio_call Sound_fb501
	audio_jp Sound_fb4b0

Sound_fb4f2:
	note A_2, 23, $2
	note A_2, 23, $2
	note A_2, 23, $2
	note A_2,  5, $2
	note E_3,  5, $2
	note A_3,  5, $2
	note E_3,  5, $2
	audio_ret

Sound_fb501:
	note C_2,  5, $2
	note G_2,  5, $2
	note D#3,  5, $2
	note C_3,  5, $2
	note G_2,  5, $2
	note D#2,  5, $2
	note C_2,  5, $2
	note D_2,  5, $2
	note C_2,  5, $2
	note G_2,  5, $2
	note D#3,  5, $2
	note C_3,  5, $2
	note G_2,  5, $2
	note D#2,  5, $2
	note C_2,  5, $2
	note D_2,  5, $2
	audio_ret

Sound_fb522:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_call Sound_fb53b
	audio_call Sound_fb53b
	audio_call Sound_fb53b
	note G#0, 11, $1
	note D_0,  5, $1
	note D_0,  5, $1
	audio_jp Sound_fb522

Sound_fb53b:
	note D_0, 11, $1
	note D_0,  5, $1
	note D_0,  5, $1
	audio_ret

Sound_fb542:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_RIGHT
	audio_unkf9 $04
	note D_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note D_6,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note B_5,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note B_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note D_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note D_6,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note B_5,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note B_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note D_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note D_6,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note B_5,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note B_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note E_5,  5, $1
	rest  5
	note G_5,  5, $1
	rest  5
	note C_6,  5, $1
	rest  5
	note B_5, 23, $1
	note B_5, 11, $1
	note A_5, 11, $4
	note A_5, 23, $4
	note A_5, 23, $4
	note A_5, 23, $1
	note A_5, 23, $1
	note A_5, 23, $1
	note A_5, 23, $1
	audio_jp Sound_fb542

Sound_fb621:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_75
	base_note -C_2
	pan PAN_LEFT
	rest  5
	rest  2
	note D_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note D_6,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note B_5,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note B_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note D_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note D_6,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note B_5,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note B_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note D_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note D_6,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note B_5,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note B_5,  5, $3
	rest  5
	note C_6,  5, $3
	rest  5
	note E_5,  5, $3
	rest  5
	note G_5,  5, $3
	rest  5
	note C_6,  2, $3
	note C_5, 23, $3
	note C_5, 23, $3
	note C_5, 23, $3
	note C_5, 23, $3
	note F_5,  5, $2
	note F_5,  5, $4
	note C_5,  5, $2
	note C_5,  5, $4
	note A_4,  5, $2
	note A_4,  5, $4
	note F_4,  5, $2
	note F_4,  5, $4
	note C_4,  5, $2
	note C_4,  5, $4
	note F_4,  5, $2
	note F_4,  5, $4
	note A_4,  5, $2
	note A_4,  5, $4
	note C_5,  5, $2
	note C_5,  5, $4
	audio_jp Sound_fb621

Sound_fb718:
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	audio_call Sound_fb753
	audio_call Sound_fb753
	audio_call Sound_fb74a
	audio_call Sound_fb74a
	audio_call Sound_fb741
	audio_call Sound_fb741
	audio_call Sound_fb738
	audio_call Sound_fb738
	audio_jp Sound_fb718

Sound_fb738:
	note F_3, 23, $4
	note F_3, 23, $4
	note F_3, 23, $4
	note F_3, 23, $4
	audio_ret

Sound_fb741:
	note A_3, 23, $4
	note A_3, 23, $4
	note A_3, 23, $4
	note A_3, 23, $4
	audio_ret

Sound_fb74a:
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	note B_3, 23, $4
	audio_ret

Sound_fb753:
	note C_4, 23, $4
	note C_4, 23, $4
	note C_4, 23, $4
	note C_4, 23, $4
	audio_ret

; unreferenced
Sound_fb75c:
	rest 23
	audio_jp Sound_fb75c

Sound_fb761:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	rest  5
	rest  2
	note F#4,  5, $3
	note G#4,  5, $3
	note A#4,  5, $3
	note C#5,  5, $3
	note F#5,  5, $3
	note G#5,  5, $3
	note A#5,  5, $3
	note G#5,  5, $3
	note F#5,  5, $3
	note C#5,  5, $3
	note A#4,  5, $3
	note G#4,  5, $3
	note F#4,  5, $3
	note G#4,  5, $3
	note A#4,  5, $3
	note F#5,  5, $1
	note G#5,  5, $1
	note A#5,  5, $1
	note G#5,  5, $1
	note F#5,  5, $1
	note C#5,  5, $1
	note A#4,  5, $1
	note C#5,  5, $1
	note F#4,  2, $1
	note G#4,  2, $1
	note A#4,  2, $1
	note B_4,  2, $1
	note C#5,  2, $1
	note D_5,  2, $1
	note E_5,  2, $1
	note F#5,  2, $1
	note G#5,  2, $1
	note A#5,  2, $1
	note B_5,  2, $1
	note C#6,  2, $1
	note D_6,  2, $1
	note E_6,  2, $1
	note F#6,  2, $1
	note G#6,  2, $1
	note F#6, 23, $1
	note F#6, 23, $1
	note F#6, 23, $1
	note F#6, 23, $1
	audio_done

Sound_fb7c6:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note F#4,  5, $1
	note G#4,  5, $1
	note A#4,  5, $1
	note C#5,  5, $1
	note F#5,  5, $1
	note G#5,  5, $1
	note A#5,  5, $1
	note G#5,  5, $1
	note F#5,  5, $1
	note C#5,  5, $1
	note A#4,  5, $1
	note G#4,  5, $1
	note F#4,  5, $1
	note G#4,  5, $1
	note A#4,  5, $1
	note C#5,  5, $1
	rest  6
	note F#5,  5, $3
	note G#5,  5, $3
	note A#5,  5, $3
	note G#5,  5, $3
	note F#5,  5, $3
	note C#5,  5, $3
	note A#4,  5, $3
	note C#5,  5, $3
	note F#4,  2, $3
	note G#4,  2, $3
	note A#4,  2, $3
	note B_4,  2, $3
	note C#5,  2, $3
	note D_5,  2, $3
	note E_5,  2, $3
	note F#5,  2, $3
	note G#5,  2, $3
	note A#5,  2, $3
	note B_5,  2, $3
	note C#6,  2, $3
	note D_6,  2, $3
	note E_6,  1, $3
	note A#5, 23, $3
	note A#5, 23, $3
	note A#5, 23, $3
	note A#5, 23, $3
	audio_done

Sound_fb825:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	note F#2, 23, $2
	note F#2, 23, $2
	note F#2, 23, $2
	note F#2, 23, $2
	note F#3, 11, $2
	rest 11
	note F#3,  5, $2
	note F#3,  5, $2
	note F#3,  5, $2
	note F#3,  5, $2
	note F#3,  5, $2
	note F#3,  5, $2
	note F#3,  5, $2
	rest  5
	rest 11
	note C#3,  5, $2
	note C#3,  5, $2
	note F#2, 23, $2
	note F#2, 23, $2
	note F#2, 23, $2
	note F#2, 23, $2
	audio_done

Sound_fb856:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0, 23, $1
	audio_done

Sound_fb88e:
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note G_3,  2, $1
	rest  2
	note D_4,  2, $1
	rest  2
	note F_4,  2, $1
	rest  2
	note E_4,  2, $1
	rest  2
	note C_4,  2, $1
	rest  2
	note A_3,  2, $1
	rest  2
	note F_3,  2, $1
	rest  8
	note A_3,  2, $1
	rest  8
	note G_4,  2, $1
	rest  2
	note D_5,  2, $1
	rest  2
	note F_5,  2, $1
	rest  2
	note E_5,  2, $1
	rest  2
	note C_5,  2, $1
	rest  2
	note A_4,  2, $1
	rest  2
	note F_4,  2, $1
	rest  8
	note A_4,  2, $1
	rest  8
	note G_3,  5, $3
	rest  5
	note G_3,  2, $3
	rest  2
	note G_3,  2, $3
	rest  2
	note G_3, 23, $3
	note G_3, 23, $3
	audio_done

Sound_fb8e9:
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	rest  5
	note G_3,  2, $3
	rest  2
	note D_4,  2, $3
	rest  2
	note F_4,  2, $3
	rest  2
	note E_4,  2, $3
	rest  2
	note C_4,  2, $3
	rest  2
	note A_3,  2, $3
	rest  2
	note F_3,  2, $3
	rest  8
	note A_3,  2, $3
	rest  8
	note G_4,  2, $3
	rest  2
	note D_5,  2, $3
	rest  2
	note F_5,  2, $3
	rest  2
	note E_5,  2, $3
	rest  2
	note C_5,  2, $3
	rest  2
	note A_4,  2, $3
	rest  2
	note F_4,  2, $3
	rest  8
	note A_4,  2, $3
	rest  2
	note A#2,  5, $3
	rest  5
	note A#2,  2, $3
	rest  2
	note A#2,  2, $3
	rest  2
	note A#2, 23, $3
	note A#2, 23, $3
	audio_done

Sound_fb942:
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note G_3, 23, $4
	note G_3, 23, $4
	note G_3, 11, $4
	note G_3, 23, $2
	note G_3, 23, $2
	note G_3, 11, $2
	note G_2, 23, $2
	note G_2, 23, $2
	note G_2, 23, $2
	audio_done

Sound_fb95d:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_call Sound_fb973
	audio_call Sound_fb973
	note G#0, 11, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 23, $1
	note G#0, 23, $1
	audio_done

Sound_fb973:
	rest 23
	rest 23
	rest 11
	audio_ret

Sound_fb97a:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	note C_4,  5, $0
	note C#4,  5, $0
	note C#4,  5, $0
	note C_4,  5, $0
	note C#4,  5, $0
	note D_4,  5, $0
	note D#4,  5, $0
	rest  5
	note E_4,  5, $0
	note F_4, 11, $0
	rest  5
	note A_4,  6, $0
	rest  0
	note A_4,  6, $0
	note A_4,  6, $0
	rest  1
	note A#4, 23, $0
	rest 23
	rest 23
	rest 23
	audio_done

Sound_fb9b7:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $02
	note A#4, 17, $0
	note D#3, 17, $0
	note F#3, 17, $0
	note D_4, 17, $0
	note F_4,  6, $0
	note F_4,  6, $0
	note F_4,  6, $0
	rest  0
	note F_4, 23, $0
	rest 23
	rest 23
	rest 23
	audio_done

Sound_fb9e4:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	note D_5, 23, $0
	rest 23
	rest 23
	rest 23
	note D_5, 23, $0
	audio_done

Sound_fba03:
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	note G#0, 11, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0, 11, $1
	note G#0,  5, $1
	note G#0,  5, $1
	audio_done

Sound_fba1b:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_75
	base_note -C_2
	pan PAN_RIGHT
	audio_unkf9 $04
	note C_4,  5, $0
	rest  4
	note E_4,  5, $0
	note G_4,  5, $0
	note E_4,  5, $0
	note D_4,  5, $0
	rest  5
	note F#4,  5, $0
	note A_4,  5, $0
	note F#4,  5, $0
	note E_4,  5, $0
	rest  5
	note G#4,  5, $0
	note B_4,  5, $0
	note G#4,  5, $0
	note E_5,  5, $0
	rest  5
	note E_5,  5, $0
	note E_5, 11, $0
	rest 23
	rest 23
	rest 23
	audio_done

Sound_fba5c:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT
	audio_unkf9 $04
	note C#5,  5, $3
	note C_3,  5, $0
	rest  4
	note E_3,  5, $0
	note G_3,  5, $0
	note E_3,  5, $0
	note D_3,  5, $0
	rest  5
	note F#3,  5, $0
	note E_3,  5, $0
	note F#3,  5, $0
	note E_3,  5, $0
	rest  5
	note G#3,  5, $0
	note B_3,  5, $0
	note G#3,  5, $0
	note E_4,  5, $0
	rest  5
	note E_4,  5, $0
	note E_4, 11, $0
	rest 23
	rest 23
	rest 23
	audio_done

Sound_fba9f:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note C_3,  5, $0
	note C#3,  5, $0
	note C#3, 11, $0
	note G_3, 23, $0
	rest 11
	note E_3, 23, $0
	rest  5
	note A_3,  5, $0
	rest  5
	note A_3,  5, $0
	note A_3, 11, $0
	rest 23
	rest 23
	rest 23
	audio_done

Sound_fbacf:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	audio_call Sound_fbade
	audio_jp Sound_fbacf

Sound_fbade:
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 11, $1
	note G#0, 11, $1
	audio_done

Sound_fbaf5:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_50
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note G_5, 23, $0
	rest  5
	note G_5,  2, $0
	rest  2
	note G_5,  4, $0
	rest  6
	note G_5, 23, $0
	note G_5,  1, $0
	rest  9
	note G_5,  3, $0
	rest  7
	note F#5, 23, $0
	note F#5,  4, $0
	rest  6
	note F#5,  3, $0
	rest  7
	note D_5, 23, $0
	note G_4, 17, $0
	rest  5
	note G_5, 23, $0
	note G_5,  3, $0
	rest  1
	note G_5,  2, $0
	rest  2
	note G_5,  3, $0
	rest  7
	note A_5, 23, $0
	note A_5,  0, $0
	rest  4
	note A_5,  2, $0
	rest  2
	note A_5,  1, $0
	rest  9
	note B_5, 23, $0
	note B_5,  4, $0
	rest  6
	note B_5,  3, $0
	rest  7
	note G_5, 23, $0
	note G_5,  5, $0
	rest 17
	note G_5,  5, $0
	rest  5
	note G_5,  4, $0
	rest  6
	note G_5,  3, $0
	rest  7
	note G_5,  3, $0
	rest  7
	note F#5,  3, $0
	rest  7
	note F#5,  3, $0
	rest  7
	note F#5,  3, $0
	rest  7
	note F#5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note E_5,  2, $0
	rest  8
	note E_5,  3, $0
	rest  7
	note E_5,  2, $0
	rest  8
	note E_5,  3, $0
	rest  7
	note D_5,  4, $0
	rest  6
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  2, $0
	rest  8
	note D_5,  2, $0
	rest  8
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	note D_5,  3, $0
	rest  7
	audio_jp Sound_fbaf5

Sound_fbbde:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	def_envelope $6,  2, AUD1ENV_DOWN, 6
	def_envelope $7, 10, AUD1ENV_DOWN, 0
	duty_cycle DUTY_75
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note E_5, 23, $0
	note E_5,  1, $0
	rest  3
	note E_5,  1, $0
	rest  3
	note E_5,  1, $0
	rest  9
	note E_5, 23, $0
	note E_5,  2, $0
	rest  8
	note E_5,  3, $0
	rest  7
	note D_5, 23, $0
	note D_5,  4, $0
	rest  6
	note D_5,  3, $0
	rest  7
	note B_4, 23, $0
	note B_4,  4, $0
	rest 18
	note E_5, 23, $0
	note E_5,  3, $0
	rest  7
	note E_5,  1, $0
	rest  3
	note E_5,  2, $0
	rest  2
	note F#5, 23, $0
	rest 11
	note F#5,  1, $0
	rest  9
	note G_5, 23, $0
	note G_5,  4, $0
	rest  6
	note G_5,  3, $0
	rest  7
	note E_5, 23, $0
	note E_5,  6, $0
	rest 16
	note E_5,  3, $0
	rest  7
	note E_5,  3, $0
	rest  7
	note E_5,  3, $0
	rest  7
	note E_5,  3, $0
	rest  7
	note D_5,  4, $0
	rest  6
	note D_5,  3, $0
	rest  7
	note D_5,  2, $0
	rest  8
	note D_5,  3, $0
	rest  7
	note B_4,  4, $0
	rest  6
	note B_4,  2, $0
	rest  8
	note B_4,  3, $0
	rest  7
	note B_4,  3, $0
	rest  7
	note C_5,  4, $0
	rest  6
	note C_5,  3, $0
	rest  7
	note C_5,  2, $0
	rest  8
	note C_5,  4, $0
	rest  6
	note C_6, 23, $0
	note C_6, 23, $0
	note B_5, 23, $0
	note B_5, 23, $0
	note G_5, 23, $0
	note G_5, 21, $0
	rest  1
	note A_5, 23, $0
	note A_5, 16, $0
	rest  6
	audio_jp Sound_fbbde

Sound_fbc97:
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note C_3, 23, $0
	note G_2, 11, $0
	note B_2, 11, $0
	rest 11
	note A_2, 11, $0
	rest 11
	note F#2, 11, $0
	note D_3,  5, $0
	rest  5
	note D_3,  5, $0
	rest  5
	note F#3,  5, $0
	rest  5
	note F#3,  5, $0
	rest  5
	note A_3,  5, $0
	note B_3,  5, $0
	note C_4,  5, $0
	note D_4,  5, $0
	note G_4,  5, $0
	rest 17
	note C_3, 11, $0
	note C_3, 11, $0
	rest 11
	note C_3, 11, $0
	note D_3, 11, $0
	note D_3, 11, $0
	rest 11
	note D_3, 11, $0
	note B_3,  2, $0
	rest  2
	note B_3,  2, $0
	rest  2
	note G_3,  2, $0
	rest  2
	note G_3,  2, $0
	rest  2
	note B_3,  2, $0
	rest  2
	note B_3,  2, $0
	rest  2
	note G_3,  2, $0
	rest  2
	note G_3,  2, $0
	rest  2
	note B_4,  2, $0
	rest  2
	note A_4,  2, $0
	rest  2
	note G_4,  2, $0
	rest  2
	note F#4,  2, $0
	rest  2
	note E_4,  2, $0
	rest  2
	note F#4,  2, $0
	rest  2
	note A_4,  2, $0
	rest  2
	note C_5,  2, $0
	rest  2
	note E_3, 17, $0
	rest  5
	note D_3, 11, $0
	note C_3, 21, $0
	rest  1
	note D_3, 23, $0
	note C_3, 11, $0
	note B_2, 23, $0
	note B_2, 19, $0
	rest  3
	note C_3, 23, $0
	note C_3, 23, $0
	note G_2,  5, $0
	rest  5
	note G_2,  5, $0
	rest  5
	note A_2, 11, $0
	note C_3, 11, $0
	rest 11
	note G_2,  5, $0
	rest  5
	note A_2, 11, $0
	note C_3, 11, $0
	rest 11
	note G_2,  5, $0
	rest  5
	note A_2, 11, $0
	note D_3, 11, $0
	rest 11
	note G_2,  5, $0
	rest  5
	note A_2, 11, $0
	note D_3, 11, $0
	audio_jp Sound_fbc97

Sound_fbd5d:
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note D#1, 11, $1
	rest 11
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	rest 23
	note G#0, 11, $1
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	note D#1, 11, $1
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	note D#1, 11, $1
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	note D#1, 11, $1
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	note D#1, 11, $1
	note D#1, 11, $1
	rest 11
	note G#0, 11, $1
	rest 11
	note D#1, 11, $1
	note G#0, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note G#0, 11, $1
	note G#0, 11, $1
	audio_jp Sound_fbd5d

Sound_fbde7:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	note E_1,  3, $0
	note E_0, 19, $0
	sweep 3, AUD1SWEEP_UP, 7
	note B_0, 19, $3
	audio_done

Sound_fbdfc:
	pan PAN_LEFT | PAN_RIGHT
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_12_5
	pan PAN_LEFT | PAN_RIGHT
	note B_0,  1, $0
	rest 11
	note B_0,  3, $0
	note B_0,  1, $3
	note E_0,  0, $0
	note E_0,  0, $3
	note E_0,  0, $0
	note E_0,  0, $3
	audio_done

Sound_fbe16:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $02
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_50
	note F#2,  2, $0
	note F#2,  2, $4
	note F#2,  2, $0
	note F#2,  2, $4
	note F#2,  1, $0
	note F#2,  1, $4
	audio_done

Sound_fbe2d:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	note D_4,  0, $0
	note D_4,  0, $0
	note D_4,  0, $0
	note F#4,  0, $4
	note F#4,  0, $4
	note F#4,  0, $4
	note E_4,  0, $0
	note E_4,  0, $0
	note E_4,  0, $0
	note G#4,  0, $4
	note G#4,  0, $4
	note G#4,  0, $4
	note C#5,  0, $0
	note C#5,  0, $0
	note C#5,  0, $0
	audio_done

Sound_fbe56:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $05
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	audio_call Sound_fbe68
	audio_call Sound_fbe68
	audio_call Sound_fbe68
	audio_done

Sound_fbe68:
	note D#2,  0, $0
	note F_1,  0, $0
	note C#2,  0, $0
	note F#1,  1, $0
	audio_ret

Sound_fbe71:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $06
	def_envelope $0, 15, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_50
	sweep 3, AUD1SWEEP_UP, 7
	note G#2,  5, $0
	note G#3,  5, $0
	note G#4,  5, $0
	sweep 0, AUD1SWEEP_DOWN, 0
	audio_done

Sound_fbe84:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $06
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	sweep 5, AUD1SWEEP_DOWN, 7
	note G#3,  2, $0
	note A#3,  2, $0
	note C#3, 22, $0
	sweep 0, AUD1SWEEP_DOWN, 0
	audio_done

Sound_fbe97:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	audio_call Sound_fbea8
	audio_call Sound_fbea8
	sweep 0, AUD1SWEEP_DOWN, 0
	audio_done

Sound_fbea8:
	sweep 3, AUD1SWEEP_DOWN, 7
	note E_4,  1, $0
	note A_4,  1, $0
	sweep 0, AUD1SWEEP_DOWN, 0
	audio_ret

Sound_fbeb1:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $01
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	sweep 0, AUD1SWEEP_DOWN, 0
	note D#4,  0, $0
	note E_4,  0, $0
	note F_4,  0, $0
	note A#4,  0, $0
	note A#5,  0, $0
	note A#5, 11, $4
	sweep 3, AUD1SWEEP_UP, 5
	audio_done

Sound_fbecc:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	duty_cycle DUTY_75
	note D_2,  5, $0
	audio_done

Sound_fbed5:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $0, 15, AUD1ENV_DOWN, 6
	def_envelope $5,  4, AUD1ENV_DOWN, 6
	duty_cycle DUTY_75
	note C#2,  0, $0
	note C#4,  0, $0
	note C#3,  0, $0
	note C#5,  0, $0
	note F#2,  0, $0
	note F#4,  0, $0
	note F#3,  0, $0
	audio_done

Sound_fbeec:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	poly_div 3
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $02
	note D_1,  9, $0
	note D#1, 15, $3
	audio_done

Sound_fbefe:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $05
	def_envelope $0, 15, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_12_5
	base_note -F_0
	note E_5,  2, $0
	note F_5,  2, $0
	note G_5,  2, $0
	note A_5,  2, $0
	note E_4,  2, $0
	note F_4,  2, $0
	note G_4,  2, $0
	note A_4,  2, $0
	note C_5,  2, $0
	note D_5,  2, $0
	audio_done

Sound_fbf1d:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	note A#2,  3, $0
	note A#1,  3, $0
	audio_done

Sound_fbf2a:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $03
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	note F#4,  1, $0
	note F_3,  1, $0
	note G_3,  1, $0
	note E_3,  1, $0
	note D_3,  1, $0
	note G_3,  1, $0
	note G_3,  1, $3
	note C_3,  1, $0
	note C_3,  5, $3
	audio_done

Sound_fbf47:
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $05
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_50
	note C#2,  9, $0
	note B_1,  9, $0
	note C_2,  9, $0
	note A#1,  9, $0
	note B_1,  9, $0
	note A#1,  9, $0
	note B_1,  9, $0
	note A#1,  9, $0
	pan PAN_LEFT | PAN_RIGHT
	audio_done

Sound_fbf61:
	pan PAN_LEFT
	audio_unkf9 $05
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	sweep 0, AUD1SWEEP_DOWN, 0
	duty_cycle DUTY_75
	rest  3
	base_note E_0
	note C#2,  9, $0
	note B_1,  9, $0
	note C_2,  9, $0
	note A#1,  9, $0
	note B_1,  9, $0
	note A#1,  9, $0
	note B_1,  9, $0
	note A#1,  9, $0
	pan PAN_LEFT | PAN_RIGHT
	audio_done

Sound_fbf7f:
	audio_unkf9 $02
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	poly_div 3
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	note A_0,  0, $0
	note A_0,  0, $0
	note A_0,  0, $3
	base_note -C_2
	note E_0, 23, $0
	note E_0, 11, $3
	audio_done

Sound_fbf96:
	pan PAN_LEFT | PAN_RIGHT
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	poly_div 3
	base_note -C_1
	audio_unkf9 $02
	base_note -G#0
	note C#1,  1, $0
	note C#1,  5, $0
	note C#1,  5, $3
	audio_done

Sound_fbfa9:
	audio_unkf9 $05
	def_envelope $0, 15, AUD1ENV_DOWN, 1
	pan PAN_LEFT | PAN_RIGHT
	note B_0,  0, $0
	note B_0,  0, $0
	note B_0,  0, $0
	audio_done

Sound_fbfb5:
	def_envelope $0, 14, AUD1ENV_DOWN, 6
	poly_div 2
	base_note -C_1
	base_note -G#0
	pan PAN_LEFT | PAN_RIGHT
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	note D_1,  5, $0
	audio_done

