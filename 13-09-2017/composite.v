module myand(output c, input a, b);
    and(c, a, b);
endmodule // myand module

module myor(output c, input a, b);
    or(c, a, b);
endmodule // myor module

module mynand(output c, input a, b);
    nand(c, a, b);
endmodule // mynand module

module mynor(output d, input a, b, c);
    wire w1, w2;
    myor mor1(w1, a, b);
    myor mor2(w2, w1, c);
    not(d, w2);
endmodule // mynor module

module mymux(output c, input a, b, s);
    assign c = ((~s) & a) | (s & b);
endmodule // mymux module

module mycomp(output e, input a, b, c, d);
    wire w1, w2;
    myand mand(w1, a, b);
    myor mor(w2, c, d);
    mynand mnand(e, w1, w2);
endmodule // mycomp module

module myxnor(output c, input a, b);
    xnor(c, a, b);
endmodule // myxnor module

module mycomposite(output e, input a, b, c, d);
    wire w1, w2, w3, w4, w5, w6;
    mycomp mcomp(w1, a, b, b, c);
    myand mand(w2, ~b, ~c);
    mymux mmux(w3, w1, w2, ~d);
    mynor mnor(w4, a, ~c, d);
    myxnor mxnor(e, w3, w4);
endmodule // mycomposite module

module mytestgen(output reg a, b, c, d, input e);
    wire [3:0] w;
    assign w = { a, b, c, d };
    initial begin
        $monitor($time,,, "[a,b,c,d]=%b  e=%b", w, e);
	    { a, b, c, d } = 4'b0000;
        #02 { a, b, c, d } = 4'b0001;
        #02 { a, b, c, d } = 4'b0010;
        #02 { a, b, c, d } = 4'b0011;
	#02 { a, b, c, d } = 4'b0100;
        #02 { a, b, c, d } = 4'b0101;
	#02 { a, b, c, d } = 4'b0110;
	#02 { a, b, c, d } = 4'b0111;
	#02 { a, b, c, d } = 4'b1000;
	#02 { a, b, c, d } = 4'b1001;
        #02 { a, b, c, d } = 4'b1010;
        #02 { a, b, c, d } = 4'b1011;
	#02 { a, b, c, d } = 4'b1100;
        #02 { a, b, c, d } = 4'b1101;
	#02 { a, b, c, d } = 4'b1110;
	#02 { a, b, c, d } = 4'b1111;
	#02 $finish;
    end
endmodule // mytestgen module

module wb;
    wire a, b, c, d, e;
    mycomposite mcomp(e, a, b, c, d);
    mytestgen mtestg(a, b, c, d, e);
endmodule // workbench module
