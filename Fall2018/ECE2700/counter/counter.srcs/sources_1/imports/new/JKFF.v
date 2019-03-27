`timescale 1ns / 1ps

module JKFF (
    input j, 
    input k,
    input clk,
    output q
);
    wire d;
    assign d = (j&~q)|(~k&q);
    
    DFF df1(.d(d),.q(q),.clk(clk));
    
endmodule
