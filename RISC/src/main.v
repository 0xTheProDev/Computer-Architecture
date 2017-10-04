/**
 * RISC: main.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of WorkBench that connects all the modules.
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

module WorkBench;
	reg clk = 1'b0;
	integer i;
	wire cnt;
	wire [4:0] rsa, rta, wta, shift;
	wire [5:0] opcode, func;
	wire [31:0] inst, rsd, rtd, wtd, imm;
	IDecode idec(opcode, func, wta, rsa, rta, shift, imm, inst, clk, cnt);
	TestIDecode tdec(opcode, func, wta, rsa, rta, shift, imm, inst, clk, cnt);
	// RegisterFile mem(rsd, rtd, wtd, rsa, rta, wta, clk, cnt);
	// TestRegFile tmem(rsd, rtd, wtd, rsa, rta, wta, clk, cnt);
	initial begin
		for (i = 0; i < 10; i = i + 1)
			#02 clk = ~clk;
	end
endmodule
