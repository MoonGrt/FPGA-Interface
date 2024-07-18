`timescale 1ns / 1ps

module top(
    input  wire clk,
    input  wire rst_n,
    input  wire rxp,
    output wire txp
);

parameter CLK_FRE  = 27;  // Mhz
parameter UART_FRE = 115200;

wire rx_valid;
wire [7:0] rx_data;

uart_rx #(
    .CLK_FRE  ( CLK_FRE  ),
    .BAUD_RATE( UART_FRE ))
rx(
    .clk      ( clk      ),
    .rst      ( ~rst_n   ),
    .rx_pin   ( rxp      ),
    .rx_valid ( rx_valid ),
    .rx_data  ( rx_data  )
);


// Print Controll -------------------------------------------
`include "print.vh"
defparam tx.CLK_FRE = CLK_FRE;
defparam tx.BAUD_RATE = UART_FRE;
assign print_clk = clk;
assign print_rst = ~rst_n;
assign txp = uart_txp;
// Print Controll -------------------------------------------

localparam SEND = 1'b0;  //send 
localparam WAIT = 1'b1;  //wait 1 second and send uart received data
reg [31:0] cnt;
reg        state;
always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        state <= SEND;
    else
        case(state)
            SEND: begin
                cnt <= 32'd0;
                `print({"ÄãºÃ GOWIN",16'h0d0a}, STR);  // In mobaxterm, support Chinese
                state <= WAIT;
            end
            WAIT: begin
                cnt <= cnt + 32'd1;

                if(rx_valid) 
                    `print(rx_data, STR);
                else if(cnt >= CLK_FRE * 1000_000 * 5)  // wait for 5 second
                    state <= SEND;
            end
            default:
                state <= SEND;
        endcase
end

endmodule
