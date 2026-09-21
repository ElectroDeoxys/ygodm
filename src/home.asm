SECTION "NULL", ROM0
NULL::

INCLUDE "home/header.asm"

SECTION "Home", ROM0

INCLUDE "home/start.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/audio_job.asm"
INCLUDE "home/color.asm"
INCLUDE "home/farcall.asm"
INCLUDE "home/bankswitch.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/do_frame.asm"
INCLUDE "home/text.asm"
INCLUDE "home/oam.asm"
INCLUDE "home/math.asm"
INCLUDE "home/transfer_oam.asm"
INCLUDE "home/print_card.asm"
INCLUDE "home/timer.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/duel.asm"
INCLUDE "home/compare_r16.asm"
INCLUDE "home/draw_card_tile.asm"
INCLUDE "home/link.asm"
INCLUDE "home/rng.asm"
INCLUDE "home/home.asm"

IF DEF(_EARLY_DAYS)
    bankfill "data/bank_fill/bank00.bin", $0, $1179
    INCLUDE "home/skip_wait.asm"
    bankfill "data/bank_fill/bank00.bin", $11CB, $ae
ELSE
    bankfill "data/bank_fill/bank00.bin"
ENDC
