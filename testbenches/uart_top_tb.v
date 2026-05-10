`timescale 1ns/1ps

module uart_top_tb;

reg clk;
reg rst_n;
reg tx_start;

reg [7:0] tx_data;

wire [7:0] rx_data;
wire rx_done;
wire tx_busy;


// DUT
uart_top DUT (

    .clk(clk),
    .rst_n(rst_n),

    .tx_start(tx_start),
    .tx_data(tx_data),

    .rx_data(rx_data),
    .rx_done(rx_done),
    .tx_busy(tx_busy)

);


// Clock generation
always #10 clk = ~clk;


initial
begin

    clk = 0;
    rst_n = 0;

    tx_start = 0;
    tx_data = 8'h00;

    // Reset
    #100;
    rst_n = 1;

    // Wait some time
    #200000;

    // Send A5
    tx_data = 8'hA5;
    tx_start = 1;

    wait(tx_busy);
    tx_start = 0;

    // Wait for reception
    #2000000;

    // Display result
    if(rx_data == 8'hA5)
        $display("PASS : Received Data = %h", rx_data);
    else
        $display("FAIL : Received Data = %h", rx_data);

    #100000;

    $finish;

end


initial
begin
    $dumpfile("uart_top.vcd");
    $dumpvars(0, uart_top_tb);
end

endmodule