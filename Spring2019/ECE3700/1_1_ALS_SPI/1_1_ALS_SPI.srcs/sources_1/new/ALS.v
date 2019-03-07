`timescale 1ns/ 1ps

module ALS(
    input clk, MISO, rst,
    output SCLK, CS, 
    output [15:0] led
);

parameter refresh_period = 250_000;

wire d_rdy;
reg rd;

reg [31:0] rd_count;

simpleSPI SPI1(
    .clk(clk),
    .MISO(MISO),
    .rd(rd),
    .rst(rst),
    .SCLK(SCLK),
    .CS(CS),
    .d_rdy(d_rdy),
    .d(led)
);

initial begin
    rd = 0;
    rd_count = 0;
end

always@(posedge SCLK) begin
    if ((d_rdy==1)&&(rd==1))
        rd <= 0;
    
    if (rd_count > refresh_period) begin
        rd <= 1;
        rd_count <= 0;
    end
    else begin
        rd_count <= rd_count +1;
    end
end

endmodule 