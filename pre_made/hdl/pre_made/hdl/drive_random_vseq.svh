//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : drive_random_vseq
// File            : drive_random_vseq.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Virtual sequence which starts drive_random_seq sequence on the 
//   ma_agent_req sequencer.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// drive_random_vseq
//----------------------------------------------------------------------
class drive_random_vseq extends virtual_sequence_base;

  // factory registration macro
  `uvm_object_utils(drive_random_vseq)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new(string name = "drive_random_vseq");
    super.new(name);
  endfunction: new
   
  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    drive_random_seq seq_a = drive_random_seq::type_id::create("seq_a");
    seq_a.start(m_ma_agent_req_sequencer);    
  endtask: body
  
endclass: drive_random_vseq
