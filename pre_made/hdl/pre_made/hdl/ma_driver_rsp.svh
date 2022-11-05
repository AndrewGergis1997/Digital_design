//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_ovm
// Unit            : ma_driver_rsp
// File            : ma_driver_rsp.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Not used as the agent is configured to be PASSIVE.
//----------------------------------------------------------------------

`ifndef __MA_DRIVER_RSP
`define __MA_DRIVER_RSP

//----------------------------------------------------------------------
// ma_driver_rsp
//----------------------------------------------------------------------
class ma_driver_rsp extends ovm_driver #(ma_out_tran, ma_out_tran);

  // Declaration macros
  `ovm_component_utils(ma_driver_rsp)  

  // Internal components 
  ma_out_tran    req_txn;

  // Interface  
  virtual multadd_if  vif_rsp;

  // Local variables
  int tests = 0;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new (string name = "ma_driver_rsp",
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
      @(negedge vif_rsp.clk)
      if (!vif_rsp.rst) begin
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
  endtask: drive_idle

  //--------------------------------------------------------------------
  // drive_dut
  //--------------------------------------------------------------------  
  task drive_dut(); 
  // Drive transactions onto interface signals
    `ovm_info({get_type_name(),":drive_dut"},req_txn.convert2string(),OVM_MEDIUM)
    @(posedge vif_rsp.clk);
    @(negedge vif_rsp.clk);
    reset_dut;
  endtask: drive_dut

  //--------------------------------------------------------------------
  // reset_dut
  //--------------------------------------------------------------------  
  task reset_dut();

  endtask: reset_dut
  
endclass: ma_driver_rsp

`endif
