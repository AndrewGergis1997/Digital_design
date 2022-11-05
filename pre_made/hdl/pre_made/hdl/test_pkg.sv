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
// Package: test_pkg
//
// This package contains everything needed to do the test. It contains all
// the structural hierarchy, all the config and all the behavioural code
// such as virtual sequences.
//
// It communicates with the top level package by getting vifs using 
// ovm_container. The names used to do this are specific to the design in 
// question, so this package cannot be used with top level modules other 
// than the one in this directory.
//

package test_pkg;

`include "ovm_macros.svh"

import ovm_pkg::*;
import ready_valid_pkg::*;
import top_level_config_pkg::*;
import ovm_container_pkg::*;

import dut_params_pkg::*;

`include "comp1.svh"
`include "comp2.svh"
`include "virtual_sequencer.svh"
`include "virtual_sequence_base.svh"
`include "top_level_sequence.svh"
`include "test.svh"

endpackage
