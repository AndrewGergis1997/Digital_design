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

module rtl ( clk, data1 , data2, master_valid1 , master_valid2, 
             slave_ready1 , slave_ready2);

  parameter RV_MAX_SVL_NOT_READY_1 = 0;
  parameter RV_MAX_SVL_NOT_READY_2 = 0;
  
  input clk;
  input [7:0] data1 , data2;
  input master_valid1 , master_valid2;
  output slave_ready1 , slave_ready2;

  ready_valid_slave #( RV_MAX_SVL_NOT_READY_1 ) slave1( clk , data1 , master_valid1 , slave_ready1 );
  ready_valid_slave #( RV_MAX_SVL_NOT_READY_2 ) slave2( clk , data2 , master_valid2 , slave_ready2 );


endmodule
