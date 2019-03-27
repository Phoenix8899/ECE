`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2019 03:56:18 PM
// Design Name: 
// Module Name: dim_leds
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


module dim_leds(
    input sys_clk,
    output [15:0] led
    //output [3:0] an, //not needed
    //output [6:0] seg
    );
    
    //PWM signals
    reg [7:0] din;
    wire sout;
    
    //Signals for CLK divider
    integer count;
    reg div_clk;
    
    //State variable 
    reg count_up; //brighten (1) or dim (0)
    
    //Assign all LEDs to equal PWM signal
    assign led = {16{sout}};
    
    //Instate the PWM
    
    PWM_signal MOD1(
        .clk(sys_clk),
        .din(din),
        .sout(sout)
        
    );  
    
    //Initialize reg signals
    initial begin
        din = 0;
        count = 0;
        count_up = 1;
    end
    
    //Implement a clock divider
    always @(posedge sys_clk) begin
        if (count >= 500_000) begin
            count <= 0;
            div_clk <= ~div_clk;
        end
        else
            count <= count + 1;
        end
        
        //Main brighten/dim process
        always @(posedge div_clk) begin
            //Adjust the PWM brightness level
            if (count_up)
                din<= din + 1;
            else 
                din <= din - 1;
            
        //If max bright -> dim
        //If min birhgt -> brighten
        if((count_up) && (din == 254))
            count_up <= 0;
        else if ((~count_up)&&(din == 1))
            count_up <= 1;
    end
      
endmodule
