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

typedef enum bit {
  READY_VALID_SLAVE_READY ,
  READY_VALID_SLAVE_NOT_READY
} ready_valid_slave_state;

//
// Module: ready_valid_slave
//
// This RTL module accepts a stream of data coming in across a ready valid
// bus.
// 
// Instantiations of this module are used in the DUT in all examples.
//
// The parameters READY_VALID_MAX_SLAVE_READY and READY_VALID_MIN_SLAVE_READY
// define the limits of the random number of ready states between the master
// issuing a valid signal and the slave issuing its ready signal.
//

module ready_valid_slave( input clk ,
                          input bit [7:0] data ,
                          input bit master_valid ,
                          output bit slave_ready );

  parameter int READY_VALID_MAX_SLAVE_READY = 3;
  parameter int READY_VALID_MIN_SLAVE_READY = 1;

  parameter int READY_VALID_MAX_SLAVE_NOT_READY = 0;
  parameter int READY_VALID_MIN_SLAVE_NOT_READY = 0;

  int slave_ready_count , slave_not_ready_count;
  ready_valid_slave_state state;

  initial begin
    slave_not_ready_count = calculate_slave_not_ready();
    if( slave_not_ready_count != 0 ) begin
      state <= READY_VALID_SLAVE_NOT_READY;
    end
    else begin
      slave_ready_count = calculate_slave_ready();
      state <= READY_VALID_SLAVE_READY;
    end
  end

  always @( posedge clk ) begin
    case( state )
    READY_VALID_SLAVE_READY: begin
      slave_ready <= 1'b1;

      slave_ready_count <= slave_ready_count - 1;

      if( slave_ready_count == 1 ) begin
        slave_not_ready_count = calculate_slave_not_ready();
        if( slave_not_ready_count != 0 ) begin
          state <= READY_VALID_SLAVE_NOT_READY;
        end
        else begin
          slave_ready_count = calculate_slave_ready();
        end
      end
      
    end

    READY_VALID_SLAVE_NOT_READY: begin
      slave_ready <= 1'b0;

      slave_not_ready_count <= slave_not_ready_count - 1;
 
      if( slave_not_ready_count == 1 ) begin
        slave_ready_count = calculate_slave_ready();
        state <= READY_VALID_SLAVE_READY;
      end

    end

    endcase
  end

  always @( posedge clk ) begin
    if( master_valid && slave_ready ) begin
      $display("%m %t slave accepted %p" , $time() , data );
    end
  end

  function int calculate_slave_ready();
    calculate_slave_ready = $urandom_range( READY_VALID_MAX_SLAVE_READY ,  READY_VALID_MIN_SLAVE_READY );
    if( calculate_slave_ready == 0 ) calculate_slave_ready = 1;

    $display("%m %t new slave ready value %p" , $time() , calculate_slave_ready );
  endfunction

  function int calculate_slave_not_ready();
    calculate_slave_not_ready = $urandom_range( READY_VALID_MAX_SLAVE_NOT_READY ,  READY_VALID_MIN_SLAVE_NOT_READY ); 
    $display("%m %t new slave not ready value %p" , $time() , calculate_slave_not_ready );
  endfunction

endmodule
