set mode1 "func"
set corner1 "nom"
set scenario1 "${mode1}::${corner1}"
remove_modes -all; remove_corners -all; remove_scenarios -all

create_mode $mode1
create_corner $corner1
create_scenario -name func::nom -mode func -corner nom
current_mode func
current_scenario func::nom

source <constraints>

set_parasitic_parameters -late_spec $parasitic1 -early_spec $parasitic2
set_app_options -name place.coarse.continue_on_missing_scandef -value true

place_pins -self
place_opt
legalize_placement

save_block -as seq_det_placement
save_lib -as SEQ_DETECTOR_LIB
