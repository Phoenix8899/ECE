`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 03:47:24 PM
// Design Name: 
// Module Name: UARTtest
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


module UARTtest;

    reg clk, rst_1, start, rx;
    reg [7:0] data;
    wire done, tx;
    wire [7:0]rxData;

    reg [4:0] count;
    reg [7:0] derpdata;
    
    UARTtransmitter DUT1(
    .start(start),
    .clk(clk),
    .rst_1(rst_1),
    .data(data),
    .done(done),
    .tx(tx)
    );
    
    UARTreceiver DUT2(
    .start(start),
    .clk(clk),
    .rst_1(rst_1),
    .rx(rx),
    .done(done), 
    .data(rxData)
    );
    
    initial begin 
    start = 0;
    clk = 0;
    rst_1 = 0;
    count = 0;
    
    
    data = 8'b00100100;
    derpdata = 8'b11011011;
            
    #100
    forever #10 clk = ~clk;
    end
    
    always @(posedge clk) begin
        if (count == 5'd10) begin
            start = ~start;
            count = 0;
        end
            else 
                count = count + 1;
                
        rx <= derpdata[7];
        derpdata[7] <= derpdata[6];
        derpdata[6] <= derpdata[5];
        derpdata[5] <= derpdata[4];
        derpdata[4] <= derpdata[3];
        derpdata[3] <= derpdata[2];
        derpdata[2] <= derpdata[1];
        derpdata[1] <= derpdata[0];
        derpdata[0] <= derpdata[7];
    end
endmodule
