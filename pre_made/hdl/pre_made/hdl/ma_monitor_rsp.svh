//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_ovm
// Unit            : ma_monitor_rsp
// File            : ma_monitor_rsp.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Reads signals from the DUT and converts them to ma_out_tran 
//   transactions
//----------------------------------------------------------------------

`ifndef __MA_MONITOR_RSP
`define __MA_MONITOR_RSP

//----------------------------------------------------------------------
// ma_monitor_rsp
//----------------------------------------------------------------------
class ma_monitor_rsp extends ovm_monitor;
  
  // Factory registration macro
  `ovm_component_utils(ma_monitor_rsp)  
  
  // External interfaces
  ovm_analysis_port     #(ma_out_tran) ap;
  
  // Variables
  ma_out_tran             mon_txn, t;

  // Interface
  virtual multadd_if  vif_rsp;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------     
  function new (string name = "ma_monitor_rsp",
                ovm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------     
  virtual function void build();
    ap = new("ap",this);
  endfunction: build

  //--------------------------------------------------------------------
  // run
  //--------------------------------------------------------------------  
  virtual task run();
    mon_txn = ma_out_tran::type_id::create("mon_txn");
    monitor_dut();
  endtask: run

  //--------------------------------------------------------------------
  // monitor_dut
  //--------------------------------------------------------------------
  task monitor_dut();
  // Monitor transactions from the interface
    forever begin
      @(negedge vif_rsp.clk);
      if (!vif_rsp.rst) begin
      // Read interface signals into transaction
        if (vif_rsp.prodout) begin
          mon_txn.prodsum = vif_rsp.prodsum;
          $cast(t, mon_txn.clone());
          ap.write(t);
          `ovm_info({get_type_name(),":monitor_dut"}, t.convert2string(), OVM_MEDIUM)
        end
      end
    end
  endtask: monitor_dut
  
endclass: ma_monitor_rsp

`endif
