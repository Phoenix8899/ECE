`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 10:38:05 AM
// Design Name: 
// Module Name: simpleSPI
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


module simpleSPI(
    input clk, MISO, rd, rst,
    output reg SCLK, CS, d_rdy,
    output reg [15:0] d
    );
    
    reg timer, t_rst;
    reg [2:0] state;
    reg [3:0] bit;
    reg [31:0] t_count;
    reg [31:0] sclk_count;
    
    initial begin 
        state = 0;
        timer = 0;
        t_rst = 0;
        bit = 0;
        
        t_count = 0;
        sclk_count = 0;
        
        SCLK = 0;
        CS = 1;
        d = 0;
        d_rdy = 0;
    end
    
    always @(posedge clk) begin
        if (sclk_count > 25) begin
            SCLK <= ~SCLK;
            sclk_count <= 0;
        end
        else begin
            sclk_count <= sclk_count + 1;
        end
    end
    
    always @(posedge SCLK) begin
        if (t_rst) begin
            timer <= 0;
            t_count <= 0;
        end 
        else begin
            if (t_count > 10) begin
                timer <= 1;
            end 
            else begin
                t_count <= t_count + 1;
            end
        end
    end
    
    always @(posedge SCLK) begin
        if (rst) 
            state <= 0;
        else begin 
            case (state)
                //======
                0: //RESET
                begin
                    d_rdy <= 0;
                    CS <= 1;
                    t_rst <= 1;
                    state <= 1;
                end
                //======
                1: //Initialise
                begin
                    t_rst <= 0;
                    state <= 2;
                end
                //======
                2: //WAIT
                begin
                    if (timer & rd) begin
                        CS <= 0;
                        bit <= 15;
                        state <= 3;
                    end
                    else begin
                        state <= 2;
                    end
                end
                //======
                3: //Read From SPI
                begin  
                    if (bit > 0) begin
                        d[bit] <= MISO;
                        bit <= bit - 1;
                    end 
                    else begin
                        d[bit] <= MISO;
                        d_rdy <= 1;
                        CS <= 1;
                        state <= 4;
                    end
                end 
                //======
                4: //wiat for ACK
                begin
                    if (rd == 0) begin
                        t_rst <= 1;
                        d_rdy <= 0;
                        state <= 1;
                    end
                    else
                        state <= 4;
                end
                //======
                // CATCH
                default: state <= 0;
               
            endcase 
        end 
    end
    
endmodule
