import reader
import argparse

def main():
    parser = argparse.ArgumentParser(description='Parse filler data at end of bank.')
    parser.add_argument('offset', metavar='offset', type=str, nargs=1)
    args = parser.parse_args()

    start_pos = int(args.offset[0], 16)
    filler = reader.get_rom_bytes(start_pos, 0x4000 - (start_pos % 0x4000))
    bank_num = start_pos // 0x4000
    with open(f"bank{bank_num:02x}.bin", "wb") as file:
        file.write(filler)

if __name__ == "__main__":
    main()
