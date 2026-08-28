	dw BANK(@)

Func_1c002::
.loop_1
	call Func_168f
	call Func_175a
	db $01, LOW(hffe6)
	jr z, .loop_1
.asm_1c00c
	call Func_180f
	ld d, a
	call Func_180f
	ld c, a
	call Func_180f
	ld b, a
	call Func_187b
	call Func_188a
	call Func_173e
	db $04, LOW(hffe4)
	call Func_1705
	db LOW(hffe0)
	call Func_177b
	db $01, LOW(hffe6)
.loop_2
	call Func_168f
	call Func_175a
	db $01, LOW(hffe6)
	jr z, .loop_2
	jr .asm_1c00c
; 0x1c038
