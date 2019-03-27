`timescale 1ns / 1ps

module DFF (
    input d, 
    output q,
    input clk
    );
    
    wire q1;
    wire clkb = ~clk;
    
    dlatch d1 (.d(d),.q(q1),.clk(clk));
    dlatch d2 (.d(q1),.q(q),.clk(clkb));
    
endmodule