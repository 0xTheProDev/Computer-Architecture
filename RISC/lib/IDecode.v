/**
 * RISC: IDecode.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contain Decoder module for Spliting Instruction into several parts
 * and produce control signal according to Opcode and Function
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

// Instruction Decode module
module IDecode (
    output reg [5:0]  opcode, func,
    output reg [4:0]  rd, rs, rt, shift,
    output reg [31:0] imm,
    input      [31:0] inst,
    input             clk, cnt);

    reg  [15:0] nxt;
    wire [31:0] ext;
    Extender extend(ext, nxt);
    always @ ( * ) begin
        if ( cnt ) begin
            { opcode, rd, rs, rt, shift, func } = inst;
            nxt = { rt, shift, func };
            imm = ext;
        end
    end
endmodule // IDecode

// Test Generator Module to Test Instruction Decode module
module TestIDecode (
    input      [5:0]  opcode, func,
    input      [4:0]  rd, rs, rt, shift,
    input      [31:0] imm,
    output reg [31:0] inst,
    input             clk,
    output reg        cnt);

    initial begin
        $monitor($time,,, "CC=%b\nInstruction: %b\nOpcode: %b  Function: %b\nDestinaton: %b  Source: %b\nOperand: %b  Shift: %b\nImmidiate: %b", clk, inst, opcode, func, rd, rs, rt, shift, imm);
            { cnt, inst } = { 1'b1, 32'd125 };
        #02 { cnt, inst } = { 1'b1, 32'd132 };
        #02 { cnt, inst } = { 1'b1, 32'd264 };
        #02 { cnt, inst } = { 1'b1, 32'd143 };
        #02 { cnt, inst } = { 1'b1, 32'd279 };
        #02 $finish;
    end
endmodule // TestIDecode
