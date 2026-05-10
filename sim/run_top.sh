#!/bin/bash

iverilog -o uart_top.out \
../rtl/baud_gen.v \
../rtl/uart_tx.v \
../rtl/uart_rx.v \
../rtl/uart_top.v \
../tb/uart_top_tb.v

vvp uart_top.out

gtkwave uart_top.vcd
