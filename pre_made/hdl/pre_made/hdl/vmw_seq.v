//
// The only primitives that RTLC will infer with -exemplar_eval will be:
// Combinational:
//   not, and, nand, or, nor, xor, xnor, bufif1, pullup, pulldown
// These will be written out as Verilog (built-in) primitives.
// Sequential:
//   VMW_FD, VMW_FDP, VMW_FPC, VMW_FDPC, VMW_FDPC_INIT0,
//   VMW_FDPC_INIT1, VMW_FDE, VMW_FDPE, VMW_FDCE, VMW_FDPCE,
//   VMW_LDN, VMW_LD, VMW_LDP, VMW_LDC, VMW_LDPC, VMW_KEEPER
// These should be read from this file.  Note that we need to have a
// better way of communicating these directly to Precision eliminating
// the need for any flattening.
//

module VMW_FD (Q, D, CP);
   output Q;
   reg    Q;
   input  D, CP;
   always @(posedge CP)
     Q <= D;
endmodule // VMW_FD

module VMW_FDP (Q, D, CP, PRE);
   output Q;
   reg    Q;
   input  D, CP, PRE;
   always @(posedge CP or posedge PRE)
     if (PRE)
       Q <= 1'b1;
     else
       Q <= D;
endmodule // VMW_FDP

module VMW_FDC (Q, D, CP, CLR);
   output Q;
   reg    Q;
   input  D, CP, CLR;
   always @(posedge CP or posedge CLR)
     if (CLR)
       Q <= 1'b0;
     else
       Q <= D;
endmodule // VMW_FDC

module VMW_FDPC (Q, D, CP, PRE, CLR);
   output Q;
   reg    Q;
   input  D, CP, PRE, CLR;
   always @(posedge CP or posedge CLR or posedge PRE)
     if (CLR)
       Q <= 1'b0;
     else if (PRE)
       Q <= 1'b1;
     else
       Q <= D;
endmodule // VMW_FDPC

module VMW_FDSP (Q, D, CP, PRE);
   output Q;
   reg    Q;
   input  D, CP, PRE;
   always @(posedge CP)
     if (PRE)
       Q <= 1'b1;
     else
       Q <= D;
endmodule // VMW_FDSP

module VMW_FDSC (Q, D, CP, CLR);
   output Q;
   reg    Q;
   input  D, CP, CLR;
   always @(posedge CP)
     if (CLR)
       Q <= 1'b0;
     else
       Q <= D;
endmodule // VMW_FDSC

module VMW_FDSPC (Q, D, CP, PRE, CLR);
   output Q;
   reg    Q;
   input  D, CP, PRE, CLR;
   always @(posedge CP)
     if (CLR)
       Q <= 1'b0;
     else if (PRE)
       Q <= 1'b1;
     else
       Q <= D;
endmodule // VMW_FDSPC

module VMW_FDPC_INIT0 (Q, D, CP, PRE, CLR);
   output Q;
   reg    Q;
   input  D, CP, PRE, CLR;
   initial Q = 1'b0;
   always @(posedge CP or posedge CLR or posedge PRE)
     if (CLR)
       Q <= 1'b0;
     else if (PRE)
       Q <= 1'b1;
     else
       Q <= D;
endmodule // VMW_FDPC_INIT0

module VMW_FDPC_INIT1 (Q, D, CP, PRE, CLR);
   output Q;
   reg    Q;
   input  D, CP, PRE, CLR;
   initial Q = 1'b1;
   always @(posedge CP or posedge CLR or posedge PRE)
     if (CLR)
       Q <= 1'b0;
     else if (PRE)
       Q <= 1'b1;
     else
       Q <= D;
endmodule // VMW_FDPC_INIT1

module VMW_FDE (Q, D, CP, CE);
   output Q;
   reg    Q;
   input  D, CP, CE;
   always @(posedge CP)
     if (CE)
       Q <= D;
endmodule // VMW_FDE

module VMW_FDPE (Q, D, CP, PRE, CE);
   output Q;
   reg    Q;
   input  D, CP, PRE, CE;
   always @(posedge CP or posedge PRE)
     if (PRE)
       Q <= 1'b1;
     else if (CE)
       Q <= D;
endmodule // VMW_FDPE

module VMW_FDCE (Q, D, CP, CLR, CE);
   output Q;
   reg    Q;
   input  D, CP, CLR, CE;
   always @(posedge CP or posedge CLR)
     if (CLR)
       Q <= 1'b0;
     else if (CE)
       Q <= D;
endmodule // VMW_FDCE

module VMW_FDPCE (Q, D, CP, PRE, CLR, CE);
   output Q;
   reg    Q;
   input  D, CP, PRE, CLR, CE;
   always @(posedge CP or posedge CLR or posedge PRE)
     if (CLR)
       Q <= 1'b0;
     else if (PRE)
       Q <= 1'b1;
     else if (CE)
       Q <= D;
endmodule // VMW_FDPCE

module VMW_FDSPE (Q, D, CP, PRE, CE);
   output Q;
   reg    Q;
   input  D, CP, PRE, CE;
   always @(posedge CP)
     if (PRE)
       Q <= 1'b1;
     else if (CE)
       Q <= D;
endmodule // VMW_FDSPE

module VMW_FDSCE (Q, D, CP, CLR, CE);
   output Q;
   reg    Q;
   input  D, CP, CLR, CE;
   always @(posedge CP)
     if (CLR)
       Q <= 1'b0;
     else if (CE)
       Q <= D;
endmodule // VMW_FDSCE

module VMW_FDSPCE (Q, D, CP, PRE, CLR, CE);
   output Q;
   reg    Q;
   input  D, CP, PRE, CLR, CE;
   always @(posedge CP)
     if (CLR)
       Q <= 1'b0;
     else if (PRE)
       Q <= 1'b1;
     else if (CE)
       Q <= D;
endmodule // VMW_FDSPCE

module VMW_LDN (Q, D, GN);
   output Q;
   reg    Q;
   input  D, GN;
   always @(D or GN)
     if (! GN)
       Q = D;
endmodule // VMW_LDN

module VMW_LD (Q, D, G);
   output Q;
   reg    Q;
   input  D, G;
   always @(D or G)
     if (G)
       Q = D;
endmodule // VMW_LD

module VMW_LDP (Q, D, G, PRE);
   output Q;
   reg    Q;
   input  D, G, PRE;
   always @(D or G or PRE)
     if (PRE)
       Q = 1'b1;
     else if (G)
       Q = D;
endmodule // VMW_LDP

module VMW_LDC (Q, D, G, CLR);
   output Q;
   reg    Q;
   input  D, G, CLR;
   always @(D or G or CLR)
     if (CLR)
       Q = 1'b0;
     else if (G)
       Q = D;
endmodule // VMW_LDC

module VMW_LDPC (Q, D, G, PRE, CLR);
   output Q;
   reg    Q;
   input  D, G, PRE, CLR;
   always @(D or G or CLR or PRE)
     if (CLR)
       Q = 1'b0;
     else if (PRE)
       Q = 1'b1;
     else if (G)
       Q = D;
endmodule // VMW_LDPC

module VMW_KEEPER (Z);
   inout Z;
   // synopsys translate_off
   trireg keeper;
   tran (Z, keeper);
   // synopsys translate_on
endmodule // VMW_KEEPER

