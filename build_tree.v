module build_tree (
	input wire in,

	output [15:0] reg out,
	output  [3:0] reg out_addr,
	output        reg out_valid,
	output        reg done,

	input wire CLK,
	input wire Reset,
	input wire EN
 );
	
	// the len = 4
	// This means that there is no need for the initial 6 bits
	// These 6 bits would normally tell the length of the values
	// Our value length is always 4

	reg [15:0] code;
	reg  [3:0] leaf;
	reg  [4:0] leaf_valid_sh;
	reg  [4:0] done_acc;
	assign out_valid = leaf_valid[0];

	always @ (negedge Reset or posedge CLK) begin
		if (~Reset) begin
			out       <= 16'b0;
			out_addr  <= 4'b0;
			out_valid <= 1'b0;
			done      <= 1'b0;

			code          <= 16'b0;	
			leaf;         <= 4'b0;
			leaf_valid_sh <= 5'b0;
			done_acc      <= 5'b0;
		end
		else begin
			if (~leaf_valid[4]) begin
				// We have not found a leaf
				// We are traversing the tree
				if(~in) begin
					leaf_valid_sh <= 5'b0;
					out <= 16'b0;
					code <= {code[14:1], 1'b0};
				end
				else begin
					// We have discovered a new leaf
					// Now it is time to enter it in
					leaf_valid_sh <= 5'b10000;
					out <= code;
					casex (code)
						16'bxxxxxxxxxxxxxxx0 : code <= {00'b0, code[15:01], 1'b1};
						16'bxxxxxxxxxxxxxx01 : code <= {01'b0, code[15:02], 1'b1};
						16'bxxxxxxxxxxxxx011 : code <= {02'b0, code[15:03], 1'b1};
						16'bxxxxxxxxxxxx0111 : code <= {03'b0, code[15:04], 1'b1};
						16'bxxxxxxxxxxx01111 : code <= {04'b0, code[15:05], 1'b1};
						16'bxxxxxxxxxx011111 : code <= {05'b0, code[15:06], 1'b1};
						16'bxxxxxxxxx0111111 : code <= {06'b0, code[15:07], 1'b1};
						16'bxxxxxxxx01111111 : code <= {07'b0, code[15:08], 1'b1};
						16'bxxxxxxx011111111 : code <= {08'b0, code[15:09], 1'b1};
						16'bxxxxxx0111111111 : code <= {09'b0, code[15:10], 1'b1};
						16'bxxxxx01111111111 : code <= {10'b0, code[15:11], 1'b1};
						16'bxxxx011111111111 : code <= {11'b0, code[15:12], 1'b1};
						16'bxxx0111111111111 : code <= {12'b0, code[15:13], 1'b1};
						16'bxx01111111111111 : code <= {13'b0, code[15:14], 1'b1};
						16'bx011111111111111 : code <= {14'b0, code[15:15], 1'b1};
						16'b0111111111111111 : code <= 16'h1;

				end

			end
			else begin
				// We have found a leaf
				if(~leaf_valid[0]) begin
					// Still entering in the leaf
					leaf_valid <= {1'b1, leaf_valid[4:1]};
					out <= out;
				end
				else begin
					// Finished entering in the leaf
					// Go back to tree traversal
					done_acc <= done_acc + 1;

				end

			end
		end
	end 
	
endmodule