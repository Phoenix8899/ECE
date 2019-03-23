`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2019 03:12:19 PM
// Design Name: 
// Module Name: PWM_signal
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


module PWM_signal(
    input clk,
    input [7:0]din,
    output reg sout 
    );
    
    reg [7:0] count;
    
    initial begin 
        count  = 0;
    end
    
    always @(posedge clk) begin
        count <= count + 1;
        if(count <= din)
            sout <= 1;
        else begin
            sout <= 0;
            //count <= count + 1;
        end         
   end
endmodule
