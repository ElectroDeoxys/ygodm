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
	CHARMAP "⋯",         $59
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
	CHARMAP "十",         $69
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
	CHARMAP "<゛>",         $7d
	CHARMAP "<゜>",         $7e

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

	; alphabet characters
	CHARMAP "A",         $0b
	CHARMAP "B",         $0c
	CHARMAP "C",         $0d
	CHARMAP "D",         $0e
	CHARMAP "E",         $0f
	CHARMAP "F",         $10
	CHARMAP "G",         $11
	CHARMAP "H",         $12
	CHARMAP "I",         $13
	CHARMAP "J",         $14
	CHARMAP "K",         $15
	CHARMAP "L",         $16
	CHARMAP "M",         $17
	CHARMAP "N",         $18
	CHARMAP "O",         $19
	CHARMAP "P",         $1a
	CHARMAP "Q",         $1b
	CHARMAP "R",         $1c
	CHARMAP "S",         $1d
	CHARMAP "T",         $1e
	CHARMAP "U",         $1f
	CHARMAP "V",         $20
	CHARMAP "W",         $21
	CHARMAP "X",         $22
	CHARMAP "Y",         $23
	CHARMAP "Z",         $24
	CHARMAP "a",         $25
	CHARMAP "b",         $26
	CHARMAP "c",         $27
	CHARMAP "d",         $28
	CHARMAP "e",         $29
	CHARMAP "f",         $2a
	CHARMAP "g",         $2b
	CHARMAP "h",         $2c
	CHARMAP "i",         $2d
	CHARMAP "j",         $2e
	CHARMAP "k",         $2f
	CHARMAP "l",         $30
	CHARMAP "m",         $31
	CHARMAP "n",         $32
	CHARMAP "o",         $33
	CHARMAP "p",         $34
	CHARMAP "q",         $35
	CHARMAP "r",         $36
	CHARMAP "s",         $37
	CHARMAP "t",         $38
	CHARMAP "u",         $39
	CHARMAP "v",         $3a
	CHARMAP "w",         $3b
	CHARMAP "x",         $3c
	CHARMAP "y",         $3d
	CHARMAP "z",         $3e

	CHARMAP ",",         $3f
	CHARMAP ".",         $40
	CHARMAP "'",         $41
	CHARMAP ":",         $42
	CHARMAP ";",         $43
	CHARMAP "#",         $44
	CHARMAP "*",         $45


	CHARMAP "•",          $48
	CHARMAP "&",          $49
	CHARMAP "=",          $4a
	CHARMAP "α",          $4b

	CHARMAP "É",          $5a
	CHARMAP "é",          $5b

	CHARMAP "+",          $63

	CHARMAP "…",          $70
	CHARMAP "\"",         $71
	CHARMAP "/",          $76
	CHARMAP "\\",         $77
	CHARMAP "%",          $7a

	; control characters
DEF CONTROL_CHAR EQU $b0

	CHARMAP "<LINE>",    $b0
	CHARMAP "<PROMPT>",  $b1
	CHARMAP "<B2>",      $b2
	CHARMAP "<B3>",      $b3
	CHARMAP "<DONE>",    $b4
	CHARMAP "<B5>",      $b5
	CHARMAP "<B6>",      $b6
	CHARMAP "<B7>",      $b7

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

	; box drawing characters
	CHARMAP "~", $80 ; empty tile
	CHARMAP "⁄", $81
	CHARMAP "┌", $82
	CHARMAP "─", $83 ; box top
	CHARMAP "┐", $84
	CHARMAP "│", $85 ; box left
	CHARMAP "║", $86 ; box right
	CHARMAP "└", $87
	CHARMAP "═", $88 ; box bottom
	CHARMAP "╝", $89

PUSHC
	NEWCHARMAP credits
	CHARMAP " ",  $00

	; hiragana characters
	CHARMAP "あ",         $01
	CHARMAP "い",         $02
	CHARMAP "う",         $03
	CHARMAP "え",         $04
	CHARMAP "お",         $05
	CHARMAP "か",         $06
	CHARMAP "き",         $07
	CHARMAP "く",         $08
	CHARMAP "け",         $09
	CHARMAP "こ",         $0a
	CHARMAP "さ",         $0b
	CHARMAP "し",         $0c
	CHARMAP "す",         $0d
	CHARMAP "せ",         $0e
	CHARMAP "そ",         $0f
	CHARMAP "た",         $10
	CHARMAP "ち",         $11
	CHARMAP "つ",         $12
	CHARMAP "て",         $13
	CHARMAP "と",         $14
	CHARMAP "な",         $15
	CHARMAP "に",         $16
	CHARMAP "ぬ",         $17
	CHARMAP "ね",         $18
	CHARMAP "の",         $19
	CHARMAP "は",         $1a
	CHARMAP "ひ",         $1b
	CHARMAP "ふ",         $1c
	CHARMAP "へ",         $1d
	CHARMAP "ほ",         $1e
	CHARMAP "ま",         $1f
	CHARMAP "み",         $20
	CHARMAP "む",         $21
	CHARMAP "め",         $22
	CHARMAP "も",         $23
	CHARMAP "や",         $24
	CHARMAP "ゆ",         $25
	CHARMAP "よ",         $26
	CHARMAP "ら",         $27
	CHARMAP "り",         $28
	CHARMAP "る",         $29
	CHARMAP "れ",         $2a
	CHARMAP "ろ",         $2b
	CHARMAP "わ",         $2c
	CHARMAP "を",         $2d
	CHARMAP "ん",         $2e
	CHARMAP "ぅ",         $2f
	CHARMAP "ゃ",         $30
	CHARMAP "ゅ",         $31
	CHARMAP "ょ",         $32

	; katakana characters
	CHARMAP "ア",         $33
	CHARMAP "イ",         $34
	CHARMAP "ウ",         $35
	CHARMAP "エ",         $36
	CHARMAP "オ",         $37
	CHARMAP "カ",         $38
	CHARMAP "キ",         $39
	CHARMAP "ク",         $3a
	CHARMAP "ケ",         $3b
	CHARMAP "コ",         $3c
	CHARMAP "サ",         $3d
	CHARMAP "シ",         $3e
	CHARMAP "ス",         $3f
	CHARMAP "セ",         $40
	CHARMAP "ソ",         $41
	CHARMAP "タ",         $42
	CHARMAP "チ",         $43
	CHARMAP "ツ",         $44
	CHARMAP "テ",         $45
	CHARMAP "ト",         $46
	CHARMAP "ナ",         $47
	CHARMAP "ニ",         $48
	CHARMAP "ヌ",         $49
	CHARMAP "ネ",         $4a
	CHARMAP "ノ",         $4b
	CHARMAP "ハ",         $4c
	CHARMAP "ヒ",         $4d
	CHARMAP "フ",         $4e
	CHARMAP "⋯",         $4f
	CHARMAP "ホ",         $50
	CHARMAP "マ",         $51
	CHARMAP "ミ",         $52
	CHARMAP "ム",         $53
	CHARMAP "メ",         $54
	CHARMAP "モ",         $55
	CHARMAP "ヤ",         $56
	CHARMAP "ユ",         $57
	CHARMAP "ヨ",         $58
	CHARMAP "ラ",         $59
	CHARMAP "·",         $5a
	CHARMAP "ル",         $5b
	CHARMAP "レ",         $5c
	CHARMAP "ロ",         $5d
	CHARMAP "ワ",         $5e
	CHARMAP "十",         $5f
	CHARMAP "ン",         $60
	CHARMAP "ァ",         $61
	CHARMAP "ィ",         $62
	CHARMAP "ッ",         $63
	CHARMAP "ャ",         $64
	CHARMAP "ュ",         $65
	CHARMAP "ョ",         $66
	CHARMAP "゛",         $67
	CHARMAP "゜",         $68
	CHARMAP "-",         $69
	CHARMAP "!",         $6a
	CHARMAP "?",         $6b
	CHARMAP "ェ",         $6c
	CHARMAP "ォ",         $6d
	CHARMAP "⌜",         $6e
	CHARMAP "⌟",         $6f

	CHARMAP "0",  $70
	CHARMAP "1",  $71
	CHARMAP "2",  $72
	CHARMAP "3",  $73
	CHARMAP "4",  $74
	CHARMAP "5",  $75
	CHARMAP "6",  $76
	CHARMAP "7",  $77
	CHARMAP "8",  $78
	CHARMAP "9",  $79
POPC
