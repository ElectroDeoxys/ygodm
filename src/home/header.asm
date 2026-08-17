SECTION "Header", ROM0[$0100]

Start::
	nop
	jp $150

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00

ENDSECTION
