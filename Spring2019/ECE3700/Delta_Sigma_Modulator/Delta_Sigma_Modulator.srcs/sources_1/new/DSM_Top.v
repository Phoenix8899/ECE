`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 06:05:01 PM
// Design Name: 
// Module Name: DSM_Top
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


module DSM_Top(
    input clk,
    output things
    );
    
    wire [7:0]sample;
    wire [7:0]cos;
    
    Delta_sigma_modulator dsm1 (
        .clk(clk),
        .sample(sample),
        .dout(things)
    );
    
    lut l1(
    .clk(clk),
    .rst(0),
    .increment(1),
    .cos_theta(cos),
    .sin_theta(sample)
    );
    
    
endmodule
