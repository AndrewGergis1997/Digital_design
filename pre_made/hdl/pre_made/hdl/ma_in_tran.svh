//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_ovm
// Class           : ma_in_tran
// File            : ma_in_tran.svh
//----------------------------------------------------------------------
// Create by       : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Description
//   Request transaction definition.                 
//----------------------------------------------------------------------

`ifndef __MA_IN_TRAN
`define __MA_IN_TRAN

//----------------------------------------------------------------------
// ma_in_tran
//---------------------------------------------------------------------- 
class ma_in_tran extends ovm_sequence_item;

  // User stimulus variables (rand)
  rand ma_operand a,b,c,d;

  // User response variables (non rand)

  // Factory registration macro
  `ovm_object_utils(ma_in_tran)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new (string name = "ma_in_tran" );
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // do_copy
  //--------------------------------------------------------------------
  virtual function void do_copy(ovm_object rhs);
    ma_in_tran rhs_;

    if(!$cast(rhs_, rhs)) begin 
      `ovm_error({get_type_name(),":do_copy"}, "Copy Failed, type mismatch")
    end 
    
    super.do_copy(rhs);    
    a = rhs_.a;
    b = rhs_.b;
    c = rhs_.c;
    d = rhs_.d;
    
  endfunction: do_copy

  //--------------------------------------------------------------------
  // do_compare
  //--------------------------------------------------------------------
  virtual function bit do_compare(ovm_object rhs, ovm_comparer comparer);
    ma_in_tran rhs_;
    
    if(!$cast(rhs_, rhs)) begin 
      `ovm_error({get_type_name(),":do_compare"}, "Compare Failed, type mismatch")
      return 0; 
    end    

    return((super.do_compare(rhs, comparer))
      && (a == rhs_.a)
      && (b == rhs_.b)
      && (c == rhs_.c)
      && (d == rhs_.d)
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
    $sformat(str, "%s a: \t%0d\n", str, a);
    $sformat(str, "%s b: \t%0d\n", str, b);
    $sformat(str, "%s c: \t%0d\n", str, c);
    $sformat(str, "%s d: \t%0d\n", str, d);

    return str;
  endfunction: convert2string

endclass: ma_in_tran

`endif

