# RTL Directory

This directory contains all synthesizable Verilog RTL modules used in the UART subsystem.

---

# Modules

| File | Description |
|---|---|
| baud_gen.v | Generates baud tick and half-baud synchronization pulse |
| uart_tx.v | UART transmitter FSM |
| uart_rx.v | UART receiver FSM |
| uart_top.v | Top-level integration module |

---

# Design Methodology

- Modular RTL design
- FSM-based UART communication
- Synthesizable Verilog HDL
- ASIC-ready coding style

---

# UART TX FSM

IDLE → START → DATA → STOP

---

# UART RX FSM

IDLE → START Detection → DATA Sampling → STOP Verification

---

# Notes

- UART frame format: 1 Start + 8 Data + 1 Stop
- Data transmitted LSB first
- RX uses half-baud synchronization for center-bit sampling
