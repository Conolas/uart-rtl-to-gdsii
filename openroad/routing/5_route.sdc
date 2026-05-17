###############################################################################
# Created by write_sdc
###############################################################################
current_design uart_top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {clk}]
set_input_delay 0.0000 -add_delay [get_ports {clk}]
set_input_delay 0.0000 -add_delay [get_ports {rst_n}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[0]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[1]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[2]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[3]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[4]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[5]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[6]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_data[7]}]
set_input_delay 0.0000 -add_delay [get_ports {tx_start}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[0]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[1]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[2]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[3]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[4]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[5]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[6]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_data[7]}]
set_output_delay 0.0000 -add_delay [get_ports {rx_done}]
set_output_delay 0.0000 -add_delay [get_ports {tx_busy}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
