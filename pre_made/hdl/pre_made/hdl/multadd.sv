//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Module          : multadd_uvm
// File            : multadd.sv
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/24
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//    The multadd is a two stage pipeline. 
//    It accepts four 8 bit numbers (a-d) and returns one 17 bit number 
//    (prodsum) after two clock cycles.
//    A signal called "pipeline" tells the multadd when data is available 
//    on the four input ports. The output port "prodout" tells the 
//    downstream blocks when the data is ready.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// multadd
//---------------------------------------------------------------------- 
module multadd (
  input  bit          clk,
  input  bit          rst,
  input  logic [7:0]  a,
  input  logic [7:0]  b,
  input  logic [7:0]  c,
  input  logic [7:0]  d,
  input  logic        pipeline,
  output logic [16:0] prodsum,
  output logic        prodout);
   
  logic [15:0] prodab, prodcd;
  logic        pipeline2prod, pipetemp;
   
  always @(posedge clk) begin
    if (rst) begin
      prodsum <= 0;
      prodab <= 0;
      prodcd <= 0;
      pipeline2prod <= 0;
      prodout <= 0;
    end  
    else begin
      pipetemp <= pipeline;
      pipeline2prod <= pipetemp;
      prodout <= pipeline2prod;
      if (pipeline) begin
        prodab <= a * b;
        prodcd <= c * d;
      end
      if (pipeline2prod)
        prodsum<= prodab + prodcd;
      end // else: !if(rst)
  end // always @ (posedge clock)
endmodule: multadd


