`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 05:06:24 AM
// Design Name: 
// Module Name: sevensegment
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


module sevensegment(
    input [3:0] X,
    output [6:0] seg
    );
    
    //wire [15:0] d;
    
    //decoder4_16 D (.d(X), .o(d));
    
//    assign seg[0] = |(d & 16'hB7C0); //a
//    assign seg[1] = |(d & 16'hF9C0); //b
//    assign seg[2] = |(d & 16'hDFC0); //c
//    assign seg[3] = |(d & 16'hB6C0); //d
//    assign seg[4] = |(d & 16'hA280); //e
//    assign seg[5] = |(d & 16'h8EC0); //f
//    assign seg[6] = |(d & 16'h3EC0); //g

    assign seg[0] = X[3] | X[1] | X[2]&X[0] | ~X[2]&~X[0]; //a
    assign seg[1] = ~X[2] | X[1]&X[0] | ~X[1]&~X[0]; //b
    assign seg[2] = X[0] | X[1] | ~X[2] | X[3]; //c
    assign seg[3] = X[0]&~X[1]&X[2] | X[0]&~X[2]&X[3]; //d
    assign seg[4] = ~X[2]&~X[0] | X[1]&~X[0]; //e
    assign seg[5] = X[3] | ~X[1]&~X[0] | X[2]&~X[0] | X[2]&~X[1]; //f
    assign seg[6] = X[1]&~X[0] | X[2]&~X[1] | X[3] | ~X[2]&X[1]; //g

endmodule
