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

localparam s_debug_coverage_id = "debugging coverage";

class ready_valid_coverage extends ovm_subscriber #( ready_valid_sequence_item );
  `ovm_component_utils( ready_valid_coverage );

  protected bit parity;

  ready_valid_config m_config;

  covergroup C( bit per_instance , string instance_name );
    option.per_instance = per_instance;
    option.name = instance_name;

    coverpoint parity;
  endgroup

  function new( string name , ovm_component parent );
    super.new( name , parent );

    m_config = ready_valid_config::get_config( this );

    C = new( m_config.m_per_instance , (m_config.m_per_instance ? get_full_name() : "" ) );
  endfunction


  function void write( ready_valid_sequence_item t );
    `ovm_info( s_debug_coverage_id , t.sprint() , OVM_LOW );

    `ovm_info( s_debug_coverage_id ,
               $psprintf("doing coverage on parity bit %0d" , m_config.m_parity_bit ) ,
               OVM_LOW );

    parity = t.m_data[m_config.m_parity_bit];
    C.sample();
  endfunction
endclass
