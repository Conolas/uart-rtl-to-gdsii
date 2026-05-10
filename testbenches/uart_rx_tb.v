`timescale 1ns/1ps

module uart_rx_tb;

reg clk;
reg rst_n;
reg rx;

wire baud_tick;
wire half_baud;

wire [7:0] data;
wire rx_done;


// DUTs
baud_gen DUT1 (
    .clk(clk),
    .rst_n(rst_n),
    .baud_tick(baud_tick),
    .half_baud(half_baud)
);

uart_rx DUT2 (
    .clk(clk),
    .rst_n(rst_n),
    .rx(rx),
    .baud_tick(baud_tick),
    .half_baud(half_baud),
    .data(data),
    .rx_done(rx_done)
);


// clock generation
always #10 clk = ~clk;


// task to send UART byte
task send_uart_byte;

    input [7:0] tx_data;
    integer i;

    begin

        // START bit
        rx = 0;
        #(104160);

        // DATA bits (LSB first)
        for(i=0; i<8; i=i+1)
        begin
            rx = tx_data[i];
            #(104160);
        end

        // STOP bit
        rx = 1;
        #(104160);

    end

endtask


initial
begin

    clk = 0;
    rst_n = 0;
    rx = 1;

    #100;
    rst_n = 1;

    #200000;

    send_uart_byte(8'hA5);

    #200000;

    $finish;

end


initial
begin
    $dumpfile("uart_rx.vcd");
    $dumpvars(0, uart_rx_tb);
end

endmodule