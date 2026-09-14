Music_MainMenu_Ch1:
.loop
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_25
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	audio_unkf9 $04
	note E_5,  5, $1
	note D_5,  5, $1
	note E_5,  5, $1
	rest  5
	note G_5, 23, $1
	note G_5, 23, $1
	note A_5,  5, $1
	note G_5,  5, $1
	note A_5,  5, $1
	rest  5
	note B_5, 23, $1
	note B_5, 23, $1
	note B_5, 23, $1
	note B_5, 23, $1
	note E_5,  5, $1
	note F#5,  5, $1
	note G#5,  5, $1
	note F#5,  5, $1
	note E_5,  5, $1
	note B_4,  5, $1
	note G#4,  5, $1
	note B_4,  5, $1
	note E_4,  2, $1
	note F#4,  2, $1
	note G#4,  2, $1
	note A_4,  2, $1
	note B_4,  2, $1
	note C_5,  2, $1
	note D_5,  2, $1
	note E_5,  2, $1
	note F#5,  2, $1
	note G#5,  2, $1
	note A_5,  2, $1
	note B_5,  2, $1
	note C_6,  2, $1
	note D_6,  2, $1
	note E_6,  2, $1
	note F#6,  2, $1
	audio_call Music_MainMenu_Ch1_Sub1
	note F#4, 23, $4
	note F#4, 23, $4
	note F#4, 17, $1
	note F#4,  5, $3
	note D_4,  5, $1
	note D_4,  5, $3
	note F#4,  5, $1
	note F#4,  5, $3
	audio_call Music_MainMenu_Ch1_Sub1
	note B_4, 23, $1
	note B_4, 23, $1
	note B_4, 23, $1
	note A_4,  5, $1
	note B_4,  5, $1
	note C_5,  5, $1
	note D_5,  5, $1
	note E_5, 23, $4
	note E_5,  5, $1
	note E_5,  5, $3
	note E_5,  5, $1
	note E_5,  5, $1
	note E_5, 17, $1
	note E_5,  5, $3
	note F#5, 17, $1
	note F#5,  5, $3
	note D_5, 23, $1
	note D_5, 23, $1
	note D_5, 23, $1
	note D_5,  5, $3
	note D_5,  5, $4
	note C_5,  5, $1
	note B_4,  5, $1
	note A_4,  5, $1
	note A_4,  5, $4
	note A_4,  5, $4
	note B_4,  5, $1
	note C_5, 23, $1
	note C_5, 11, $1
	note C_5,  5, $3
	note C_5,  5, $4
	note B_4,  5, $1
	note B_4,  5, $3
	note A_4,  5, $1
	note A_4,  5, $3
	note G_4, 23, $4
	note G_4, 23, $4
	note G_4, 11, $1
	note F#6,  2, $1
	note E_6,  2, $1
	note D_6,  2, $1
	note B_5,  2, $1
	note A_5,  2, $1
	note G_5,  2, $1
	note F#5,  2, $1
	note E_5,  2, $1
	note D_5,  2, $1
	note B_4,  2, $1
	note A_4,  2, $1
	note G_4,  2, $1
	note E_5,  5, $1
	note E_5,  5, $1
	note E_5,  5, $1
	note E_5,  5, $1
	note E_5,  5, $1
	note E_5,  5, $4
	note F#5,  5, $1
	note F#5,  5, $4
	note G_5, 23, $1
	note G_5, 11, $1
	note G_5,  5, $3
	note G_5,  5, $4
	note A_5,  5, $1
	note A_5,  5, $1
	note A_5,  5, $1
	note A_5,  5, $1
	note E_5,  5, $1
	note E_5,  5, $4
	note A_5,  5, $1
	note A_5,  5, $4
	note F#5, 23, $4
	note F#5, 11, $4
	note F#5,  5, $1
	note F#5,  5, $4
	note C_5, 11, $1
	note C_5,  5, $3
	note C_5,  5, $4
	note C_5, 11, $1
	note C_5,  5, $3
	note D_5,  5, $1
	note E_5, 17, $1
	note E_5,  5, $3
	note F#5, 17, $1
	note F#5,  5, $3
	audio_call Music_MainMenu_Ch1_Sub2
	audio_call Music_MainMenu_Ch1_Sub2
	audio_jp .loop

Music_MainMenu_Ch1_Sub1:
	note E_4, 23, $4
	note E_4,  5, $1
	note E_4,  5, $3
	note E_4,  5, $1
	note F#4,  5, $1
	note G_4, 17, $1
	note G_4,  5, $3
	note A_4, 17, $1
	note A_4,  5, $3
	audio_ret

Music_MainMenu_Ch1_Sub2:
	note G_5, 23, $3
	note G_5, 23, $3
	note G_5, 23, $3
	note G_5, 23, $3
	audio_ret

Music_MainMenu_Ch2:
.loop
	def_envelope $0, 12, AUD1ENV_DOWN, 6
	def_envelope $1, 12, AUD1ENV_DOWN, 0
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	def_envelope $3,  8, AUD1ENV_DOWN, 6
	def_envelope $4,  6, AUD1ENV_DOWN, 6
	duty_cycle DUTY_75
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note B_4,  5, $1
	note B_4,  5, $1
	note B_4,  5, $1
	rest  5
	note B_4, 23, $1
	note B_4, 23, $1
	note C_5,  5, $1
	note C_5,  5, $1
	note C_5,  5, $1
	rest  5
	note E_4,  5, $1
	note F#4,  5, $1
	note G#4,  5, $1
	note B_4,  5, $1
	note E_5,  5, $1
	note F#5,  5, $1
	note G#5,  5, $1
	note F#5,  5, $1
	note E_5,  5, $1
	note B_4,  5, $1
	note G#4,  5, $1
	note F#4,  5, $1
	note E_4,  5, $1
	note F#4,  5, $1
	note G#4,  5, $1
	note B_4,  5, $1
	rest  5
	note E_5,  5, $3
	note F#5,  5, $3
	note G#5,  5, $3
	note F#5,  5, $3
	note E_5,  5, $3
	note B_4,  5, $3
	note G#4,  5, $3
	note B_4,  5, $3
	note E_4,  2, $3
	note F#4,  2, $3
	note G#4,  2, $3
	note A_4,  2, $3
	note B_4,  2, $3
	note C_5,  2, $3
	note D_5,  2, $3
	note E_5,  2, $3
	note F#5,  2, $3
	note G#5,  2, $3
	note A_5,  2, $3
	note B_5,  2, $3
	note C_6,  2, $3
	note D_6,  2, $3
	note B_5,  5, $3
	note G_5,  5, $3
	note B_4,  5, $3
	note G_5,  5, $3
	note B_5,  5, $3
	note G_5,  5, $3
	note B_4,  5, $3
	note G_5,  5, $3
	note B_5,  5, $3
	note E_5,  5, $3
	note B_4,  5, $3
	note E_5,  5, $3
	note B_5,  5, $3
	note E_5,  5, $3
	note B_4,  5, $3
	note E_5,  5, $3
	note B_5,  5, $3
	note D_5,  5, $3
	note B_4,  5, $3
	note D_5,  5, $3
	note B_5,  5, $3
	note D_5,  5, $3
	note B_4,  5, $3
	note D_5,  5, $3
	note B_4,  5, $3
	note B_4,  5, $4
	note D_5,  5, $3
	note D_5,  5, $4
	note B_5,  5, $3
	note B_5,  5, $4
	note D_6,  5, $3
	note D_6,  5, $4
	note C_6,  5, $3
	note G_5,  5, $3
	note C_5,  5, $3
	note G_5,  5, $3
	note C_6,  5, $3
	note G_5,  5, $3
	note C_5,  5, $3
	note G_5,  5, $3
	note D_6,  5, $3
	note C_6,  5, $3
	note B_5,  5, $3
	note A_5,  5, $3
	note G_5,  5, $3
	note F#5,  5, $3
	note E_5,  5, $3
	note D_5,  5, $3
	note F#4,  5, $3
	note F#4,  5, $4
	note F#5,  5, $3
	note F#5,  5, $4
	note F#6,  5, $3
	note F#6,  5, $4
	note F#5,  5, $3
	note F#5,  5, $4
	note D_6,  5, $3
	note D_6,  5, $4
	note B_5,  5, $3
	note B_5,  5, $4
	note F#4,  5, $2
	note G_4,  5, $2
	note A_4,  5, $2
	note B_4,  5, $2
	note C_5, 23, $4
	note C_5,  5, $2
	note C_5,  5, $4
	note C_5,  5, $2
	note C_5,  5, $2
	note C_5, 17, $2
	note C_5,  5, $4
	note D_5, 17, $2
	note D_5,  5, $4
	note B_4,  5, $2
	note B_4,  5, $2
	note B_4,  5, $2
	note B_4,  5, $2
	note B_5,  5, $2
	note A_5,  5, $2
	note G_5,  5, $2
	note F#5,  5, $2
	note B_5,  5, $2
	note A_5,  5, $2
	note G_5,  5, $2
	note F#5,  5, $2
	note B_5,  5, $2
	note A_5,  5, $2
	note A_4,  5, $2
	note G_4,  5, $2
	note C_4,  2, $3
	note C#4,  2, $3
	note D_4,  2, $3
	note D#4,  2, $3
	note E_4,  2, $3
	note F_4,  2, $3
	note F#4,  2, $3
	note G_4,  2, $3
	note G#4,  2, $3
	note A_4,  2, $3
	note A#4,  2, $3
	note B_4,  2, $3
	note C_5,  2, $3
	note C#5,  2, $3
	note D_5,  2, $3
	note D#5,  2, $3
	note E_5,  2, $3
	note F_5,  2, $3
	note F#5,  2, $3
	note G_5,  2, $3
	note G#5,  2, $3
	note A_5,  2, $3
	note A#5,  2, $3
	note B_5,  2, $3
	note C_6,  2, $3
	note C#6,  2, $3
	note D_6,  2, $3
	note D#6,  2, $3
	note E_6,  2, $3
	note F_6,  2, $3
	note F#6,  2, $3
	note G_6,  2, $3
	note A_6,  2, $3
	note G#6,  2, $3
	note G_6,  2, $3
	note F#6,  2, $3
	note F_6,  2, $3
	note E_6,  2, $3
	note D#6,  2, $3
	note D_6,  2, $3
	note C#6,  2, $3
	note C_6,  2, $3
	note B_5,  2, $3
	note A#5,  2, $3
	note A_5,  2, $3
	note G#5,  2, $3
	note G_5,  2, $3
	note F#5,  2, $3
	note F_5,  2, $3
	note E_5,  2, $3
	note D#5,  2, $3
	note D_5,  2, $3
	note C#5,  2, $3
	note C_5,  2, $3
	note B_4,  2, $3
	note A#4,  2, $3
	note A_4,  2, $3
	note G#4,  2, $3
	note G_4,  2, $3
	note F#4,  2, $3
	note F_4,  2, $3
	note E_4,  2, $3
	note D#4,  2, $3
	note D_4,  2, $3
	note C_5,  5, $1
	note C_5,  5, $1
	note C_5,  5, $1
	note C_5,  5, $1
	note C_5,  5, $1
	note C_5,  5, $4
	note D_5,  5, $1
	note D_5,  5, $4
	note B_4, 23, $1
	note B_4, 11, $1
	note B_4,  5, $3
	note B_4,  5, $4
	note C#5,  5, $1
	note C#5,  5, $1
	note C#5,  5, $1
	note C#5,  5, $1
	note C#5,  5, $1
	note C#5,  5, $4
	note E_5,  5, $1
	note E_5,  5, $4
	note D_5, 23, $4
	note D_5, 11, $4
	note D_5,  5, $1
	note D_5,  5, $4
	note E_4, 11, $1
	note E_4,  5, $3
	note E_4,  5, $4
	note E_4, 11, $1
	note A_4,  5, $3
	note B_4,  5, $1
	note C_5, 17, $1
	note C_5,  5, $3
	note D_5, 17, $1
	note D_5,  5, $3
	audio_call Music_MainMenu_Ch2_Sub1
	audio_call Music_MainMenu_Ch2_Sub1
	audio_jp .loop

Music_MainMenu_Ch2_Sub1:
	note E_5, 23, $3
	note E_5, 23, $3
	note E_5, 23, $3
	note E_5, 23, $3
	audio_ret

Music_MainMenu_Ch3:
.loop
	def_envelope $2, 10, AUD1ENV_DOWN, 6
	duty_cycle DUTY_50
	base_note -C_1
	pan PAN_LEFT | PAN_RIGHT
	note E_4, 11, $2
	rest 11
	note D_4, 23, $2
	note D_4, 23, $2
	note F_3, 23, $2
	note E_3, 11, $2
	rest 11
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	rest  5
	rest 11
	note B_2,  5, $2
	note B_2,  5, $2
	note E_3, 11, $2
	rest 11
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	rest  5
	rest 11
	note B_2,  5, $2
	note B_2,  5, $2
	note E_3, 11, $2
	rest 11
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	rest  5
	rest 11
	note B_2,  5, $2
	note B_2,  5, $2
	note D_3, 11, $2
	rest 11
	note D_3,  5, $2
	note D_3,  5, $2
	note D_3,  5, $2
	note D_3,  5, $2
	note D_3,  5, $2
	note D_3,  5, $2
	note D_3,  5, $2
	rest  5
	rest 11
	note B_2,  5, $2
	note B_2,  5, $2
	note C_3, 11, $2
	rest 11
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	rest  5
	rest 11
	note D_3,  5, $2
	note D_3,  5, $2
	note G_2, 11, $2
	rest 11
	note G_2,  5, $2
	note G_2,  5, $2
	note G_2,  5, $2
	note G_2,  5, $2
	note G_2,  5, $2
	note G_2,  5, $2
	note G_2,  5, $2
	rest  5
	rest 11
	note G_2,  5, $2
	note G_2,  5, $2
	note C_3, 11, $2
	rest 11
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	note C_3,  5, $2
	rest  5
	rest 11
	note G_2,  5, $2
	note G_2,  5, $2
	note B_2, 11, $2
	rest 11
	note B_2,  5, $2
	note B_2,  5, $2
	note B_2,  5, $2
	note B_2,  5, $2
	note B_2,  5, $2
	note B_2,  5, $2
	note B_2,  5, $2
	rest  5
	rest 11
	note F#2,  5, $2
	note F#2,  5, $2
	note A_2, 11, $2
	rest 11
	note A_2,  5, $2
	note A_2,  5, $2
	note A_2,  5, $2
	note A_2,  5, $2
	note A_2,  5, $2
	note A_2,  5, $2
	note A_2,  5, $2
	rest  5
	rest 11
	note D_2,  5, $2
	note D_2,  5, $2
	note G_2,  5, $2
	rest  5
	note G_2, 23, $2
	note G_2, 23, $2
	note G_2, 23, $2
	note G_2, 11, $2
	note C_3, 11, $2
	rest 11
	note D_3, 11, $2
	rest 11
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note E_3,  5, $2
	note F#3,  5, $2
	note G_3,  5, $2
	note B_2,  5, $2
	note A_2, 11, $2
	rest 11
	note E_3, 11, $2
	rest 11
	note B_2,  5, $2
	note B_2,  5, $2
	note D_3,  5, $2
	note D_3,  5, $2
	note F#2,  5, $2
	note F#2,  5, $2
	note B_2,  5, $2
	note B_2,  5, $2
	note A_2, 11, $2
	rest 11
	note A_2, 23, $2
	note D_2, 11, $2
	note F#2, 11, $2
	note A_2, 11, $2
	note C_3, 11, $2
	note E_2, 11, $2
	rest 11
	note E_2, 23, $2
	note E_3, 11, $2
	note B_2, 11, $2
	note G_2, 11, $2
	note B_2, 11, $2
	note E_2, 11, $2
	rest 11
	note E_2, 23, $2
	note E_3, 11, $2
	note B_2, 11, $2
	note G_2, 11, $2
	note B_2, 11, $2
	audio_jp .loop

Music_MainMenu_Ch4:
.loop
	def_envelope $7,  6, AUD1ENV_DOWN, 0
	def_envelope $1, 10, AUD1ENV_DOWN, 1
	base_note -C_2
	pan PAN_LEFT | PAN_RIGHT
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $7
	note G#0, 23, $1
	note G#0, 23, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 11, $1
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub3
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub2
	audio_call Music_MainMenu_Ch4_Sub1
	audio_call Music_MainMenu_Ch4_Sub3
	audio_call Music_MainMenu_Ch4_Sub4
	audio_call Music_MainMenu_Ch4_Sub4
	audio_call Music_MainMenu_Ch4_Sub5
	audio_call Music_MainMenu_Ch4_Sub5
	audio_call Music_MainMenu_Ch4_Sub5
	audio_jp .loop

Music_MainMenu_Ch4_Sub1:
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1, 11, $1
	note G#0, 11, $1
	audio_ret

Music_MainMenu_Ch4_Sub2:
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note D#1,  5, $1
	note G#0,  5, $1
	note D#1,  5, $1
	note D#1, 11, $1
	note G#0,  5, $1
	note D#1,  5, $1
	audio_ret

Music_MainMenu_Ch4_Sub3:
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
	audio_ret

Music_MainMenu_Ch4_Sub4:
	note D#1, 11, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	note G#0,  5, $1
	audio_ret

Music_MainMenu_Ch4_Sub5:
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	note D#1, 11, $1
	note G#0, 11, $1
	audio_ret
