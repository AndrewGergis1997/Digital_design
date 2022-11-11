//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_req
// File            : ma_agent_req.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Encapsulates the ability to drive test sequences to the DUT
//   at the transaction level.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_agent_req
//----------------------------------------------------------------------
class ma_agent_req extends uvm_agent;

  // configuration object
  ma_agent_req_config m_cfg;

  // factory registration macro
  `uvm_component_utils(ma_agent_req)   

  // external interfaces
  uvm_analysis_port #(ma_agent_req_item) ap;

  // internal components
  ma_agent_req_monitor  m_monitor;
  ma_agent_req_driver  m_driver;
  uvm_sequencer #(ma_agent_req_item, ma_agent_req_item)  m_sequencer;
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new(string name = "ma_agent_req", 
               uvm_component parent = null);
    super.new(name, parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    
    if(!uvm_config_db #(ma_agent_req_config)::get(this, "", "ma_agent_req_config", m_cfg)) begin
      `uvm_error("build_phase", "ma_agent_req_config not found")
    end    

    ap = new("ap", this);
    
    // Monitor is always built
    m_monitor = ma_agent_req_monitor::type_id::create("m_monitor", this);
    
    // Driver and Sequencer only built if agent is active
    if (m_cfg.is_active == UVM_ACTIVE) begin
      m_driver     = ma_agent_req_driver::type_id::create("m_driver",this);
      m_sequencer  = uvm_sequencer #(ma_agent_req_item, ma_agent_req_item)::type_id::create("m_sequencer",this);
    end 
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //--------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);

    // Monitor is always connected
    m_monitor.ap.connect(ap);
    m_monitor.vif_req = m_cfg.vif_req;
    
    // Driver and Sequencer only connected if agent is active    
    if (m_cfg.is_active == UVM_ACTIVE) begin
      m_driver.vif_req = m_cfg.vif_req;
      m_driver.seq_item_port.connect(m_sequencer.seq_item_export);   
    end     
    
  endfunction: connect_phase

endclass: ma_agent_req

