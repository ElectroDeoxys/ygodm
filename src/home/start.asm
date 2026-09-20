_Start:
	ldh [hBootUpA], a

	; set stack
	ld hl, wStackBottom
	ld sp, hl

	call SetBankingMode
	farcall Func_10477
	ld a, SGBFUNC_0
	farcall ExecuteSGBFunction
	farcall InitAudio
	call InitTransferVirtualOAM
	call Func_396
	call Func_dd8
	call Func_19f

	ld a, SGBFUNC_2
	farcall ExecuteSGBFunction
	farcall Func_6595
	ld a, SGBFUNC_4
	farcall ExecuteSGBFunction
	farcall Func_65c4
	ld a, SGBFUNC_6
	farcall ExecuteSGBFunction
	call EnableVBlank
	farcall Func_65f3

	; enter main game loop
	farcall GameLoop

	; breaking from GameLoop means we just beat the game
	call Func_1724
	ld a, VBLANK_16
	call SetPendingVBlankMode
	call RequestVBlankMode
	call Func_2d1f
	debug_loop

	ret ; stray ret
