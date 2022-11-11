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
// Interface: ready_valid_if
//
// This interface represents the ready_valid signal level interface. At every
// +ve edge of the clock, if both master_valid and slave_ready are high, then the
// data is valid and a transaction has occurred.
//

interface ready_valid_if( input wire iclk );
  logic clk;
  logic [7:0] data;
  logic master_valid , slave_ready;

  assign clk = iclk;

  always @( master_valid ) begin
    $display("%m %t master_valid is now %p" , $time() , master_valid );
  end

  always @( slave_ready ) begin
    $display("%m %t slave_ready is now %p" , $time() , slave_ready );
  end

  always @( posedge clk ) begin
    if( master_valid && slave_ready ) begin
      $display("%m %t : saw transfer %p" , $time() , data );
    end
  end

endinterface
