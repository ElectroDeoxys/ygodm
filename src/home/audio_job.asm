AudioJob:
.loop
	ld a, [rRAMB]
	push af
	ld a, BANK(UpdateAudio)
	call Bankswitch1
	call UpdateAudio
	pop af
	call Bankswitch1
	call ResetJobFlag
	db $80, LOW(hAudioJobFlags)
.wait
	call YieldJob
	call TestJobFlag
	db $80, LOW(hAudioJobFlags)
	jr z, .wait
	jr .loop
	ret ; stray ret
