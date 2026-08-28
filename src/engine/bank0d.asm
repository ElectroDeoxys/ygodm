	dw BANK(@)
	
	farcall_table_start
	farfunc $400c
	farfunc $6e68
	farfunc $6e34
	farfunc Func_3708e
	farfunc $70e6

SECTION "Bank 0d@708e", ROMX[$708e], BANK[$0d]

Func_3708e:
	push af
	ld a, $00
	ld [$cfdf], a
	ld a, $00
	ld [$cfe0], a
	pop af
	ret
; 0x3709b

