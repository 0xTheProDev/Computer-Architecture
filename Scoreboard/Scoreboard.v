module integerUnit(output od, input ad, id, cnt);
    // Some Codes Here
endmodule // integerUnit module

module floatDivision(output od, input ad, id, cnt);
    // Some Codes Here
endmodule // floatDivision module

module floatAdder(output od, input ad, id, cnt);
    // Some Codes Here
endmodule // floatAdded module

module floatMultiplier(output od, input ad, id, cnt);
    // Some Codes Here
endmodule // floatMultiplier module

module registerFile(output id, input od, ad, cnt);
    // Some Codes Here
endmodule // registerFile module

module scoreBoard(output reg cnt, input Fu, D, Sj, Sk);
    reg [3:0] Busy, Op, Fi, Fj, Fk, Qj, Qk, Rj, Rk;
    reg [30:0] Result;

    always @(Fu, D, Sj, Sk)
        if (Busy[Fu] == 1'b1 && Result[D] == 1'b0)
            cnt = 2'b11;
endmodule // scoreBoard module

module pipeLine();
    // Some Codes Here
endmodule // pipeLine module

module testGenerator();
    // Some Codes Here
endmodule // testGenerator module

module workBench;
    // Some Codes Here
endmodule // workBench module
