//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : minmax_vseq
// File            : minmax_vseq.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Virtual sequence which starts minmax_seq sequence on the 
//   ma_agent_req sequencer.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// minmax_vseq
//----------------------------------------------------------------------
class minmax_vseq extends virtual_sequence_base;

  // factory registration macro
  `uvm_object_utils(minmax_vseq)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new(string name = "minmax_vseq");
    super.new(name);
  endfunction: new
   
  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    minmax_seq seq_a = minmax_seq::type_id::create("seq_a");
    seq_a.start(m_ma_agent_req_sequencer);    
  endtask: body
  
endclass: minmax_vseq
