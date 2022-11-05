//
// Module Sequencer_vlg.fibgen_tester.flow
//
// Created:
//          by - user.group (host.domain)
//          at - 10:08:16 04/12/05
//
// Generated by Mentor Graphics' HDL Designer(TM) 2005.1
//

`resetall
`timescale 1ns/10ps
module fibgen_tester( 
   monitor, 
   clock, 
   reset
);


// Internal Declarations

input  [7:0] monitor;
output       clock;
output       reset;


wire [7:0] monitor;
reg clock;
reg reset;

/////////////////////////////////////////////////////////////////
// Flowchart Checker
always @ (monitor)
begin : checker_flowchart_proc
   if (monitor > 128) begin
      reset = 1 ;
   end
   else
   begin
      reset = 0 ;
   end
end

// Concurrent statements
// Clock Generator
initial
 begin : ClkGen
 parameter clk_prd = 100 ;
 clock = 0 ;
 reset = 1 ;
 forever #(clk_prd/2)clock = ~clock ;
end

endmodule // fibgen_tester

