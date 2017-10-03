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

module Adder2b (output [1:0] sum, output carry, input [1:0] augend, addend, input cin);
    wire s1, s2, c1;
    assign sum = { s2, s1 };
    FullAdder add1(s1, c1, augend[0], addend[0], cin);
    FullAdder add2(s2, carry, augend[1], addend[1], c1);
endmodule

module Adder4b (output [3:0] sum, output carry, input [3:0] augend, addend, input cin);
    wire c1;
    wire [1:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder2b add1(s1, c1, aug1, adn1, cin);
    Adder2b add2(s2, carry, aug2, adn1, c1);
endmodule

module Adder8b (output [7:0] sum, output carry, input [7:0] augend, addend, input cin);
    wire c1;
    wire [3:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder4b add1(s1, c1, aug1, adn1, cin);
    Adder4b add2(s2, carry, aug2, adn1, c1);
endmodule

module Adder16b (output [15:0] sum, output carry, input [15:0] augend, addend, input cin);
    wire c1;
    wire [7:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder8b add1(s1, c1, aug1, adn1, cin);
    Adder8b add2(s2, carry, aug2, adn1, c1);
endmodule

module Adder32b (output [31:0] sum, output carry, input [31:0] augend, addend, input cin);
    wire c1;
    wire [15:0] s1, s2, aug1, aug2, adn1, adn2;
    assign sum = { s2, s1 }, { aug2, aug1 } = augend, { adn2, adn1 } = addend;
    Adder16b add1(s1, c1, aug1, adn1, cin);
    Adder16b add2(s2, carry, aug2, adn1, c1);
endmodule
