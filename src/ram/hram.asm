SECTION "HRAM", HRAM

hDecompressSource::     dw ; ff80
hDecompressDest::       dw ; ff82
hDecompressLen::        dw ; ff84
hDecompressBufferSize:: db ; ff86

	ds $56

hBootUpA:: db ; ffdd

	ds $1

hCurJob:: db ; ffdf

hJobStates::
hMainJobState::       db ; ffe0
hAudioJobState::      db ; ffe1
hDecompressJobState:: db ; ffe2
hJob4State::          db ; ffe3

hVBlankJobFlags::     db ; ffe4
hAudioJobFlags::      db ; ffe5
hDecompressJobFlags:: db ; ffe6
hUnkJobFlags::        db ; ffe7

hJobStackPointers::
hMainJobStackPointer::       ds $3 ; ffe8
hAudioJobStackPointer::      ds $3 ; ffeb
hDecompressJobStackPointer:: ds $3 ; ffee
hJob4StackPointer::          ds $3 ; fff1
