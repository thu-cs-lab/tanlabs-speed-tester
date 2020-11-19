# clock outputs
set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports clk_out1]
set_property -dict {PACKAGE_PIN Y5 IOSTANDARD LVCMOS33} [get_ports clk_out2]

# ponylink master pins
# data pin: cpld_emu_wrn, link error: led0
set_property -dict {PACKAGE_PIN AA12 IOSTANDARD LVCMOS33} [get_ports data_pin_1]
set_property -dict {PACKAGE_PIN Y15 IOSTANDARD LVCMOS33} [get_ports link_error_1]
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports data_pin_2]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports link_error_2]
set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVCMOS33} [get_ports data_pin_3]
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports link_error_3]
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS33} [get_ports data_pin_4]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports link_error_4]
