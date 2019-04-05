`timescale 1ns/1ps

module lut (
    input clk,
    input rst,
    input increment,
    output reg signed [7:0] cos_theta,
    output reg signed [7:0] sin_theta
);
    

    reg rst_l;
     
    initial begin
        theta = 0;
        rst_l = 0; 
        direction = 0;
        cos_sign = 0;
        sin_sign = 0;
    end
    
always @(posedge clk, posedge rst) begin
        if (rst)
            rst_l <= 0;
        else 
            rst_l <= 1; 
    end    
    
wire [6:0] mem[24:0];
reg [4:0] theta;

assign mem[0] = 0;
assign mem[1] = 8;
assign mem[2] = 16;
assign mem[3] = 24;
assign mem[4] = 32;
assign mem[5] = 39;
assign mem[6] = 47;
assign mem[7] = 54;
assign mem[8] = 61;
assign mem[9] = 68;
assign mem[10] = 75;
assign mem[11] = 81;
assign mem[12] = 87;
assign mem[13] = 93;
assign mem[14] = 98;
assign mem[15] = 103;
assign mem[16] = 107;
assign mem[17] = 111;
assign mem[18] = 115;
assign mem[19] = 118;
assign mem[20] = 121;
assign mem[21] = 123;
assign mem[22] = 125;
assign mem[23] = 126;
assign mem[24] = 127;

reg direction; // 0:counting up. 1: counting down
reg cos_sign; //0: positive. 1: negative
reg sin_sign; // 0: positive. 1: negative

always @(posedge clk, negedge rst_l) begin

    if (~rst_l) begin
        cos_theta <= 7'd127;
        sin_theta <= 7'd0;
        rst_l <= 1;
        
        theta = 0;
        direction = 0;
        cos_sign = 0;
        sin_sign = 0;
    end
    else begin
        if (increment) begin
            if((!direction) && (theta == 23)) begin
                direction <= ~direction;
                theta <= theta + 1;
                sin_sign <= ~sin_sign;
            end
            else if (direction && (theta == 1)) begin
                direction <= ~direction;
                cos_sign <= ~cos_sign;
                theta <= theta - 1;
            end    
            else if (direction)
                theta <= theta - 1;
            else 
                theta <= theta + 1; 
            
            if (cos_sign) 
                sin_theta <= ~mem[theta];
            else 
                sin_theta <= mem[theta];
                
            if (sin_sign) 
                cos_theta <= ~mem[24 - theta];
            else 
                cos_theta <= mem[24 - theta];
        end
    end
end

endmodule 