	dw BANK(@)

Func_f4002::
	ld a, IE_VBLANK
	ldh [rIE], a
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ldh [rSTAT], a
	ldh [rSCY], a
	ldh [rSCX], a

	call Func_f40c8

	ld hl, wcfe1
	ld de, wcff1
	ld b, $00
	call FillMemFromHLToDE

	ld a, $60
	ld [wcfe8], a
	ld a, $02
	ld [wcfe9], a
	ld a, LOW(Credits)
	ld [wcfec + 0], a
	ld a, HIGH(Credits)
	ld [wcfec + 1], a

	ld hl, vBGMap0
	debgcoord 31, 31
	ld b, $00
	call FillMemFromHLToDE

	ld hl, Gfx_f40e8
	ld de, vTiles0
	ld bc, $80 tiles
	call Copy1bpp

	ld a, LCDC_BG_ON | LCDC_BLOCK01 | LCDC_ON
	ldh [rLCDC], a

	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
.asm_f4058
	xor a
	ld [wcfe2], a
.asm_f405c
	ld a, [wcfe2]
	or a
	jr z, .asm_f405c
	ld a, [wcfee]
	or a
	jr z, .asm_f406a
.infinite_loop
	jr .infinite_loop
.asm_f406a
	ld de, $40

	call ReadJoypad_Credits

	ld a, [wcff1]
	ld b, a
	ld a, [wcff0]
	bit B_PAD_A, a
	jr nz, .a_btn
	bit B_PAD_B, a
	jr nz, .b_btn
	jr .asm_f4089
.a_btn
	ld de, $200
	jr .asm_f4089
.b_btn
	ld de, NULL
.asm_f4089
	ld a, [wcfe4]
	add e
	ld [wcfe4], a
	ld a, [wcfe5]
	adc d
	ld [wcfe5], a
	ldh [rSCY], a
	ld a, [wcfea]
	add e
	ld [wcfea], a
	ld a, [wcfeb]
	adc d
	ld [wcfeb], a
	jr .asm_f4058

; fills memory values from hl to de (inclusive)
; with fill value given in b
FillMemFromHLToDE:
.loop
	ld a, b
	ld [hli], a
	ld a, h
	cp d
	jr nz, .loop
	ld a, l
	cp e
	jr nz, .loop
	ret

; unreferenced
Func_f40b4:
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

; copies 1bpp graphics data (bc bytes) from hl to de
Copy1bpp:
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Func_f40c8:
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	ret z ; LCD off
	ldh a, [rIE]
	ld [wcfe3], a
	res B_IE_VBLANK, a
	ldh [rIE], a
.asm_f40d6
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .asm_f40d6
	ldh a, [rLCDC]
	and ~LCDC_ON
	ldh [rLCDC], a
	ld a, [wcfe3]
	ldh [rIE], a
	ret

Gfx_f40e8: INCBIN "gfx/gfx_f40e8.1bpp"

PUSHC credits
Credits:
	text "    ゛        ゛゛     "
	text "  オりシナルキャラクタ-テサイン   "
	text "    ゛       ゛゛      "
	text "  オりシナルモンスタ-テサイン    "
	text "            ゛       "
	text "      たかはし かすき      "
	text "                    "
	text "                    "
	text "  ゛  ゛゛   ゛         "
	text "  ケ-ムテサイン·ティレクション   "
	text "        ゛  ゛        "
	text "      やまた のふひろ      "
	text "                    "
	text "                    "
	text "  ゜ ゛               "
	text "  フロクラム             "
	text "        ゛  ゛        "
	text "      やまた のふひろ      "
	text "       ゛            "
	text "      ちた たくり        "
	text "                    "
	text "                    "
	text "  ゛     ゛           "
	text "  クラフィックティレクション     "
	text "                    "
	text "      はしもと かなこ      "
	text "                    "
	text "                    "
	text "     ゛              "
	text "  サウント              "
	text "                    "
	text "      かみお けんいち      "
	text "                    "
	text "                    "
	text "       ゛゛           "
	text "  モンスタ-テサイン         "
	text "                    "
	text "      ···           "
	text "          ゛         "
	text "      いぅすんほうし       "
	text "                    "
	text "      いつもり なゆ       "
	text "       ゛            "
	text "      エウァ14         "
	text "                    "
	text "      エス·エ-         "
	text "                    "
	text "      エフ            "
	text "         ゛゛ ゛       "
	text "      くされけとうしん      "
	text "                    "
	text "      サイコ-くん        "
	text "                    "
	text "      シエル           "
	text "      ゜             "
	text "      ヒ-マン          "
	text "      ゜゛            "
	text "      ヒクモン          "
	text "       ゛            "
	text "      ひしり りゅうか      "
	text "         ゛          "
	text "      ふりんし          "
	text "      ゜ ゜           "
	text "      ホンホコタヌキ       "
	text "        ゛           "
	text "      みかけやま こてん     "
	text "                    "
	text "      ムラカミ          "
	text "        ゛゛          "
	text "      ゆうきシュニア       "
	text "                    "
	text "      あおい たかひろ      "
	text "                    "
	text "      あおき たかゆき      "
	text "        ゛           "
	text "      あかほし みさき      "
	text "                    "
	text "      あさの ゆうすけ      "
	text "       ゛            "
	text "      あたち としろう      "
	text "       ゛            "
	text "      あへ ひろゆき       "
	text "        ゛           "
	text "      あんさい あきら      "
	text "        ゛           "
	text "      あんさい しん       "
	text "        ゛     ゛     "
	text "      いけかみ きょうし     "
	text "        ゛           "
	text "      いけた よういち      "
	text "                    "
	text "      いしい あつし       "
	text "        ゛           "
	text "      いしさか けいた      "
	text "       ゛            "
	text "      いすた まさたか      "
	text "                    "
	text "      いちかわ ひろゆき     "
	text "                    "
	text "      いとう ゆういち      "
	text "        ゛           "
	text "      いなかき りょう      "
	text "             ゛      "
	text "      いまむら こうし      "
	text "                    "
	text "      いわこし たけし      "
	text "             ゛      "
	text "      いわさか まなふ      "
	text "                    "
	text "      いわさき れいな      "
	text "        ゛           "
	text "      うえた けんたろう     "
	text "        ゛           "
	text "      うえた ひろし       "
	text "       ゛            "
	text "      えとたに みほ       "
	text "                    "
	text "      おおいし ほたけ      "
	text "                    "
	text "      おおしろ みわこ      "
	text "                    "
	text "      おおや ともみ       "
	text "             ゛      "
	text "      おかむら せいしゅ     "
	text "            ゛       "
	text "      おくむら かすや      "
	text "       ゛   ゛ ゛      "
	text "      おさき ひてかす      "
	text "              ゛     "
	text "      おちあい ひろのふ     "
	text "        ゛           "
	text "      おのてら まさし      "
	text "                    "
	text "      かたおか てつや      "
	text "        ゛   ゛       "
	text "      かたきり はしめ      "
	text "                    "
	text "      かとう しゅんすけ     "
	text "            ゛       "
	text "      かとう ゆうし       "
	text "       ゛  ゛         "
	text "      かとた かくし       "
	text "             ゛      "
	text "      かないわ こうし      "
	text "           ゛        "
	text "      かねこ ひてき       "
	text "                    "
	text "      かみこうす ひろたけ    "
	text "                    "
	text "      かみこうす りょうすけ   "
	text "                    "
	text "      かわさき こうへい     "
	text "                    "
	text "      かわはら ともひさ     "
	text "                    "
	text "      きたい まさき       "
	text "       ゛            "
	text "      きと しゅうへい      "
	text "           ゛        "
	text "      きむら しけひろ      "
	text "           ゛        "
	text "      くさみち こうき      "
	text "        ゛           "
	text "      くにかた          "
	text "       ゛ ゛          "
	text "      くほ しゅんこ       "
	text "       ゛            "
	text "      くほた まり        "
	text "        ゛           "
	text "      くまかや もりたか     "
	text "                    "
	text "      くらの まさと       "
	text "            ゛       "
	text "      くらもと かすや      "
	text "                    "
	text "      くわはら おさむ      "
	text "        ゛           "
	text "      こうかく なお       "
	text "        ゛           "
	text "      こうたき まもる      "
	text "       ゛            "
	text "      こしま しん        "
	text "       ゛            "
	text "      こしま よしのり      "
	text "                    "
	text "      こたけ まこと       "
	text "                    "
	text "      こにし たかゆき      "
	text "        ゛           "
	text "      こまは しんすけ      "
	text "                    "
	text "      こみなみ たかなお     "
	text "        ゛           "
	text "      こんとう みゆき      "
	text "                    "
	text "      さいき ゆうき       "
	text "           ゛        "
	text "      さいとう しゅん      "
	text "                    "
	text "      さいとう ちえみ      "
	text "                    "
	text "      さいとう つかさ      "
	text "                    "
	text "      さいとう てつなり     "
	text "           ゛        "
	text "      ささき かすみ       "
	text "                    "
	text "      ささき かつひと      "
	text "                    "
	text "      さそう ともひこ      "
	text "                    "
	text "      さとう かおり       "
	text "                    "
	text "      さとう けいすけ      "
	text "          ゛         "
	text "      さとう こう        "
	text "             ゛      "
	text "      さとう ひろかす      "
	text "                    "
	text "      さるわたり たくみ     "
	text "                    "
	text "      しいな かつゆき      "
	text "        ゛           "
	text "      しおさき りょうた     "
	text "       ゛            "
	text "      しけひさ としあき     "
	text "       ゛            "
	text "      しけまつ さとひろ     "
	text "                    "
	text "      しも りょうすけ      "
	text "        ゛           "
	text "      しもた たけし       "
	text "         ゛   ゛      "
	text "      しんなへ けんし      "
	text "       ゛            "
	text "      すかい あつし       "
	text "       ゛            "
	text "      すき なおと        "
	text "       ゛            "
	text "      すきた おおか       "
	text "       ゛   ゛        "
	text "      すすき かすほ       "
	text "       ゛   ゛        "
	text "      すすき かすや       "
	text "       ゛   ゛        "
	text "      すすき かすゆき      "
	text "                    "
	text "      せきね あきら       "
	text "                    "
	text "      そうま ひとし       "
	text "         ゛  ゛       "
	text "      そとかと かすき      "
	text "           ゛        "
	text "      たかはし しゅん      "
	text "                    "
	text "      たかはし ふみひと     "
	text "                    "
	text "      たかはま なりとも     "
	text "                    "
	text "      たしろ ゆうこ       "
	text "       ゛            "
	text "      たたの こたろう      "
	text "             ゛      "
	text "      たてやま けんし      "
	text "                    "
	text "      たなか けんしろう     "
	text "        ゛   ゛       "
	text "      たなへ ゆうし       "
	text "                    "
	text "      たむら ゆういちろう    "
	text "                    "
	text "      たるした けんた      "
	text "        ゛           "
	text "      つかた こうへい      "
	text "                    "
	text "      つちや あきひろ      "
	text "                    "
	text "      つつみ ともこ       "
	text "                    "
	text "      つるみ ともひろ      "
	text "       ゛            "
	text "      とた まさやす       "
	text "       ゛            "
	text "      とは たけし        "
	text "                    "
	text "      とみた けいすけ      "
	text "           ゛        "
	text "      とみやま たいち      "
	text "                    "
	text "      とやま ともたか      "
	text "                    "
	text "      なかお あつし       "
	text "                    "
	text "      なかお ゆうた       "
	text "       ゛            "
	text "      なかお りゅうた      "
	text "        ゛           "
	text "      なかしま たくみ      "
	text "       ゛            "
	text "      なかた まさき       "
	text "                    "
	text "      なかつる まゆ       "
	text "                    "
	text "      なかにし よういち     "
	text "                    "
	text "      なかもと あきこ      "
	text "                    "
	text "      なかや しゅか       "
	text "       ゛            "
	text "      なかや ひろし       "
	text "                    "
	text "      にしさと みき       "
	text "                    "
	text "      にしむら あきこ      "
	text "                    "
	text "      にしむら たくろう     "
	text "                    "
	text "      にぅた まりこ       "
	text "                    "
	text "      にのみや しゅんいちろう  "
	text "       ゛            "
	text "      のくち るり        "
	text "              ゛     "
	text "      ののむら まさかす     "
	text "                    "
	text "      はたの ひろのり      "
	text "                    "
	text "      はまの たくや       "
	text "                    "
	text "      はやし きいち       "
	text "             ゛      "
	text "      はやたけ ゆうし      "
	text "        ゛  ゛        "
	text "      はらた ひてあき      "
	text "           ゛        "
	text "      ひさかわ しゅん      "
	text "       ゛            "
	text "      ひた ゆうや        "
	text "                    "
	text "      ひら としあき       "
	text "                    "
	text "      ひろの まさき       "
	text "         ゛          "
	text "      ふくなか やよい      "
	text "       ゛            "
	text "      ふしい たけし       "
	text "       ゛            "
	text "      ふした けんいち      "
	text "       ゛            "
	text "      ふした ちえ        "
	text "       ゛            "
	text "      ふした まさとし      "
	text "       ゛            "
	text "      ふした みつまさ      "
	text "       ゛            "
	text "      ふしはら かつひと     "
	text "       ゛     ゛      "
	text "      ふしよし えいし      "
	text "             ゛      "
	text "      ふたみ としかす      "
	text "                    "
	text "      ふるかわ あさみ      "
	text "                    "
	text "      ふるかわ さとし      "
	text "        ゛           "
	text "      ふるたか ゆうき      "
	text "                    "
	text "      ほかり しょうたろう    "
	text "                    "
	text "      ほそめ けいすけ      "
	text "        ゛  ゛        "
	text "      ほんさわ こう       "
	text "            ゛       "
	text "      まえしま ひてふみ     "
	text "        ゛           "
	text "      まえた かよ        "
	text "        ゛           "
	text "      ますた けんた       "
	text "                    "
	text "      まつうら なお       "
	text "        ゛           "
	text "      まつさわ けいすけ     "
	text "        ゛           "
	text "      まつた あゆみ       "
	text "         ゛          "
	text "      みつなか まさひろ     "
	text "                    "
	text "      みやさと かいり      "
	text "                    "
	text "      むかい さおり       "
	text "             ゛      "
	text "      むらい きょうし      "
	text "                    "
	text "      むらの まさゆき      "
	text "        ゛           "
	text "      もちつき ゆうま      "
	text "                    "
	text "      もとやま せいいち     "
	text "                    "
	text "      もりた しゅんいち     "
	text "            ゛       "
	text "      もんま せいし       "
	text "        ゛           "
	text "      やまさき しょうた     "
	text "        ゛           "
	text "      やまさき ひろし      "
	text "        ゛           "
	text "      やまた けいすけ      "
	text "        ゛           "
	text "      やまた たいし       "
	text "        ゛           "
	text "      やまた ゆきひさ      "
	text "                    "
	text "      やまもと いくお      "
	text "             ゛      "
	text "      やまもと けんし      "
	text "                    "
	text "      やまもと ひろき      "
	text "                    "
	text "      やまもと まさひろ     "
	text "       ゛ ゛          "
	text "      ゆひやと やすし      "
	text "        ゛           "
	text "      よしさき ゆきお      "
	text "        ゛           "
	text "      よしさわ みゆき      "
	text "        ゛  ゛        "
	text "      よした かすや       "
	text "        ゛           "
	text "      よした たくみ       "
	text "        ゛           "
	text "      よした よしひろ      "
	text "       ゛            "
	text "      よた たろう        "
	text "         ゛          "
	text "      わたなへ たかゆき     "
	text "                    "
	text "                    "
	text "                    "
	text "  モンスタ-ノ-ツ          "
	text "                    "
	text "      シモムラ ケイタ      "
	text "                    "
	text "                    "
	text "   ゜                "
	text "  スへシャルサンクス         "
	text "            ゛       "
	text "      とりしま かすひこ     "
	text "                    "
	text "      たかはし としまさ     "
	text "                    "
	text "      へいし よしひさ      "
	text "        ゛           "
	text "      たけた ふゆと       "
	text "                    "
	text "      しま ともゆき       "
	text "                    "
	text "                    "
	text "            ゛       "
	text "      よしくら ひてお      "
	text "        ゛           "
	text "      こんとう ゆう       "
	text "        ゛           "
	text "      まちた むねはる      "
	text "           ゛  ゛     "
	text "      やまもと しゅんし     "
	text "                    "
	text "                    "
	text "               ゛    "
	text "      ライトりンクミュ-シック  "
	text "                    "
	text "      アイ·ティ-·エル     "
	text "                    "
	text "                    "
	text "                    "
	text "      ところ みちこ       "
	text "                    "
	text "      ふくい ひろゆき      "
	text "         ゛          "
	text "      わたなへ つとむ      "
	text "           ゛        "
	text "      ひらた ひてひろ      "
	text "                    "
	text "                    "
	text "                    "
	text "      なかやま かつひろ     "
	text "                    "
	text "      さかい まさと       "
	text "       ゛            "
	text "      やき よしこ        "
	text "        ゛           "
	text "      せきくち ようこ      "
	text "                    "
	text "                    "
	text "  ゜ ゛               "
	text "  フロテュ-サ-           "
	text "                    "
	text "      しもむら さとし      "
	text "                    "
	text "                    "
	text "   ゛゛   ゛゜ ゛        "
	text "  エクセクティフフロテュ-サ-    "
	text "            ゛       "
	text "      きたうえ かすみ      "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "        おわり         "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	text "                    "
	db $ff ; end
POPC

Func_f6e5d::
.asm_f6e5d
	ld a, [wcfeb]
	cp $08
	ret c
	sub $08
	ld [wcfeb], a
	ld b, SCREEN_WIDTH
	ld a, [wcfe8]
	add TILEMAP_WIDTH
	ld e, a
	ld [wcfe8], a
	ld a, [wcfe9]
	adc $00
	and $03
	ld d, a
	ld [wcfe9], a
	ld hl, vBGMap0
	add hl, de
	ld e, l
	ld d, h
	ld a, [wcfec + 0]
	ld l, a
	ld a, [wcfec + 1]
	ld h, a
.asm_f6e8c
	ld a, b
	or a
	jr z, .asm_f6e9a
	ld a, [hli]
	cp $ff
	jr z, .asm_f6ea4
	ld [de], a
	inc de
	dec b
	jr .asm_f6e8c
.asm_f6e9a
	ld a, l
	ld [wcfec + 0], a
	ld a, h
	ld [wcfec + 1], a
	jr .asm_f6e5d
.asm_f6ea4
	ld a, $01
	ld [wcfee], a
	ret

ReadJoypad_Credits:
	; read d-pad
	ld a, JOYP_GET_CTRL_PAD
	ldh [rJOYP], a
	REPT 2
		ldh a, [rJOYP]
	ENDR
	cpl
	and JOYP_INPUTS
	swap a
	ld b, a

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a

	; read buttons
	ld a, JOYP_GET_BUTTONS
	ldh [rJOYP], a
	REPT 6
		ldh a, [rJOYP]
	ENDR
	cpl
	and JOYP_INPUTS
	or b
	ld c, a
	; c holds all input of current frame

	ld a, [wcff0] ; keys that were already down
	xor c
	and c
	ld [wcff1], a ; key that are pressed on this frame
	ld a, c
	ld [wcff0], a ; update keys down

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ret
; 0xf6ee2
