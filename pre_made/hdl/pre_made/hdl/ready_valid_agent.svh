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

class ready_valid_agent extends ovm_component;
  `ovm_component_utils( ready_valid_agent );

  ovm_analysis_port #( ready_valid_sequence_item ) ap;

  ready_valid_config m_config;

  ready_valid_monitor m_monitor;
  ready_valid_coverage m_coverage;

  ready_valid_sequencer m_sequencer;
  ready_valid_driver m_driver;

  function new( string name , ovm_component parent = null );
    super.new( name , parent );
  endfunction

  function void build();
    m_config = ready_valid_config::get_config( this );

    ap = new("ap" , this );
    m_monitor = ready_valid_monitor::type_id::create("monitor" , this );

    if( m_config.m_has_coverage ) begin
      m_coverage = ready_valid_coverage::type_id::create("coverage" , this );
      `ovm_info( s_debug_coverage_id , "creating coverage class" , OVM_LOW );
    end

    if( m_config.m_active_passive == OVM_ACTIVE ) begin
      m_driver = ready_valid_driver::type_id::create("driver" , this );
      m_sequencer = ready_valid_sequencer::type_id::create("sequencer" , this );
    end
  endfunction

  function void connect();
    m_monitor.ap.connect( ap );

    if( m_config.m_has_coverage ) begin
      m_monitor.ap.connect( m_coverage.analysis_export );
      `ovm_info( s_debug_coverage_id , "creating coverage class" , OVM_LOW );
    end

    if( m_config.m_active_passive == OVM_ACTIVE ) begin
      m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
      m_driver.rsp_port.connect(m_sequencer.rsp_export);
    end
  endfunction

endclass
