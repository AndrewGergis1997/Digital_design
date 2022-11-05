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
// Package: ready_valid_pkg
//
// This package is an OVM VIP Package for the ready valid protocol. This
// protocol simply passes a byte of data when both ready and valid are high.
//
// This is not intended to be a realistic protocol. It is simply used as a 
// proxy for a more interesting protocol in the examples.
//
// The implementation does however have sufficient features to make it 
// representative of most OVM VIPs. It has an agent, including sequencer, 
// driver, monitor, and coverage. The agent is configured using a configuration
// object which inherits from ovm_object, and it has a sequence item and a 
// test sequence.
//

package ready_valid_pkg;

import ovm_pkg::*;

`include "ovm_macros.svh"

`include "ready_valid_sequence_item.svh"

`include "ready_valid_config.svh"

`include "ready_valid_monitor.svh"
`include "ready_valid_coverage.svh"

`include "ready_valid_sequencer.svh"
`include "ready_valid_driver.svh"

`include "ready_valid_test_sequence.svh"

`include "ready_valid_agent.svh"

endpackage
