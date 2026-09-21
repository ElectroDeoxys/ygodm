#define PROGRAM_NAME "fix_rom_size"
#define USAGE_OPTS "[-h|--help] infile"

#include "common.h"
#include "string.h"

void parse_args(int argc, char *argv[])
{
    struct option long_options[] = {
        {"help", no_argument, 0, 'h'},
        {0}
    };
    for (int opt; (opt = getopt_long(argc, argv, "h", long_options)) != -1;)
    {
        switch (opt)
        {
        case 'h':
            usage_exit(0);
            break;
        default:
            usage_exit(1);
        }
    }
}

int main(int argc, char *argv[])
{
    parse_args(argc, argv);

    argc -= optind;
    argv += optind;
    if (argc < 1)
    {
        usage_exit(1);
    }

    if (strncmp(argv[0], "ygodm_edc_jp.gb", strlen("ygodm_edc_jp.gb")) != 0)
    {
        return 0;
    }

    FILE *file = fopen(argv[0], "r+b");
    if (!file)
    {
        error_exit("Could not open file %s", argv[0]);
    }

    // patch cartridge ROM size, 0x148
    if (fseek(file, 0x148, SEEK_SET) != 0)
    {
        fclose(file);
        error_exit("File %s has unexpected size", argv[0]);
    }
    fputc(0x05, file);

    // patch heder checksum, 0x14d
    if (fseek(file, 0x14d, SEEK_SET) != 0)
    {
        fclose(file);
        error_exit("File %s has unexpected size", argv[0]);
    }
    fputc(0x50, file);

    fclose(file);
    return 0;
}
