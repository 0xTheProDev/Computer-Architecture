/**
 * 4-bit Data Memory Bus module
 */
module RegBus (inout [3:0] dbus, input [1:0] addr, input rwb, clk);
    wire iclk;
    wire [3:0] wtd;
    // If it is write stage and clk has changed
    assign iclk = rwb & clk;
    // assign dbus = wtd;
    DFF4b regd0(wtd, dbus, iclk);
endmodule // RegBus
