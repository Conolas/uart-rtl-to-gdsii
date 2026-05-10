#!/bin/bash

echo "Compiling Baud Generator..."

iverilog -o baud_gen.out \
../rtl/baud_gen.v \
../tb/baud_gen_tb.v

echo "Running Simulation..."

vvp baud_gen.out

echo "Opening GTKWave..."

gtkwave baud_gen.vcd