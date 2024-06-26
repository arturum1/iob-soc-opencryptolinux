#!/bin/sh 

# Load Linux Kernel Modules
insmod iob_dma.ko
insmod iob_axistream_in.ko
insmod iob_axistream_out.ko
insmod iob_ila.ko

# Run DMA demo
./dma_demo
