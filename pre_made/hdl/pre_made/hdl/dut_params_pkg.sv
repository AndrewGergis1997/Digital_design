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
// Package: dut_params_pkg
//
// This package includes all the parameters used by the dut and all those
// parameters shared between dut, dut_wrapper, and testbench
//
// In this implementation, we use the "parameterized class" technique for
// describing these since it is more scalable.
//
package dut_params_pkg;

//
// A generic ready_valid parameter list
//
class READY_VALID_PORT #( int MAX_SLAVE_NOT_READY = 0 ,
                          string PORT_NAME = "" );
endclass

//
// A typedef containing the specific parameters required for ready valid port 1
//
// To access these parameters, use the :: syntax
// eg READY_VALID_PORT1::MAX_SLAVE_NOT_READY
//
typedef READY_VALID_PORT #( 0 , "READY_VALID_PORT_1" ) READY_VALID_PORT1;

//
// A typedef containing the specific parameters required for ready valid port 1
//
// To access these parameters, use the :: syntax
// eg READY_VALID_PORT1::MAX_SLAVE_NOT_READY
//
typedef READY_VALID_PORT #( 3 , "READY_VALID_PORT_2" ) READY_VALID_PORT2;

endpackage
