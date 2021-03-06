/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [7:0] a;
  
  reg [7:0] b;
  
  reg [5:0] alufn;
  
  reg [7:0] M_test_counter_d, M_test_counter_q = 1'h0;
  
  wire [8-1:0] M_alu_out;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  wire [2-1:0] M_test_adder_status;
  reg [1-1:0] M_test_adder_clk;
  reg [1-1:0] M_test_adder_rst;
  reg [1-1:0] M_test_adder_start;
  test_adder_2 test_adder (
    .clk(M_test_adder_clk),
    .rst(M_test_adder_rst),
    .start(M_test_adder_start),
    .status(M_test_adder_status)
  );
  
  wire [2-1:0] M_test_compare_status;
  reg [1-1:0] M_test_compare_clk;
  reg [1-1:0] M_test_compare_rst;
  reg [1-1:0] M_test_compare_start;
  test_compare_3 test_compare (
    .clk(M_test_compare_clk),
    .rst(M_test_compare_rst),
    .start(M_test_compare_start),
    .status(M_test_compare_status)
  );
  
  wire [2-1:0] M_test_bool_status;
  reg [1-1:0] M_test_bool_clk;
  reg [1-1:0] M_test_bool_rst;
  reg [1-1:0] M_test_bool_start;
  test_bool_4 test_bool (
    .clk(M_test_bool_clk),
    .rst(M_test_bool_rst),
    .start(M_test_bool_start),
    .status(M_test_bool_status)
  );
  
  wire [2-1:0] M_test_shifter_status;
  reg [1-1:0] M_test_shifter_clk;
  reg [1-1:0] M_test_shifter_rst;
  reg [1-1:0] M_test_shifter_start;
  test_shifter_5 test_shifter (
    .clk(M_test_shifter_clk),
    .rst(M_test_shifter_rst),
    .start(M_test_shifter_start),
    .status(M_test_shifter_status)
  );
  
  wire [2-1:0] M_test_multiplier_status;
  reg [1-1:0] M_test_multiplier_clk;
  reg [1-1:0] M_test_multiplier_rst;
  reg [1-1:0] M_test_multiplier_start;
  test_multiplier_6 test_multiplier (
    .clk(M_test_multiplier_clk),
    .rst(M_test_multiplier_rst),
    .start(M_test_multiplier_start),
    .status(M_test_multiplier_status)
  );
  
  wire [2-1:0] M_test_error_status;
  reg [1-1:0] M_test_error_clk;
  reg [1-1:0] M_test_error_rst;
  reg [1-1:0] M_test_error_start;
  test_error_7 test_error (
    .clk(M_test_error_clk),
    .rst(M_test_error_rst),
    .start(M_test_error_start),
    .status(M_test_error_status)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_8 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_state = 3'd0;
  localparam ADDER_state = 3'd1;
  localparam COMPARE_state = 3'd2;
  localparam BOOL_state = 3'd3;
  localparam SHIFTER_state = 3'd4;
  localparam MULTIPLY_state = 3'd5;
  localparam ERROR_state = 3'd6;
  
  reg [2:0] M_state_d, M_state_q = IDLE_state;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_9 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_test_counter_d = M_test_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_test_adder_clk = clk;
    M_test_adder_rst = rst;
    M_test_error_clk = clk;
    M_test_error_rst = rst;
    M_test_compare_clk = clk;
    M_test_compare_rst = rst;
    M_test_bool_clk = clk;
    M_test_bool_rst = rst;
    M_test_shifter_clk = clk;
    M_test_shifter_rst = rst;
    M_test_multiplier_clk = clk;
    M_test_multiplier_rst = rst;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_seg_values = 16'hffff;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    a[0+7-:8] = io_dip[0+7-:8];
    b[0+7-:8] = io_dip[8+7-:8];
    alufn = io_dip[16+0+5-:6];
    M_alu_a = a;
    M_alu_b = b;
    M_alu_alufn = alufn;
    M_test_adder_start = 1'h0;
    M_test_compare_start = 1'h0;
    M_test_bool_start = 1'h0;
    M_test_shifter_start = 1'h0;
    M_test_multiplier_start = 1'h0;
    M_test_error_start = 1'h0;
    
    case (M_state_q)
      IDLE_state: begin
        M_test_counter_d = 1'h0;
      end
      ADDER_state: begin
        M_test_adder_start = 1'h1;
        if (M_test_adder_status == 1'h1) begin
          M_seg_values = 16'hab55;
        end else begin
          if (M_test_adder_status == 2'h2) begin
            M_seg_values = 16'hb00d;
          end
        end
      end
      COMPARE_state: begin
        M_test_compare_start = 1'h1;
        if (M_test_compare_status == 1'h1) begin
          M_seg_values = 16'hab55;
        end else begin
          if (M_test_compare_status == 2'h2) begin
            M_seg_values = 16'he0ad;
          end
        end
      end
      BOOL_state: begin
        M_test_bool_start = 1'h1;
        if (M_test_bool_status == 1'h1) begin
          M_seg_values = 16'hab55;
        end else begin
          if (M_test_bool_status == 2'h2) begin
            M_seg_values = 16'h800d;
          end
        end
      end
      SHIFTER_state: begin
        M_test_shifter_start = 1'h1;
        if (M_test_shifter_status == 1'h1) begin
          M_seg_values = 16'hab55;
        end else begin
          if (M_test_shifter_status == 2'h2) begin
            M_seg_values = 16'h5c1d;
          end
        end
      end
      MULTIPLY_state: begin
        M_test_multiplier_start = 1'h1;
        if (M_test_multiplier_status == 1'h1) begin
          M_seg_values = 16'hab55;
        end else begin
          if (M_test_multiplier_status == 2'h2) begin
            M_seg_values = 16'h234d;
          end
        end
      end
      ERROR_state: begin
        M_test_error_start = 1'h1;
        if (M_test_error_status == 1'h1) begin
          M_seg_values = 16'hab55;
        end else begin
          if (M_test_error_status == 2'h2) begin
            M_seg_values = 16'hb00d;
          end
        end
      end
    endcase
    if (io_button[0+0-:1]) begin
      M_test_counter_d = 1'h0;
      M_state_d = ADDER_state;
      if (io_dip[16+7+0-:1]) begin
        M_test_counter_d = 1'h0;
        M_state_d = ERROR_state;
      end
    end
    if (io_button[1+0-:1]) begin
      M_test_counter_d = 1'h0;
      M_state_d = COMPARE_state;
    end
    if (io_button[2+0-:1]) begin
      M_test_counter_d = 1'h0;
      M_state_d = BOOL_state;
    end
    if (io_button[3+0-:1]) begin
      M_test_counter_d = 1'h0;
      M_state_d = SHIFTER_state;
    end
    if (io_button[4+0-:1]) begin
      M_test_counter_d = 1'h0;
      M_state_d = MULTIPLY_state;
    end
    M_test_counter_d = M_test_counter_q + 1'h1;
    io_led[0+7-:8] = M_alu_out;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_test_counter_q <= 1'h0;
    end else begin
      M_test_counter_q <= M_test_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
