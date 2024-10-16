`include "./defines.v"

module top (
    input wire sys_clk,
    input wire rst,

    output wire halted_ind,  // jtag是否已经halt住CPU信号

    input  wire jtag_TCK,  // JTAG TCK引脚
    input  wire jtag_TMS,  // JTAG TMS引脚
    input  wire jtag_TDI,  // JTAG TDI引脚
    output wire jtag_TDO   // JTAG TDO引脚
);

    wire [`MemAddrBus] addr_i;
    wire [    `MemBus] data_i;
    wire [    `MemBus] data_o;
    wire               req_i;
    wire               we_i;

    // jtag
    wire               jtag_halt_req_o;
    wire               jtag_reset_req_o;
    wire [`RegAddrBus] jtag_reg_addr_o;
    wire [    `RegBus] jtag_reg_data_o;
    wire               jtag_reg_we_o;
    wire [    `RegBus] jtag_reg_data_i;

    // 低电平点亮LED
    // 低电平表示已经halt住CPU
    assign halted_ind = ~jtag_halt_req_o;

    wire clk;
    clk_wiz clk_wiz (
        // Clock out ports
        .clk_out(clk),     // output clk_out
        // Clock in ports
        .clk_in (sys_clk)
    );  // input clk_in

    // jtag模块例化
    jtag_top #(
        .DMI_ADDR_BITS(6),
        .DMI_DATA_BITS(32),
        .DMI_OP_BITS  (2)
    ) u_jtag_top (
        .clk         (clk),
        .jtag_rst_n  (rst),
        .jtag_pin_TCK(jtag_TCK),
        .jtag_pin_TMS(jtag_TMS),
        .jtag_pin_TDI(jtag_TDI),
        .jtag_pin_TDO(jtag_TDO),
        .reg_we_o    (jtag_reg_we_o),
        .reg_addr_o  (jtag_reg_addr_o),
        .reg_wdata_o (jtag_reg_data_o),
        .reg_rdata_i (jtag_reg_data_i),
        .mem_we_o    (we_i),
        .mem_addr_o  (addr_i),
        .mem_wdata_o (data_i),
        .mem_rdata_i (data_o),
        .op_req_o    (req_i),
        .halt_req_o  (jtag_halt_req_o),
        .reset_req_o (jtag_reset_req_o)
    );

endmodule
