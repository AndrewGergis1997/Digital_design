//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_ovm
// Unit            : ma_monitor_req
// File            : ma_monitor_req.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//    Monitors test transactions sent to the DUT.
//----------------------------------------------------------------------

`ifndef __MA_MONITOR_REQ
`define __MA_MONITOR_REQ

//----------------------------------------------------------------------
// ma_monitor_req
//----------------------------------------------------------------------
class ma_monitor_req extends ovm_monitor;
  
  // Factory registration macro
  `ovm_component_utils(ma_monitor_req)  
  
  // External interfaces
  ovm_analysis_port     #(ma_in_tran)  ap;
  
  // Variables
  ma_in_tran              mon_txn, t;

  // Interface
  virtual multadd_if  vif_req;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------     
  function new (string name = "ma_monitor_req",
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
    mon_txn = ma_in_tran::type_id::create("mon_txn");
    monitor_dut();
  endtask: run

  //--------------------------------------------------------------------
  // monitor_dut
  //--------------------------------------------------------------------    
  task monitor_dut();
  // Monitor transactions from the interface
    forever begin
      @(negedge vif_req.clk);
      if (!vif_req.rst) begin
        if (vif_req.pipeline == 1) begin
          mon_txn.a = vif_req.a;
          mon_txn.b = vif_req.b;
          mon_txn.c = vif_req.c;
          mon_txn.d = vif_req.d;                                    
          $cast(t, mon_txn.clone());
          ap.write(t);
          `ovm_info({get_type_name(),":monitor_dut"}, t.convert2string(), OVM_MEDIUM)
        end
      end      
    end
  endtask: monitor_dut
  
endclass: ma_monitor_req

`endif
