SECTION "HRAM", HRAM

hDecompressSource::     dw ; ff80
hDecompressDest::       dw ; ff82
hDecompressLen::        dw ; ff84
hDecompressBufferSize:: db ; ff86

	ds $58

hffdf:: db ; ffdf

hffe0:: db ; ffe0
hffe1:: db ; ffe1
hffe2:: db ; ffe2
hffe3:: db ; ffe3

hffe4:: db ; ffe4
hffe5:: db ; ffe5
hffe6:: db ; ffe6

	ds $1

hffe8:: ds $3 ; ffe8
hffeb:: ds $3 ; ffeb
hffee:: ds $3 ; ffee
hfff1:: ds $3 ; fff1

