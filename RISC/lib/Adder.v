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
endmodule // HalfAdder

// Full Adder Module
module FullAdder (
    output sum, carry,
    input  augend, addend, cin);

    wire p, g, r;
    HalfAdder hadd1(p, g, augend, addend);
    HalfAdder hadd2(sum, r, p, cin);
    or(carry, g, r);
endmodule // FullAdder

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
endmodule // Adder2b

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
    Adder2b add2(s2, carry, aug2, adn2, c1);
endmodule // Adder4b

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
    Adder4b add2(s2, carry, aug2, adn2, c1);
endmodule // Adder8b

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
    Adder8b add2(s2, carry, aug2, adn2, c1);
endmodule // Adder16b

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
    Adder16b add2(s2, carry, aug2, adn2, c1);
endmodule // Adder32b

// Test Generator Module to Test 8-bit Carry Look Ahead Adder
module TestAdder (
    input      [3:0] s,
    input            c,
    output reg [3:0] a, b);

    wire [7:0] w;
	assign w = { a, b };
	initial begin
		$monitor($time,,, "Augend: %b Addend: %b Sum: %b Carry: %b", a, b, s, c);
			{ a, b } = 8'd0;
		#02 { a, b } = 8'd1;
        #02 { a, b } = 8'd2;
        #02 { a, b } = 8'd3;
        #02 { a, b } = 8'd4;
        #02 { a, b } = 8'd5;
        #02 { a, b } = 8'd6;
        #02 { a, b } = 8'd7;
        #02 { a, b } = 8'd8;
        #02 { a, b } = 8'd9;                // FIX: Sequence terminated after this
        #02 { a, b } = 8'd10;
        #02 { a, b } = 8'd11;
        #02 { a, b } = 8'd12;
        #02 { a, b } = 8'd13;
        #02 { a, b } = 8'd14;
        #02 { a, b } = 8'd15;
        #02 { a, b } = 8'd16;
        #02 { a, b } = 8'd17;
        #02 { a, b } = 8'd18;
        #02 { a, b } = 8'd19;
        #02 { a, b } = 8'd20;
        #02 { a, b } = 8'd21;
        #02 { a, b } = 8'd22;
        #02 { a, b } = 8'd23;
        #02 { a, b } = 8'd24;
        #02 { a, b } = 8'd25;
        #02 { a, b } = 8'd26;
        #02 { a, b } = 8'd27;
        #02 { a, b } = 8'd28;
        #02 { a, b } = 8'd29;
        #02 { a, b } = 8'd30;
        #02 { a, b } = 8'd31;
        #02 { a, b } = 8'd32;
        #02 { a, b } = 8'd33;
        #02 { a, b } = 8'd34;
        #02 { a, b } = 8'd35;
        #02 { a, b } = 8'd36;
        #02 { a, b } = 8'd37;
        #02 { a, b } = 8'd38;
        #02 { a, b } = 8'd39;
        #02 { a, b } = 8'd40;
        #02 { a, b } = 8'd41;
        #02 { a, b } = 8'd42;
        #02 { a, b } = 8'd43;
        #02 { a, b } = 8'd44;
        #02 { a, b } = 8'd45;
        #02 { a, b } = 8'd46;
        #02 { a, b } = 8'd47;
        #02 { a, b } = 8'd48;
        #02 { a, b } = 8'd49;
        #02 { a, b } = 8'd50;
        #02 { a, b } = 8'd51;
        #02 { a, b } = 8'd52;
        #02 { a, b } = 8'd53;
        #02 { a, b } = 8'd54;
        #02 { a, b } = 8'd55;
        #02 { a, b } = 8'd56;
        #02 { a, b } = 8'd57;
        #02 { a, b } = 8'd58;
        #02 { a, b } = 8'd59;
        #02 { a, b } = 8'd60;
        #02 { a, b } = 8'd61;
        #02 { a, b } = 8'd62;
        #02 { a, b } = 8'd63;
        #02 { a, b } = 8'd64;
        #02 { a, b } = 8'd65;
        #02 { a, b } = 8'd66;
        #02 { a, b } = 8'd67;
        #02 { a, b } = 8'd68;
        #02 { a, b } = 8'd69;
        #02 { a, b } = 8'd70;
        #02 { a, b } = 8'd71;
        #02 { a, b } = 8'd72;
        #02 { a, b } = 8'd73;
        #02 { a, b } = 8'd74;
        #02 { a, b } = 8'd75;
        #02 { a, b } = 8'd76;
        #02 { a, b } = 8'd77;
        #02 { a, b } = 8'd78;
        #02 { a, b } = 8'd79;
        #02 { a, b } = 8'd80;
        #02 { a, b } = 8'd81;
        #02 { a, b } = 8'd82;
        #02 { a, b } = 8'd83;
        #02 { a, b } = 8'd84;
        #02 { a, b } = 8'd85;
        #02 { a, b } = 8'd86;
        #02 { a, b } = 8'd87;
        #02 { a, b } = 8'd88;
        #02 { a, b } = 8'd89;
        #02 { a, b } = 8'd90;
        #02 { a, b } = 8'd91;
        #02 { a, b } = 8'd92;
        #02 { a, b } = 8'd93;
        #02 { a, b } = 8'd94;
        #02 { a, b } = 8'd95;
        #02 { a, b } = 8'd96;
        #02 { a, b } = 8'd97;
        #02 { a, b } = 8'd98;
        #02 { a, b } = 8'd99;
        #02 { a, b } = 8'd100;
        #02 { a, b } = 8'd101;
        #02 { a, b } = 8'd102;
        #02 { a, b } = 8'd103;
        #02 { a, b } = 8'd104;
        #02 { a, b } = 8'd105;
        #02 { a, b } = 8'd106;
        #02 { a, b } = 8'd107;
        #02 { a, b } = 8'd108;
        #02 { a, b } = 8'd109;
        #02 { a, b } = 8'd110;
        #02 { a, b } = 8'd111;
        #02 { a, b } = 8'd112;
        #02 { a, b } = 8'd113;
        #02 { a, b } = 8'd114;
        #02 { a, b } = 8'd115;
        #02 { a, b } = 8'd116;
        #02 { a, b } = 8'd117;
        #02 { a, b } = 8'd118;
        #02 { a, b } = 8'd119;
        #02 { a, b } = 8'd120;
        #02 { a, b } = 8'd121;
        #02 { a, b } = 8'd122;
        #02 { a, b } = 8'd123;
        #02 { a, b } = 8'd124;
        #02 { a, b } = 8'd125;
        #02 { a, b } = 8'd126;
        #02 { a, b } = 8'd127;
        #02 { a, b } = 8'd128;
        #02 { a, b } = 8'd129;
        #02 { a, b } = 8'd130;
        #02 { a, b } = 8'd131;
        #02 { a, b } = 8'd132;
        #02 { a, b } = 8'd133;
        #02 { a, b } = 8'd134;
        #02 { a, b } = 8'd135;
        #02 { a, b } = 8'd136;
        #02 { a, b } = 8'd137;
        #02 { a, b } = 8'd138;
        #02 { a, b } = 8'd139;
        #02 { a, b } = 8'd140;
        #02 { a, b } = 8'd141;
        #02 { a, b } = 8'd142;
        #02 { a, b } = 8'd143;
        #02 { a, b } = 8'd144;
        #02 { a, b } = 8'd145;
        #02 { a, b } = 8'd146;
        #02 { a, b } = 8'd147;
        #02 { a, b } = 8'd148;
        #02 { a, b } = 8'd149;
        #02 { a, b } = 8'd150;
        #02 { a, b } = 8'd151;
        #02 { a, b } = 8'd152;
        #02 { a, b } = 8'd153;
        #02 { a, b } = 8'd154;
        #02 { a, b } = 8'd155;
        #02 { a, b } = 8'd156;
        #02 { a, b } = 8'd157;
        #02 { a, b } = 8'd158;
        #02 { a, b } = 8'd159;
        #02 { a, b } = 8'd160;
        #02 { a, b } = 8'd161;
        #02 { a, b } = 8'd162;
        #02 { a, b } = 8'd163;
        #02 { a, b } = 8'd164;
        #02 { a, b } = 8'd165;
        #02 { a, b } = 8'd166;
        #02 { a, b } = 8'd167;
        #02 { a, b } = 8'd168;
        #02 { a, b } = 8'd169;
        #02 { a, b } = 8'd170;
        #02 { a, b } = 8'd171;
        #02 { a, b } = 8'd172;
        #02 { a, b } = 8'd173;
        #02 { a, b } = 8'd174;
        #02 { a, b } = 8'd175;
        #02 { a, b } = 8'd176;
        #02 { a, b } = 8'd177;
        #02 { a, b } = 8'd178;
        #02 { a, b } = 8'd179;
        #02 { a, b } = 8'd180;
        #02 { a, b } = 8'd181;
        #02 { a, b } = 8'd182;
        #02 { a, b } = 8'd183;
        #02 { a, b } = 8'd184;
        #02 { a, b } = 8'd185;
        #02 { a, b } = 8'd186;
        #02 { a, b } = 8'd187;
        #02 { a, b } = 8'd188;
        #02 { a, b } = 8'd189;
        #02 { a, b } = 8'd190;
        #02 { a, b } = 8'd191;
        #02 { a, b } = 8'd192;
        #02 { a, b } = 8'd193;
        #02 { a, b } = 8'd194;
        #02 { a, b } = 8'd195;
        #02 { a, b } = 8'd196;
        #02 { a, b } = 8'd197;
        #02 { a, b } = 8'd198;
        #02 { a, b } = 8'd199;
        #02 { a, b } = 8'd200;
        #02 { a, b } = 8'd201;
        #02 { a, b } = 8'd202;
        #02 { a, b } = 8'd203;
        #02 { a, b } = 8'd204;
        #02 { a, b } = 8'd205;
        #02 { a, b } = 8'd206;
        #02 { a, b } = 8'd207;
        #02 { a, b } = 8'd208;
        #02 { a, b } = 8'd209;
        #02 { a, b } = 8'd210;
        #02 { a, b } = 8'd211;
        #02 { a, b } = 8'd212;
        #02 { a, b } = 8'd213;
        #02 { a, b } = 8'd214;
        #02 { a, b } = 8'd215;
        #02 { a, b } = 8'd216;
        #02 { a, b } = 8'd217;
        #02 { a, b } = 8'd218;
        #02 { a, b } = 8'd219;
        #02 { a, b } = 8'd220;
        #02 { a, b } = 8'd221;
        #02 { a, b } = 8'd222;
        #02 { a, b } = 8'd223;
        #02 { a, b } = 8'd224;
        #02 { a, b } = 8'd225;
        #02 { a, b } = 8'd226;
        #02 { a, b } = 8'd227;
        #02 { a, b } = 8'd228;
        #02 { a, b } = 8'd229;
        #02 { a, b } = 8'd230;
        #02 { a, b } = 8'd231;
        #02 { a, b } = 8'd232;
        #02 { a, b } = 8'd233;
        #02 { a, b } = 8'd234;
        #02 { a, b } = 8'd235;
        #02 { a, b } = 8'd236;
        #02 { a, b } = 8'd237;
        #02 { a, b } = 8'd238;
        #02 { a, b } = 8'd239;
        #02 { a, b } = 8'd240;
        #02 { a, b } = 8'd241;
        #02 { a, b } = 8'd242;
        #02 { a, b } = 8'd243;
        #02 { a, b } = 8'd244;
        #02 { a, b } = 8'd245;
        #02 { a, b } = 8'd246;
        #02 { a, b } = 8'd247;
        #02 { a, b } = 8'd248;
        #02 { a, b } = 8'd249;
        #02 { a, b } = 8'd250;
        #02 { a, b } = 8'd251;
        #02 { a, b } = 8'd252;
        #02 { a, b } = 8'd253;
        #02 { a, b } = 8'd254;
        #02 { a, b } = 8'd255;
		#02 $finish;
	end
endmodule // TestAdder
