module Wallace_Tree_Multiplier(x,y,p);
input [7:0]x,y;
output [15:0]p;
wire [7:0]p0,p1,p2,p3,p4,p5,p6,p7;
wire [15:0]sum,carry;
wire s611,s610,s69,s68,s67,s66,s65,s64,s63,s62,s61,s51,s31,s11;
wire c611,c610,c69,c68,c67,c66,c65,c64,c63,c62,c61;

assign  p0 = x & {8{y[0]}};
assign  p1 = x & {8{y[1]}};
assign  p2 = x & {8{y[2]}};
assign  p3 = x & {8{y[3]}};
assign  p4 = x & {8{y[4]}};
assign  p5 = x & {8{y[5]}};
assign  p6 = x & {8{y[6]}};
assign  p7 = x & {8{y[7]}};


/*
//1st stage

half_adder ha1(p0[1],p1[0],s11,c11);
full_adder fa1(p0[2],p1[1],p2[0],s12,c12);
full_adder fa2(p0[3],p1[2],p2[1],s13,c13);
half_adder ha2(p1[3],p2[2],s14,c14);

//2nd stage

half_adder ha3(s12,c11,s21,c21);
full_adder fa3(s13,c12,p3[0],s22,c22);
full_adder fa4(s14,c13,p3[1],s23,c23);
full_adder fa5(p2[3],c14,p3[2],s24,c24);


//last stage

half_adder ha4(s22,c21,s31,c31);
full_adder fa6(s23,c22,c31,s32,c32);
full_adder fa7(s24,c23,c32,s33,c33);
full_adder fa8(p3[3],c24,c33,s34,c34);

assign p[0]= p0[0];
assign p[1]= s11;
assign p[2]= s21;
assign p[3]= s31;
assign p[4]= s32;
assign p[5]= s33;
assign p[6]= s34;
assign p[7]= c34;

*/

//First stage

half_adder ha1(p0[1],p1[0],s11,c11);
full_adder fa1(p0[2],p1[1],p2[0],s12,c12);
full_adder fa2(p0[3],p1[2],p2[1],s13,c13);
full_adder fa3(p0[4],p1[3],p2[2],s14,c14);
full_adder fa4(p0[5],p1[4],p2[3],s15,c15);
full_adder fa5(p0[6],p1[5],p2[4],s16,c16);
full_adder fa6(p0[7],p1[6],p2[5],s17,c17);
half_adder ha2(p1[7],p2[6],s18,c18);


half_adder ha3(p3[1],p4[0],s21,c21);
full_adder fa7(p3[2],p4[1],p5[0],s22,c22);
full_adder fa8(p3[3],p4[2],p5[1],s23,c23);
full_adder fa9(p3[4],p4[3],p5[2],s24,c24);
full_adder fa10(p3[5],p4[4],p5[3],s25,c25);
full_adder fa11(p3[6],p4[5],p5[4],s26,c26);
full_adder fa12(p3[7],p4[6],p5[5],s27,c27);
half_adder ha4(p4[7],p5[6],s28,c28);

//second stage

half_adder ha5(s12,c11,s31,c31);
full_adder fa13(s13,c12,p3[0],s32,c32);
full_adder fa14(s14,c13,s21,s33,c33);
full_adder fa15(s15,c14,s22,s34,c34);
full_adder fa16(s16,c15,s23,s35,c35);
full_adder fa17(s17,c16,s24,s36,c36);
full_adder fa18(s18,c17,s25,s37,c37);
full_adder fa19(p2[7],c18,s26,s38,c38);


half_adder ha6(c22,p6[0],s41,c41);
full_adder fa20(c23,p6[1],p7[0],s42,c42);
full_adder fa21(c24,p6[2],p7[1],s43,c43);
full_adder fa22(c25,p6[3],p7[2],s44,c44);
full_adder fa23(c26,p6[4],p7[3],s45,c45);
full_adder fa24(c27,p6[5],p7[4],s46,c46);
full_adder fa25(c28,p6[6],p7[5],s47,c47);
half_adder ha7(p6[7],p7[6],s48,c48);


//third stage

half_adder ha8(s32,c31,s51,c51);
half_adder ha9(s33,c32,s52,c52);
full_adder fa26(s34,c33,c21,s53,c53);
full_adder fa27(s35,c34,s41,s54,c54);
full_adder fa28(s36,c35,s42,s55,c55);
full_adder fa29(s37,c36,s43,s56,c56);
full_adder fa30(s38,c37,s44,s57,c57);
full_adder fa31(s27,c38,s45,s58,c58);
half_adder ha10(s28,s46,s59,c59);
half_adder ha11(p5[7],s47,s510,c510);


//fourth stage

half_adder ha12(s52,c51,s61,c61);
half_adder ha13(s53,c52,s62,c62);
half_adder ha14(s54,c53,s63,c63);
full_adder fa32(s55,c54,c41,s64,c64);
full_adder fa33(s56,c55,c42,s65,c65);
full_adder fa34(s57,c56,c43,s66,c66);
full_adder fa35(s58,c57,c44,s67,c67);
full_adder fa36(s59,c58,c45,s68,c68);
full_adder fa37(s510,c59,c46,s69,c69);
full_adder fa38(s48,c510,c47,s610,c610);
half_adder ha15(p7[7],c48,s611,c611);


// Last Stage

assign sum[15] = 0,sum[14] = s611,sum[13] = s610,sum[12] = s69,sum[11] = s68,sum[10] = s67,sum[9] = s66,sum[8] = s65
,sum[7] = s64,sum[6] = s63,sum[5] = s62,sum[4] = s61,sum[3] = s51,sum[2] = s31,sum[1] = s11,sum[0] = p0[0];
assign carry[15] = c611,carry[14] = c610,carry[13] = c69,carry[12] = c68,carry[11] = c67,carry[10] = c66,carry[9] = c65,carry[8] = c64
,carry[7] = c63,carry[6] = c62,carry[5] = c61,carry[4] = 0,carry[3] = 0,carry[2] = 0,carry[1] = 0,carry[0] = 0;

carry_ripple_adder cra1(sum,carry,p,carry_out);


endmodule



module half_adder (A,B,S,C);
output C,S;
input  A,B;
assign {C,S} = A + B;
endmodule

module full_adder (A,B,Ci,S,Co);
output Co,S;
input  A,B,Ci;
assign {Co,S} = A + B + Ci;
endmodule

module carry_ripple_adder(in0, in1, out, cout);
input [15:0] in0;
input [15:0] in1;
output [15:0] out;
output cout;
wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
full_adder fa0(in0[0], in1[0], 0, out[0], c1);
full_adder fa1(in0[1], in1[1], c1, out[1], c2);
full_adder fa2(in0[2], in1[2], c2, out[2], c3);
full_adder fa3(in0[3], in1[3], c3, out[3], c4);
full_adder fa4(in0[4], in1[4], c4, out[4], c5);
full_adder fa5(in0[5], in1[5], c5, out[5], c6);
full_adder fa6(in0[6], in1[6], c6, out[6], c7);
full_adder fa7(in0[7], in1[7], c7, out[7], c8);
full_adder fa8(in0[8], in1[8], c8, out[8], c9);
full_adder fa9(in0[9], in1[9], c9, out[9], c10);
full_adder fa10(in0[10], in1[10], c10, out[10], c11);
full_adder fa11(in0[11], in1[11], c11, out[11], c12);
full_adder fa12(in0[12], in1[12], c12, out[12], c13);
full_adder fa13(in0[13], in1[13], c13, out[13], c14);
full_adder fa14(in0[14], in1[14], c14, out[14], c15);
full_adder fa15(in0[15], in1[15], c15, out[15], cout);
endmodule
