import reader
import argparse
import re

def read_charmap():
	with open("src/constants/charmap.asm", 'r') as file:
		file_text = file.read()

	charmap = {}
	for match in re.finditer(r"\tCHARMAP \"(.+?)\", *\$([0-9a-f]{2})", file_text):
		val = int(match[2], 16)
		char = match[1]
		charmap[val] = char

	return charmap

def main():
	parser = argparse.ArgumentParser(description='Parse text data.')
	parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
						help='offsets of text data')
	args = parser.parse_args()

	charmap = read_charmap()

	for offset in [int(o, 16) for o in args.offsets]:
		print(f"Text_{offset:0x}:")

		out_str = ""
		pos = offset

		start_text = True
		while True:
			val = reader.get_rom_byte(pos)
			pos += 1

			if val >= 0xb0:
				control_char = charmap[val]
				if control_char == "<LINE>":
					out_str += "\"\n\tline \""
				elif control_char == "<PROMPT>":
					out_str += "\"\n\tprompt\n"
					start_text = True
				elif control_char == "<DONE>":
					out_str += "\tdone\n"
					break
				else:
					out_str += charmap[val]
					# msg = f"Unknown control character 0x{val:02x}"
					# raise RuntimeError(msg)
			else:
				if start_text:
					out_str += "\ttext \""
					start_text = False

				out_str += charmap[val]

		print(out_str)

if __name__ == "__main__":
	main()