transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/ieee_ ws/quartus - Copy - Copy - Copy/max_10_board_top.vhd}

