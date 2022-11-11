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


typedef enum bit[1:0] {
  READY_VALID_MASTER_IDLE ,
  READY_VALID_MASTER_TRANSMIT ,
  READY_VALID_MASTER_WAIT_FOR_READY
} ready_valid_master_state;

//
// Module: ready_valid_master
//
// This RTL module pumps in a stream of data across the ready/valid bus.
//
// The parameters READY_VALID_MAX_MASTER_IDLE and READY_VALID_MIN_MASTER_IDLE
// define the limits of the random number of idle cycles between the end of 
// a valid transaction and the next active ready signal.
//
// The data starts off at the value f and counts down.
//
module ready_valid_master( input clk ,
                           output bit [7:0] data ,
                           output bit master_valid ,
                           input bit slave_ready );

  parameter int READY_VALID_MAX_MASTER_IDLE = 0;
  parameter int READY_VALID_MIN_MASTER_IDLE = 0;

  ready_valid_master_state state;
  int master_idles , next_master_idles;
  bit [7:0] next_data;

  initial begin
    state = next_state_after_ready();
    next_data = 'hf;
  end

  always @( posedge clk ) begin
    case( state )
    READY_VALID_MASTER_IDLE: begin
       assert( master_idles != 0 );
       $display("%m %t master idle" , $time() ,);

       master_valid <= 1'b0;
       master_idles <= master_idles - 1;
       if( master_idles == 1 ) begin
         state <= READY_VALID_MASTER_TRANSMIT;
       end
    end

    READY_VALID_MASTER_TRANSMIT: begin
      master_valid <= 1'b1;
      data <= next_data;

      next_data <= next_data - 1;

      $display("%m %t transmitting %p" , $time() , next_data );

      if( slave_ready == 1'b0 ) begin
        state <= READY_VALID_MASTER_WAIT_FOR_READY;
      end
      else begin
        state = next_state_after_ready();
      end
    end

    READY_VALID_MASTER_WAIT_FOR_READY: begin
      $display("%m %t waiting for slave ready" , $time() );

      assert( master_valid == 1'b1 );

      if( slave_ready == 1'b1 ) begin
        $display("%m %t seen slave ready" , $time() );
        state <= next_state_after_ready();
      end
    end 
    endcase
  end

  function int calculate_master_idles();
    calculate_master_idles = $urandom_range( READY_VALID_MAX_MASTER_IDLE ,  READY_VALID_MIN_MASTER_IDLE );
    $display("%m %t new master idles %p" , $time() , calculate_master_idles );
  endfunction

  function ready_valid_master_state next_state_after_ready();
    master_idles = calculate_master_idles();

    if( master_idles == 0 ) begin
      next_state_after_ready = READY_VALID_MASTER_TRANSMIT;
    end
    else begin
      next_state_after_ready = READY_VALID_MASTER_IDLE;
    end

  endfunction

endmodule
