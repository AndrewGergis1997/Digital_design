//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Class           : printer
// File            : printer.svh
//----------------------------------------------------------------------
// Create by       : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Description
//   Reads the response transactions and prints them to the screen.                  
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// printer
//----------------------------------------------------------------------
class printer extends uvm_subscriber #(ma_agent_rsp_item);

  // Factory registration macro  
  `uvm_component_utils(printer)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------        
  function new(string name = "printer",
               uvm_component parent = null);
    super.new(name, parent);
  endfunction

  //--------------------------------------------------------------------
  // write
  //--------------------------------------------------------------------        
  function void write(ma_agent_rsp_item t);
    string msg;
    $sformat (msg, "Result: %d",t.prodsum);
    `uvm_info("PRINTER",msg, UVM_LOW)
  endfunction: write

endclass: printer

