import reader

SIZE = 0xb80

OFFSETS = [
    (0x2e, 0x4002, "Weevil", "WEEVIL"),
    (0x2e, 0x4a03, "Mai", "MAI"),
    (0x2e, 0x5391, "Rex", "REX"),
    (0x2e, 0x5c7b, "Mako", "MAKO"),
    (0x2e, 0x6605, "YamiYugi", "YAMI_YUGI"),
    (0x2e, 0x6f98, "Yugi", "YUGI"),
    (0x2f, 0x4002, "Tea", "TEA"),
    (0x2f, 0x45cc, "Joey", "JOEY"),
    (0x2f, 0x4f58, "SetoKaiba", "SETO_KAIBA"),
    (0x2f, 0x59be, "Mokuba", "MOKUBA"),
    (0x2f, 0x6218, "Tristan", "TRISTAN"),
    (0x2f, 0x6bd6, "Bakura", "BAKURA"),
    (0x30, 0x4002, "Puppeteer", "PUPPETEER"),
    (0x30, 0x4880, "Panik", "PANIK"),
    (0x30, 0x5313, "BanditKeith", "BANDIT_KEITH"),
    (0x30, 0x5d90, "Maximillion", "MAXIMILLION"),
    (0x30, 0x67df, "Simon", "SIMON"),
    (0x30, 0x71df, "Exodia", "EXODIA"),
]

sections = {}

for bank, addr, name, constant in OFFSETS:
    offset = (bank - 1) * 0x4000 + addr

    pos = offset
    total_size = 0
    while True:
        cmd = reader.get_rom_byte(pos)
        pos += 1
        done = False
        for b in range(8):
            if cmd & (1 << b) != 0:
                pos += 1
                total_size += 1
            else:
                length = (reader.get_rom_byte(pos + 1) & 0x1f) + 3
                pos += 2
                total_size += length

            if total_size == SIZE:
                done = True
                break

            if total_size > SIZE:
                print(f"Got invalid size for {name}, 0x{total_size:0x}")
                done = True
                break

        if done:
            break

    size = pos - offset
    data = reader.get_rom_bytes(offset, size)
    filename = constant.lower()
    filename = f"characters/{filename}.2bpp.lz"
    with open(filename, "wb") as file:
        file.write(data)

    label = f'{name}Gfx:'
    gfx_inc = f'{label:22} INCBIN "{filename}"'

    if bank not in sections:
        sections[bank] = []
    sections[bank].append(gfx_inc)

bank_idx = 1
for bank, gfx_incs in sections.items():
    print(f'\nSECTION "Gfx {bank_idx}", BANK[${bank:02x}]')
    print(f'\tdw BANK(@)')
    for gfx_inc in gfx_incs:
        print(f"{gfx_inc}")
    bank_idx += 1
