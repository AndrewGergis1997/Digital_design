//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_rsp_driver
// File            : ma_agent_rsp_driver.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Not used as the agent is configured as PASSIVE.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_agent_rsp_driver
//----------------------------------------------------------------------
class ma_agent_rsp_driver extends uvm_driver #(ma_agent_rsp_item, ma_agent_rsp_item);

  // factory registration macro
  `uvm_component_utils(ma_agent_rsp_driver)  

  // internal components 
  ma_agent_rsp_item    req_txn;

  // interface  
  virtual multadd_if  vif_rsp;

  // local variables
  int tests = 0;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new (string name = "ma_agent_rsp_driver",
                uvm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // run_phase
  //--------------------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
    
    // Call Blocking (uses get_next_item() ) or 
    // Non-Blocking (uses try_next_item() ) driver styles.
    // Choose Non-Blocking if you need to drive idle cycles.
    
    //drive_blocking;
    drive_non_blocking;

  endtask: run_phase

  //--------------------------------------------------------------------
  // report_phase
  //--------------------------------------------------------------------  
  virtual function void report_phase(uvm_phase phase);
    string s;  
    $sformat(s, "%0d sequence items", tests);
    `uvm_info({get_type_name(),":report"}, s, UVM_MEDIUM )
  endfunction: report_phase

  //--------------------------------------------------------------------
  // drive_blocking
  //--------------------------------------------------------------------
  // Blocking style driver (uses get_next_item()).

  virtual task drive_blocking();
    forever begin
      @(negedge vif_rsp.clk)
      if (!vif_rsp.rst) begin
        seq_item_port.get_next_item(req_txn);
        tests++;
        drive_dut();
        // Put response data into the req_txn fields
        seq_item_port.item_done();
      end 
    end
  endtask: drive_blocking

  //--------------------------------------------------------------------
  // drive_non_blocking
  //--------------------------------------------------------------------  
  // Non-Blocking style driver (uses try_next_item()).
  // Choose this style if you need to drive idle cycles.
  
  virtual task drive_non_blocking();
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
  virtual task drive_idle(); 
    // Drive idle pattern
  endtask: drive_idle

  //--------------------------------------------------------------------
  // drive_dut
  //--------------------------------------------------------------------  
  virtual task drive_dut(); 
  // Drive transactions onto interface signals
    `uvm_info({get_type_name(),":drive_dut"},req_txn.convert2string(),UVM_MEDIUM)
//  e.g.  vif_rsp.data <= req_txn.data;
    @(posedge vif_rsp.clk);
    @(negedge vif_rsp.clk);
    reset_dut;
  endtask: drive_dut

  //--------------------------------------------------------------------
  // reset_dut
  //--------------------------------------------------------------------  
  virtual task reset_dut();
//  e.g. vif_rsp.data <= 8'bx;
  endtask: reset_dut
  
endclass: ma_agent_rsp_driver

