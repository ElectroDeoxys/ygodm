ClearOAM::
	push af
	push bc
	push hl
	ld hl, wVirtualOAM
	ld c, OAM_COUNT
.loop
	ld a, -1
	ld [hli], a ; y
	ld a, -1
	ld [hli], a ; x
	ld a, $00
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes
	dec c
	jr nz, .loop
	pop hl
	pop bc
	pop af
	ret

; copy wVirtualOAM directly to OAM
; this must be done during V-Blank or H-Blank
CopyOAMDirect::
	push af
	push bc
	push de
	push hl
	ld hl, wVirtualOAM
	ld de, $fe00 ; OAM
	ld c, OAM_SIZE
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .loop
	pop hl
	pop de
	pop bc
	pop af
	ret

; input:
; - c = OAM index
; - a = y
; - d = x
; - b = tile ID
Func_123c::
	push af
	push bc
	push hl
	push bc
	sla c
	sla c
	ld b, $00
	ld hl, wVirtualOAM
	add hl, bc
	pop bc
	ld [hli], a ; y
	ld a, d
	ld [hli], a ; x
	ld a, b
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes
	pop hl
	pop bc
	pop af
	ret

Func_1256::
	push af
	push bc
	push de
	push hl
	ld a, $b0
	ld [wcd1c], a
	ld a, $b0
	ld [wcd1b], a
	ld hl, wVirtualOAM + OAMA_TILEID
	ld a, $00
	ld de, OBJ_SIZE - 1
	lb bc, $2, OAM_COUNT
.asm_126f
	ld [hli], a ; tile ID
	add b
	ld [hl], $00 ; attributes
	add hl, de
	dec c
	jr nz, .asm_126f
	call Func_12a4
	call CopyOAMDirect
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_1282::
	call Func_1289
	call Func_12a4
	ret

Func_1289:
	push af
	push bc
	ld a, [wcd1d]
	ld b, a
	ld a, [wcd1b]
	add b
	ld [wcd1b], a
	ld a, [wcd1e]
	ld b, a
	ld a, [wcd1c]
	add b
	ld [wcd1c], a
	pop bc
	pop af
	ret

Func_12a4:
	push af
	push bc
	push de
	push hl
	ld hl, wVirtualOAM
	ld d, $00
	ld b, $05
.asm_12af
	ld e, $00
	ld c, $08
.asm_12b3
	ld a, [wcd1b]
	add d
	ld [hli], a ; y
	ld a, [wcd1c]
	add e
	ld [hli], a ; x
	inc hl
	inc hl
	ld a, $08
	add e
	ld e, a
	dec c
	jr nz, .asm_12b3
	ld a, $10
	add d
	ld d, a
	dec b
	jr nz, .asm_12af
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_12d2::
	call ClearOAM
	call CopyOAMDirect
	ret

Func_12d9::
	push af
	push hl
	push de
	ld d, $00
	ld hl, wVirtualOAM
	add hl, de
	pop de

	ld a, c
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	ld a, d
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes

	ld a, c
	ld [hli], a ; y
	ld a, b
	add 8
	ld [hli], a ; x
	ld a, d
	add 2
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes

	pop hl
	pop af
	ret

Func_12fb::
	call ClearOAM
	call CopyOAMDirect
	ret

Add4x4OAM::
	push af
	push hl
	push de
	ld d, $00
	sla e
	sla e
	ld hl, wVirtualOAM
	add hl, de
	pop de

	ld a, c
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	ld a, d
	ld [hli], a ; tile ID
	ld a, $00
	ld [hli], a ; attributes

	ld a, c
	ld [hli], a ; y
	ld a, b
	add 8
	ld [hli], a ; x
	ld a, d
	add 2
	ld [hli], a ; tile ID
	ld [hl], $00 ; attributes

	pop hl
	pop af
	ret

Func_1328::
	call ClearOAM
	ret

Func_132c::
	push af
	push hl
	push de
	ld d, $00
	dec e
	sla e
	sla e
	ld hl, wVirtualOAM
	add hl, de
	pop de
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $00
	ld [hli], a
	pop hl
	pop af
	ret
