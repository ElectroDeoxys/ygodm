	CHARMAP " ",  $00

	; numeral characters
	CHARMAP "0",  $01
	CHARMAP "1",  $02
	CHARMAP "2",  $03
	CHARMAP "3",  $04
	CHARMAP "4",  $05
	CHARMAP "5",  $06
	CHARMAP "6",  $07
	CHARMAP "7",  $08
	CHARMAP "8",  $09
	CHARMAP "9",  $0a

	; hiragana characters
	CHARMAP "あ",         $0b
	CHARMAP "い",         $0c
	CHARMAP "う",         $0d
	CHARMAP "え",         $0e
	CHARMAP "お",         $0f
	CHARMAP "か",         $10
	CHARMAP "き",         $11
	CHARMAP "く",         $12
	CHARMAP "け",         $13
	CHARMAP "こ",         $14
	CHARMAP "さ",         $15
	CHARMAP "し",         $16
	CHARMAP "す",         $17
	CHARMAP "せ",         $18
	CHARMAP "そ",         $19
	CHARMAP "た",         $1a
	CHARMAP "ち",         $1b
	CHARMAP "つ",         $1c
	CHARMAP "て",         $1d
	CHARMAP "と",         $1e
	CHARMAP "な",         $1f
	CHARMAP "に",         $20
	CHARMAP "ぬ",         $21
	CHARMAP "ね",         $22
	CHARMAP "の",         $23
	CHARMAP "は",         $24
	CHARMAP "ひ",         $25
	CHARMAP "ふ",         $26
	CHARMAP "へ",         $27
	CHARMAP "ほ",         $28
	CHARMAP "ま",         $29
	CHARMAP "み",         $2a
	CHARMAP "む",         $2b
	CHARMAP "め",         $2c
	CHARMAP "も",         $2d
	CHARMAP "や",         $2e
	CHARMAP "ゆ",         $2f
	CHARMAP "よ",         $30
	CHARMAP "ら",         $31
	CHARMAP "り",         $32
	CHARMAP "る",         $33
	CHARMAP "れ",         $34
	CHARMAP "ろ",         $35
	CHARMAP "わ",         $36
	CHARMAP "を",         $37
	CHARMAP "ん",         $38
	CHARMAP "ぅ",         $39
	CHARMAP "ゃ",         $3a
	CHARMAP "ゅ",         $3b
	CHARMAP "ょ",         $3c

	; katakana characters
	CHARMAP "ア",         $3d
	CHARMAP "イ",         $3e
	CHARMAP "ウ",         $3f
	CHARMAP "エ",         $40
	CHARMAP "オ",         $41
	CHARMAP "カ",         $42
	CHARMAP "キ",         $43
	CHARMAP "ク",         $44
	CHARMAP "ケ",         $45
	CHARMAP "コ",         $46
	CHARMAP "サ",         $47
	CHARMAP "シ",         $48
	CHARMAP "ス",         $49
	CHARMAP "セ",         $4a
	CHARMAP "ソ",         $4b
	CHARMAP "タ",         $4c
	CHARMAP "チ",         $4d
	CHARMAP "ツ",         $4e
	CHARMAP "テ",         $4f
	CHARMAP "ト",         $50
	CHARMAP "ナ",         $51
	CHARMAP "ニ",         $52
	CHARMAP "ヌ",         $53
	CHARMAP "ネ",         $54
	CHARMAP "ノ",         $55
	CHARMAP "ハ",         $56
	CHARMAP "ヒ",         $57
	CHARMAP "フ",         $58
	CHARMAP "…",         $59
	CHARMAP "ホ",         $5a
	CHARMAP "マ",         $5b
	CHARMAP "ミ",         $5c
	CHARMAP "ム",         $5d
	CHARMAP "メ",         $5e
	CHARMAP "モ",         $5f
	CHARMAP "ヤ",         $60
	CHARMAP "ユ",         $61
	CHARMAP "ヨ",         $62
	CHARMAP "ラ",         $63
	CHARMAP "·",         $64
	CHARMAP "ル",         $65
	CHARMAP "レ",         $66
	CHARMAP "ロ",         $67
	CHARMAP "ワ",         $68
	CHARMAP "+",         $69
	CHARMAP "ン",         $6a
	CHARMAP "ァ",         $6b
	CHARMAP "ィ",         $6c
	CHARMAP "ッ",         $6d
	CHARMAP "ャ",         $6e
	CHARMAP "ュ",         $6f
	CHARMAP "ョ",         $70
	CHARMAP "゛",         $71
	CHARMAP "゜",         $72
	CHARMAP "-",         $73
	CHARMAP "!",         $74
	CHARMAP "?",         $75
	CHARMAP "ェ",         $76
	CHARMAP "ォ",         $77
	CHARMAP "▶",         $78
	CHARMAP "🗏",         $79
	CHARMAP "♥",         $7a
	CHARMAP "(",         $7b
	CHARMAP ")",         $7c

	; characters with diacritics
DEF DIACRITIC_CHAR EQU $7d
	CHARMAP "ヴ",        $7d
	CHARMAP "が",        $7e
	CHARMAP "ぎ",        $7f
	CHARMAP "ぐ",        $80
	CHARMAP "げ",        $81
	CHARMAP "ご",        $82
	CHARMAP "ざ",        $83
	CHARMAP "じ",        $84
	CHARMAP "ず",        $85
	CHARMAP "ぜ",        $86
	CHARMAP "ぞ",        $87
	CHARMAP "だ",        $88
	CHARMAP "ぢ",        $89
	CHARMAP "づ",        $8a
	CHARMAP "で",        $8b
	CHARMAP "ど",        $8c
	CHARMAP "ば",        $8d
	CHARMAP "び",        $8e
	CHARMAP "ぶ",        $8f
	CHARMAP "べ",        $90
	CHARMAP "ぼ",        $91
	CHARMAP "ガ",        $92
	CHARMAP "ギ",        $93
	CHARMAP "グ",        $94
	CHARMAP "ゲ",        $95
	CHARMAP "ゴ",        $96
	CHARMAP "ザ",        $97
	CHARMAP "ジ",        $98
	CHARMAP "ズ",        $99
	CHARMAP "ゼ",        $9a
	CHARMAP "ゾ",        $9b
	CHARMAP "ダ",        $9c
	CHARMAP "ヂ",        $9d
	CHARMAP "ヅ",        $9e
	CHARMAP "デ",        $9f
	CHARMAP "ド",        $a0
	CHARMAP "バ",        $a1
	CHARMAP "ビ",        $a2
	CHARMAP "ブ",        $a3
	CHARMAP "<べ>",      $a4
	CHARMAP "ボ",        $a5

	CHARMAP "ぱ",        $a6
	CHARMAP "ぴ",        $a7
	CHARMAP "ぷ",        $a8
	CHARMAP "ぺ",        $a9
	CHARMAP "ぽ",        $aa
	CHARMAP "パ",        $ab
	CHARMAP "ピ",        $ac
	CHARMAP "プ",        $ad
	CHARMAP "<ぺ>",      $ae
	CHARMAP "ポ",        $af

	; control characters
DEF CONTROL_CHAR EQU $b0

	CHARMAP "<LINE>",    $b0
	CHARMAP "<PROMPT>",  $b1
	CHARMAP "<B2>",      $b2
	CHARMAP "<B3>",      $b3
	CHARMAP "<DONE>",    $b4
	CHARMAP "<B5>",      $b5
	CHARMAP "<B6>",      $b6

	; text box tiles
	const_def $bb
	const SYM_WHITE              ; $bb
	const SYM_BLACK              ; $bc
	const SYM_BAR_HORIZONTAL     ; $bd
	const SYM_BAR_DAKUTEN        ; $be
	const SYM_BAR_HANDAKUTEN     ; $bf
	const SYM_CORNER_LOWER_RIGHT ; $c0
	const SYM_CORNER_LOWER_LEFT  ; $c1
	const SYM_BAR_LEFT           ; $c2
	const SYM_BAR_RIGHT          ; $c3
	const SYM_CORNER_UPPER_RIGHT ; $c4
	const SYM_CORNER_UPPER_LEFT  ; $c5
	const SYM_DAKUTEN            ; $c6
	const SYM_HANDAKUTEN         ; $c7
