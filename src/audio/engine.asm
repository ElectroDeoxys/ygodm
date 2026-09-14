	dw BANK(@)

	farcall_table_start
	farfunc InitAudio
	farfunc UpdateAudio
	farfunc _PlaySound

InitAudio::
	ld a, INVALID_SOUND
	ld [wPendingSound], a

	ld hl, STARTOF("WRAM Audio")
	ld bc, SIZEOF("WRAM Audio")
.loop_clear_wram
	xor a
	ld [hl], a
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop_clear_wram

	ld a, $7f
	ld [wCurAudioConfigUnk2], a
	ld a, AUDTERM_1_RIGHT | AUDTERM_2_RIGHT | AUDTERM_3_RIGHT | AUDTERM_4_RIGHT | AUDTERM_1_LEFT | AUDTERM_2_LEFT | AUDTERM_3_LEFT | AUDTERM_4_LEFT
	ld [wCurAudioConfigUnk3], a

	; enable all channels
	ld a, AUDENA_CH1_ON | AUDENA_CH2_ON | AUDENA_CH3_ON | AUDENA_CH4_ON | AUDENA_ON
	ldh [rAUDENA], a

	call AudioCmd_ResetSweep

	; load triangle wave to channel 3
	ld hl, _AUD3WAVERAM
	ld bc, .TriangleWave
	ld d, AUD3WAVE_SIZE
.loop_init_waveram
	ld a, [bc]
	inc bc
	ld [hli], a
	dec d
	jr nz, .loop_init_waveram
	ld a, AUD3ENA_ON
	ldh [rAUD3ENA], a

	ld a, $04
	ld [wCurAudioConfigUnk0], a
	ld hl, wChannels
	ld c, NUM_CHANNELS
.loop_channels
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR + 1
	or l
	ld l, a
	ld a, $80
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK24
	or l
	ld l, a
	ld a, $80
	ld [hl], a
	push bc
	ld bc, CHANNEL_STRUCT_SIZE
	add hl, bc
	pop bc
	dec c
	jr nz, .loop_channels
	ret

.TriangleWave:
	dn 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

; input:
; - a = sound constant to play?
_PlaySound::
	ld [wPendingSound], a
	ret

InitChannelsForSound:
	push hl
	push bc
	push de

	; is it music or sfx?
	cp SOUND_EFFECTS
	jr nc, .sfx

	ld de, wMusicChannels + CHANNELSTRUCT_UNK24
	call .InitChannels
	ld hl, wMusicChannels
	jp .asm_f80cc

.InitChannels:
	add a
	add a
	ld hl, SoundHeaders
	ld b, $00
	ld c, a
	add hl, bc
	ld bc, wc902

	; wChannel1/5
	ld a, [hli]
	ld [de], a
	ld [bc], a
	inc bc

	; wChannel2/6
	push hl
	ld hl, CHANNEL_STRUCT_SIZE
	add hl, de
	push hl
	pop de
	pop hl
	ld a, [hli]
	ld [de], a
	ld [bc], a
	inc bc

	; wChannel3/7
	push hl
	ld hl, CHANNEL_STRUCT_SIZE
	add hl, de
	push hl
	pop de
	pop hl
	ld a, [hli]
	ld [de], a
	ld [bc], a
	inc bc

	; wChannel4/8
	push hl
	ld hl, CHANNEL_STRUCT_SIZE
	add hl, de
	push hl
	pop de
	pop hl
	ld a, [hl]
	ld [de], a
	ld [bc], a
	ret

.sfx
	and $7f
	ld de, wSFXChannels + CHANNELSTRUCT_UNK24
	call .InitChannels
	ld hl, wSFXChannels

.asm_f80cc
	ld de, wc902
	ld d, $80 ; bug, this overrides ld above
	ld b, NUM_MUSIC_CHANNELS ; aka NUM_SFX_CHANNELS
	ld a, LOW(rAUD1ENV)
.asm_f80d5
	ld c, a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK21
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK2F
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_BASE_NOTE
	or l
	ld l, a
	xor a
	ld [hl], a ; C_0
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR + 1
	or l
	ld l, a
	ld [hl], d
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK35
	or l
	ld l, a
	xor a
	ld [hl], a
	; due to the bug above, this will read garbage from VRAM
	ld a, [de]
	inc de
	cp $80
	jr nc, .asm_f810a
	xor a
	ld [$ff00+c], a
.asm_f810a
	push bc
	ld bc, CHANNEL_STRUCT_SIZE
	add hl, bc
	pop bc
	ld a, c
	add AUDRAM_SIZE
	dec b
	jr nz, .asm_f80d5
	pop de
	pop bc
	pop hl
	ret

UpdateAudio::
	ld a, [wPendingSound]
	cp INVALID_SOUND
	jr z, .no_pending_sound
	call InitChannelsForSound
	ld a, INVALID_SOUND
	ld [wPendingSound], a

.no_pending_sound
	; set wMusicAudioConfig = wCurAudioConfig
	; and wCurAudioConfig = wSFXAudioConfig
	ld hl, wCurAudioConfig
	ld de, wMusicAudioConfig
	ld bc, wSFXAudioConfig
	REPT 6
		ld a, [hl]
		ld [de], a
		ld a, [bc]
		ld [hli], a
		inc bc
		inc de
	ENDR

	xor a
	ld hl, wSFXChannels + CHANNELSTRUCT_UNK37
	ld [hl], a
	REPT NUM_SFX_CHANNELS - 1
		push bc
		ld bc, CHANNEL_STRUCT_SIZE
		add hl, bc
		pop bc
		xor a
		ld [hl], a
	ENDR

	ldh a, [rAUD1LEN]
	ld [wc91e], a
	ldh a, [rAUD2LEN]
	ld [wc91f], a
	xor a ; CH_PULSE1
	ld [wAudioChannel], a

	ld hl, wSFXChannels
	ld a, LOW(AUD1RAM)
	call UpdateChannel

	; set wSFXAudioConfig = wCurAudioConfigUnk0
	; and wCurAudioConfigUnk0 = wMusicAudioConfig
	ld hl, wCurAudioConfigUnk0
	ld de, wMusicAudioConfig
	ld bc, wSFXAudioConfig
	REPT 6
		ld a, [hl]
		ld [bc], a
		ld a, [de]
		ld [hli], a
		inc bc
		inc de
	ENDR

	ld hl, wSFXChannels + CHANNELSTRUCT_UNK37
	ld de, wMusicChannels + CHANNELSTRUCT_UNK37
	ld c, NUM_SFX_CHANNELS
.asm_f81be
	ld a, [hl]
	ld [de], a
	push bc
	ld bc, CHANNEL_STRUCT_SIZE
	add hl, bc
	pop bc
	push hl
	ld hl, CHANNEL_STRUCT_SIZE
	add hl, de
	push hl
	pop de
	pop hl
	dec c
	jr nz, .asm_f81be
	ld a, [wc91e]
	ldh [rAUD1LEN], a
	ld a, [wc91f]
	ldh [rAUD2LEN], a
	xor a ; CH_PULSE1
	ld [wAudioChannel], a

	ld hl, wMusicChannels
	ld a, LOW(AUD1RAM)
	call UpdateChannel

	ld a, [wVolume]
	ldh [rAUDVOL], a
	ld a, [wChannelMixer]
	ldh [rAUDTERM], a
	ret

; input:
; - a = audio register
; - hl = channel
UpdateChannel:
	ld [wAudioRegister], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK24
	or l
	ld l, a
	ld a, [hl]
	ld c, $80
	cp c
	jr nc, .asm_f8236
	ld [hl], c
	add a
	add LOW(Sounds)
	ld e, a
	ld a, $00
	adc HIGH(Sounds)
	ld d, a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR
	or l
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	inc l
	ld a, [de]
	ld [hl], a
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_STACK_PTR
	or l
	ld l, a
	pop af
	ld [hl], $1f
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK2F
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK21
	or l
	ld l, a
	xor a
	ld [hl], a
.asm_f8236
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR + 1
	or l
	ld l, a
	ld a, [hl]
	cp c
	jr nc, .next_channel
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK2F
	or l
	ld l, a
	ld a, [hl]
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK21
	or l
	ld l, a
	pop af
	sub [hl]
	jr c, .asm_f8262
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK2F
	or l
	ld l, a
	pop af
	ld [hl], a
	call ProcessSound
.asm_f8262
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK2F
	or l
	ld l, a
	ld a, [wCurAudioConfigUnk0]
	add [hl]
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK37
	or l
	ld l, a
	ld a, $ff
	ld [hl], a
.next_channel
	ld a, [wAudioChannel]
	inc a
	ld [wAudioChannel], a
	push bc
	ld bc, CHANNEL_STRUCT_SIZE
	add hl, bc
	pop bc
	ld a, [wAudioRegister]
	add AUDRAM_SIZE
	cp LOW(AUD4RAM) + AUDRAM_SIZE
	jr nc, .asm_f8291
	jp UpdateChannel
.asm_f8291
	ld a, [wc908]
	inc a
	ld [wc908], a
	and $1f
	ld e, a

	ld a, [wCurAudioConfigUnk2]
	ld b, a
	and AUDVOL_LEFT
	; same volume for right and left
	ld c, a
	swap c
	or c
	ld [wVolume], a

	dec e
	jr nz, .asm_f82be
	ld a, [wCurAudioConfigUnk4]
	add b
	ld c, a
	xor b
	rlca
	jr nc, .asm_f82ba
	ld a, c
	rlca
	rlca
	sbc a
	cpl
	ld c, a
.asm_f82ba
	ld a, c
	ld [wCurAudioConfigUnk2], a
.asm_f82be
	ld a, [wCurAudioConfigUnk3]
	ld c, a
	ld a, [wCurAudioConfigUnk2]
	and a
	jr nz, .asm_f82ca
	ld c, $00
.asm_f82ca
	ld a, c
	ld [wChannelMixer], a
	ret

AudioCmd_LoopStart:
	and $03
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_LOOP_COUNTERS
	or l
	ld l, a
	pop af
	add l
	ld c, a
	call ReadNextAudioByte
	ld l, c
	ld [hl], a
	ret

AudioCmd_SetPolyDiv:
	and AUD4POLY_DIV
	ld [wCurAudioConfigPolyDiv], a
	ret

AudioCmd_DefineEnvelope:
	and $07
	ld c, a
	call ReadNextAudioByte
	ld b, a
	ld a, CHANNELSTRUCT_ENVELOPES
	add c
	push af
	ld a, l
	and $c0
	ld l, a
	pop af
	add l
	ld l, a
	ld [hl], b
	ret

AudioCmd_ResetSweep:
	ld a, AUD1SWEEP_DOWN
	ld [wCurAudioConfigSweep], a
	ret

AudioCmd_SetSweep:
	call ReadNextAudioByte
	ld [wCurAudioConfigSweep], a
	ret

AudioCmd_SetDutyCycle:
	ld a, [wAudioChannel]
	cp CH_WAVE
	jr nc, .skip
	; bug, this assumes that the duty cycle param is in l
	; but in fact it's been cobbled in register a
	ld a, l
	rrca
	rrca
	and AUD1LEN_DUTY
	ld b, a
	ld a, [wAudioRegister]
	inc a
	ld c, a
	ld a, b
	ld [$ff00+c], a
.skip
	ret

Func_f831e:
	call ReadNextAudioByte
	ld [wCurAudioConfigUnk4], a
	ret

AudioCmd_SetBaseNote:
	call ReadNextAudioByte
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_BASE_NOTE
	or l
	ld l, a
	pop af
	ld [hl], a
	ret

Func_f8333:
	call ReadNextAudioByte
	ld [wCurAudioConfigUnk0], a
	ret

Func_f833a:
	call ReadNextAudioByte
	srl a
	ld [wCurAudioConfigUnk2], a
	xor a
	ld [wCurAudioConfigUnk4], a
	ret

AudioCmd_Call:
	call ReadNextAudioByte
	ld c, a
	call ReadNextAudioByte
	ld b, a
	; bc = argument word

	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_STACK_PTR
	or l
	ld l, a
	ld e, [hl] ; CHANNELSTRUCT_STACK_PTR
	ld d, h

	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR + 1
	or l
	ld l, a
	dec e
	ld a, e
	and $1f
	ld e, a
	ld a, l
	and $c0
	or e
	ld e, a

	ld a, [hl]
	ld [de], a
	ld [hl], b
	dec l
	dec e
	ld a, e
	and $1f
	ld e, a
	ld a, l
	and $c0
	or e
	ld e, a
	ld a, [hl]
	ld [de], a
	ld [hl], c

	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_STACK_PTR
	or l
	ld l, a
	pop af
	push af
	ld a, e
	and $1f
	ld e, a
	pop af
	ld [hl], e
	ret

AudioCmd_LoopEnd:
	and $03
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_LOOP_COUNTERS
	or l
	ld l, a
	pop af
	add l
	ld l, a
	dec [hl]
	jr nz, AudioCmd_Jump
	; skip next 2 bytes
	call ReadNextAudioByte
	jp ReadNextAudioByte

AudioCmd_Jump:
	call ReadNextAudioByte
	ld c, a
	call ReadNextAudioByte
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR + 1
	or l
	ld l, a
	pop af
	ld [hl], a
	dec l
	ld [hl], c
	ret

AudioCmd_Ret:
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_STACK_PTR
	or l
	ld l, a
	ld d, h
	ld e, [hl]
	ld a, l
	and $c0
	or e
	ld e, a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR
	or l
	ld l, a
	ld a, [de]
	ld [hl], a
	inc e
	ld a, e
	and $1f
	ld e, a
	ld a, l
	and $c0
	or e
	ld e, a
	inc l
	ld a, [de]
	ld [hl], a
	inc e
	ld a, e
	and $1f
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_STACK_PTR
	or l
	ld l, a
	pop af
	ld [hl], a
	ret

AudoCmd_Done:
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR + 1
	or l
	ld l, a
	ld a, $80
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK2F
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK21
	or l
	ld l, a
	xor a
	ld [hl], a
	ld a, [wAudioRegister]
	add $02
	ld c, a
	xor a
	ld [$ff00+c], a
	pop de
	ret

AudioCommands:
	dw AudioCmd_LoopStart ; $d0
	dw AudioCmd_LoopStart ; $d1
	dw AudioCmd_LoopStart ; $d2
	dw AudioCmd_LoopStart ; $d3
	dw AudioCmd_LoopEnd ; $d4
	dw AudioCmd_LoopEnd ; $d5
	dw AudioCmd_LoopEnd ; $d6
	dw AudioCmd_LoopEnd ; $d7
	dw Func_f8503 ; $d8
	dw AudioCmd_SetPan ; $d9
	dw AudioCmd_SetPan ; $da
	dw AudioCmd_SetPan ; $db
	dw Func_f850d ; $dc
	dw Func_f850d ; $dd
	dw Func_f850d ; $de
	dw Func_f850d ; $df
	dw AudioCmd_SetPolyDiv ; $e0
	dw AudioCmd_SetPolyDiv ; $e1
	dw AudioCmd_SetPolyDiv ; $e2
	dw AudioCmd_SetPolyDiv ; $e3
	dw AudioCmd_SetPolyDiv ; $e4
	dw AudioCmd_SetPolyDiv ; $e5
	dw AudioCmd_SetPolyDiv ; $e6
	dw AudioCmd_SetPolyDiv ; $e7
	dw AudioCmd_DefineEnvelope ; $e8
	dw AudioCmd_DefineEnvelope ; $e9
	dw AudioCmd_DefineEnvelope ; $ea
	dw AudioCmd_DefineEnvelope ; $eb
	dw AudioCmd_DefineEnvelope ; $ec
	dw AudioCmd_DefineEnvelope ; $ed
	dw AudioCmd_DefineEnvelope ; $ee
	dw AudioCmd_DefineEnvelope ; $ef
	dw AudioCmd_SetDutyCycle ; $f0
	dw AudioCmd_SetDutyCycle ; $f1
	dw AudioCmd_SetDutyCycle ; $f2
	dw AudioCmd_SetDutyCycle ; $f3
	dw AudoCmd_Done ; $f4
	dw AudoCmd_Done ; $f5
	dw AudioCmd_ResetSweep ; $f6
	dw AudioCmd_SetSweep ; $f7
	dw AudioCmd_SetBaseNote ; $f8
	dw Func_f8333 ; $f9
	dw Func_f833a ; $fa
	dw Func_f831e ; $fb
	dw AudioCmd_Call ; $fc
	dw AudioCmd_Jump ; $fd
	dw AudioCmd_Ret ; $fe
	dw AudoCmd_Done ; $ff

JumpBC:
	push bc
	ret

ExecuteAudioCommand:
	and $3f
	sub $10
	push af
	add a
	ld de, AudioCommands
	add e
	ld e, a
	ld a, $00
	adc d
	ld d, a
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	pop af
	call JumpBC
;	fallthrough
ProcessSound:
	call ReadNextAudioByte
	cp $c0
	jr nc, ExecuteAudioCommand
	; is a note or rest
	ld c, a
	call ReadNextAudioByte
	ld [wc906], a
	swap a
	rrca
	and $07
	ld [wc907], a
	ld a, c
	call Func_f8530
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK21
	or l
	ld l, a
	ld a, [wc906]
	and $1f
	inc a
	add a
	add a
	ld [hl], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK35
	or l
	ld l, a
	ld a, [hld]
	and a
	ret z
	inc a
	and $0f
	ld c, $00
	cp [hl] ; CHANNELSTRUCT_UNK34
	jr nz, .asm_f84c7
	ld c, $ff
	xor a
.asm_f84c7
	or $f0
	inc l
	ld [hli], a ; CHANNELSTRUCT_UNK35
	inc l
	ld a, [hl] ; CHANNELSTRUCT_UNK37
	xor c
	ld [hl], a
	and $01
	inc a
;	fallthrough

; bit 0 = left on/off
; bit 1 = right on/off
SetPan:
	and $03
	rra
	ld c, a
	rla
	and $01
	swap a
	or c
	ld b, a
	ld a, [wAudioChannel]
	inc a
	ld c, a
	ld a, b
	ld b, ~(AUDTERM_1_RIGHT | AUDTERM_1_LEFT)
	dec c
	jr z, .got_mask
	add a
	ld b, ~(AUDTERM_2_RIGHT | AUDTERM_2_LEFT)
	dec c
	jr z, .got_mask
	add a
	ld b, ~(AUDTERM_3_RIGHT | AUDTERM_3_LEFT)
	dec c
	jr z, .got_mask
	add a
	ld b, ~(AUDTERM_4_RIGHT | AUDTERM_4_LEFT)
.got_mask
	ld c, a ; channel to turn on
	ld de, wCurAudioConfigUnk3
	ld a, [de]
	and b ; mask
	or c
	ld [de], a
	ret

AudioCmd_SetPan:
	call SetPan
Func_f8503:
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK35
	or l
	ld l, a
	xor a
	ld [hl], a
	ret

Func_f850d:
	and $03
	inc a
	push af
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK34
	or l
	ld l, a
	pop af
	ld [hli], a
	ld a, $f0
	ld [hli], a
	xor a
	ld [hl], a
	ret

ReadNextAudioByte:
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_CMD_PTR
	or l
	ld l, a
	ld e, [hl] ; CHANNELSTRUCT_CMD_PTR
	inc l
	ld d, [hl]
	ld a, [de]
	inc de
	ld [hl], d
	dec l
	ld [hl], e
	ret

Func_f8530:
	ld c, a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK37
	or l
	ld l, a
	ld a, [hl]
	and a
	ret nz
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK25
	or l
	ld l, a
	ld a, c
	ld [hl], a
	cp $6f
	jr nz, .asm_f8555
	ld a, [wAudioRegister]
	add $02
	ld c, a
	xor a
	ld [$ff00+c], a ; volume/envelope
	inc c
	ld [$ff00+c], a ; period
	inc c
	ld [$ff00+c], a
	ret
.asm_f8555
	ld b, a
	ld a, [wAudioChannel]
	cp CH_NOISE
	jr z, .noise_channel
	ld a, [wc907]
	add CHANNELSTRUCT_ENVELOPES
	push af
	ld a, l
	and $c0
	ld l, a
	pop af
	add l
	ld l, a
	ld a, [wAudioRegister]
	add $02
	ld c, a
	ld a, [hl]
	ld [$ff00+c], a ; volume/envelope
	inc c
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_BASE_NOTE
	or l
	ld l, a
	ld a, [hl]
	add b ; note
	push hl
	add a
	ld e, a
	ld hl, NoteFrequencies
	ld d, $00
	add hl, de
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [wAudioChannel]
	cp CH_WAVE
	jr nz, .check_channel_1
; wave channel
	xor a ; AUD3ENA_OFF
	ldh [rAUD3ENA], a
	nop
	nop
	nop
	ld a, AUD3ENA_ON
	ldh [rAUD3ENA], a
	jr .period_high
.check_channel_1
	and a ; cp CH_PULSE1
	jr nz, .period_high
	ld a, [wCurAudioConfigSweep]
	ldh [rAUD1SWEEP], a
.period_high
	ld a, [hl]
	or AUD1HIGH_RESTART ; AUD2HIGH_RESTART, AUD4GO_RESTART
	ld [$ff00+c], a
	pop hl
	ret

.noise_channel
	ld a, [wc907]
	add CHANNELSTRUCT_ENVELOPES
	push af
	ld a, l
	and $c0
	ld l, a
	pop af
	add l
	ld l, a
	ld a, [hl]
	ldh [rAUD4ENV], a
	ld a, l
	and $c0
	ld l, CHANNELSTRUCT_UNK25
	or l
	ld l, a
	ld a, [hl]
	add a
	add a
	add a ; *8
	ld b, a
	ld a, [wCurAudioConfigPolyDiv]
	or b
	ldh [rAUD4POLY], a
	ld a, AUD4GO_RESTART
	ldh [rAUD4GO], a
	ret
