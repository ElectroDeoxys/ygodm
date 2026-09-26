	dw BANK(@)

	farcall_table_start
	farfunc Func_e400a
	farfunc Func_e5558
	farfunc Func_e5579
	farfunc Func_e559a

Func_e400a:
	ld de, CardNamePointersEn
	ld a, [wTextArg + 0]
	ld l, a
	ld a, [wTextArg + 1]
	ld h, a
	add hl, hl
	ld b, h
	ld c, l
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	inc bc
	inc bc
	ld h, b
	ld l, c
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	ld de, wTextBuffer
	ld b, $00
.asm_e402b
	ld a, c
	cp l
	jr z, .asm_e4035
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	jr .asm_e402b
.asm_e4035
	ret

INCLUDE "text/en/card_name_pointers.asm"
INCLUDE "text/en/card_names.asm"

Func_e5558:
	ld hl, .text
	ld c, $0c
.loop
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .loop
	ret

.text
	text "Deck~~~~~~~~~~~~~~~~"

Func_e5579:
	ld hl, .text
	ld c, $0c
.loop
	ld a, [hli]
	call AddByteToVBlankStruct
	dec c
	jr nz, .loop
	ret

.text
	text "Trunk~~~~~~~~~~~~~~~"

Func_e559a:
	ld hl, DuelMessagesEn
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcf43 + 1]
	ld b, a
	ld a, [wcf43 + 0]
	ld c, a
	inc a
	ld [wcf43 + 0], a
	jr nz, .asm_e55b6
	ld a, [wcf43 + 1]
	inc a
	ld [wcf43 + 1], a
.asm_e55b6
	add hl, bc
	ld a, [hl]
	ret

	const_def

DuelMessagesEn:
	message_ptr Text_ItsYourTurn_En ; $00
	message_ptr Text_ItsTheComputersTurn_En ; $01
	message_ptr Text_149f4_En ; $02
	message_ptr Text_149ff_En ; $03
	message_ptr Text_TurnFinished_En ; $04
	message_ptr Text_CommunicationError_En ; $05
	message_ptr Text_TheDeckIsNotComplete_En ; $06
	message_ptr Text_TheTradeHasEnded_En ; $07
	message_ptr Text_YourOpponentIsCurrentlySearching_En ; $08
	message_ptr Text_CommunicationHasBeenEstablished_En ; $09
	message_ptr Text_14a8a_En ; $0a
	message_ptr Text_14a96_En ; $0b
	message_ptr Text_14aa2_En ; $0c
	message_ptr Text_14aae_En ; $0d
	message_ptr Text_14aba_En ; $0e
	message_ptr Text_14ad5_En ; $0f
	message_ptr Text_14aec_En ; $10
	message_ptr Text_14b09_En ; $11
	message_ptr Text_14b20_En ; $12
	message_ptr Text_14b3d_En ; $13
	message_ptr Text_14b6f_En ; $14
	message_ptr Text_14bad_En ; $15
	message_ptr Text_14be9_En ; $16
	message_ptr Text_14c23_En ; $17
	message_ptr Text_14c5c_En ; $18
	message_ptr Text_14ca3_En ; $19
	message_ptr Text_14cdd_En ; $1a
	message_ptr Text_14d06_En ; $1b
	message_ptr Text_14d2d_En ; $1c
	message_ptr Text_14d4a_En ; $1d
	message_ptr Text_14d67_En ; $1e
	message_ptr Text_14d84_En ; $1f
	message_ptr Text_14da2_En ; $20
	message_ptr Text_14dc9_En ; $21
	message_ptr Text_14de5_En ; $22
	message_ptr Text_14e06_En ; $23
	message_ptr Text_14e26_En ; $24
	message_ptr Text_14e48_En ; $25
	message_ptr Text_14e67_En ; $26
	message_ptr Text_14ea8_En ; $27
	message_ptr Text_14ed4_En ; $28
	message_ptr Text_14f04_En ; $29
	message_ptr Text_14f19_En ; $2a
	message_ptr Text_14f2d_En ; $2b
	message_ptr Text_14f40_En ; $2c

Text_ItsYourTurn_En:
	text "Your Turn"
	prompt
	done

Text_ItsTheComputersTurn_En:
	text "Opponent's Turn"
	prompt
	done

Text_149f4_En:
	text "COMM in"
	line "progress."
	prompt
	done

Text_149ff_En:
	text "Choose a card"
	line "from t"
	text "he hand"
	prompt
	done

Text_TurnFinished_En:
	text "End of Turn"
	prompt
	done

Text_CommunicationError_En:
	text "Cannot connect."
	line "Plea"
	text "se try again."
	prompt
	done

Text_TheDeckIsNotComplete_En:
	text "Your deck has less"
	line "t"
	text "han 40 cards!"
	prompt
	done

Text_TheTradeHasEnded_En:
	text "Trade Complete"
	prompt
	done

Text_YourOpponentIsCurrentlySearching_En:
	text "Opponent's Turn"
	prompt
	done

Text_CommunicationHasBeenEstablished_En:
	text "COMM fusion"
	line "triggere"
	text "d."
	prompt
	text "<B5>"
	line "created."
	prompt
	done

Text_14a8a_En:
	text "<B5>"
	line "evolved to"
	prompt
	text "<B6>"
	prompt
	done

Text_14a96_En:
	text "<B5>"
	line "evolved to"
	prompt
	text "<B6>"
	prompt
	done

Text_14aa2_En:
	text "<B5>"
	line "evolved to"
	prompt
	text "<B6>"
	prompt
	done

Text_14aae_En:
	text "<B5>"
	line "evolved to"
	prompt
	text "<B6>"
	prompt
	done

Text_14aba_En:
	text "Swords of"
	line "Revealing "
	text "Light"
	line "still in effec"
	text "t."
	prompt
	done

Text_14ad5_En:
	text "Swords of"
	line "Revealing "
	text "Light"
	line "has stopped."
	prompt
	done

Text_14aec_En:
	text "Legendary Sword!"
	line "Pow"
	text "er-up"
	line "monster!"
	prompt
	done

Text_14b09_En:
	text "Used"
	line "<B5>"
	prompt
	text "<B6>"
	line "splits and "
	text "becomes"
	prompt
	text "<B7>"
	prompt
	done

Text_14b20_En:
	text "Used Stop"
	line "Defense!"
	prompt
	text "E"
	text "nemy limited to"
	line "atta"
	text "ck."
	prompt
	done

Text_14b3d_En:
	text "Used Dragon"
	line "Capture "
	text "Jar!"
	prompt
	text "Dragon monsters"
	line "on field"
	line "immobilize"
	text "d!"
	prompt
	done

Text_14b6f_En:
	text "Field transformed"
	line "to"
	text " Forest!"
	prompt
	text "Field power"
	text "s up"
	line "Beast-Warrior,"
	prompt
	text "Beast, Insect,"
	line "and P"
	text "lant"
	line "Type monsters."
	prompt
	done

Text_14bad_En:
	text "Field transformed"
	line "to"
	text " Wasteland!"
	prompt
	text "Field po"
	text "wers up"
	line "Rock, Dinosa"
	text "ur,"
	prompt
	text "and Zombie Type"
	line ""
	text "monsters."
	prompt
	done

Text_14be9_En:
	text "Field transformed"
	line "to"
	text " Mountain!"
	prompt
	text "Field pow"
	text "ers up"
	line "Winged Beast,"
	prompt
	text "Thunder and"
	line "Dragon "
	text "Type"
	line "monsters!"
	prompt
	done

Text_14c23_En:
	text "Field transformed"
	line "to"
	text " Sogen!"
	prompt
	text "Field powers"
	text " up"
	line "Beast-Warrior"
	prompt
	text "an"
	text "d Warrior Type"
	line "monst"
	text "ers!"
	prompt
	done

Text_14c5c_En:
	text "Field transformed"
	line "to"
	text " Umi!"
	prompt
	text "Field powers u"
	text "p"
	line "Fish, Sea Serpent,"
	prompt
	text "Thunder, and Aqua"
	line "T"
	text "ype monsters."
	prompt
	text "Powers"
	text " down Pyro"
	line "and Machi"
	text "ne Type"
	line "monsters"
	prompt
	done

Text_14ca3_En:
	text "Field transformed"
	line "to"
	text " Yami!"
	prompt
	text "Field powers "
	text "up"
	line "Spellcaster and"
	prompt
	text "F"
	text "iend Type"
	line "monsters."
	prompt
	text "Powers down"
	line "Fairy Ty"
	text "pe"
	line "monsters"
	prompt
	done

Text_14cdd_En:
	text "Used Dark Hole!"
	line "Mons"
	text "ters on field"
	line "are el"
	text "iminated!"
	prompt
	done

Text_14d06_En:
	text "Used Raigeki!"
	line "Enemy "
	text "monsters on"
	line "field el"
	text "iminated!"
	prompt
	done

Text_14d2d_En:
	text "Used Mooyan"
	line "Curry!"
	line "R"
	text "ecover LP!"
	prompt
	done

Text_14d4a_En:
	text "Used Red"
	line "Medicine!"
	line "R"
	text "ecover LP!"
	prompt
	done

Text_14d67_En:
	text "Used Goblin's"
	line "Secret"
	text " Remedy!"
	line "Recover LP!"
	prompt
	done

Text_14d84_En:
	text "Used Soul of the"
	line "Pur"
	text "e! Recover LP!"
	prompt
	done

Text_14da2_En:
	text "Used Dian Keto"
	line "the C"
	text "ure Master!"
	line "Recover "
	text "LP!"
	prompt
	done

Text_14dc9_En:
	text "Used Sparks!"
	line "Opponen"
	text "t loses LP!"
	prompt
	done

Text_14de5_En:
	text "Used Hinotama!"
	line "Oppon"
	text "ent loses LP!"
	prompt
	done

Text_14e06_En:
	text "Used Final Flame!"
	line "Op"
	text "ponent loses LP!"
	prompt
	done

Text_14e26_En:
	text "Used Ookazi!"
	line "Opponen"
	text "t loses LP!"
	prompt
	done

Text_14e48_En:
	text "Used"
	line "Tremendous Fire"
	text "!"
	line "Opponent loses LP!"
	prompt
	done

Text_14e67_En:
	text "Used Swords of"
	line "Revea"
	text "ling Light!"
	prompt
	text "Opponent"
	text " can't"
	line "attack for 3"
	line ""
	text "turns!"
	prompt
	text "Monsters on f"
	text "ield"
	line "are revealed!"
	prompt
	done

Text_14ea8_En:
	text "Used Spellbinding"
	line "Ci"
	text "rcle!"
	prompt
	text "Powers down en"
	text "emy"
	line "monster on field"
	text "!"
	prompt
	done

Text_14ed4_En:
	text "Used Dark-"
	line "Piercing "
	text "Light!"
	prompt
	text "Monster on fi"
	text "eld"
	line "revealed by ligh"
	text "t!"
	prompt
	done

Text_14f04_En:
	text "Connection error"
	line "buf"
	text "fer overflow."
	prompt
	done

Text_14f19_En:
	text "Fusion of"
	line "<B5>"
	line "and"
	prompt
	text "<B6>"
	line "cr"
	text "eated"
	line "<B7>"
	prompt
	done

Text_14f2d_En:
	text "Used"
	line "<B5>"
	prompt
	text "Powers up"
	line "<B6>"
	prompt
	done

Text_14f40_En:
	text "Used"
	line "<B5>"
	line ""
	prompt
	text "Power up was"
	line "unsuccessful."
	prompt
	done
