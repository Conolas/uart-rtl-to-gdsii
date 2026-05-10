`timescale 1ns/1ps

module uart_rx(
    input half_baud, rst_n, clk, rx, baud_tick,
    output reg [7:0] data,
    output reg rx_done
);

reg [1:0] state;
reg [2:0] bit_index = 3'd0;

reg first_tick;

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
        rx_done <= 1'b0;
        first_tick <= 1'b0;
    end

    else
    begin
        rx_done <= 1'b0;

        case (state)

            IDLE :
            begin
                if(!rx)
                    state <= START;
            end


            START :
            begin
                if(half_baud)
                begin
                    state <= DATA;
                    bit_index <= 3'd0;

                    // skip first baud tick
                    first_tick <= 1'b1;
                end
            end


            DATA :
            begin
                if(baud_tick)
                begin

                    // ignore first baud tick
                    if(first_tick)
                    begin
                        first_tick <= 1'b0;
                    end

                    else
                    begin
                        data[bit_index] <= rx;

                        if(bit_index == 3'd7)
                        begin
                            state <= STOP;
                            bit_index <= 3'd0;
                        end

                        else
                            bit_index <= bit_index + 3'd1;
                    end
                end
            end


            STOP :
            begin
                if(baud_tick)
                begin
                    if(rx)
                        rx_done <= 1'b1;

                    state <= IDLE;
                end
            end


            default :
                state <= IDLE;

        endcase
    end
end

endmodule