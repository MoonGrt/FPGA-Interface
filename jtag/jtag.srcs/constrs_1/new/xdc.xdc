# 时钟约束0MHz
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports {sys_clk}]; 
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports {sys_clk}];

# 时钟引脚
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN M19 [get_ports sys_clk]

# 复位引脚
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN L18 [get_ports rst]

# CPU停住指示引脚                  将第6个led作为CPU停住指示引脚   
set_property IOSTANDARD LVCMOS33 [get_ports halted_ind]
set_property PACKAGE_PIN U7 [get_ports halted_ind]

# JTAG TCK引脚
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TCK]
set_property PACKAGE_PIN W20 [get_ports jtag_TCK]
# 屏蔽
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_TCK]
#create_clock -name jtag_clk_pin -period 300 [get_ports {jtag_TCK}];

# JTAG TMS引脚
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TMS]
set_property PACKAGE_PIN W21 [get_ports jtag_TMS]

# JTAG TDI引脚
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TDI]
set_property PACKAGE_PIN V22 [get_ports jtag_TDI]

# JTAG TDO引脚
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TDO]
set_property PACKAGE_PIN W22 [get_ports jtag_TDO]

#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]  
#set_property CONFIG_MODE SPIx4 [current_design] 
#set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]