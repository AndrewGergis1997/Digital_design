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

class ready_valid_test_sequence extends ovm_sequence #( ready_valid_sequence_item );
  `ovm_object_utils( ready_valid_test_sequence );

  function new( string name = "" ); 
    super.new( name );
  endfunction

  task body();
    ready_valid_sequence_item t;

    for( int i = 0; i < 3; i++ ) begin
      t = ready_valid_sequence_item::type_id::create();
      start_item( t );
      t.m_data = i;
      finish_item( t );    
    end
  endtask

endclass
