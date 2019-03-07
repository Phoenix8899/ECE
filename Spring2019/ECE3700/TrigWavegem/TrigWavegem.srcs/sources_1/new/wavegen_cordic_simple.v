`timescale 1ns/1ps

module cordic_simple (
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
    
    
reg signed [20:0] product_cos;
reg signed [20:0] product_sin;
reg [8:0] round_cos;
reg [8:0] round_sin;

always @(*) begin
    product_cos = (((cos_theta << 4) - sin_theta) << 9) - ((cos_theta << 4) - sin_theta);
    product_sin = (((sin_theta << 4) + cos_theta) << 9) - ((sin_theta << 4) + cos_theta);

//    product_cos = 511*(cos_theta*16 - sin_theta);
//    product_sin = 511*(sin_theta*16 + cos_theta);
    
    round_cos = product_cos[20:12] + 1;
    round_sin = product_sin[20:12] + 1;
end
    

reg [4:0] theta;
reg direction; // 0:counting up. 1: counting down
reg cos_sign; //0: positive. 1: negative
reg sin_sign; // 0: positive. 1: negative

always @(posedge clk, negedge rst_l) begin

    if (~rst_l) begin           //must be an if else so that posedge clk / negedge rst_l is not ambiguous
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
            
        cos_theta <= round_cos [8:1];
        sin_theta <= round_sin [8:1];
        end
    end
end

endmodule 