//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : test_base
// File            : test_base.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Contains the common methods common to both tests.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// test_base
//----------------------------------------------------------------------
virtual class test_base extends uvm_test;

  // factory registration macro
  `uvm_component_utils(test_base)
  
  // internal components
  ma_env  m_env;

  // configuration objects:
  ma_env_config m_env_cfg;
  ma_agent_req_config m_ma_agent_req_cfg;
  ma_agent_rsp_config m_ma_agent_rsp_cfg;

  
  //--------------------------------------------------------------------
  // new
  //-------------------------------------------------------------------- 
  function new(string name = "test_base", 
               uvm_component parent = null);
    super.new(name, parent);
  endfunction: new
  
  //--------------------------------------------------------------------
  // build_phase
  //-------------------------------------------------------------------- 
  virtual function void build_phase(uvm_phase phase);

    // Create env configuration object
    m_env_cfg   = ma_env_config::type_id::create("m_env_cfg");
    // Call function to configure the env
    configure_ma_env(m_env_cfg);
    
    // Create ma_agent_req agent configuration object
    m_ma_agent_req_cfg = ma_agent_req_config::type_id::create("m_ma_agent_req_cfg");  
    if(!uvm_config_db #(virtual multadd_if)::get(this, "", "vif_req_vif", m_ma_agent_req_cfg.vif_req)) 
    begin
      `uvm_error("RESOURCE_ERROR", "multadd_if virtual interface not found")
    end
    m_env_cfg.m_ma_agent_req_cfg    = m_ma_agent_req_cfg;
    // Call function to configure the agent    
    configure_ma_agent_req(m_ma_agent_req_cfg);

    // Create ma_agent_rsp agent configuration object
    m_ma_agent_rsp_cfg = ma_agent_rsp_config::type_id::create("m_ma_agent_rsp_cfg");    
    if(!uvm_config_db #(virtual multadd_if)::get(this, "", "vif_rsp_vif", m_ma_agent_rsp_cfg.vif_rsp)) 
    begin
      `uvm_error("RESOURCE_ERROR", "multadd_if virtual interface not found")
    end
    m_env_cfg.m_ma_agent_rsp_cfg    = m_ma_agent_rsp_cfg;
    // Call function to configure the agent       
    configure_ma_agent_rsp(m_ma_agent_rsp_cfg);    

    uvm_config_db #(ma_env_config)::set(this, "*", "ma_env_config", m_env_cfg);
    
    // Turn on the transaction recording feature in Questa/UVM
    uvm_config_db #(int)::set(this, "*", "recording_detail", UVM_FULL);

    m_env = ma_env::type_id::create("m_env", this);
    
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //--------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);


  endfunction: connect_phase

  //--------------------------------------------------------------------
  // end_of_elaboration_phase
  //--------------------------------------------------------------------
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    // Use the function call to change the verbosity level for your
    // testbench. This is in the end_of_elaboration phase because
    // all of your testbench components need to be built for this to
    // work through the hierarchy.  You can also change the verbosity
    // for your testbench on the simulator command line by using 
    // +UVM_VERBOSITY=UVM_MEDIUM.
    // UVM_MEDIUM is the default verbosity level in UVM.
    set_report_verbosity_level_hier(UVM_MEDIUM);

  endfunction: end_of_elaboration_phase

  //--------------------------------------------------------------------
  // configure_ma_env
  //--------------------------------------------------------------------
  // Convenience function to configure the env
  // This can be overloaded by extensions to this base class
  
  virtual function void configure_ma_env (ma_env_config cfg);
 
  endfunction: configure_ma_env

  //--------------------------------------------------------------------
  // configure_ma_agent_req
  //--------------------------------------------------------------------
  // Convenience function to configure the ma_agent_req agent
  // This can be overloaded by extensions to this base class
  
  virtual function void configure_ma_agent_req (ma_agent_req_config cfg);
    cfg.is_active = UVM_ACTIVE;
  endfunction: configure_ma_agent_req

  //--------------------------------------------------------------------
  // configure_ma_agent_rsp
  //--------------------------------------------------------------------
  // Convenience function to configure the ma_agent_rsp agent
  // This can be overloaded by extensions to this base class
  
  virtual function void configure_ma_agent_rsp (ma_agent_rsp_config cfg);
    cfg.is_active = UVM_PASSIVE;
  endfunction: configure_ma_agent_rsp

  //--------------------------------------------------------------------
  // init_vseq
  //--------------------------------------------------------------------
  // Method to initialise the virtual sequence handles
  function void init_vseq(virtual_sequence_base vseq);
    vseq.m_ma_agent_req_sequencer = m_env.m_ma_agent_req.m_sequencer;
    vseq.m_ma_agent_rsp_sequencer = m_env.m_ma_agent_rsp.m_sequencer;
  endfunction: init_vseq


endclass: test_base

