/**
 * 1-bit D Flipflop module
 */
module DFF (output reg Q, input D, input clk);
    initial    Q <= 1'b0;
    always @ (posedge clk) begin
        Q <= D;
    end
endmodule // DFF
