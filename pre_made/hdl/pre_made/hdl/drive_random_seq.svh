//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : drive_random_seq
// File            : drive_random_seq.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//    Randomly creates ma_agent_req_item transactions to drive the DUT 
//    and collects responses.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// drive_random_seq
//----------------------------------------------------------------------
class drive_random_seq extends uvm_sequence #( ma_agent_req_item, ma_agent_req_item );

  // factory registration macro
  `uvm_object_utils(drive_random_seq)

  // variables  
  ma_agent_req_item req_item_h;  
  int num_repetions = 50;  

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "drive_random_seq");
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    req_item_h = ma_agent_req_item::type_id::create("req_item_h");
    repeat(num_repetions) begin
      start_item(req_item_h);
      assert(req_item_h.randomize());
      `uvm_info({get_type_name(),":body"},{"Sending transaction ",req_item_h.convert2string()}, UVM_MEDIUM)
      finish_item(req_item_h);
    end 
  endtask: body

endclass: drive_random_seq

