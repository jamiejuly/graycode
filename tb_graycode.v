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

module tb_graycode;

	// Inputs
        reg tb_r_clk    = 1'b0;
        reg tb_r_rst    = 1'b0;   
        reg tb_r_set    = 1'b0;   
        reg tb_r_ce     = 1'b0;   
        reg tb_r_inc_n  = 1'b0; 
        reg tb_r_ld_val = 32'd0; 
        wire [31:0] tb_w_bin_cnt;
        wire [31:0] tb_w_gray_cnt;
        wire tb_w_eqnz;





	// Outputs
	wire [31:0] rt_o_gray;

	// Instantiate the Unit Under Test (UUT)
	rt_bin2gray uut (
		.rt_i_bin(tb_w_bin_cnt), 
		.rt_o_gray(tb_w_gray_cnt)
	);

	initial begin
		// Initialize Inputs
		rt_i_bin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
                @(posedge tb_r_clk);
                tb_r_rst    = 1'b0;  
                tb_r_set    = 1'b0;  
                tb_r_ce     = 1'b1;  
                tb_r_inc_n  = 1'b0; 
                tb_r_ld_val = 32'd0; 

                repeat(20) @(posedge tb_r_clk);
                tb_r_rst    = 1'b0;  
                tb_r_set    = 1'b0;  
                tb_r_ce     = 1'b0;  
                tb_r_inc_n  = 1'b0; 
                tb_r_ld_val = 32'd0; 



	end

        initial begin
          tb_r_clk = 1'b0;
          forever #5 tb_r_clk = ~tb_r_clk;
        end

        rt_bin_cnt u0_bin_cnt (
          .rt_i_clk     (tb_r_clk       ), 
          .rt_i_rst     (tb_r_rst       ), //sync rst
          .rt_i_set     (tb_r_set       ), 
          .rt_i_ce      (tb_r_ce       ), 
          .rt_i_inc_n   (tb_r_inc_n       ), //0:increase mode, 1:decrease mode 
          .rt_i_ld_val  (tb_r_ld_val       ), 
          .rt_o_bin_cnt (tb_w_bin_cnt       ), 
          .rt_o_eqnz    (tb_w_eqnz       )
          );


endmodule

