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
        
    assign Ndata[0] = 3822;
    assign Ndata[1] = 3405;
    assign Ndata[2] = 3034;
    assign Ndata[3] = 2863;
    assign Ndata[4] = 2551;
    assign Ndata[5] = 2273;
    assign Ndata[6] = 2025;
    assign Ndata[7] = 1911;
    assign Ndata[8] = 2025;
    assign Ndata[9] = 2273;
    assign Ndata[10] = 2551;
    assign Ndata[11] = 2863;
    assign Ndata[12] = 3034;
    assign Ndata[13] = 3405;
    assign Ndata[14] = 3822;
    
    always @(posedge clk) begin //clock divider
        if (count >= N) begin
            count <= 0;
            dclk = 1;
        end
        else begin    
            count <= count + 1;
            dclk = 0;
        end
            
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
    .cos_theta(cos),
    .sin_theta(dout)
);
  
  
  //implement DAC / PWM here with dout for din......... sout to catch sout      
    Delta_sigma_modulator sig1(
    .clk(clk),
    .sample(dout),
    .dout(sout)
    );
   
   wire dbStart;
   
   debouncer db1(     
   .clk(clk),
   .button(start),
   .en(1),
   .button_db(dbStart)
   );    
    
     
endmodule
