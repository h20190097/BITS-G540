module Array_Multiplier(x,y,p);
input [7:0]x,y;
output [15:0]p;
wire [7:0]p0,p1,p2,p3,p4,p5,p6,p7;

assign  p0 = x & {8{y[0]}};
assign  p1 = x & {8{y[1]}};
assign  p2 = x & {8{y[2]}};
assign  p3 = x & {8{y[3]}};
assign  p4 = x & {8{y[4]}};
assign  p5 = x & {8{y[5]}};
assign  p6 = x & {8{y[6]}};
assign  p7 = x & {8{y[7]}};


// 1st stage

assign p[0] = p0[0];
half_adder ha1(p0[1],p1[0],p[1],c11);
full_adder fa1(p0[2],p1[1],c11,s12,c12);
full_adder fa2(p0[3],p1[2],c12,s13,c13);
full_adder fa3(p0[4],p1[3],c13,s14,c14);
full_adder fa4(p0[5],p1[4],c14,s15,c15);
full_adder fa5(p0[6],p1[5],c15,s16,c16);
full_adder fa6(p0[7],p1[6],c16,s17,c17);
half_adder ha2(c17,p1[7],s18,c18);

// 2nd stage

half_adder ha3(s12,p2[0],p[2],c21);
full_adder fa7(s13,p2[1],c21,s22,c22);
full_adder fa8(s14,p2[2],c22,s23,c23);
full_adder fa9(s15,p2[3],c23,s24,c24);
full_adder fa10(s16,p2[4],c24,s25,c25);
full_adder fa11(s17,p2[5],c25,s26,c26);
full_adder fa12(s18,p2[6],c26,s27,c27);
full_adder fa13(c18,p2[7],c27,s28,c28);

// 3rd stage

half_adder ha4(s22,p3[0],p[3],c31);
full_adder fa14(s23,p3[1],c31,s32,c32);
full_adder fa15(s24,p3[2],c32,s33,c33);
full_adder fa16(s25,p3[3],c33,s34,c34);
full_adder fa17(s26,p3[4],c34,s35,c35);
full_adder fa18(s27,p3[5],c35,s36,c36);
full_adder fa19(s28,p3[6],c36,s37,c37);
full_adder fa20(c28,p3[7],c37,s38,c38);

// 4th stage

half_adder ha5(s32,p4[0],p[4],c41);
full_adder fa21(s33,p4[1],c41,s42,c42);
full_adder fa22(s34,p4[2],c42,s43,c43);
full_adder fa23(s35,p4[3],c43,s44,c44);
full_adder fa24(s36,p4[4],c44,s45,c45);
full_adder fa25(s37,p4[5],c45,s46,c46);
full_adder fa26(s38,p4[6],c46,s47,c47);
full_adder fa27(c38,p4[7],c47,s48,c48);

// 5th Stage

half_adder ha6(s42,p5[0],p[5],c51);
full_adder fa28(s43,p5[1],c51,s52,c52);
full_adder fa29(s44,p5[2],c52,s53,c53);
full_adder fa30(s45,p5[3],c53,s54,c54);
full_adder fa31(s46,p5[4],c54,s55,c55);
full_adder fa32(s47,p5[5],c55,s56,c56);
full_adder fa33(s48,p5[6],c56,s57,c57);
full_adder fa34(c48,p5[7],c57,s58,c58);

// 6th Stage

half_adder ha7(s52,p6[0],p[6],c61);
full_adder fa35(s53,p6[1],c61,s62,c62);
full_adder fa36(s54,p6[2],c62,s63,c63);
full_adder fa37(s55,p6[3],c63,s64,c64);
full_adder fa38(s56,p6[4],c64,s65,c65);
full_adder fa39(s57,p6[5],c65,s66,c66);
full_adder fa40(s58,p6[6],c66,s67,c67);
full_adder fa41(c58,p6[7],c67,s68,c68);

// Last Stage - 7th stage

half_adder ha8(s62,p7[0],p[7],c71);
full_adder fa42(s63,p7[1],c71,p[8],c72);
full_adder fa43(s64,p7[2],c72,p[9],c73);
full_adder fa44(s65,p7[3],c73,p[10],c74);
full_adder fa45(s66,p7[4],c74,p[11],c75);
full_adder fa46(s67,p7[5],c75,p[12],c76);
full_adder fa47(s68,p7[6],c76,p[13],c77);
full_adder fa48(c68,p7[7],c77,p[14],p[15]);

endmodule


module full_adder (A,B,Ci,S,Co);
output Co,S;
input  A,B,Ci;
assign {Co,S} = A + B + Ci;
endmodule

module half_adder (A,B,S,C);
output C,S;
input  A,B;
assign {C,S} = A + B;
endmodule
