// Module MyAnd: Calculates and
module MyAnd
    (output c,
    input a, b);

    and(c, a, b);
endmodule

// Module Test: Creates Testcases
module Test
    (output reg a, b,
    input c);

    initial begin
        $monitor($time,, "a=%b b=%b c=%b", a, b, c);
        { a, b } = { 1'b0, 1'b0 };
        #2 b = 1'b1;
        #2 { a, b } = { 1'b1, 1'b0 };
        #2 b = 1'b1;
        #1 $finish;
    end
endmodule

// Module WorkBench: Connect Modules
module wb();
    wire a, b, c;
    MyAnd myand(c, a, b);
    Test test(a, b, c);
endmodule
