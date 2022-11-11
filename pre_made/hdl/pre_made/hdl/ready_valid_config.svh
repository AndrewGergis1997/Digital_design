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

localparam string s_ready_valid_config_id = "ready_valid_config";
localparam string s_no_config_error_id = "no config error";
localparam string s_config_type_error = "config type error";

class ready_valid_config extends ovm_object;
  `ovm_object_utils( ready_valid_config );

  ovm_active_passive_enum m_active_passive = OVM_ACTIVE;

  virtual ready_valid_if m_vif;
  bit m_has_coverage = 1;
  bit m_per_instance = 1;
  int m_parity_bit = 0;

  int m_max_master_waits = 0;
  int m_min_master_waits = 0;

  function new( string name = "" );
    super.new( name );
  endfunction

  virtual function int get_master_waits();
    return $urandom_range( m_max_master_waits , m_min_master_waits );
  endfunction

  task wait_for_clock( int n = 1 );
    repeat( n ) @( posedge m_vif.clk );
  endtask

  static function ready_valid_config get_config( ovm_component c );
    ovm_object o;
    ready_valid_config t;

    if( !c.get_config_object( s_ready_valid_config_id , o , 0 ) ) begin
      c.ovm_report_error( s_no_config_error_id ,
                          $psprintf("this component has no config associated with id %s" ,
                                     s_ready_valid_config_id ) );
      return null;
    end

    if( !$cast( t , o ) ) begin 
      c.ovm_report_error( s_config_type_error ,
                          $psprintf("the object associated with id %s is of type $s which is not the required type %s" ,
                                     s_ready_valid_config_id , o.get_type_name() , type_name ) );
      return null;
    end
    return t;
  endfunction
endclass
