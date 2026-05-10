# Simulation Directory

This directory contains simulation executables, scripts, and waveform-related files.

---

# Purpose

Used for:
- RTL compilation
- Simulation execution
- Waveform generation
- Functional debugging

---

# Typical Simulation Flow

## Compile

```bash
iverilog -o uart_top.out \
../rtl/baud_gen.v \
../rtl/uart_tx.v \
../rtl/uart_rx.v \
../rtl/uart_top.v \
../tb/uart_top_tb.v
```

## Run

```bash
vvp uart_top.out
```

## View Waveforms

```bash
gtkwave uart_top.vcd
```

---

# Tools

- Icarus Verilog
- GTKWave
