import reader
import re

OFFSETS = set([
	0x47a2,
	0x47a2,
	0x47a2,
	0x47a2,
	0x47a3,
	0x48de,
	0x4ad6,
	0x4c39,
	0x4d15,
	0x4ea6,
	0x52cf,
	0x53cf,
	0x53f7,
	0x551a,
	0x5718,
	0x57d3,
	0x57e5,
	0x59a8,
	0x5ba9,
	0x5ca7,
	0x5cd0,
	0x5f5b,
	0x62c6,
	0x63d3,
	0x6477,
	0x65b0,
	0x66b1,
	0x6753,
	0x676a,
	0x6833,
	0x6a08,
	0x6b71,
	0x6b87,
	0x6dee,
	0x70ad,
	0x714a,
	0x715c,
	0x7211,
	0x72d5,
	0x731e,
	0x732e,
	0x73f8,
	0x74b0,
	0x7522,
	0x7542,
	0x7621,
	0x7718,
	0x47a2,
	0x7761,
	0x77c6,
	0x7825,
	0x7856,
	0x788e,
	0x78e9,
	0x7942,
	0x795d,
	0x797a,
	0x79b7,
	0x79e4,
	0x7a03,
	0x7a1b,
	0x7a5c,
	0x7a9f,
	0x7acf,
	0x7af5,
	0x7bde,
	0x7c97,
	0x7d5d,
	0x7de7,
	0x7dfc,
	0x7e16,
	0x7e2d,
	0x7e56,
	0x7e71,
	0x7e84,
	0x7e97,
	0x7eb1,
	0x7ecc,
	0x7ed5,
	0x7eec,
	0x7efe,
	0x7f1d,
	0x7f2a,
	0x7f47,
	0x7f61,
	0x7f7f,
	0x7f96,
	0x7fa9,
	0x7fb5,

	# unreferenced
	0x6754,
	0x775c,
])

NOTES = [
	"C_0", # $00
	"C#0", # $01
	"D_0", # $02
	"D#0", # $03
	"E_0", # $04
	"F_0", # $05
	"F#0", # $06
	"G_0", # $07
	"G#0", # $08
	"A_0", # $09
	"A#0", # $0a
	"B_0", # $0b
	"C_1", # $0c
	"C#1", # $0d
	"D_1", # $0e
	"D#1", # $0f
	"E_1", # $10
	"F_1", # $11
	"F#1", # $12
	"G_1", # $13
	"G#1", # $14
	"A_1", # $15
	"A#1", # $16
	"B_1", # $17
	"C_2", # $18
	"C#2", # $19
	"D_2", # $1a
	"D#2", # $1b
	"E_2", # $1c
	"F_2", # $1d
	"F#2", # $1e
	"G_2", # $1f
	"G#2", # $20
	"A_2", # $21
	"A#2", # $22
	"B_2", # $23
	"C_3", # $24
	"C#3", # $25
	"D_3", # $26
	"D#3", # $27
	"E_3", # $28
	"F_3", # $29
	"F#3", # $2a
	"G_3", # $2b
	"G#3", # $2c
	"A_3", # $2d
	"A#3", # $2e
	"B_3", # $2f
	"C_4", # $30
	"C#4", # $31
	"D_4", # $32
	"D#4", # $33
	"E_4", # $34
	"F_4", # $35
	"F#4", # $36
	"G_4", # $37
	"G#4", # $38
	"A_4", # $39
	"A#4", # $3a
	"B_4", # $3b
	"C_5", # $3c
	"C#5", # $3d
	"D_5", # $3e
	"D#5", # $3f
	"E_5", # $40
	"F_5", # $41
	"F#5", # $42
	"G_5", # $43
	"G#5", # $44
	"A_5", # $45
	"A#5", # $46
	"B_5", # $47
	"C_6", # $48
	"C#6", # $49
	"D_6", # $4a
	"D#6", # $4b
	"E_6", # $4c
	"F_6", # $4d
	"F#6", # $4e
	"G_6", # $4f
	"G#6", # $50
	"A_6", # $51
	"A#6", # $52
	"B_6", # $53
	"C_7", # $54
	"C#7", # $55
	"D_7", # $56
	"D#7", # $57
	"E_7", # $58
	"F_7", # $59
	"F#7", # $5a
	"G_7", # $5b
	"G#7", # $5c
	"A_7", # $5d
	"A#7", # $5e
	"B_7", # $5f
	"C_8", # $60
	"C#8", # $61
	"D_8", # $62
	"D#8", # $63
	"E_8", # $64
	"F_8", # $65
	"F#8", # $66
	"G_8", # $67
	"G#8", # $68
	"A_8", # $69
	"A#8", # $6a
	"B_8", # $6b
	"C_9", # $6c
	"C#9", # $6d
	"D_9", # $6e
]

def process_addresses(string):
	return re.sub(r"\$([4-7][a-f0-9]{3})", lambda m: "Sound_{:0x}".format(int(m[1], 16) + 0xf4000), string)

def main():
	def pan(cmd, pos):
		pans = ["NONE", "PAN_LEFT", "PAN_RIGHT", "PAN_LEFT | PAN_RIGHT"]
		arg1 = cmd & 0x3
		return (f"pan {pans[arg1]}", 0, None)

	def duty_cycle(cmd, pos):
		duty_cycles = ["DUTY_12_5", "DUTY_25", "DUTY_50", "DUTY_75"]
		arg1 = cmd & 0x3
		return (f"duty_cycle {duty_cycles[arg1]}", 0, None)

	def sweep(cmd, pos):
		arg1 = reader.get_rom_byte(pos)
		time = (arg1 & 0x70) >> 4
		dir = "AUD1SWEEP_UP" if (arg1 & 0x8 == 0) else "AUD1SWEEP_DOWN"
		shift = (arg1 & 0x07)
		return (f"sweep {time}, {dir}, {shift}", 1, None)

	def base_note(cmd, pos):
		byte = reader.get_rom_byte(pos)
		if byte < 0x80:
			arg1 = byte
			return (f"base_note {NOTES[arg1]}", 1, None)
		else:
			arg1 = 0x100 - byte
			return (f"base_note -{NOTES[arg1]}", 1, None)

	def poly_div(cmd, pos):
		arg1 = cmd & 0x7
		return (f"poly_div {arg1}", 0, None)

	def def_envelope(cmd, pos):
		arg1 = cmd & 0x7
		arg2 = reader.get_rom_byte(pos)
		init_vol = (arg2 & 0xf0) >> 4
		dir = "AUD1ENV_DOWN" if (arg2 & 0x8 == 0) else "AUD1ENV_UP"
		pace = arg2 & 0x7
		return (f"def_envelope ${arg1:0x}, {init_vol:2}, {dir}, {pace}", 1, None)

	def audio_unkf9(cmd, pos):
		arg1 = reader.get_rom_byte(pos)
		return (f"audio_unkf9 ${arg1:02x}", 1, None)

	def audio_call(cmd, pos):
		arg1 = reader.get_rom_word(pos)
		return (f"audio_call ${arg1:04x}", 2, arg1)

	def audio_jp(cmd, pos):
		arg1 = reader.get_rom_word(pos)
		return (f"audio_jp ${arg1:04x}", 0, arg1)

	def audio_ret(cmd, pos):
		return ("audio_ret", 0, None)

	def audio_done(cmd, pos):
		return ("audio_done", 0, None)

	cmds = {
		0xd9: pan,
		0xda: pan,
		0xdb: pan,

		0xe0: poly_div,
		0xe1: poly_div,
		0xe2: poly_div,
		0xe3: poly_div,
		0xe4: poly_div,
		0xe5: poly_div,
		0xe6: poly_div,
		0xe7: poly_div,

		0xe8: def_envelope,
		0xe9: def_envelope,
		0xea: def_envelope,
		0xeb: def_envelope,
		0xec: def_envelope,
		0xed: def_envelope,
		0xee: def_envelope,
		0xef: def_envelope,

		0xf0: duty_cycle,
		0xf1: duty_cycle,
		0xf2: duty_cycle,
		0xf3: duty_cycle,

		0xf7: sweep,
		0xf8: base_note,
		0xf9: audio_unkf9,
		0xfc: audio_call,
		0xfd: audio_jp,
		0xfe: audio_ret,
		0xff: audio_done,
	}

	def note(cmd, arg):
		arg2 = arg & 0x1f
		arg3 = (arg & 0xe0) >> 5

		if cmd != 0x6f:
			return f"note {NOTES[cmd]}, {arg2:2}, ${arg3:0x}"
		else:
			return f"rest {arg2:2}"

	processed = {}
	pending = OFFSETS

	while len(pending) > 0:
		o = pending.pop()
		offset = o + 0xf4000
		if offset in processed:
			continue

		string = f"Sound_{offset:0x}:\n"

		pos = offset
		while True:
			cmd = reader.get_rom_byte(pos)
			pos += 1

			if cmd >= 0xd0:
				if cmd not in cmds:
					print(f"Unknown command 0x{cmd:0x}")

				txt, offs, branch = cmds[cmd](cmd, pos)
				pos += offs
				string += "\t" + txt + "\n"
				if branch:
					pending.add(branch)

				if cmd in [0xfd, 0xfe, 0xff]:
					break
			else:
				arg = reader.get_rom_byte(pos)
				pos += 1
				string += "\t" + note(cmd, arg) + "\n"

		processed[offset] = process_addresses(string)

	for offset in sorted(processed.keys()):
		print(processed[offset])

if __name__ == "__main__":
	main()
