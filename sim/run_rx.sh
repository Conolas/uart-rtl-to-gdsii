#!/bin/bash

echo "Compiling UART RX..."

iverilog -o uart_rx.out \
../rtl/baud_gen.v \
../rtl/uart_rx.v \
../tb/uart_rx_tb.v

echo "Running Simulation..."

vvp uart_rx.out

echo "Opening GTKWave..."

gtkwave uart_rx.vcd