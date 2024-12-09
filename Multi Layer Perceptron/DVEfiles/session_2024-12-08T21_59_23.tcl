# Begin_DVE_Session_Save_Info
# DVE reload session
# Saved on Sun Dec 8 21:59:23 2024
# Designs open: 1
#   V1: /home/users14/ja425322/526L/MLP/vcdplus.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: MLP_tb.UUT.OutputLayer
#   Wave.1: 8 signals
#   Group count = 2
#   Group Group1 signal count = 21
#   Group Group2 signal count = 8
# End_DVE_Session_Save_Info

# DVE version: U-2023.03-SP1_Full64
# DVE build date: May 31 2023 21:14:30


#<Session mode="Reload" path="/home/users14/ja425322/526L/MLP/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Reload
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all
gui_clear_window -type Wave
gui_clear_window -type List

# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

set TopLevel.1 TopLevel.1

# Docked window settings
set HSPane.1 HSPane.1
set Hier.1 Hier.1
set DLPane.1 DLPane.1
set Data.1 Data.1
set Console.1 Console.1
set DriverLoad.1 DriverLoad.1
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 Source.1
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

set TopLevel.2 TopLevel.2

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 Wave.1
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 442} {child_wave_right 1079} {child_wave_colname 219} {child_wave_colvalue 219} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/home/users14/ja425322/526L/MLP/vcdplus.vpd}] } {
	gui_open_db -design V1 -file /home/users14/ja425322/526L/MLP/vcdplus.vpd -nosource
}
gui_set_precision 100ps
gui_set_time_units 100ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {MLP_tb.UUT.OutputLayer}
gui_load_child_values {MLP_tb.UUT}


set _session_group_1 Group1
gui_sg_create "$_session_group_1"
set Group1 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { MLP_tb.UUT.OutputLayer.reset_next MLP_tb.UUT.OutputLayer.inputs MLP_tb.UUT.OutputLayer.reset MLP_tb.UUT.OutputLayer.CLK MLP_tb.UUT.OutputLayer.AddResult MLP_tb.UUT.OutputLayer.neuron_bias MLP_tb.UUT.OutputLayer.dotResult MLP_tb.UUT.OutputLayer.endFlag MLP_tb.UUT.OutputLayer.myReset MLP_tb.UUT.OutputLayer.add_cycles MLP_tb.UUT.OutputLayer.operand MLP_tb.UUT.OutputLayer.neuron MLP_tb.UUT.OutputLayer.start_weights MLP_tb.UUT.OutputLayer.end_weights MLP_tb.UUT.OutputLayer.i MLP_tb.UUT.OutputLayer.state MLP_tb.UUT.OutputLayer.next_state MLP_tb.UUT.OutputLayer.weights MLP_tb.UUT.OutputLayer.biases MLP_tb.UUT.OutputLayer.outputs MLP_tb.UUT.OutputLayer.WeightsVector }
gui_set_radix -radix {decimal} -signals {V1:MLP_tb.UUT.OutputLayer.add_cycles}
gui_set_radix -radix {twosComplement} -signals {V1:MLP_tb.UUT.OutputLayer.add_cycles}
gui_set_radix -radix {decimal} -signals {V1:MLP_tb.UUT.OutputLayer.neuron}
gui_set_radix -radix {twosComplement} -signals {V1:MLP_tb.UUT.OutputLayer.neuron}
gui_set_radix -radix {decimal} -signals {V1:MLP_tb.UUT.OutputLayer.start_weights}
gui_set_radix -radix {twosComplement} -signals {V1:MLP_tb.UUT.OutputLayer.start_weights}
gui_set_radix -radix {decimal} -signals {V1:MLP_tb.UUT.OutputLayer.end_weights}
gui_set_radix -radix {twosComplement} -signals {V1:MLP_tb.UUT.OutputLayer.end_weights}
gui_set_radix -radix {decimal} -signals {V1:MLP_tb.UUT.OutputLayer.i}
gui_set_radix -radix {twosComplement} -signals {V1:MLP_tb.UUT.OutputLayer.i}

set _session_group_2 Group2
gui_sg_create "$_session_group_2"
set Group2 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { MLP_tb.UUT.out MLP_tb.UUT.image MLP_tb.UUT.CLK MLP_tb.UUT.reset MLP_tb.UUT.reset_next MLP_tb.UUT.reset_out MLP_tb.UUT._ MLP_tb.UUT.out1 }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 72158



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*} -force
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} MLP_tb}
catch {gui_list_select -id ${Hier.1} {MLP_tb.UUT}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {MLP_tb.UUT}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {MLP_tb.UUT.out MLP_tb.UUT.image MLP_tb.UUT.CLK MLP_tb.UUT.reset MLP_tb.UUT.reset_next MLP_tb.UUT.reset_out MLP_tb.UUT._ MLP_tb.UUT.out1 }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active MLP_tb.UUT.OutputLayer /home/users14/ja425322/526L/MLP/denselayer.sv
gui_view_scroll -id ${Source.1} -vertical -set 615
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_wv_zoom_timerange -id ${Wave.1} 0 189147
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_select -id ${Wave.1} {MLP_tb.UUT._ }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group Group2  -position in

gui_marker_move -id ${Wave.1} {C1} 72158
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false

# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal MLP_tb.UUT.reset_next -time 76450 -starttime 76450
gui_get_drivers -session -id ${DriverLoad.1} -signal {MLP_tb.UUT.out1[0:3][31:0]} -time 58941 -starttime 58941
gui_get_drivers -session -id ${DriverLoad.1} -signal MLP_tb.UUT._ -time 33650 -starttime 68050
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DriverLoad.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

