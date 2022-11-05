//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : coverage
// File            : coverage.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Records the request transactions that have been driven onto the DUT 
//   to provide coverage information
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// coverage
//----------------------------------------------------------------------
class coverage extends uvm_subscriber #(ma_agent_req_item);

  // factory registration macro
  `uvm_component_utils(coverage)

  // variables 
  ma_agent_req_item cov_item; 

  //--------------------------------------------------------------------
  // cov_item_cover
  //--------------------------------------------------------------------  
    covergroup cov_item_cover;
     CP1: coverpoint cov_item.a + cov_item.b
     {
       bins no_carry  = {[0:255]};
       bins carry     = default;
     }
     CP2: coverpoint cov_item.c + cov_item.d
     {
       bins no_carry  = {[0:255]};
       bins carry     = default;
     }     
    endgroup
  // ---------------------

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new(string name = "coverage", 
               uvm_component parent = null);
    super.new(name, parent);

    cov_item_cover     = new();  

  endfunction: new
  
  //--------------------------------------------------------------------
  // write
  //--------------------------------------------------------------------  
  virtual function void write(ma_agent_req_item t);
    cov_item = t;
    cov_item_cover.sample();
  endfunction: write

  //--------------------------------------------------------------------
  // report_phase
  //--------------------------------------------------------------------  
  virtual function void report_phase(uvm_phase phase);
    int unsigned covered;
    int unsigned total;
    real pct;

    pct = cov_item_cover.get_coverage(covered, total);
    $display("Coverage: covered = %0d, total = %0d (%5.2f%%)",
             covered, total, pct);

  endfunction: report_phase

endclass: coverage
