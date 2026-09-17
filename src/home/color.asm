Func_ff0::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $1b
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_fff::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $e4
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_100e::
	push af
	ld a, $1b
	ldh [rBGP], a
	ld a, $d2
	ldh [rOBP0], a
	ld a, $1b
	ldh [rOBP1], a
	pop af
	ret

Func_101d::
	push af
	ld a, $00
	ldh [rBGP], a
	ld a, $00
	ldh [rOBP0], a
	ld a, $00
	ldh [rOBP1], a
	pop af
	ret

Func_102c::
	push af
	ld a, $e0
	ldh [rOBP0], a
	pop af
	ret
