//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : minmax_seq
// File            : minmax_seq.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Creates constrained random operand values.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// minmax_seq
//----------------------------------------------------------------------
class minmax_seq extends uvm_sequence #( ma_agent_req_item, ma_agent_req_item );

  // factory registration macro
  `uvm_object_utils(minmax_seq)

  // variables  
  ma_agent_req_item req_item_h;  
  int num_repetions = 50;  

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "minmax_seq");
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    req_item_h = ma_agent_req_item::type_id::create("req_item_h");
    repeat(num_repetions) begin
      
      start_item(req_item_h);
      assert(req_item_h.randomize() with {a==0; b==255; c==255; d==0;});
      `uvm_info({get_type_name(),":body"},{"Sending transaction ",req_item_h.convert2string()}, UVM_MEDIUM)
      finish_item(req_item_h);
      
      start_item(req_item_h);
      assert(req_item_h.randomize() with {a==255; b==0; c==0; d==255;});
      `uvm_info({get_type_name(),":body"},{"Sending transaction ",req_item_h.convert2string()}, UVM_MEDIUM)
      finish_item(req_item_h);
            
    end 
  endtask: body

endclass: minmax_seq

