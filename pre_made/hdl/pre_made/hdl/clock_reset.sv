//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : clock_reset
// File            : clock_reset.sv
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   This module creates the clock and reset signals.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// clock_reset
//----------------------------------------------------------------------
module clock_reset (output bit clk,rst);

  timeunit 1ns;
  timeprecision 10ps;
  
  initial begin
    rst = 1;
    repeat(3) begin
      @ (posedge clk);
    end
    rst = 0;
  end

  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end
     
endmodule: clock_reset

