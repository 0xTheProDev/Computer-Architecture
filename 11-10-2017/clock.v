module Clock (output reg clk);
    initial begin
	$dumpfile("clock.vcd");
	$dumpvars(0, Clock);
        // $monitor($time,,, "%b", clk);
        clk = 1'b0;
	#05 $finish;
    end
    always
        #01 clk = ~clk;
endmodule

