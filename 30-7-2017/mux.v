// Module Mux: A 4X1 1-bit Multplexer
module Mux
    (output e,
    input a, b, c, d, s1, s2);

    assign e = (a & (~s1) & (~s2)) |
               (b & s1 & (~s2)) |
               (c & (~s1) & s2) |
               (d & s1 & s2);
endmodule

// Module Test: Generate Test Cases
module Test
    (output reg a, b, c, d, s1, s2,
    input e);

    initial { a, b, c, d } = { 1'b1, 1'b0, 1'b1, 1'b0 };
    initial begin
        $monitor($time,, "S2=%b S1=%b E=%b", s2, s1, e);
        { s1, s2 } = { 1'b0, 1'b0 };
        #2 s1 = 1'b1;
        #2 { s1, s2 } = { 1'b0, 1'b1 };
        #2 s1 = 1'b1;
        #1 $finish;
    end
endmodule

// Module WorkBench: Connect Modules
module wb();
    wire a, b, c, d, e, s1, s2;
    Mux mux(e, a, b, c, d, s1, s2);
    Test test(a, b, c, d, s1, s2, e);
endmodule
