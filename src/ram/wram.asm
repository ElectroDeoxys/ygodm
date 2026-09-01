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

wVBlankStruct:: ; c500
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

; size of wVBlankStruct in bytes
wVBlankStructSize:: db ; caaa
wPendingVBlankMode:: db ; caab
wVBlankMode:: db ; caac

	ds $3

wPlayerLP:: dw ; cab0
	ds $1
wOppLP:: dw ; cab3
	ds $1

	ds $cae2 - $cab6

wCardID_cae2:: dw ; cae2

wTrunk:: ; cae4
	ds NUM_CARDS

	ds $9

wPlayerDeckIndex:: db ; cc5a
wPlayerDeck:: ds DECK_SIZE * $2 ; cc5b

wOppDuelDeckIndex:: db ; ccab
wOppDuelDeck:: ds DECK_SIZE * $2 ; ccac

	ds $cd0f - $ccfc

wLoadedCardID::   dw ; cd0f
	ds $2
wLoadedCardAtk::  dw ; cd13
wLoadedCardDef::  dw ; cd15
wLoadedCardType:: db ; cd17

	ds $cd50 - $cd18

wNPCCharacter:: db ; cd50

	ds $cd5e - $cd51

wcd5e:: db ; cd5e
wcd5f:: db ; cd5f

	ds $cd63 - $cd60

wPlayerDuelDeckIndex:: db ; cd63
wPlayerDuelDeck:: ds DECK_SIZE * $2 ; cd64

wOppHand::     ds HAND_SIZE  * $3 ; cdb4
wOppField::    ds FIELD_SIZE * $3 ; cdc3
wPlayerField:: ds FIELD_SIZE * $3 ; cdd2
wPlayerHand::  ds HAND_SIZE  * $3 ; cde1

wCardLocationIndex:: db ; cdf0
wCardLocation:: db ; cdf1
wTempCardID:: dw ; cdf2

	ds $ce97 - $cdf4

wce97:: db ; ce97
wce98:: db ; ce98

wce99:: db ; ce99
wce9a:: db ; ce9a
wce9b:: db ; ce9b
wce9c:: db ; ce9c
wRandRangeStart:: db ; ce9d
wRandRangeEnd:: db ; ce9e
wRandNum:: db ; ce9f

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
