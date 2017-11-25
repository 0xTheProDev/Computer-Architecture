/**
 * 4-bit D Flipflop module
 */
module DFF4b (output [3:0] Q, input [3:0] D, input clk);
    // always @ ( posedge clk )  $display(Q);
    DFF dff0(Q[0], D[0], clk);
    DFF dff1(Q[1], D[1], clk);
    DFF dff2(Q[2], D[2], clk);
    DFF dff3(Q[3], D[3], clk);
endmodule // DFF4b
