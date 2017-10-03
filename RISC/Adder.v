module HalfAdder (output sum, carry, input augend, addend);
    xor(sum, augend, addend);
    and(carry, augend, addend);
endmodule

module FullAdder (output sum, carry, input augend, addend, cin);
    wire p, g, r;
    HalfAdder hadd1(p, g, augend, addend);
    HalfAdder hadd2(sum, r, p, cin);
    or(carry, g, r);
endmodule

module Adder2b (output [1:0] sum, output carry, input [1:0] augend, addend);
    wire s1, s2, c1;
    assign sum = { s2, s1 };
    FullAdder fad1(s1, c1, augend[0], addend[0], 1'b0);
    FullAdder fad2(s2, carry, augend[1], addend[1], c1);
endmodule

module Adder4b (output [3:0] sum, output carry, input [3:0] augend, addend);
    wire s1, s2, s3, s4, c1, c2, c3;
    assign sum = { s4, s3, s2, s1 };
    FullAdder fad1(s1, c1, augend[0], addend[0], 1'b0);
    FullAdder fad2(s2, c2, augend[1], addend[1], c1);
    FullAdder fad3(s3, c3, augend[2], addend[2], c2);
    FullAdder fad4(s4, carry, augend[3], addend[3], c3);
endmodule
