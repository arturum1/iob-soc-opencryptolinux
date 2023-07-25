#!/usr/bin/env python3
import os
import shutil

from iob_soc import iob_soc
from iob_vexriscv import iob_vexriscv
from iob_uart16550 import iob_uart16550
from iob_plic import iob_plic
from iob_clint import iob_clint
from iob_uart import iob_uart


class iob_soc_opencryptolinux(iob_soc):
    name = "iob_soc_opencryptolinux"
    version = "V0.70"
    flows = "pc-emul emb sim doc fpga"
    setup_dir = os.path.dirname(__file__)

    @classmethod
    def _create_instances(cls):
        super()._create_instances()
        # Verilog modules instances if we have them in the setup list (they may not be in the list if a subclass decided to remove them).
        if iob_vexriscv in cls.submodule_list:
            cls.cpu = iob_vexriscv("cpu_0")
        # Instantiate OpenCryptoLinux peripherals
        if iob_uart16550 in cls.submodule_list:
            cls.peripherals.append(iob_uart16550("UART0", "Default UART interface"))
        if iob_plic in cls.submodule_list:
            cls.peripherals.append(
                iob_plic(
                    "PLIC0",
                    "PLIC peripheral",
                    parameters={"N_SOURCES": "32", "N_TARGETS": "2"},
                )
            )
        if iob_clint in cls.submodule_list:
            cls.peripherals.append(iob_clint("CLINT0", "CLINT peripheral"))

    @classmethod
    def _create_submodules_list(cls, extra_submodules=[]):
        """Create submodules list with dependencies of this module"""
        super()._create_submodules_list(
            [
                iob_vexriscv,
                iob_uart16550,
                iob_clint,
                iob_plic,
                (iob_uart, {"purpose": "simulation"}),
            ]
        )
        # Remove picorv32 and uart from iob-soc
        i = 0
        while i < len(cls.submodule_list):
            if type(cls.submodule_list[i]) == type and cls.submodule_list[i].name in [
                "iob_picorv32",
                "iob_uart",
            ]:
                cls.submodule_list.pop(i)
                continue
            i += 1

    @classmethod
    def _post_setup(cls):
        super()._post_setup()
        shutil.copy(
            f"{cls.setup_dir}/submodules/UART16550/software/src/printf.c",
            f"{cls.build_dir}/software/src",
        )

    @classmethod
    def _setup_confs(cls, extra_confs=[]):
        # Append confs or override them if they exist
        super()._setup_confs(
            [
                {
                    "name": "RUN_LINUX",
                    "type": "M",
                    "val": False,
                    "min": "0",
                    "max": "1",
                    "descr": "Used to select running linux.",
                },
                {
                    "name": "INIT_MEM",
                    "type": "M",
                    "val": True,
                    "min": "0",
                    "max": "1",
                    "descr": "Used to select running linux.",
                },
                {
                    "name": "USE_EXTMEM",
                    "type": "M",
                    "val": True,
                    "min": "0",
                    "max": "1",
                    "descr": "Always use external memory in the SoC.",
                },
                {
                    "name": "N_CORES",
                    "type": "P",
                    "val": "1",
                    "min": "1",
                    "max": "32",
                    "descr": "Number of CPU cores used in the SoC.",
                },
                # INTERRUPTS ARCHITECTURE
                {
                    "name": "N_SOURCES",
                    "type": "P",
                    "val": "32",
                    "min": "1",
                    "max": "32",
                    "descr": "Number of peripherals that can generate an external interrupt to be interpreted by the PLIC.",
                },
                {
                    "name": "N_TARGETS",
                    "type": "P",
                    "val": "2",
                    "min": "1",
                    "max": "32",
                    "descr": "Number of HARTs in the SoC.",
                },
                {
                    "name": "BOOTROM_ADDR_W",
                    "type": "P",
                    "val": "13",
                    "min": "1",
                    "max": "32",
                    "descr": "Boot ROM address width",
                },
            ]
            + extra_confs
        )

        # Remove unnecessary confs of IOb-SoC
        i = 0
        while i < len(cls.confs):
            if cls.confs[i]["name"] in ["USE_MUL_DIV", "USE_COMPRESSED"]:
                cls.confs.pop(i)
                continue
            i += 1

    # Method that runs the setup process of this class
    @classmethod
    def _setup_portmap(cls):
        if iob_uart16550 in cls.submodule_list:
            cls.peripheral_portmap += [
                # Map interrupt port to internal wire
                (
                    {
                        "corename": "UART0",
                        "if_name": "interrupt",
                        "port": "interrupt",
                        "bits": [],
                    },
                    {"corename": "internal", "if_name": "UART", "port": "", "bits": []},
                ),
                # Map other rs232 ports to external interface (system IO)
                (
                    {
                        "corename": "UART0",
                        "if_name": "rs232",
                        "port": "txd",
                        "bits": [],
                    },
                    {"corename": "external", "if_name": "UART", "port": "", "bits": []},
                ),
                (
                    {
                        "corename": "UART0",
                        "if_name": "rs232",
                        "port": "rxd",
                        "bits": [],
                    },
                    {"corename": "external", "if_name": "UART", "port": "", "bits": []},
                ),
                (
                    {
                        "corename": "UART0",
                        "if_name": "rs232",
                        "port": "cts",
                        "bits": [],
                    },
                    {"corename": "external", "if_name": "UART", "port": "", "bits": []},
                ),
                (
                    {
                        "corename": "UART0",
                        "if_name": "rs232",
                        "port": "rts",
                        "bits": [],
                    },
                    {"corename": "external", "if_name": "UART", "port": "", "bits": []},
                ),
            ]
        if iob_clint in cls.submodule_list:
            cls.peripheral_portmap += [
                # Map `mtip` of CLINT0 to an internal wire named `CLINT0_mtip`
                (
                    {
                        "corename": "CLINT0",
                        "if_name": "clint_io",
                        "port": "mtip",
                        "bits": [],
                    },
                    {
                        "corename": "internal",
                        "if_name": "CLINT0",
                        "port": "",
                        "bits": [],
                    },
                ),
                # Map `msip` of CLINT0 to an internal wire named `CLINT0_msip`
                (
                    {
                        "corename": "CLINT0",
                        "if_name": "clint_io",
                        "port": "msip",
                        "bits": [],
                    },
                    {
                        "corename": "internal",
                        "if_name": "CLINT0",
                        "port": "",
                        "bits": [],
                    },
                ),
                # Map `msip` of CLINT0 to an internal wire named `CLINT0_msip`
                (
                    {
                        "corename": "CLINT0",
                        "if_name": "clint_io",
                        "port": "rt_clk",
                        "bits": [],
                    },
                    {
                        "corename": "internal",
                        "if_name": "CLINT0",
                        "port": "",
                        "bits": [],
                    },
                ),
            ]
        if iob_plic in cls.submodule_list:
            cls.peripheral_portmap += [
                # Map `mtip` of PLIC0 to an internal wire named `PLIC0_irq`
                (
                    {
                        "corename": "PLIC0",
                        "if_name": "plic_io",
                        "port": "irq",
                        "bits": [],
                    },
                    {
                        "corename": "internal",
                        "if_name": "PLIC0",
                        "port": "",
                        "bits": [],
                    },
                ),
                # Map `msip` of PLIC0 to an internal wire named `PLIC0_src`
                (
                    {
                        "corename": "PLIC0",
                        "if_name": "plic_io",
                        "port": "src",
                        "bits": [],
                    },
                    {
                        "corename": "internal",
                        "if_name": "PLIC0",
                        "port": "",
                        "bits": [],
                    },
                ),
            ]