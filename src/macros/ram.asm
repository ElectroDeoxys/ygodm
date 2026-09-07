MACRO? save_data_struct
\1Unk_ce99::          ds $04
\1Unk_cfaf::          ds $04
\1Unk_cfb7::          ds $01
\1Unk_cfdf::          ds $02
\1PlayerDeck::        ds DECK_SIZE * $2
\1Trunk::             ds NUM_CARDS
\1DuelistDuelCounts:: ds NUM_DUELISTS * $2
\1DuelistWinCounts::  ds NUM_DUELISTS * $2
\1Unk_cf99::          ds $08
\1Unk_b800::          ds $c8
\1Unk_b8c8::          ds $c8
\1Unk_b990::          ds $c8
\1Unk_ba58::          ds $c8
	ds $6c2
\1Checksum::          dw
ENDM
