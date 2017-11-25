/**
 * Connecting Work Bench module
 */
module WorkBench;
    wire [3:0] dbus, qout;
    wire [1:0] address;
    wire rwb;
    reg clk;
    MEM mem0(qout, dbus, address, rwb, clk);
    TestGen test0(qout, dbus, address, rwb, clk);
    initial       clk <= 1'b0;
    always    #01 clk <= ~clk;
endmodule // WorkBench
