`timescale 1ns/1ps

module baud_gen(
    input clk, rst_n,
    output reg baud_tick, half_baud
);

reg [12:0] count = 0;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        count <= 13'd0;
        baud_tick <= 1'b0;
        half_baud <= 1'b0;
    end

    else
    begin
        baud_tick <= 1'b0;
        half_baud <= 1'b0;

        if(count == 13'd2603)
            half_baud <= 1'b1;

        if(count == 13'd5207)
        begin
            baud_tick <= 1'b1;
            count <= 13'd0;
        end
        else
        begin
            count <= count + 13'd1;
        end
    end
end

endmodule