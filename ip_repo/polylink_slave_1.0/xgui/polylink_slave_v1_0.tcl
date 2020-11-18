# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}

proc update_PARAM_VALUE.MASTER_PARBITS { PARAM_VALUE.MASTER_PARBITS } {
	# Procedure called to update MASTER_PARBITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MASTER_PARBITS { PARAM_VALUE.MASTER_PARBITS } {
	# Procedure called to validate MASTER_PARBITS
	return true
}

proc update_PARAM_VALUE.MASTER_TIMINGS { PARAM_VALUE.MASTER_TIMINGS } {
	# Procedure called to update MASTER_TIMINGS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MASTER_TIMINGS { PARAM_VALUE.MASTER_TIMINGS } {
	# Procedure called to validate MASTER_TIMINGS
	return true
}

proc update_PARAM_VALUE.SERDES_REG_IN { PARAM_VALUE.SERDES_REG_IN } {
	# Procedure called to update SERDES_REG_IN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SERDES_REG_IN { PARAM_VALUE.SERDES_REG_IN } {
	# Procedure called to validate SERDES_REG_IN
	return true
}

proc update_PARAM_VALUE.SERDES_REG_OUT { PARAM_VALUE.SERDES_REG_OUT } {
	# Procedure called to update SERDES_REG_OUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SERDES_REG_OUT { PARAM_VALUE.SERDES_REG_OUT } {
	# Procedure called to validate SERDES_REG_OUT
	return true
}

proc update_PARAM_VALUE.SLAVE_PARBITS { PARAM_VALUE.SLAVE_PARBITS } {
	# Procedure called to update SLAVE_PARBITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SLAVE_PARBITS { PARAM_VALUE.SLAVE_PARBITS } {
	# Procedure called to validate SLAVE_PARBITS
	return true
}

proc update_PARAM_VALUE.SLAVE_TIMINGS { PARAM_VALUE.SLAVE_TIMINGS } {
	# Procedure called to update SLAVE_TIMINGS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SLAVE_TIMINGS { PARAM_VALUE.SLAVE_TIMINGS } {
	# Procedure called to validate SLAVE_TIMINGS
	return true
}

proc update_PARAM_VALUE.TDATA_WIDTH { PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to update TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDATA_WIDTH { PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to validate TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.TUSER_WIDTH { PARAM_VALUE.TUSER_WIDTH } {
	# Procedure called to update TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TUSER_WIDTH { PARAM_VALUE.TUSER_WIDTH } {
	# Procedure called to validate TUSER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.SERDES_REG_IN { MODELPARAM_VALUE.SERDES_REG_IN PARAM_VALUE.SERDES_REG_IN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SERDES_REG_IN}] ${MODELPARAM_VALUE.SERDES_REG_IN}
}

proc update_MODELPARAM_VALUE.SERDES_REG_OUT { MODELPARAM_VALUE.SERDES_REG_OUT PARAM_VALUE.SERDES_REG_OUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SERDES_REG_OUT}] ${MODELPARAM_VALUE.SERDES_REG_OUT}
}

proc update_MODELPARAM_VALUE.MASTER_PARBITS { MODELPARAM_VALUE.MASTER_PARBITS PARAM_VALUE.MASTER_PARBITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MASTER_PARBITS}] ${MODELPARAM_VALUE.MASTER_PARBITS}
}

proc update_MODELPARAM_VALUE.SLAVE_PARBITS { MODELPARAM_VALUE.SLAVE_PARBITS PARAM_VALUE.SLAVE_PARBITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SLAVE_PARBITS}] ${MODELPARAM_VALUE.SLAVE_PARBITS}
}

proc update_MODELPARAM_VALUE.MASTER_TIMINGS { MODELPARAM_VALUE.MASTER_TIMINGS PARAM_VALUE.MASTER_TIMINGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MASTER_TIMINGS}] ${MODELPARAM_VALUE.MASTER_TIMINGS}
}

proc update_MODELPARAM_VALUE.SLAVE_TIMINGS { MODELPARAM_VALUE.SLAVE_TIMINGS PARAM_VALUE.SLAVE_TIMINGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SLAVE_TIMINGS}] ${MODELPARAM_VALUE.SLAVE_TIMINGS}
}

proc update_MODELPARAM_VALUE.TDATA_WIDTH { MODELPARAM_VALUE.TDATA_WIDTH PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDATA_WIDTH}] ${MODELPARAM_VALUE.TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.TUSER_WIDTH { MODELPARAM_VALUE.TUSER_WIDTH PARAM_VALUE.TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TUSER_WIDTH}] ${MODELPARAM_VALUE.TUSER_WIDTH}
}

