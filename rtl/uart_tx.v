`timescale 1ns/1ps

module uart_tx(
    input baud_tick, rst_n, clk, tx_start,
    input [7:0]data, 
    output reg tx , tx_busy
);

reg [1:0]state;
reg [2:0] bit_index = 3'd0;
reg [7:0] data_reg;

localparam IDLE  = 2'd0;
localparam START = 2'd1;
localparam DATA  = 2'd2;
localparam STOP  = 2'd3;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        state <= IDLE;
        bit_index <= 3'd0;
        tx <= 1'd1;
        tx_busy <= 1'd0;
    end
    else
    begin
        if(baud_tick)
        begin
            case (state)
                IDLE : begin
                            tx <= 1'd1;
                            tx_busy <= 1'd0;
                            if(tx_start)
                                state <= START;
                end 
                START : begin
                            tx <= 1'd0;
                            tx_busy <= 1'd1;
                            state <= DATA;
                            bit_index <= 3'd0;
                            data_reg <= data;
                end
                DATA : begin
                            tx <= data_reg[bit_index];
                            
                            if (bit_index == 3'd7)  
                                begin
                                    state <= STOP;
                                    bit_index <= 3'd0;
                                end
                            else
                                bit_index <= bit_index + 3'd1;
                end
                STOP : begin
                            tx <= 1'd1;
                            state <= IDLE;
                            tx_busy <= 1'd0;
                end
                default: begin
                            state <= IDLE;
                            tx <= 1'b1;
                end
            endcase
        end
    end
end
endmodule