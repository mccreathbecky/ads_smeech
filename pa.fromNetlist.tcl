
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name SMEECH2 -dir "C:/Users/William/Documents/ADS/ADS_FINAL/planAhead_run_2" -part xc6slx16csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/William/Documents/ADS/ADS_FINAL/TopLevel.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/William/Documents/ADS/ADS_FINAL} }
set_property target_constrs_file "C:/Users/William/Desktop/nexys.ucf" [current_fileset -constrset]
add_files [list {C:/Users/William/Desktop/nexys.ucf}] -fileset [get_property constrset [current_run]]
link_design
