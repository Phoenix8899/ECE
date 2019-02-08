`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2019 04:10:38 PM
// Design Name: 
// Module Name: clkTest
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


module clkTest;

reg clkIn; 
wire clkOut;

    ClockDivider DUT(
    .clkIn(clkIn),
    .clkOut(clkOut)
    );

initial begin
    clkIn = 0;

    forever #10 clkIn = ~clkIn;
end

endmodule
