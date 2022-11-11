//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_req_pkg
// File            : ma_agent_req_pkg.sv
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   A package which includes all the agent component files and declares
//   the types used in the transactions.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_agent_req_pkg
//----------------------------------------------------------------------
package ma_agent_req_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  typedef logic [7:0] ma_operand;
  typedef logic [15:0] ma_result;

  // Include the sequence_items (transactions)
  `include "ma_agent_req_item.svh"  

  // Include the agent config object
  `include "ma_agent_req_config.svh"

  // Include the components  
  `include "ma_agent_req_driver.svh"
  `include "ma_agent_req_monitor.svh"
  `include "ma_agent_req.svh"

  
endpackage: ma_agent_req_pkg

