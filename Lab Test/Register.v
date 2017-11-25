/**
 * 4 x 4-bit Register file module
 */
module MEM (output [3:0] qout, input [3:0] dbus, input [1:0] address, input rwb, input clk);
    wire [3:0] addr_decoded, rw, d0, d1, d2 ,d3, q0, q1, q2, q3;
    DECODER dec0(addr_decoded, address);
    assign rw[0] = addr_decoded[0] & rwb;
    assign rw[1] = addr_decoded[1] & rwb;
    assign rw[2] = addr_decoded[2] & rwb;
    assign rw[3] = addr_decoded[3] & rwb;
    assign d0 = dbus;
    assign d1 = dbus;
    assign d2 = dbus;
    assign d3 = dbus;
    DFF4b regd0(q0, d0, rw[0] & clk);
    DFF4b regd1(q1, d1, rw[1] & clk);
    DFF4b regd2(q2, d2, rw[2] & clk);
    DFF4b regd3(q3, d3, rw[3] & clk);
    MUX mux0(qout, q0, q1, q2, q3, address);
endmodule // MEM
