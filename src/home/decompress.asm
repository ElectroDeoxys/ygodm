Func_17ab::
	push af
	push bc
	push de
	ld a, [wccff]
	ld e, a
.asm_17b2
	ld a, [wcd00]
	cp e
	jr nz, .asm_17c9
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_DECOMPRESS
	call YieldJob
	jr .asm_17b2
.asm_17c9
	ld d, HIGH(wc600)
	ld c, $8 tiles
.asm_17cd
	ld a, [de]
	ld [hli], a
	inc e
	dec c
	jr nz, .asm_17cd
	ld a, e
	ld [wccff], a
	pop de
	pop bc
	pop af
	ret

Func_17db:
	push af
	push bc
	push de
	ld a, [wcd00]
	ld e, a
	ld a, $80
	add e
	ld c, a
.loop
	ld a, [wccff]
	cp c
	jr nz, .asm_17fd
	call SetJobFlag
	db $04, LOW(hVBlankJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_MAIN
	call YieldJob
	jr .loop
.asm_17fd
	ld d, HIGH(wc600)
	ld c, $8 tiles
.asm_1801
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .asm_1801
	ld a, e
	ld [wcd00], a
	pop de
	pop bc
	pop af
	ret

Func_180f::
	push de
	push hl
	ld a, [wcd09]
	ld e, a
.loop
	ld a, [wcd0a]
	cp e
	jr nz, .asm_182c
	call SetJobFlag
	db $04, LOW(hVBlankJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_MAIN
	call YieldJob
	jr .loop

.asm_182c
	ld d, $00
	ld hl, wcd01
	add hl, de
	inc e
	ld a, e
	cp $08
	jr nz, .asm_183a
	ld e, $00
.asm_183a
	ld a, e
	ld [wcd09], a
	ld a, [hli]
	pop hl
	pop de
	ret

Func_1842::
	push af
	push bc
	push de
	push hl
	push af
	ld d, $00
	ld a, [wcd0a]
	ld e, a
	ld hl, wcd01
	add hl, de
	inc e
	ld a, e
	cp $08
	jr nz, .asm_1859
	ld e, $00
.asm_1859
	ld a, [wcd09]
	cp e
	jr nz, .asm_1870
	call SetJobFlag
	db $01, LOW(hDecompressJobFlags)
	call Func_171c
	call ActivateJob
	db JOB_DECOMPRESS
	call YieldJob
	jr .asm_1859
.asm_1870
	pop af
	ld [hli], a
	ld a, e
	ld [wcd0a], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_187b::
	push af
	ld a, d
	ld [wcd0b], a
	ld a, c
	ld [wcd0c], a
	ld a, b
	ld [wcd0d], a
	pop af
	ret

Func_188a::
	push af
	push bc
	push hl
	ld a, [rRAMB]
	push af
	ld b, $00
	ld a, [wcd0b]
	ld c, a
	sla c
	ld hl, .Jumptable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call_hl
	pop af
	call Bankswitch2
	pop hl
	pop bc
	pop af
	ret

.Jumptable:
	dw Func_18b1
	dw Func_1a5e

Func_18b1:
	call Func_18b8
	call Func_1afd
	ret

Func_18b8:
	push af
	push bc
	push de
	push hl
	call Func_1aaf
	ld a, BANK(Func_40002)
	call Bankswitch1
	ld a, [wcd0c]
	ld c, a
	ld a, [wcd0d]
	ld b, a
	ld a, [wcd0b]
	ld d, a
	push bc
	call Func_40002
	call SetDecompressSource
	ld a, $01
	call Func_1af9
	ld bc, $50 tiles
	call SetDecompressLength
	pop bc
	ld hl, CardGraphicsBanks
	add hl, bc
	ld a, [hl]
	call Bankswitch1
	pop hl
	pop de
	pop bc
	pop af
	ret

INCLUDE "data/card_gfx_banks.asm"

Func_1a5e:
	call Func_1a65
	call Func_1afd
	ret

Func_1a65:
	push af
	push bc
	push de
	push hl
	call Func_1aaf
	ld a, BANK(Func_40002)
	call Bankswitch1
	ld a, [wcd0c]
	ld c, a
	ld a, [wcd0d]
	ld b, a
	ld a, [wcd0b]
	ld d, a
	push bc
	call Func_40002
	call SetDecompressSource
	ld a, $01
	call Func_1af9
	ld bc, $c0 tiles
	call SetDecompressLength
	pop bc
	ld hl, CharacterGfxBanks
	add hl, bc
	ld a, [hl]
	call Bankswitch1
	pop hl
	pop de
	pop bc
	pop af
	ret

INCLUDE "data/character_gfx_banks.asm"

Func_1aaf:
	push af
	push bc
	push de
	push hl

	; prepares lookback buffer
	ld hl, wDecompressLookbackBuffer
	ld de, wDecompressLookbackBuffer + 1
	ld [hl], $20
	ld bc, $3dd
.asm_1abe
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1abe
.asm_1ac4
	ld c, $00
.asm_1ac6
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1ac6
	dec b
	jr nz, .asm_1ac4

	ld a, $80
	ldh [hDecompressBufferSize], a

	ld bc, wDecompressBuffer
	call SetDecompressDestination
	pop hl
	pop de
	pop bc
	pop af
	ret

; input:
; - bc = pointer to compressed data to decompress
SetDecompressSource:
	push af
	ld a, c
	ldh [hDecompressSource + 0], a
	ld a, b
	ldh [hDecompressSource + 1], a
	pop af
	ret

; input:
; - bc = pointer to address where decompressed data
;        should be output
SetDecompressDestination:
	push af
	ld a, c
	ldh [hDecompressDest + 0], a
	ld a, b
	ldh [hDecompressDest + 1], a
	pop af
	ret

; input:
; - bc = length of decompressed data
SetDecompressLength:
	push af
	ld a, c
	ldh [hDecompressLen + 0], a
	ld a, b
	ldh [hDecompressLen + 1], a
	pop af
	ret

Func_1af9:
	ld [wcd0e], a
	ret

Func_1afd:
	push af
	ld a, [wcd0e]
	dec a
	jr nz, .asm_1b09
	call Decompress
	jr .asm_1b0c
.asm_1b09
	call Func_1b0e
.asm_1b0c
	pop af
	ret

Func_1b0e:
	push af
	push bc
	push hl
	ldh a, [hDecompressSource + 0]
	ld l, a
	ldh a, [hDecompressSource + 1]
	ld h, a
	ld c, $0a
.asm_1b19
	call Func_17db
	dec c
	jr nz, .asm_1b19
	pop hl
	pop bc
	pop af
	ret

; compressed data has a simple lookback mechanism
; first a command byte is read, and each bit is iterated
; from least significant to most significant, if the bit:
; - is set, then copy the next byte;
; - is unset, then next 2 bytes encode the lookback address
;   and its length (%ZZZZZZZZ %YYY_XXXXX, where %XXXXX + 3 is the length
;   and %YYYZZZZZZZZ is the offset in wDecompressLookbackBuffer);
Decompress:
	push af
	push bc
	push de
	push hl
	ld de, wDecompressLookbackBuffer + $3de
	ld c, $80
.next_cmd
	call .ReadByte
	ld c, a
	ld b, 8 ; bits
.read_cmd_bit
	rr c
	jr nc, .lookback
; literal copy
	call .ReadByte
	call .WriteByte
	jr c, .done
	ld [de], a
	inc e
	jr nz, .done_literal_copy
	inc d
	ld a, d
	cp HIGH(wDecompressLookbackBufferEnd)
	jr nz, .done_literal_copy
	; wrap back to beginning
	ld d, HIGH(wDecompressLookbackBuffer)
.done_literal_copy
	jr .next_cmd_bit

.lookback
	push bc
	call .ReadByte
	ld l, a
	call .ReadByte
	ld h, a
	and $1f
	add 3
	ld c, a ; length
	ld a, h
	swap a
	rrca
	and $03
	add HIGH(wDecompressLookbackBuffer)
	ld h, a
.loop_lookback
	ld a, [hl]
	call .WriteByte
	jr nc, .asm_1b6d
	; discard push bc
	add sp, $02
	jr .done
.asm_1b6d
	ld [de], a
	inc l
	jr nz, .asm_1b79
	inc h
	ld a, h
	cp HIGH(wDecompressLookbackBufferEnd)
	jr nz, .asm_1b79
	ld h, HIGH(wDecompressLookbackBuffer)
.asm_1b79
	inc e
	jr nz, .asm_1b84
	inc d
	ld a, d
	cp HIGH(wDecompressLookbackBufferEnd)
	jr nz, .asm_1b84
	ld d, HIGH(wDecompressLookbackBuffer)
.asm_1b84
	dec c
	jr nz, .loop_lookback
	pop bc
.next_cmd_bit
	dec b
	jr nz, .read_cmd_bit
	jr .next_cmd

.done
	pop hl
	pop de
	pop bc
	pop af
	ret

.ReadByte:
	push hl
	ldh a, [hDecompressSource + 0]
	add LOW($1)
	ldh [hDecompressSource + 0], a
	ld l, a
	ldh a, [hDecompressSource + 1]
	adc HIGH($1)
	ldh [hDecompressSource + 1], a
	ld h, a
	dec hl
	ld a, [hl]
	pop hl
	ret

.WriteByte:
	push bc
	push de
	push hl

	; write byte to output
	ld d, a
	ldh a, [hDecompressDest + 0]
	add LOW($1)
	ldh [hDecompressDest + 0], a
	ld l, a
	ldh a, [hDecompressDest + 1]
	adc HIGH($1)
	ldh [hDecompressDest + 1], a
	ld h, a
	dec hl
	ld a, d
	ld [hl], a

	ld hl, hDecompressBufferSize
	dec [hl]
	jr nz, .asm_1bcd
	ld [hl], $80
	ld hl, wDecompressBuffer
	ld b, h
	ld c, l
	call Func_17db
	call SetDecompressDestination
.asm_1bcd
	ldh a, [hDecompressLen + 0]
	ld l, a
	ldh a, [hDecompressLen + 1]
	ld h, a
	dec hl
	ld a, l
	ldh [hDecompressLen + 0], a
	ld a, h
	ldh [hDecompressLen + 1], a
	ld a, h
	or l
	jr nz, .asm_1bdf
	scf
.asm_1bdf
	ld a, d
	pop hl
	pop de
	pop bc
	ret
