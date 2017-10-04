/**
 * RISC: Extender.v
 * Author: Progyan Bhattacharya <progyanb@acm.org>
 *
 * This file contains definition of 32-bit Sign Extender (16-bit to 32-bit convert)
 * A Test Generator module has been added for unit testing as well.
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

// 32-bit Sign Extender module
module Extender (
    output reg [31:0] ext,
    input      [15:0] imm);

    always @ ( * ) begin
        if ( imm[15] == 1'b1 )
            ext = imm | 4294901760;
        else
            ext = imm;
    end
endmodule // Extender

// Test Generator Module to Test 32-bit Sign Extender
module TestExtender (
    input      [31:0] ext,
    output reg [15:0] imm);

    initial begin
        $monitor($time,,, "Immidiate: %b  Extended: %b", imm, ext);
            imm = 16'd0;
        #02 imm = 16'd1;
        #02 imm = 16'd2;
        #02 imm = 16'd3;
        #02 imm = 16'd4;
        #02 imm = 16'd5;
        #02 imm = 16'd6;
        #02 imm = 16'd7;
        #02 imm = 16'd8;
        #02 imm = 16'd9;
        #02 imm = 16'd10;
        #02 imm = 16'd11;
        #02 imm = 16'd12;
        #02 imm = 16'd13;
        #02 imm = 16'd14;
        #02 imm = 16'd15;
        #02 imm = 16'd16;
        #02 imm = 16'd17;
        #02 imm = 16'd18;
        #02 imm = 16'd19;
        #02 imm = 16'd20;
        #02 imm = 16'd21;
        #02 imm = 16'd22;
        #02 imm = 16'd23;
        #02 imm = 16'd24;
        #02 imm = 16'd25;
        #02 imm = 16'd26;
        #02 imm = 16'd27;
        #02 imm = 16'd28;
        #02 imm = 16'd29;
        #02 imm = 16'd30;
        #02 imm = 16'd31;
        #02 imm = 16'd32;
        #02 imm = 16'd33;
        #02 imm = 16'd34;
        #02 imm = 16'd35;
        #02 imm = 16'd36;
        #02 imm = 16'd37;
        #02 imm = 16'd38;
        #02 imm = 16'd39;
        #02 imm = 16'd40;
        #02 imm = 16'd41;
        #02 imm = 16'd42;
        #02 imm = 16'd43;
        #02 imm = 16'd44;
        #02 imm = 16'd45;
        #02 imm = 16'd46;
        #02 imm = 16'd47;
        #02 imm = 16'd48;
        #02 imm = 16'd49;
        #02 imm = 16'd50;
        #02 imm = 16'd51;
        #02 imm = 16'd52;
        #02 imm = 16'd53;
        #02 imm = 16'd54;
        #02 imm = 16'd55;
        #02 imm = 16'd56;
        #02 imm = 16'd57;
        #02 imm = 16'd58;
        #02 imm = 16'd59;
        #02 imm = 16'd60;
        #02 imm = 16'd61;
        #02 imm = 16'd62;
        #02 imm = 16'd63;
        #02 imm = 16'd64;
        #02 imm = 16'd65;
        #02 imm = 16'd66;
        #02 imm = 16'd67;
        #02 imm = 16'd68;
        #02 imm = 16'd69;
        #02 imm = 16'd70;
        #02 imm = 16'd71;
        #02 imm = 16'd72;
        #02 imm = 16'd73;
        #02 imm = 16'd74;
        #02 imm = 16'd75;
        #02 imm = 16'd76;
        #02 imm = 16'd77;
        #02 imm = 16'd78;
        #02 imm = 16'd79;
        #02 imm = 16'd80;
        #02 imm = 16'd81;
        #02 imm = 16'd82;
        #02 imm = 16'd83;
        #02 imm = 16'd84;
        #02 imm = 16'd85;
        #02 imm = 16'd86;
        #02 imm = 16'd87;
        #02 imm = 16'd88;
        #02 imm = 16'd89;
        #02 imm = 16'd90;
        #02 imm = 16'd91;
        #02 imm = 16'd92;
        #02 imm = 16'd93;
        #02 imm = 16'd94;
        #02 imm = 16'd95;
        #02 imm = 16'd96;
        #02 imm = 16'd97;
        #02 imm = 16'd98;
        #02 imm = 16'd99;
        #02 imm = 16'd100;
        #02 imm = 16'd32768;
        #02 imm = 16'd32769;
        #02 imm = 16'd32770;
        #02 imm = 16'd32771;
        #02 imm = 16'd32772;
        #02 imm = 16'd32773;
        #02 imm = 16'd32774;
        #02 imm = 16'd32775;
        #02 imm = 16'd32776;
        #02 imm = 16'd32777;
        #02 imm = 16'd32778;
        #02 imm = 16'd32779;
        #02 imm = 16'd32780;
        #02 imm = 16'd32781;
        #02 imm = 16'd32782;
        #02 imm = 16'd32783;
        #02 imm = 16'd32784;
        #02 imm = 16'd32785;
        #02 imm = 16'd32786;
        #02 imm = 16'd32787;
        #02 imm = 16'd32788;
        #02 imm = 16'd32789;
        #02 imm = 16'd32790;
        #02 imm = 16'd32791;
        #02 imm = 16'd32792;
        #02 imm = 16'd32793;
        #02 imm = 16'd32794;
        #02 imm = 16'd32795;
        #02 imm = 16'd32796;
        #02 imm = 16'd32797;
        #02 imm = 16'd32798;
        #02 imm = 16'd32799;
        #02 imm = 16'd32800;
        #02 imm = 16'd32801;
        #02 imm = 16'd32802;
        #02 imm = 16'd32803;
        #02 imm = 16'd32804;
        #02 imm = 16'd32805;
        #02 imm = 16'd32806;
        #02 imm = 16'd32807;
        #02 imm = 16'd32808;
        #02 imm = 16'd32809;
        #02 imm = 16'd32810;
        #02 imm = 16'd32811;
        #02 imm = 16'd32812;
        #02 imm = 16'd32813;
        #02 imm = 16'd32814;
        #02 imm = 16'd32815;
        #02 imm = 16'd32816;
        #02 imm = 16'd32817;
        #02 imm = 16'd32818;
        #02 imm = 16'd32819;
        #02 imm = 16'd32820;
        #02 imm = 16'd32821;
        #02 imm = 16'd32822;
        #02 imm = 16'd32823;
        #02 imm = 16'd32824;
        #02 imm = 16'd32825;
        #02 imm = 16'd32826;
        #02 imm = 16'd32827;
        #02 imm = 16'd32828;
        #02 imm = 16'd32829;
        #02 imm = 16'd32830;
        #02 imm = 16'd32831;
        #02 imm = 16'd32832;
        #02 imm = 16'd32833;
        #02 imm = 16'd32834;
        #02 imm = 16'd32835;
        #02 imm = 16'd32836;
        #02 imm = 16'd32837;
        #02 imm = 16'd32838;
        #02 imm = 16'd32839;
        #02 imm = 16'd32840;
        #02 imm = 16'd32841;
        #02 imm = 16'd32842;
        #02 imm = 16'd32843;
        #02 imm = 16'd32844;
        #02 imm = 16'd32845;
        #02 imm = 16'd32846;
        #02 imm = 16'd32847;
        #02 imm = 16'd32848;
        #02 imm = 16'd32849;
        #02 imm = 16'd32850;
        #02 imm = 16'd32851;
        #02 imm = 16'd32852;
        #02 imm = 16'd32853;
        #02 imm = 16'd32854;
        #02 imm = 16'd32855;
        #02 imm = 16'd32856;
        #02 imm = 16'd32857;
        #02 imm = 16'd32858;
        #02 imm = 16'd32859;
        #02 imm = 16'd32860;
        #02 imm = 16'd32861;
        #02 imm = 16'd32862;
        #02 imm = 16'd32863;
        #02 imm = 16'd32864;
        #02 imm = 16'd32865;
        #02 imm = 16'd32866;
        #02 imm = 16'd32867;
        #02 $finish;
    end
endmodule // TestExtender
