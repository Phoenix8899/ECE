`timescale 1ns / 1ps

module dlatch (
    input d,
    output reg q, 
    input clk
    );

    always @(clk or d) begin
        if (clk)
            q <=d;
        end    
endmodule 
