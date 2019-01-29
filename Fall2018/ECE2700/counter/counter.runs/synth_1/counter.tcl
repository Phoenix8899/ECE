# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/ecestudent/ECE2700/counter/counter.cache/wt [current_project]
set_property parent.project_path /home/ecestudent/ECE2700/counter/counter.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  /home/ecestudent/ECE2700/counter/counter.srcs/sources_1/imports/ECE2700/DFF_dataflow/DFF_dataflow.srcs/sources_1/new/dlatch.v
  /home/ecestudent/ECE2700/counter/counter.srcs/sources_1/imports/ECE2700/DFF_dataflow/DFF_dataflow.srcs/sources_1/new/DFF.v
  /home/ecestudent/ECE2700/counter/counter.srcs/sources_1/imports/ECE2700/Lab2/ClockDivider/ClockDivider.srcs/sources_1/new/ClockDivider.v
  /home/ecestudent/ECE2700/counter/counter.srcs/sources_1/imports/ECE2700/DFF_dataflow/DFF_dataflow.srcs/sources_1/new/JKFF.v
  /home/ecestudent/ECE2700/counter/counter.srcs/sources_1/new/counter.v
}
read_xdc /home/ecestudent/ECE2700/counter/counter.srcs/constrs_1/imports/ECE2700/Basys3_Master.xdc
set_property used_in_implementation false [get_files /home/ecestudent/ECE2700/counter/counter.srcs/constrs_1/imports/ECE2700/Basys3_Master.xdc]

synth_design -top counter -part xc7a35tcpg236-1
write_checkpoint -noxdef counter.dcp
catch { report_utilization -file counter_utilization_synth.rpt -pb counter_utilization_synth.pb }
