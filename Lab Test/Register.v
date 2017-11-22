module DFF (output reg Q, input D, input clk);
    always @ (posedge clk) begin
        Q <= D;
    end
endmodule // DFF

module MUX (output [3:0] Out, input [3:0] D0, D1, D2, D3, input [1:0] S);
    assign Out[0] = (D0[0] & ~S[0] & ~S[1]) | (D1[0] & S[0] & ~S[1]) |
                    (D2[0] & ~S[0] & S[1])  | (D3[0] & S[0] & S[1]);
    assign Out[1] = (D0[1] & ~S[0] & ~S[1]) | (D1[1] & S[0] & ~S[1]) |
                    (D2[1] & ~S[0] & S[1])  | (D3[1] & S[0] & S[1]);
    assign Out[2] = (D0[2] & ~S[0] & ~S[1]) | (D1[2] & S[0] & ~S[1]) |
                    (D2[2] & ~S[0] & S[1])  | (D3[2] & S[0] & S[1]);
    assign Out[3] = (D0[3] & ~S[0] & ~S[1]) | (D1[3] & S[0] & ~S[1]) |
                    (D2[3] & ~S[0] & S[1])  | (D3[3] & S[0] & S[1]);
endmodule // MUX

module DECODER (output [3:0] D_Val, input [1:0] E_Val);
    assign D_Val[0] = ~E_Val[0] & ~E_Val[1];
    assign D_Val[1] =  E_Val[0] & ~E_Val[1];
    assign D_Val[2] = ~E_Val[0] &  E_Val[1];
    assign D_Val[3] =  E_Val[0] &  E_Val[1];
endmodule // DECODER

module DFF4b (output [3:0] Q, input [3:0] D, input clk);
    DFF dff0(Q[0], D[0], iclk);
    DFF dff1(Q[1], D[1], iclk);
    DFF dff2(Q[2], D[2], iclk);
    DFF dff3(Q[3], D[3], iclk);
endmodule // DFF4b

module RegBus (inout [3:0] dbus, input rwb, clk);
    wire iclk;
    wire [3:0] wtd;
    assign iclk = clk & rwb;
    assign dbus = wtd;
    DFF4b regd0(wtd, dbus, iclk);
endmodule // RegBus

module MEM (inout [3:0] dbus, input [1:0] address, input rwb, input clk);
    wire [3:0] addr_decoded, rw, d0, d1, d2 ,d3;
    DECODER dec0(addr_decoded, address);
    assign rw[0] = addr_decoded[0] & ~rwb;
    assign rw[1] = addr_decoded[1] & ~rwb;
    assign rw[2] = addr_decoded[2] & ~rwb;
    assign rw[3] = addr_decoded[3] & ~rwb;
    assign d0 = dbus;
    assign d1 = dbus;
    assign d2 = dbus;
    assign d3 = dbus;
    RegBus reg0(d0, rw[0], clk);
    RegBus reg1(d1, rw[1], clk);
    RegBus reg2(d2, rw[2], clk);
    RegBus reg3(d3, rw[3], clk);
    MUX mux0(dbus, d0, d1, d2, d3, address);
endmodule // MEM

module TestGen (output reg [3:0] D, output reg [1:0] address, output reg rwb, input clk);
    initial begin
        $monitor($time,,, "Mode: %b  Address: %b  Data: %b\n", rwb, address, D);
        rwb = 1'b0;
            { address, D } = { 2'b00, 4'b0000 };
        #02 { address, D } = { 2'b01, 4'b0101 };
        #02 { address, D } = { 2'b10, 4'b1010 };
        #02 { address, D } = { 2'b11, 4'b1111 };
        #02 rwb = 1'b1;
            address = 2'b00;
        #02 address = 2'b01;
        #02 address = 2'b10;
        #02 address = 2'b11;
        #04 $finish;
    end
endmodule // TestGen

module WorkBench;
    wire [3:0] dbus;
    wire [1:0] address;
    wire rwb;
    reg clk;
    MEM mem0(dbus, address, rwb, clk);
    TestGen test0(dbus, address, rwb, clk);
    initial       clk <= 1'b0;
    always    #01 clk <= ~clk;
endmodule // WorkBench
