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
// Class: top_level_config
//
// This class models the configuration for the entire testbench. In this case
// it only needs to model the two ready valid agents.
//

class top_level_config extends ovm_object;
  `ovm_object_utils( top_level_config );

  //
  // Variable: m_config1
  //
  // This is the configuration for ready valid agent #1
  //
  ready_valid_config m_config1;

  //
  // Variable: m_config2
  //
  // This is the configuration for ready valid agent #2
  //
  ready_valid_config m_config2;

  //
  // Function: new
  //
  // The usual OVM constructor
  //
  extern function new( string name = "" );

  //
  // Function: get_config
  //
  // This important static method hides the dynamic casting implicit in 
  // the OVM config mechanism. It also prints out useful messages when
  // either there is no ovm_object associated with this id and this 
  // component, or there is an ovm_object but it is not of the correct
  // type.
  //
  extern static function top_level_config get_config( ovm_component c );
endclass

function top_level_config::new( string name = "" );
  super.new( name );

  m_config1 = new();
  m_config2 = new();
endfunction

function top_level_config top_level_config::get_config( ovm_component c );
  ovm_object o;
  top_level_config t;

  if( !c.get_config_object( s_tb_top_level_config_id , o , 0 ) ) begin
    c.ovm_report_error( s_no_config_error_id ,
                        $psprintf("this component has no config associated with id %s" ,
                                   s_tb_top_level_config_id ) );
    return null;
  end

  if( !$cast( t , o ) ) begin
   c.ovm_report_error( s_config_type_error ,
                        $psprintf("the object associated with id %s is of type $s which is not the required type %s" ,
                                   s_tb_top_level_config_id , o.get_type_name() , type_name ) );
    return null;
  end

  return t;
endfunction
