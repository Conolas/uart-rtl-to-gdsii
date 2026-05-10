`timescale 1ns/1ps

module uart_tx_tb;

reg clk;
reg rst_n;
reg baud_tick;
reg tx_start;

reg [7:0] data;

wire tx;
wire tx_busy;

uart_tx DUT(
    .clk(clk),
    .rst_n(rst_n),
    .baud_tick(baud_tick),
    .tx_start(tx_start),
    .data(data),
    .tx(tx),
    .tx_busy(tx_busy)
);

always #10 clk = ~clk;

always begin
    baud_tick = 0;
    #1000;
    baud_tick = 1;
    #20;
end


initial begin

    clk = 0;
    rst_n = 0;
    tx_start = 0;
    data = 8'h00;

    #50;
    rst_n = 1;

  #2000;
    data = 8'hA5;
    tx_start = 1;
   
    #30000;
    tx_start = 0;
    $finish;

end

initial begin
    $dumpfile("uart_tx.vcd");
    $dumpvars(0, uart_tx_tb);
end
endmodule