SetBankingMode:
	push af
	push hl
	ld hl, rRAMG + $1000
	ld [hl], RAMG_SRAM_ENABLE
	ld hl, rBMODE + $1000
	ld [hl], BMODE_SIMPLE
	pop hl
	pop af
	ret

Bankswitch1:
	push af
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei
	pop af
	ret

Bankswitch2:
	push af
	di
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a
	ei
	pop af
	ret
