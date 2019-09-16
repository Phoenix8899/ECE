`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2019 03:06:37 PM
// Design Name: 
// Module Name: sevenSegTop
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


module sevenSegTop(
    output [6:0] seg,
    output [3:0] an,
    input [7:0] sw
    );
    
    wire [6:0] D;
    
    assign seg = ~D;
    assign an  = ~sw [7:4];
    
    boolSeg s1(
        .X(sw[3:0]),
        .ld(D)
    );
    
    
endmodule
