//------------------------------------------------------------------------------
//   Copyright 2010 Mentor Graphics Corporation
//
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//------------------------------------------------------------------------------

//
// Module: ready_valid_msater_module
//
// This module: 
// 1. Exposes the pins of a ready_valid master
// 2. Instantiates a ready_valid interface
// 3. Does the appropriate assigns from ports to interface signals
// 4. Registers the interface in the global config space using ovm_container
//
// The only parameter that this module has is an INTERFACE_NAME parameter. If
// this is not set explicitly then the path name of the master module ( ie %m )
// is used to register the interface. This is by definition unique. If it is
// set some explicit string value, then this name is used to register the
// interface. It then becomes the users responsibility to ensure that all such
// names are unique within the system.
//
// Various other auto-registration schemes have been suggested for virtual 
// interfaces. This one has a couple of advantages, although none is perfect:
// (i) assertions in addition to those which may already be in the interface
// can be added inside this module. The QVL instantiation below is an example
// of this. 
// (ii) mechanisms other than ovm_container can be used inside these modules
// if more sophisticated mechanisms are developed later.
// (iii) This offers a certain degree of protection from changes in the 
// interface itself.
//
// NB: no configuration of the interface itself is done inside this module. Any
// confguration of the interface should be done by the ovm_test.
//

module ready_valid_master_module (clk, data, master_valid, slave_ready);
  // import the ovm_container_pkg
  import ovm_container_pkg::*;
  
  // The name used to register the virtual interface
  parameter string INTERFACE_NAME = "";

  typedef virtual ready_valid_if rv_if_t;

  // The signals from the point of view of the master
  input clk;
  output [7:0] data;
  output master_valid;
  input slave_ready;
  
  // regs needed for ready valid

  reg [7:0] idata;
  reg imaster_valid;
  reg islave_ready;

  // interfaces

  ready_valid_if m_if( clk );

  // assignments for ready / valid

  assign data = m_if.data;
  assign master_valid = m_if.master_valid;
  assign m_if.slave_ready = slave_ready;

  //
  // By default, use %m. If an explicit name is provided, it is the users responsibility to 
  // ensure that this name is unique. An explicit name can be very useful when for example 
  // this module has been placed deep in the design hierarchy. In that case an explicit name
  // can be more meaningful and easier to manage.
  // 
  string interface_name = (INTERFACE_NAME == "")? $psprintf("%m") : INTERFACE_NAME;

  //
  // register the interface
  //
  // Doing it in the initial block as shown below does not lead to any race conditions.
  //
  // The reason is that this "set" happens in the first delta cycle but the get only 
  // occurs in the build phase. The build phase only happens in the second delta cycle
  // at time zero so there is no race.
  //
  initial
      ovm_container #(rv_if_t)::set_value_in_global_config(interface_name , m_if );

endmodule
