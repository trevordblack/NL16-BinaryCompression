module hf_decompression_dynamic (
	input wire hf_in,
	output reg hf_out,

	input wire CLK,
	input wire EN,
	input wire Reset,
 );

// Length of overhead bits indicating length of huffman codes
parameter fixed_bit = 6; 
// This sets a restriction on the length of uncompressed info
// 2^6 = 64
// A length of compressed data will always be N bits
// where 1 < N <= 64

// For HW, solving for a dynamic compression length is HORRIBLEE
// So another day.

	always @ (posedge CLK or negedge Reset) begin
		if(~Reset) begin
			// Build the tree
			// Might need to have a unique code to say that the tree has begun

		end
		else if(~EN) begin
			// Pass data along as is, no decompression
			hf_out <= hf_in;
		end
		else begin
			// Decompress bitstream

		end
	end
endmodule