`define DEF_BIT_NUM 32

module rt_top (
  input tb_r_clk,
  input tb_r_rst,  
  input tb_r_set,  
  input tb_r_ce,   
  input tb_r_inc_n,
  input [`DEF_BIT_NUM-1:0]tb_r_ld_val,
  output tb_w_result_cmp,
  output tb_w_eqnz
);

wire [`DEF_BIT_NUM-1:0] tb_w_bin_cnt;
wire [`DEF_BIT_NUM-1:0] tb_w_bin_result;
wire [`DEF_BIT_NUM-1:0] tb_w_gray_cnt;

assign tb_w_result_cmp = (tb_w_bin_result == tb_w_bin_cnt);

rt_bin_cnt #(
  .PARAM_BIT_NUM(`DEF_BIT_NUM)
)u0_bin_cnt (
  .rt_i_clk     (tb_r_clk      ), 
  .rt_i_rst     (tb_r_rst      ), //sync rst
  .rt_i_set     (tb_r_set      ), 
  .rt_i_ce      (tb_r_ce       ), 
  .rt_i_inc_n   (tb_r_inc_n    ), //0:increase mode, 1:decrease mode 
  .rt_i_ld_val  (tb_r_ld_val   ), 
  .rt_o_bin_cnt (tb_w_bin_cnt  ), 
  .rt_o_eqnz    (tb_w_eqnz     )
  );

rt_bin2gray #(
  .PARAM_BIT_NUM(`DEF_BIT_NUM)
)u1_bin2gray (
  .rt_i_bin (tb_w_bin_cnt), 
  .rt_o_gray(tb_w_gray_cnt)
);

rt_gray2bin #(
  .PARAM_BIT_NUM(`DEF_BIT_NUM)
)u2_gray2bin (
  .rt_i_gray(tb_w_gray_cnt), 
  .rt_o_bin(tb_w_bin_result)
);




endmodule
