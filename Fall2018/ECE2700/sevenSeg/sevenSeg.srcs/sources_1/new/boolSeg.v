`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2019 03:09:33 PM
// Design Name: 
// Module Name: boolSeg
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


module boolSeg(
       input [3:0]X,
       output [6:0]ld
    );
    
    assign ld[0] = X[3] | X[1] | X[2]&X[0] | ~X[2]&~X[0];
    assign ld[1] = ~X[2] | X[1]&X[0] | ~X[1]&~X[0];
    assign ld[2] = X[0] | X[1] | ~X[2] | X[3];
    assign ld[3] = X[0]&~X[1]&X[2] | X[0]&~X[1]&~X[3];
    assign ld[4] = ~X[2]&~X[0] | X[1]&~X[0];
    assign ld[5] = X[3] | ~X[1]&~X[0] | X[2]&~X[0] | X[2]&~X[1];
    assign ld[6] = X[1]&~X[0] | X[2]&~X[1] | X[3] | ~X[2]&X[1];
    
endmodule
