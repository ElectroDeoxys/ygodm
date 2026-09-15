import reader
import argparse

def parse_pal(byte):
    shades = [
        "SHADE_WHITE",
        "SHADE_LIGHT",
        "SHADE_DARK",
        "SHADE_BLACK",
    ]

    return ", ".join([shades[(byte >> (2*i)) & 0x3] for i in range(4)])

def main():
    parser = argparse.ArgumentParser(description='Parse screen config data.')
    parser.add_argument('offset', metavar='offset', type=str, nargs=1)
    args = parser.parse_args()
    offset = int(args.offset[0], 16)

    data = reader.get_rom_bytes(offset, 10)

    print(f"ScreenConfig_{offset:0x}:")

    lcdc_flags= [
        (0x01, "LCDC_BG_OFF", "LCDC_BG_ON"),
        (0x02, "LCDC_OBJ_OFF", "LCDC_OBJ_ON"),
        (0x04, "LCDC_OBJ_8", "LCDC_OBJ_16"),
        (0x08, "LCDC_BG_9800", "LCDC_BG_9C00"),
        (0x10, "LCDC_BLOCK21", "LCDC_BLOCK01"),
        (0x20, "LCDC_WIN_OFF", "LCDC_WIN_ON"),
        (0x40, "LCDC_WIN_9800", "LCDC_WIN_9C00"),
    ]

    lcdc = [enabled if data[0] & bitmask != 0 else disabled for bitmask, disabled, enabled in lcdc_flags]
    print("\tdb " + " | ".join(lcdc) + " ; LCDC")

    stat_flags= [
        (0x02, "STAT_BUSY"),
        (0x04, "STAT_LYCF"),
        (0x08, "STAT_MODE_0"),
        (0x10, "STAT_MODE_1"),
        (0x20, "STAT_MODE_2"),
        (0x40, "STAT_LYC"),
    ]

    stat = [enabled for bitmask, enabled in stat_flags if data[1] & bitmask != 0]
    print("\tdb " + " | ".join(stat) + " ; STAT")

    print(f"\tdb {data[2]:3} ; SCY")
    print(f"\tdb {data[3]:3} ; SCX")
    print(f"\tdb {data[4]:3} ; LYC")

    bgp = parse_pal(data[5])
    print(f"\tdbpal {bgp} ; BGP")
    obp0 = parse_pal(data[6])
    print(f"\tdbpal {obp0} ; OBP0")
    obp1 = parse_pal(data[7])
    print(f"\tdbpal {obp1} ; OBP1")

    print(f"\tdb {data[8]:3} ; WY")
    print(f"\tdb {data[9] - 7:3} + WX_OFS ; WX")


if __name__ == "__main__":
    main()
