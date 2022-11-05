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
// Class: comp2
//
// This class simply contains a single ready valid agent. As it stands, it
// is pretty unrealistic. The idea is that it represents some arbitrary OVM
// hierarchy in a more complicated testbench.
//
class comp2 extends ovm_component;
  `ovm_component_utils( comp2 );

  ready_valid_agent m_ready_valid_agent;

  extern function new( string name , ovm_component parent );
  extern function void build();
endclass

function comp2::new( string name , ovm_component parent );
  super.new( name , parent );
endfunction

function void comp2::build();
  m_ready_valid_agent = new("ready_valid_agent" , this );
endfunction
