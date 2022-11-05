//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_env_config
// File            : ma_env_config.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Configures the environment.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_env_config
//----------------------------------------------------------------------
class ma_env_config extends uvm_object;

  // factory registration macro
  `uvm_object_utils(ma_env_config)

  // internal components
  ma_agent_req_config   m_ma_agent_req_cfg; 
  ma_agent_rsp_config   m_ma_agent_rsp_cfg; 

  // variables
  bit has_agent_ma_agent_req = 1;
  bit has_agent_ma_agent_rsp = 1;
  bit has_scoreboard = 1;
  bit has_coverage_ma_agent_req = 1;
  bit has_coverage_ma_agent_rsp = 1;
  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new(string name = "ma_env_config"); 
    super.new(name);      
  endfunction: new

   
endclass: ma_env_config

