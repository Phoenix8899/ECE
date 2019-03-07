`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2019 05:29:51 PM
// Design Name: 
// Module Name: TrigTop
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


module TrigTop(
    input rst,
    input increment,
    input clk,
    output [15:0] led
    );
    wire inc;
    
    debouncer (
        .clk(clk),
        .button(increment),
        .en(1),
        .button_db(inc)
    );

    cordic_simple T1(
        .clk(clk),
        .rst(rst),
        .increment(inc),
        .cos_theta(led[15:8]),
        .sin_theta(led[7:0])
    );
    
endmodule
