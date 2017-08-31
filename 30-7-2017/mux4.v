// Module Mux4: A 4X1 4-bit Multplexer
module Mux4
    (output [3:0] e,
    input [3:0] a, b, c, d,
    input s1, s2);

    assign e[0] = (a[0] & (~s1) & (~s2)) |
                  (b[0] & s1 & (~s2)) |
                  (c[0] & (~s1) & s2) |
                  (d[0] & s1 & s2);
    assign e[1] = (a[1] & (~s1) & (~s2)) |
                  (b[1] & s1 & (~s2)) |
                  (c[1] & (~s1) & s2) |
                  (d[1] & s1 & s2);
    assign e[2] = (a[2] & (~s1) & (~s2)) |
                  (b[2] & s1 & (~s2)) |
                  (c[2] & (~s1) & s2) |
                  (d[2] & s1 & s2);
    assign e[3] = (a[3] & (~s1) & (~s2)) |
                  (b[3] & s1 & (~s2)) |
                  (c[3] & (~s1) & s2) |
                  (d[3] & s1 & s2);
endmodule

// Module Test: Generate Test Cases
module Test
    (output reg [3:0] a, b, c, d,
    output reg s1, s2,
    input [3:0] e);

    initial { a, b, c, d } = { 4'b0000, 4'b0101, 4'b1010, 4'b1111 };
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
    wire [3:0] a, b, c, d, e;
    wire s1, s2;
    Mux4 mux(e, a, b, c, d, s1, s2);
    Test test(a, b, c, d, s1, s2, e);
endmodule
