`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2019 03:19:43 PM
// Design Name: 
// Module Name: PWM_sigTest
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


module PWM_sigTest;
    reg clk;
    reg [7:0]din;
    reg [3:0]count;
    wire sout;
    
    PWM_signal DUT(
        .clk(clk),
        .din(din),
        .sout(sout)
    );
    
    initial begin 
        clk = 0;
        din = 0;
        count = 0;
        
        forever #1 clk = ~clk;
    end
    
    always @(posedge clk) begin
        if (count == 4'd10) begin
            din =  din + 1;
            count = 0;
        end
        else 
            count = count + 1;
    end
endmodule
