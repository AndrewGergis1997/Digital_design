//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_env
// File            : ma_env.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Connects together all the class-based components for the overall 
//   testbench.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_env
//----------------------------------------------------------------------

class ma_env extends uvm_env;

  // factory registration macro
  `uvm_component_utils(ma_env)

  // internal components
  ma_agent_req       m_ma_agent_req; 
  ma_agent_rsp       m_ma_agent_rsp; 
  coverage           m_ma_agent_req_cov;   
  scoreboard         m_scoreboard;
  printer            m_printer; 
  
  // configuration object
  ma_env_config      m_cfg;
  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new(string name = "ma_env", 
               uvm_component parent = null);
    super.new(name, parent);      
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //-------------------------------------------------------------------- 
  virtual function void build_phase(uvm_phase phase);
    
    if(!uvm_config_db #(ma_env_config)::get(this, "", "ma_env_config", m_cfg)) begin
      `uvm_error("build_phase", "ma_env_config configuration object not found")
    end
    
    // Agent ma_agent_req
    if(m_cfg.has_agent_ma_agent_req) begin
      uvm_config_db #(ma_agent_req_config)::set(this, "m_ma_agent_req*", "ma_agent_req_config", m_cfg.m_ma_agent_req_cfg);
      m_ma_agent_req = ma_agent_req::type_id::create("m_ma_agent_req", this);
    end
    // Agent ma_agent_rsp
    if(m_cfg.has_agent_ma_agent_rsp) begin
      uvm_config_db #(ma_agent_rsp_config)::set(this, "m_ma_agent_rsp*", "ma_agent_rsp_config", m_cfg.m_ma_agent_rsp_cfg);
      m_ma_agent_rsp = ma_agent_rsp::type_id::create("m_ma_agent_rsp", this);
    end
    // Scoreboard scoreboard
    if(m_cfg.has_scoreboard) begin
      m_scoreboard = scoreboard::type_id::create("m_scoreboard", this);
    end
    // Coverage coverage for ma_agent_req
    if(m_cfg.has_coverage_ma_agent_req) begin
      m_ma_agent_req_cov = coverage::type_id::create("m_ma_agent_req_cov", this);
    end

    m_printer= printer::type_id::create("m_printer", this);

  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //-------------------------------------------------------------------- 
  virtual function void connect_phase(uvm_phase phase);
      
    if(m_cfg.has_scoreboard) begin
      m_ma_agent_req.ap.connect(m_scoreboard.expected_export);
      m_ma_agent_rsp.ap.connect(m_scoreboard.actual_export);
    end
    if(m_cfg.has_coverage_ma_agent_req) begin
      m_ma_agent_req.ap.connect(m_ma_agent_req_cov.analysis_export);
    end

    m_ma_agent_rsp.ap.connect(m_printer.analysis_export);
    
  endfunction: connect_phase


endclass: ma_env

