; job constants
DEF JOB_MAIN       EQUS "LOW(hMainJobState)"
DEF JOB_AUDIO      EQUS "LOW(hAudioJobState)"
DEF JOB_DECOMPRESS EQUS "LOW(hDecompressJobState)"
DEF JOB_4          EQUS "LOW(hJob4State)"

DEF NUM_JOBS EQU 4

	const_def 0

	; this state means the job is
	; yielding until set to active
	const JOBSTATE_INACTIVE ; $0

	; this state means the job is active
	; and will be executed when it can
	const JOBSTATE_ACTIVE ; $1

	; this state means the job is
	; currently being executed
	const JOBSTATE_RUNNING ; $2
