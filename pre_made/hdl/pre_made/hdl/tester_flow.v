//
// Module uart_v2k.tester.flow
//
// Created:
//          by - user.group (host.domain)
//          at - 17:22:36 05/10/07
//
// Generated by Mentor Graphics' HDL Designer(TM) 2007.1
//

`resetall
`timescale 1ns/10ps
module tester( 
   // Port Declarations
   output  reg     [2:0]  addr,             // 3-bit address bus
   input   wire    [7:0]  buffered_datout,  // tr-state buffered output
   output  reg            clk,              // 10 MHz clock
   output  reg            cs,               // chip select
   output  reg     [7:0]  datin,            // 8-bit data in bus from cpu
   input   wire    [7:0]  datout,           // 8-bit data out bus to cpu
   input   wire           int,              // interrupt(1)
   output  reg            nrw,              // read(0), write(1)
   output  reg            rst,              // reset(0)
   output  reg            sin,              // serial input
   input   wire           sout              // serial output
);


// synopsys template
parameter CLK_PRD = 100;   //Tester clock

// Internal Declarations



// Module declarations
parameter RCV_CLK_PRD = (CLK_PRD * 6);

reg [7:0] DIV_LSB, DIV_MSB, SER_DATA, XMIT_DATA;
reg int_clk;

reg [7:0] read_data;
integer i;
// ---------------------
//    UART_WRITE
// ---------------------
task uart_write;
   input [7:0] bit_data;
   input [2:0] addr_w;
begin
   addr = addr_w;
   nrw = # (CLK_PRD) 1;
   datin = bit_data;
   cs = #(CLK_PRD) 0;
   cs = #(5*CLK_PRD) 1;
   nrw = #(CLK_PRD) 0;
   # CLK_PRD;
end
endtask

// ---------------------
//    UART_READ
// ---------------------
task uart_read ;
input [2:0] addr_r;
begin
    addr = addr_r;
    nrw = #( 2*CLK_PRD) 0 ;
    cs = #(CLK_PRD) 0;
    #(9*CLK_PRD);
    read_data = datout;
    cs = #(2*CLK_PRD) 1 ; 
    #CLK_PRD;
 end
endtask

/////////////////////////////////////////////////////////////////
// Flowchart tester_top
initial 
begin : tester_top_flowchart_proc
   int_clk = 0;
   DIV_LSB = 8'b00000110;
   DIV_MSB = 8'b0;
   SER_DATA = 8'b11001110;
   XMIT_DATA = 8'b01011010;
   cs = 1;
   nrw = 0;
   addr = "000";
   sin = 1;
   rst = 0;
   datin = # CLK_PRD 8'b00000000;
   rst = # (CLK_PRD) 1 ;
   # (3*CLK_PRD);
   uart_write(DIV_LSB,0);
   # (7*CLK_PRD);
   uart_write(DIV_MSB,1);
   # (7*CLK_PRD);

   uart_write(XMIT_DATA,4);
   for (i=0;i<60;i=i+1) begin
      if (int==1) begin
         i = 60;
      end
      else
      begin
         #CLK_PRD;
      end
   end
   if (int==1 && i != 60) begin
      wait (int_clk == 0 || int_clk);
      uart_read(7);
   end
   else
   begin
      wait (int_clk == 0 || int_clk);
      $display("Interrupt did not occur");
   end


   sin = 0;
   # (3*CLK_PRD);
   for (i=0;i<8;i=i+1) begin
      sin <= SER_DATA[i];
      # (6*CLK_PRD);
   end
   sin = 1;
   # (10*CLK_PRD);
   uart_read(7);
   uart_read(5);
   if (!(read_data == SER_DATA)) begin
      $display( "Read Data did NOT equal Serial Data");
   end


   uart_read(6);
   if (!(read_data == 8'b0)) begin
      $display("Status NOT zero");
   end

   $display("Uart Testing Complete");
   $stop;
end

// Concurrent statements
// Clock Generator
initial
   begin : clk_gen1_proc
      int_clk = 0;
      forever #(CLK_PRD/2) int_clk = ~int_clk;
   end

always @*
   begin : clk_gen2_proc
      clk = int_clk;
   end

endmodule // tester

