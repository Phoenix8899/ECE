`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:02:40 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,
    input rst,
    input rx,
    output tx,
    input send
    );
    
    reg [7:0] message[4:0];
    reg [7:0] data;
    reg [31:0] msg_count;
    reg rst_1;
    reg start;
    wire done;
    
    wire [7:0] rxData;
    wire rxDone;
    
    reg [7:0] prev;
    
    UARTtransmitter UART1(
        .clk(clk),
        .data(data),
        .start(start),
        .rst_1(rst_1),
        .done(done),
        .tx(tx)
    );
    
    UARTreceiver UART2(
        .clk(clk),
        .rx(rx),
        .start(start),//i dont even use its just here. probably not good code. shouldnt break anything.
        .rst_1(rst_1),
        .done(rxDone), 
        .data(rxData) 
    );
     
    
    initial begin 
        rst_1 = 0;
        prev  = 0; 
    end
    
    always @(posedge clk, posedge rst) begin
        if (rst)
            rst_1 <= 0;
        else 
            rst_1 <= 1; 
    end
    
//    always @(posedge rxDone) begin
//        message[4] <= rxData;
//        message[3] <= message[4];
//        message[2] <= message[3];
//        message[1] <= message[2];
//        message[0] <= message[1];
//    end 
    
    always @(posedge clk, negedge rst_1) begin
       if (~rst_1) begin
                msg_count <= 0;
                message [0] <= "h";
                message [1] <= "e";
                message [2] <= "l";
                message [3] <= "l";
                message [4] <= "o";
                start <= 0;
                data <= "h"; 
        end
        else begin
            if(rxDone && prev != rxData) begin
                msg_count <= 0;
                message[4] <= rxData;
                message[3] <= message[4];
                message[2] <= message[3];
                message[1] <= message[2];
                message[0] <= message[1];
                start <= 0;
                data <= rxData;
                prev <= rxData;
            end
        
            if (send && (!start) && (!done)) begin
                start <= 1;
                data <= message[msg_count];

                
            end
            else if (start && done) begin
                //De-bounce the send button at end of message:
                if ((msg_count == 4) && (~send)) begin
                    msg_count <= 0;
                    start <= 0;
                end
                //Increment the byte index until reaching the end
                else if (msg_count < 4) begin
                    msg_count <= msg_count +1;
                    start <= 0;
                end
            end
        end
    end
    
endmodule
