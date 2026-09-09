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

wTextArg::      dw ; cab6
wTextLoadMode:: db ; cab8
wTextBuffer::   ds $14 ; cab9
wTextLength::   db ; cacd
wcace::         db ; cace
wCharHeadTile:: db ; cacf
wCharTile::     db ; cad0

wActiveField:: db ; cad1

wcad2:: dw ; cad2

wcad4:: db ; cad4
wcad5:: db ; cad5
wcad6:: db ; cad6
wcad7:: db ; cad7
wcad8:: db ; cad8
wcad9:: db ; cad9

wcada:: dw ; cada

wHexNumber:: dw ; cadc

	ds $cae2 - $cade

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

	ds $cd1f - $cd18

wcd1f:: db ; cd1f

	ds $cd44 - $cd20

wcd44:: db ; cd44
wcd45:: db ; cd45
wcd46:: db ; cd46
wcd47:: db ; cd47
wcd48:: dw ; cd48
wTextLine:: db ; cd4a
wcd4b:: db ; cd4b
wcd4c:: db ; cd4c
wcd4d:: db ; cd4d
wcd4e:: db ; cd4e
wcd4f:: db ; cd4f

wNPCCharacter:: db ; cd50
wDialogueID:: db ; cd51

	ds $cd5e - $cd52

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

	ds $cf16 - $cf02

wcf16:: db ; cf16
wcf17:: db ; cf17

	ds $cf4e - $cf18

; duel and win counts against each of the NPC duelists
wDuelistDuelCounts:: ; cf4e
	ds NUM_DUELISTS * 2
wDuelistWinCounts:: ; cf70
	ds NUM_DUELISTS * 2

	ds $cfa0 - $cf92

wcfa0:: db ; cfa0
wcfa1:: ds $8 ; cfa1
wcfa9:: db ; cfa9
wcfaa:: db ; cfaa
wcfab:: db ; cfab
wcfac:: db ; cfac
	ds $2
wcfaf:: db ; cfaf

	ds $d9fe - $cfb0

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
