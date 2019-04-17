set_property SRC_FILE_INFO {cfile:/home/phoenix8899/ECE/Spring2019/ECE3700/ublase_UART_GPIO/ublase_UART_GPIO.srcs/sources_1/bd/ublaze/ip/ublaze_clk_wiz_1_0/ublaze_clk_wiz_1_0.xdc rfile:../../../ublase_UART_GPIO.srcs/sources_1/bd/ublaze/ip/ublaze_clk_wiz_1_0/ublaze_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
