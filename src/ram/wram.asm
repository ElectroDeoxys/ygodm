SECTION "WRAM 1", WRAM0

wDecompressLookbackBuffer:: ; c000
	ds $400
wDecompressLookbackBufferEnd:: ; c400

	ds $12

; Decompress outputs data in $80 chunks
; each time this buffer is filled, it
; is copied over to wc600
wDecompressBuffer:: ; c412
	ds $80

	ds $6e

wc500:: ; c500
	ds $100

wc600:: ; c600
	ds $100

SECTION "WRAM Audio", WRAM0

	ds $221

SECTION "WRAM Virtual OAM", WRAM0

wVirtualOAM:: ; ca00
	ds OAM_SIZE

SECTION "WRAM 2", WRAM0

	ds $5

wJoypadDown::    db ; caa5
wJoypadPressed:: db ; caa6
wcaa7:: db ; caa7
wcaa8:: db ; caa8
wcaa9:: db ; caa9

wcaaa:: db ; caaa
wPendingVBlankMode:: db ; caab
wVBlankMode:: db ; caac

	ds $cd50 - $caad

wNPCCharacter:: db ; cd50

	ds $ce97 - $cd51

wce97:: db ; ce97
wce98:: db ; ce98

wce99:: db ; ce99
wce9a:: db ; ce9a
wce9b:: db ; ce9b
wce9c:: db ; ce9c
wce9d:: db ; ce9d
wce9e:: db ; ce9e
wce9f:: db ; ce9f

	ds $d9fe - $cea0

wJob4Stack:: ; d9fe
	ds $100
wJob4StackBottom:: ; dafe

wDecompressJobStack:: ; dafe
	ds $100
wDecompressJobStackBottom:: ; dbfe

wAudioJobStack:: ; dbfe
	ds $100
wAudioJobStackBottom:: ; dcfe
