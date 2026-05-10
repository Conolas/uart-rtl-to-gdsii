# UART RTL-to-GDSII ASIC Design

RTL-to-GDSII implementation of a UART (Universal Asynchronous Receiver Transmitter) subsystem using Verilog HDL and OpenROAD ASIC flow.

---

# Project Overview

This project implements:

- UART Transmitter (TX)
- UART Receiver (RX)
- Baud Rate Generator
- Integrated UART Top Module
- Functional Verification using Icarus Verilog + GTKWave
- ASIC Physical Design Flow using OpenROAD

The design follows a modular RTL methodology suitable for FPGA and ASIC implementation.

---

# Features

## UART TX
- Start bit generation
- Serial transmission of 8-bit data
- Stop bit generation
- TX busy signaling

## UART RX
- Start bit detection
- Mid-bit sampling using half-baud synchronization
- Serial-to-parallel conversion
- RX done signaling

## Baud Generator
- Configurable baud tick generation
- Half-baud pulse generation for RX synchronization

---

# Tools Used

| Stage | Tool |
|---|---|
| RTL Design | Verilog HDL |
| Simulation | Icarus Verilog |
| Waveform Analysis | GTKWave |
| ASIC Flow | OpenROAD |
| Editor | VS Code |
| Environment | Ubuntu WSL |

---

# Simulation Flow

## Compile

```bash
iverilog -o sim/uart_top.out \
rtl/baud_gen.v \
rtl/uart_tx.v \
rtl/uart_rx.v \
rtl/uart_top.v \
tb/uart_top_tb.v
```

## Run

```bash
vvp sim/uart_top.out
```

## View Waveforms

```bash
gtkwave uart_top.vcd
```

---

# UART Architecture

## TX Flow

IDLE → START → DATA → STOP

## RX Flow

IDLE → START Detection → DATA Sampling → STOP Verification

---

# Verification Results

- Successful UART TX serialization
- Correct RX deserialization
- Verified baud synchronization
- Loopback validation completed

---

# Future Improvements

- Configurable baud rate
- UART FIFO buffering
- Parity bit support
- Oversampling receiver
- APB/AXI interface integration
- Complete RTL-to-GDSII tapeout flow

---

# Author

Jatin ( Conolas )
