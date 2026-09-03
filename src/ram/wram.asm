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

wcaa0:: db ; caa0
wcaa1:: db ; caa1
wcaa2:: db ; caa2
wcaa3:: db ; caa3
wcaa4:: db ; caa4

wJoypadDown::    db ; caa5
wJoypadPressed:: db ; caa6
wcaa7:: db ; caa7
wcaa8:: db ; caa8
wcaa9:: db ; caa9

; size of wVBlankStruct in bytes
wVBlankStructSize:: db ; caaa
wPendingVBlankMode:: db ; caab
wVBlankMode:: db ; caac

wcaad:: db ; caad
wcaae:: db ; caae
wcaaf:: db ; caaf

wPlayerLP:: dw ; cab0
wcab2::     db ; cab2
wOppLP::    dw ; cab3
wcab5::     db ; cab5

	ds $cad1 - $cab6

wActiveField:: db ; cad1

	ds $cae2 - $cad2

wCardID_cae2:: dw ; cae2

wTrunk:: ; cae4
	ds NUM_CARDS

	ds $9

wPlayerDeckIndex:: db ; cc5a
wPlayerDeck:: ds DECK_SIZE * $2 ; cc5b

wOppDuelDeckIndex:: db ; ccab
wOppDuelDeck:: ds DECK_SIZE * $2 ; ccac

	ds $1

wccfd:: db ; ccfd
wBeatGame:: db ; ccfe

	ds $cd0f - $ccff

wLoadedCardID::   dw ; cd0f
wLoadedCardLocationIndex:: db ; cd11
wLoadedCardLocation:: db ; cd12
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

	ds $ce0a - $cdf4

wHealLPAmount:: dw ; ce0a
	ds $2
wDamageLPAmount:: dw ; ce0e

	ds $ce17 - $ce10

wce17:: ; ce17
	ds $80

wce97:: db ; ce97
wce98:: db ; ce98

wce99:: db ; ce99
wce9a:: db ; ce9a
wce9b:: db ; ce9b
wce9c:: db ; ce9c
wRandRangeStart:: db ; ce9d
wRandRangeEnd:: db ; ce9e
wRandNum:: db ; ce9f

	ds $cecb - $cea0

wMaterial1CardID:: dw ; cecb
wMaterial2CardID:: dw ; cecd
wFusionCardID::    dw ; cecf

	ds $cee7 - $ced1

wAIOppHandTargetCardID::        dw ; cee7
wAIOppHandTargetCardIndex::     db ; cee9
wAIOppHandTargetCardLocation::  db ; ceea
wAIOppFieldTargetCardID::       dw ; ceeb
wAIOppFieldTargetZoneIndex::    db ; ceed
wAIOppFieldTargetZoneLocation:: db ; ceee

wNPCDuelist:: db ; ceef

wCardID_cef0:: dw ; cef0
wcef2:: db ; cef2
	ds $4
wCardLocationIndex_cef7:: db ; cef7
wcef8:: db ; cef8
wCardID_cef9:: dw ; cef9
	ds $5
wcf00:: db ; cf00
wcf01:: db ; cf01

	ds $cf4e - $cf02

; duel and win counts against each of the NPC duelists
wDuelistDuelCounts:: ; cf4e
	ds NUM_DUELISTS * 2
wDuelistWinCounts:: ; cf70
	ds NUM_DUELISTS * 2

	ds $d9fe - $cf92

wJob4Stack:: ; d9fe
	ds $100
wJob4StackBottom:: ; dafe

wDecompressJobStack:: ; dafe
	ds $100
wDecompressJobStackBottom:: ; dbfe

wAudioJobStack:: ; dbfe
	ds $100
wAudioJobStackBottom:: ; dcfe

wStack::
	ds $302
wStackBottom:: ; e000
