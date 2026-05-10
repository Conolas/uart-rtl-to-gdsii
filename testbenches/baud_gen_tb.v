`timescale 1ns/1ps

module baud_gen_tb;

reg clk;
reg rst_n;

wire baud_tick;
wire half_baud;

baud_gen DUT (
    .clk(clk),
    .rst_n(rst_n),
    .baud_tick(baud_tick),
    .half_baud(half_baud)
);

always #10 clk = ~clk;

initial begin
    clk = 0; rst_n = 0;
    #20 rst_n = 1;
    #2000000 $finish;
end

initial
begin
    $dumpfile("baud_gen.vcd");
    $dumpvars(0, baud_gen_tb);
end

endmodule