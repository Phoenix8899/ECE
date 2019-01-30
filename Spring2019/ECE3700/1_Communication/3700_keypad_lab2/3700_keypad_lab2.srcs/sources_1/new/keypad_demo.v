`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2019 03:55:51 PM
// Design Name: 
// Module Name: keypad_demo
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


module keypad_demo(
    input clk,
    input [3:0] row,
    output reg [3:0] col,
    output reg [15:0] led
    );
    
    reg [3:0] state;
    reg time_clk;
    reg [31:0] count;
    
    initial begin
        state = 2'b00;
    end
    
    always @(posedge clk) begin
        if (count > 25_000) begin //change this to mess wtih time
            time_clk = ~time_clk;
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
    end
    
    always @(posedge time_clk) begin
        case (state)
            2'b00: begin        //COL 1
                col <= 4'b0ZZZ;
                state <= 2'b01; //should be 01
                
                if (~row[0])
                    led[1] <= 1;
                else 
                    led[1] <= 0;
                if (~row[1])
                    led[4] <= 1;
                else 
                    led[4] <= 0;
                if (~row[2])
                    led[7] <= 1;
                else 
                    led[7] <= 0;
                if (~row[3])
                    led[0] <= 1;
                else 
                    led[0] <= 0;    
                
            end
            2'b01: begin        //COL 2            
                col <= 4'bZ0ZZ;
                state <= 2'b10; //should be 10
                
                if (~row[0])
                    led[10] <= 1; //2
                else 
                    led[10] <= 0; //2
                if (~row[1])
                    led[11] <= 1; //5
                else 
                    led[11] <= 0; //5
                if (~row[2])
                    led[12] <= 1; //8
                else 
                    led[12] <= 0; //8
                if (~row[3])
                    led[13] <= 1; //15
                else 
                    led[13] <= 0; //15
                    
            end
            2'b10: begin        //COL 3
                col <= 4'bZZ0Z;
                state <= 2'b11; //should be 11
                
                if (~row[0])
                    led[3] <= 1;
                else 
                    led[3] <= 0;
                if (~row[1])
                    led[6] <= 1;
                else 
                    led[6] <= 0;
                if (~row[2])
                    led[9] <= 1;
                else 
                    led[9] <= 0;
                if (~row[3])
                    led[14] <= 1;
                else 
                    led[14] <= 0;
                
            end
            2'b11: begin       //COL 4     
                col <= 4'bZZZ0;
                state <= 2'b00; //should be 00
                
                if (~row[0])
                    led[2] <= 1; //10
                else 
                    led[2] <= 0; //10
                if (~row[1])
                    led[5] <= 1; //11
                else 
                    led[5] <= 0; //11
                if (~row[2])
                    led[8] <= 1; //12
                else 
                    led[8] <= 0; //12
                if (~row[3])
                    led[15] <= 1; //13
                else 
                    led[15] <= 0; //13
                
            end
        endcase
    end
endmodule
