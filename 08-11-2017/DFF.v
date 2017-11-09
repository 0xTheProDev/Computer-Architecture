module DFF(
    output reg q,
    input      Rs, Pr,
    input      d, clk);

    always @( posedge clk ) begin
        if (Rs == 0)
            q <= 0;
        else if (Pr == 1)
            q <= 1;
        else
            q <= d;
    end
endmodule

module DFF8(
    output [7:0] q,
    input  [7:0] d,
    input        Rs, Pr,
    input        clk);

    DFF dff0(q[0], Rs, Pr, d[0], clk);
    DFF dff1(q[1], Rs, Pr, d[1], clk);
    DFF dff2(q[2], Rs, Pr, d[2], clk);
    DFF dff3(q[3], Rs, Pr, d[3], clk);
    DFF dff4(q[4], Rs, Pr, d[4], clk);
    DFF dff5(q[5], Rs, Pr, d[5], clk);
    DFF dff6(q[6], Rs, Pr, d[6], clk);
    DFF dff7(q[7], Rs, Pr, d[7], clk);
endmodule

module RegBus(
    inout  [7:0] rd,
    input       Rs, Pr, Rw,
    input       clk);

    reg       iclk;
    wire [7:0] wt;
    assign rd = wt;
    DFF8 register(wt, rd, Rs, Pr, iclk);
    always @( Rw or clk ) begin
        if (Rw == 1)
            iclk = clk;
        else 
            iclk = 0;
    end
endmodule

module TestGen(
    output reg [7:0] d,
    output reg       Rs, Pr, Rw,
    input            clk);

    initial begin
        $monitor($time,,, "CC: %b  RW: %b  Data: %b\n", clk, Rw, d);
            Pr = 1'b0;
            Rs = 1'b1;
            Rw = 1'b1;
            d = 8'd0;
        #02 d = 8'd1;
        #02 d = 8'd2;
        #02 d = 8'd4;
        #02 d = 8'd8;
        #02 d = 8'd16;
            Rw = 1'b0;
        #04 $finish;
    end
endmodule

module WorkBench;
    reg clk;
    wire       Rs, Pr, Rw;
    wire [7:0] d;
    RegBus register(d, Rs, Pr, Rw, clk);
    TestGen test(d, Rs, Pr, Rw, clk);
    initial begin
        // $dumpfile("register.vcd");
        // $dumpvars(0, WorkBench);
        clk = 1'b0;
    end
    always
        #01 clk <= ~clk;
endmodule
