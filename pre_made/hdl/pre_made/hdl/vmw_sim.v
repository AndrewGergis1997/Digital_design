/* Library:  VMW (from IKOS)
 * This library contains the simulation behavior for VMW library cells
 * All cells are modelled as 0-delay cells.
 */

// Buffer

`celldefine
module VMW_BUF (Z, A);
    output Z;
    input A;

	// buf ( Z, A );
    assign Z = A;
endmodule


// Inverter

module VMW_INV (Z,A);
    output Z;
    input  A;

	not (Z, A);
endmodule


// And Gates

module VMW_AND2 (Z, A, B);
    output Z;
    input A,B;

    and (Z, A, B);
endmodule

module VMW_AND3 (Z, A, B, C);
    output  Z;
    input   A,B,C;

    and (Z, A, B, C);
endmodule

module VMW_AND4 (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    and (Z, A, B, C, D);
endmodule


module VMW_AND5 (Z,A,B,C,D,E);
    output  Z;
    input   A,B,C,D,E;

    and (Z, A, B, C, D, E);
endmodule


// Nand Gates

module VMW_NAND2 (Z, A, B);
    output Z;
    input A,B;

    nand (Z, A, B);
endmodule

module VMW_NAND3 (Z, A,B,C);
    output  Z;
    input   A,B,C;

    nand (Z, A, B, C);
endmodule

module VMW_NAND4 (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    nand (Z, A, B, C, D);
endmodule

module VMW_NAND5 (Z,A,B,C,D,E);
    output  Z;
    input   A,B,C,D,E;

    nand (Z, A, B, C, D, E);
endmodule


// Or Gates

module VMW_OR2 (Z, A, B);
    output Z;
    input A,B;

    or (Z, A, B);
endmodule

module VMW_OR3 (Z,A,B,C);
    output  Z;
    input   A,B,C;

    or (Z, A, B, C);
endmodule

module VMW_OR4 (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    or (Z, A, B, C, D);
endmodule

module VMW_OR5 (Z,A,B,C,D,E);
    output  Z;
    input   A,B,C,D,E;

    or (Z, A, B, C, D, E);
endmodule


// Nor Gates

module VMW_NOR2 (Z, A, B);
    output Z;
    input A,B;

    nor (Z, A, B);
endmodule

module VMW_NOR3 (Z,A,B,C);
    output  Z;
    input   A,B,C;

    nor (Z, A, B, C);
endmodule

module VMW_NOR4 (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    nor (Z, A, B, C, D);
endmodule

module VMW_NOR5 (Z, A, B, C, D, E);
    output  Z;
    input   A, B, C, D, E;

    nor (Z, A, B, C, D, E);
endmodule


// Xor Gates

module VMW_XOR2 (Z, A, B);
    output  Z;
    input   A,B;

    xor (Z, A, B);
endmodule

module VMW_XOR3( Z, A,B,C);
    output Z;
    input A,B,C;

    xor (Z, A, B, C);
endmodule

module VMW_XOR4 (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    xor (Z, A, B, C, D);
endmodule


// Xnor Gates

module VMW_XNOR2 (Z, A, B);
    output Z;
    input  A,B;

    xnor (Z, A, B);
endmodule

module VMW_XNOR3( Z, A,B,C);
    output Z;
    input A, B, C;

    xnor (Z, A, B, C);
endmodule


module VMW_XNOR4 (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    xnor (Z, A, B, C, D);
endmodule


// And-Ors

module VMW_AO21 (Z, A, B, C);
    output Z;
    input A,B,C;

    and g1(t, A, B);
    or g2(Z, t, C);
endmodule

module VMW_AO211 (Z, A, B, C, D);
    output Z;
    input A, B, C, D;

    and g1(t, A, B);
    or g2(Z, t, C, D);
endmodule

module VMW_AO22 (Z, A, B, C, D);
    output Z;
    input  A, B, C, D; 

    and o1(t1, A, B);
    and o2(t2, C, D);
    or g1(Z, t1, t2);
endmodule

module VMW_AO222 (Z, A, B, C, D, E,F);
    output Z;
    input  A, B, C, D, E, F; 

    and o1(t1, A, B),
        o2(t2, C, D),
	o3(t3, E, F);
    or g1(Z, t1, t2, t3);
endmodule


// And-Or Inverts

module VMW_AOI21 (Z, A, B, C);
    output Z;
    input A,B,C;

    and g1(t, A, B);
    nor g2(Z, t, C);
endmodule

module VMW_AOI211 (Z, A, B, C, D);
    output Z;
    input A, B, C, D;

    and g1(t, A, B);
    nor g2(Z, t, C, D);
endmodule

module VMW_AOI22 (Z, A, B, C, D);
    output Z;
    input  A, B, C, D; 

    and o1(t1, A, B),
        o2(t2, C, D);
    nor g1(Z, t1, t2);
endmodule

module VMW_AOI222 (Z, A, B, C, D, E,F);
    output Z;
    input  A, B, C, D, E, F; 

    VMW_AND2 o1(.Z(t1), .A(C), .B(D)), o2(.Z(t2), .A(E), .B(F));
    VMW_AOI211 g1(.Z(Z), .A(A), .B(B), .C(t1), .D(t2));
endmodule

// Or-And
module VMW_OA31 (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    or g1(t, A, B, C);
    and g2(Z, t, D);
endmodule


// Or-And Inverts

module VMW_OAI21 (Z, A, B, C);
    output Z;
    input A,B,C;

    or g1(t, A, B);
    nand g2(Z, t, C);
endmodule

module VMW_OAI211 (Z, A, B, C, D);
    output Z;
    input A, B, C, D;

    or g1(t, A, B);
    nand g2(Z, t, C, D);
endmodule

module VMW_OAI22 (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    or o1(t1, A, B),
       o2(t2, C, D);
    nand g1(Z, t1, t2);
endmodule

// 3-input majority gate
module VMW_MAJ3 (Z, A, B, C);
    output Z;
    input A, B, C;

    and a1 (t1, A, B);
    and a2 (t2, A, C);
    and a3 (t3, B, C);
    or o1 (Z, t1, t2, t3);
endmodule

// Multiplexors

module VMW_PRIM_MUX1 (Q, S, A, B);
    output Q;
    input S, A, B;
    reg Q;

    always @(S or A or B)
      if(!S)
         Q = A;
      else
         Q = B;
endmodule

 
// simulation udps are used to deal gracefully with undefined selects
/* Vipul -->Synopsys Problem
primitive VMW_PRIM_MUX1 (Q, S, A, B);
    output Q; 
    input S, A, B;

    table
//      S  A  B    Q
        0  0  ?  : 0 ;
        0  1  ?  : 1 ;
        0  x  ?  : x ;
        1  ?  0  : 0 ;
        1  ?  1  : 1 ;
        1  ?  x  : x ;
        x  0  0  : 0 ; // reducing pessimism...
        x  1  1  : 1 ;

    endtable
endprimitive

primitive VMW_PRIM_MUX4 (Z, A, B, D0, D1, D2, D3);
    output Z;
    input A, B, D0, D1, D2, D3;
    
    table   
//      A  B  D0  D1  D2  D3   Z
        0  0  1   ?   ?   ?  : 1  ;
        0  0  0   ?   ?   ?  : 0  ;
        0  0  x   ?   ?   ?  : x  ;
        1  0  ?   1   ?   ?  : 1  ;
        1  0  ?   0   ?   ?  : 0  ;
        1  0  ?   x   ?   ?  : x  ;
        0  1  ?   ?   1   ?  : 1  ;
        0  1  ?   ?   0   ?  : 0  ;
        0  1  ?   ?   x   ?  : x  ;
        1  1  ?   ?   ?   1  : 1  ;
        1  1  ?   ?   ?   0  : 0  ;
        1  1  ?   ?   ?   x  : x  ;
        x  0  1   1   ?   ?  : 1  ; // reducing pessimism...
        x  0  0   0   ?   ?  : 0  ;
        x  1  ?   ?   1   1  : 1  ;
        x  1  ?   ?   0   0  : 0  ;
        0  x  1   ?   1   ?  : 1  ;
        0  x  0   ?   0   ?  : 0  ;
        1  x  ?   1   ?   1  : 1  ;
        1  x  ?   0   ?   0  : 0  ;
        x  x  0   0   0   0  : 0  ;
        x  x  1   1   1   1  : 1  ;
    endtable
endprimitive
*/

module VMW_PRIM_MUX4 (Z, A, B, D0, D1, D2, D3);
    output Z;
    input A, B, D0, D1, D2, D3;
    reg Z;

    always @(A or B or D0 or D1 or D2 or D3)
    begin
      if(!A)
      begin
        if(!B)
          Z = D0;
        else
          Z = D2;
      end
      else
      begin
        if(!B)
           Z = D1;
        else
           Z = D3;
       end
    end
endmodule
module VMW_MUX2 (Z, A, B, S);
    output Z;
    input A, B, S;

    VMW_PRIM_MUX1 g1(Z, S, A, B);
endmodule

module VMW_MUX2I (Z, A, B, S);
    output Z;
    input A, B, S;

    not g1(Z, z_);
    VMW_PRIM_MUX1 g2(z_, S, A, B);
endmodule

module VMW_MUX21L (Z, A, B, S, SN);
    output Z;
    input A, B, S, SN;

    not g1 (z1, S);
    not g2 (z2, SN);
    nand g3 (z3, A, z1, SN);
    nand g4 (z4, B, S, z2);
    and g5 (Z, z3, z4);
endmodule

module VMW_MUX4 ( Z, A, B, D0, D1, D2, D3);
    output Z;
    input  A, B, D0, D1, D2, D3;

    VMW_PRIM_MUX4 u1( Z, A, B, D0, D1, D2, D3);
endmodule

module VMW_OAI2222 (Z, A, B, C, D, E, F, G, H);
    output Z;
    input A, B, C, D, E, F, G, H;

    or g1 ( z1, A, B),
       g2 ( z2, C, D),
       g3 ( z3, E, F),
       g4 ( z4, G, H);
    nand g5 (Z, z1, z2, z3, z4);
endmodule
    
module VMW_DEC24L (Z0, Z1, Z2, Z3, A, B);
    output Z0, Z1, Z2, Z3;
    input A, B;

    not g1 (z1, A);
    not g2 (z2, B);

    and g3 (z3, A, z2);
    and g4 (z4, z1, B);
    and g5 (z5, A, B);
    and g6 (z6, z1, z2);

    or g7 (Z0, z3, z4, z5);
    or g8 (Z1, z6, z4, z5);
    or g9 (Z2, z6, z3, z5);
    or g10 (Z3, z6, z3, z4);
endmodule

module VMW_FADD ( S, CO, CI, A, B);
    output S, CO;
    input CI, A, B;

   VMW_MAJ3 maj3 (.Z(CO), .A(A), .B(B), .C(CI));
   VMW_XOR3 xor3 (.Z(S), .A(A), .B(B), .C(CI));


endmodule

module VMW_HADD (S, CO, A, B);
    output S, CO;
    input A, B;

    not g1 ( E, CO);
    and g2 ( S, F, E),
        g3 ( CO, A, B);
    or  g4 ( F, A, B);
endmodule

// Flip-flops
    
/*
primitive VMWS_PRIM_DFF(Q, D, CP, CLR, PRE);
 
    output Q;
    input  D, CP, CLR, PRE;
    reg    Q;
    initial Q = 0;
 
    // Positive edge triggered D flip-flop with active high
    // asynchronous set and clear. Clear dominates.
 
    table
 
    //  D      CP      CLR PRE :   Qt  :   Qt+1
 
        1      (01)    0   ?   :   ?   :   1;  // clocked data
        0      (01)    ?   0   :   ?   :   0;  // clocked data
 
        1       ?      0   *   :   1   :   1;  // pessimism
        ?       0      0   *   :   1   :   1;  // pessimism
        ?       1      0   *   :   1   :   1;  // pessimism

        0       ?      *   0   :   0   :   0;  // pessimism
        ?       0      *   0   :   0   :   0;  // pessimism
        ?       1      *   0   :   0   :   0;  // pessimism
 
        1       p      0   0   :   1   :   1;  // reducing pessimism
        0       p      0   0   :   0   :   0;
 
        ?       ?      1   ?   :   ?   :   0;  // asynchronous clear
        ?       ?      0   1   :   ?   :   1;  // asynchronous set
 
        ?      (?0)    ?   ?   :   ?   :   -;  // ignore falling clock
        0      (?x)    ?   ?   :   0   :   -;  // retain state when D == Qt
        1      (?x)    ?   ?   :   1   :   -;  // retain state when D == Qt
        *       1      ?   ?   :   ?   :   -;  // ignore data edges
        *       0      ?   ?   :   ?   :   -;  // ignore data edges
 
   endtable
endprimitive
*/

module VMWS_PRIM_DFF(Q, D, CP, CD, SD);
 
    output Q;
    input  D, CP, CD, SD;

    reg Q;

    always @(posedge CP or posedge CD or posedge SD)
	begin
		if (CD)
			Q = 1'b0;
        else if (SD)
			Q = 1'b1;
	    else 
			Q = D;
    end
endmodule

module VMWS_PRIM_DFFE(Q, CE, D, CP, CD, SD);
 
    output Q;
    input  CE, D, CP, CD, SD;

    
    VMW_PRIM_MUX1 g1(Din, CE, Q, D);
    VMWS_PRIM_DFF g2 (Q, Din, CP, CD, SD);

endmodule

// d-flop
module VMW_FD (Q, D, CP);
    output Q;
    input D, CP;

	parameter init_val = 1'bx;

    reg Q;

//synopsys translate_off
	initial
	begin
		Q = init_val;
	end
//synopsys translate_on
    always @(posedge CP)
	begin
		Q = D;
    end

endmodule 

module VMW_FD2 (Q, QN, D, CP);
    output Q, QN;
    input D, CP;

    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, 1'b0);
    not g2 (QN, Q);

endmodule 

// d-flop w/clock enable
module VMW_FDE (Q, D, CP, CE);
    output Q;
    input D, CP, CE;

    VMWS_PRIM_DFFE g1 (Q, CE, D, CP, 1'b0, 1'b0);
endmodule

// negative-edge d-flop
module VMW_FDN (Q, D, CPN);
    output Q;
    input D, CPN;

    VMWS_PRIM_DFF g1 (Q, D, cp, 1'b0, 1'b0);
    not g2 (cp, CPN);

endmodule

// d-flop w/async preset
module VMW_FDP (Q, D, CP, PRE);
    output Q;
    input D, CP, PRE;

    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, PRE);
endmodule

//d-flop w/async preset & clear
module VMW_FDPC (Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;

    VMWS_PRIM_DFF g1 (Q, D, CP, CLR, PRE);
endmodule

//d-flop w/async preset & clear & an enable
module VMW_FDPCE (Q, D, CP, PRE, CLR, CE);
    output Q;
    input D, CP, PRE, CLR, CE;
    wire X;

    VMW_MUX2 mux (.Z(X), .A(Q), .B(D), .S(CE));
    VMW_FDPC fdpc (.Q(Q), .D(X), .CP(CP), .PRE(PRE), .CLR(CLR)); 
endmodule

// d-flop w/async preset w/Qbar
module VMW_FDP2 (Q, QN, D, CP, S);
    output Q, QN;
    input D, CP, S;

    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, S);
    not g2 (QN, Q);

endmodule 

// d-flop w/clock enable, async preset
module VMW_FDPE (Q, D, CP, CE, PRE);
    output Q;
    input D, CP, CE, PRE;

    VMWS_PRIM_DFFE g1 (Q, CE, D, CP, 1'b0, PRE);
endmodule

// d-flop w/async clear
module VMW_FDC (Q, D, CP, CLR);
    output Q;
    input D, CP, CLR;

    VMWS_PRIM_DFF g1 (Q, D, CP, CLR, 1'b0);
endmodule

// d-flop w/clock enable, async clear
module VMW_FDCE (Q, D, CP, CE, CLR);
    output Q;
    input D, CP, CE, CLR;

    VMWS_PRIM_DFFE g1 (Q, CE, D, CP, CLR, 1'b0);
endmodule


// Latches

module VMWS_PRIM_LATCH (Q, G, D, CLR, PRE);
output Q;
input G, D, CLR, PRE;

reg Q;

    always @(G or D or CLR or PRE)
    begin
        if (CLR) 
            Q = 1'b0;
        else if (PRE) 
            Q = 1'b1;
        else if (G) 
            Q = D;
        else
            Q = Q; // hold the value
    end
endmodule
        

// positive-enable
module VMW_LD (Q, D, G);
    output Q;
    input D, G;

    VMWS_PRIM_LATCH g1 (Q, G, D, 1'b0, 1'b0);
endmodule

module VMW_LDP (Q, D, G, PRE);
    output Q;
    input D, G, PRE;

    VMWS_PRIM_LATCH g1 (Q, G, D, 1'b0, PRE);
endmodule

module VMW_LDC (Q, D, G, CLR);
    output Q;
    input D, G, CLR;

    VMWS_PRIM_LATCH g1 (Q, G, D, CLR, 1'b0);
endmodule

module VMW_LDPC (Q, D, G, PRE, CLR);
    output Q;
    input D, G, PRE, CLR;

    VMWS_PRIM_LATCH g1 (Q, G, D, CLR, PRE);
endmodule

// negative-enable
module VMW_LDN (Q, D, GN);
    output Q;
    input  D, GN;

    VMWS_PRIM_LATCH g1 (Q, g, D, 1'b0, 1'b0);
    not g2 (g, GN);

endmodule

module VMW_LD2 (Q, QN, D, G);
    output Q, QN;
    input D, G;

    VMWS_PRIM_LATCH g1 (Q, G, D, 1'b0, 1'b0);
    not g2(QN, Q);

endmodule

module VMW_LDN2(Q, QN, D, GN);
    output Q, QN;
    input D, GN;

    VMWS_PRIM_LATCH g1 (Q, g, D, 1'b0, 1'b0);
    not g2(g, GN);
    not g3(QN, Q);

endmodule


// Pads

// internal tristate driver
module VMW_BUFIZ (Z, E, A);
    output Z;
    input E, A;

    bufif1 (Z, A, E);
endmodule

// tristateable output pad
module VMW_OBUFZ (Z, E, A);
    inout Z;
    input E, A;

    bufif1 (Z, A, E);
endmodule

// input pad
module VMW_IBUF (Z, A);
    output Z;
    input A;

    buf (Z, A);
endmodule


// output pad
module VMW_OBUF (Z, A);
    output Z;
    input A;

    buf (Z, A);
endmodule


// pullup/pulldown: can be used on pads, internal tristate busses,
// and undriven nets to set default behavior

module VMW_PULLUP (Z);
    inout Z;

//synopsys translate_off
    pullup(Z);
//synopsys transalte_on
endmodule

module VMW_PULLDOWN (Z);
 inout Z;

//synopsys translate_off

    pulldown(Z);
//synopsys transalte_on
endmodule



// internal tristate bus state preserver

module VMW_KEEPER (Z);
    inout Z;

//synopsys translate_off
    trireg keeper;
    tran(Z, keeper);
//synopsys translate_on
endmodule


module VMW_FDPC_INIT1 (Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;
    reg Q;

//ikos translate_off
        initial
        begin
            Q = 1;
        end
//ikos translate_on
    always @(posedge CP or posedge CLR or posedge PRE)
    begin
        if (CLR)
            Q <= 1'b0;
        else if (PRE)
            Q <= 1'b1;
        else
            Q <= D;
    end

endmodule

module VMW_FDPC_INIT0 (Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;
    reg Q;

//ikos translate_off
        initial
        begin
            Q = 0;
        end
//ikos translate_on
    always @(posedge CP or posedge CLR or posedge PRE)
    begin
        if (CLR)
            Q <= 1'b0;
        else if (PRE)
            Q <= 1'b1;
        else
            Q <= D;
    end

endmodule

//
// Xilinx Virtex primitives
//

module VMW_MUXF5 (O, I0, I1, S);
//  function : "(S'I0+S I1)";
output O;
input  I0, I1, S;
VMW_MUX2 mux2 (.Z(O), .A(I0), .B(I1), .S(S));
endmodule

module VMW_MUXF6 (O, I0, I1, S);
//  function : "(S'I0+S I1)";
output O;
input  I0, I1, S;
VMW_MUX2 mux2 (.Z(O), .A(I0), .B(I1), .S(S));
endmodule

module VMW_MUXCY(O,DI,CI,S);
output O;
input DI;
input CI;
input S;
VMW_MUX2 mux2 (.Z(O), .A(DI), .B(CI), .S(S));
endmodule//VMW_MUXCY

module VMW_MUXCY_L(LO,DI,CI,S);
output LO;
input CI;
input DI;
input S;
VMW_MUX2 mux2 (.Z(LO), .A(DI), .B(CI), .S(S));
endmodule//VMW_MUXCY_L

module VMW_XORCY(O,LI,CI);
output O;
input CI;
input LI;
VMW_XOR2 xor2 (.Z(O), .A(LI), .B(CI));
endmodule//VMW_XORCY

module VMW_MULT_AND(LO,I0,I1);
output LO;
input I0,I1;
VMW_AND2 and2 (.Z(LO), .A(I0), .B(I1));
endmodule //VMW_MULT_AND

`endcelldefine

