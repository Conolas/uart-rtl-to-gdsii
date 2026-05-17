# OpenROAD Physical Design Flow

This directory contains all backend ASIC implementation artifacts generated during the RTL-to-GDSII flow using OpenROAD and the SKY130HD PDK.

## Flow Stages

### 1. Synthesis
Converts RTL Verilog into a gate-level netlist using Yosys.

### 2. Floorplanning
Defines:
- Die area
- Core utilization
- IO placement
- Power distribution network

### 3. Placement
Places standard cells while optimizing:
- Wirelength
- Congestion
- Timing

### 4. Clock Tree Synthesis (CTS)
Builds balanced clock distribution networks and minimizes clock skew.

### 5. Routing
Creates all metal interconnections between placed standard cells.

### 6. Final Signoff
Generates:
- Final DEF
- Final GDSII
- SPEF
- Post-layout netlist

## Directory Structure

```text
openroad/
├── synthesis/
├── floorplan/
├── placement/
├── cts/
├── routing/
├── final/
├── reports/
└── visualizations/


---

# rtl/README.md

```markdown
# RTL Design

This directory contains the Verilog RTL source files for the UART ASIC project.

## Modules

| File | Description |
|---|---|
| baud_gen.v | Baud rate clock generator |
| uart_tx.v | UART transmitter module |
| uart_rx.v | UART receiver module |
| uart_top.v | Top-level UART integration |

## Design Features

- UART Transmitter
- UART Receiver
- Baud Tick Generation
- FSM-Based Control Logic
- Serial Communication
- Modular RTL Architecture

## Clocking

The design operates using:
- System clock input
- Generated baud tick timing

## Purpose

These RTL files form the frontend design stage of the ASIC implementation flow and are later synthesized into standard-cell gate-level hardware.