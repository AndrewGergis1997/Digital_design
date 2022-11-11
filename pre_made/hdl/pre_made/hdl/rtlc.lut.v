/*
 * RTLC LUTs inferred in macros
 * for technology mapping to Xilinx Virtex FPGAs
 */

// `ifndef _RTLC_LUT_V_ -- vsyn does not support this
// `define _RTLC_LUT_V_

module VMW_LUT3_96(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I2 ^ ( I0 ^ I1 );
endmodule //VMW_LUT3_96

module VMW_LUT3_71(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = ((!I0) & (!I1)) | ((!I0) & I2) | ((!I1) & I2);
endmodule //VMW_LUT3_71

module VMW_LUT3_90(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I2 & ( ! (I0 ^ I1) );

endmodule //VMW_LUT3_90

module VMW_LUT4_8421(O,I0,I1,I2,I3);
output O;
input I0;
input I1;
input I3;
input I2;

assign O   = (~(I0 ^ I2)) & (~(I1 ^ I3));

endmodule //VMW_LUT4_8421

module VMW_LUT3_F8(O,I0,I1,I2);
output O;
input I0;
input I1;
input I2;

assign O = I2 | I1 & I0;

endmodule //VMW_LUT3_F8

module VMW_LUT4_0777(O,I0,I1,I2,I3);
output O;
input I0;
input I1;
input I2;
input I3;

assign O = !( (I0&I1) | (I2&I3) );

endmodule //VMW_LUT4_EEE0

module VMW_LUT4_8000(O,I0,I1,I2,I3);
output O;
input I0;
input I1;
input I2;
input I3;

assign O = I3 & I2 & I1 & I0;

endmodule //VMW_LUT4_8000

module VMW_LUT4_0001(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = ! (I3 | I2 | I1 | I0);

endmodule //VMW_LUT4_0001

module VMW_LUT2_8(O,I0,I1);
output O;
input I1;
input I0;

assign O = I1 & I0;

endmodule //VMW_LUT2_8

module VMW_LUT3_80(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I1 & I2 & I0;

endmodule //VMW_LUT3_80

module VMW_LUT2_E(O,I0,I1);
output O;
input I1;
input I0;

assign O = I1 | I0;

endmodule //VMW_LUT2_7

module VMW_LUT3_FE(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I2 | I1 | I0;

endmodule //VMW_LUT3_FE

module VMW_LUT4_FFFE(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I3 | I2 | I1 | I0;

endmodule //VMW_LUT4_7FFF

module VMW_LUT2_7(O,I0,I1);
output O;
input I1;
input I0;

assign O = !(I1 & I0);

endmodule //VMW_LUT2_7

module VMW_LUT4_7FFF(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = !(I3 & I2 & I1 & I0);

endmodule //VMW_LUT4_7FFF

module VMW_LUT3_7F(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = !(I2 & I1 & I0);

endmodule //VMW_LUT3_7F

module VMW_LUT3_01(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = !(I2 | I1 | I0);

endmodule //VMW_LUT3_01

module VMW_LUT2_1(O,I0,I1);
output O;
input I1;
input I0;

assign O = !(I1 | I0);

endmodule //VMW_LUT2_1

module VMW_LUT2_6(O,I0,I1);
output O;
input I1;
input I0;

assign O = I1 ^ I0;

endmodule //VMW_LUT2_6

module VMW_LUT2_2(O,I0,I1);
output O;
input I0;
input I1;

assign O = I0 & (! I1);

endmodule //VMW_LUT2_4

module VMW_LUT2_4(O,I0,I1);
output O;
input I1;
input I0;

assign O = (! I0 ) & I1;

endmodule //VMW_LUT2_2

module VMW_LUT3_20(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I2 & (! I1) & I0;

endmodule // VMW_LUT3_20

module VMW_LUT3_02(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I0 & (! I1) & (! I2);

endmodule //VMW_LUT3_02

module VMW_LUT3_40(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = (! I0) & I1 & I2;

endmodule //VMW_LUT3_40

module VMW_LUT3_04(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = (! I0) & I1 & (! I2);

endmodule //VMW_LUT3_20

module VMW_LUT3_10(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = (!I0) & (!I1) & I2;

endmodule //VMW_LUT3_08

module VMW_LUT4_0080(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & I1 & I2 & ( ! I3);

endmodule //VMW_LUT4_0100

module VMW_LUT4_0800(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & I1 & (! I2) & I3;

endmodule //VMW_LUT4_0800

module VMW_LUT4_0008(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & I1 & (! I2) & (! I3);

endmodule //VMW_LUT4_1000

module VMW_LUT4_2000(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & (!I1) & I2 & I3;

endmodule //VMW_LUT4_2000

module VMW_LUT4_0020(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & (! I1) & I2 & (! I3);

endmodule //VMW_LUT4_0020

module VMW_LUT4_0200(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & (!I1) & (! I2) & I3;

endmodule //VMW_LUT4_0200

module VMW_LUT4_0002(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I0 & (!I1) & (!I2) & (!I3);

endmodule //VMW_LUT4_0002

module VMW_LUT4_4000(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & I1 & I2 & I3;

endmodule //VMW_LUT4_4000

module VMW_LUT4_0040(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & I1 & I2 & (!I3);

endmodule //VMW_LUT4_0040

module VMW_LUT4_0400(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & I1 & (!I2) & I3;

endmodule //VMW_LUT4_0400

module VMW_LUT4_0004(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & I1 & (!I2) & (!I3);

endmodule //VMW_LUT4_0004

module VMW_LUT4_1000(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & (!I1) & I2 & I3;

endmodule //VMW_LUT4_1000

module VMW_LUT4_0010(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & (!I1) & I2 & (!I3);

endmodule //VMW_LUT4_0010

module VMW_LUT4_0100(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (!I0) & (!I1) & (!I2) & I3;

endmodule //VMW_LUT4_0080

module VMW_LUT4_27D8(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (I0 & (I1 ^ I3)) | (!I0 & (I2 ^ I3));

endmodule //sLUT4_1A66

module VMW_LUT4_D827(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (I0 & (!I1 ^ I3) ) |  (!I0 & (!I2 ^ I3));

endmodule //VMW_LUT4_D827

module VMW_LUT3_AC(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = (I2 & I0) | ((!I2) & I1);

endmodule //VMW_LUT3_AC

module VMW_LUT1_2(O,I0);
output O;
input I0;

assign O = I0;

endmodule //VMW_LUT1_2

module VMW_LUT2_9(O,I0,I1);
output O;
input I0;
input I1;

assign O = (!I0) ^ I1;

endmodule //VMW_LUT2_9

module VMW_LUT3_78(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = (I0 & I1 ) ^ I2;

endmodule //VMW_LUT3_78

module VMW_LUT3_87(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = (I0 & I1 ) ^ (!I2);

endmodule //VMW_LUT3_87

module VMW_LUT3_B4(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = ((!I0) & I1 ) ^ I2;

endmodule //VMW_LUT3_B4

module VMW_LUT3_08(O,I0,I1,I2);
output O;
input I2;
input I1;
input I0;

assign O = I0 & I1 & (! I2 );

endmodule //VMW_LUT3_08

module VMW_LUT4_7888(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (I0 & I1) ^ (I2 & I3);

endmodule //VMW_LUT4_7888

module VMW_LUT4_B444(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = ((!I0) & I1) ^ (I2 & I3);

endmodule //VMW_LUT4_B444

module VMW_LUT4_B44B(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = ((!I0) & I1) ^ (!I2) ^ I3;

endmodule //VMW_LUT4_B44B

module VMW_LUT4_4F04(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = (((!I0) & I1) & (!I2)) | ((!I2) & I3) | (((!I0) & I1) & I3);

endmodule//VMW_LUT4_4F04

module VMW_LUT4_6996(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;

assign O = I3 ^ I2 ^ I1 ^ I0;

endmodule//VMW_LUT4_6996

module VMW_LUT4_7D28(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;
 
assign O = ( ( (I1 ^ I2) & I0 ) | ( !I0 & I3 ) );
 
endmodule //VMW_LUT4_7D28
 
module VMW_LUT4_D782(O,I0,I1,I2,I3);
output O;
input I3;
input I2;
input I1;
input I0;
 
assign O = ( ( (!I1 ^ I2) & I0 ) | ( !I0 & I3 ) );
 
endmodule //VMW_LUT4_D782
 
// `endif // _RTLC_LUT_V_
