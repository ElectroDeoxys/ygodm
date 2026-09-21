import reader
import argparse
from collections import deque

LOOKBACK_SIZE  = 0x400
LOOKBACK_START = 0x3de

def main():
    parser = argparse.ArgumentParser(description='Decompress .lz files.')
    parser.add_argument('files', metavar='files', type=str, nargs='+')
    args = parser.parse_args()

    for filename in args.files:
        print(f"Decompressing {filename}")

        with open(filename, "rb") as file:
            compressed = deque(file.read())

        decompressed = []
        lookback = [0x20] * LOOKBACK_SIZE
        lb_idx = LOOKBACK_START

        def write_byte(val):
            nonlocal decompressed
            nonlocal lookback
            nonlocal lb_idx

            decompressed.append(val)
            lookback[lb_idx] = val
            lb_idx = (lb_idx + 1) % LOOKBACK_SIZE

        while len(compressed) > 0:
            cmd = compressed.popleft()
            for i in range(8):
                if cmd & (1 << i) != 0:
                    # literal copy
                    write_byte(compressed.popleft())
                else:
                    # lookback
                    lo = compressed.popleft()
                    hi = compressed.popleft()
                    offs = lo | ((hi & 0x60) << 3)
                    size = (hi & 0x1f) + 3

                    for i in range(size):
                        write_byte(lookback[(offs + i) % LOOKBACK_SIZE])

                if len(compressed) == 0:
                    break

        with open(filename[:-3], "wb") as file:
            file.write(bytes(decompressed[:0x500]))

if __name__ == "__main__":
    main()
