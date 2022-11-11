//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_ovm
// Class           : ma_out_tran
// File            : ma_out_tran.svh
//----------------------------------------------------------------------
// Create by       : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Description
//   Response transaction definition.                  
//----------------------------------------------------------------------

`ifndef __MA_OUT_TRAN
`define __MA_OUT_TRAN

//----------------------------------------------------------------------
// ma_out_tran
//----------------------------------------------------------------------
class ma_out_tran extends ovm_sequence_item;

  // user stimulus variables (rand)

  // user response variables (non rand)
  ma_result prodsum;

  // Factory registration macro
  `ovm_object_utils(ma_out_tran)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------      
  function new (string name = "ma_out_tran");    
    super.new(name);
  endfunction
  
  //--------------------------------------------------------------------
  // do_copy
  //--------------------------------------------------------------------
  virtual function void do_copy(ovm_object rhs);
    ma_out_tran rhs_;
  
    if(!$cast(rhs_, rhs)) begin 
      `ovm_fatal({get_type_name(),":do_copy"}, "Copy Failed, type mismatch"); 
    end 

    super.do_copy(rhs);
  
    prodsum = rhs_.prodsum;
    
  endfunction: do_copy

  //--------------------------------------------------------------------
  // do_compare
  //--------------------------------------------------------------------
  virtual function bit do_compare(ovm_object rhs, ovm_comparer comparer);

    ma_out_tran rhs_;
    
    if(!$cast(rhs_, rhs)) begin 
      `ovm_fatal({get_type_name(),":do_compare"}, "Compare Failed, type mismatch"); 
    end 

    return((super.do_compare(rhs, comparer))
      &&(prodsum == rhs_.prodsum)
      );
    
  endfunction: do_compare

  //--------------------------------------------------------------------
  // do_print
  //--------------------------------------------------------------------
  function void do_print(ovm_printer printer);
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
  function string convert2string();
    string str;
    str = super.convert2string();
    $sformat(str, "%s\n",str);
    $sformat(str, "%s prodsum: \t%0d\n", str, prodsum);

    return str;
  endfunction: convert2string
  
endclass: ma_out_tran

`endif
