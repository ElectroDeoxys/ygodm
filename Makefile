rom := ygodm.gb

rom_obj := \
	src/audio.o \
	src/home.o \
	src/gfx.o \
	src/main.o \
	src/ram.o

ygodm_obj := $(rom_obj:.o=.o)


### Build tools

ifeq (,$(shell command -v sha1sum 2>/dev/null))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink

RGBASMFLAGS  ?= -Weverything
RGBLINKFLAGS ?= -Weverything -d
RGBFIXFLAGS  ?= -Weverything
RGBGFXFLAGS  ?= -Weverything


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: \
	all \
	ygodm \
	clean \
	tidy \
	compare \
	tools

all: ygodm compare
ygodm: ygodm.gb

clean: tidy
	find src/gfx \
	     \( -name "*.[12]bpp" \) \
	     -delete

tidy:
	$(RM) $(rom) \
	      $(rom:.gb=.sym) \
	      $(rom:.gb=.map) \
	      $(ygodm_obj) \
	      src/rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c rom.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS += -Wtruncation -I src/ -P src/includes.asm
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(ygodm_obj): RGBASMFLAGS +=

src/rgbdscheck.o: src/rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := src/includes.asm $(shell tools/scan_includes -s -I src/ src/includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes -s -I src/ $2) $(preinclude_deps) | src/rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for shared objects objects
$(foreach obj, $(ygodm_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


RGBFIXFLAGS += -sv -k A4 -l 0x33 -m MBC1+RAM+BATTERY -p 0xff -r 2 -t YUGIOU

$(rom): $(ygodm_obj) src/layout.link
	$(RGBLINK) $(RGBLINKFLAGS) -l src/layout.link -m $(rom:.gb=.map) -n $(rom:.gb=.sym) -O baserom.gb -o $@ $(filter %.o,$^)
	$(RGBFIX) $(RGBFIXFLAGS) $@

### Special sprite rules

src/gfx/font.1bpp: tools/gfx += --remove-whitespace

src/gfx/gfx_630b.2bpp: tools/gfx += --interleave --png=$<
src/gfx/gfx_6675.2bpp: tools/gfx += --interleave --png=$<
src/gfx/gfx_68f4.2bpp: tools/gfx += --interleave --png=$<
src/gfx/gfx_6ce6.2bpp: tools/gfx += --interleave --png=$<
src/gfx/characters/%.2bpp: tools/gfx += --interleave --png=$<

### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) --colors dmg $(RGBGFXFLAGS) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) --colors dmg $(RGBGFXFLAGS) --depth 1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) --depth 1 -o $@ $@)
