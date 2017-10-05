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
    input        clk,
    input [31:0] pc);

    wire [31:0] ir, wdata, rdata, adata, imm;
    reg  [31:0] PC, IR, WDATA, RDATA, ADATA, IMM;
    wire [11:0] aluctrl;
    reg  [11:0] ALUCTRL;
    wire [4:0]  dest, src, srt, shift;
    reg  [4:0]  DEST, SRC, SRT, SHIFT;
    wire        idctrl, regctrl, dmctrl;
    reg         IDCTRL, REGCTRL, DMCTRL;
    IMem imem(ir, pc, clk);
    IDecode idec(aluctrl, dest, src, srt, shift, imm, ir, clk, idctrl);
    RegisterFile regf(rdata, adata, wdata, src, srt, dest, clk, regctrl);
    ALU alu(wdata, rdata, adata, imm, clk, aluctrl);
    initial begin
        $monitor($time,,, "\nCC: %b\nPC: %b  IR: %b\n", clk, PC, IR);
    end
    always @ ( * ) begin
        PC      <= pc;
        IR      <= ir;
        WDATA   <= wdata;
        RDATA   <= rdata;
        ADATA   <= adata;
        IMM     <= imm;
        DEST    <= dest;
        SRC     <= src;
        SRT     <= srt;
        SHIFT   <= shift;
        IDCTRL  <= idctrl;
        REGCTRL <= regctrl;
        ALUCTRL <= aluctrl;
        DMCTRL  <= dmctrl;
    end
endmodule // CPU

// Test Generator Module to Test CPU module
module TestCPU (
    output reg        clk,
    output reg [31:0] pc);

    integer i;
    initial begin
        clk = 0;
        for (pc = 0; pc < 10; pc = pc + 1)
            #01 clk <= ~clk;
    end
endmodule // TestCPU
