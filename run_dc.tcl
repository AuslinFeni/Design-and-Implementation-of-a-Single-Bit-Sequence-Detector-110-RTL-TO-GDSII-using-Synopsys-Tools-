set RTL_SOURCE_FILES <PATH>/seq_detector_110_rtl.v

define_design_lib <LIB_PATH>

#set_dont_use [get_lib_cells */FADD*]
#set_dont_use [get_lib_cells */HADD*]
#set_dont_use [get_lib_cells */AO*]
#set_dont_use [get_lib_cells */OA*]
#set_dont_use [get_lib_cells */NAND*]
#set_dont_use [get_lib_cells */XOR*]
#set_dont_use [get_lib_cells */NOR*]
#set_dont_use [get_lib_cells */XNOR*]
#set_dont_use [get_lib_cells */MUX*]

analyze -format verilog ${RTL_SOURCE_FILES}
set DESIGN_NAME “seq_detector_110”
elaborate ${DESIGN_NAME}
current_design ${DESIGN_NAME}

compile
#compile_ultra
#report_timing
write -format verilog -hierarchy -output <PATH>/seq_detector_110.mapped.v

