`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:32:56 11/11/2016
// Design Name:   rt_bin2gray
// Module Name:   D:/Project/verilog_templet/graycode/tb_graycode.v
// Project Name:  ise_sim
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rt_bin2gray
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define DEF_BIT_NUM 32
module tb_graycode;

	// Inputs
        reg tb_r_clk    = 1'b0;
        reg tb_r_rst    = 1'b0;   
        reg tb_r_set    = 1'b0;   
        reg tb_r_ce     = 1'b0;   
        reg tb_r_inc_n  = 1'b0; 
        reg  [`DEF_BIT_NUM-1:0]tb_r_ld_val = `DEF_BIT_NUM'd0; 
        wire [`DEF_BIT_NUM-1:0] tb_w_bin_cnt;
        wire tb_w_eqnz;
        wire [`DEF_BIT_NUM-1:0] tb_w_bin_result;
        wire [`DEF_BIT_NUM-1:0] tb_w_gray_cnt;

	// Outputs

        wire tb_w_result_cmp;
        assign tb_w_result_cmp = (tb_w_bin_result == tb_w_bin_cnt);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
                @(posedge tb_r_clk);            tb_r_ce     = 1'b1;  
                repeat(20) @(posedge tb_r_clk); tb_r_ce     = 1'b0; 

                @(posedge tb_r_clk);            tb_r_rst = 1'b1;
                @(posedge tb_r_clk);            tb_r_rst = 1'b0;


                @(posedge tb_r_clk); tb_r_ce  = 1'b1;  
                @(posedge tb_r_clk); tb_r_set = 1'b1; tb_r_ld_val = `DEF_BIT_NUM'd3;
                @(posedge tb_r_clk); tb_r_set = 1'b0;
                repeat(20) @(posedge tb_r_clk); tb_r_ce     = 1'b0; 

                @(posedge tb_r_clk);            tb_r_rst = 1'b1;
                @(posedge tb_r_clk);            tb_r_rst = 1'b0;
                tb_r_inc_n = 1'b1;


                @(posedge tb_r_clk); tb_r_ce  = 1'b1;  
                repeat(20) @(posedge tb_r_clk); tb_r_ce     = 1'b0; 
	end

        initial begin
          tb_r_clk = 1'b0;
          forever #5 tb_r_clk = ~tb_r_clk;
        end

        // Instantiate the Unit Under Test (UUT)
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
        )uut (
          .rt_i_bin (tb_w_bin_cnt), 
          .rt_o_gray(tb_w_gray_cnt)
	);

        rt_gray2bin #(
	  .PARAM_BIT_NUM(`DEF_BIT_NUM)
        )u1_gray2bin (
          .rt_i_gray(tb_w_gray_cnt), 
          .rt_o_bin(tb_w_bin_result)
        );

endmodule

