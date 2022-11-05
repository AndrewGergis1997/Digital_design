//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_rsp_item
// File            : ma_agent_rsp_item.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Response transaction definition.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_agent_rsp_item
//----------------------------------------------------------------------
class ma_agent_rsp_item extends uvm_sequence_item;

  // user stimulus variables (rand)

  // user response variables (non rand)
  ma_result prodsum;
    
  // factory registration macro
  `uvm_object_utils(ma_agent_rsp_item)

  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new (string name = "ma_agent_rsp_item" );
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // do_copy
  //--------------------------------------------------------------------
  // Performs a deep copy of an object.
  virtual function void do_copy(uvm_object rhs);
    ma_agent_rsp_item rhs_;

    if(!$cast(rhs_, rhs)) begin 
      `uvm_error({get_type_name(),":do_copy"}, "Copy Failed, type mismatch")
      return;
    end 
    
    super.do_copy(rhs);    
    prodsum = rhs_.prodsum;
        
  endfunction: do_copy

  //--------------------------------------------------------------------
  // do_compare
  //--------------------------------------------------------------------
  // Compares one object to another of the same type.
  virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    ma_agent_rsp_item rhs_;
    
    if(!$cast(rhs_, rhs)) begin 
      `uvm_error({get_type_name(),":do_compare"}, "Compare Failed, type mismatch")
      return 0; 
    end    

    return((super.do_compare(rhs, comparer))
      &&(prodsum == rhs_.prodsum)    
      );
    
  endfunction: do_compare

  //--------------------------------------------------------------------
  // do_print
  //--------------------------------------------------------------------
  // Prints a the result of convert2string to the screen.
  function void do_print(uvm_printer printer);
    if(printer.knobs.sprint == 0) begin
      $display(convert2string());
    end
    else begin
      printer.m_string = convert2string();
    end
  endfunction: do_print

  //--------------------------------------------------------------------
  // convert2string
  //--------------------------------------------------------------------
  // Returns a string representation of the object.
  function string convert2string();
    string str;
    str = super.convert2string();
    $sformat(str, "%s\\n",str);
    $sformat(str, "%s prodsum: \t%0d\n", str, prodsum);
    
    return str;
  endfunction: convert2string


endclass: ma_agent_rsp_item

