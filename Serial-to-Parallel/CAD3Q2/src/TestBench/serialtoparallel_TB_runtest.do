SetActiveLib -work
comp -include "$dsn\src\Converter.vhd" 
comp -include "$dsn\src\TestBench\serialtoparallel_TB.vhd" 
asim +access +r TESTBENCH_FOR_serialtoparallel 
wave 
wave -noreg Reset
wave -noreg Clk
wave -noreg DataIn
wave -noreg Start
wave -noreg Pattern
wave -noreg DataOut
wave -noreg Valid
wave -noreg Found
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\serialtoparallel_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_serialtoparallel 
