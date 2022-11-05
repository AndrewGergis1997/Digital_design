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
// Class: test
//
// This test class instantiates the test bench, gets the virtual interfaces 
// using ovm_container, configures the test bench, and starts the virtual
// sequence.
//

class test extends ovm_test;
  `ovm_component_utils( test );
  
  // virtual interface typedefs 
  typedef virtual ready_valid_if rv_if_t;

  //
  // Variable: m_comp1
  //
  // This is a hierarchical OVM component that contains a ready valid master
  // agent.
  //
  comp1 m_comp1;

  //
  // Variable: m_comp2
  //
  // This is a hierarchical OVM component that contains a ready valid master
  // agent.
  //
  comp2 m_comp2;

  //
  // Variable: m_virtual_sequencer
  //
  // This is a sequencer which knows about other sequencers in the test bench.
  // Sequences which start child sequences on these other sequencers ( ie, 
  // virtual sequences ) can be started on this sequencer.
  //
  virtual_sequencer m_virtual_sequencer;

  //
  // Variable: top_level_config
  // 
  // This is the top level configuration object for the testbench. It describes 
  // the configuration of the two ready valid agents and which virtual interfaces
  // they are connected to. This configuration object is created and populated
  // in the build method.
  //
  top_level_config m_config;

  // 
  // Function: new
  //
  // The usual OVM constructor
  //
  extern function new( string name , ovm_component parent );

  //
  // Function: build
  //
  // This function creates the two hierarchical OVM components and the virtual
  // sequencer. It also creates the top level config and populates it so that
  // the two agents perform as required in this particular test.
  //
  // It gets the two virtual interfaces out of their respective ovm_containers
  // and assigns them to the correct place in the top level config. This is the
  // only place that ovm_container is used in the testbench.
  //
  extern function void build();

  //
  // Function: do_ready_valid1_config
  //
  // This method configures ready valid master agent 1 so that the parity bit
  // is bit zero and there are no idles between successive transactions. It is
  // called by the build method.
  //
  extern function void do_ready_valid1_config( ready_valid_config c );

  //
  // Function: do_ready_valid2_config
  //
  // This method configures ready valid master agent 2 so that the parity bit
  // is bit seven and there between zero and three idles between successive
  // transactions. It is called by the build method.
  //
  extern function void do_ready_valid2_config( ready_valid_config c );

  //
  // Function: connect
  //
  // This method ensures that the sequencer handles in the virtual sequencer
  // point to the actual non virtual sequencers in the testbench.
  //
  // In effect, it connects the logical view of the test writer to the structural
  // view of the testbench architect.
  //
  extern function void connect();

  //
  // Task: run
  //
  // This task creates and starts the virtual sequence on the virtual sequencer. Since
  // the connect method has ensured that the virtual sequencer knows about the sequencers
  // in the testbench, the non virtual child sequences will be started on the correct
  // sequencers and thus talk to the correct interfaces and through them to the correct
  // connections on the actual DUT.
  //
  extern task run();
endclass

function test::new( string name , ovm_component parent );
  super.new( name , parent );
endfunction

function void test::build();
  m_config = new();

  do_ready_valid1_config( m_config.m_config1 );
  do_ready_valid2_config( m_config.m_config2 );

  m_comp1 = new("comp1" , this );
  m_comp2 = new("comp2" , this );

  m_virtual_sequencer = new("virtual_sequencer" , this );

  m_config.m_config1.m_vif = ovm_container #(rv_if_t)::get_value_from_config( this, READY_VALID_PORT1::PORT_NAME );
  m_config.m_config2.m_vif = ovm_container #(rv_if_t)::get_value_from_config( this, READY_VALID_PORT2::PORT_NAME );

  set_config_object("comp1.*" , s_ready_valid_config_id , m_config.m_config1 , 0 );
  set_config_object("comp2.*" , s_ready_valid_config_id , m_config.m_config2 , 0 );
endfunction

function void test::do_ready_valid1_config( ready_valid_config c );
  c.m_parity_bit = 0;
  c.m_max_master_waits = 0;
endfunction

function void test::do_ready_valid2_config( ready_valid_config c );
  c.m_parity_bit = 7;
  c.m_max_master_waits = 3;
endfunction

function void test::connect();
  // connect virtual sequencer to ready_valid sequencers
  m_virtual_sequencer.ready_valid_port_1 = m_comp1.m_ready_valid_agent.m_sequencer;
  m_virtual_sequencer.ready_valid_port_2 = m_comp2.m_ready_valid_agent.m_sequencer;
endfunction

task test::run();
  top_level_sequence s = top_level_sequence::type_id::create("top level virtual sequence");

  s.start( m_virtual_sequencer );  
endtask
