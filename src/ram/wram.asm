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

wChannels::
wMusicChannels::
wChannel1:: ds CHANNEL_STRUCT_SIZE ; c700
wChannel2:: ds CHANNEL_STRUCT_SIZE ; c740
wChannel3:: ds CHANNEL_STRUCT_SIZE ; c780
wChannel4:: ds CHANNEL_STRUCT_SIZE ; c7c0
wSFXChannels::
wChannel5:: ds CHANNEL_STRUCT_SIZE ; c800
wChannel6:: ds CHANNEL_STRUCT_SIZE ; c840
wChannel7:: ds CHANNEL_STRUCT_SIZE ; c880
wChannel8:: ds CHANNEL_STRUCT_SIZE ; c8c0

wAudioChannel:: db ; c900
wAudioRegister:: db ; c901

wc902:: ds NUM_MUSIC_CHANNELS ; aka NUM_SFX_CHANNELS c902
wc906:: db ; c906
wc907:: db ; c907
wc908:: db ; c908
	ds $1
wVolume:: db ; c90a
wChannelMixer:: db ; c90b

wCurAudioConfig::   audio_config_struct wCurAudioConfig
wSFXAudioConfig::   audio_config_struct wSFXAudioConfig
wMusicAudioConfig:: audio_config_struct wMusicAudioConfig

wc91e:: db ; c91e
wc91f:: db ; c91f

wPendingSound:: db ; c920

SECTION "WRAM Virtual OAM", WRAM0

wVirtualOAM:: ; ca00
	ds OAM_SIZE

SECTION "WRAM 2", WRAM0

wSerialWaiting:: db ; caa0
wcaa1:: db ; caa1
wSerialReceive:: db ; caa2
wcaa3:: db ; caa3
wSerialConnection:: db ; caa4

wJoypadDown::    db ; caa5
wJoypadPressed:: db ; caa6
wcaa7:: db ; caa7
wcaa8:: db ; caa8
wcaa9:: db ; caa9

; size of wVBlankStruct in bytes
wVBlankStructSize:: db ; caaa
wPendingVBlankMode:: db ; caab
wVBlankMode:: db ; caac

wSerialTimeOut:: dw ; caad
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

wcade:: db ; cade
wcadf:: db ; cadf
wcae0:: db ; cae0
wcae1:: db ; cae1

wCardID_cae2:: dw ; cae2

wTrunk:: ; cae4
	ds NUM_CARDS

wcc51:: db ; cc51
wcc52:: db ; cc52
wcc53:: db ; cc53
wcc54:: db ; cc54
wcc55:: db ; cc55
wcc56:: db ; cc56
wcc57:: db ; cc57
wcc58:: db ; cc58
wcc59:: db ; cc59

wPlayerDeckIndex:: db ; cc5a
wPlayerDeck:: ds DECK_SIZE * $2 ; cc5b

wOppDuelDeckIndex:: db ; ccab
wOppDuelDeck:: ds DECK_SIZE * $2 ; ccac

	ds $1

wDuelPrepSelection:: db ; ccfd

; if TRUE, then exit main game loop
; and start credits
wBeatCampaign:: db ; ccfe

wccff:: db ; ccff

wcd00:: db ; cd00
wcd01:: db ; cd01

	ds $7

wcd09:: db ; cd09
wcd0a:: db ; cd0a
wcd0b:: db ; cd0b
wcd0c:: db ; cd0c
wcd0d:: db ; cd0d
wcd0e:: db ; cd0e

wLoadedCardID::   dw ; cd0f
wLoadedCardLocationIndex:: db ; cd11
wLoadedCardLocation:: db ; cd12
wLoadedCardAtk::  dw ; cd13
wLoadedCardDef::  dw ; cd15
wLoadedCardType:: db ; cd17

	ds $1

wcd19:: db ; cd19
wcd1a:: db ; cd1a
wcd1b:: db ; cd1b
wcd1c:: db ; cd1c
wcd1d:: db ; cd1d
wcd1e:: db ; cd1e
wcd1f:: db ; cd1f

wcd20:: ds $12 ; cd20
wcd32:: ds $12 ; cd32

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

wcd52:: db ; cd52
wcd53:: db ; cd53
wcd54:: db ; cd54
wcd55:: db ; cd55
wcd56:: db ; cd56
wcd57:: db ; cd57
	ds $1
wcd59:: db ; cd59
wcd5a:: db ; cd5a
wcd5b:: db ; cd5b
wcd5c:: db ; cd5c
	ds $1

wcd5e:: db ; cd5e
wcd5f:: db ; cd5f

wcd60:: db ; cd60
wcd61:: db ; cd61
wcd62:: db ; cd62

wPlayerDuelDeckIndex:: db ; cd63
wPlayerDuelDeck:: ds DECK_SIZE * $2 ; cd64

wOppHand::     ds HAND_SIZE  * $3 ; cdb4
wOppField::    ds FIELD_SIZE * $3 ; cdc3
wPlayerField:: ds FIELD_SIZE * $3 ; cdd2
wPlayerHand::  ds HAND_SIZE  * $3 ; cde1

wCardLocationIndex:: db ; cdf0
wCardLocation:: db ; cdf1
wTempCardID:: dw ; cdf2

wcdf4:: db ; cdf4
wcdf5:: db ; cdf5
wcdf6:: db ; cdf6
wcdf7:: db ; cdf7
wcdf8:: db ; cdf8
wcdf9:: db ; cdf9

wcdfa:: db ; cdfa
wcdfb:: db ; cdfb
wcdfc:: db ; cdfc
wcdfd:: db ; cdfd
wcdfe:: db ; cdfe
wcdff:: db ; cdff
wGameMode:: db ; ce00

wce01:: db ; ce01
wce02:: db ; ce02
wce03:: db ; ce03
wce04:: db ; ce04
wce05:: db ; ce05
wce06:: db ; ce06
wce07:: db ; ce07
wce08:: db ; ce08
wce09:: db ; ce09

wHealLPAmount:: dw ; ce0a
wce0c:: dw ; ce0c
wDamageLPAmount:: dw ; ce0e
wce10:: dw ; ce10

wce12:: db ; ce12
wce13:: db ; ce13
wce14:: db ; ce14
wce15:: db ; ce15
wce16:: db ; ce16

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

wMainMenuSelection:: db ; cea0

wCampaignStage:: db ; cea1

wcea2:: db ; cea2
wcea3:: db ; cea3

wcea4:: db ; cea4
wcea5:: ds 5 * $2 ; cea5

	ds $1

wceb0:: db ; ceb0
wceb1:: db ; ceb1
wceb2:: db ; ceb2
wceb3:: db ; ceb3
wceb4:: db ; ceb4
wceb5:: db ; ceb5
wceb6:: db ; ceb6
wceb7:: ds 5 * $2 ; ceb7

wcec1:: ds $a ; cec1

wMaterial1CardID:: dw ; cecb
wMaterial2CardID:: dw ; cecd
wFusionCardID::    dw ; cecf

wced1:: db ; ced1
wced2:: db ; ced2
wced3:: db ; ced3
wced4:: db ; ced4
wced5:: db ; ced5
wced6:: db ; ced6
wced7:: db ; ced7
wced8:: db ; ced8
wced9:: db ; ced9
wceda:: db ; ceda
wcedb:: db ; cedb
wcedc:: db ; cedc
wcedd:: db ; cedd
wcede:: db ; cede
wcedf:: db ; cedf
wcee0:: db ; cee0
wcee1:: db ; cee1
wcee2:: db ; cee2
wcee3:: db ; cee3
wcee4:: db ; cee4
wcee5:: db ; cee5
wcee6:: db ; cee6

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

wDuelStatus::      db ; cf02
wOtherDuelStatus:: db ; cf03

wcf04:: db ; cf04
wcf05:: db ; cf05
wcf06:: db ; cf06

	ds $9

wcf10:: db ; cf10
wcf11:: db ; cf11
wcf12:: db ; cf12
wcf13:: db ; cf13
wcf14:: db ; cf14
wcf15:: db ; cf15

wcf16:: db ; cf16
wcf17:: db ; cf17

wcf18:: db ; cf18
wcf19:: db ; cf19
wcf1a:: dw ; cf1a
wcf1c:: db ; cf1c

wcf1d:: ds $12 ; cf1d
wcf2f:: ds $12 ; cf2f

wcf41:: db ; cf41
wcf42:: db ; cf42
wcf43:: db ; cf43
wcf44:: db ; cf44
wcf45:: db ; cf45
wcf46:: db ; cf46
wcf47:: db ; cf47
wcf48:: db ; cf48
wcf49:: db ; cf49

	ds $2

wcf4c:: db ; cf4c
wcf4d:: db ; cf4d

; duel and win counts against each of the NPC duelists
wDuelistDuelCounts:: ; cf4e
	ds (NUM_DUELISTS - 1) * 2
wcf6e:: dw ; cf6e
wDuelistWinCounts:: ; cf70
	ds (NUM_DUELISTS - 1) * 2
wcf90:: dw ; cf90

wcf92:: db ; cf92
wcf93:: db ; cf93
wcf94:: db ; cf94
wcf95:: db ; cf95
wcf96:: db ; cf96
	ds $1
wcf98:: db ; cf98
wcf99:: db ; cf99
wcf9a:: db ; cf9a
wcf9b:: db ; cf9b
wcf9c:: db ; cf9c
wcf9d:: db ; cf9d
wcf9e:: db ; cf9e
wcf9f:: db ; cf9f

wcfa0:: db ; cfa0
wcfa1:: ds $8 ; cfa1
wcfa9:: db ; cfa9
wcfaa:: db ; cfaa
wcfab:: db ; cfab
wcfac:: db ; cfac
	ds $2
wcfaf:: db ; cfaf

wcfb0:: db ; cfb0
wcfb1:: db ; cfb1
wcfb2:: db ; cfb2

wcfb3:: db ; cfb3
wcfb4:: db ; cfb4
wcfb5:: db ; cfb5
wcfb6:: db ; cfb6

wcfb7:: db ; cfb7
wcfb8:: db ; cfb8
wcfb9:: db ; cfb9
wcfba:: db ; cfba
wcfbb:: db ; cfbb
wcfbc:: db ; cfbc

wcfbd:: db ; cfbd
wcfbe:: db ; cfbe
wcfbf:: db ; cfbf

wcfc0:: db ; cfc0
wcfc1:: db ; cfc1
wcfc2:: db ; cfc2
wcfc3:: db ; cfc3
wcfc4:: ds $12 ; cfc4

wcfd6:: db ; cfd6
wcfd7:: db ; cfd7
wcfd8:: db ; cfd8
wcfd9:: db ; cfd9
wcfda:: db ; cfda
wcfdb:: db ; cfdb
wcfdc:: db ; cfdc
wcfdd:: db ; cfdd
wcfde:: db ; cfde
wcfdf:: db ; cfdf

wcfe0:: db ; cfe0

wcfe1:: db ; cfe1
wcfe2:: db ; cfe2
wcfe3:: db ; cfe3
wcfe4:: db ; cfe4
wcfe5:: db ; cfe5
	ds $2
wcfe8:: db ; cfe8
wcfe9:: db ; cfe9
wcfea:: db ; cfea
wcfeb:: db ; cfeb
wcfec:: db ; cfec
wcfed:: db ; cfed
wcfee:: db ; cfee
wcfef:: db ; cfef
wcff0:: db ; cff0
wcff1:: db ; cff1

SECTION "WRAM Stacks", WRAM0

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
