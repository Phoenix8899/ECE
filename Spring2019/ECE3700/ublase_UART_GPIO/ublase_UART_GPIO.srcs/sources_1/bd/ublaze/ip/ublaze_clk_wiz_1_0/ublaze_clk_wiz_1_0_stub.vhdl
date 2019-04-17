-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Tue Apr 16 15:15:34 2019
-- Host        : phoenix8899 running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/phoenix8899/ECE/Spring2019/ECE3700/ublase_UART_GPIO/ublase_UART_GPIO.srcs/sources_1/bd/ublaze/ip/ublaze_clk_wiz_1_0/ublaze_clk_wiz_1_0_stub.vhdl
-- Design      : ublaze_clk_wiz_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ublaze_clk_wiz_1_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end ublaze_clk_wiz_1_0;

architecture stub of ublaze_clk_wiz_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_in1";
begin
end;
