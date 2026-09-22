; each AI deck is a weighted distribution of cards
; a card will have a given chance to be generated
; each time a card is sampled in GenerateAIOpponentDeck
DuelistDeckLists:
	table_width 2
	dw WeevilDeckList      ; WEEVIL
	dw MaiDeckList         ; MAI
	dw RexDeckList         ; REX
	dw MakoDeckList        ; MAKO
	dw YamiYugiDeckList    ; YAMI_YUGI
	dw YugiDeckList        ; YUGI
	dw TeaDeckList         ; TEA
	dw JoeyDeckList        ; JOEY
	dw SetoKaibaDeckList   ; SETO_KAIBA
	dw MokubaDeckList      ; MOKUBA
	dw TristanDeckList     ; TRISTAN
	dw BakuraDeckList      ; BAKURA
	dw PuppeteerDeckList   ; PUPPETEER
	dw PaniKDeckList       ; PANIK
	dw BanditKeithDeckList ; BANDIT_KEITH
	dw MaximillionDeckList ; MAXIMILLION
	dw SimonDeckList       ; SIMON
	assert_table_length NUM_CHARACTERS - 1

INCLUDE "data/decks/weevil.asm"
INCLUDE "data/decks/mai.asm"
INCLUDE "data/decks/rex.asm"
INCLUDE "data/decks/mako.asm"
INCLUDE "data/decks/yami_yugi.asm"
INCLUDE "data/decks/yugi.asm"
INCLUDE "data/decks/tea.asm"
INCLUDE "data/decks/joey.asm"
INCLUDE "data/decks/seto_kaiba.asm"
INCLUDE "data/decks/mokuba.asm"
INCLUDE "data/decks/tristan.asm"
INCLUDE "data/decks/bakura.asm"
INCLUDE "data/decks/puppeteer.asm"
INCLUDE "data/decks/panik.asm"
INCLUDE "data/decks/bandit_keith.asm"
INCLUDE "data/decks/maximillion.asm"
INCLUDE "data/decks/simon.asm"
