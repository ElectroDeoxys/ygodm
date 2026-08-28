	dw BANK(@)

DecompressJob::
.wait_1
	call YieldJob
	call TestJobFlag
	db $01, LOW(hDecompressJobFlags)
	jr z, .wait_1
.loop
	call Func_180f
	ld d, a
	call Func_180f
	ld c, a
	call Func_180f
	ld b, a
	call Func_187b
	call Func_188a
	call SetJobFlag
	db $04, LOW(hVBlankJobFlags)
	call ActivateJob
	db JOB_MAIN
	call ResetJobFlag
	db $01, LOW(hDecompressJobFlags)
.wait_2
	call YieldJob
	call TestJobFlag
	db $01, LOW(hDecompressJobFlags)
	jr z, .wait_2
	jr .loop
; 0x1c038
