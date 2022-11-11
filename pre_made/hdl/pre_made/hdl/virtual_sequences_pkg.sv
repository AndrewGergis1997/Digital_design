//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : virtual_sequences_pkg
// File            : virtual_sequences_pkg.sv
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   A package which includes both virtual sequences plus the virtual 
//   sequence base class and references the sequences package.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// sequences_pkg
//----------------------------------------------------------------------
package virtual_sequences_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
   
  // Import the agent package(s)   
  import ma_agent_req_pkg::*;
  import ma_agent_rsp_pkg::*; 
  
  // Include the sequences package
  import sequences_pkg::*;  
  
  // Include the virtual sequence(s)
  `include "virtual_sequence_base.svh"
  `include "drive_random_vseq.svh" 
  `include "minmax_vseq.svh" 
   
endpackage: virtual_sequences_pkg
