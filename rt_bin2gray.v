`define NUM_BIT 32

module rt_bin2gray (
  input  [`NUM_BIT - 1:0] rt_i_bin,
  output [`NUM_BIT - 1:0] rt_o_gray
);


assign rt_o_gray = rt_i_bin^{1'b0,rt_i_bin[`NUM_BIT-1:1]};

endmodule
