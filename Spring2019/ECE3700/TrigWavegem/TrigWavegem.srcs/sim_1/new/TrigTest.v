`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2019 04:07:21 PM
// Design Name: 
// Module Name: TrigTest
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


module TrigTest;

reg clk;
reg rst;
reg increment;

wire signed [7:0] cos_theta;
wire signed [7:0] sin_theta;

lut DUT(
    .clk(clk),
    .rst(rst),
    .increment(increment),
    .cos_theta(cos_theta),
    .sin_theta(sin_theta)
);

initial begin 
    clk = 0;
    rst = 0;
    increment = 0;
    
    #10;
    
    forever #10 clk = ~clk;
end

always @(posedge clk) begin
    increment = 1;
end

endmodule
