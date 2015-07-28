/* Copyright 2015 TREVOR DAVID BLACK
 * hf_decompression.v
 *
 *
*/


module hf_decompression (
	input wire       hf_in,
	output reg [3:0] hf_out,
	output reg       hf_out_valid,

	input wire CLK,
	input wire Reset
 );

// HW, solving for a dynamic compression length is HORRIBLE
// So another day.

// parameter len = 4;
// The length of an uncompressed data amount

/* For building the Tree:
 * the uncompressed length is 4
 * that leaves 0 -> F
 * Which is a total of 16 possibilities
 * which means that the tree descriptor will need:
 * The capacity to describe 16 possibilites
 * which will need to say: this is 0, this is 1, this ....
 * so any tree leaf will need 4 bits to describe the leaf's value
*/


// Because we have 16 symbols
// The worst case hf code length is 16 bits
// This can be reduced at the cost of compression
// Something like 6 - 8 might be an apropriate compromise

	reg building_tree;
	reg [15:0] code;

	always @ (posedge CLK or negedge Reset) begin
		if(~Reset) begin
			// Build the tree
			// Might need to have a unique code to say that the tree has begun
			building_tree <= 1'b1;
			hf_out        <= 4'b0;
			hf_out_valid  <= 1'b0;
			code          <= 16'b0;
		end
		else if(~building_tree) begin
			// Decompress bitstream
			if (leaf_A_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_A_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_B_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_B_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_C_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_C_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_D_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_D_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_E_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_E_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_F_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_F_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_G_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_G_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_H_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_H_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_I_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_I_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_J_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_J_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_K_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_K_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_L_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_L_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_M_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_M_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_N_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_N_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_O_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_O_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else if (leaf_P_code == {code[14:0], hf_in}) begin
				hf_out       <= leaf_P_value[3:0];
				hf_out_valid <= 1'b1;
				code         <= 16'b0;
			end else begin
				hf_out       <= 4'b0;
				hf_out_valid <= 1'b0;
				code         <= {code[14:0], hf_in};
			end
		end
	end

	reg [15:0] leaf_A_code;
	reg [15:0] leaf_B_code;
	reg [15:0] leaf_C_code;
	reg [15:0] leaf_D_code;
	reg [15:0] leaf_E_code;
	reg [15:0] leaf_F_code;
	reg [15:0] leaf_G_code;
	reg [15:0] leaf_H_code;
	reg [15:0] leaf_I_code;
	reg [15:0] leaf_J_code;
	reg [15:0] leaf_K_code;
	reg [15:0] leaf_L_code;
	reg [15:0] leaf_M_code;
	reg [15:0] leaf_N_code;
	reg [15:0] leaf_O_code;
	reg [15:0] leaf_P_code;

	reg [3:0] leaf_A_value;
	reg [3:0] leaf_B_value;
	reg [3:0] leaf_C_value;
	reg [3:0] leaf_D_value;
	reg [3:0] leaf_E_value;
	reg [3:0] leaf_F_value;
	reg [3:0] leaf_G_value;
	reg [3:0] leaf_H_value;
	reg [3:0] leaf_I_value;
	reg [3:0] leaf_J_value;
	reg [3:0] leaf_K_value;
	reg [3:0] leaf_L_value;
	reg [3:0] leaf_M_value;
	reg [3:0] leaf_N_value;
	reg [3:0] leaf_O_value;
	reg [3:0] leaf_P_value;


	always @ (posedge CLK or negedge Reset) begin
		if(~Reset) begin
			leaf_A_code <= 16'b0;
			leaf_B_code <= 16'b0;
			leaf_C_code <= 16'b0;
			leaf_D_code <= 16'b0;
			leaf_E_code <= 16'b0;
			leaf_F_code <= 16'b0;
			leaf_G_code <= 16'b0;
			leaf_H_code <= 16'b0;
			leaf_I_code <= 16'b0;
			leaf_J_code <= 16'b0;
			leaf_K_code <= 16'b0;
			leaf_L_code <= 16'b0;
			leaf_M_code <= 16'b0;
			leaf_N_code <= 16'b0;
			leaf_O_code <= 16'b0;
			leaf_P_code <= 16'b0;

			leaf_A_value <= 4'b0;
			leaf_B_value <= 4'b0;
			leaf_C_value <= 4'b0;
			leaf_D_value <= 4'b0;
			leaf_E_value <= 4'b0;
			leaf_F_value <= 4'b0;
			leaf_G_value <= 4'b0;
			leaf_H_value <= 4'b0;
			leaf_I_value <= 4'b0;
			leaf_J_value <= 4'b0;
			leaf_K_value <= 4'b0;
			leaf_L_value <= 4'b0;
			leaf_M_value <= 4'b0;
			leaf_N_value <= 4'b0;
			leaf_O_value <= 4'b0;
			leaf_P_value <= 4'b0;
		end
		else begin
			if (~building_tree) begin
			
			end
			else begin
				leaf_A_code <= leaf_A_code;
				leaf_B_code <= leaf_B_code;
				leaf_C_code <= leaf_C_code;
				leaf_D_code <= leaf_D_code;
				leaf_E_code <= leaf_E_code;
				leaf_F_code <= leaf_F_code;
				leaf_G_code <= leaf_G_code;
				leaf_H_code <= leaf_H_code;
				leaf_I_code <= leaf_I_code;
				leaf_J_code <= leaf_J_code;
				leaf_K_code <= leaf_K_code;
				leaf_L_code <= leaf_L_code;
				leaf_M_code <= leaf_M_code;
				leaf_N_code <= leaf_N_code;
				leaf_O_code <= leaf_O_code;
				leaf_P_code <= leaf_P_code;

				leaf_A_value <= leaf_A_value;
				leaf_B_value <= leaf_B_value;
				leaf_C_value <= leaf_C_value;
				leaf_D_value <= leaf_D_value;
				leaf_E_value <= leaf_E_value;
				leaf_F_value <= leaf_F_value;
				leaf_G_value <= leaf_G_value;
				leaf_H_value <= leaf_H_value;
				leaf_I_value <= leaf_I_value;
				leaf_J_value <= leaf_J_value;
				leaf_K_value <= leaf_K_value;
				leaf_L_value <= leaf_L_value;
				leaf_M_value <= leaf_M_value;
				leaf_N_value <= leaf_N_value;
				leaf_O_value <= leaf_O_value;
				leaf_P_value <= leaf_P_value;
			end
		end
	end


endmodule
