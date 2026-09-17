DisableLCD::
	push af
	push hl
	ld hl, rLCDC
	bit B_LCDC_ENABLE, [hl]
	jr z, .lcd_off
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK + 2
	jr c, .wait_vblank
	res B_LCDC_ENABLE, [hl]
.lcd_off
	pop hl
	pop af
	ret

EnableLCD::
	push af
	push hl
	ld hl, rLCDC
	set B_LCDC_ENABLE, [hl]
	pop hl
	pop af
	ret

; sets configurations for:
; - rLCDC
; - rSTAT
; - rSCY
; - rSCX
; - rLYC
; - rBGP
; - rOBP0
; - rOBP1
; - rWY
; - rWX
SetScreenConfig::
	push af
	push bc
	push de
	push hl
	ld c, LOW(rLCDC)
	ld de, %1111010111110000
	ld b, $0c
.loop
	sla e
	rl d
	jr nc, .next
	ld a, [hli]
	ld [$ff00+c], a
.next
	inc c
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret
