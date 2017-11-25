/**
 * 2 x 1 Decoder module
 */
module DECODER (output [3:0] D_Val, input [1:0] E_Val);
    assign D_Val[0] = ~E_Val[0] & ~E_Val[1];
    assign D_Val[1] =  E_Val[0] & ~E_Val[1];
    assign D_Val[2] = ~E_Val[0] &  E_Val[1];
    assign D_Val[3] =  E_Val[0] &  E_Val[1];
endmodule // DECODER
