/**
 * RISC: Mux.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of 2x1 1-bit Multiplexer, 4x1 1-bit Multiplexer,
 * 2x1 2-bit Multiplexer, 2x1 4-bit Multiplexer, 2x1 8-bit Multiplexer,
 * 2x1 16-bit Multiplexer and 2x1 32-bit Multiplexer.
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
module Mux2 (
	output reg out,
	input 	   a, b, s);

	always @ ( * ) begin
		if ( s )
			out = b;
		else
			out = a;
	end
endmodule // Mux2

// 4x1 1-bit Multiplexer
module Mux4 (
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
endmodule // Mux4

// 2x1 2-bit Multiplexer
module Mux2b (
	output [1:0] out,
	input  [1:0] a, b,
	input    	 s);

	Mux2 mux0(out[0], a[0], b[0], s);
	Mux2 mux1(out[1], a[1], b[1], s);
endmodule // Mux2b

// 2x1 4-bit Multiplexer
module Mux4b (
	output [3:0] out,
	input  [3:0] a, b,
	input    	 s);

	Mux2b mux0(out[1:0], a[1:0], b[1:0], s);
	Mux2b mux1(out[3:2], a[3:2], b[3:2], s);
endmodule // Mux4b

// 2x1 8-bit Multiplexer
module Mux8b (
	output [7:0] out,
	input  [7:0] a, b,
	input    	 s);

	Mux4b mux0(out[3:0], a[3:0], b[3:0], s);
	Mux4b mux1(out[7:4], a[7:4], b[7:4], s);
endmodule // Mux8b

// 2x1 16-bit Multiplexer
module Mux16b (
	output [15:0] out,
	input  [15:0] a, b,
	input    	 s);

	Mux8b mux0(out[7:0], a[7:0], b[7:0], s);
	Mux8b mux1(out[15:8], a[15:8], b[15:8], s);
endmodule // Mux16b

// 2x1 32-bit Multiplexer
module Mux32b (
	output [31:0] out,
	input  [31:0] a, b,
	input    	 s);

	Mux16b mux0(out[15:0], a[15:0], b[15:0], s);
	Mux16b mux1(out[31:16], a[31:16], b[31:16], s);
endmodule // Mux32b

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
