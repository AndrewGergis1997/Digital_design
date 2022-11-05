//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_req_driver
// File            : ma_agent_req_driver.svh
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

//----------------------------------------------------------------------
// ma_agent_req_driver
//----------------------------------------------------------------------
class ma_agent_req_driver extends uvm_driver #(ma_agent_req_item, ma_agent_req_item);

  // factory registration macro
  `uvm_component_utils(ma_agent_req_driver)  

  // internal components 
  ma_agent_req_item    req_txn;

  // interface  
  virtual multadd_if  vif_req;

  // local variables
  int tests = 0;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new (string name = "ma_agent_req_driver",
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
      @(negedge vif_req.clk)
      if (!vif_req.rst) begin
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
  virtual task drive_idle(); 

    // Drive idle pattern
    vif_req.pipeline <= 0;        

  endtask: drive_idle

  //--------------------------------------------------------------------
  // drive_dut
  //--------------------------------------------------------------------  
  virtual task drive_dut(); 
  // Drive transactions onto interface signals
    `uvm_info({get_type_name(),":drive_dut"},req_txn.convert2string(),UVM_MEDIUM)

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
  virtual task reset_dut();
  
    vif_req.a <= 8'bx;
    vif_req.b <= 8'bx;
    vif_req.c <= 8'bx;
    vif_req.d <= 8'bx;
    vif_req.pipeline = 0;

  endtask: reset_dut
  
endclass: ma_agent_req_driver

