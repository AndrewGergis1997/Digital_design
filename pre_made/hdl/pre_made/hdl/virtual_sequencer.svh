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
// Class: virtual_sequencer
//
// This class points to the two ready valid sequencers in this testbench.
//
// These handles are then used by the virtual sequence to direct its child
// sequences to the correct place.
//
class virtual_sequencer extends ovm_virtual_sequencer;
  // 
  // Variable: ready_valid_port_1
  //
  // This is a handle that points to the ready valid sequencer in comp1. It is
  // called ready_valid_port_1 because this is the logical name that makes 
  // most sense to the test writer. In a real DUT we would use a more meaningful
  // name, probably derived from the spec.
  //
  // This value is assigned the correct sequencer during the connect phase. In
  // effect, we are connecting the logical view of the test writer to the 
  // structural view of the testbench architect.
  //
  ready_valid_sequencer ready_valid_port_1;

  // 
  // Variable: ready_valid_port_2
  //
  // This is a handle that points to the ready valid sequencer in comp2. It is
  // called ready_valid_port_2 because this is the logical name that makes 
  // most sense to the test writer. In a real DUT we would use a more meaningful
  // name, probably derived from the spec.
  //
  // This value is assigned the correct sequencer during the connect phase. In
  // effect, we are connecting the logical view of the test writer to the 
  // structural view of the testbench architect.
  //
  ready_valid_sequencer ready_valid_port_2;
  
  function new( string name , ovm_component parent );
    super.new( name , parent );
  endfunction
endclass

