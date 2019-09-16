`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2019 03:22:57 PM
// Design Name: 
// Module Name: sevSegTest
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


module sevSegTest(

    );
    reg [7:0] sw;
    reg clk;
    wire [6:0] seg;
    wire [3:0] an;
    
    sevenSegTop DUT(
        .seg(seg),
        .an(an),
        .sw(sw)
    );
    
    initial begin 
        sw = 0;
        clk = 0;
        
        #100;
        forever #10 clk = ~clk;
    end
    
    always @(posedge clk) begin
        if(sw >= 9)
            sw <= 0;
        else 
            sw <= sw + 1;
    end    
    
endmodule
