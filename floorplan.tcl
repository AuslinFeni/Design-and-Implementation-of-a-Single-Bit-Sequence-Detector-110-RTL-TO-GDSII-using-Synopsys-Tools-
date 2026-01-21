set PDK_PATH ./../ref

create_lib -ref_lib $PDK_PATH/lib/ndm/saed32rvt_c.ndm SEQ_DETECT_LIB

read_verilog {./../DC/results/seq_detector_110.mapped.v} -library SEQ_DETECT_LIB -design seq_detector_110 -top seq_detector_110
read_sdc ./../CONSTRAINTS/full_adder.sdc

# Set the current design
current_design seq_detector_110

# FloorPlan settings
#
# scenario1:
# #
# initialize_floorplan
# set_individual_pin_constraints -ports [get_ports] -sides 3
# place_pins -self
# create_placement -floorplan
#
# save_block -as FULL_ADD
# save_lib

# scenario2:
initialize_floorplan -core_utilization 0.6 -core_offset {3 3} -coincident_boundary false
place_pins -self
create_placement -floorplan -effort high

save_block -as SEQ_DETECT_floorplan
save_lib
