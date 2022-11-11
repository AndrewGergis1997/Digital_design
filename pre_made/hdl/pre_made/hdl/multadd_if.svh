//----------------------------------------------------------------------
//                   Mentor Graphics Inc
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : multadd_if
// File            : multadd_if.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   The SV interface definition for the DUT.
//----------------------------------------------------------------------

interface multadd_if (input bit clk, rst);

  // Port List
  
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] c;
  logic [7:0] d;
  logic pipeline;
  logic [16:0] prodsum;
  logic prodout;

  // Monitor Modport
  
  modport monitor_mp (
    input clk,
    input  rst,
    input  a,
    input  b,
    input  c,
    input  d,
    input  pipeline,
    input  prodsum,
    input  prodout
  );

endinterface : multadd_if