
module rt_bin2gray #(
  parameter PARAM_BIT_NUM = 4
)(
  input  [PARAM_BIT_NUM - 1:0] rt_i_bin,
  output [PARAM_BIT_NUM - 1:0] rt_o_gray
);


assign rt_o_gray = rt_i_bin^(rt_i_bin>>1);

endmodule



