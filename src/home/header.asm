; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0[$0000]
; unused
	di
	jp YieldJob

IF DEF(_MATCHING)
	db $00, $00, $88, $00
ENDC

SECTION "rst8", ROM0[$0008]
Farcall::
	jp _Farcall

IF DEF(_MATCHING)
	db $00, $03, $00, $00, $00
ENDC

SECTION "rst10", ROM0[$0010]
	debug_loop

IF DEF(_MATCHING)
	db $00, $08, $14, $00, $00, $00
ENDC

SECTION "rst18", ROM0[$0018]
	debug_loop

IF DEF(_MATCHING)
	db $00, $00, $14, $01, $02, $00
ENDC

SECTION "rst20", ROM0[$0020]
	debug_loop

IF DEF(_MATCHING)
	db $12, $00, $20, $30, $09, $00
ENDC

SECTION "rst28", ROM0[$0028]
	debug_loop

IF DEF(_MATCHING)
	db $00, $00, $00, $80, $00, $00
ENDC

SECTION "rst30", ROM0[$0030]
	debug_loop

IF DEF(_MATCHING)
	db $00, $00, $00, $00, $04, $10
ENDC

SECTION "rst38", ROM0[$0038]
	debug_loop

IF DEF(_MATCHING)
	db $F0, $00, $18, $80, $44, $00
ENDC

; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

IF DEF(_MATCHING)
	db $00, $00, $10, $08, $00
ENDC

SECTION "lcd", ROM0[$0048]
	debug_loop

IF DEF(_MATCHING)
	db $02, $00, $11, $22, $09, $00
ENDC

SECTION "timer", ROM0[$0050]
	jp Timer

IF DEF(_MATCHING)
	db $08, $44, $00, $10, $40
ENDC

SECTION "serial", ROM0[$0058]
	jp Serial

IF DEF(_MATCHING)
	db $01, $08, $05, $10, $40
ENDC

SECTION "joypad", ROM0[$0060]
	debug_loop

IF DEF(_MATCHING)
	db $00, $00, $41, $11, $90, $10, $11, $00, $00, $00, $00, $01, $42, $00
ENDC

bankfill "data/bank_fill/header.bin"

SECTION "Header", ROM0[$0100]

Start::
	nop
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00

ENDSECTION
