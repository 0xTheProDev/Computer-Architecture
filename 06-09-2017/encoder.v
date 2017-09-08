// Module Encoder: 8-bit to 3-bit
module Encoder
    (output a2, a1, a0,
     input b7, b6, b5, b4, b3, b2, b1, b0);

    assign a2 = b4 | b5 | b6 | b7;
    assign a1 = b2 | b3 | b6 | b7;
    assign a0 = b1 | b3 | b5 | b7;

endmodule

// Module Testcases
module Test
    (output reg b7, b6, b5, b4, b3, b2, b1, b0,
     input a2, a1,a0);

    wire [7:0] ip;
    assign ip = { b7, b6, b5, b4, b3, b2, b1, b0 };
    initial begin
        $monitor($time,, "IP=%b A2=%b A1=%b A0=%b", ip, a2, a1, a0);
        { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 };
        #2 { b7, b6, b5, b4, b3, b2, b1, b0 } = { 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 };
        #2 $finish;
    end

endmodule

// Module WorkBench
module wb();

    wire a0, a1, a2, b0, b1, b2, b3, b4, b5, b6, b7;
    Encoder enc(a2, a1, a0, b7, b6, b5, b4, b3, b2, b1, b0);
    Test test(b7, b6, b5, b4, b3, b2, b1, b0, a2, a1, a0);

endmodule
