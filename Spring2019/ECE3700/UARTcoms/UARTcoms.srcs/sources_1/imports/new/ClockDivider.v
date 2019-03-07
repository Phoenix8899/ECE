`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2019 02:29:07 PM
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider(
    input clkIn,
    output reg clkOut
    );
    
    reg [31:0] count;
    
    initial begin 
        clkOut = 0;
        count = 0;
    end
    
    
    
    always @(posedge clkIn) begin
            if (count > 32'd5_208) begin //change this to mess wtih time
                clkOut = ~clkOut;
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end
endmodule
