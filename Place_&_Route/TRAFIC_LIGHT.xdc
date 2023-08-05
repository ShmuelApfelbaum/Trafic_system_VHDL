
##########
# Clocks #
##########
create_clock -name CLK -period 10 -waveform {0 5} [get_ports CLK]

###############
# Input Delay #
###############
set_input_delay 0 -clock CLK  -add_delay  [get_ports {RESET TEST_MODE}]

################
# Output Delay #
################
set_output_delay 0 -clock CLK  -add_delay  [get_ports T_CONTROL*]

##############################
# Pin Locations and Voltages #
##############################
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports { CLK   }]; 
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { RESET }]; 
set_property -dict { PACKAGE_PIN B16  IOSTANDARD LVCMOS33 } [get_ports { T_CONTROL[0]  }];
set_property -dict { PACKAGE_PIN B15  IOSTANDARD LVCMOS33 } [get_ports { T_CONTROL[1]  }];
set_property -dict { PACKAGE_PIN K17  IOSTANDARD LVCMOS33 } [get_ports { T_CONTROL[2]  }];
set_property -dict { PACKAGE_PIN M18  IOSTANDARD LVCMOS33 } [get_ports { T_CONTROL[3]  }];
set_property -dict { PACKAGE_PIN N17  IOSTANDARD LVCMOS33 } [get_ports { T_CONTROL[4]  }];
set_property -dict { PACKAGE_PIN R2  IOSTANDARD LVCMOS33 } [get_ports { TEST_MODE }];

##########################
# Configuration Settings #
##########################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

