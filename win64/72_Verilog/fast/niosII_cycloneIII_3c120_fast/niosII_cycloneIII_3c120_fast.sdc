# Defining the base clocks in this system
create_clock -period 20.000 -name Ext_clock_in [get_ports inclk0]
create_clock -period 100.000 -name JTAG_clk [get_ports altera_reserved_tck]

# Deriving the output clocks from the PLL settings
derive_pll_clocks


# Cutting paths between the JTAG and all other ports
set_clock_groups -asynchronous -group {JTAG_clk}


# Cutting paths for the JTAG tdo, tdi, and tms pins (ports)
set_false_path -to [get_ports altera_reserved_tdo]
set_false_path -from [get_ports altera_reserved_tdi]
set_false_path -from [get_ports altera_reserved_tms]


# Cutting the input reset path since SOPC Builder will synchronize all resets
set_false_path -from [get_ports reset_n]


# Reset is syncronized so cutting this path
set_false_path -from {niosII_cycloneIII_3c120_fast_sopc:inst2|niosII_cycloneIII_3c120_fast_sopc_reset_clk_domain_synch_module:niosII_cycloneIII_3c120_fast_sopc_reset_clk_domain_synch|data_out*} -to {*}