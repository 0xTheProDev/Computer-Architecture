/**
 * RISC: RegisterFile.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of Register File along with R/W Operation
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

// 32x32-bit Register File module
module RegisterFile (
    output reg [31:0] rsd, rtd,
    input      [31:0] wtd,
    input      [4:0]  rsa, rta, wta,
    input             clk, cnt);

    reg [31:0] REG[0:31];
    integer i;
    initial begin
        $monitor("REG:\nREGCTRL: %b\nRSD: %b  RTD: %b  WTD: %b\n", cnt, rsd, rtd, wtd);
        for ( i = 0; i < 32; i = i + 1 )
            REG[i] = 0;
    end
    always @ ( * ) begin
        if ( cnt && (wta != 5'd0) && (rsa == wta) )
            rsd = wtd;
        else if ( cnt && (wta != 5'd0) && (rta == wta) )
            rtd = wtd;
        else begin
            rsd <= REG[rsa][31:0];
            rtd <= REG[rta][31:0];
        end
    end
    always @ ( posedge clk ) begin
        if ( cnt && (wta != 5'd0) )
            REG[wta] <= wtd;
    end
endmodule // RegisterFile

// Test Generator Module to Test 32x32-bit Register File
module TestRegFile (
    input      [31:0] rsd, rtd,
    output reg [31:0] wtd,
    output reg [4:0]  rsa, rta, wta,
    input             clk,
    output reg        cnt);

    initial begin
        $monitor($time,,, "CC=%b\nAddress1: %b  Data1: %b\nAddress2: %b  Data2: %b", clk, rsa, rsd, rta, rtd);
            { cnt, rsa, rta } = { 1'b0, 5'd0, 5'd1 };
        #02 { cnt, wta, wtd } = { 1'b1, 5'd1, 32'd1 };
        #02 { cnt, wta, wtd } = { 1'b1, 5'd0, 32'd2 };
        #02 { cnt, wta, wtd } = { 1'b1, 5'd2, 32'd10 };
        #02 $finish;
    end
endmodule // TestRegFile
