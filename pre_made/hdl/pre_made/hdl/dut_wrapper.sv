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
// Module: dut_wrapper
//
// This module includes the DUT and its associated protocol modules. The DUT
// consists of a single module which has two ready valid RTL slaves inside
// it.
//
// The protocol modules include the ready interface and are responsible for
// the registration of a virtual interface that points to it.
//
// In this case we have chosen to use the unique names READY_VALID_IF1 and
// READ_VALID_IF2 for the names used to register the virtual interfaces.
//
// While the testbench may change fairly rapidly, or we may have multiple 
// testbenches for the same DUT, this module will not change since it 
// only depends on the pin level interfaces presented by this DUT.
//
module dut_wrapper();
  import dut_params_pkg::*;

  reg clk;
  reg [7:0] data1 , data2;
  reg master_valid1 , master_valid2;
  reg slave_ready1 , slave_ready2;


  // Protocol Modules
  ready_valid_master_module #( READY_VALID_PORT1::PORT_NAME ) rv_master1 (clk, data1, master_valid1, slave_ready1);
  ready_valid_master_module #( READY_VALID_PORT2::PORT_NAME ) rv_master2 (clk, data2, master_valid2, slave_ready2);

  // The DUT
  rtl # ( READY_VALID_PORT1::MAX_SLAVE_NOT_READY ,
          READY_VALID_PORT2::MAX_SLAVE_NOT_READY ) rtl_inst (
    clk, data1 , data2, master_valid1 , master_valid2, slave_ready1 , slave_ready2
  );

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

endmodule
