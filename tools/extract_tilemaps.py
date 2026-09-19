import reader

OFFSETS = [
    (0x1824d, "weevil"),
    (0x18329, "mai"),
    (0x18405, "rex"),
    (0x184e1, "mako"),
    (0x185bd, "yami_yugi"),
    (0x18699, "yugi"),
    (0x18775, "tea"),
    (0x18851, "joey"),
    (0x1892d, "seto_kaiba"),
    (0x18a09, "mokuba"),
    (0x18ae5, "tristan"),
    (0x18bc1, "bakura"),
    (0x18c9d, "puppeteer"),
    (0x18d79, "panik"),
    (0x18e55, "bandit_keith"),
    (0x18f31, "maximillion"),
    (0x1900d, "simon"),
    (0x190e9, "exodia"),
]

for offset, character in OFFSETS:
    data = reader.get_rom_bytes(offset, 220)
    with open(f"src/data/tilemaps/{character}.tilemap", "wb") as file:
        file.write(data)
