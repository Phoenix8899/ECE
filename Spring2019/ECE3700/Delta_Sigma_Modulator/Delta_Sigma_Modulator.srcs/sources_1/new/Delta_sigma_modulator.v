`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 06:00:01 PM
// Design Name: 
// Module Name: Delta_sigma_modulator
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


module Delta_sigma_modulator(
    input clk,
    input [7:0] sample,
    output reg dout
    );
    
    reg signed [8:0] sigma;
    reg signed [8:0] samplereg;
    
    initial begin  
        dout = 0;
        sigma = 0;
        samplereg = 0;
    end
    
    always @(posedge clk) begin
        samplereg <= {1'b0,sample} - (2**7);
        dout <= sigma[8];
        
        //Absorb Delta+sigma into one operation
        if (sigma[8])
            sigma <= sigma + samplereg - (2**7-1);
        else
            sigma <= sigma + samplereg + (2**7-1);
    end
        
endmodule
