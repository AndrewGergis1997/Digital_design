//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : ma_agent_req_config
// File            : ma_agent_req_config.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Configures the agent to be ACTIVE and specifies the virtual interface.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// ma_agent_req_config
//----------------------------------------------------------------------
class ma_agent_req_config extends uvm_object;
  
  // factory registration macro
  `uvm_object_utils(ma_agent_req_config)

  // agent configuration
  uvm_active_passive_enum is_active = UVM_ACTIVE;   

  // virtual interface handle:
  virtual multadd_if  vif_req;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new(string name = "ma_agent_req_config");
    super.new(name);
  endfunction: new


endclass: ma_agent_req_config

