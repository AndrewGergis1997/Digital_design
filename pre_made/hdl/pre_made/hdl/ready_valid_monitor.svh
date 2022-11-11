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

localparam string s_seen_ready_valid_transaction_id = "seen ready valid transaction";
localparam string s_no_vif = "no virtual interface";

class ready_valid_monitor extends ovm_component;
  `ovm_component_utils( ready_valid_monitor );

  ovm_analysis_port #( ready_valid_sequence_item ) ap;

  ready_valid_config m_config;
  virtual ready_valid_if m_vif;

  function new( string name , ovm_component parent = null );
    super.new( name , parent );
  endfunction

  function void build();
    ap = new("ap" , this );
    m_config = ready_valid_config::get_config( this );
    m_vif = m_config.m_vif;

    if( m_vif == null ) ovm_report_error( s_no_vif , "no vif in config" );
  endfunction

  task run();
    ready_valid_sequence_item t;
    
    forever begin
      @( posedge m_vif.clk ) begin
        if( m_vif.master_valid && m_vif.slave_ready ) begin
          t = ready_valid_sequence_item::type_id::create();
          `ovm_info( s_seen_ready_valid_transaction_id , t.sprint() , OVM_LOW );
          ap.write( t );
        end
      end
    end
  endtask
endclass
