/**
 * RISC: ALU.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of Minimal ALU with Two 2x1 Multiplexer.
 * A Test Generator module has been added for unit testing as well.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

// Arithmetic and Logic Unit
module ALU (
    output reg [31:0] out,
    input      [31:0] rs, rt, imm,
    input             clk,
    input      [11:0] cnt);

    always @ ( * ) begin
        case ( cnt )
            12'd32:   out <= rs + rt;
            12'd512:  out <= rs + imm;
            12'd34:   out <= rs - rt;
            12'd24:   out <= rs * rt;
            12'd26:   out <= rs / rt;
            12'd36:   out <= rs & rt;
            12'd768:  out <= rs & imm;
            12'd37:   out <= rs | rt;
            12'd832:  out <= rs | imm;
            12'd2048: out <= rs + imm;
            12'd2560: out <= rs + imm;
            default:  out <= 32'd0;
        endcase
    end
endmodule //ALU

// Test Generator Module to Test ALU module
module TestALU (
    input      [31:0] out,
    output reg [31:0] rs, rt, imm,
    input             clk,
    output reg [11:0] cnt);

    initial begin
        $monitor($time,,, "\nControl: %b\nRsd: %b\nRtd: %b\nImm: %b\nOut: %b\n", cnt, rs, rt, imm, out);
            { cnt, rs, rt, imm } = { 12'd32, 32'd120, 32'd145, 32'd320 };
        #02 { cnt, rs, rt, imm } = { 12'd512, 32'd120, 32'd145, 32'd320 };
        #02 { cnt, rs, rt, imm } = { 12'd0, 32'd120, 32'd145, 32'd320 };
        #02 { cnt, rs, rt, imm } = { 12'd0, 32'd120, 32'd145, 32'd320 };
        #02 $finish;
    end
endmodule // TestALU
