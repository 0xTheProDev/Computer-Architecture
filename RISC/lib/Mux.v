/**
 * RISC: Mux.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of 2x1 1-bit Multiplexer, 4x1 1-bit Multiplexer,
 * and 8x1 1-bit Multiplexer.
 * A Test Generator module has been added for unit testing as well.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

// 2x1 1-bit Multiplexer
module Mux2b (
	output out,
	input  a, b, s);

	assign out = ((~s) & a) | (s & b);
endmodule // Mux2b

// 4x1 1-bit Multiplexer
module Mux4b (
	output reg out,
	input      a, b, c, d, s1, s2);

	wire [1:0] s;
	assign s = { s2, s1 };
	always @ ( * ) begin
		if ( { s2, s1 } == 2'b00 )
			out = a;
		else if ( { s2, s1 } == 2'b01 )
			out = b;
		else if ( { s2, s1 } == 2'b10 )
			out = c;
		else
			out = d;
	end
endmodule // Mux4b

// 8x1 1-bit Multiplexer
module Mux8b (
	output reg out,
	input 	   a, b, c, d, e, f, g, h, s1, s2, s3);

	wire [1:0] s;
	assign s = { s3, s2, s1 };
	always @ ( * ) begin
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
endmodule // Mux8b

// Test Generator Module to Test 2x1 1-bit Multiplexer
module TestMux (
	input 	   c,
	output reg a, b, s);

	wire [2:0] w;
	assign w = { a, b, s};
	initial begin
		$monitor($time,,, "A=%b B=%b S=%b C=%b", a, b, s, c);
		    { a, b, s } = 3'b000;
		#02 { a, b, s } = 3'b001;
		#02 { a, b, s } = 3'b001;
		#02 { a, b, s } = 3'b010;
		#02 { a, b, s } = 3'b011;
		#02 { a, b, s } = 3'b100;
		#02 { a, b, s } = 3'b101;
		#02 { a, b, s } = 3'b110;
		#02 { a, b, s } = 3'b111;
		#02 $finish;
	end
endmodule // TestMux
