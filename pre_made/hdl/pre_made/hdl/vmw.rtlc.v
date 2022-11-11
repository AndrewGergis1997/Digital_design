// Start of library vmw.rtlc.v
//
// IKOS RTLC-specific VMW reference library primitive prototypes
//
// This library is a customized version of vmw_reference.v
// 
// Changes done for rtlc-vle:
//
// 1. The following specparams have been added:
//    AREA        (the area cost of the cell)
//    FFCOUNT     (the number of flip-flops in the cell)
//    LATCH       (the number of latches in the cell)
//    SEQ         (the sequential property of the cell)
//    PRIM_FUNC   (the equivalent rtlc unmapped primitive)
//    PRIM_FUNCT  (the equivalent rtlc primitive function)
//    PRIM_PORT_* (the equivalent rtlc primitive ports)
//    PRIM_CP     (the clock port of the cell)
//    PRIM_SET    (the async set/preset port of the cell)
//    PRIM_S_SET  (the sync set/preset port of the cell)
//    PRIM_RESET  (the async reset/clear port of the cell)
//    PRIM_S_RESET(the sync reset/clear port of the cell)
//
// 2. The Z port of VMW_BUFIZ has been changed from inout to output.


// Buffer

macromodule VMW_BUF (Z, A);
  //  function : "A";
  output Z;
  input  A;
  specify
    specparam PRIM_FUNC = "RTL_BUF";
    specparam PRIM_FUNCT = "PRIM_BUF";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "A";
    specparam AREA = 0;
  endspecify
endmodule


// Inverter

macromodule VMW_INV (Z,A);
  //  function : "A'"
  output Z;
  input  A;
  specify
    specparam PRIM_FUNC = "RTL_NOT";
    specparam PRIM_FUNCT = "PRIM_INV";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "A";
    specparam AREA = 0;
  endspecify
endmodule


// And Gates

macromodule VMW_AND2 (Z, A, B);
  //  function : "(AB)";
  output Z;
  input  A,B;
  specify
    specparam PRIM_FUNC = "RTL_AND";
    specparam PRIM_FUNCT = "PRIM_AND";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in1";
    specparam PRIM_PORT_B = "in2";
    specparam AREA = 2;
  endspecify
endmodule

macromodule VMW_AND3 (Z, A, B, C);
  //  function : "(ABC)";
  output Z;
  input  A,B,C;
  specify
    specparam PRIM_FUNCT = "PRIM_AND";
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_AND4 (Z,A,B,C,D);
  //  function : "(ABCD)";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
    specparam PRIM_FUNCT = "PRIM_AND";
  endspecify
endmodule

macromodule VMW_AND5 (Z,A,B,C,D,E);
  //  function : "(ABCDE)";
  output Z;
  input  A,B,C,D,E;
  specify
    specparam AREA = 6;
    specparam PRIM_FUNCT = "PRIM_AND";
  endspecify
endmodule


// Nand Gates

macromodule VMW_NAND2 (Z, A, B);
  //  function : "(AB)'"
  output Z;
  input  A,B;
  specify
    specparam PRIM_FUNC = "RTL_NAND";
    specparam PRIM_FUNCT = "PRIM_NAND";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in1";
    specparam PRIM_PORT_B = "in2";
    specparam AREA = 2;
  endspecify
endmodule

macromodule VMW_NAND3 (Z, A,B,C);
  //  function : "(ABC)'";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_NAND4 (Z,A,B,C,D);
  //  function : "(ABCD)'";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_NAND5 (Z,A,B,C,D,E);
  //  function : "(ABCDE)'";
  output Z;
  input  A,B,C,D,E;
  specify
    specparam AREA = 6;
  endspecify
endmodule


// Or Gates

macromodule VMW_OR2 (Z, A, B);
  //  function : "(A+B)";
  output Z;
  input  A,B;
  specify
    specparam PRIM_FUNC = "RTL_OR";
    specparam PRIM_FUNCT = "PRIM_OR";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in1";
    specparam PRIM_PORT_B = "in2";
    specparam AREA = 2;
  endspecify
endmodule

macromodule VMW_OR3 (Z,A,B,C);
  //  function : "(A+B+C)";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
    specparam PRIM_FUNCT = "PRIM_OR";
  endspecify
endmodule

macromodule VMW_OR4 (Z,A,B,C,D);
  //  function : "(A+B+C+D)";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
    specparam PRIM_FUNCT = "PRIM_OR";
  endspecify
endmodule

macromodule VMW_OR5 (Z,A,B,C,D,E);
  //  function : "(A+B+C+D+E)";
  output Z;
  input  A,B,C,D,E;
  specify
    specparam AREA = 6;
    specparam PRIM_FUNCT = "PRIM_OR";
  endspecify
endmodule


// Nor Gates

macromodule VMW_NOR2 (Z, A, B);
  //  function : "(A+B)'";
  output Z;
  input  A,B;
  specify
    specparam PRIM_FUNC = "RTL_NOR";
    specparam PRIM_FUNCT = "PRIM_NOR";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in1";
    specparam PRIM_PORT_B = "in2";
    specparam AREA = 2;
  endspecify

endmodule

macromodule VMW_NOR3 (Z,A,B,C);
  //  function : "(A+B+C)'";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_NOR4 (Z,A,B,C,D);
  //  function : "(A+B+C+D)'";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_NOR5 (Z, A, B, C, D, E);
  //  function : "(A+B+C+D+E)'";
  output Z;
  input  A, B, C, D, E;
  specify
    specparam AREA = 6;
  endspecify
endmodule


// Xor Gates

macromodule VMW_XOR2 (Z, A, B);
  //  function : "(AB'+ A'B)";
  output Z;
  input  A,B;
  specify
    specparam PRIM_FUNC = "RTL_XOR";
    specparam PRIM_FUNCT = "PRIM_XOR";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in1";
    specparam PRIM_PORT_B = "in2";
    specparam AREA = 2;
  endspecify
endmodule

macromodule VMW_XOR3( Z, A,B,C);
  //  function : "(A'B'C+A'B C'+A B'C'+A B C)";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
    specparam PRIM_FUNCT = "PRIM_XOR";
  endspecify
endmodule

macromodule VMW_XOR4 (Z, A, B, C, D);
  //  function : "((A B)+((C+D)'))'";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
    specparam PRIM_FUNCT = "PRIM_XOR";
  endspecify
endmodule


// Xnor Gates

macromodule VMW_XNOR2 (Z, A, B);
  //  function : "(AB+A'B')";
  output Z;
  input  A,B;
  specify
    specparam PRIM_FUNC = "RTL_XNOR";
    specparam PRIM_FUNCT = "PRIM_XNOR";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in1";
    specparam PRIM_PORT_B = "in2";
    specparam AREA = 2;
  endspecify
endmodule

macromodule VMW_XNOR3( Z, A,B,C);
  //  function : "(A'B'C'+A'B C+A B'C+A B C')";
  output Z;
  input  A, B, C;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_XNOR4 (Z, A, B, C, D);
  //  function : "((A+B)((C D)'))'";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
  endspecify
endmodule


// And-Ors

macromodule VMW_AO21 (Z, A, B, C);
  //  function : "((A B)+C)";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_AO211 (Z, A, B, C, D);
  //  function : "((A B)+C+D)";
  output Z;
  input  A, B, C, D;
  specify
    specparam AREA = 4;
  endspecify
endmodule

macromodule VMW_AO22 (Z, A, B, C, D);
  //  function : "(A B+C D)";
  output Z;
  input  A, B, C, D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_AO222 (Z, A, B, C, D, E,F);
  //  function : "(A B+C D+E F)";
  output Z;
  input  A, B, C, D, E, F;
  specify
    specparam AREA = 6;
  endspecify
endmodule


// And-Or Inverts

macromodule VMW_AOI21 (Z, A, B, C);
  //  function : "((A B)+C)'";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_AOI211 (Z, A, B, C, D);
  //  function : "((A B)+C+D)'";
  output Z;
  input  A, B, C, D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_AOI22 (Z, A, B, C, D);
  //  function : "(A B+C D)'";
  output Z;
  input  A, B, C, D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

module VMW_AOI222 (Z, A, B, C, D, E,F);
  //  function : "(A B+C D+E F)'";
  output Z;
  input  A, B, C, D, E, F;
  specify
    specparam AREA = 7;
  endspecify
endmodule


// Or-And

macromodule VMW_OA31 (Z, A, B, C, D);
  //  function : "((A+B+C)D)";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 4;
  endspecify
endmodule


// Or-And Inverts

macromodule VMW_OAI21 (Z, A, B, C);
  //  function : "((A+B)C)'";
  output Z;
  input  A,B,C;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_OAI211 (Z, A, B, C, D);
  //  function : "((A+B)C D)'";
  output Z;
  input  A, B, C, D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_OAI22 (Z, A, B, C, D);
  //  function : "((A+B)(C+D))'";
  output Z;
  input  A,B,C,D;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_OAI2222 (Z, A, B, C, D, E, F, G, H);
  //  function : "((A+B)(C+D)(E+F)(G+H))'";
  output Z;
  input  A, B, C, D, E, F, G, H;
  specify
    specparam AREA = 9;
  endspecify
endmodule


// 3-input majority gate

macromodule VMW_MAJ3 (Z, A, B, C);
  // function: "((AB)+(AC)+(BC))"
  output Z;
  input  A, B, C;
  specify
    specparam AREA = 3;
  endspecify
endmodule


// Multiplexors

macromodule VMW_MUX2 (Z, A, B, S);
  //  function : "(S'A+S B)";
  output Z;
  input  A, B, S;
  specify
    specparam PRIM_FUNC = "RTL_MUX2";
    specparam PRIM_FUNCT = "PRIM_MUX";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_A = "in0";
    specparam PRIM_PORT_B = "in1";
    specparam PRIM_PORT_S = "sel";
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_MUX2I (Z, A, B, S);
  //  function : "(S'A'+S B')";
  output Z;
  input  A, B, S;
  specify
    specparam AREA = 3;
  endspecify
endmodule

macromodule VMW_MUX21L (Z, A, B, S, SN);
  //  function : "( (A S' SN) + (B S SN') )'";
  output Z;
  input  A, B, S, SN;
  specify
    specparam AREA = 5;
  endspecify
endmodule

macromodule VMW_MUX4 ( Z, A, B, D0, D1, D2, D3);
  //  function : "((D0 A'B')+(D1 A B')+(D2 A'B)+(D3 A B))";
  output Z;
  input  A, B, D0, D1, D2, D3;
  specify
    specparam AREA = 7;
  endspecify
endmodule

macromodule VMW_DEC24L (Z0, Z1, Z2, Z3, A, B);
  //  pin(Z0)  function : "A B' + A' B + A B";
  //  pin(Z1)  function : "A' B' + A' B + A B";
  //  pin(Z2)  function : "A' B' + A B' + A B";
  //  pin(Z3)  function : "A' B' + A B' + A' B";
  output Z0, Z1, Z2, Z3;
  input  A, B;
  specify
    specparam AREA = 6;
  endspecify
endmodule


// Adders

module VMW_FADD ( S, CO, CI, A, B);
  //  pin(S)   function : "CI A' B' + CI' A B' + CI' A' B + CI A B";
  //  pin(CO)  function : "CI A B' + CI A' B + CI' A B + CI A B";
  output S, CO;
  input  CI, A, B;
  specify
    specparam AREA = 6;
  endspecify
endmodule

macromodule VMW_HADD (S, CO, A, B);
  //  pin(S)   function : "A' B +  A B'";
  //  pin(CO)  function : "A B";
  output S, CO;
  input  A, B;
  specify
    specparam AREA = 4;
  endspecify
endmodule


// Flip-flops

// D-flop
macromodule VMW_FD (Q, D, CP);
  output Q;
  input  D, CP;
  specify
    specparam PRIM_FUNC = "RTL_DFF";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam AREA = 8;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

module VMW_FD2 (Q, QN, D, CP);
  output Q, QN;
  input  D, CP;
  specify
    specparam AREA = 8;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with clock enable
macromodule VMW_FDE (Q, D, CP, CE);
  output Q;
  input  D, CP, CE;
  specify
    specparam PRIM_FUNC = "RTL_DFFE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with enable & async preset & clear
macromodule VMW_FDPCE (Q, D, CP, PRE, CLR, CE);
  output Q;
  input  D, CP, PRE, CLR, CE;
  specify
    specparam PRIM_FUNC = "RTL_DFFECP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_SET = "PRE";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Negative-edge D-flop
macromodule VMW_FDN (Q, D, CPN);
  output Q;
  input  D, CPN;
  specify
    specparam PRIM_FUNC = "RTL_DFFN";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CPN";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CPN = "clk";
    specparam AREA = 8;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with async preset
macromodule VMW_FDP (Q, D, CP, PRE);
  output Q;
  input  D, CP, PRE;
  specify
    specparam PRIM_FUNC = "RTL_DFFP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam AREA = 8;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with async preset & clear
macromodule VMW_FDPC (Q, D, CP, PRE, CLR);
  output Q;
  input  D, CP, PRE, CLR;
  specify
    specparam PRIM_FUNC = "RTL_DFFCP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 9;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with async preset & clear, initialized to 0
macromodule VMW_FDPC_INIT0 (Q, D, CP, PRE, CLR);
  output Q;
  input  D, CP, PRE, CLR;
  specify
    specparam PRIM_FUNC = "RTL_POR";
    specparam PRIM_FUNCT = "PRIM_POR";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 9;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with async preset & clear, initialized to 1
macromodule VMW_FDPC_INIT1 (Q, D, CP, PRE, CLR);
  output Q;
  input  D, CP, PRE, CLR;
  specify
    specparam PRIM_FUNC = "RTL_POP";
    specparam PRIM_FUNCT = "PRIM_POP";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 9;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with async preset with Qbar
macromodule VMW_FDP2 (Q, QN, D, CP, S);
  output Q, QN;
  input  D, CP, S;
  specify
    specparam AREA = 8;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with clock enable, async preset
macromodule VMW_FDPE (Q, D, CP, PRE, CE);
  output Q;
  input  D, CP, PRE, CE;
  specify
	specparam PRIM_FUNC = "RTL_DFFEP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with async clear
macromodule VMW_FDC (Q, D, CP, CLR);
  output Q;
  input  D, CP, CLR;
  specify
    specparam PRIM_FUNC = "RTL_DFFC";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 9;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with clock enable, async clear
macromodule VMW_FDCE (Q, D, CP, CLR, CE);
  output Q;
  input  D, CP, CLR, CE;
  specify
    specparam PRIM_FUNC = "RTL_DFFEC";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Synchronous Filp Flops

// D-flop with enable , sync preset & clear
macromodule VMW_FDSPCE (Q, D, CP, PRE, CLR, CE);
  output Q;
  input  D, CP, PRE, CLR, CE;
  specify
    specparam PRIM_FUNC = "RTL_DFFESCP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_SET = "PRE";
    specparam PRIM_S_RESET = "CLR";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// universal flops with differing priorties
macromodule VMW_FDCLPRSE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFECLPRSE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDCLPSRE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFECLPSRE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDCPLRSE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFECPLRSE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDCPLSRE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFECPLSRE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDLCPRSE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFELCPRSE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDLCPSRE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFELCPSRE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDLPCRSE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFELPCRSE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDLPCSRE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFELPCSRE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDPCLRSE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFEPCLRSE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDPCLSRE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFEPCLSRE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDPLCRSE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFEPLCRSE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_FDPLCSRE(Q, D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA);
  output Q;
  input D, CP, PRE, CLR, CE, SET, RESET, LOAD, LDATA;
  specify
    specparam PRIM_FUNC = "RTL_DFFEPLCSRE";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_S_SET = "SET";
    specparam PRIM_S_RESET = "RESET";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_SET = "set";
    specparam PRIM_PORT_RESET = "reset";
    specparam PRIM_PORT_LOAD = "load";
    specparam PRIM_PORT_LDATA = "ldata";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule
// end universal flops

// D-flop with enable , sync preset 
macromodule VMW_FDSPE (Q, D, CP, PRE, CE);
  output Q;
  input  D, CP, PRE, CE;
  specify
    specparam PRIM_FUNC = "RTL_DFFESP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_SET = "PRE";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with enable sync clear
macromodule VMW_FDSCE (Q, D, CP, CLR, CE);
  output Q;
  input  D, CP, CLR, CE;
  specify
    specparam PRIM_FUNC = "RTL_DFFESC";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_RESET = "CLR";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with sync preset & clear
macromodule VMW_FDSPC (Q, D, CP, PRE, CLR);
  output Q;
  input  D, CP, PRE, CLR;
  specify
    specparam PRIM_FUNC = "RTL_DFFSCP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_SET = "PRE";
    specparam PRIM_S_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with sync preset 
macromodule VMW_FDSP (Q, D, CP, PRE);
  output Q;
  input  D, CP, PRE;
  specify
    specparam PRIM_FUNC = "RTL_DFFSP";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// D-flop with sync  clear
macromodule VMW_FDSC (Q, D, CP, CLR);
  output Q;
  input  D, CP, CLR;
  specify
    specparam PRIM_FUNC = "RTL_DFFSC";
    specparam PRIM_FUNCT = "PRIM_FF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "D";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge Flip-flops

// Dual Edge D-flop
macromodule VMW_DDFF (Q, DH, DL, CP);
  output Q;
  input  DH, DL, CP;
  specify
    specparam PRIM_FUNC = "RTL_DDFF";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam AREA = 8;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge D-flop with clock enable
macromodule VMW_DDFFE (Q, DH, DL, CP, CE);
  output Q;
  input  DH, DL, CP, CE;
  specify
    specparam PRIM_FUNC = "RTL_DDFFE";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge D-flop with clock enable
macromodule VMW_DDFFP (Q, DH, DL, CP, PRE);
  output Q;
  input  DH, DL, CP, PRE;
  specify
    specparam PRIM_FUNC = "RTL_DDFFP";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge D-flop with clock enable
macromodule VMW_DDFFC (Q, DH, DL, CP, CLR);
  output Q;
  input  DH, DL, CP, CLR;
  specify
    specparam PRIM_FUNC = "RTL_DDFFC";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

//For Sync DDFF
macromodule VMW_DDFFSPCDE(Q, DH, DL, CP, PRE, PRE1, CLR, CLR1, CE, CE1);
  output Q;
  input  DH, DL, CP, PRE,PRE1, CLR, CLR1, CE, CE1;
  specify
    specparam PRIM_FUNC = "RTL_DDFFSPCDE";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_S_RESET = "CLR";
    specparam PRIM_S_SET = "PRE";
    specparam PRIM_S_RESET1 = "CLR1";
    specparam PRIM_S_SET1 = "PRE1";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_ENABLE_D = "CE1";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_PRE1 = "preset1";
    specparam PRIM_PORT_CLR1 = "clear1";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_CE1 = "enable1";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_DDFFPCDE(Q, DH, DL, CP, PRE, CLR, CE, CE1);
  output Q;
  input  DH, DL, CP, PRE, CLR, CE, CE1;
  specify
    specparam PRIM_FUNC = "RTL_DDFFPCDE";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_SET = "PRE";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_ENABLE_D = "CE1";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam PRIM_PORT_CE1 = "enable1";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

macromodule VMW_DDFFPC (Q, DH, DL, CP, PRE, CLR);
  output Q;
  input  DH, DL, CP, PRE, CLR;
  specify
    specparam PRIM_FUNC = "RTL_DDFFPC";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge D-flop with clock enable
macromodule VMW_DDFFPCE (Q, DH, DL, CP, PRE, CLR, CE);
  output Q;
  input  DH, DL, CP, PRE, CLR, CE;
  specify
    specparam PRIM_FUNC = "RTL_DDFFPCE";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_SET = "PRE";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge D-flop with clock enable
macromodule VMW_DDFFPE (Q, DH, DL, CP, PRE, CE);
   output Q;
   input  DH, DL, CP, PRE, CE;
   specify
    specparam PRIM_FUNC = "RTL_DDFFPE";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_SET = "PRE";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_PRE = "preset";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual Edge D-flop with clock enable
macromodule VMW_DDFFCE (Q, DH, DL, CP, CLR, CE);
   output Q;
   input  DH, DL, CP, CLR, CE;
   specify
    specparam PRIM_FUNC = "RTL_DDFFCE";
    specparam PRIM_FUNCT = "PRIM_DDFF";
    specparam PRIM_CP = "CP";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_ENABLE = "CE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_DH = "DH";
    specparam PRIM_PORT_DL = "DL";
    specparam PRIM_PORT_CP = "clk";
    specparam PRIM_PORT_CLR = "clear";
    specparam PRIM_PORT_CE = "enable";
    specparam AREA = 11;
    specparam FFCOUNT = 1;
    specparam SEQ = 1;
  endspecify
endmodule

// Dual-clocked flop with two inputs, preset and clear
//  at rising edge of CK1, flop latches D1
//  at rising edge of CK1, flop latches D2
//  behavior is undefined for simultaneous rise in CK1 and CK2
module VMW_MC2_FDPC(Q, D1, CP1, D2, CP2, PRE, CLR);
  output Q;
  input  D1, CP1, D2, CP2, PRE, CLR;
  specify
    specparam AREA = 28;
    specparam FFCOUNT = 2;
    specparam SEQ = 1;
  endspecify
endmodule


// Latches

// Positive-enable
macromodule VMW_LD (Q, D, G);
  output Q;
  input  D, G;
  specify
    specparam PRIM_FUNC = "RTL_LATCH"; // active-high enable
    specparam PRIM_FUNCT = "PRIM_LD";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_G = "E";
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_DT_LD (Q, D, G);
  output Q;
  input  D, G;
  specify
    specparam PRIM_FUNC = "RTL_DT_LATCH"; // active-high enable
    specparam PRIM_FUNCT = "PRIM_DT_LD";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_G = "E";
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_LDP (Q, D, G, PRE);
  output Q;
  input  D, G, PRE;
  specify
    specparam PRIM_FUNC = "RTL_LATCH_P";
    specparam PRIM_FUNCT = "PRIM_LD";
    specparam PRIM_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_G = "E";
    specparam PRIM_PORT_PRE = "P";
    specparam AREA = 8;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_LDC (Q, D, G, CLR);
  output Q;
  input  D, G, CLR;
  specify
    specparam PRIM_FUNC = "RTL_LATCH_C";
    specparam PRIM_FUNCT = "PRIM_LD";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_G = "E";
    specparam PRIM_PORT_CLR = "C";
    specparam AREA = 8;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_LDPC (Q, D, G, PRE, CLR);
  output Q;
  input  D, G, PRE, CLR;
  specify
    specparam PRIM_FUNC = "RTL_LATCH_PC";
    specparam PRIM_FUNCT = "PRIM_LDPC";
    specparam PRIM_RESET = "CLR";
    specparam PRIM_SET = "PRE";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_G = "E";
    specparam PRIM_PORT_PRE = "P"; 
    specparam PRIM_PORT_CLR = "C";
    specparam AREA = 8;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

// Negative-enable
macromodule VMW_LDN (Q, D, GN);
  output Q;
  input  D, GN;
  specify
    specparam PRIM_FUNC = "RTL_LATCHN"; // active-low enable
    specparam PRIM_FUNCT = "PRIM_LDN";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_GN = "E";
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_DT_LDN (Q, D, GN);
  output Q;
  input  D, GN;
  specify
    specparam PRIM_FUNC = "RTL_DT_LATCHN"; // active-low enable
    specparam PRIM_FUNCT = "PRIM_DT_LDN";
    specparam PRIM_PORT_Q = "Z";
    specparam PRIM_PORT_D = "A";
    specparam PRIM_PORT_GN = "E";
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_LD2 (Q, QN, D, G);
  output Q, QN;
  input  D, G;
  specify
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_LDN2 (Q, QN, D, GN);
  output Q, QN;
  input  D, GN;
  specify
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule

macromodule VMW_LD2G (Q, D0, G0, D1, G1);
  output Q;
  input  D0, G0, D1, G1;
  specify
    specparam AREA = 7;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule


// Pads

// Internal tristate driver
macromodule VMW_BUFIZ (Z, E, A);
  output  Z;  // was inout; changed to output for rtlc-vle
  input  E, A;
  specify
    specparam PRIM_FUNC = "RTL_TRI";
    specparam PRIM_FUNCT = "PRIM_TRI";
    specparam PRIM_PORT_Z = "Z";
    specparam PRIM_PORT_E = "enable";
    specparam PRIM_PORT_A = "A";
    specparam AREA = 3;
    specparam SEQ = 1;
  endspecify
endmodule

// Tristateable output pad
macromodule VMW_OBUFZ (Z, E, A);
  inout  Z;
  input  E, A;
  specify
    specparam AREA = 3;
    specparam SEQ = 1;
  endspecify
endmodule

// Input pad
macromodule VMW_IBUF (Z, A);
  output Z;
  input  A;
  specify
    specparam AREA = 0;
  endspecify
endmodule

// Output pad
macromodule VMW_OBUF (Z, A);
  output Z;
  input  A;
  specify
    specparam AREA = 0;
  endspecify
endmodule


// Pullup/pulldown: can be used on pads, internal tristate busses,
// and undriven nets to set default behavior

macromodule VMW_PULLUP (Z);
  inout  Z;
  specify
    specparam PRIM_FUNC = "RTL_PULLUP";
    specparam PRIM_FUNCT = "PRIM_PULLUP";
    specparam PRIM_PORT_Z = "Z";
    specparam AREA = 1;
  endspecify
endmodule

macromodule VMW_PULLDOWN (Z);
  inout  Z;
  specify
    specparam PRIM_FUNC = "RTL_PULLDOWN";
    specparam PRIM_FUNCT = "PRIM_PULLDOWN";
    specparam PRIM_PORT_Z = "Z";
    specparam AREA = 1;
  endspecify
endmodule


// Internal tristate bus state preserver

macromodule VMW_KEEPER (Z);
  inout  Z;
  specify
    specparam PRIM_FUNC = "RTL_KEEPER";
    specparam PRIM_FUNCT = "PRIM_KEEPER";
    specparam PRIM_PORT_Z = "Z";
    specparam AREA = 1;
  endspecify
endmodule


macromodule VMW_DGATE (Q, D, A);
  output Q;
  input  D, A;
  specify
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule // VMW_DGATE

// This is same as the VMW_DGATE above
macromodule TIP_DGATE (Q, D, A);
  output Q;
  input  D, A;
  specify
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule // TIP_DGATE

macromodule TIP_BIGATE(O, OE, I, IS, BI);
  output O, OE;
  input  I, IS;
  inout  BI;
  specify
    specparam AREA = 5;
    specparam SEQ = 1;
    specparam LATCH = 1;
  endspecify
endmodule // TIP_BIGATE


module VMW_RTL_BUF16(Z, A);
  output [15:0] Z;
  input [15:0]  A;
  specify
    specparam AREA = 0;
  endspecify
endmodule // VMW_RTL_BUF16


module VMW_RTL_FD16(Q, D, CP);
  output [15:0] Q;
  input [15:0]  D;
  input         CP;
  specify
    specparam AREA = 64;
    specparam FFCOUNT = 16;
    specparam SEQ = 1;
  endspecify
endmodule // VMW_RTL_FD16

//
// Xilinx Virtex primitives
//

macromodule VMW_MUXF5 (O, I0, I1, S);
output O;
input  I0, I1, S;
specify
  specparam PRIM_FUNCT = "PRIM_MUXF5";
  specparam AREA = 0;
endspecify
endmodule // VMW_MUXF5

macromodule VMW_MUXF6 (O, I0, I1, S);
output O;
input  I0, I1, S;
specify
  specparam PRIM_FUNCT = "PRIM_MUXF6";
  specparam AREA = 0;
endspecify
endmodule // VMW_MUXF6

macromodule VMW_MUXCY (O, DI, CI, S);
output O;
input DI;
input CI;
input S;
specify
  specparam PRIM_FUNCT = "PRIM_MUXCY";
  specparam AREA = 0;
endspecify
endmodule // VMW_MUXCY

macromodule VMW_MUXCY_L (LO, DI, CI, S);
output LO;
input CI;
input DI;
input S;
specify
  specparam PRIM_FUNCT = "PRIM_MUXCY_L";
  specparam AREA = 0;
endspecify
endmodule // VMW_MUXCY_L

macromodule VMW_XORCY (O, LI, CI);
output O;
input CI;
input LI;
specify
  specparam PRIM_FUNCT = "PRIM_XORCY";
  specparam AREA = 0;
endspecify
endmodule // VMW_XORCY

macromodule VMW_MULT_AND (LO, I0, I1);
output LO;
input I0,I1;
specify
  specparam PRIM_FUNCT = "PRIM_MULT_AND";
  specparam AREA = 0;
endspecify
endmodule // VMW_MULT_AND

// End of library vmw.rtlc.v
