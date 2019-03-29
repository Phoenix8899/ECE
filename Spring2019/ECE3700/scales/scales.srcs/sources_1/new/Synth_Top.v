`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2019 05:01:29 PM
// Design Name: 
// Module Name: Synth_Top
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


module Synth_Top(
    input clk,
    input start,
    output gain, shutdown_l, sout
    );
    
    wire [31:0] Ndata [14:0];
    reg [5:0] Ncount;
    reg [31:0] N,count;
    reg dclk;
    
    initial begin
        N = 3822;
        count = 0;
        dclk = 0;
        Ncount = 0;
    end
       
   assign gain = 1;
   assign shutdown_l = 1;
        
    assign Ndata[0] = 382200;
    assign Ndata[1] = 340500;
    assign Ndata[2] = 303400;
    assign Ndata[3] = 286300;
    assign Ndata[4] = 255100;
    assign Ndata[5] = 227300;
    assign Ndata[6] = 202500;
    assign Ndata[7] = 191100;
    assign Ndata[8] = 202500;
    assign Ndata[9] = 227300;
    assign Ndata[10] = 255100;
    assign Ndata[11] = 286300;
    assign Ndata[12] = 303400;
    assign Ndata[13] = 340500;
    assign Ndata[14] = 382200;
    
    always @(posedge clk) begin //clock divider
        if (count >= N) begin
            count <= 0;
            dclk = ~dclk;
        end
        else    
            count <= count + 1;
    end
    
    always @(posedge clk) begin
        N <= Ndata[Ncount];
         if (dbStart) begin
            Ncount <= Ncount + 1;
        end    
   end 
   
   wire [7:0] cos,dout;
        
   lut T1(
    .clk(clk),
    .rst(0),
    .increment(dclk),
    .cos_theta(dout),
    .sin_theta(cos)
);
  
  
  //implement DAC / PWM here with dout for din......... sout to catch sout      
    PWM_signal sig1(
    .clk(clk),
    .din(dout),
    .sout(sout)
    );
   
   wire dbStart;
   
   debouncer db1(     
   .clk(clk),
   .button(start),
   .en(1),
   .button_db(dbStart)
   );    
    
     
endmodule
