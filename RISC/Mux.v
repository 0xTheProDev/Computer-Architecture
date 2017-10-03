module Mux2b (output out, input a, b, s);
	assign out = ((~s) & a) | (s & b);
endmodule

module Mux4b (output reg out, input a, b, c, d, s1, s2);
	wire [1:0] s;
	assign s = { s2, s1 };
	always @(a, b, c, d, s1, s2) begin
		if ( { s2, s1 } == 2'b00 )
			out = a;
		else if ( { s2, s1 } == 2'b01 )
			out = b;
		else if ( { s2, s1 } == 2'b10 )
			out = c;
		else
			out = d;
	end
endmodule

module Mux8b (output reg out, input a, b, c, d, e, f, g, h, s1, s2, s3);
	wire [1:0] s;
	assign s = { s3, s2, s1 };
	always @(a, b, c, d, s1, s2) begin
		if ( { s3, s2, s1 } == 3'b000 )
			out = a;
		else if ( { s3, s2, s1 } == 3'b001 )
			out = b;
		else if ( { s3, s2, s1 } == 3'b010 )
			out = c;
		else if ( { s3, s2, s1 } == 3'b011 )
			out = d;
		else if ( { s3, s2, s1 } == 3'b100 )
			out = e;
		else if ( { s3, s2, s1 } == 3'b101 )
			out = f;
		else if ( { s3, s2, s1 } == 3'b110 )
			out = g;
		else
			out = h;
	end
endmodule
