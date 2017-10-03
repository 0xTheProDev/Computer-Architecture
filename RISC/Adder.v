/**
 * RISC: Adder.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of HalfAdder, FullAdder, 2-bit CLA Adder,
 * 4-bit CLA Adder, 16-bit CLA Adder and 32-bit CLA Adder.
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

// Half Adder Module
module HalfAdder (
    output sum, carry,
    input  augend, addend);

    xor(sum, augend, addend);
    and(carry, augend, addend);
endmodule

// Full Adder Module
module FullAdder (
    output sum, carry,
    input  augend, addend, cin);

    wire p, g, r;
    HalfAdder hadd1(p, g, augend, addend);
    HalfAdder hadd2(sum, r, p, cin);
    or(carry, g, r);
endmodule

// 2-bit Carry Look Ahead Adder
module Adder2b (
    output [1:0] sum,
    output       carry,
    input  [1:0] augend, addend,
    input        cin);

    wire s1, s2, c1;
    assign sum = { s2, s1 };
    FullAdder add1(s1, c1, augend[0], addend[0], cin);
    FullAdder add2(s2, carry, augend[1], addend[1], c1);
endmodule

// 4-bit Carry Look Ahead Adder
module Adder4b (
    output [3:0] sum,
    output       carry,
    input  [3:0] augend, addend,
    input        cin);

    wire c1;
    wire [1:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder2b add1(s1, c1, aug1, adn1, cin);
    Adder2b add2(s2, carry, aug2, adn1, c1);
endmodule

// 8-bit Carry Look Ahead Adder
module Adder8b (
    output [7:0] sum,
    output       carry,
    input  [7:0] augend, addend,
    input        cin);

    wire c1;
    wire [3:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder4b add1(s1, c1, aug1, adn1, cin);
    Adder4b add2(s2, carry, aug2, adn1, c1);
endmodule

// 16-bit Carry Look Ahead Adder
module Adder16b (
    output [15:0] sum,
    output        carry,
    input  [15:0] augend, addend,
    input         cin);

    wire c1;
    wire [7:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder8b add1(s1, c1, aug1, adn1, cin);
    Adder8b add2(s2, carry, aug2, adn1, c1);
endmodule

// 32-bit Carry Look Ahead Adder
module Adder32b (
    output [31:0] sum,
    output        carry,
    input  [31:0] augend, addend,
    input         cin);

    wire c1;
    wire [15:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder16b add1(s1, c1, aug1, adn1, cin);
    Adder16b add2(s2, carry, aug2, adn1, c1);
endmodule

// Test Generator Module to Test 8-bit Carry Look Ahead Adder
module TestAdder (
    input      [3:0] s,
    input            c,
    output reg [3:0] a, b);

    wire [7:0] w;
	assign w = { a, b };
	initial begin
		$monitor($time,,, "Augend: %b Addend: %b Sum: %b Carry: %b", a, b, s, c);
			{ a, b } = 8'b00000000;
		#02 { a, b } = 8'b00000001;
		#02 { a, b } = 8'b00000010;
		#02 { a, b } = 8'b00000011;
		#02 { a, b } = 8'b00000100;
		#02 { a, b } = 8'b00000101;
		#02 { a, b } = 8'b00000110;
		#02 { a, b } = 8'b00000111;
		#02 { a, b } = 8'b00001000;
		#02 { a, b } = 8'b00001001;
		#02 { a, b } = 8'b00001010;
		#02 { a, b } = 8'b00001011;
		#02 { a, b } = 8'b00001100;
		#02 { a, b } = 8'b00001101;
		#02 { a, b } = 8'b00001110;
		#02 { a, b } = 8'b00001111;
		#02 { a, b } = 8'b00010000;
		#02 { a, b } = 8'b00010001;
		#02 { a, b } = 8'b00010010;
		#02 { a, b } = 8'b00010011;
		#02 { a, b } = 8'b00010100;
		#02 { a, b } = 8'b00010101;
		#02 { a, b } = 8'b00010110;
		#02 { a, b } = 8'b00010111;
		#02 { a, b } = 8'b00011000;
		#02 { a, b } = 8'b00011001;
		#02 { a, b } = 8'b00011010;
		#02 { a, b } = 8'b00011011;
		#02 { a, b } = 8'b00011100;
		#02 { a, b } = 8'b00011101;
		#02 { a, b } = 8'b00011110;
		#02 { a, b } = 8'b00011111;
		#02 { a, b } = 8'b00100000;
		#02 { a, b } = 8'b00100001;
		#02 { a, b } = 8'b00100010;
		#02 { a, b } = 8'b00100011;
		#02 { a, b } = 8'b00100100;
		#02 { a, b } = 8'b00100101;
		#02 { a, b } = 8'b00100110;
		#02 { a, b } = 8'b00100111;
		#02 { a, b } = 8'b00101000;
		#02 { a, b } = 8'b00101001;
		#02 { a, b } = 8'b00101010;
		#02 { a, b } = 8'b00101011;
		#02 { a, b } = 8'b00101100;
		#02 { a, b } = 8'b00101101;
		#02 { a, b } = 8'b00101110;
		#02 { a, b } = 8'b00101111;
		#02 { a, b } = 8'b00110000;
		#02 { a, b } = 8'b00110001;
		#02 { a, b } = 8'b00110010;
		#02 { a, b } = 8'b00110011;
		#02 { a, b } = 8'b00110100;
		#02 { a, b } = 8'b00110101;
		#02 { a, b } = 8'b00110110;
		#02 { a, b } = 8'b00110111;
		#02 { a, b } = 8'b00111000;
		#02 { a, b } = 8'b00111001;
		#02 { a, b } = 8'b00111010;
		#02 { a, b } = 8'b00111011;
		#02 { a, b } = 8'b00111100;
		#02 { a, b } = 8'b00111101;
		#02 { a, b } = 8'b00111110;
		#02 { a, b } = 8'b00111111;
		#02 { a, b } = 8'b01000000;
		#02 { a, b } = 8'b01000001;
		#02 { a, b } = 8'b01000010;
		#02 { a, b } = 8'b01000011;
		#02 { a, b } = 8'b01000100;
		#02 { a, b } = 8'b01000101;
		#02 { a, b } = 8'b01000110;
		#02 { a, b } = 8'b01000111;
		#02 { a, b } = 8'b01001000;
		#02 { a, b } = 8'b01001001;
		#02 { a, b } = 8'b01001010;
		#02 { a, b } = 8'b01001011;
		#02 { a, b } = 8'b01001100;
		#02 { a, b } = 8'b01001101;
		#02 { a, b } = 8'b01001110;
		#02 { a, b } = 8'b01001111;
		#02 { a, b } = 8'b01010000;
		#02 { a, b } = 8'b01010001;
		#02 { a, b } = 8'b01010010;
		#02 { a, b } = 8'b01010011;
		#02 { a, b } = 8'b01010100;
		#02 { a, b } = 8'b01010101;
		#02 { a, b } = 8'b01010110;
		#02 { a, b } = 8'b01010111;
		#02 { a, b } = 8'b01011000;
		#02 { a, b } = 8'b01011001;
		#02 { a, b } = 8'b01011010;
		#02 { a, b } = 8'b01011011;
		#02 { a, b } = 8'b01011100;
		#02 { a, b } = 8'b01011101;
		#02 { a, b } = 8'b01011110;
		#02 { a, b } = 8'b01011111;
		#02 { a, b } = 8'b01100000;
		#02 { a, b } = 8'b01100001;
		#02 { a, b } = 8'b01100010;
		#02 { a, b } = 8'b01100011;
		#02 { a, b } = 8'b01100100;
		#02 { a, b } = 8'b01100101;
		#02 { a, b } = 8'b01100110;
		#02 { a, b } = 8'b01100111;
		#02 { a, b } = 8'b01101000;
		#02 { a, b } = 8'b01101001;
		#02 { a, b } = 8'b01101010;
		#02 { a, b } = 8'b01101011;
		#02 { a, b } = 8'b01101100;
		#02 { a, b } = 8'b01101101;
		#02 { a, b } = 8'b01101110;
		#02 { a, b } = 8'b01101111;
		#02 { a, b } = 8'b01110000;
		#02 { a, b } = 8'b01110001;
		#02 { a, b } = 8'b01110010;
		#02 { a, b } = 8'b01110011;
		#02 { a, b } = 8'b01110100;
		#02 { a, b } = 8'b01110101;
		#02 { a, b } = 8'b01110110;
		#02 { a, b } = 8'b01110111;
		#02 { a, b } = 8'b01111000;
		#02 { a, b } = 8'b01111001;
		#02 { a, b } = 8'b01111010;
		#02 { a, b } = 8'b01111011;
		#02 { a, b } = 8'b01111100;
		#02 { a, b } = 8'b01111101;
		#02 { a, b } = 8'b01111110;
		#02 { a, b } = 8'b01111111;
		#02 { a, b } = 8'b10000000;
		#02 { a, b } = 8'b10000001;
		#02 { a, b } = 8'b10000010;
		#02 { a, b } = 8'b10000011;
		#02 { a, b } = 8'b10000100;
		#02 { a, b } = 8'b10000101;
		#02 { a, b } = 8'b10000110;
		#02 { a, b } = 8'b10000111;
		#02 { a, b } = 8'b10001000;
		#02 { a, b } = 8'b10001001;
		#02 { a, b } = 8'b10001010;
		#02 { a, b } = 8'b10001011;
		#02 { a, b } = 8'b10001100;
		#02 { a, b } = 8'b10001101;
		#02 { a, b } = 8'b10001110;
		#02 { a, b } = 8'b10001111;
		#02 { a, b } = 8'b10010000;
		#02 { a, b } = 8'b10010001;
		#02 { a, b } = 8'b10010010;
		#02 { a, b } = 8'b10010011;
		#02 { a, b } = 8'b10010100;
		#02 { a, b } = 8'b10010101;
		#02 { a, b } = 8'b10010110;
		#02 { a, b } = 8'b10010111;
		#02 { a, b } = 8'b10011000;
		#02 { a, b } = 8'b10011001;
		#02 { a, b } = 8'b10011010;
		#02 { a, b } = 8'b10011011;
		#02 { a, b } = 8'b10011100;
		#02 { a, b } = 8'b10011101;
		#02 { a, b } = 8'b10011110;
		#02 { a, b } = 8'b10011111;
		#02 { a, b } = 8'b10100000;
		#02 { a, b } = 8'b10100001;
		#02 { a, b } = 8'b10100010;
		#02 { a, b } = 8'b10100011;
		#02 { a, b } = 8'b10100100;
		#02 { a, b } = 8'b10100101;
		#02 { a, b } = 8'b10100110;
		#02 { a, b } = 8'b10100111;
		#02 { a, b } = 8'b10101000;
		#02 { a, b } = 8'b10101001;
		#02 { a, b } = 8'b10101010;
		#02 { a, b } = 8'b10101011;
		#02 { a, b } = 8'b10101100;
		#02 { a, b } = 8'b10101101;
		#02 { a, b } = 8'b10101110;
		#02 { a, b } = 8'b10101111;
		#02 { a, b } = 8'b10110000;
		#02 { a, b } = 8'b10110001;
		#02 { a, b } = 8'b10110010;
		#02 { a, b } = 8'b10110011;
		#02 { a, b } = 8'b10110100;
		#02 { a, b } = 8'b10110101;
		#02 { a, b } = 8'b10110110;
		#02 { a, b } = 8'b10110111;
		#02 { a, b } = 8'b10111000;
		#02 { a, b } = 8'b10111001;
		#02 { a, b } = 8'b10111010;
		#02 { a, b } = 8'b10111011;
		#02 { a, b } = 8'b10111100;
		#02 { a, b } = 8'b10111101;
		#02 { a, b } = 8'b10111110;
		#02 { a, b } = 8'b10111111;
		#02 { a, b } = 8'b11000000;
		#02 { a, b } = 8'b11000001;
		#02 { a, b } = 8'b11000010;
		#02 { a, b } = 8'b11000011;
		#02 { a, b } = 8'b11000100;
		#02 { a, b } = 8'b11000101;
		#02 { a, b } = 8'b11000110;
		#02 { a, b } = 8'b11000111;
		#02 { a, b } = 8'b11001000;
		#02 { a, b } = 8'b11001001;
		#02 { a, b } = 8'b11001010;
		#02 { a, b } = 8'b11001011;
		#02 { a, b } = 8'b11001100;
		#02 { a, b } = 8'b11001101;
		#02 { a, b } = 8'b11001110;
		#02 { a, b } = 8'b11001111;
		#02 { a, b } = 8'b11010000;
		#02 { a, b } = 8'b11010001;
		#02 { a, b } = 8'b11010010;
		#02 { a, b } = 8'b11010011;
		#02 { a, b } = 8'b11010100;
		#02 { a, b } = 8'b11010101;
		#02 { a, b } = 8'b11010110;
		#02 { a, b } = 8'b11010111;
		#02 { a, b } = 8'b11011000;
		#02 { a, b } = 8'b11011001;
		#02 { a, b } = 8'b11011010;
		#02 { a, b } = 8'b11011011;
		#02 { a, b } = 8'b11011100;
		#02 { a, b } = 8'b11011101;
		#02 { a, b } = 8'b11011110;
		#02 { a, b } = 8'b11011111;
		#02 { a, b } = 8'b11100000;
		#02 { a, b } = 8'b11100001;
		#02 { a, b } = 8'b11100010;
		#02 { a, b } = 8'b11100011;
		#02 { a, b } = 8'b11100100;
		#02 { a, b } = 8'b11100101;
		#02 { a, b } = 8'b11100110;
		#02 { a, b } = 8'b11100111;
		#02 { a, b } = 8'b11101000;
		#02 { a, b } = 8'b11101001;
		#02 { a, b } = 8'b11101010;
		#02 { a, b } = 8'b11101011;
		#02 { a, b } = 8'b11101100;
		#02 { a, b } = 8'b11101101;
		#02 { a, b } = 8'b11101110;
		#02 { a, b } = 8'b11101111;
		#02 { a, b } = 8'b11110000;
		#02 { a, b } = 8'b11110001;
		#02 { a, b } = 8'b11110010;
		#02 { a, b } = 8'b11110011;
		#02 { a, b } = 8'b11110100;
		#02 { a, b } = 8'b11110101;
		#02 { a, b } = 8'b11110110;
		#02 { a, b } = 8'b11110111;
		#02 { a, b } = 8'b11111000;
		#02 { a, b } = 8'b11111001;
		#02 { a, b } = 8'b11111010;
		#02 { a, b } = 8'b11111011;
		#02 { a, b } = 8'b11111100;
		#02 { a, b } = 8'b11111101;
		#02 { a, b } = 8'b11111110;
		#02 { a, b } = 8'b11111111;
		#02 $finish;
	end
endmodule
