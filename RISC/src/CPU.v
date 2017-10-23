/**
 * RISC: CPU.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of RISC Single Core Single Cycle CPU.
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

// Central Proccessing Unit (Single Cycle)
module CPU (
    input clk);

    wire [31:0] ir, wdata, aluout, rdata, adata, imm;
    reg  [31:0] PC, IR, WDATA, RDATA, ADATA, IMM;
    wire [11:0] aluctrl;
    reg  [11:0] ALUCTRL;
    wire [4:0]  dest, src, srt, shift;
    reg  [4:0]  DEST, SRC, SRT, SHIFT;
    wire [1:0]  dmctrl;
    reg  [1:0]  DMCTRL;
    wire        regctrl;
    reg         REGCTRL;
    IMem imem(ir, PC, clk);
    IDecode idec(aluctrl, dmctrl, dest, src, srt, shift, imm, IR, clk);
    RegisterFile regf(rdata, adata, wdata, src, srt, dest, clk, REGCTRL);
    ALU alu(aluout, RDATA, ADATA, IMM, clk, ALUCTRL);
    DMem dmem(wdata, rdata, aluout, clk, DMCTRL);
    initial begin
        $monitor($time,,, "\nCC: %b  CPU:\nPC: %b  IR: %b\n", clk, PC, IR);
        PC = -32'd1;
    end
    always @ ( * ) begin
        IR      = ir;
        WDATA   = wdata;
        RDATA   = rdata;
        ADATA   = adata;
        IMM     = imm;
        DEST    = dest;
        SRC     = src;
        SRT     = srt;
        SHIFT   = shift;
        REGCTRL = regctrl;
        ALUCTRL = aluctrl;
        DMCTRL  = dmctrl;
    end
    always @ (negedge clk) begin
        PC = PC + 32'd1;
    end
endmodule // CPU

// Test Generator Module to Test CPU module
module TestCPU (
    output reg clk);

    initial begin
        clk = 0;
        #10 $finish;
    end
    always begin
        #01 clk <= ~clk;
    end
endmodule // TestCPU
