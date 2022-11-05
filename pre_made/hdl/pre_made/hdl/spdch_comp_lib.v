
module spdch_an2(i1,i2,o);
input	i1;
input	i2;
output	o;
assign o = i1 & i2;
endmodule

module spdch_an2_v(i1,i2,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
output	[width-1:0]	o;
assign	o = i1 & i2;
endmodule

module spdch_an3(i1,i2,i3,o);
input	i1;
input	i2;
input	i3;
output	o;
assign o = i1 & i2 & i3;
endmodule

module spdch_an3_v(i1,i2,i3,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
output	[width-1:0]	o;
assign	o = i1 & i2 & i3;
endmodule

module spdch_an4(i1,i2,i3,i4,o);
input	i1;
input	i2;
input	i3;
input	i4;
output	o;
assign o = i1 & i2 & i3 & i4;
endmodule

module spdch_an4_v(i1,i2,i3,i4,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
input	[width-1:0]	i4;
output	[width-1:0]	o;
assign	o = i1 & i2 & i3 & i4;
endmodule

module spdch_d12h(a,z0,z1);
output 	z0,z1;
input 	a;
assign 	z0 = (a==1'b0) ? 1'b1 : 1'b0,
	z1 = (a==1'b1) ? 1'b1 : 1'b0;
endmodule

module spdch_d12l(a,z0,z1);
output 	z0,z1;
input 	a;
assign 	z0 = (a==1'b0) ? 1'b0 : 1'b1,
	z1 = (a==1'b1) ? 1'b0 : 1'b1;
endmodule

module spdch_d24h(a,b,z0,z1,z2,z3);
output 	z0,z1,z2,z3;
input 	a,b;
assign 	z0 = ({a,b}==2'b00) ? 1'b1 : 1'b0,
	z1 = ({a,b}==2'b01) ? 1'b1 : 1'b0,
	z2 = ({a,b}==2'b10) ? 1'b1 : 1'b0,
	z3 = ({a,b}==2'b11) ? 1'b1 : 1'b0;
endmodule

module spdch_d24l(a,b,z0,z1,z2,z3);
output 	z0,z1,z2,z3;
input 	a,b;
assign 	z0 = ({a,b}==2'b00) ? 1'b0 : 1'b1,
	z1 = ({a,b}==2'b01) ? 1'b0 : 1'b1,
	z2 = ({a,b}==2'b10) ? 1'b0 : 1'b1,
	z3 = ({a,b}==2'b11) ? 1'b0 : 1'b1;
endmodule

module spdch_d38h(a,b,c,z0,z1,z2,z3,z4,z5,z6,z7);
output 	z0,z1,z2,z3,z4,z5,z6,z7;
input 	a,b,c;
assign 	z0 = ({a,b,c}==3'b000) ? 1'b1 : 1'b0,
	z1 = ({a,b,c}==3'b001) ? 1'b1 : 1'b0,
	z2 = ({a,b,c}==3'b010) ? 1'b1 : 1'b0,
	z3 = ({a,b,c}==3'b011) ? 1'b1 : 1'b0,
	z4 = ({a,b,c}==3'b100) ? 1'b1 : 1'b0,
	z5 = ({a,b,c}==3'b101) ? 1'b1 : 1'b0,
	z6 = ({a,b,c}==3'b110) ? 1'b1 : 1'b0,
	z7 = ({a,b,c}==3'b111) ? 1'b1 : 1'b0;
endmodule

module spdch_d38l(a,b,c,z0,z1,z2,z3,z4,z5,z6,z7);
output 	z0,z1,z2,z3,z4,z5,z6,z7;
input 	a,b,c;
assign 	z0 = ({a,b,c}==3'b000) ? 1'b0 : 1'b1,
	z1 = ({a,b,c}==3'b001) ? 1'b0 : 1'b1,
	z2 = ({a,b,c}==3'b010) ? 1'b0 : 1'b1,
	z3 = ({a,b,c}==3'b011) ? 1'b0 : 1'b1,
	z4 = ({a,b,c}==3'b100) ? 1'b0 : 1'b1,
	z5 = ({a,b,c}==3'b101) ? 1'b0 : 1'b1,
	z6 = ({a,b,c}==3'b110) ? 1'b0 : 1'b1,
	z7 = ({a,b,c}==3'b111) ? 1'b0 : 1'b1;
endmodule

module spdch_en(i1,i2,o);
input	i1;
input	i2;
output	o;
assign o = ~(i1 ^ i2);
endmodule

module spdch_en_v(i1,i2,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
output	[width-1:0]	o;
assign	o = ~(i1 ^ i2);
endmodule

module spdch_eo(i1,i2,o);
input	i1;
input	i2;
output	o;
assign o = i1 ^ i2;
endmodule

module spdch_eo_v(i1,i2,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
output	[width-1:0]	o;
assign	o = i1 ^ i2;
endmodule

module spdch_fa(ci,co,a,b,y);
input	a;
input	b;
input	ci;
output	y;
output	co;
assign    {co, y} =  a + b + ci;
endmodule

module spdch_fd1(ck,d,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,d;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck)
	qt = d;
endmodule

module spdch_fd1_v(ck,d,qn,q);
parameter width = 1;
output	[width-1:0]	qn,q;
reg	[width-1:0]	qt;
input	[width-1:0]	d;
input	ck;
wire	[width-1:0]	qn = ~qt;
wire	[width-1:0]	q = qt;

always @(posedge ck)
	qt = d;
endmodule

module spdch_fd2(rn,ck,d,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,d,rn;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck or negedge rn)
	if (rn==1'b0)
		qt = 1'b0;
	else
		qt = d;
endmodule

module spdch_fd2_v(rn,ck,d,qn,q);
parameter width = 1;
output	[width-1:0]	qn,q;
reg	[width-1:0]	qt;
input	[width-1:0]	d;
input 	ck,rn;
wire	[width-1:0]	qn = ~qt;
wire	[width-1:0]	q = qt;

always @(posedge ck or negedge rn)
	if (rn==1'b0)
		qt = 'b0;
	else
		qt = d;
endmodule

module spdch_fd3(sn,ck,d,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,d,sn;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck or negedge sn)
	if (sn==1'b0)
		qt = 1'b1;
	else
		qt = d;
endmodule

module spdch_fd3_v(sn,ck,d,qn,q);
parameter width = 1;
output	[width-1:0]	qn,q;
reg	[width-1:0]	qt;
input	[width-1:0]	d;
input 	ck,sn;
wire	[width-1:0]	qn = ~qt;
wire	[width-1:0]	q = qt;

always @(posedge ck or negedge sn)
	if (sn==1'b0)
		qt = ~ 'b0;
	else
		qt = d;
endmodule

module spdch_fd4(sn,rn,ck,d,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,d,rn,sn;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck or negedge sn or negedge rn)
	if (rn==1'b0)
		qt = 1'b0;
	else if (sn==1'b0)
		qt = 1'b1;
	else
		qt = d;
endmodule

module spdch_fd4_v(sn,rn,ck,d,qn,q);
parameter width = 1;
output	[width-1:0]	qn,q;
reg	[width-1:0]	qt;
input	[width-1:0]	d;
input 	ck,rn,sn;
wire	[width-1:0]	qn = ~qt;
wire	[width-1:0]	q = qt;

always @(posedge ck or negedge rn or negedge sn)
	if (rn==1'b0)
		qt = 'b0;
	else if (sn==1'b0)
		qt = ~ 'b0;
	else
		qt = d;
endmodule

module spdch_fjk1(ck,j,k,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,j,k;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck)
	if (k==1 && j==0)
		qt = 1'b0;
	else if (k==0 && j==1)
		qt = 1'b1;
	else if (k==1 && j==1)
		qt = ~qt;
endmodule

module spdch_fjk2(rn,ck,j,k,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,j,k,rn;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck or negedge rn)
	if (rn==0)
		qt = 1'b0;
	else
	begin
		if (k==1 && j==0)
			qt = 1'b0;
		else if (k==0 && j==1)
			qt = 1'b1;
		else if (k==1 && j==1)
			qt = ~qt;
	end
endmodule

module spdch_fjk3(sn,ck,j,k,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,j,k,sn;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck or negedge sn)
	if (sn==0)
		qt = 1'b1;
	else
	begin
		if (k==1 && j==0)
			qt = 1'b0;
		else if (k==0 && j==1)
			qt = 1'b1;
		else if (k==1 && j==1)
			qt = ~qt;
	end
endmodule

module spdch_fjk4(rn,sn,ck,j,k,qn,q);
output 	qn,q;
reg 	qt;
input 	ck,j,k,rn,sn;
wire 	q = qt;
wire 	qn = ~qt;

always @(posedge ck or negedge rn or negedge sn)
	if (rn==0)
		qt = 1'b0;
	else if (sn==0)
		qt = 1'b1;
	else
	begin
		if (k==1 && j==0)
			qt = 1'b0;
		else if (k==0 && j==1)
			qt = 1'b1;
		else if (k==1 && j==1)
			qt = ~qt;
	end
endmodule

module spdch_gnd(o);
output	o;

assign o = 1'b0;
endmodule

module spdch_gnd_v(o);
parameter width = 1;
output	[width-1:0]	o;

assign o = 'b0;
endmodule

module spdch_ha(co,a,b,y);
input	a;
input	b;
output	y;
output	co;
assign	y =  a ^ b;
assign	co =  a & b;
endmodule

module spdch_iv(i,o);
input	i;
output	o;
assign o = ~i;
endmodule

module spdch_iv_v(i,o);
parameter width = 1;
input	[width-1:0]	i;
output	[width-1:0]	o;
assign	o = ~i;
endmodule

module spdch_ld1(g,d,qn,q);
output 	qn,q;
reg 	qt;
input 	g,d;
wire 	q = qt;
wire 	qn = ~qt;

always @(g or d)
	qt = (g == 1) ? d : qt;
endmodule

module spdch_ld1_v(g,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	g;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(g or d)
	qt = (g == 1) ? d : qt;
endmodule

module spdch_ld2(gn,d,qn,q);
output 	qn,q;
reg 	qt;
input 	gn,d;
wire 	q = qt;
wire 	qn = ~qt;

always @(gn or d)
	qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld2_v(gn,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	gn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(gn or d)
	qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld3(rn,g,d,qn,q);
output 	qn,q;
reg 	qt;
input 	g,d,rn;
wire 	q = qt;
wire 	qn = ~qt;

always @(rn or g or d)
	if (rn==0)
		qt = 1'b0;
	else
		qt = (g == 1) ? d : qt;
endmodule

module spdch_ld3_v(rn,g,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	g,rn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(g or d or rn)
	if (rn == 0)
		qt = 'b0;
	else
		qt = (g == 1) ? d : qt;
endmodule

module spdch_ld4(rn,gn,d,qn,q);
output 	qn,q;
reg 	qt;
input 	gn,d,rn;
wire 	q = qt;
wire 	qn = ~qt;

always @(rn or gn or d)
	if (rn==0)
		qt = 1'b0;
	else
		qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld4_v(rn,gn,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	gn,rn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(gn or d or rn)
	if (rn == 0)
		qt = 'b0;
	else
		qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld5(sn,g,d,qn,q);
output 	qn,q;
reg 	qt;
input 	g,d,sn;
wire 	q = qt;
wire 	qn = ~qt;

always @(sn or g or d)
	if (sn==0)
		qt = 1'b1;
	else
		qt = (g == 1) ? d : qt;
endmodule

module spdch_ld5_v(sn,g,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	g,sn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(g or d or sn)
	if (sn == 0)
		qt = ~ 'b0;
	else
		qt = (g == 1) ? d : qt;
endmodule

module spdch_ld6(sn,gn,d,qn,q);
output 	qn,q;
reg 	qt;
input 	gn,d,sn;
wire 	q = qt;
wire 	qn = ~qt;

always @(sn or gn or d)
	if (sn==0)
		qt = 1'b1;
	else
		qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld6_v(sn,gn,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	gn,sn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(gn or d or sn)
	if (sn == 0)
		qt = ~ 'b0;
	else
		qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld7(rn,sn,g,d,qn,q);
output 	qn,q;
reg 	qt;
input 	g,d,sn,rn;
wire 	q = qt;
wire 	qn = ~qt;

always @(rn or sn or g or d)
	if (rn==0)
		qt = 1'b0;
	else if (sn==0)
		qt = 1'b1;
	else
		qt = (g == 1) ? d : qt;
endmodule

module spdch_ld7_v(rn,sn,g,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	g,sn,rn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(g or d or sn or rn)
	if (rn == 0)
		qt = 'b0;
	else if (sn == 0)
		qt = ~ 'b0;
	else
		qt = (g == 1) ? d : qt;
endmodule

module spdch_ld8(rn,sn,gn,d,qn,q);
output 	qn,q;
reg 	qt;
input 	gn,d,sn,rn;
wire 	q = qt;
wire 	qn = ~qt;

always @(rn or sn or gn or d)
	if (rn==0)
		qt = 1'b0;
	else if (sn==0)
		qt = 1'b1;
	else
		qt = (gn == 0) ? d : qt;
endmodule

module spdch_ld8_v(rn,sn,gn,d,qn,q);
parameter width = 1;
output 	[width-1:0]	qn,q;
reg 	[width-1:0]	qt;
input 	[width-1:0]	d;
input 	gn,sn,rn;
wire 	[width-1:0]	q = qt;
wire 	[width-1:0]	qn = ~qt;

always @(gn or d or sn or rn)
	if (rn == 0)
		qt = 'b0;
	else if (sn == 0)
		qt = ~ 'b0;
	else
		qt = (gn == 0) ? d : qt;
endmodule

module spdch_lsra(sn,rn,q);
output 	q;
reg 	q;
input 	sn,rn;

always @(sn or rn)
	if (sn==0 && rn==0)
		q = 1'b0;
	else if (sn==0 && rn==1)
		q = 1'b1;
	else if (sn==1 && rn==0)
		q = 1'b0;
endmodule

module spdch_lsrb(s,r,q);
output 	q;
reg 	q;
input 	s,r;

always @(s or r)
	if (s==0 && r==1)
		q = 1'b0;
	else if (s==1 && r==0)
		q = 1'b1;
	else if (s==1 && r==1)
		q = 1'b1;
endmodule

module spdch_mx21(i1,i2,s,o);
input	i1;
input	i2;
input	s;
output	o;
assign	o = (s==1'b0) ? i1 : i2;
endmodule

module spdch_mx21_v(i1,i2,s,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	s;
output	[width-1:0]	o;
assign	o = (s==1'b0) ? i1 : i2;
endmodule

module spdch_mx41(i1,i2,i3,i4,a,b,o);
input	i1;
input	i2;
input	i3;
input	i4;
input	a;
input	b;
output	o;
reg	o;
always @(i1 or i2 or i3 or i4 or a or b)
	case ({a,b}) 
		2'b00:  o = i1;
		2'b01:  o = i2;
		2'b10:  o = i3;
		default o = i4;
	endcase
endmodule

module spdch_mx41_v(i1,i2,i3,i4,a,b,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
input	[width-1:0]	i4;
input	a;
input	b;
output	[width-1:0]	o;
reg	[width-1:0]     o;
always @(i1 or i2 or i3 or i4 or a or b)
	case ({a,b}) 
		2'b00:  o = i1;
		2'b01:  o = i2;
		2'b10:  o = i3;
		default o = i4;
	endcase
endmodule

module spdch_nd2(i1,i2,o);
input	i1;
input	i2;
output	o;
assign o = ~(i1 & i2);
endmodule

module spdch_nd2_v(i1,i2,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
output	[width-1:0]	o;
assign	o = ~(i1 & i2);
endmodule

module spdch_nd3(i1,i2,i3,o);
input	i1;
input	i2;
input	i3;
output	o;
assign o = ~(i1 & i2 & i3);
endmodule

module spdch_nd3_v(i1,i2,i3,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
output	[width-1:0]	o;
assign	o = ~(i1 & i2 & i3);
endmodule

module spdch_nd4(i1,i2,i3,i4,o);
input	i1;
input	i2;
input	i3;
input	i4;
output	o;
assign o = ~(i1 & i2 & i3 & i4);
endmodule

module spdch_nd4_v(i1,i2,i3,i4,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
input	[width-1:0]	i4;
output	[width-1:0]	o;
assign	o = ~(i1 & i2 & i3 &i4);
endmodule

module spdch_nop(nop);
input	nop;
endmodule

module spdch_nop_v(nop);
parameter width = 1;
input	[width-1:0]	nop;
endmodule

module spdch_nr2(i1,i2,o);
input	i1;
input	i2;
output	o;
assign o = ~(i1 | i2);
endmodule

module spdch_nr2_v(i1,i2,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
output	[width-1:0]	o;
assign	o = ~(i1 | i2);
endmodule

module spdch_nr3(i1,i2,i3,o);
input	i1;
input	i2;
input	i3;
output	o;
assign o = ~(i1 | i2 | i3);
endmodule

module spdch_nr3_v(i1,i2,i3,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
output	[width-1:0]	o;
assign	o = ~(i1 | i2 | i3);
endmodule

module spdch_nr4(i1,i2,i3,i4,o);
input	i1;
input	i2;
input	i3;
input	i4;
output	o;
assign o = ~(i1 | i2 | i3 | i4);
endmodule

module spdch_nr4_v(i1,i2,i3,i4,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
input	[width-1:0]	i4;
output	[width-1:0]	o;
assign	o = ~(i1 | i2 | i3 | i4);
endmodule

module spdch_or2(i1,i2,o);
input	i1;
input	i2;
output	o;
assign o = i1 | i2;
endmodule

module spdch_or2_v(i1,i2,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
output	[width-1:0]	o;
assign	o = i1 | i2;
endmodule

module spdch_or3(i1,i2,i3,o);
input	i1;
input	i2;
input	i3;
output	o;
assign o = i1 | i2 | i3;
endmodule

module spdch_or3_v(i1,i2,i3,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
output	[width-1:0]	o;
assign	o = i1 | i2 | i3;
endmodule

module spdch_or4(i1,i2,i3,i4,o);
input	i1;
input	i2;
input	i3;
input	i4;
output	o;
assign o = i1 | i2 | i3 | i4;
endmodule

module spdch_or4_v(i1,i2,i3,i4,o);
parameter width = 1;
input	[width-1:0]	i1;
input	[width-1:0]	i2;
input	[width-1:0]	i3;
input	[width-1:0]	i4;
output	[width-1:0]	o;
assign	o = i1 | i2 | i3 | i4;
endmodule

module spdch_pd(o);
output	o;

assign o = 1'b0;
endmodule

module spdch_pu(o);
output	o;

assign o = 1'b1;
endmodule
module spdch_vdd(o);
output	o;

assign o = 1'b1;
endmodule

module spdch_vdd_v(o);
parameter width = 1;
output	[width-1:0]	o;

assign  o = ~('b0);
endmodule
