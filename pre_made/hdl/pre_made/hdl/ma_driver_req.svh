//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_ovm
// Unit            : ma_driver_req
// File            : ma_driver_req.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Reads sequence transactions from the sequencer and coverts them to
//   RTL signals in the interface.
//----------------------------------------------------------------------

`ifndef __MA_DRIVER_REQ
`define __MA_DRIVER_REQ

//----------------------------------------------------------------------
// ma_driver_req
//----------------------------------------------------------------------
class ma_driver_req extends ovm_driver #(ma_in_tran, ma_in_tran);

  // Declaration macros
  `ovm_component_utils(ma_driver_req)  

  // Internal components 
  ma_in_tran    req_txn;

  // Interface  
  virtual multadd_if  vif_req;

  // Local variables
  int tests = 0;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new (string name = "ma_driver_req",
                ovm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // run
  //--------------------------------------------------------------------  
  virtual task run();
    drive_non_blocking;
  endtask: run

  //--------------------------------------------------------------------
  // report
  //--------------------------------------------------------------------  
  virtual function void report;
    string s;  
    $sformat(s, "%0d sequence items", tests);
    `ovm_info({get_type_name(),":report"}, s, OVM_MEDIUM )
  endfunction: report

  //--------------------------------------------------------------------
  // drive_non_blocking
  //--------------------------------------------------------------------  
  task drive_non_blocking();
    forever begin
      @(negedge vif_req.clk)
      if (!vif_req.rst) begin
        seq_item_port.try_next_item(req_txn);
        // Send Idle pattern
        if (req_txn == null) begin
          drive_idle();
        end
        // Send next Sequence Item
        else begin
          tests++;
          drive_dut();
          // Put response data into the req_txn fields            
          seq_item_port.item_done();       
        end 
      end 
    end
  endtask: drive_non_blocking

  //--------------------------------------------------------------------
  // drive_idle
  //--------------------------------------------------------------------    
  task drive_idle(); 
    // Drive idle pattern
    vif_req.pipeline <= 0;    
  endtask: drive_idle

  //--------------------------------------------------------------------
  // drive_dut
  //--------------------------------------------------------------------  
  task drive_dut(); 
  // Drive transactions onto interface signals
    `ovm_info({get_type_name(),":drive_dut"},req_txn.convert2string(),OVM_MEDIUM)
    vif_req.a <= req_txn.a;
    vif_req.b <= req_txn.b;
    vif_req.c <= req_txn.c;
    vif_req.d <= req_txn.d;
    vif_req.pipeline <= 1;
    @(posedge vif_req.clk);
    @(negedge vif_req.clk);
    reset_dut;
  endtask: drive_dut

  //--------------------------------------------------------------------
  // reset_dut
  //--------------------------------------------------------------------  
  task reset_dut();
    vif_req.a <= 8'bx;
    vif_req.b <= 8'bx;
    vif_req.c <= 8'bx;
    vif_req.d <= 8'bx;
    vif_req.pipeline = 0;
  endtask: reset_dut
  
endclass: ma_driver_req

`endif
