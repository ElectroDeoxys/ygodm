	const_def
DEF MUSIC_CHANNELS EQU const_value
	const CHANNEL_1 ; $0
	const CHANNEL_2 ; $1
	const CHANNEL_3 ; $2
	const CHANNEL_4 ; $3
DEF NUM_MUSIC_CHANNELS EQU const_value - MUSIC_CHANNELS
DEF SFX_CHANNELS EQU const_value
	const CHANNEL_5 ; $4
	const CHANNEL_6 ; $5
	const CHANNEL_7 ; $6
	const CHANNEL_8 ; $7
DEF NUM_SFX_CHANNELS EQU const_value - SFX_CHANNELS
DEF NUM_CHANNELS EQU const_value

; wAudioChannel constants
	const_def
	const CH_PULSE1 ; $0
	const CH_PULSE2 ; $1
	const CH_WAVE   ; $2
	const CH_NOISE  ; $3

; channel struct constants
RSRESET
DEF CHANNELSTRUCT_STACK RW $10 ; $00
DEF CHANNELSTRUCT_STACK_PTR RB ; $20
DEF CHANNELSTRUCT_UNK21 RB ; $21
DEF CHANNELSTRUCT_CMD_PTR RW ; $22
DEF CHANNELSTRUCT_UNK24 RB ; $24
DEF CHANNELSTRUCT_UNK25 RB ; $25
DEF CHANNELSTRUCT_ENVELOPES RB $8 ; $26
DEF CHANNELSTRUCT_BASE_NOTE RB ; $2e
DEF CHANNELSTRUCT_UNK2F RB ; $2f
DEF CHANNELSTRUCT_LOOP_COUNTERS RB $4 ; $30
DEF CHANNELSTRUCT_UNK34 RB ; $34
DEF CHANNELSTRUCT_UNK35 RB ; $35
RSSET $37
DEF CHANNELSTRUCT_UNK37 RB ; $37
RSSET $40
DEF CHANNEL_STRUCT_SIZE EQU _RS

	const_def
	const C_0 ; $00
	const C#0 ; $01
	const D_0 ; $02
	const D#0 ; $03
	const E_0 ; $04
	const F_0 ; $05
	const F#0 ; $06
	const G_0 ; $07
	const G#0 ; $08
	const A_0 ; $09
	const A#0 ; $0a
	const B_0 ; $0b
	const C_1 ; $0c
	const C#1 ; $0d
	const D_1 ; $0e
	const D#1 ; $0f
	const E_1 ; $10
	const F_1 ; $11
	const F#1 ; $12
	const G_1 ; $13
	const G#1 ; $14
	const A_1 ; $15
	const A#1 ; $16
	const B_1 ; $17
	const C_2 ; $18
	const C#2 ; $19
	const D_2 ; $1a
	const D#2 ; $1b
	const E_2 ; $1c
	const F_2 ; $1d
	const F#2 ; $1e
	const G_2 ; $1f
	const G#2 ; $20
	const A_2 ; $21
	const A#2 ; $22
	const B_2 ; $23
	const C_3 ; $24
	const C#3 ; $25
	const D_3 ; $26
	const D#3 ; $27
	const E_3 ; $28
	const F_3 ; $29
	const F#3 ; $2a
	const G_3 ; $2b
	const G#3 ; $2c
	const A_3 ; $2d
	const A#3 ; $2e
	const B_3 ; $2f
	const C_4 ; $30
	const C#4 ; $31
	const D_4 ; $32
	const D#4 ; $33
	const E_4 ; $34
	const F_4 ; $35
	const F#4 ; $36
	const G_4 ; $37
	const G#4 ; $38
	const A_4 ; $39
	const A#4 ; $3a
	const B_4 ; $3b
	const C_5 ; $3c
	const C#5 ; $3d
	const D_5 ; $3e
	const D#5 ; $3f
	const E_5 ; $40
	const F_5 ; $41
	const F#5 ; $42
	const G_5 ; $43
	const G#5 ; $44
	const A_5 ; $45
	const A#5 ; $46
	const B_5 ; $47
	const C_6 ; $48
	const C#6 ; $49
	const D_6 ; $4a
	const D#6 ; $4b
	const E_6 ; $4c
	const F_6 ; $4d
	const F#6 ; $4e
	const G_6 ; $4f
	const G#6 ; $50
	const A_6 ; $51
	const A#6 ; $52
	const B_6 ; $53
	const C_7 ; $54
	const C#7 ; $55
	const D_7 ; $56
	const D#7 ; $57
	const E_7 ; $58
	const F_7 ; $59
	const F#7 ; $5a
	const G_7 ; $5b
	const G#7 ; $5c
	const A_7 ; $5d
	const A#7 ; $5e
	const B_7 ; $5f
	const C_8 ; $60
	const C#8 ; $61
	const D_8 ; $62
	const D#8 ; $63
	const E_8 ; $64
	const F_8 ; $65
	const F#8 ; $66
	const G_8 ; $67
	const G#8 ; $68
	const A_8 ; $69
	const A#8 ; $6a
	const B_8 ; $6b
	const C_9 ; $6c
	const C#9 ; $6d
	const D_9 ; $6e

	const_def
	const DUTY_12_5 ; $0
	const DUTY_25   ; $1
	const DUTY_50   ; $2
	const DUTY_75   ; $3

DEF PAN_LEFT  EQU (1 << 0)
DEF PAN_RIGHT EQU (1 << 1)
