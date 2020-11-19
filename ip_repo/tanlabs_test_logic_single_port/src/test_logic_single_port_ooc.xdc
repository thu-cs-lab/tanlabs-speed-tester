################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name clk_160M -period 6.250 [get_ports clk_160M]
create_clock -name clk_40M -period 25 [get_ports clk_40M]
create_clock -name eth_clks_s_axi_lite_clk -period 10 [get_ports eth_clks_s_axi_lite_clk]
create_clock -name eth_clks_ref_clk -period 10 [get_ports eth_clks_ref_clk]
create_clock -name eth_clks_rxuserclk -period 10 [get_ports eth_clks_rxuserclk]
create_clock -name eth_clks_rxuserclk2 -period 10 [get_ports eth_clks_rxuserclk2]
create_clock -name eth_clks_userclk -period 10 [get_ports eth_clks_userclk]
create_clock -name eth_clks_userclk2 -period 10 [get_ports eth_clks_userclk2]
create_clock -name eth_clks_gt0_pll0outclk_in -period 10 [get_ports eth_clks_gt0_pll0outclk_in]
create_clock -name eth_clks_gt0_pll0outrefclk_in -period 10 [get_ports eth_clks_gt0_pll0outrefclk_in]
create_clock -name eth_clks_gt0_pll1outclk_in -period 10 [get_ports eth_clks_gt0_pll1outclk_in]
create_clock -name eth_clks_gt0_pll1outrefclk_in -period 10 [get_ports eth_clks_gt0_pll1outrefclk_in]
create_clock -name eth_clks_gtref_clk -period 10 [get_ports eth_clks_gtref_clk]
create_clock -name eth_clks_gtref_clk_buf -period 10 [get_ports eth_clks_gtref_clk_buf]

################################################################################