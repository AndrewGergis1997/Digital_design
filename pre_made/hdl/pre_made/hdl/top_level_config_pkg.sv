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

package top_level_config_pkg;

localparam string s_tb_top_level_config_id = "tb_top_level_config";
localparam string s_no_config_error_id = "no config error";
localparam string s_config_type_error = "config type error";

`include "ovm_macros.svh"

import ovm_pkg::*;
import ready_valid_pkg::*;

`include "top_level_config.svh"

endpackage
