//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : rand_test
// File            : rand_test.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Configures the testbench to perform random testing.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// rand_test
//----------------------------------------------------------------------
class rand_test extends test_base;

  // factory registration macro
  `uvm_component_utils(rand_test)    

  //--------------------------------------------------------------------
  // new
  //-------------------------------------------------------------------- 
  function new(string name = "rand_test",
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

    drive_random_vseq vseq = drive_random_vseq::type_id::create("vseq");
    
    phase.raise_objection(this);
    `uvm_info({get_type_name(),":run"}, "Starting test...", UVM_LOW)
    
    //Connect sequence to sequencer and start
    init_vseq(vseq);  // Using method from test base class to assign sequence handles   
    vseq.start(null); // null because no target sequencer

    `uvm_info({get_type_name(),":run"}, "... test completed", UVM_LOW)
    phase.drop_objection(this);

  endtask: run_phase

endclass: rand_test

