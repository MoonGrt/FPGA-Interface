`timescale 1ns / 1ps

module can_rx (
    input wire can_clk,
    input wire rst_n,
    input wire can_rx,

    output reg        can_ack_out_low,
    output reg        can_id_out_en,
    output reg [10:0] can_id_out,
    output reg        can_data_out_en,
    output reg [63:0] can_data_out
);

    reg [ 8:0] state;
    reg        can_rx_t;
    reg        error_state;
    reg [ 9:0] error_data;
    reg [ 4:0] one_bit_cont;
    reg [10:0] can_id;
    reg [ 6:0] bit_cont;
    reg        id_en_flag;
    reg        contral_flag;
    reg        data_en_flag;
    reg        cic_en_flag;
    reg        can_rx_en_flag;
    reg        can_rx_unen_flag;
    reg [ 4:0] can_continuity_data;
    reg        can_continuity_data_flag;
    reg [ 4:0] can_id_data_cont;
    reg [ 3:0] can_contral_data_cont;
    reg [ 6:0] can_data_data_cont;
    reg [ 4:0] can_cic_data_cont;

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_rx_t <= 'b0;
        else can_rx_t <= can_rx;
    end

    parameter state_idle = 9'b000000000;  // 状态机初始化
    parameter state_start = 9'b000000001;  // 监测到开始标志
    parameter state_sof = 9'b000000010;  // 开始帧头第一位SOF
    parameter state_id = 9'b000000100;  // 包ID
    parameter state_control = 9'b000001000;  // 标准帧控制段
    parameter state_data = 9'b000010000;  // 数据段
    parameter state_crc = 9'b000100000;  // CRC段
    parameter state_ack = 9'b001000000;  // ACK段
    parameter state_eof = 9'b010000000;  // 帧结束段
    parameter state_end = 9'b100000000;  // 状态机结束状态
    parameter bit_flag_no = 5'b10011;

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            state <= 'b0;
            one_bit_cont <= 'b0;
            bit_cont <= 'b0;
            id_en_flag <= 'b0;
            contral_flag <= 'b0;
            data_en_flag <= 'b0;
            cic_en_flag <= 'b0;
            can_rx_en_flag <= 'b0;
            can_ack_out_low <= 'b1;
        end else
            case (state)
                state_idle: begin
                    if ((can_rx_t == 1'b1) && (can_rx == 1'b0)) begin
                        state          <= state_sof;
                        one_bit_cont   <= 'b0;
                        can_rx_en_flag <= 'b1;
                    end else begin
                        state           <= state_idle;
                        one_bit_cont    <= 'b0;
                        bit_cont        <= 'b0;
                        id_en_flag      <= 'b0;
                        contral_flag    <= 'b0;
                        data_en_flag    <= 'b0;
                        cic_en_flag     <= 'b0;
                        can_rx_en_flag  <= 'b0;
                        can_ack_out_low <= 'b1;
                    end
                end
                state_sof: begin
                    if ((one_bit_cont == bit_flag_no) && (can_rx == 1'b0)) begin
                        state        <= state_id;
                        id_en_flag   <= 'b1;
                        one_bit_cont <= 'b0;
                    end else if ((one_bit_cont < bit_flag_no) && (can_rx == 1'b0)) begin
                        state        <= state_sof;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end
                end
                state_id: begin
                    if ((one_bit_cont == bit_flag_no) && (bit_cont == can_id_data_cont)) begin
                        state        <= state_control;
                        id_en_flag   <= 'b0;
                        contral_flag <= 'b1;
                        one_bit_cont <= 'b0;
                        bit_cont     <= 'b0;
                    end else if ((one_bit_cont==bit_flag_no)&&(bit_cont<can_id_data_cont)) begin
                        state        <= state_id;
                        one_bit_cont <= 'b0;
                        bit_cont     <= bit_cont + 1'b1;
                    end else if (one_bit_cont < bit_flag_no) begin
                        state        <= state_id;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end else begin
                        state <= state_idle;
                    end
                end
                state_control: begin
                    if ((one_bit_cont == bit_flag_no) && (bit_cont == can_contral_data_cont)) begin
                        state        <= state_data;
                        contral_flag <= 'b0;
                        one_bit_cont <= 'b0;
                        bit_cont     <= 'b0;
                        data_en_flag <= 'b1;
                    end else if ((one_bit_cont==bit_flag_no)&&(bit_cont<can_contral_data_cont)) begin
                        state        <= state_control;
                        one_bit_cont <= 'b0;
                        bit_cont     <= bit_cont + 1'b1;
                    end else if (one_bit_cont < bit_flag_no) begin
                        state        <= state_control;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end else begin
                        state <= state_idle;
                    end
                end
                state_data: begin
                    if ((one_bit_cont == bit_flag_no) && (bit_cont == can_data_data_cont)) begin
                        state        <= state_crc;
                        one_bit_cont <= 'b0;
                        bit_cont     <= 'b0;
                        data_en_flag <= 'b0;
                        cic_en_flag  <= 'b1;
                    end else if ((one_bit_cont==bit_flag_no)&&(bit_cont<can_data_data_cont)) begin
                        state        <= state_data;
                        one_bit_cont <= 'b0;
                        bit_cont     <= bit_cont + 1'b1;
                    end else if (one_bit_cont < bit_flag_no) begin
                        state        <= state_data;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end else begin
                        state <= state_idle;
                    end
                end
                state_crc: begin
                    if ((one_bit_cont == bit_flag_no) && (bit_cont == can_cic_data_cont)) begin
                        state           <= state_ack;
                        can_ack_out_low <= 'b0;
                        one_bit_cont    <= 'b0;
                        bit_cont        <= 'b0;
                        cic_en_flag     <= 'b0;
                    end else if ((one_bit_cont==bit_flag_no)&&(bit_cont<can_cic_data_cont)) begin
                        state        <= state_crc;
                        one_bit_cont <= 'b0;
                        bit_cont     <= bit_cont + 1'b1;
                    end else if (one_bit_cont < bit_flag_no) begin
                        state        <= state_crc;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end else begin
                        state <= state_idle;
                    end
                end
                state_ack: begin
                    if ((one_bit_cont == bit_flag_no) && (bit_cont == 1)) begin
                        state           <= state_eof;
                        can_ack_out_low <= 'b1;
                        one_bit_cont    <= 'b0;
                        bit_cont        <= 'b0;
                    end else if ((one_bit_cont == bit_flag_no) && (bit_cont < 1)) begin
                        state        <= state_ack;
                        one_bit_cont <= 'b0;
                        bit_cont     <= bit_cont + 1'b1;
                    end else if (one_bit_cont < bit_flag_no) begin
                        state        <= state_ack;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end else begin
                        state <= state_idle;
                    end
                end
                state_eof: begin
                    if ((one_bit_cont == bit_flag_no) && (bit_cont == 5)) begin
                        state        <= state_end;
                        one_bit_cont <= 'b0;
                        bit_cont     <= 'b0;
                    end else if ((one_bit_cont == bit_flag_no) && (bit_cont < 5)) begin
                        state        <= state_eof;
                        one_bit_cont <= 'b0;
                        bit_cont     <= bit_cont + 1'b1;
                    end else if (one_bit_cont < bit_flag_no) begin
                        state        <= state_eof;
                        one_bit_cont <= one_bit_cont + 1'b1;
                    end else begin
                        state <= state_idle;
                    end
                end
                state_end: begin
                    state           <= state_idle;
                    one_bit_cont    <= 'b0;
                    bit_cont        <= 'b0;
                    id_en_flag      <= 'b0;
                    contral_flag    <= 'b0;
                    data_en_flag    <= 'b0;
                    cic_en_flag     <= 'b0;
                    can_rx_en_flag  <= 'b0;
                    can_ack_out_low <= 'b1;
                end
                default: begin
                    state           <= state_idle;
                    one_bit_cont    <= 'b0;
                    bit_cont        <= 'b0;
                    id_en_flag      <= 'b0;
                    contral_flag    <= 'b0;
                    data_en_flag    <= 'b0;
                    cic_en_flag     <= 'b0;
                    can_rx_en_flag  <= 'b0;
                    can_ack_out_low <= 'b1;
                end
            endcase
    end

    //always @(posedge can_clk or negedge rst_n)begin
    //if(rst_n==1'b0) begin
    //error_data	<= 'b0									;
    //end else if (can_rx_en_flag==1) begin
    //error_data	<= {error_data[9:0],can_rx	}				;
    //end	else if (one_bit_cont==11) begin
    //can_rx_unen_flag	<= 1'b0									;
    //end else if (can_rx_en_flag==0)
    //can_rx_unen_flag	<= 'b0									;
    //end 

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            can_continuity_data <= 5'b11111;
            can_continuity_data_flag <= 'b0;
        end else if ((one_bit_cont == 9) && (can_rx_en_flag == 1)) begin
            can_continuity_data <= {can_continuity_data[3:0], can_rx};
            can_continuity_data_flag <= 'b0;
        end	else if (((can_continuity_data==0)||(can_continuity_data==5'b11111))&&(one_bit_cont==10)&&(cic_en_flag==0)) begin
            can_continuity_data_flag <= 'b1;
        end else if (((can_continuity_data==0)||(can_continuity_data==5'b11111))&&(one_bit_cont==10)&&(cic_en_flag==1)&&(bit_cont<14)) begin
            can_continuity_data_flag <= 'b1;
        end else if (can_rx_en_flag == 0) begin
            can_continuity_data <= 5'b11111;
            can_continuity_data_flag <= 'b0;
        end else begin
            can_continuity_data_flag <= 'b0;
        end
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_rx_unen_flag <= 'b0;
        else if ((can_rx_en_flag == 1) && (can_continuity_data_flag == 1) && (cic_en_flag == 0))
            can_rx_unen_flag <= 1'b1;
        else if ((can_rx_en_flag==1)&&(can_continuity_data_flag==1)&&(cic_en_flag==1)&&(bit_cont<14))
            can_rx_unen_flag <= 1'b1;
        else if (one_bit_cont == 11) can_rx_unen_flag <= 1'b0;
        else if (can_rx_en_flag == 0) can_rx_unen_flag <= 'b0;
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_id_data_cont <= 'd10;
        else if ((id_en_flag == 1) && (can_continuity_data_flag == 1))
            can_id_data_cont <= can_id_data_cont + 1'b1;
        else if (id_en_flag == 0) can_id_data_cont <= 'd10;
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_contral_data_cont <= 'd6;
        else if ((contral_flag == 1) && (can_continuity_data_flag == 1))
            can_contral_data_cont <= can_contral_data_cont + 1'b1;
        else if (contral_flag == 0) can_contral_data_cont <= 'd6;
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_data_data_cont <= 'd63;
        else if ((data_en_flag == 1) && (can_continuity_data_flag == 1))
            can_data_data_cont <= can_data_data_cont + 1'b1;
        else if (data_en_flag == 0) can_data_data_cont <= 'd63;
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_cic_data_cont <= 'd15;
        else if ((cic_en_flag == 1) && (can_continuity_data_flag == 1))
            can_cic_data_cont <= can_cic_data_cont + 1'b1;
        else if (cic_en_flag == 0) can_cic_data_cont <= 'd15;
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_id_out <= 'b0;
        else if ((one_bit_cont == 9) && (id_en_flag == 1) && (can_rx_unen_flag == 0))
            can_id_out <= {can_id_out[9:0], can_rx};
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            can_id_out_en <= 'b0;
        end else if ((one_bit_cont==9)&&(bit_cont==can_id_data_cont)&&(id_en_flag==1)) begin
            can_id_out_en <= 1'b1;
        end else can_id_out_en <= 'b0;
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_data_out <= 'b0;
        else if ((one_bit_cont == 9) && (data_en_flag == 1) && (can_rx_unen_flag == 0))
            can_data_out <= {can_data_out[62:0], can_rx};
    end

    always @(posedge can_clk or negedge rst_n) begin
        if (rst_n == 1'b0) can_data_out_en <= 'b0;
        else if ((bit_cont == can_data_data_cont) && (one_bit_cont == 9) && (data_en_flag == 1))
            can_data_out_en <= 1'b1;
        else can_data_out_en <= 'b0;
    end

endmodule
