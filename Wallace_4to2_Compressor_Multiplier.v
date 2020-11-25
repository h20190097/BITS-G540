module Wallace_Compressor_Multiplier(x,y,p);
input [7:0]x,y;
output [15:0]p;
wire [7:0]p0,p1,p2,p3,p4,p5,p6,p7;
wire [15:0]sum,carry;

assign  p0 = x & {8{y[0]}};
assign  p1 = x & {8{y[1]}};
assign  p2 = x & {8{y[2]}};
assign  p3 = x & {8{y[3]}};
assign  p4 = x & {8{y[4]}};
assign  p5 = x & {8{y[5]}};
assign  p6 = x & {8{y[6]}};
assign  p7 = x & {8{y[7]}};


// 1st stage

half_adder ha1(p0[4],p1[3],s11,co11);
compressor cp1(p0[5],p1[4],p2[3],p3[2],co11,s12,c12,co12);
compressor cp2(p0[6],p1[5],p2[4],p3[3],co12,s13,c13,co13);
compressor cp3(p0[7],p1[6],p2[5],p3[4],co13,s14,c14,co14);
compressor cp4(p1[7],p2[6],p3[5],p4[4],co14,s15,c15,co15);
compressor cp5(p2[7],p3[6],p4[5],p5[4],co15,s16,c16,co16);
compressor cp6(p3[7],p4[6],p5[5],p6[4],co16,s17,c17,co17);
full_adder fa1(p4[7],p5[6],co17,s18,co18);
half_adder ha2(p4[2],p5[1],s19,co19);
compressor cp7(p4[3],p5[2],p6[1],p7[0],co19,s110,c110,co110);
compressor cp8(p5[3],p6[2],p7[1],0,co110,s111,c111,co111);
full_adder fa2(p6[3],p7[2],co111,s112,co112);

// 2nd stage

half_adder ha3(p0[2],p1[1],s21,co21);
compressor cp9(p0[3],p1[2],p2[1],p3[0],co21,s22,c22,co22);
compressor cp10(s11,p2[2],p3[1],p4[0],co22,s23,c23,co23);
compressor cp11(s12,p4[1],p5[0],0,co23,s24,c24,co24);
compressor cp12(s13,c12,s19,p6[0],co24,s25,c25,co25);
compressor cp13(s14,c13,s110,0,co25,s26,c26,co26);
compressor cp14(s15,c14,s111,c110,co26,s27,c27,co27);
compressor cp15(s16,c15,s112,c111,co27,s28,c28,co28);
compressor cp16(s17,c16,co112,p7[3],co28,s29,c29,co29);
compressor cp17(s18,c17,p6[5],p7[4],co29,s210,c210,co210);
compressor cp18(co18,p5[7],p6[6],p7[5],co210,s211,c211,co211);
full_adder fa3(p6[7],p7[6],co211,s212,co212);

// Last stage

assign sum[15] = 0,sum[14] = p7[7],sum[13] = s212,sum[12] = s211,sum[11] = s210,sum[10] = s29,sum[9] = s28,sum[8] = s27
,sum[7] = s26,sum[6] = s25,sum[5] = s24,sum[4] = s23,sum[3] = s22,sum[2] = s21,sum[1] = p0[1],sum[0] = p0[0];
assign carry[15] = 0,carry[14] = co212,carry[13] = c211,carry[12] = c210,carry[11] = c29,carry[10] = c28,carry[9] = c27,carry[8] = c26
,carry[7] = c25,carry[6] = c24,carry[5] = c23,carry[4] = c22,carry[3] = 0,carry[2] = p2[0],carry[1] = p1[0],carry[0] = 0;


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

module compressor(a1,a2,a3,a4,a5,acc_sum,acc_carry,acc_cout);
input a1,a2,a3,a4,a5;
output acc_sum,acc_carry,acc_cout;
assign acc_sum=(a1^a2)^(a3^a4^a5);
assign acc_cout=((a1^a2)&a3) | ((~(a1^a2))&a1);
assign acc_carry=((a1^a2^a3^a4)&a5) | ((~(a1^a2^a3^a4))&a4);
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
