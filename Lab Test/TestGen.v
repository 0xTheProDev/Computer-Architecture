/**
 * Test Generator module
 */
module TestGen (input [3:0] qout, output reg [3:0] dbus, output reg [1:0] address, output reg rwb, input clk);
    // reg [3:0] D;
    // assign dbus = rwb == 1'b1 ? D : 4'b0;
    initial begin
        $monitor($time,,, "Mode: %b  Address: %b  Data: %b  Output: %b\n", rwb, address, dbus, qout);
        rwb = 1'b1;
            { address, dbus } = { 2'b00, 4'b0000 };
        #02 { address, dbus } = { 2'b01, 4'b0101 };
        #02 { address, dbus } = { 2'b10, 4'b1010 };
        #02 { address, dbus } = { 2'b11, 4'b1111 };
        #02 rwb = 1'b0;
            address = 2'b00;
        #02 address = 2'b01;
        #02 address = 2'b10;
        #02 address = 2'b11;
        #04 $finish;
    end
endmodule // TestGen
