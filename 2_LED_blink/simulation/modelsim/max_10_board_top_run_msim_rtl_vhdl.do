transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/ieee_ ws/LED_blink/max_10_board_top.vhd}

vcom -93 -work work {C:/ieee_ ws/LED_blink/simulation/modelsim/LED_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  LED_TB

add wave *
view structure
view signals
run -all
