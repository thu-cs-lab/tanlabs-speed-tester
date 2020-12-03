# clock outputs
set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports clk_out1]
set_property -dict {PACKAGE_PIN Y5 IOSTANDARD LVCMOS33} [get_ports clk_out2]

# ponylink master pins
set_property -dict {PACKAGE_PIN AA12 IOSTANDARD LVCMOS33} [get_ports {ponylink_data[0]}]
set_property -dict {PACKAGE_PIN AA9  IOSTANDARD LVCMOS33} [get_ports {ponylink_data[1]}]
set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVCMOS33} [get_ports {ponylink_data[2]}]
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS33} [get_ports {ponylink_data[3]}]
set_property -dict {PACKAGE_PIN U12  IOSTANDARD LVCMOS33} [get_ports {ponylink_data[4]}]

# leds
set_property -dict {PACKAGE_PIN Y15 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]
set_property -dict {PACKAGE_PIN Y20 IOSTANDARD LVCMOS33} [get_ports {leds[4]}]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports {leds[5]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {leds[6]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {leds[7]}]
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {leds[8]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {leds[9]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {leds[10]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {leds[11]}]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports {leds[12]}]
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {leds[13]}]
set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33} [get_ports {leds[14]}]
set_property -dict {PACKAGE_PIN V9  IOSTANDARD LVCMOS33} [get_ports {leds[15]}]

# artix programming pins
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports prog_mosi]
set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports prog_sclk]
set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports progb]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports initb]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports done]
