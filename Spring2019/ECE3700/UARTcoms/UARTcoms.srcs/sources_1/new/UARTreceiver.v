`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:46:03 PM
// Design Name: 
// Module Name: UARTreceiver
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


module UARTreceiver(
    input start, clk, rst_1,
    input rx,
    output reg done, 
    output reg [7:0] data
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
                if (rx) begin
                    data <= 0;
                    done <= 0;     
                end
                else begin
                    bit <= 0;
                    done <= 0;
                    //data <= 1;
                    state <= 2'b01;
                end
            end
            2'b01 : begin //read
                    if (bit < 3'b111) begin
                        data[bit] <= rx;
                        bit = bit + 1;
                    end 
                    else begin
                        data[bit] <= rx;
                        state <= 2'b10;
                    end
            end
            2'b10 : begin //done
                    done <= 1;
                    state <= 2'b00;
            end
            default begin //wtf
                state <= 2'b00;
            end 
        endcase
    end
endmodule
