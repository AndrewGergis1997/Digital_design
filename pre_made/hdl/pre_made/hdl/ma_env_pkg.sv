//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_env_pkg
// File            : ma_env_pkg.sv
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   A package which references all the instanced component files.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_env_pkg
//----------------------------------------------------------------------
package ma_env_pkg;

  `include "uvm_macros.svh"  
   import uvm_pkg::*;
   
   // Import the agent package(s)
   import ma_agent_req_pkg::*;
   import ma_agent_rsp_pkg::*;

   // Include the environment config object
   `include "ma_env_config.svh" 

   // Include the components
   `include "coverage.svh" 
   `include "scoreboard.svh" 
   `include "printer.svh"   
   `include "ma_env.svh" 
 
endpackage: ma_env_pkg

