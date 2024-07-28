-makelib ies_lib/xil_defaultlib -sv \
  "G:/Xilinx3/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "G:/Xilinx3/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../jtag.srcs/sources_1/ip/clk_wiz/clk_wiz_clk_wiz.v" \
  "../../../../jtag.srcs/sources_1/ip/clk_wiz/clk_wiz.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

