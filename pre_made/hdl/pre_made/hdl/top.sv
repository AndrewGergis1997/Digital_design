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
// Module: top
//
// This is the top level module. Since the testbench is defined in the test_pkg
// and the dut_wrapper deals with all the clock, reset, and connectivity
// issues, this is all that is required.
//
// Communication between test and dut_wrapper is done using ovm_container.
//
// NB: the simulation now has two top level modules, so it needs something like
// vsim -c top dut_wrapper to run it successfully.
//
module top();
  import ovm_pkg::*;
  import test_pkg::*;

  initial 
    run_test("test");
 
endmodule
