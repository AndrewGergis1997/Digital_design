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
// Class: top_level_sequence
//
// This virtual sequence creates a sequence for each of the two ready
// valid agents and starts them on the sequencers provided by the virtual
// sequencer. It does this in parallel with a timeout that triggers after
// 5000 timeunits
//

class top_level_sequence extends virtual_sequence_base;
  `ovm_object_utils( top_level_sequence );
  
  //
  // Function: new
  //
  // The usual OVM constructor
  //
  extern function new( string name = "" );

  //
  // Task: body
  // 
  // This is the method which forks the three processes ( the two active
  // ready valid sequences and the timeout process ).
  //
  // It calls super.body() to import the sequencer handles from the virtual sequence.
  //
  extern task body();

  //
  // Task: timeout
  //
  // A process that ends after 5000 timeunits.
  //
  extern task timeout();
endclass

function top_level_sequence::new( string name = "" );
  super.new( name );
endfunction

task top_level_sequence::body();
  ready_valid_test_sequence s1 , s2; // the two ready valid sequences

  super.body();

  //
  // Create the two ready valid sequences
  //
  s1 = ready_valid_test_sequence::type_id::create("s1");
  s2 = ready_valid_test_sequence::type_id::create("s2");

  //
  // Start the two sequences in parallel with a timeout task
  //	
  fork
    s1.start( ready_valid_port_1 );
    s2.start( ready_valid_port_2 );
    timeout();
  join
endtask

task top_level_sequence::timeout();
  #5000 global_stop_request();
endtask
