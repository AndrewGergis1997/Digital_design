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

localparam string s_virtual_sequencer_type_error = "incorrect virtual sequencer type";

//
// Class: virtual_sequence_base
//
// This abstract class hides the mechanics of getting the virtual sequencer and
// extracting the virtual sequencers from it.
//
// It is expected that subtypes call super.body() first thing in their own body 
// methods.
//

virtual class virtual_sequence_base extends ovm_sequence #( ovm_sequence_item );
  //
  // Variable: ready_valid_port_1
  //
  // This is the ready_valid_sequence from comp1. It has a name meaningful to the test
  // writer, who understand the DUT but not necessarily the structure of the testbench.
  //
  // In this case, the best we can do is ready_valid_port_1, but in a real DUT it  
  // would have a more meaningful name, probably taken from the spec.
  //
  // The value of this handle is extracted from the virtual sequence on which a subclass
  // of this virtual sequence is running. 
  //
  ready_valid_sequencer ready_valid_port_1;
  //
  // Variable: ready_valid_port_2
  //
  // This is the ready_valid_sequence from comp2. It has a name meaningful to the test
  // writer, who understand the DUT but not necessarily the structure of the testbench.
  //
  // In this case, the best we can do is ready_valid_port_1, but in a real DUT it  
  // would have a more meaningful name, probably taken from the spec.
  //
  // The value of this handle is extracted from the virtual sequence on which a subclass
  // of this virtual sequence is running. 
  //
  ready_valid_sequencer ready_valid_port_2;

  //
  // Function: new
  //
  // The usual OVM constructor
  //
  extern function new( string name = "" );

  //
  // Task: body
  // 
  // This method extracts the value of ready_valid_port_1 and ready_valid_port_2 from the
  // virtual sequencer on which a subclass of this virtual sequence is running
  //
  extern task body();

endclass

function virtual_sequence_base::new( string name = "" );
  super.new( name );
endfunction

task virtual_sequence_base::body();
  virtual_sequencer v_sqr;  // the virtual sequence this sequencer is running on

  // 
  // get the virtual sequencer from m_sequencer. Report an error if this fails.
  //
  if( !$cast (v_sqr, m_sequencer) ) begin
    `ovm_error( s_virtual_sequencer_type_error ,
                "sequence type top_level_sequence can only run on a virtual sequencer of type virtual_sequencer")
    return;
  end
  
  //
  // Copy over the handles from the sequencer to make life easy for the test writer.
  //
  ready_valid_port_1 = v_sqr.ready_valid_port_1;
  ready_valid_port_2 = v_sqr.ready_valid_port_2;
endtask