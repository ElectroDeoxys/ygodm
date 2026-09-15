SECTION "NULL", ROM0
NULL::

INCLUDE "home/header.asm"

SECTION "Home", ROM0

INCLUDE "home/home.asm"

INCBIN "data/bank_fill/bank00.bin"
