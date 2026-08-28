	dw BANK(@)
	
	farcall_table_start
	farfunc $4016
	farfunc Func_3c006

Func_3c006:
	push af
	ld a, $00
	ld [$cd1f], a
	pop af
	ret
; 0x3c00e
