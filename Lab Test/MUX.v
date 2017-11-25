/**
 * 4-bit 4 x 1 Multiplexer module
 */
module MUX (output [3:0] Out, input [3:0] D0, D1, D2, D3, input [1:0] S);
    assign Out[0] = (D0[0] & ~S[0] & ~S[1]) | (D1[0] & S[0] & ~S[1]) |
                    (D2[0] & ~S[0] & S[1])  | (D3[0] & S[0] & S[1]);
    assign Out[1] = (D0[1] & ~S[0] & ~S[1]) | (D1[1] & S[0] & ~S[1]) |
                    (D2[1] & ~S[0] & S[1])  | (D3[1] & S[0] & S[1]);
    assign Out[2] = (D0[2] & ~S[0] & ~S[1]) | (D1[2] & S[0] & ~S[1]) |
                    (D2[2] & ~S[0] & S[1])  | (D3[2] & S[0] & S[1]);
    assign Out[3] = (D0[3] & ~S[0] & ~S[1]) | (D1[3] & S[0] & ~S[1]) |
                    (D2[3] & ~S[0] & S[1])  | (D3[3] & S[0] & S[1]);
endmodule // MUX
