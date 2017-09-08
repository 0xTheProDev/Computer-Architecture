// Module Decoder: 3-bit to 8-bit
module Decoder
    (output b7, b6, b5, b4, b3, b2, b1, b0,
     input a2, a1, a0);

    assign b0 = (~a2) & (~a1) & (~a0);
    assign b1 = (~a2) & (~a1) & a0;
    assign b2 = (~a2) & (a1) & (~a0);
    assign b3 = (~a2) & a1 & a0;
    assign b4 = a2 & (~a1) & (~a0);
    assign b5 = a2 & (~a1) & a0;
    assign b6 = a2 & a1 & (~a0);
    assign b7 = a2 & a1 & a0;

endmodule

// Module Testcases
module Test
    (output reg a2, a1,a0,
     input b7, b6, b5, b4, b3, b2, b1, b0);


    wire [7:0] ip;
    assign ip = { b7, b6, b5, b4, b3, b2, b1, b0 };
    initial begin
        $monitor($time,, "A2=%b A1=%b A0=%b OUTPUT=%b", a2, a1, a0, ip);
        { a2, a1, a0 } = { 1'b0, 1'b0, 1'b0 };
        #2 { a0 } = { 1'b1 };
        #2 { a1, a0 } = { 1'b1, 1'b0 };
        #2 { a0 } = { 1'b1 };
        #2 { a2, a1, a0 } = { 1'b1, 1'b0, 1'b0 };
        #2 { a0 } = { 1'b1 };
        #2 { a1, a0 } = { 1'b1, 1'b0 };
        #2 { a0 } = { 1'b1 };
        #2 $finish;
    end

endmodule

// Module WorkBench
module wb();

    wire a0, a1, a2, b0, b1, b2, b3, b4, b5, b6, b7;
    Decoder dec(b7, b6, b5, b4, b3, b2, b1, b0, a2, a1, a0);
    Test test(a2, a1, a0, b7, b6, b5, b4, b3, b2, b1, b0);

endmodule
