// Half Adder Module
module HalfAdder (
    output sum, carry,
    input  augend, addend, sub);

    wire w1;
    xor(w1, augend, sub);
    xor(sum, w1, addend);
    and(carry, w1, addend);
endmodule // HalfAdder

// Full Adder Module
module FullAdder (
    output sum, carry,
    input  augend, addend, cin, sub);

    wire p, g, r;
    HalfAdder hadd1(p, g, augend, addend, sub);
    HalfAdder hadd2(sum, r, p, cin, sub);
    or(carry, g, r);
endmodule // FullAdder

// 4-bit Adder Module
module Adder (
    output reg [3:0] c,
    output reg       carry,
    input      [3:0] a, b,
    input            sub);

    wire w1, w2, w3;
    FullAdder fadd1(c[0], w1, a[0], b[0], 1'b0, sub);
    FullAdder fadd2(c[1], w2, a[1], b[1], w1, sub);
    FullAdder fadd3(c[2], w3, a[2], b[2], w2, sub);
    FullAdder fadd4(c[3], carry, a[3], b[3], w3, sub);
endmodule // Adder

// 1-bit 8x1 Multiplexer Module
module Mux0 (
    output       out,
    input        d1, d2, d3, d4, d5, d6, d7, d8,
    input  [2:0] s);

    assign out = (
            (~s[0] & ~s[1] & ~s[2] & d1) | (s[0] & ~s[1] & ~s[2] & d2) | (~s[0] & s[1] & ~s[2] & d3) | (s[0] & s[1] & ~s[2] & d4) |
            (~s[0] & ~s[1] & s[2] & d5) | (s[0] & ~s[1] & s[2] & d6) | (~s[0] & s[1] & s[2] & d7) | (s[0] & s[1] & s[2] & d8));
endmodule // Mux0

// 4-bit 8x1 Multiplexer Module
module Mux (
    output [3:0] out,
    input  [3:0] d1, d2, d3, d4, d5, d6, d7, d8,
    input  [2:0] s);

    Mux0 mux0(out[0], d1[0], d2[0], d3[0], d4[0], d5[0], d6[0], d7[0], d8[0], s);
    Mux0 mux1(out[1], d1[1], d2[1], d3[1], d4[1], d5[1], d6[1], d7[1], d8[1], s);
    Mux0 mux2(out[2], d1[2], d2[2], d3[2], d4[2], d5[2], d6[2], d7[2], d8[2], s);
    Mux0 mux3(out[3], d1[3], d2[3], d3[3], d4[3], d5[3], d6[3], d7[3], d8[3], s);
endmodule // Mux

module ALU (
    output reg [3:0] c,
    output reg       carry,
    input      [2:0] op,
    input      [3:0] a, b);

    wire [3:0] w1, w2, w3, w4, w5, w6, w7, w8;
    wire wc1, wc2;
    Adder add(w1, wc1, a, b, 1'b0);
    Adder sub(w2, wc2, a, b, 1'b1);
    and(w3, a, b);
    or(w4, a, b);
    not(w5, a);
    xor(w6, a, b);
    nand(w7, a, b);
    nor(w8, a, b);
    Mux mux(c, w1, w2, w3, w4, w5, w6, w7, w8, op);
endmodule
