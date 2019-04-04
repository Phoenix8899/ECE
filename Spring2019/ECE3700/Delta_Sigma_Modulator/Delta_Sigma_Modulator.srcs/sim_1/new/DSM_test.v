`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 06:13:32 PM
// Design Name: 
// Module Name: DSM_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DSM_test;

    reg clk;
    wire out;
    
    DSM_Top DUT(
    .clk(clk),
    .things(out)
    );
    
    initial begin
        clk  = 0;
        forever #10 clk = ~clk;
    end
    
endmodule
