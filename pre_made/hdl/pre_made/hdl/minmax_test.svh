//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : minmax_test
// File            : minmax_test.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Configures the testbench to perform minmax testing.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// minmax_test
//----------------------------------------------------------------------
class minmax_test extends test_base;

  // factory registration macro
  `uvm_component_utils(minmax_test)    

  //--------------------------------------------------------------------
  // new
  //-------------------------------------------------------------------- 
  function new(string name = "minmax_test",
               uvm_component parent = null);
    super.new(name, parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //-------------------------------------------------------------------- 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // --- Example code ---
    set_report_verbosity_level_hier(UVM_MEDIUM);
    // --------------------
  endfunction: build_phase

  //--------------------------------------------------------------------
  // run_phase
  //-------------------------------------------------------------------- 
  virtual task run_phase(uvm_phase phase);

    minmax_vseq vseq = minmax_vseq::type_id::create("vseq");
    
    phase.raise_objection(this);
    `uvm_info({get_type_name(),":run"}, "Starting test...", UVM_LOW)
    
    //Connect sequence to sequencer and start
    init_vseq(vseq);  // Using method from test base class to assign sequence handles   
    vseq.start(null); // null because no target sequencer

      
    // Can add other vsequences and start them in a serial fashion or
    // start them in parallel using one of the fork/join variants
    // This works because start() is a blocking task.

    `uvm_info({get_type_name(),":run"}, "... test completed", UVM_LOW)
    phase.drop_objection(this);

  endtask: run_phase

endclass: minmax_test

