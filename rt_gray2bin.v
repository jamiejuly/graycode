
//rt_gray2bin instance_name (
//    .rt_i_gray(rt_i_gray), 
//    .rt_o_bin(rt_o_bin)
//    );

module rt_gray2bin#(
  parameter PARAM_BIT_NUM = 4
)( 
  input      [PARAM_BIT_NUM-1 : 0] rt_i_gray,
  output reg [PARAM_BIT_NUM-1 : 0] rt_o_bin = 'd0
);


integer var_shift;

always@(*) begin
  rt_o_bin = rt_i_gray;
  for (var_shift = PARAM_BIT_NUM>>1; var_shift != 0; var_shift =var_shift >> 1)  
  begin: LABEL_GRAY2BIN
      rt_o_bin = rt_o_bin ^ (rt_o_bin >> var_shift);
  end
end

endmodule
