`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 03:16:24 PM
// Design Name: 
// Module Name: UARTtransmitter
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


module UARTtransmitter(
    input start, clk, rst_1,
    input [7:0] data,
    output reg done, tx
    );
    
    reg [1:0] state;
    reg [2:0] bit;
    wire dclk;
    
    ClockDivider clk1 (
    .clkIn(clk),
    .clkOut(dclk)
    );
    
    always @(posedge dclk) begin  
        if (~rst_1)
            state <= 2'b00;
        case (state) 
            2'b00 : begin //wait
                if (~start) begin
                    tx <= 1;
                    done <= 0;     
                end
                else begin
                    bit <= 0;
                    tx <= 0;
                    state <= 2'b01;
                end
            end
            2'b01 : begin //send
                if (bit < 3'b111) begin
                    tx <= data[bit];
                    bit <= bit + 1;
                end
                else begin
                    tx <= data[bit];
                    state <= 2'b10;
                end
            end
            2'b10 : begin //done
                if (start) begin
                    done <= 1;
                    tx <= 1;
                end
                else begin
                    done <= 0;
                    state <= 2'b00;
                end
            end
            default begin //wtf
                state <= 2'b00;
            end 
        endcase
    end
endmodule
