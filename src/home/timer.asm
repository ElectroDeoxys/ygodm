InitJobs::
	push af
	push hl
	call Func_179b
	call InitJobFlags
	call InitJobFunctionsAndStacks
	call SetInitialJobStates

	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld hl, rIE
	res B_IE_TIMER, [hl]

	; set timer to 262k / 56 ~ 4678 Hz
	ld a, -56
	ldh [rTIMA], a
	ld a, -56
	ldh [rTMA], a
	ld a, TAC_262KHZ | TAC_START
	ldh [rTAC], a

	ld hl, rIE
	set B_IE_TIMER, [hl]
	pop hl
	pop af
	ret

InitJobFunctionsAndStacks:
	push af
	push bc
	push hl
	ld hl, JobFunctionsAndStacks
	lb bc, $3, LOW(hAudioJobStackPointer)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	dec b
	jr nz, .loop
	pop hl
	pop bc
	pop af
	ret

InitialJobStates:
	db JOBSTATE_RUNNING
	db JOBSTATE_ACTIVE
	db JOBSTATE_ACTIVE
	db JOBSTATE_ACTIVE

; arguments:
; - \1 = job function
; - \2 = bottom of stack
MACRO? job_func
	dw \2 - $8 ; to preserve registers
	db BANK(\1)
	dw \2
	dw \1
ENDM

JobFunctionsAndStacks:
	job_func AudioJob,      wAudioJobStackBottom
	job_func DecompressJob, wDecompressJobStackBottom
	job_func Func_172c,     wJob4StackBottom

JobTimerConfigurations:
	db 240, TAC_4KHZ   | TAC_STOP, TAC_4KHZ   | TAC_START ; JOB_MAIN
	db 100, TAC_4KHZ   | TAC_STOP, TAC_4KHZ   | TAC_START ; JOB_AUDIO
	db 225, TAC_4KHZ   | TAC_STOP, TAC_4KHZ   | TAC_START ; JOB_DECOMPRESS
	db 240, TAC_262KHZ | TAC_STOP, TAC_262KHZ | TAC_START ; JOB_4

SetInitialJobStates:
	push af
	push bc
	push hl
	ld c, LOW(hJobStates)
	ld hl, InitialJobStates
	ld b, NUM_JOBS
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ld a, JOB_MAIN
	ldh [hCurJob], a
	pop hl
	pop bc
	pop af
	ret

; unreferenced
Func_1601:
	push af
	push bc
	push hl
	ld c, LOW(hJobStates)
	ld hl, InitialJobStates
	ld a, JOBSTATE_INACTIVE
	ld b, NUM_JOBS
.loop
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ld a, JOB_MAIN
	ldh [hCurJob], a
	pop hl
	pop bc
	pop af
	ret

Timer:
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	ldh a, [hCurJob]
	ld c, a
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	ld a, JOBSTATE_ACTIVE
	ld [$ff00+c], a
.asm_162f
	inc c
	ld a, c
	cp JOB_4 + 1
	jr nz, .got_job
	ld c, JOB_MAIN
.got_job
	ld a, [$ff00+c]
	cp JOBSTATE_ACTIVE
	jr nz, .asm_162f
	ld a, c
	ldh [hCurJob], a
	ld a, JOBSTATE_RUNNING
	ld [$ff00+c], a
	ld a, LOW(hJobStackPointers)
	add e
	ld c, a
	ld hl, sp+$00
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, h
	ld [$ff00+c], a
	inc c
	ld a, [rRAMB]
	ld [$ff00+c], a
	ldh a, [hCurJob]
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	add LOW(hJobStackPointers)
	ld c, a
	ld a, [$ff00+c]
	ld l, a
	inc c
	ld a, [$ff00+c]
	ld h, a
	ld sp, hl
	inc c
	ld a, [$ff00+c]
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a

	ld d, $00
	ld hl, JobTimerConfigurations
	add hl, de
	ld a, [hl]
	ldh [rTIMA], a
	ld a, [hli]
	ldh [rTMA], a
	ld a, [hli]
	ldh [rTAC], a
	ld a, [hl]
	ldh [rTAC], a
	pop de
	pop bc
	pop af
	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld l, LOW(rIE)
	set B_IE_TIMER, [hl]
	pop hl
	reti

	ret ; stray ret

YieldJob::
	push hl
	ld hl, rIE
	res B_IE_TIMER, [hl]
	push af
	push bc
	push de
	di
	ldh a, [hCurJob]
	ld c, a
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	ld a, JOBSTATE_INACTIVE
	ld [$ff00+c], a
.asm_16a5
	inc c
	ld a, c
	cp JOB_4 + 1
	jr nz, .got_job
	ld c, JOB_MAIN
.got_job
	ld a, [$ff00+c]
	cp JOBSTATE_ACTIVE
	jr nz, .asm_16a5
	ld a, c
	ldh [hCurJob], a
	ld a, JOBSTATE_RUNNING
	ld [$ff00+c], a

	; save current stack pointer and bank
	ld a, LOW(hJobStackPointers)
	add e
	ld c, a
	ld hl, sp+$00
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, h
	ld [$ff00+c], a
	inc c
	ld a, [rRAMB]
	ld [$ff00+c], a

	ldh a, [hCurJob]
	sub LOW(hJobStates)
	ld b, a
	rlca
	add b ; *3
	ld e, a
	add LOW(hJobStackPointers)
	ld c, a
	ld a, [$ff00+c]
	ld l, a
	inc c
	ld a, [$ff00+c]
	ld h, a
	ld sp, hl
	inc c
	ld a, [$ff00+c]
	ld [rROMB + $1000], a
	rra
	swap a
	ld [rRAMB + $1000], a

	ld d, $00
	ld hl, JobTimerConfigurations
	add hl, de
	ld a, [hl]
	ldh [rTIMA], a
	ld a, [hli]
	ldh [rTMA], a
	ld a, [hli]
	ldh [rTAC], a
	ld a, [hl]
	ldh [rTAC], a
	pop de
	pop bc
	pop af
	ld hl, rIF
	res B_IF_TIMER, [hl]
	ld l, LOW(rIE)
	set B_IE_TIMER, [hl]
	pop hl
	reti

	ret ; stray ret

ActivateJob::
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, JOBSTATE_ACTIVE
	ld [$ff00+c], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_171c:
	push hl
	ld hl, rTAC
	res B_TAC_START, [hl]
	pop hl
	ret

Func_1724:
	di
	ld hl, rIE
	res B_IE_TIMER, [hl]
	reti

	ret ; stray ret

Func_172c:
.loop
	jr .loop

	ret ; stray ret

InitJobFlags:
	push af
	push bc
	ld c, LOW(hJobFlags)
	xor a
	ld b, $04
.loop
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	pop bc
	pop af
	ret

SetJobFlag::
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, [$ff00+c]
	or b
	ld [$ff00+c], a
	ei
	pop hl
	pop de
	pop bc
	pop af
	ret

TestJobFlag::
	push bc
	push de
	push hl
	ld hl, sp+$06
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, $ff
	xor b
	ld d, a
	ld a, [$ff00+c]
	ld e, a
	and d
	ld [$ff00+c], a
	ld a, e
	and b
	pop hl
	pop de
	pop bc
	reti

	ret ; stray ret

ResetJobFlag::
	push af
	push bc
	push de
	push hl
	ld hl, sp+$08
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	di
	ld a, $ff
	xor b
	ld b, a
	ld a, [$ff00+c]
	and b
	ld [$ff00+c], a
	pop hl
	pop de
	pop bc
	pop af
	reti

	ret ; stray ret

Func_179b:
	push af
	xor a
	ld [wccff], a
	ld [wcd00], a
	ld [wcd09], a
	ld [wcd0a], a
	pop af
	ret
