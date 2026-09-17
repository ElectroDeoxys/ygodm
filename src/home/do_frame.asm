DoFrame::
	push af
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait_vblank
.wait_end_vblank
	ldh a, [rLY]
	cp 0
	jr nz, .wait_end_vblank
	pop af
	ret

EnableObjects::
	push hl
	ld hl, rLCDC
	set B_LCDC_OBJS, [hl]
	pop hl
	ret

; unreferenced
Func_110c:
	push hl
	ld hl, rLCDC
	res B_LCDC_OBJS, [hl]
	pop hl
	ret
