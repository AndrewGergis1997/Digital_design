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

localparam string s_ready_valid_driver_debug_id = "ready valid debug";

class ready_valid_driver extends ovm_driver #( ready_valid_sequence_item );
  `ovm_component_utils( ready_valid_driver );

  ready_valid_config m_config;
  virtual ready_valid_if m_vif;

  function new( string name , ovm_component parent );
    super.new( name , parent );
  endfunction

  function void build();
    m_config = ready_valid_config::get_config( this );
    m_vif = m_config.m_vif;
  endfunction

  task run();

    forever begin
      m_config.wait_for_clock();

      master_waits();
      get_next_item( req );
 
      m_vif.master_valid = 1'b1;
      m_vif.data = req.m_data;
     
      wait_for_slave_ready();
      seq_item_port.item_done();
    end
  endtask

  task master_waits();
      int master_waits = m_config.get_master_waits();
   
      `ovm_info( s_ready_valid_driver_debug_id , $psprintf("master waits : %0d" , master_waits ) , OVM_LOW );

      if( master_waits != 0 ) begin
        // master enters voluntary wait before next req
        m_vif.master_valid = 1'b0;
        m_config.wait_for_clock( master_waits );
      end
  endtask

  task get_next_item( output ready_valid_sequence_item t );
    seq_item_port.try_next_item( t );
    if( t == null ) begin
      // if we can't get an item, master enters enforced wait
      `ovm_info( s_ready_valid_driver_debug_id , $psprintf("waiting for next item" ) , OVM_LOW );

      m_vif.master_valid = 1'b0;
      seq_item_port.get_next_item( t );
    end
    `ovm_info( s_ready_valid_driver_debug_id , $psprintf("got next item %s" , t.sprint() ), OVM_LOW );
  endtask

  task wait_for_slave_ready();
    int i;

    for( i = 0; !m_vif.slave_ready; i++ ) begin
      assert( m_vif.master_valid );
      // sample slave_ready on posedge - avoids glitches
     `ovm_info( s_ready_valid_driver_debug_id , $psprintf("waiting for slave ready" ) , OVM_LOW );
      @( posedge m_vif.clk );
    end
    assert( m_vif.master_valid );
    `ovm_info( s_ready_valid_driver_debug_id , $psprintf("slave is ready after %0d waits" , i ) , OVM_LOW );
  endtask

endclass

