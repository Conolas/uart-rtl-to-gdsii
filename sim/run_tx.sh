#!/bin/bash

echo "Compiling UART TX..."

iverilog -o uart_tx.out \
../rtl/uart_tx.v \
../tb/uart_tx_tb.v

echo "Running Simulation..."

vvp uart_tx.out

echo "Opening GTKWave..."

gtkwave uart_tx.vcd