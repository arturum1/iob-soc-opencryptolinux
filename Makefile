CORE := iob_soc_opencryptolinux

SIMULATOR ?= icarus
BOARD ?= AES-KU040-DB-G
GRAB_TIMEOUT ?= 1800

DISABLE_LINT:=1

LIB_DIR:=submodules/IOBSOC/submodules/LIB
include $(LIB_DIR)/setup.mk

INIT_MEM ?= 0
RUN_LINUX ?= 1
USE_EXTMEM := 1

ifeq ($(INIT_MEM),1)
SETUP_ARGS += INIT_MEM
endif

ifeq ($(RUN_LINUX),1)
SETUP_ARGS += RUN_LINUX
endif

setup:
	make build-setup SETUP_ARGS="$(SETUP_ARGS)"

sim-test-linux:
	nix-shell --run "make clean"
	nix-shell --run "make setup INIT_MEM=1 RUN_LINUX=1"
	nix-shell --run "make -C ../iob_soc_o* sim-run SIMULATOR=verilator"

sim-test:
	nix-shell --run "make clean"
	nix-shell --run "make setup INIT_MEM=1 RUN_LINUX=0"
	nix-shell --run "make -C ../iob_soc_o* sim-run"
	nix-shell --run "make clean"
	nix-shell --run "make setup INIT_MEM=0 RUN_LINUX=0"
	nix-shell --run "make -C ../iob_soc_o* sim-run SIMULATOR=verilator"

fpga-run:
	nix-shell --run 'make clean setup INIT_MEM=$(INIT_MEM) USE_EXTMEM=$(USE_EXTMEM) RUN_LINUX=$(RUN_LINUX) && make -C ../$(CORE)_V*/ fpga-fw-build BOARD=$(BOARD)'
	make -C ../$(CORE)_V*/ fpga-run BOARD=$(BOARD) GRAB_TIMEOUT=$(GRAB_TIMEOUT)

fpga-test:
	# IOb-SoC-Opencryptolinux only supports USE_EXTMEM=1
	make clean setup fpga-run INIT_MEM=0 USE_EXTMEM=1

test-all:
	make sim-test
	make fpga-test BOARD=CYCLONEV-GT-DK
	make fpga-test BOARD=AES-KU040-DB-G
	make clean && make setup && make -C ../iob_soc_opencryptolinux_V*/ doc-test

.PHONY: sim-test fpga-test test-all
