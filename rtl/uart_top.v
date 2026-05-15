`timescale 1ns/1ps

module uart_top(

    input clk,
    input rst_n,
    input tx_start,
    input [7:0] tx_data,

    output [7:0] rx_data,
    output rx_done,
    output tx_busy

);

wire baud_tick;
wire half_baud;
wire [3:0]state;

wire tx;


// Baud Generator
baud_gen BAUD_GEN (

    .clk(clk),
    .rst_n(rst_n),

    .baud_tick(baud_tick),
    .half_baud(half_baud)

);


// UART TX
uart_tx UART_TX (

    .clk(clk),
    .rst_n(rst_n),

    .baud_tick(baud_tick),

    .tx_start(tx_start),
    .data(tx_data),

    .tx(tx),
    .tx_busy(tx_busy)

);

//ILA
ila_0 ILA_DEBUG (

    .clk(clk),

    .probe0(uart_rx),
    .probe1(uart_tx),
    .probe2(rx_done),
    .probe3(state)

);


// UART RX
uart_rx UART_RX (

    .clk(clk),
    .rst_n(rst_n),

    .rx(tx),

    .baud_tick(baud_tick),
    .half_baud(half_baud),

    .data(rx_data),
    .rx_done(rx_done)

);

endmodule