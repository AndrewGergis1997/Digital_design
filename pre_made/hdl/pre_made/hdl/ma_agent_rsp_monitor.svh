//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_rsp_monitor
// File            : ma_agent_rsp_monitor.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Reads signals from the DUT and converts them to ma_agent_rsp_item 
//   transactions.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_agent_rsp_monitor
//----------------------------------------------------------------------
class ma_agent_rsp_monitor extends uvm_monitor;
  
  // factory registration macro
  `uvm_component_utils(ma_agent_rsp_monitor)   
  
  // external interfaces
  uvm_analysis_port     #(ma_agent_rsp_item) ap;
  
  // variables
  ma_agent_rsp_item    mon_txn, t;
 
  // interface  
  virtual multadd_if  vif_rsp;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------     
  function new (string name = "ma_agent_rsp_monitor",
                uvm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------     
  virtual function void build_phase(uvm_phase phase);

    ap = new("ap",this);          
       
  endfunction: build_phase

  //--------------------------------------------------------------------
  // run_phase
  //--------------------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
  
    mon_txn = ma_agent_rsp_item::type_id::create("mon_txn");
    monitor_dut();

  endtask: run_phase

  //--------------------------------------------------------------------
  // monitor_dut
  //--------------------------------------------------------------------    
  task monitor_dut();
  // Monitor transactions from the interface
    forever begin
      @(posedge vif_rsp.clk);
      if (!vif_rsp.rst) begin
        if (vif_rsp.prodout) begin
          mon_txn.prodsum = vif_rsp.prodsum;
          $cast(t, mon_txn.clone());
          ap.write(t);
          `uvm_info({get_type_name(),":monitor_dut"}, t.convert2string(), UVM_MEDIUM)
        end
      end      
    end
  endtask: monitor_dut

endclass: ma_agent_rsp_monitor

