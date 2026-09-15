import re

def insert_first_section(matcher):
	offset = int(matcher[1], 16)
	bank = offset // 0x4000
	rel_offset = offset % 0x4000 + (0x4000 if bank != 0 else 0)
	if bank == 0:
		return f'SECTION "Bank {bank:0x}@{rel_offset:0x}", ROM0[${rel_offset:0x}]\n\nFunc_{matcher[1]}:'
	return f'SECTION "Bank {bank:0x}@{rel_offset:0x}", ROMX[${rel_offset:0x}], BANK[${bank:0x}]\n\nFunc_{matcher[1]}:'

def insert_section(matcher):
	offset = int(matcher[2], 16)
	bank = offset // 0x4000
	rel_offset = offset % 0x4000 + (0x4000 if bank != 0 else 0)
	if bank == 0:
		return f'{matcher[1]}\n\nSECTION "Bank {bank:0x}@{rel_offset:0x}", ROM0[${rel_offset:0x}]\n\nFunc_{matcher[2]}:'
	return f'{matcher[1]}\n\nSECTION "Bank {bank:0x}@{rel_offset:0x}", ROMX[${rel_offset:0x}], BANK[${bank:0x}]\n\nFunc_{matcher[2]}:'

substrings = [
	(r"ldh \[hROMBank\], a\n\tld \[\$2150\], a", "bankswitch"),
	(r"ldh \[hWRAMBank\], a\n\tldh \[rWBK\], a", "wramswitch"),
	(r"ldh \[hVRAMBank\], a\n\tldh \[rVBK\], a", "vramswitch"),

	(r"(\..+)\n\tldh a, \[rSTAT\]\n\tand \$02\n\tjr z, \1\n(\..+)\n\tldh a, \[rSTAT\]\n\tand \$02\n\tjr nz, \2", "\twait_ppu"),

	(r"; 0x([a-f0-9]+)\n\nFunc_\1:", lambda m: "\nFunc_{}:".format(m[1])),
	(r"(; 0x[a-f0-9]+)\n\nFunc_([a-f0-9]+):", insert_section),

	(r"ld a, \$(..)\n\tld \[\wcfe1\], a\n\tld a, \$..\n\tld \[\$4100\], a\n\tld a, \$..\n\tld \[\$2100\], a", lambda m: "bankswitch ${:0x}".format(int(m[1], 16))),
]

def process(body):
	# first section
	body = re.sub(r"Func_([a-f0-9]+):", insert_first_section, body, 1)

	for pattern, repl in substrings:
		body = re.sub(pattern, repl, body)
	return body
