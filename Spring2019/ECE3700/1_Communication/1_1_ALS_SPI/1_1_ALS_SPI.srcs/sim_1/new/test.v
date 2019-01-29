`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 11:39:15 AM
// Design Name: 
// Module Name: test
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


module test;

reg clk;

reg MISO;
reg rst;
wire SCLK;
wire CS;
wire [15:0] led;

ALS d1(
    .clk(clk),
    .MISO(MISO),
    .rst(rst),
    .SCLK(SCLK),
    .CS(CS),
    .led(led)
);

defparam d1.refresh_period=25;

initial begin
    clk = 0;
    rst = 0;
    MISO = 0;
    
    forever #10 clk = ~clk;
end
endmodule
