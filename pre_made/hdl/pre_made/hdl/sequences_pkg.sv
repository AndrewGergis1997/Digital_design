//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : sequences_pkg
// File            : sequences_pkg.sv
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   A package which includes both sequences and references the 
//   transaction package.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// sequences_pkg
//----------------------------------------------------------------------
package sequences_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
   
  // Import the agent package(s)   
  import ma_agent_req_pkg::*;
  
  // Include the sequence(s)
  `include "drive_random_seq.svh" 
  `include "minmax_seq.svh"   
   
endpackage: sequences_pkg
