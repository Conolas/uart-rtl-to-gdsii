`timescale 1ns/1ps

module baud_gen(
    input clk, rst_n,
    output reg baud_tick, half_baud
);

reg [13:0] count = 0;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        count <= 14'd0;
        baud_tick <= 1'b0;
        half_baud <= 1'b0;
    end

    else
    begin
        baud_tick <= 1'b0;
        half_baud <= 1'b0;

        if(count == 14'd5207)
            half_baud <= 1'b1;

        if(count == 14'd10417)
        begin
            baud_tick <= 1'b1;
            count <= 14'd0;
        end
        else
        begin
            count <= count + 14'd1;
        end
    end
end

endmodule