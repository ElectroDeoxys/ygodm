; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0[$0000]
	di
	jp YieldJob

SECTION "rst8", ROM0[$0008]
Farcall::
	jp _Farcall

SECTION "rst10", ROM0[$0010]
	debug_loop

SECTION "rst18", ROM0[$0018]
	debug_loop

SECTION "rst20", ROM0[$0020]
	debug_loop

SECTION "rst28", ROM0[$0028]
	debug_loop

SECTION "rst30", ROM0[$0030]
	debug_loop

SECTION "rst38", ROM0[$0038]
	debug_loop


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

SECTION "lcd", ROM0[$0048]
	debug_loop

SECTION "timer", ROM0[$0050]
	jp Timer

SECTION "serial", ROM0[$0058]
	jp Serial

SECTION "joypad", ROM0[$0060]
	debug_loop

SECTION "Header", ROM0[$0100]

Start::
	nop
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00

ENDSECTION
